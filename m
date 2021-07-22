Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7363D21F3
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Jul 2021 12:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhGVJee (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Jul 2021 05:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhGVJed (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Jul 2021 05:34:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01B1C0613C1
        for <linux-watchdog@vger.kernel.org>; Thu, 22 Jul 2021 03:15:08 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1m6Vj8-00019W-Mv; Thu, 22 Jul 2021 12:14:50 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1m6Vj7-0001KW-4D; Thu, 22 Jul 2021 12:14:49 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v4 3/5] watchdog: f71808e_wdt: migrate to new kernel watchdog API
Date:   Thu, 22 Jul 2021 12:14:42 +0200
Message-Id: <0e33da36f5fb146d180e1ad694fde7fde4077914.1626948810.git-series.a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
References: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Migrating the driver lets us drop the watchdog misc device boilerplate
and reduces size by 285 lines. It also brings us support for new
functionality like CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.

This incurs a slight backwards-compatibility break, because the new
kernel watchdog API doesn't support unloading modules for drivers
whose watchdog hardware is reported to be running.

This means following scenario will be no longer supported:
 - BIOS has enabled watchdog
 - Module is loaded and unloaded without opening watchdog
 - module_exit is expected to succeed and disable watchdog HW

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/Kconfig       |   1 +-
 drivers/watchdog/f71808e_wdt.c | 388 ++++------------------------------
 2 files changed, 51 insertions(+), 338 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 546dfc1e2349..3cc6aac18006 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1063,6 +1063,7 @@ config EBC_C384_WDT
 config F71808E_WDT
 	tristate "Fintek F718xx, F818xx Super I/O Watchdog"
 	depends on X86
+	select WATCHDOG_CORE
 	help
 	  This is the driver for the hardware watchdog on the Fintek F71808E,
 	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81803, F81865, and
diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 597eaf6905f4..efc6981d9a9b 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -9,16 +9,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/err.h>
-#include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-#include <linux/miscdevice.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/uaccess.h>
 #include <linux/watchdog.h>
 
 #define DRVNAME "f71808e_wdt"
@@ -137,24 +131,18 @@ static inline void superio_select(int base, int ld);
 static inline void superio_exit(int base);
 
 struct fintek_wdt {
+	struct watchdog_device wdd;
 	unsigned short	sioaddr;
 	enum chips	type;
-	unsigned long	opened;
-	struct mutex	lock;
-	char		expect_close;
 	struct watchdog_info ident;
 
-	unsigned short	timeout;
 	u8		timer_val;	/* content for the wd_time register */
 	char		minutes_mode;
 	u8		pulse_val;	/* pulse width flag */
 	char		pulse_mode;	/* enable pulse output mode? */
-	char		caused_reboot;	/* last reboot was by the watchdog */
 };
 
-static struct fintek_wdt watchdog = {
-	.lock = __MUTEX_INITIALIZER(watchdog.lock),
-};
+static struct fintek_wdt watchdog;
 
 /* Super I/O functions */
 static inline int superio_inb(int base, int reg)
@@ -218,16 +206,8 @@ static inline void superio_exit(int base)
 	release_region(base, 2);
 }
 
