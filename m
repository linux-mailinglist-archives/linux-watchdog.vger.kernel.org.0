Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584207B835
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 05:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387434AbfGaDWM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 23:22:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34639 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387431AbfGaDWM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 23:22:12 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so30987921pfo.1;
        Tue, 30 Jul 2019 20:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nBWl2xwsioinj7HQx/0USPAjfSjfPLNSQosjoNDCWPg=;
        b=d/635PA0vQPhXAjv4UcCqBSTGokBwGIZFl/4kX61sGo6xANqjrZk9QhKPJl5YUCoa2
         hEMYC4eQbhB074U29GInW3hnIguJWsxq0Vi3wTBdMhEyRZKHOV7QZpjWLVH8rTc6lXhu
         lWSVuVWRURhEEgdv1XUb0IO5h+EwFzoyZ/L1+jhRswy+dMbhyArdPgVch9xOb5hCYHno
         MJtycP0rcdcf7K4wHSIHF9OLiiasnnj7QdgVbcpUpQCgiWfY+91R1c3AaX9m27dACnc9
         2dJPnDhA36bmswieBaJB78B9jgiPj1TDsTf8xP1aen/+hnpgZmPQOgUfCjVrZ5F1H4fw
         zPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nBWl2xwsioinj7HQx/0USPAjfSjfPLNSQosjoNDCWPg=;
        b=H73w6WQD1h7/47q7SEslBYkgs0LBRDykIs0PhPC5nFsT0dXDZkvWnXHSkM0ztEJCV7
         Aa83FwNQ49tMLbPaSxub00jPhnGtYBYspcO7AbzYKPma/MmoYFVep1lkTd67reinmrLS
         fyqugt8waUP2Dm4pPrMwEsLnCFI20/0EpN1n1LLfndpcyYCAOvZUYAD0RJJ/apINxpmh
         cfTDoKUVGhp+quMvtRGLfpKyyGg3/h9RQl7iEEIsGMEr3PjHhRte4jDS0qAh/5apabZF
         QngyIUdNrumyV9TG42gR7wwuEJ3bYYiXSdKZmQjHL7QS5ROCO+OiuZxqTt937ERCE5fH
         ni0g==
X-Gm-Message-State: APjAAAUxdPLB8mP26blWHjMTSZnxdFN4efJtVBvQQ+fX8sY6Vp4PEyDG
        raye7duFt0wFO3VvCLHvQJg=
X-Google-Smtp-Source: APXvYqyrVS/cG9fT72Ox9QVoMkhM6mPdwEtMWuW50Qytp0NcqHJBSKoxOFA4ZQhkypuxalUI7e4tbw==
X-Received: by 2002:a17:90a:fe5:: with SMTP id 92mr615133pjz.35.1564543331741;
        Tue, 30 Jul 2019 20:22:11 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id x7sm2052885pga.0.2019.07.30.20.22.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 20:22:11 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru,
        Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH] watchdog: pc87413: Rewriting of pc87413_wdt driver to use watchdog subsystem
Date:   Tue, 30 Jul 2019 20:22:04 -0700
Message-Id: <20190731032204.78951-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch rewrites the pc87413_wdt driver to use the watchdog subsystem. In
doing so, it also addresses a potential race condition owing from the
swc_base_addr variable being used before being set.

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>

---
 drivers/watchdog/Kconfig       |   1 +
 drivers/watchdog/pc87413_wdt.c | 323 ++++-----------------------------
 2 files changed, 40 insertions(+), 284 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9af07fd9..84a7326d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1166,6 +1166,7 @@ config SCx200_WDT
 
 config PC87413_WDT
 	tristate "NS PC87413 watchdog"
+	select WATCHDOG_CORE
 	depends on X86
 	---help---
 	  This is the driver for the hardware watchdog on the PC87413 chipset
diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index 06a892e3..60e3cda6 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -22,15 +22,9 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/ioport.h>
 #include <linux/delay.h>
-#include <linux/notifier.h>
-#include <linux/fs.h>
-#include <linux/reboot.h>
-#include <linux/init.h>
-#include <linux/spinlock.h>
 #include <linux/moduleparam.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
