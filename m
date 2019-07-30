Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE95979E80
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 04:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731125AbfG3CPz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 22:15:55 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34648 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbfG3CPy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 22:15:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so22973887pgc.1;
        Mon, 29 Jul 2019 19:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNQ2dTQynjWYzeUQMx7021f2qWtQZMIgO8E/5z+cVeo=;
        b=AIRmsECPdjdfYinyOfyi1+xTLdWg+3fyopu9nCOS8ciZSOQ3KulZEivS1+CF+z1iR6
         reHSWUxtelRN6AA7cRCcaTF94sr9oZXRiK9MLRB3Z4E1tUw4swNxXW5yQtTeAGdoXAPl
         3POirToQ5wDfQcX6Zitzg24CD7CD//6rej/BDleXkZHR6UckbetR5hwm5lxiSHBawAWu
         2b5QNPmypjrg0sUOCCw2D3ByxlnfMCclgMbwc/sKuUyt3eZmLVQxJVW4SSbWCs0I2RPE
         PeJpN5W7GcN42Nt69Y+vM/8yRdxnG/O40z5yXEPmJQiJn5yudXKBEPRmuyhvsSYuNSF0
         Jplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNQ2dTQynjWYzeUQMx7021f2qWtQZMIgO8E/5z+cVeo=;
        b=NW/3DO4r4K+/tL8aGNYyKMirVd0U4S+KTx40BfcxL9UiP6Y+v3hCfviAq4gjSQMbDn
         /vUJAing6PfrZ+eFWfjglBFjYVPIs+P0AgjuXepQI6BCtmxm62SgGChy+zgsJklnmsJB
         nVQ7jZt3whzZvHLmn8lIGjMZkq+qMjR92wS1OeRkUg2j7UYNFZZH5epFsKrIE+SAsgJN
         peI4rlYgTXCLs8KoiGEroRJ3lMrsW6emXUE7UH7SWCePDWuW5tVPVFytNeoty1qkEn/b
         c4zWJILIfWubin4PebIjd6rXtZ58+g2PoEtgqxCKTYrZENIm1CCCAQ15eI6MTg9MrROw
         nzPQ==
X-Gm-Message-State: APjAAAW69YcbJVeLYdL2R4+rIdr88KX/dkRi8RU46x70yWaPxvkSCWvg
        2P2cIlGj/xyA6yWTDa78gtM=
X-Google-Smtp-Source: APXvYqwMtamwq9KUTZXJqIsp1iolz8Lx0H1tSkCfL+t881J+67HsmBNG/201ZX1h2cTBbmFo3xKh5g==
X-Received: by 2002:a17:90a:2190:: with SMTP id q16mr111121160pjc.23.1564452953762;
        Mon, 29 Jul 2019 19:15:53 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id x13sm66561133pfn.6.2019.07.29.19.15.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 19:15:53 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru,
        Mark Balantzyan <mbalant3@gmail.com>
Subject: [PATCH 2/4] watchdog device drivers:pc87413_wdt:Rewriting of pc87413_wdt driver to utilize common watchdog interface, with removal of file access functions for correct functionality
Date:   Mon, 29 Jul 2019 19:15:38 -0700
Message-Id: <20190730021540.66579-2-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730021540.66579-1-mbalant3@gmail.com>
References: <20190730021540.66579-1-mbalant3@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is a potential for the variable swc_base_addr in the call chain of the
driver initialization function (init) to be used before initialization. This
brought up the need for, by rewriting the driver to use the common watchdog
interface, ensuring to have all resources in place. This patch addresses this
need by rewriting into common watchdog interface utilization for the driver.

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>

---
 drivers/watchdog/pc87413_wdt.c | 235 +++------------------------------
 1 file changed, 22 insertions(+), 213 deletions(-)

diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index 4c330ee5..a9070a22 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -217,37 +217,28 @@ static inline void pc87413_disable_sw_wd_trg(void)
 
 static void pc87413_start(void)
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
 
 /* Disable/stop the watchdog */
 
 static void pc87413_stop(void)
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
 
 /* Refresh/keepalive the watchdog */
 
 static void pc87413_keepalive(struct watchdog_device *wdd)
 {
-	spin_lock(&io_lock);
-
 	pc87413_swc_bank3();
 	pc87413_disable_sw_wd_tren();
 	pc87413_disable_sw_wd_trg();
@@ -255,192 +246,11 @@ static void pc87413_keepalive(struct watchdog_device *wdd)
 	pc87413_enable_wden();
 	pc87413_enable_sw_wd_tren();
 	pc87413_enable_sw_wd_trg();
-
-	spin_unlock(&io_lock);
-
 	return 0;
 }
 
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
-	return 0;
-}
-
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
-		size_t i;
-
-		/* reset expect flag */
-		expect_close = 0;
-
-		/* scan to see whether or not we got the
-		   magic character */
-		for (i = 0; i != len; i++) {
-			char c;
-			if (get_user(c, data + i))
-				return -EFAULT;
-			if (c == 'V')
-				expect_close = 42;
-		}
-	}
-
-		/* someone wrote to us, we should reload the timer */
-	pc87413_refresh();
-	
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
-			pc87413_start();
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
+/* -- Notifier functions -----------------------------------------*/
 
 /**
  *	notify_sys:
@@ -454,22 +264,28 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
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
-		pc87413_stop();
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
-
 
-static struct notifier_block pc87413wdt_notifier = {
-	.notifier_call  = pc87413_notify_sys,
-};
 
 static struct watchdog_ops pc87413wdt_ops = {
        .owner = THIS_MODULE,
@@ -482,7 +298,9 @@ static struct watchdog_ops pc87413wdt_ops = {
 static struct watchdog_device pc87413wdt_wdd = {
        	.info = &pc87413wdt_ident,
        	.ops = &pc87413wdt_ops,
-	.status = WATCHDOG_NOWAYOUT_INIT_STATUS
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+	.exit = pc87413_exit,
+	.restart = watchdog_restart_notifier,
 };
 
 
@@ -493,7 +311,6 @@ static struct watchdog_device pc87413wdt_wdd = {
  *
  *	Set up the WDT watchdog board. All we have to do is grab the
  *	resources we require and bitch if anyone beat us to them.
- *	The open() function will actually kick the board off.
  */
 
 static int __init pc87413_init(void)
@@ -528,8 +345,6 @@ static int __init pc87413_init(void)
 		goto misc_unreg;
 	}
 
-	pc87413_start();
-
 	release_region(io, 2);
 	pc87413_keepalive(&pc87413wdt_wdd);
 	return 0;
@@ -554,13 +369,7 @@ reboot_unreg:
 
 static void __exit pc87413_exit(void)
 {
-	/* Stop the timer before we leave */
-	if (!nowayout) {
-		pc87413_disable();
-		pr_info("Watchdog disabled\n");
-	}
-
-	misc_deregister(&pc87413_miscdev);
+	watchdog_unregister_device(&pc87413wdt_wdd);
 	unregister_reboot_notifier(&pc87413_notifier);
 	release_region(swc_base_addr, 0x20);
 
-- 
2.17.1

