Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796462934E1
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Oct 2020 08:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404070AbgJTGVq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Oct 2020 02:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgJTGVp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Oct 2020 02:21:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A486C061755
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Oct 2020 23:21:45 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kUl1T-00064k-6m; Tue, 20 Oct 2020 08:21:27 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1kUl1R-00030t-Oc; Tue, 20 Oct 2020 08:21:25 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 2/2] watchdog: f71808e_wdt: migrate to new kernel watchdog API
Date:   Tue, 20 Oct 2020 08:21:12 +0200
Message-Id: <20201020062112.6762-3-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020062112.6762-1-a.fatoum@pengutronix.de>
References: <20201020062112.6762-1-a.fatoum@pengutronix.de>
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
and reduces size by 280~ lines. It also brings us support for new
functionality like CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.

While at it, also rename all local identifiers starting with watchdog_
to start with easier to tell apart fintek_wdt_ instead.

This incurs a slight backwards-compatibility break, because the new
kernel watchdog API doesn't support unloading modules for drivers
whose watchdog hardware is reported to be running.

This means following scenario will be no longer supported:
 - BIOS has enabled watchdog
 - Module is loaded and unloaded without opening watchdog
 - module_exit is expected to succeed and disable watchdog HW

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/Kconfig       |   1 +
 drivers/watchdog/f71808e_wdt.c | 514 ++++++++-------------------------
 2 files changed, 115 insertions(+), 400 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ab7aad5a1e69..81f9817b291c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1066,6 +1066,7 @@ config EBC_C384_WDT
 config F71808E_WDT
 	tristate "Fintek F718xx, F818xx Super I/O Watchdog"
 	depends on X86
+	select WATCHDOG_CORE
 	help
 	  This is the driver for the hardware watchdog on the Fintek F71808E,
 	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81803, F81865, and
diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 4ff7a2509125..32e759356354 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -3,6 +3,7 @@
  *   Copyright (C) 2006 by Hans Edgington <hans@edgington.nl>              *
  *   Copyright (C) 2007-2009 Hans de Goede <hdegoede@redhat.com>           *
  *   Copyright (C) 2010 Giel van Schijndel <me@mortis.eu>                  *
+ *   Copyright (C) 2020 Ahmad Fatoum <a.fatoum@pengutronix.de>             *
  *                                                                         *
  ***************************************************************************/
 
@@ -10,18 +11,12 @@
 
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/uaccess.h>
 #include <linux/watchdog.h>
 
 #define DRVNAME "f71808e_wdt"
@@ -132,23 +127,15 @@ struct fintek_wdt_variant {
 };
 
 struct fintek_wdt {
+	struct watchdog_device wdd;
 	unsigned short	sioaddr;
 	const struct fintek_wdt_variant *variant;
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
-};
-
-static struct fintek_wdt watchdog = {
-	.lock = __MUTEX_INITIALIZER(watchdog.lock),
 };
 
 static inline bool has_f81865_wdo_conf(struct fintek_wdt *wd)
@@ -218,505 +205,244 @@ static inline void superio_exit(int base)
 	release_region(base, 2);
 }
 
-static int watchdog_set_timeout(int timeout)
+static int fintek_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
 {
-	if (timeout <= 0
-	 || timeout >  max_timeout) {
-		pr_err("watchdog timeout out of range\n");
-		return -EINVAL;
-	}
+	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
 
-	mutex_lock(&watchdog.lock);
-
-	watchdog.timeout = timeout;
+	wdd->timeout = timeout;
 	if (timeout > 0xff) {
-		watchdog.timer_val = DIV_ROUND_UP(timeout, 60);
-		watchdog.minutes_mode = true;
+		wd->timer_val = DIV_ROUND_UP(timeout, 60);
+		wd->minutes_mode = true;
 	} else {
-		watchdog.timer_val = timeout;
-		watchdog.minutes_mode = false;
+		wd->timer_val = timeout;
+		wd->minutes_mode = false;
 	}
 
-	mutex_unlock(&watchdog.lock);
-
 	return 0;
 }
 
