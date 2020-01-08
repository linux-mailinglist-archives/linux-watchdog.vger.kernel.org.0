Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBC0133EBD
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 10:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgAHJ52 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 04:57:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43881 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbgAHJ5Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 04:57:16 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85L-0003Ir-1U; Wed, 08 Jan 2020 10:57:07 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85K-00067C-3i; Wed, 08 Jan 2020 10:57:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, lee.jones@linaro.org,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/3] watchdog: da9062: add power management ops
Date:   Wed,  8 Jan 2020 10:57:04 +0100
Message-Id: <20200108095704.23233-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108095704.23233-1-m.felsch@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Disable the watchdog during suspend if it is enabled and re-enable it on
resume. So we can sleep without the interruptions.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- add dlg,use-sw-pm check to differentiate between automatic and manual
  disabling/enabling.
---
 drivers/watchdog/da9062_wdt.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index e149e66a6ea9..c9b9d6394525 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/mfd/da9062/registers.h>
 #include <linux/mfd/da9062/core.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -30,6 +31,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
 struct da9062_watchdog {
 	struct da9062 *hw;
 	struct watchdog_device wdtdev;
+	bool use_sw_pm;
 };
 
 static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
@@ -198,6 +200,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
+	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
+
 	wdt->hw = chip;
 
 	wdt->wdtdev.info = &da9062_watchdog_info;
@@ -212,6 +216,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	watchdog_set_restart_priority(&wdt->wdtdev, 128);
 
 	watchdog_set_drvdata(&wdt->wdtdev, wdt);
+	dev_set_drvdata(dev, &wdt->wdtdev);
 
 	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
 	if (ret < 0)
@@ -220,10 +225,42 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	return da9062_wdt_ping(&wdt->wdtdev);
 }
 
+static int __maybe_unused da9062_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+
+	if (!wdt->use_sw_pm)
+		return 0;
+
+	if (watchdog_active(wdd))
+		return da9062_wdt_stop(wdd);
+
+	return 0;
+}
+
+static int __maybe_unused da9062_wdt_resume(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+
+	if (!wdt->use_sw_pm)
+		return 0;
+
+	if (watchdog_active(wdd))
+		return da9062_wdt_start(wdd);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
+			 da9062_wdt_suspend, da9062_wdt_resume);
+
 static struct platform_driver da9062_wdt_driver = {
 	.probe = da9062_wdt_probe,
 	.driver = {
 		.name = "da9062-watchdog",
+		.pm = &da9062_wdt_pm_ops,
 		.of_match_table = da9062_compatible_id_table,
 	},
 };
-- 
2.20.1