@@ -60,13 +54,9 @@ static int swc_base_addr = -1;
 
 static int timeout = DEFAULT_TIMEOUT;	/* timeout value */
 static unsigned long timer_enabled;	/* is the timer enabled? */
-
-static char expect_close;		/* is the close expected? */
-
-static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */
-
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
+
 /* -- Low level function ----------------------------------------*/
 
 /* Select pins for Watchdog output */
@@ -151,13 +141,15 @@ static inline void pc87413_swc_bank3(void)
 
 /* Set watchdog timeout to x minutes */
 
-static inline void pc87413_programm_wdto(char pc87413_time)
+static int pc87413_set_timeout(struct watchdog_device *wdd, unsigned int t)
 {
-	/* Step 5: Programm WDTO, Twd. */
-	outb_p(pc87413_time, swc_base_addr + WDTO);
-#ifdef DEBUG
-	pr_info(DPFX "Set WDTO to %d minutes\n", pc87413_time);
-#endif
+	/* Step 5: Programm watchdog timeout */
+
+	if ((t < 1) || ( t > 60))    /* arbitrary upper limit */
+	return -EINVAL;
+	
+	timeout = t;
+	return 0;
 }
 
 /* Enable WDEN */
@@ -216,281 +208,61 @@ static inline void pc87413_disable_sw_wd_trg(void)
 
 /* -- Higher level functions ------------------------------------*/
 
-/* Enable the watchdog */
+/* Enable/start the watchdog */
 
-static void pc87413_enable(void)
+static int pc87413_start(struct watchdog_device *wdd)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
-	pc87413_programm_wdto(timeout);
+	pc87413_set_timeout(wdd,timeout);
 	pc87413_enable_wden();
 	pc87413_enable_sw_wd_tren();
 	pc87413_enable_sw_wd_trg();
-
-	spin_unlock(&io_lock);
+	return 0;
 }
 
-/* Disable the watchdog */
+/* Disable/stop the watchdog */
 
-static void pc87413_disable(void)
+static int pc87413_stop(struct watchdog_device *wdd)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_disable_sw_wd_tren();
 	pc87413_disable_sw_wd_trg();
-	pc87413_programm_wdto(0);
-
-	spin_unlock(&io_lock);
+	pc87413_set_timeout(wdd,0);
+	return 0;
 }
 
-/* Refresh the watchdog */
+/* Refresh/keepalive the watchdog */
 
-static void pc87413_refresh(void)
+static int pc87413_keepalive(struct watchdog_device *wdd)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_disable_sw_wd_tren();
 	pc87413_disable_sw_wd_trg();
-	pc87413_programm_wdto(timeout);
+	pc87413_set_timeout(wdd,timeout);
 	pc87413_enable_wden();
 	pc87413_enable_sw_wd_tren();
 	pc87413_enable_sw_wd_trg();
-
-	spin_unlock(&io_lock);
-}
-
-/* -- File operations -------------------------------------------*/
-
-/**
- *	pc87413_open:
- *	@inode: inode of device
- *	@file: file handle to device
- *
- */
-
-static int pc87413_open(struct inode *inode, struct file *file)
-{
-	/* /dev/watchdog can only be opened once */
-
-	if (test_and_set_bit(0, &timer_enabled))
-		return -EBUSY;
-
-	if (nowayout)
-		__module_get(THIS_MODULE);
-
-	/* Reload and activate timer */
-	pc87413_refresh();
-
-	pr_info("Watchdog enabled. Timeout set to %d minute(s).\n", timeout);
-
-	return nonseekable_open(inode, file);
-}
-
-/**
- *	pc87413_release:
- *	@inode: inode to board
- *	@file: file handle to board
- *
- *	The watchdog has a configurable API. There is a religious dispute
- *	between people who want their watchdog to be able to shut down and
- *	those who want to be sure if the watchdog manager dies the machine
- *	reboots. In the former case we disable the counters, in the latter
- *	case you have to open it again very soon.
- */
-
-static int pc87413_release(struct inode *inode, struct file *file)
-{
-	/* Shut off the timer. */
-
-	if (expect_close == 42) {
-		pc87413_disable();
-		pr_info("Watchdog disabled, sleeping again...\n");
-	} else {
-		pr_crit("Unexpected close, not stopping watchdog!\n");
-		pc87413_refresh();
-	}
-	clear_bit(0, &timer_enabled);
-	expect_close = 0;
 	return 0;
 }
 