-static int watchdog_set_pulse_width(unsigned int pw)
+static int fintek_wdt_set_pulse_width(struct fintek_wdt *wd, unsigned int pw)
 {
-	int err = 0;
 	unsigned int t1 = 25, t2 = 125, t3 = 5000;
 
-	if (watchdog.variant->id == SIO_F71868_ID) {
+	if (wd->variant->id == SIO_F71868_ID) {
 		t1 = 30;
 		t2 = 150;
 		t3 = 6000;
 	}
 
-	mutex_lock(&watchdog.lock);
-
 	if        (pw <=  1) {
-		watchdog.pulse_val = 0;
+		wd->pulse_val = 0;
 	} else if (pw <= t1) {
-		watchdog.pulse_val = 1;
+		wd->pulse_val = 1;
 	} else if (pw <= t2) {
-		watchdog.pulse_val = 2;
+		wd->pulse_val = 2;
 	} else if (pw <= t3) {
-		watchdog.pulse_val = 3;
+		wd->pulse_val = 3;
 	} else {
 		pr_err("pulse width out of range\n");
-		err = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
-	watchdog.pulse_mode = pw;
+	wd->pulse_mode = pw;
 
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-	return err;
+	return 0;
 }
 
-static int watchdog_keepalive(void)
+static int fintek_wdt_keepalive(struct watchdog_device *wdd)
 {
-	int err = 0;
+	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
+	int err;
 
-	mutex_lock(&watchdog.lock);
-	err = superio_enter(watchdog.sioaddr);
+	err = superio_enter(wd->sioaddr);
 	if (err)
-		goto exit_unlock;
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
+		return err;
+	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
 
-	if (watchdog.minutes_mode)
+	if (wd->minutes_mode)
 		/* select minutes for timer units */
-		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
+		superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
 				F71808FG_FLAG_WD_UNIT);
 	else
 		/* select seconds for timer units */
-		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
-				F71808FG_FLAG_WD_UNIT);
+		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
+				  F71808FG_FLAG_WD_UNIT);
 
 	/* Set timer value */
-	superio_outb(watchdog.sioaddr, F71808FG_REG_WD_TIME,
-			   watchdog.timer_val);
+	superio_outb(wd->sioaddr, F71808FG_REG_WD_TIME,
+		     wd->timer_val);
 
-	superio_exit(watchdog.sioaddr);
+	superio_exit(wd->sioaddr);
 
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
-	return err;
+	return 0;
 }
 
-static int watchdog_start(void)
+static int fintek_wdt_start(struct watchdog_device *wdd)
 {
+	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
 	int err;
 
 	/* Make sure we don't die as soon as the watchdog is enabled below */
-	err = watchdog_keepalive();
+	err = fintek_wdt_keepalive(wdd);
 	if (err)
 		return err;
 
-	mutex_lock(&watchdog.lock);
-	err = superio_enter(watchdog.sioaddr);
+	err = superio_enter(wd->sioaddr);
 	if (err)
-		goto exit_unlock;
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
+		return err;
+	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
 
 	/* Watchdog pin configuration */
-	watchdog.variant->pinconf(&watchdog);
+	wd->variant->pinconf(wd);
 
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
-	superio_set_bit(watchdog.sioaddr, SIO_REG_ENABLE, 0);
+	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
+	superio_set_bit(wd->sioaddr, SIO_REG_ENABLE, 0);
 
-	if (has_f81865_wdo_conf(&watchdog))
-		superio_set_bit(watchdog.sioaddr, F81865_REG_WDO_CONF,
+	if (has_f81865_wdo_conf(wd))
+		superio_set_bit(wd->sioaddr, F81865_REG_WDO_CONF,
 				F81865_FLAG_WDOUT_EN);
 	else
-		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDO_CONF,
+		superio_set_bit(wd->sioaddr, F71808FG_REG_WDO_CONF,
 				F71808FG_FLAG_WDOUT_EN);
 
-	superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
+	superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
 			F71808FG_FLAG_WD_EN);
 
-	if (watchdog.pulse_mode) {
+	set_bit(WDOG_HW_RUNNING, &wdd->status);
+
+	if (wd->pulse_mode) {
 		/* Select "pulse" output mode with given duration */
-		u8 wdt_conf = superio_inb(watchdog.sioaddr,
-				F71808FG_REG_WDT_CONF);
+		u8 wdt_conf = superio_inb(wd->sioaddr, F71808FG_REG_WDT_CONF);
 
 		/* Set WD_PSWIDTH bits (1:0) */
-		wdt_conf = (wdt_conf & 0xfc) | (watchdog.pulse_val & 0x03);
+		wdt_conf = (wdt_conf & 0xfc) | (wd->pulse_val & 0x03);
 		/* Set WD_PULSE to "pulse" mode */
 		wdt_conf |= BIT(F71808FG_FLAG_WD_PULSE);
 
-		superio_outb(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
-				wdt_conf);
+		superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF, wdt_conf);
 	} else {
 		/* Select "level" output mode */
-		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
-				F71808FG_FLAG_WD_PULSE);
+		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
+				  F71808FG_FLAG_WD_PULSE);
 	}
 
