Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6327810CDAD
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Nov 2019 18:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK1RTg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Nov 2019 12:19:36 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59851 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK1RTg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Nov 2019 12:19:36 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iaNS1-0006mE-Qm; Thu, 28 Nov 2019 18:19:33 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iaNS0-0005t6-W9; Thu, 28 Nov 2019 18:19:32 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] watchdog: da9062: add power management ops
Date:   Thu, 28 Nov 2019 18:19:31 +0100
Message-Id: <20191128171931.22563-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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
 drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index e149e66a6ea9..2a1e7de25b71 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	watchdog_set_restart_priority(&wdt->wdtdev, 128);
 
 	watchdog_set_drvdata(&wdt->wdtdev, wdt);
+	dev_set_drvdata(dev, &wdt->wdtdev);
 
 	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
 	if (ret < 0)
@@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	return da9062_wdt_ping(&wdt->wdtdev);
 }
 
+static int __maybe_unused da9062_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
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