-/**
- *	pc87413_status:
- *
- *      return, if the watchdog is enabled (timeout is set...)
- */
-
-
-static int pc87413_status(void)
-{
-	  return 0; /* currently not supported */
-}
-
-/**
- *	pc87413_write:
- *	@file: file handle to the watchdog
- *	@data: data buffer to write
- *	@len: length in bytes
- *	@ppos: pointer to the position to write. No seeks allowed
- *
- *	A write to a watchdog device is defined as a keepalive signal. Any
- *	write of data will do, as we we don't define content meaning.
- */
-
-static ssize_t pc87413_write(struct file *file, const char __user *data,
-			     size_t len, loff_t *ppos)
-{
-	/* See if we got the magic character 'V' and reload the timer */
-	if (len) {
-		if (!nowayout) {
-			size_t i;
-
-			/* reset expect flag */
-			expect_close = 0;
-
-			/* scan to see whether or not we got the
-			   magic character */
-			for (i = 0; i != len; i++) {
-				char c;
-				if (get_user(c, data + i))
-					return -EFAULT;
-				if (c == 'V')
-					expect_close = 42;
-			}
-		}
-
-		/* someone wrote to us, we should reload the timer */
-		pc87413_refresh();
-	}
-	return len;
-}
-
-/**
- *	pc87413_ioctl:
- *	@file: file handle to the device
- *	@cmd: watchdog command
- *	@arg: argument pointer
- *
- *	The watchdog API defines a common set of functions for all watchdogs
- *	according to their available features. We only actually usefully support
- *	querying capabilities and current status.
- */
-
-static long pc87413_ioctl(struct file *file, unsigned int cmd,
-						unsigned long arg)
-{
-	int new_timeout;
-
-	union {
-		struct watchdog_info __user *ident;
-		int __user *i;
-	} uarg;
-
-	static const struct watchdog_info ident = {
-		.options          = WDIOF_KEEPALIVEPING |
-				    WDIOF_SETTIMEOUT |
-				    WDIOF_MAGICCLOSE,
-		.firmware_version = 1,
-		.identity         = "PC87413(HF/F) watchdog",
-	};
-
-	uarg.i = (int __user *)arg;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(uarg.ident, &ident,
-					sizeof(ident)) ? -EFAULT : 0;
-	case WDIOC_GETSTATUS:
-		return put_user(pc87413_status(), uarg.i);
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, uarg.i);
-	case WDIOC_SETOPTIONS:
-	{
-		int options, retval = -EINVAL;
-		if (get_user(options, uarg.i))
-			return -EFAULT;
-		if (options & WDIOS_DISABLECARD) {
-			pc87413_disable();
-			retval = 0;
-		}
-		if (options & WDIOS_ENABLECARD) {
-			pc87413_enable();
-			retval = 0;
-		}
-		return retval;
-	}
-	case WDIOC_KEEPALIVE:
-		pc87413_refresh();
-#ifdef DEBUG
-		pr_info(DPFX "keepalive\n");
-#endif
-		return 0;
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_timeout, uarg.i))
-			return -EFAULT;
-		/* the API states this is given in secs */
-		new_timeout /= 60;
-		if (new_timeout < 0 || new_timeout > MAX_TIMEOUT)
-			return -EINVAL;
-		timeout = new_timeout;
-		pc87413_refresh();
-		/* fall through and return the new timeout... */
-	case WDIOC_GETTIMEOUT:
-		new_timeout = timeout * 60;
-		return put_user(new_timeout, uarg.i);
-	default:
-		return -ENOTTY;
-	}
-}
-
-/* -- Notifier funtions -----------------------------------------*/
-
-/**
- *	notify_sys:
- *	@this: our notifier block
- *	@code: the event being reported
- *	@unused: unused
- *
- *	Our notifier is called on system shutdowns. We want to turn the card
- *	off at reboot otherwise the machine will reboot again during memory
- *	test or worse yet during the following fsck. This would suck, in fact
- *	trust me - if it happens it does suck.
- */
-
-static int pc87413_notify_sys(struct notifier_block *this,
-			      unsigned long code,
-			      void *unused)
-{
-	if (code == SYS_DOWN || code == SYS_HALT)
-		/* Turn the card off */
-		pc87413_disable();
-	return NOTIFY_DONE;
-}
 
 /* -- Module's structures ---------------------------------------*/
 
