Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812C3BC251
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Sep 2019 09:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409199AbfIXHIu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 24 Sep 2019 03:08:50 -0400
Received: from inva021.nxp.com ([92.121.34.21]:36128 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409185AbfIXHIu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 24 Sep 2019 03:08:50 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9E5312003B4;
        Tue, 24 Sep 2019 09:08:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B45E2001AD;
        Tue, 24 Sep 2019 09:08:43 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 238E54029F;
        Tue, 24 Sep 2019 15:08:37 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 3/3] watchdog: imx2_wdt: Use 'dev' instead of dereferencing it repeatedly
Date:   Tue, 24 Sep 2019 15:07:08 +0800
Message-Id: <1569308828-8320-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
References: <1569308828-8320-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add helper variable dev = &pdev->dev to simply the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx2_wdt.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 034f32c..f8d58bf 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -246,13 +246,14 @@ static const struct regmap_config imx2_wdt_regmap_config = {
 
 static int __init imx2_wdt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct imx2_wdt_device *wdev;
 	struct watchdog_device *wdog;
 	void __iomem *base;
 	int ret;
 	u32 val;
 
-	wdev = devm_kzalloc(&pdev->dev, sizeof(*wdev), GFP_KERNEL);
+	wdev = devm_kzalloc(dev, sizeof(*wdev), GFP_KERNEL);
 	if (!wdev)
 		return -ENOMEM;
 
@@ -260,16 +261,16 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	wdev->regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
+	wdev->regmap = devm_regmap_init_mmio_clk(dev, NULL, base,
 						 &imx2_wdt_regmap_config);
 	if (IS_ERR(wdev->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(wdev->regmap);
 	}
 
-	wdev->clk = devm_clk_get(&pdev->dev, NULL);
+	wdev->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(wdev->clk)) {
-		dev_err(&pdev->dev, "can't get Watchdog clock\n");
+		dev_err(dev, "can't get Watchdog clock\n");
 		return PTR_ERR(wdev->clk);
 	}
 
@@ -279,12 +280,12 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdog->min_timeout	= 1;
 	wdog->timeout		= IMX2_WDT_DEFAULT_TIME;
 	wdog->max_hw_heartbeat_ms = IMX2_WDT_MAX_TIME * 1000;
-	wdog->parent		= &pdev->dev;
+	wdog->parent		= dev;
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret > 0)
-		if (!devm_request_irq(&pdev->dev, ret, imx2_wdt_isr, 0,
-				      dev_name(&pdev->dev), wdog))
+		if (!devm_request_irq(dev, ret, imx2_wdt_isr, 0,
+				      dev_name(dev), wdog))
 			wdog->info = &imx2_wdt_pretimeout_info;
 
 	ret = clk_prepare_enable(wdev->clk);
@@ -294,13 +295,13 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
 	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
 
-	wdev->ext_reset = of_property_read_bool(pdev->dev.of_node,
+	wdev->ext_reset = of_property_read_bool(dev->of_node,
 						"fsl,ext-reset-output");
 	platform_set_drvdata(pdev, wdog);
 	watchdog_set_drvdata(wdog, wdev);
 	watchdog_set_nowayout(wdog, nowayout);
 	watchdog_set_restart_priority(wdog, 128);
-	watchdog_init_timeout(wdog, timeout, &pdev->dev);
+	watchdog_init_timeout(wdog, timeout, dev);
 
 	if (imx2_wdt_is_running(wdev)) {
 		imx2_wdt_set_timeout(wdog, wdog->timeout);
@@ -318,7 +319,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_clk;
 
-	dev_info(&pdev->dev, "timeout %d sec (nowayout=%d)\n",
+	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
 		 wdog->timeout, nowayout);
 
 	return 0;
-- 
2.7.4

