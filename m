Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD5035DCB4
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 12:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343829AbhDMKrc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 06:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343697AbhDMKra (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 06:47:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF04AC061756
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 03:47:10 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lWGZZ-0001WX-3v; Tue, 13 Apr 2021 12:47:09 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lWGZY-000711-RJ; Tue, 13 Apr 2021 12:47:08 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 3/3] watchdog: f71808e_wdt: refactor to platform device/driver pair
Date:   Tue, 13 Apr 2021 12:46:46 +0200
Message-Id: <af287d106ef7f1e7f6426844ce1ae89b10dcef3e.1618310618.git-series.a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Driver so far wasn't ported to the driver model and registered
the watchdog device out of the init after probing the I/O ports
for a watchdog with correct vendor and device revision.

Keep the device detection part at init time, but move watchdog
registration to a platform driver probe function.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/f71808e_wdt.c | 42 +++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 5496d2bb0089..e96f2c274b80 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
 #define DRVNAME "f71808e_wdt"
@@ -432,10 +433,18 @@ static const struct watchdog_ops fintek_wdt_ops = {
 	.set_timeout = fintek_wdt_set_timeout,
 };
 
-static int __init watchdog_init(int sioaddr)
+static int fintek_wdt_probe(struct platform_device *pdev)
 {
 	struct watchdog_device *wdd;
 	int wdt_conf, err = 0;
+	struct resource *res;
+	int sioaddr;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -ENXIO;
+
+	sioaddr = res->start;
 
 	watchdog.sioaddr = sioaddr;
 	watchdog.ident.options = WDIOF_SETTIMEOUT
@@ -468,6 +477,7 @@ static int __init watchdog_init(int sioaddr)
 
 	superio_exit(sioaddr);
 
+	wdd->parent		= &pdev->dev;
 	wdd->info               = &watchdog.ident;
 	wdd->ops                = &fintek_wdt_ops;
 	wdd->min_timeout        = 1;
@@ -488,7 +498,7 @@ static int __init watchdog_init(int sioaddr)
 	fintek_wdt_set_timeout(wdd, timeout);
 	fintek_wdt_set_pulse_width(pulse_width);
 
-	return watchdog_register_device(wdd);
+	return devm_watchdog_register_device(&pdev->dev, wdd);
 }
 
 static int __init fintek_wdt_find(int sioaddr)
@@ -554,9 +564,19 @@ static int __init fintek_wdt_find(int sioaddr)
 	return err;
 }
 
+static struct platform_driver fintek_wdt_driver = {
+	.probe          = fintek_wdt_probe,
+	.driver         = {
+		.name   = DRVNAME,
+	},
+};
+
+static struct platform_device *fintek_wdt_pdev;
+
 static int __init fintek_wdt_init(void)
 {
 	static const unsigned short addrs[] = { 0x2e, 0x4e };
+	struct resource wdt_res = {};
 	int err = -ENODEV;
 	int i;
 
@@ -573,12 +593,26 @@ static int __init fintek_wdt_init(void)
 	if (i == ARRAY_SIZE(addrs))
 		return err;
 
-	return watchdog_init(addrs[i]);
+	platform_driver_register(&fintek_wdt_driver);
+
+	wdt_res.name = "superio port";
+	wdt_res.flags = IORESOURCE_IO;
+	wdt_res.start = addrs[i];
+	wdt_res.end   = addrs[i] + 1;
+
+	fintek_wdt_pdev = platform_device_register_simple(DRVNAME, -1, &wdt_res, 1);
+	if (IS_ERR(fintek_wdt_pdev)) {
+		platform_driver_unregister(&fintek_wdt_driver);
+		return PTR_ERR(fintek_wdt_pdev);
+	}
+
+	return 0;
 }
 
 static void __exit fintek_wdt_exit(void)
 {
-	watchdog_unregister_device(&watchdog.wdd);
+	platform_device_unregister(fintek_wdt_pdev);
+	platform_driver_unregister(&fintek_wdt_driver);
 }
 
 MODULE_DESCRIPTION("F71808E Watchdog Driver");
-- 
git-series 0.9.1
