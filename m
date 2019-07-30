Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CFB79F9D
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 05:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfG3Du6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 23:50:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40540 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfG3Du5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 23:50:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so29078076pfp.7;
        Mon, 29 Jul 2019 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gZPcst755ZH8kSTdN6Uh9i6ZgRiGayoj8nm1CdE96Jo=;
        b=rVYMalGxO9FEE+AAuCXluT0iPTAKLNodocHR58VeVSv/Y7vJaezHJKRTydfKn9IEyd
         GR90/mU6kO3+W4Ob46Umz0eV3fS4XhWjdiSUaWqczmPfCjE0QUPLSWvCeZfYiQJ4Fqev
         QD4GIVAwtbiWQ5EmHNkWI+Fiem/JT+o4rmL70KEBdb41jpM0R6k6sYI4+TK9nLL4Vy4L
         wG/QWtW6RUikud/cqvQmjTtjdNGr2wv0brctrbUKDcDsuwn4LDkvCp1qxOHIM/trq6pT
         NMwkSu9NiGMOrhqYlrrUXiqdLKVbe68KZubO/iQDp9lhQu7L1qBu4ALMFhBSBXWmZu9u
         34sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gZPcst755ZH8kSTdN6Uh9i6ZgRiGayoj8nm1CdE96Jo=;
        b=skeoYHrew7trOGYcS6teS0jTruA3Ogcy7CLB2RTt0GZrmKB9q250GkHVcTb7bMyzzb
         Ra9A5w8qVYhu9TQc+cq9VYA8R2UzKxtL2RTX6swyBtkdSfjR+dJpFRnKq/gVpTmzmYkc
         O8gvSkEuhhQczvf7ErfPXjEpEMghRzUjtpy5qYeL2G6jk/k4nR03fWlQVrmo0R3gjP8g
         HDX7MMuayHtiiNWFomClYPw/FZjvYYLMhdR+6PgLxuEsaFFdjY1Vi+JK6UfQ1uG/oK34
         Ilattj7T2XQWxb2zjuKN3qSxnN1ArIf1+yvXIF2Oh+UEEuT8ubYzGKnfd56mcRacsF8m
         3mTA==
X-Gm-Message-State: APjAAAXAwNC7w7prUSUZBNeI6irsnFxg03TiKTLyYjLC9QhJhuGJMiJ7
        YcZHmZf8jKrNjt5MrowCZiw=
X-Google-Smtp-Source: APXvYqxDlDx2OuTDokFR5Tno0rOb7cnnejgOYK1eMK30Gl0+wCcRTObz+ou5I0N0Z/LaBtmKOP3clw==
X-Received: by 2002:aa7:8189:: with SMTP id g9mr40490264pfi.143.1564458656874;
        Mon, 29 Jul 2019 20:50:56 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id 185sm63183322pfd.125.2019.07.29.20.50.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 20:50:56 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru,
        Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH] Revision of pc87413_wdt driver to use watchdog subsystem
Date:   Mon, 29 Jul 2019 20:50:50 -0700
Message-Id: <20190730035050.15321-1-mbalant3@gmail.com>
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
 drivers/watchdog/pc87413_wdt.c | 294 +++++----------------------------
 2 files changed, 39 insertions(+), 256 deletions(-)

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
index 06a892e3..d1d32771 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -22,12 +22,10 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/notifier.h>
-#include <linux/fs.h>
 #include <linux/reboot.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
@@ -65,7 +63,6 @@ static char expect_close;		/* is the close expected? */
 
 static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */
 
-static bool nowayout = WATCHDOG_NOWAYOUT;
 
 /* -- Low level function ----------------------------------------*/
 
@@ -216,41 +213,32 @@ static inline void pc87413_disable_sw_wd_trg(void)
 
 /* -- Higher level functions ------------------------------------*/
 
-/* Enable the watchdog */
+/* Enable/start the watchdog */
 
-static void pc87413_enable(void)
+static void pc87413_start(void)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_programm_wdto(timeout);
 	pc87413_enable_wden();
 	pc87413_enable_sw_wd_tren();
 	pc87413_enable_sw_wd_trg();
 
