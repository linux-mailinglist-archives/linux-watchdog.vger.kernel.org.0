Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2EB1F6DD4
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 21:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgFKTR6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 15:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgFKTR5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 15:17:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B547BC08C5C3
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jun 2020 12:17:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi2-0002L9-Ua; Thu, 11 Jun 2020 21:17:54 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi2-00012Q-Lx; Thu, 11 Jun 2020 21:17:54 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] watchdog: f71808e_wdt: do stricter parameter validation
Date:   Thu, 11 Jun 2020 21:17:46 +0200
Message-Id: <20200611191750.28096-6-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200611191750.28096-1-a.fatoum@pengutronix.de>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

We check the f71862fg_pin module parameter every time a watchdog device
for the f71862fg is opened, but the parameter can't change at runtime.

If we move the check to the start of init:

  - We catch userspace passing invalid, but unused, values
  - We check the condition only once
  - We simplify the code

Do so.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/f71808e_wdt.c | 37 +++++++++++-----------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 26bf366aebc2..9f7823819ed1 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -306,27 +306,6 @@ static int watchdog_keepalive(void)
 	return err;
 }
 
-static int f71862fg_pin_configure(unsigned short ioaddr)
-{
-	/* When ioaddr is non-zero the calling function has to take care of
-	   mutex handling and superio preparation! */
-
-	if (f71862fg_pin == 63) {
-		if (ioaddr) {
-			/* SPI must be disabled first to use this pin! */
-			superio_clear_bit(ioaddr, SIO_REG_ROM_ADDR_SEL, 6);
-			superio_set_bit(ioaddr, SIO_REG_MFUNCT3, 4);
-		}
-	} else if (f71862fg_pin == 56) {
-		if (ioaddr)
-			superio_set_bit(ioaddr, SIO_REG_MFUNCT1, 1);
-	} else {
-		pr_err("Invalid argument f71862fg_pin=%d\n", f71862fg_pin);
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static int watchdog_start(void)
 {
 	int err;
@@ -352,9 +331,13 @@ static int watchdog_start(void)
 		break;
 
 	case f71862fg:
-		err = f71862fg_pin_configure(watchdog.sioaddr);
-		if (err)
-			goto exit_superio;
+		if (f71862fg_pin == 63) {
+			/* SPI must be disabled first to use this pin! */
+			superio_clear_bit(watchdog.sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
+			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 4);
+		} else if (f71862fg_pin == 56) {
+			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
+		}
 		break;
 
 	case f71868:
@@ -810,7 +793,6 @@ static int __init f71808e_find(int sioaddr)
 		break;
 	case SIO_F71862_ID:
 		watchdog.type = f71862fg;
-		err = f71862fg_pin_configure(0); /* validate module parameter */
 		break;
 	case SIO_F71868_ID:
 		watchdog.type = f71868;
@@ -859,6 +841,11 @@ static int __init f71808e_init(void)
 	int err = -ENODEV;
 	int i;
 
+	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
+		pr_err("Invalid argument f71862fg_pin=%d\n", f71862fg_pin);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
 		err = f71808e_find(addrs[i]);
 		if (err == 0)
-- 
2.27.0