-static int fintek_wdt_set_timeout(int timeout)
+static int fintek_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
 {
-	if (timeout <= 0
-	 || timeout >  max_timeout) {
-		pr_err("watchdog timeout out of range\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(&watchdog.lock);
-
 	if (timeout > 0xff) {
 		watchdog.timer_val = DIV_ROUND_UP(timeout, 60);
 		watchdog.minutes_mode = true;
@@ -237,16 +217,13 @@ static int fintek_wdt_set_timeout(int timeout)
 		watchdog.minutes_mode = false;
 	}
 
-	watchdog.timeout = timeout;
-
-	mutex_unlock(&watchdog.lock);
+	wdd->timeout = timeout;
 
 	return 0;
 }
 
 static int fintek_wdt_set_pulse_width(unsigned int pw)
 {
-	int err = 0;
 	unsigned int t1 = 25, t2 = 125, t3 = 5000;
 
 	if (watchdog.type == f71868) {
@@ -255,8 +232,6 @@ static int fintek_wdt_set_pulse_width(unsigned int pw)
 		t3 = 6000;
 	}
 
-	mutex_lock(&watchdog.lock);
-
 	if        (pw <=  1) {
 		watchdog.pulse_val = 0;
 	} else if (pw <= t1) {
@@ -267,25 +242,21 @@ static int fintek_wdt_set_pulse_width(unsigned int pw)
 		watchdog.pulse_val = 3;
 	} else {
 		pr_err("pulse width out of range\n");
-		err = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	watchdog.pulse_mode = pw;
 
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-	return err;
+	return 0;
 }
 
-static int fintek_wdt_keepalive(void)
+static int fintek_wdt_keepalive(struct watchdog_device *wdd)
 {
-	int err = 0;
+	int err;
 
-	mutex_lock(&watchdog.lock);
 	err = superio_enter(watchdog.sioaddr);
 	if (err)
-		goto exit_unlock;
+		return err;
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 
 	if (watchdog.minutes_mode)
@@ -303,25 +274,22 @@ static int fintek_wdt_keepalive(void)
 
 	superio_exit(watchdog.sioaddr);
 
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-	return err;
+	return 0;
 }
 
-static int fintek_wdt_start(void)
+static int fintek_wdt_start(struct watchdog_device *wdd)
 {
 	int err;
 	u8 tmp;
 
 	/* Make sure we don't die as soon as the watchdog is enabled below */
-	err = fintek_wdt_keepalive();
+	err = fintek_wdt_keepalive(wdd);
 	if (err)
 		return err;
 
-	mutex_lock(&watchdog.lock);
 	err = superio_enter(watchdog.sioaddr);
 	if (err)
-		goto exit_unlock;
+		return err;
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 
 	/* Watchdog pin configuration */
@@ -429,20 +397,17 @@ static int fintek_wdt_start(void)
 
 exit_superio:
 	superio_exit(watchdog.sioaddr);
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
 
 	return err;
 }
 
-static int fintek_wdt_stop(void)
+static int fintek_wdt_stop(struct watchdog_device *wdd)
 {
-	int err = 0;
+	int err;
 
-	mutex_lock(&watchdog.lock);
 	err = superio_enter(watchdog.sioaddr);
 	if (err)
-		goto exit_unlock;
+		return err;
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 
 	superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
@@ -450,232 +415,31 @@ static int fintek_wdt_stop(void)
 
 	superio_exit(watchdog.sioaddr);
 
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-
-	return err;
-}
-
-static int watchdog_get_status(void)
-{
-	int status = 0;
-
-	mutex_lock(&watchdog.lock);
-	status = (watchdog.caused_reboot) ? WDIOF_CARDRESET : 0;
-	mutex_unlock(&watchdog.lock);
-
-	return status;
-}
-
-static bool fintek_wdt_is_running(void)
-{
-	/*
-	 * if we fail to determine the watchdog's status assume it to be
-	 * running to be on the safe side
-	 */
-	bool is_running = true;
-
-	mutex_lock(&watchdog.lock);
-	if (superio_enter(watchdog.sioaddr))
-		goto exit_unlock;
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
-
-	is_running = (superio_inb(watchdog.sioaddr, SIO_REG_ENABLE) & BIT(0))
-		&& (superio_inb(watchdog.sioaddr, F71808FG_REG_WDT_CONF)
-			& BIT(F71808FG_FLAG_WD_EN));
-
-	superio_exit(watchdog.sioaddr);
-
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-	return is_running;
-}
-
-/* /dev/watchdog api */
-
-static int watchdog_open(struct inode *inode, struct file *file)
-{
-	int err;
-
-	/* If the watchdog is alive we don't need to start it again */
-	if (test_and_set_bit(0, &watchdog.opened))
-		return -EBUSY;
-
-	err = fintek_wdt_start();
-	if (err) {
-		clear_bit(0, &watchdog.opened);
-		return err;
-	}
-
-	if (nowayout)
-		__module_get(THIS_MODULE);
-
-	watchdog.expect_close = 0;
-	return stream_open(inode, file);
-}
-
-static int watchdog_release(struct inode *inode, struct file *file)
-{
-	clear_bit(0, &watchdog.opened);
-
-	if (!watchdog.expect_close) {
-		fintek_wdt_keepalive();
-		pr_crit("Unexpected close, not stopping watchdog!\n");
-	} else if (!nowayout) {
-		fintek_wdt_stop();
-	}
 	return 0;
 }
 
-/*
- *      watchdog_write:
- *      @file: file handle to the watchdog
- *      @buf: buffer to write
- *      @count: count of bytes
- *      @ppos: pointer to the position to write. No seeks allowed
- *
- *      A write to a watchdog device is defined as a keepalive signal. Any
- *      write of data will do, as we we don't define content meaning.
- */
-
-static ssize_t watchdog_write(struct file *file, const char __user *buf,
-			    size_t count, loff_t *ppos)
-{
-	if (count) {
-		if (!nowayout) {
-			size_t i;
-
-			/* In case it was set long ago */
-			bool expect_close = false;
-
-			for (i = 0; i != count; i++) {
-				char c;
-				if (get_user(c, buf + i))
-					return -EFAULT;
-				if (c == 'V')
-					expect_close = true;
-			}
-
-			/* Properly order writes across fork()ed processes */
-			mutex_lock(&watchdog.lock);
-			watchdog.expect_close = expect_close;
-			mutex_unlock(&watchdog.lock);
-		}
-
-		/* someone wrote to us, we should restart timer */
-		fintek_wdt_keepalive();
-	}
-	return count;
-}
-
-/*
- *      watchdog_ioctl:
- *      @inode: inode of the device
- *      @file: file handle to the device
- *      @cmd: watchdog command
- *      @arg: argument pointer
- *
- *      The watchdog API defines a common set of functions for all watchdogs
- *      according to their available features.
- */
-static long watchdog_ioctl(struct file *file, unsigned int cmd,
-	unsigned long arg)
+static bool fintek_wdt_is_running(u8 wdt_conf)
 {
-	int status;
-	int new_options;
-	int new_timeout;
-	union {
-		struct watchdog_info __user *ident;
-		int __user *i;
-	} uarg;
-
-	uarg.i = (int __user *)arg;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(uarg.ident, &watchdog.ident,
-			sizeof(watchdog.ident)) ? -EFAULT : 0;
-
-	case WDIOC_GETSTATUS:
-		status = watchdog_get_status();
-		if (status < 0)
-			return status;
-		return put_user(status, uarg.i);
-
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, uarg.i);
-
-	case WDIOC_SETOPTIONS:
-		if (get_user(new_options, uarg.i))
-			return -EFAULT;
-
-		if (new_options & WDIOS_DISABLECARD)
-			fintek_wdt_stop();
-
-		if (new_options & WDIOS_ENABLECARD)
-			return fintek_wdt_start();
-		fallthrough;
-
-	case WDIOC_KEEPALIVE:
-		fintek_wdt_keepalive();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_timeout, uarg.i))
-			return -EFAULT;
-
-		if (fintek_wdt_set_timeout(new_timeout))
-			return -EINVAL;
-
-		fintek_wdt_keepalive();
-		fallthrough;
-
-	case WDIOC_GETTIMEOUT:
-		return put_user(watchdog.timeout, uarg.i);
-
-	default:
-		return -ENOTTY;
-
-	}
+	return (superio_inb(watchdog.sioaddr, SIO_REG_ENABLE) & BIT(0))
+		&& (wdt_conf & BIT(F71808FG_FLAG_WD_EN));
 }
 