-	superio_exit(watchdog.sioaddr);
-exit_unlock:
-	mutex_unlock(&watchdog.lock);
+	superio_exit(wd->sioaddr);
 
 	return err;
 }
 
-static int watchdog_stop(void)
-{
-	int err = 0;
-
-	mutex_lock(&watchdog.lock);
-	err = superio_enter(watchdog.sioaddr);
-	if (err)
-		goto exit_unlock;
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
-
-	superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
-			F71808FG_FLAG_WD_EN);
-
-	superio_exit(watchdog.sioaddr);
-
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
-static bool watchdog_is_running(void)
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
+static int fintek_wdt_stop(struct watchdog_device *wdd)
 {
+	struct fintek_wdt *wd = watchdog_get_drvdata(wdd);
 	int err;
 
-	/* If the watchdog is alive we don't need to start it again */
-	if (test_and_set_bit(0, &watchdog.opened))
-		return -EBUSY;
-
-	err = watchdog_start();
-	if (err) {
-		clear_bit(0, &watchdog.opened);
+	err = superio_enter(wd->sioaddr);
+	if (err)
 		return err;
-	}
+	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
 
-	if (nowayout)
-		__module_get(THIS_MODULE);
-
-	watchdog.expect_close = 0;
-	return stream_open(inode, file);
-}
+	superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
+			  F71808FG_FLAG_WD_EN);
 
-static int watchdog_release(struct inode *inode, struct file *file)
-{
-	clear_bit(0, &watchdog.opened);
+	superio_exit(wd->sioaddr);
 
-	if (!watchdog.expect_close) {
-		watchdog_keepalive();
-		pr_crit("Unexpected close, not stopping watchdog!\n");
-	} else if (!nowayout) {
-		watchdog_stop();
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
-		watchdog_keepalive();
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
-{
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
-			watchdog_stop();
-
-		if (new_options & WDIOS_ENABLECARD)
-			return watchdog_start();
-		fallthrough;
-
-	case WDIOC_KEEPALIVE:
-		watchdog_keepalive();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_timeout, uarg.i))
-			return -EFAULT;
-
-		if (watchdog_set_timeout(new_timeout))
-			return -EINVAL;
-
-		watchdog_keepalive();
-		fallthrough;
-
-	case WDIOC_GETTIMEOUT:
-		return put_user(watchdog.timeout, uarg.i);
-
-	default:
-		return -ENOTTY;
-
-	}
-}
+static const struct watchdog_ops f71808e_wdog_ops = {
+	.owner = THIS_MODULE,
+	.start = fintek_wdt_start,
+	.stop = fintek_wdt_stop,
+	.ping = fintek_wdt_keepalive,
+	.set_timeout = fintek_wdt_set_timeout,
+};
 
-static int watchdog_notify_sys(struct notifier_block *this, unsigned long code,
-	void *unused)
+static bool fintek_wdt_is_running(struct fintek_wdt *wd, u8 wdt_conf)
 {
-	if (code == SYS_DOWN || code == SYS_HALT)
-		watchdog_stop();
-	return NOTIFY_DONE;
+	return (superio_inb(wd->sioaddr, SIO_REG_ENABLE) & BIT(0)) &&
+		(wdt_conf & BIT(F71808FG_FLAG_WD_EN));
 }
 
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
-};
-
 static int fintek_wdt_probe(struct platform_device *pdev)
 {
+	struct fintek_wdt *wd;
+	struct watchdog_device *wdd;
 	const struct platform_device_id *id;
-	unsigned short sioaddr;
 	struct resource *res;
 	int wdt_conf, err = 0;
 	const char *identity;
 
-	if (watchdog_miscdev.parent)
-		return -EBUSY;
-
-	watchdog_miscdev.parent = &pdev->dev;
-
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
 		return -ENXIO;
 
 	id = platform_get_device_id(pdev);
-	watchdog.variant = (void *)id->driver_data;
-	if (!watchdog.variant)
+	if (!id->driver_data)
 		return -ENODEV;
 
-	/* No need to lock watchdog.lock here because no entry points
-	 * into the module have been registered yet.
-	 */
-	watchdog.sioaddr = res->start;
-	watchdog.ident.options = WDIOF_MAGICCLOSE
+	wd = devm_kzalloc(&pdev->dev, sizeof(*wd), GFP_KERNEL);
+	if (!wd)
+		return -ENOMEM;
+
+	wd->sioaddr = res->start;
+	wd->variant = (void *)id->driver_data;
+	wd->ident.options = WDIOF_SETTIMEOUT
+				| WDIOF_MAGICCLOSE
 				| WDIOF_KEEPALIVEPING
 				| WDIOF_CARDRESET;
 
-	identity = watchdog.variant->identity_override ?: id->name;
+	identity = wd->variant->identity_override ?: id->name;
 
-	memcpy(watchdog.ident.identity, identity, sizeof(watchdog.ident.identity));
+	memcpy(wd->ident.identity, identity, sizeof(wd->ident.identity));
 
-	err = superio_enter(sioaddr);
+	err = superio_enter(wd->sioaddr);
 	if (err)
 		return err;
-	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
+	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
 
-	wdt_conf = superio_inb(sioaddr, F71808FG_REG_WDT_CONF);
-	watchdog.caused_reboot = wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS);
+	wdt_conf = superio_inb(wd->sioaddr, F71808FG_REG_WDT_CONF);
 
 	/*
 	 * We don't want WDTMOUT_STS to stick around till regular reboot.
 	 * Write 1 to the bit to clear it to zero.
 	 */
