Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405931552C5
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2020 08:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgBGHPs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Feb 2020 02:15:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34677 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgBGHPs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Feb 2020 02:15:48 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxrb-0005j2-TG; Fri, 07 Feb 2020 08:15:43 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1izxrb-0002Rc-IW; Fri, 07 Feb 2020 08:15:43 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] watchdog: da9062: fix power management ops
Date:   Fri,  7 Feb 2020 08:15:18 +0100
Message-Id: <20200207071518.5559-1-m.felsch@pengutronix.de>
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

This fixes commit f6c98b08381c ("watchdog: da9062: add power management
ops"). During discussion [1] we agreed that this should be configurable
because it is a device quirk if we can't use the hw watchdog auto
suspend function.

[1] https://lore.kernel.org/linux-watchdog/20191128171931.22563-1-m.felsch@pengutronix.de/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

unfortunately I forgot to add an v2 tag [2] and Guenter took the
wrong patch version. It is completely my fault anyway this should be
part of the next rc tag for 5.6. The device property should be applied
already so this patch adds only the usage and therefore don't include
the dt-folks in the to: and cc:.

Regards,
  Marco

[2] https://lkml.org/lkml/2020/1/8/210

 drivers/watchdog/da9062_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 47eefe072b40..77b6b5336067 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -16,6 +16,7 @@
 #include <linux/jiffies.h>
 #include <linux/mfd/da9062/registers.h>
 #include <linux/mfd/da9062/core.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -31,6 +32,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
 struct da9062_watchdog {
 	struct da9062 *hw;
 	struct watchdog_device wdtdev;
+	bool use_sw_pm;
 };
 
 static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
@@ -200,6 +202,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
+	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
+
 	wdt->hw = chip;
 
 	wdt->wdtdev.info = &da9062_watchdog_info;
@@ -226,6 +230,10 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 static int __maybe_unused da9062_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+
+	if (!wdt->use_sw_pm)
+		return 0;
 
 	if (watchdog_active(wdd))
 		return da9062_wdt_stop(wdd);
@@ -236,6 +244,10 @@ static int __maybe_unused da9062_wdt_suspend(struct device *dev)
 static int __maybe_unused da9062_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+
+	if (!wdt->use_sw_pm)
+		return 0;
 
 	if (watchdog_active(wdd))
 		return da9062_wdt_start(wdd);
-- 
2.20.1

