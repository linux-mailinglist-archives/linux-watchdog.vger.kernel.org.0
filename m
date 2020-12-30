Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F411E2E76F6
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Dec 2020 09:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL3IQy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 30 Dec 2020 03:16:54 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:41987 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725814AbgL3IQy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 30 Dec 2020 03:16:54 -0500
X-UUID: f020abc8af824630a5afae345e14860e-20201230
X-UUID: f020abc8af824630a5afae345e14860e-20201230
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <freddy.hsin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 271173387; Wed, 30 Dec 2020 16:16:07 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Dec 2020 16:15:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Dec 2020 16:15:59 +0800
From:   Freddy Hsin <freddy.hsin@mediatek.com>
To:     Freddy Hsin <freddy.hsin@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <wsd_upstream@mediatek.com>, <chang-an.chen@mediatek.com>,
        <kuohong.wang@mediatek.com>
Subject: [PATCH v2 1/1] watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem
Date:   Wed, 30 Dec 2020 16:15:57 +0800
Message-ID: <1609316157-3748-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D94B9C579622140CEE92807ED8F0662EE7B3DEE939D9028A2890F17DB13BB2692000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: "freddy.hsin" <freddy.hsin@mediatek.com>

Before user space daemon start to access the watchdog device,
there is a time interval that watchdog is disabled in the
original flow. If the system freezing at this interval, it
cannot be rebooted by watchdog hardware automatically.

In order to solve this problem, the watchdog hardware should be
kept working, and start hrtimer in framework to ping it by
setting max_hw_heartbeat_ms and HW_RUNNING used in
watchdog_need_worker to determine whether the worker should be
started or not. Besides the redundant setting of max_timeout is
also removed.

Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393..0c869b7 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
+static void mtk_wdt_init(struct watchdog_device *wdt_dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base;
+
+	wdt_base = mtk_wdt->wdt_base;
+
+	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
+		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	}
+}
+
 static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
@@ -264,7 +277,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
 	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
-	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
+	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
 	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
 	mtk_wdt->wdt_dev.parent = dev;
 
@@ -274,7 +287,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
 
-	mtk_wdt_stop(&mtk_wdt->wdt_dev);
+	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
-- 
1.7.9.5