-static int watchdog_notify_sys(struct notifier_block *this, unsigned long code,
-	void *unused)
-{
-	if (code == SYS_DOWN || code == SYS_HALT)
-		fintek_wdt_stop();
-	return NOTIFY_DONE;
-}
-
-static const struct file_operations watchdog_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.open		= watchdog_open,
-	.release	= watchdog_release,
-	.write		= watchdog_write,
-	.unlocked_ioctl	= watchdog_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-};
-
-static struct miscdevice watchdog_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &watchdog_fops,
-};
-
-static struct notifier_block watchdog_notifier = {
-	.notifier_call = watchdog_notify_sys,
+static const struct watchdog_ops fintek_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = fintek_wdt_start,
+	.stop = fintek_wdt_stop,
+	.ping = fintek_wdt_keepalive,
+	.set_timeout = fintek_wdt_set_timeout,
 };
 
 static int __init watchdog_init(int sioaddr)
 {
+	struct watchdog_device *wdd;
 	int wdt_conf, err = 0;
 
-	/* No need to lock watchdog.lock here because no entry points
-	 * into the module have been registered yet.
-	 */
 	watchdog.sioaddr = sioaddr;
-	watchdog.ident.options = WDIOF_MAGICCLOSE
+	watchdog.ident.options = WDIOF_SETTIMEOUT
+				| WDIOF_MAGICCLOSE
 				| WDIOF_KEEPALIVEPING
 				| WDIOF_CARDRESET;
 
@@ -689,7 +453,6 @@ static int __init watchdog_init(int sioaddr)
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 
 	wdt_conf = superio_inb(sioaddr, F71808FG_REG_WDT_CONF);
-	watchdog.caused_reboot = wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS);
 
 	/*
 	 * We don't want WDTMOUT_STS to stick around till regular reboot.
@@ -698,80 +461,34 @@ static int __init watchdog_init(int sioaddr)
 	superio_outb(sioaddr, F71808FG_REG_WDT_CONF,
 		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
 
-	superio_exit(sioaddr);
-
-	err = fintek_wdt_set_timeout(timeout);
-	if (err)
-		return err;
-	err = fintek_wdt_set_pulse_width(pulse_width);
-	if (err)
-		return err;
-
-	err = register_reboot_notifier(&watchdog_notifier);
-	if (err)
-		return err;
+	wdd = &watchdog.wdd;
 
-	err = misc_register(&watchdog_miscdev);
-	if (err) {
-		pr_err("cannot register miscdev on minor=%d\n",
-		       watchdog_miscdev.minor);
-		goto exit_reboot;
-	}
+	if (fintek_wdt_is_running(wdt_conf))
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
 
-	if (start_withtimeout) {
-		if (start_withtimeout <= 0
-		 || start_withtimeout >  max_timeout) {
-			pr_err("starting timeout out of range\n");
-			err = -EINVAL;
-			goto exit_miscdev;
-		}
-
-		err = fintek_wdt_start();
-		if (err) {
-			pr_err("cannot start watchdog timer\n");
-			goto exit_miscdev;
-		}
-
-		mutex_lock(&watchdog.lock);
-		err = superio_enter(sioaddr);
-		if (err)
-			goto exit_unlock;
-		superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
-
-		if (start_withtimeout > 0xff) {
-			/* select minutes for timer units */
-			superio_set_bit(sioaddr, F71808FG_REG_WDT_CONF,
-				F71808FG_FLAG_WD_UNIT);
-			superio_outb(sioaddr, F71808FG_REG_WD_TIME,
-				DIV_ROUND_UP(start_withtimeout, 60));
-		} else {
-			/* select seconds for timer units */
-			superio_clear_bit(sioaddr, F71808FG_REG_WDT_CONF,
-				F71808FG_FLAG_WD_UNIT);
-			superio_outb(sioaddr, F71808FG_REG_WD_TIME,
-				start_withtimeout);
-		}
+	superio_exit(sioaddr);
 
