Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A93035DCB2
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 12:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244977AbhDMKr2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 06:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbhDMKr0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 06:47:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8241BC061574
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 03:47:06 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lWGZU-0001TK-Jd; Tue, 13 Apr 2021 12:47:04 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lWGZU-0006Lu-At; Tue, 13 Apr 2021 12:47:04 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 1/3] watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
Date:   Tue, 13 Apr 2021 12:46:44 +0200
Message-Id: <7516c77a131261bc3c606b0d49d8c656a22d5f2d.1618310618.git-series.a.fatoum@pengutronix.de>
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

Code for the common parts of the driver either uses watchdog_ as
prefix for the watchdog API or f71808e_ for everything else.

The driver now supports 9 more variants besides the f71808e,
so let's rename the common parts to start with fintek_wdt_ instead.

This makes code browsing easier, because it's readily apparent
that functions are not variant-specific. Some watchdog_-prefixed
functions remain, but these will be dropped altogether with the move
to the kernel watchdog API in a later commit.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/f71808e_wdt.c | 66 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index f60beec1bbae..665bef272a33 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -113,7 +113,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
 enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
 	     f81803, f81865, f81866};
 
-static const char *f71808e_names[] = {
+static const char *fintek_wdt_names[] = {
 	"f71808fg",
 	"f71858fg",
 	"f71862fg",
@@ -136,7 +136,7 @@ static inline int superio_enter(int base);
 static inline void superio_select(int base, int ld);
 static inline void superio_exit(int base);
 
-struct watchdog_data {
+struct fintek_wdt {
 	unsigned short	sioaddr;
 	enum chips	type;
 	unsigned long	opened;
@@ -152,7 +152,7 @@ struct watchdog_data {
 	char		caused_reboot;	/* last reboot was by the watchdog */
 };
 
-static struct watchdog_data watchdog = {
+static struct fintek_wdt watchdog = {
 	.lock = __MUTEX_INITIALIZER(watchdog.lock),
 };
 
@@ -218,7 +218,7 @@ static inline void superio_exit(int base)
 	release_region(base, 2);
 }
 
-static int watchdog_set_timeout(int timeout)
+static int fintek_wdt_set_timeout(int timeout)
 {
 	if (timeout <= 0
 	 || timeout >  max_timeout) {
@@ -242,7 +242,7 @@ static int watchdog_set_timeout(int timeout)
 	return 0;
 }
 
-static int watchdog_set_pulse_width(unsigned int pw)
+static int fintek_wdt_set_pulse_width(unsigned int pw)
 {
 	int err = 0;
 	unsigned int t1 = 25, t2 = 125, t3 = 5000;
@@ -276,7 +276,7 @@ static int watchdog_set_pulse_width(unsigned int pw)
 	return err;
 }
 
-static int watchdog_keepalive(void)
+static int fintek_wdt_keepalive(void)
 {
 	int err = 0;
 
@@ -306,13 +306,13 @@ static int watchdog_keepalive(void)
 	return err;
 }
 
-static int watchdog_start(void)
+static int fintek_wdt_start(void)
 {
 	int err;
 	u8 tmp;
 
 	/* Make sure we don't die as soon as the watchdog is enabled below */
-	err = watchdog_keepalive();
+	err = fintek_wdt_keepalive();
 	if (err)
 		return err;
 
@@ -433,7 +433,7 @@ static int watchdog_start(void)
 	return err;
 }
 
-static int watchdog_stop(void)
+static int fintek_wdt_stop(void)
 {
 	int err = 0;
 
@@ -465,7 +465,7 @@ static int watchdog_get_status(void)
 	return status;
 }
 
-static bool watchdog_is_running(void)
+static bool fintek_wdt_is_running(void)
 {
 	/*
 	 * if we fail to determine the watchdog's status assume it to be
@@ -499,7 +499,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
 	if (test_and_set_bit(0, &watchdog.opened))
 		return -EBUSY;
 
-	err = watchdog_start();
+	err = fintek_wdt_start();
 	if (err) {
 		clear_bit(0, &watchdog.opened);
 		return err;
@@ -517,10 +517,10 @@ static int watchdog_release(struct inode *inode, struct file *file)
 	clear_bit(0, &watchdog.opened);
 
 	if (!watchdog.expect_close) {
-		watchdog_keepalive();
+		fintek_wdt_keepalive();
 		pr_crit("Unexpected close, not stopping watchdog!\n");
 	} else if (!nowayout) {
-		watchdog_stop();
+		fintek_wdt_stop();
 	}
 	return 0;
 }
@@ -561,7 +561,7 @@ static ssize_t watchdog_write(struct file *file, const char __user *buf,
 		}
 
 		/* someone wrote to us, we should restart timer */
-		watchdog_keepalive();
+		fintek_wdt_keepalive();
 	}
 	return count;
 }
@@ -608,24 +608,24 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 			return -EFAULT;
 
 		if (new_options & WDIOS_DISABLECARD)
-			watchdog_stop();
+			fintek_wdt_stop();
 
 		if (new_options & WDIOS_ENABLECARD)
-			return watchdog_start();
+			return fintek_wdt_start();
 		fallthrough;
 
 	case WDIOC_KEEPALIVE:
-		watchdog_keepalive();
+		fintek_wdt_keepalive();
 		return 0;
 
 	case WDIOC_SETTIMEOUT:
 		if (get_user(new_timeout, uarg.i))
 			return -EFAULT;
 
-		if (watchdog_set_timeout(new_timeout))
+		if (fintek_wdt_set_timeout(new_timeout))
 			return -EINVAL;
 
-		watchdog_keepalive();
+		fintek_wdt_keepalive();
 		fallthrough;
 
 	case WDIOC_GETTIMEOUT:
@@ -641,7 +641,7 @@ static int watchdog_notify_sys(struct notifier_block *this, unsigned long code,
 	void *unused)
 {
 	if (code == SYS_DOWN || code == SYS_HALT)
-		watchdog_stop();
+		fintek_wdt_stop();
 	return NOTIFY_DONE;
 }
 
@@ -679,7 +679,7 @@ static int __init watchdog_init(int sioaddr)
 
 	snprintf(watchdog.ident.identity,
 		sizeof(watchdog.ident.identity), "%s watchdog",
-		f71808e_names[watchdog.type]);
+		fintek_wdt_names[watchdog.type]);
 
 	err = superio_enter(sioaddr);
 	if (err)
@@ -698,10 +698,10 @@ static int __init watchdog_init(int sioaddr)
 
 	superio_exit(sioaddr);
 
-	err = watchdog_set_timeout(timeout);
+	err = fintek_wdt_set_timeout(timeout);
 	if (err)
 		return err;
-	err = watchdog_set_pulse_width(pulse_width);
+	err = fintek_wdt_set_pulse_width(pulse_width);
 	if (err)
 		return err;
 
@@ -724,7 +724,7 @@ static int __init watchdog_init(int sioaddr)
 			goto exit_miscdev;
 		}
 
-		err = watchdog_start();
+		err = fintek_wdt_start();
 		if (err) {
 			pr_err("cannot start watchdog timer\n");
 			goto exit_miscdev;
@@ -772,7 +772,7 @@ static int __init watchdog_init(int sioaddr)
 	return err;
 }
 
-static int __init f71808e_find(int sioaddr)
+static int __init fintek_wdt_find(int sioaddr)
 {
 	u16 devid;
 	int err = superio_enter(sioaddr);
@@ -828,14 +828,14 @@ static int __init f71808e_find(int sioaddr)
 	}
 
 	pr_info("Found %s watchdog chip, revision %d\n",
-		f71808e_names[watchdog.type],
+		fintek_wdt_names[watchdog.type],
 		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
 exit:
 	superio_exit(sioaddr);
 	return err;
 }
 
-static int __init f71808e_init(void)
+static int __init fintek_wdt_init(void)
 {
 	static const unsigned short addrs[] = { 0x2e, 0x4e };
 	int err = -ENODEV;
@@ -847,7 +847,7 @@ static int __init f71808e_init(void)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
-		err = f71808e_find(addrs[i]);
+		err = fintek_wdt_find(addrs[i]);
 		if (err == 0)
 			break;
 	}
@@ -857,11 +857,11 @@ static int __init f71808e_init(void)
 	return watchdog_init(addrs[i]);
 }
 
-static void __exit f71808e_exit(void)
+static void __exit fintek_wdt_exit(void)
 {
-	if (watchdog_is_running()) {
+	if (fintek_wdt_is_running()) {
 		pr_warn("Watchdog timer still running, stopping it\n");
-		watchdog_stop();
+		fintek_wdt_stop();
 	}
 	misc_deregister(&watchdog_miscdev);
 	unregister_reboot_notifier(&watchdog_notifier);
@@ -871,5 +871,5 @@ MODULE_DESCRIPTION("F71808E Watchdog Driver");
 MODULE_AUTHOR("Giel van Schijndel <me@mortis.eu>");
 MODULE_LICENSE("GPL");
 
-module_init(f71808e_init);
-module_exit(f71808e_exit);
+module_init(fintek_wdt_init);
+module_exit(fintek_wdt_exit);
-- 
git-series 0.9.1