-	superio_outb(sioaddr, F71808FG_REG_WDT_CONF,
+	superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF,
 		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
 
-	superio_exit(sioaddr);
+	wdd = &wd->wdd;
 
-	err = watchdog_set_timeout(timeout);
-	if (err)
-		return err;
-	err = watchdog_set_pulse_width(pulse_width);
-	if (err)
-		return err;
+	if (fintek_wdt_is_running(wd, wdt_conf))
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+
+	superio_exit(wd->sioaddr);
 
-	err = register_reboot_notifier(&watchdog_notifier);
+	err = fintek_wdt_set_pulse_width(wd, pulse_width);
 	if (err)
 		return err;
 
-	err = misc_register(&watchdog_miscdev);
-	if (err) {
-		pr_err("cannot register miscdev on minor=%d\n",
-		       watchdog_miscdev.minor);
-		goto exit_reboot;
-	}
-
-	if (start_withtimeout) {
-		if (start_withtimeout <= 0
-		 || start_withtimeout >  max_timeout) {
-			pr_err("starting timeout out of range\n");
-			err = -EINVAL;
-			goto exit_miscdev;
-		}
-
-		err = watchdog_start();
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
-
-		superio_exit(sioaddr);
-		mutex_unlock(&watchdog.lock);
+	wdd->info		= &wd->ident;
+	wdd->ops		= &f71808e_wdog_ops;
+	wdd->min_timeout	= 1;
+	wdd->max_timeout	= max_timeout;
+	wdd->timeout		= timeout;
 
-		if (nowayout)
-			__module_get(THIS_MODULE);
+	watchdog_set_nowayout(wdd, nowayout);
+	watchdog_stop_on_unregister(wdd);
+	watchdog_stop_on_reboot(wdd);
+	watchdog_init_timeout(wdd, start_withtimeout, NULL);
+	watchdog_set_drvdata(wdd, wd);
+	platform_set_drvdata(pdev, wd);
 
-		pr_info("watchdog started with initial timeout of %u sec\n",
-			start_withtimeout);
-	}
-
-	return 0;
+	if (wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS))
+		wdd->bootstatus	= WDIOF_CARDRESET;
 
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
+	fintek_wdt_set_timeout(wdd, wdd->timeout);
 
-	return err;
+	return devm_watchdog_register_device(&pdev->dev, wdd);
 }
 
 static void f71808fg_pinconf(struct fintek_wdt *wd)
@@ -817,20 +543,8 @@ MODULE_DEVICE_TABLE(platform, fintek_wdt_id_table);
  */
 static const u16 fintek_no_wdt_table[] = { SIO_F71858_ID, 0 };
 
-static int fintek_wdt_remove(struct platform_device *pdev)
-{
-	if (watchdog_is_running()) {
-		pr_warn("Watchdog timer still running, stopping it\n");
-		watchdog_stop();
-	}
-	misc_deregister(&watchdog_miscdev);
-	unregister_reboot_notifier(&watchdog_notifier);
-	return 0;
-}
-
 static struct platform_driver fintek_wdt_driver = {
 	.probe		= fintek_wdt_probe,
-	.remove		= fintek_wdt_remove,
 	.id_table	= fintek_wdt_id_table,
 	.driver		= {
 		.name	= DRVNAME,
-- 
2.28.0

