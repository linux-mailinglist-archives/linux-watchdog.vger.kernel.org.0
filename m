Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F6D13C929
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 17:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAOQXS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 11:23:18 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51307 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgAOQXS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 11:23:18 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1irlRq-0004DR-8L; Wed, 15 Jan 2020 17:23:14 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1irlRp-0002ZC-CI; Wed, 15 Jan 2020 17:23:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        contact@stefanchrist.eu, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: da9062: make restart handler atomic safe
Date:   Wed, 15 Jan 2020 17:23:07 +0100
Message-Id: <20200115162307.7336-1-m.felsch@pengutronix.de>
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

The restart handler is executed during the shutdown phase which is
atomic/irq-less. The i2c framework supports atomic transfers since
commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
transfers") to address this use case. Using regmap within an atomic
context is allowed only if the regmap type is MMIO and the cache type
'flat' or no cache is used. Using the i2c_smbus_write_byte_data()
function can be done without additional tests because:
 1) the DA9062 is an i2c-only device and
 2) the i2c framework emulates the smbus protocol if the host adapter
    does not support smbus_xfer by using the master_xfer.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

This patch is based on Stefan Lengfeld's RFC Patch [1].

[1] https://patchwork.ozlabs.org/patch/1085942/

Changes:

v2:
- adapt commit message
- add comment
- make use of i2c_smbus_write_byte_data()
---
 drivers/watchdog/da9062_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index c9b9d6394525..77b6b5336067 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/da9062/registers.h>
@@ -149,12 +150,13 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+	struct i2c_client *client = to_i2c_client(wdt->hw->dev);
 	int ret;
 
-	ret = regmap_write(wdt->hw->regmap,
-			   DA9062AA_CONTROL_F,
-			   DA9062AA_SHUTDOWN_MASK);
-	if (ret)
+	/* Don't use regmap because it is not atomic safe */
+	ret = i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
+					DA9062AA_SHUTDOWN_MASK);
+	if (ret < 0)
 		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
 			  ret);
 
-- 
2.20.1

