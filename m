Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDCC138D77
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 10:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgAMJPe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 04:15:34 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50273 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgAMJPe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 04:15:34 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iqvop-0000XT-6m; Mon, 13 Jan 2020 10:15:31 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iqvoo-0001dm-4X; Mon, 13 Jan 2020 10:15:30 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        contact@stefanchrist.eu, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] watchdog: da9062: make restart handler atomic safe
Date:   Mon, 13 Jan 2020 10:15:21 +0100
Message-Id: <20200113091521.5754-1-m.felsch@pengutronix.de>
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
transfers") but unfortunately the regmap framework doesn't support it
yet. Hard coding the i2c stuff can be done without worries since the
DA9062 is an i2c-only device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

This patch is based on Stefan Lengfeld's RFC Patch [1].

[1] https://patchwork.ozlabs.org/patch/1085942/
---
 drivers/watchdog/da9062_wdt.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index c9b9d6394525..84c5a0a455b2 100644
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
@@ -149,12 +150,18 @@ static int da9062_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			      void *data)
 {
 	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
+	struct i2c_client *client = to_i2c_client(wdt->hw->dev);
+	u8 buf[] = {DA9062AA_CONTROL_F, DA9062AA_SHUTDOWN_MASK};
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = 0,
+		.len = sizeof(buf),
+		.buf = buf,
+	};
 	int ret;
 
-	ret = regmap_write(wdt->hw->regmap,
-			   DA9062AA_CONTROL_F,
-			   DA9062AA_SHUTDOWN_MASK);
-	if (ret)
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret < 0)
 		dev_alert(wdt->hw->dev, "Failed to shutdown (err = %d)\n",
 			  ret);
 
-- 
2.20.1