-		superio_exit(sioaddr);
-		mutex_unlock(&watchdog.lock);
+	wdd->info               = &watchdog.ident;
+	wdd->ops                = &fintek_wdt_ops;
+	wdd->min_timeout        = 1;
+	wdd->max_timeout        = max_timeout;
 
-		if (nowayout)
-			__module_get(THIS_MODULE);
+	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_stop_on_unregister(wdd);
+	watchdog_stop_on_reboot(wdd);
+	watchdog_init_timeout(wdd, start_withtimeout, NULL);
 
-		pr_info("watchdog started with initial timeout of %u sec\n",
-			start_withtimeout);
-	}
+	if (wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS))
+		wdd->bootstatus = WDIOF_CARDRESET;
 
-	return 0;
-
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-exit_miscdev:
-	misc_deregister(&watchdog_miscdev);
-exit_reboot:
-	unregister_reboot_notifier(&watchdog_notifier);
+	/*
+	 * WATCHDOG_HANDLE_BOOT_ENABLED can result in keepalive being directly
+	 * called without a set_timeout before, so it needs to be done here once
+	 */
+	fintek_wdt_set_timeout(wdd, timeout);
+	fintek_wdt_set_pulse_width(pulse_width);
 
-	return err;
+	return watchdog_register_device(wdd);
 }
 
 static int __init fintek_wdt_find(int sioaddr)
@@ -861,12 +578,7 @@ static int __init fintek_wdt_init(void)
 
 static void __exit fintek_wdt_exit(void)
 {
-	if (fintek_wdt_is_running()) {
-		pr_warn("Watchdog timer still running, stopping it\n");
-		fintek_wdt_stop();
-	}
-	misc_deregister(&watchdog_miscdev);
-	unregister_reboot_notifier(&watchdog_notifier);
+	watchdog_unregister_device(&watchdog.wdd);
 }
 
 MODULE_DESCRIPTION("F71808E Watchdog Driver");
-- 
git-series 0.9.1
