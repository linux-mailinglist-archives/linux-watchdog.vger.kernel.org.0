Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56502169C75
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 03:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgBXC5e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 21:57:34 -0500
Received: from inva021.nxp.com ([92.121.34.21]:56216 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbgBXC5e (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 21:57:34 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7EDB020CD73;
        Mon, 24 Feb 2020 03:57:32 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 36B8C204377;
        Mon, 24 Feb 2020 03:57:27 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8E19E402B3;
        Mon, 24 Feb 2020 10:57:20 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] watchdog: imx2_wdt: Drop .remove callback
Date:   Mon, 24 Feb 2020 10:51:27 +0800
Message-Id: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

.remove callback implementation doesn' call clk_disable_unprepare() which
is buggy, actually, we can just use devm_watchdog_register_device() and
devm_add_action_or_reset() to handle all necessary operations for remove
action, then .remove callback can be dropped.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/imx2_wdt.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index f8d58bf..1fe472f 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -244,6 +244,11 @@ static const struct regmap_config imx2_wdt_regmap_config = {
 	.max_register = 0x8,
 };
 
+static void imx2_wdt_action(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static int __init imx2_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -292,6 +297,10 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx2_wdt_action, wdev->clk);
+	if (ret)
+		return ret;
+
 	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
 	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
 
@@ -315,32 +324,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	 */
 	regmap_write(wdev->regmap, IMX2_WDT_WMCR, 0);
 
-	ret = watchdog_register_device(wdog);
-	if (ret)
-		goto disable_clk;
-
-	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
-		 wdog->timeout, nowayout);
-
-	return 0;
-
-disable_clk:
-	clk_disable_unprepare(wdev->clk);
-	return ret;
-}
-
-static int __exit imx2_wdt_remove(struct platform_device *pdev)
-{
-	struct watchdog_device *wdog = platform_get_drvdata(pdev);
-	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
-
-	watchdog_unregister_device(wdog);
-
-	if (imx2_wdt_is_running(wdev)) {
-		imx2_wdt_ping(wdog);
-		dev_crit(&pdev->dev, "Device removed: Expect reboot!\n");
-	}
-	return 0;
+	return devm_watchdog_register_device(dev, wdog);
 }
 
 static void imx2_wdt_shutdown(struct platform_device *pdev)
@@ -417,7 +401,6 @@ static const struct of_device_id imx2_wdt_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, imx2_wdt_dt_ids);
 
 static struct platform_driver imx2_wdt_driver = {
-	.remove		= __exit_p(imx2_wdt_remove),
 	.shutdown	= imx2_wdt_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
-- 
2.7.4

