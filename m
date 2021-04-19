Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAC9363CFB
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Apr 2021 09:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhDSHvd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Apr 2021 03:51:33 -0400
Received: from mail-m121145.qiye.163.com ([115.236.121.145]:50682 "EHLO
        mail-m121145.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhDSHvd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Apr 2021 03:51:33 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 5509C8000C5;
        Mon, 19 Apr 2021 15:51:01 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V4] watchdog: mtk: support dual mode when the bark irq is available
Date:   Mon, 19 Apr 2021 15:50:56 +0800
Message-Id: <1618818656-32410-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQkpKTFZLHUJMGU0YQhlNSB9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6ETo6GD8cDhQQKTgBERMq
        MU4KCyFVSlVKTUpDQ0pDTU1JSklNVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFPT0pNNwY+
X-HM-Tid: 0a78e91c7d15b03akuuu5509c8000c5
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Support using irq handling wdt bark first instead of directly resetting.

When the watchdog timer expires in Dual mode, an interrupt will be
triggered first, then the timing restarts. The reset signal will be
initiated when the timer expires, to prevent the system is stuck hard.

The dual mode is disabled by default.

V2:
- panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.

V3:
- Modify the pretimeout behavior, manually reset after the pretimeout
- is processed and wait until timeout.

V4:
- Remove pretimeout related processing. 
- Add dual mode control separately.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..a1f34b5
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -57,6 +58,7 @@
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
+static bool dual_mode;
 
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
@@ -239,13 +241,23 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
-	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (dual_mode)
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	else
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
 
+static irqreturn_t mtk_wdt_isr(int irq, void *arg)
+{
+	panic("wdt bark!\n");
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -267,7 +279,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,6 +291,20 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
+	if (dual_mode) {
+		irq = platform_get_irq(pdev, 0);
+		if (irq > 0) {
+			err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
+									&mtk_wdt->wdt_dev);
+			if (err)
+				return err;
+		} else {
+			dual_mode = 0;
+			dev_err(&pdev->dev,
+			"couldn't get wdt irq, set dual_mode = 0\n");
+		}
+	}
+
 	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -368,6 +394,9 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+module_param(dual_mode, bool, 0);
+MODULE_PARM_DESC(dual_mode, "Watchdog dual mode triggers irq before reset(default=0)");
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matthias Brugger <matthias.bgg@gmail.com>");
 MODULE_DESCRIPTION("Mediatek WatchDog Timer Driver");
-- 
2.7.4