-static const struct file_operations pc87413_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.write		= pc87413_write,
-	.unlocked_ioctl	= pc87413_ioctl,
-	.open		= pc87413_open,
-	.release	= pc87413_release,
-};
 
-static struct notifier_block pc87413_notifier = {
-	.notifier_call  = pc87413_notify_sys,
+static struct watchdog_ops pc87413wdt_ops = {
+       	.owner = THIS_MODULE,
+       	.start = pc87413_start,
+       	.stop = pc87413_stop,
+       	.ping = pc87413_keepalive,
+	.set_timeout = pc87413_set_timeout,
 };
 
-static struct miscdevice pc87413_miscdev = {
-	.minor          = WATCHDOG_MINOR,
-	.name           = "watchdog",
-	.fops           = &pc87413_fops,
+static struct watchdog_device pc87413wdt_wdd = {
+       	.ops = &pc87413wdt_ops,
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
 };
 
+
 /* -- Module init functions -------------------------------------*/
 
 /**
@@ -498,7 +270,6 @@ static struct miscdevice pc87413_miscdev = {
  *
  *	Set up the WDT watchdog board. All we have to do is grab the
  *	resources we require and bitch if anyone beat us to them.
- *	The open() function will actually kick the board off.
  */
 
 static int __init pc87413_init(void)
@@ -508,20 +279,16 @@ static int __init pc87413_init(void)
 	pr_info("Version " VERSION " at io 0x%X\n",
 							WDT_INDEX_IO_PORT);
 
+	watchdog_set_nowayout(&pc87413wdt_wdd,nowayout);
+
 	if (!request_muxed_region(io, 2, MODNAME))
 		return -EBUSY;
 
-	ret = register_reboot_notifier(&pc87413_notifier);
-	if (ret != 0)
-		pr_err("cannot register reboot notifier (err=%d)\n", ret);
-
-	ret = misc_register(&pc87413_miscdev);
+	watchdog_stop_on_reboot(&pc87413wdt_wdd);
+	ret = watchdog_register_device(&pc87413wdt_wdd);
 	if (ret != 0) {
-		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
-		       WATCHDOG_MINOR, ret);
 		goto reboot_unreg;
-	}
-	pr_info("initialized. timeout=%d min\n", timeout);
+	}	pr_info("initialized. timeout=%d min\n", timeout);
 
 	pc87413_select_wdt_out();
 	pc87413_enable_swc();
@@ -530,20 +297,16 @@ static int __init pc87413_init(void)
 	if (!request_region(swc_base_addr, 0x20, MODNAME)) {
 		pr_err("cannot request SWC region at 0x%x\n", swc_base_addr);
 		ret = -EBUSY;
-		goto misc_unreg;
+		goto watchdog_unreg;
 	}
 
-	pc87413_enable();
-
 	release_region(io, 2);
 	return 0;
-
-misc_unreg:
-	misc_deregister(&pc87413_miscdev);
 reboot_unreg:
-	unregister_reboot_notifier(&pc87413_notifier);
 	release_region(io, 2);
 	return ret;
+watchdog_unreg:
+	watchdog_unregister_device(&pc87413wdt_wdd);
 }
 
 /**
@@ -558,14 +321,7 @@ reboot_unreg:
 
 static void __exit pc87413_exit(void)
 {
-	/* Stop the timer before we leave */
-	if (!nowayout) {
-		pc87413_disable();
-		pr_info("Watchdog disabled\n");
-	}
-
-	misc_deregister(&pc87413_miscdev);
-	unregister_reboot_notifier(&pc87413_notifier);
+	watchdog_unregister_device(&pc87413wdt_wdd);
 	release_region(swc_base_addr, 0x20);
 
 	pr_info("watchdog component driver removed\n");
@@ -592,4 +348,3 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout,
 		"Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-
-- 
2.17.1

