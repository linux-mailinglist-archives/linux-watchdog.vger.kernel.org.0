Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C02368B81
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 05:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240012AbhDWDVH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 23:21:07 -0400
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:51102 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240232AbhDWDVH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 23:21:07 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 95F595405A9;
        Fri, 23 Apr 2021 11:20:27 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V7,RESEND 1/2] watchdog: mtk: support pre-timeout when the bark irq is available
Date:   Fri, 23 Apr 2021 11:20:19 +0800
Message-Id: <1619148020-2236-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619148020-2236-1-git-send-email-wangqing@vivo.com>
References: <1619148020-2236-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQx9ITlYeHUkdGUJOSRlKTRpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzY6DSo5Hz8TDg0eMzAcITUV
        OkhPCTNVSlVKTUpCSk9DS0lDSUxCVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBTU5OTzcG
X-HM-Tid: 0a78fcbe3800d995kuws95f595405a9
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the bark interrupt as the pretimeout notifier if available.

When the watchdog timer expires in dual mode, an interrupt will be
triggered first, then the timing restarts. The reset signal will be
initiated when the timer expires again.

The pretimeout notification shall occur at timeout-sec/2.

V2:
- panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.

V3:
- Modify the pretimeout behavior, manually reset after the pretimeout
- is processed and wait until timeout.

V4:
- Remove pretimeout related processing. 
- Add dual mode control separately.

V5:
- Fix some formatting and printing problems.

V6:
- Realize pretimeout processing through dualmode.

V7:
- Add set_pretimeout().

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993..ab3ac5d
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,6 +25,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
+#include <linux/interrupt.h>
 
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		1
@@ -184,15 +185,23 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	unsigned int timeout_interval = timeout;
 	u32 reg;
 
 	wdt_dev->timeout = timeout;
-
+	/*
+	 * In dual mode, irq will be triggered at timeout / 2
+	 * the real timeout occurs at timeout
+	 */
+	if (wdt_dev->pretimeout) {
+		wdt_dev->pretimeout = timeout / 2;
+		timeout_interval = wdt_dev->pretimeout;
+	}
 	/*
 	 * One bit is the value of 512 ticks
 	 * The clock has 32 KHz
 	 */
-	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
+	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
 	iowrite32(reg, wdt_base + WDT_LENGTH);
 
 	mtk_wdt_ping(wdt_dev);
@@ -239,13 +248,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		return ret;
 
 	reg = ioread32(wdt_base + WDT_MODE);
-	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	if (wdt_dev->pretimeout)
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
+	else
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
 
 	return 0;
 }
 
+static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
+					unsigned int timeout)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
+	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	u32 reg = ioread32(wdt_base + WDT_MODE);
+
+	if (timeout && !wdd->pretimeout) {
+		wdd->pretimeout = wdd->timeout / 2;
+		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN | WDT_MODE_KEY);
+	} else if (!timeout && wdd->pretimeout) {
+		wdd->pretimeout = 0;
+		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN | WDT_MODE_KEY);
+	} else
+		return 0;
+
+	iowrite32(reg, wdt_base + WDT_MODE);
+
+	return mtk_wdt_set_timeout(wdd, wdd->timeout);
+}
+
+static irqreturn_t mtk_wdt_isr(int irq, void *arg)
+{
+	struct watchdog_device *wdd = arg;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static const struct watchdog_info mtk_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
 			  WDIOF_MAGICCLOSE,
 };
 
+static const struct watchdog_info mtk_wdt_pt_info = {
+	.identity	= DRV_NAME,
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_PRETIMEOUT |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_MAGICCLOSE,
+};
+
 static const struct watchdog_ops mtk_wdt_ops = {
 	.owner		= THIS_MODULE,
 	.start		= mtk_wdt_start,
 	.stop		= mtk_wdt_stop,
 	.ping		= mtk_wdt_ping,
 	.set_timeout	= mtk_wdt_set_timeout,
+	.set_pretimeout	= mtk_wdt_set_pretimeout,
 	.restart	= mtk_wdt_restart,
 };
 
@@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_wdt_dev *mtk_wdt;
 	const struct mtk_wdt_data *wdt_data;
-	int err;
+	int err, irq;
 
 	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
 	if (!mtk_wdt)
@@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
+					&mtk_wdt->wdt_dev);
+		if (err)
+			return err;
+
+		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
+		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
+	} else {
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
+	}
+
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
 	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
-- 
2.7.4