-	spin_unlock(&io_lock);
 }
 
-/* Disable the watchdog */
+/* Disable/stop the watchdog */
 
-static void pc87413_disable(void)
+static void pc87413_stop(void)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_disable_sw_wd_tren();
 	pc87413_disable_sw_wd_trg();
 	pc87413_programm_wdto(0);
-
-	spin_unlock(&io_lock);
 }
 
-/* Refresh the watchdog */
+/* Refresh/keepalive the watchdog */
 
-static void pc87413_refresh(void)
+static void pc87413_keepalive(struct watchdog_device *wdd)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_disable_sw_wd_tren();
 	pc87413_disable_sw_wd_trg();
@@ -258,195 +246,11 @@ static void pc87413_refresh(void)
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
 
-/* -- Notifier funtions -----------------------------------------*/
+/* -- Notifier functions -----------------------------------------*/
 
 /**
  *	notify_sys:
@@ -460,37 +264,43 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
  *	trust me - if it happens it does suck.
  */
 
-static int pc87413_notify_sys(struct notifier_block *this,
-			      unsigned long code,
-			      void *unused)
+
+/* -- Module's structures ---------------------------------------*/
+
+
+static int watchdog_restart_notifier(struct notifier_block *nb,
+				    unsigned long code, void *data)
 {
-	if (code == SYS_DOWN || code == SYS_HALT)
-		/* Turn the card off */
-		pc87413_disable();
+	struct watchdog_device *wdd = container_of(nb, struct watchdog_device,
+						   reboot_nb);
+
+	if (code == SYS_DOWN || code == SYS_HALT) {
+		int ret;
+
+		ret = wdd->ops->stop(wdd);
+		if (ret)
+			return NOTIFY_BAD;
+	}
+
 	return NOTIFY_DONE;
 }
 
-/* -- Module's structures ---------------------------------------*/
 
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
+	.restart = watchdog_restart_notifier,
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
@@ -498,7 +308,6 @@ static struct miscdevice pc87413_miscdev = {
  *
  *	Set up the WDT watchdog board. All we have to do is grab the
  *	resources we require and bitch if anyone beat us to them.
- *	The open() function will actually kick the board off.
  */
 
 static int __init pc87413_init(void)
@@ -511,16 +320,7 @@ static int __init pc87413_init(void)
 	if (!request_muxed_region(io, 2, MODNAME))
 		return -EBUSY;
 
-	ret = register_reboot_notifier(&pc87413_notifier);
-	if (ret != 0)
-		pr_err("cannot register reboot notifier (err=%d)\n", ret);
-
-	ret = misc_register(&pc87413_miscdev);
-	if (ret != 0) {
-		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
-		       WATCHDOG_MINOR, ret);
-		goto reboot_unreg;
-	}
+	ret = watchdog_register_device(&pc87413wdt_wdd);
 	pr_info("initialized. timeout=%d min\n", timeout);
 
 	pc87413_select_wdt_out();
@@ -533,17 +333,12 @@ static int __init pc87413_init(void)
 		goto misc_unreg;
 	}
 
-	pc87413_enable();
-
 	release_region(io, 2);
+	pc87413_keepalive(&pc87413wdt_wdd);
 	return 0;
 
 misc_unreg:
-	misc_deregister(&pc87413_miscdev);
-reboot_unreg:
-	unregister_reboot_notifier(&pc87413_notifier);
-	release_region(io, 2);
-	return ret;
+	watchdog_unregister_device(&pc87413wdt_wdd);
 }
 
 /**
@@ -558,14 +353,7 @@ reboot_unreg:
 
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
@@ -587,9 +375,3 @@ module_param(timeout, int, 0);
 MODULE_PARM_DESC(timeout,
 		"Watchdog timeout in minutes (default="
 				__MODULE_STRING(DEFAULT_TIMEOUT) ").");
-
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout,
-		"Watchdog cannot be stopped once started (default="
-				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-
-- 
2.17.1

