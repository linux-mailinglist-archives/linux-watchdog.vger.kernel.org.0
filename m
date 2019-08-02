Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D99897EB02
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 06:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbfHBEMZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Aug 2019 00:12:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45169 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbfHBEMZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Aug 2019 00:12:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so35291296pfq.12;
        Thu, 01 Aug 2019 21:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pl1xBiXQddy0n6Vatcuj8yww3WNhjnv49ZabwrJJpaE=;
        b=LteB0cYYPa4x1GcXjRILApmB8u/Md/yCnCyKQBaWg9MqUt4Sechz+rY63XlCGPxc5j
         NiZ0PHzDEic7N+dvE+vriMi7SLP4Rv4+Y3jyWW0dYnzahwz32PysuMYBYYat9z+mEgHB
         7K6X8lMBPecKRyE/b4QLKc8Hcew6nRNKBkPmLyus99+4AcEYV1jHGdsiiYgqC0qxrtUl
         H62wtBuR/K/kpnRjPpFhH8rzNfY+rnD4kTBqfDJpRFwbiOE0D4H1exOQrOrvV4xw0ggb
         RsD9M8zw8/jhxDvfY3s/MPJIDIzDwaKlYwgyoWQuFBzxGEEwElvq7fbVyTLYkm6clHJ+
         Y1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pl1xBiXQddy0n6Vatcuj8yww3WNhjnv49ZabwrJJpaE=;
        b=Q76pyVau/xfXTeeWGtGJ9Y1TsrK9I+EMmqDITVaZMnntBpQvsnTswlvW3qQyKwXtpF
         7Kelbi12gVtVAipN0DT27BFW/9zFl9XSeh1h1rWRuQa+rQPDjuVaKSkXMZ1CASww1G/k
         GRSX6Rdp72GvLCTRUXo3coggQyGm+b6uWLR7tIUZP3mpg6xTQkztIunO3JCJrshkQ1TS
         mcIROVfHctkjM4pswkEGnBSt26I6rfc+b+p5UOvycuOZe1vd8uTV41xyHTjWEpmTgVU4
         2cLIWGlLW/9WN6qEwk8NaprmbecBuZYznxiyJq1zu1LpdYyqoSARX5S/lc7UqoE03Uiw
         ABSA==
X-Gm-Message-State: APjAAAWS+UKF0qM0HjG8w50J535cnLQAIXc6mi97QsvJBEYxBGUfH+3M
        s/fJKM5Y0IPX/He6tU8xUHk=
X-Google-Smtp-Source: APXvYqyN7aNnW5eShqcyYemjFQ6CB8eMgot41TXqUNDFx1OoZkz4+ucWvGP32k+D4DTj7SkA68XPmQ==
X-Received: by 2002:a63:c748:: with SMTP id v8mr91349551pgg.418.1564719143837;
        Thu, 01 Aug 2019 21:12:23 -0700 (PDT)
Received: from localhost.localdomain (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id w18sm92797061pfj.37.2019.08.01.21.12.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 21:12:23 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
To:     linux@roeck-us.net
Cc:     mbalant3@gmail.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] watchdog: alim1535: Rewriting of alim1535 driver to use watchdog subsystem
Date:   Thu,  1 Aug 2019 21:12:18 -0700
Message-Id: <20190802041218.66127-1-mbalant3@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch rewrites the alim1535_wdt driver to use the watchdog subsystem.
By virtue of this, it also fixes a (theoretical) race condition between the
formerly arranged ali_timeout_bits and ali_settimer() interoperation.

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>

---
 drivers/watchdog/Kconfig        |   1 +
 drivers/watchdog/alim1535_wdt.c | 294 ++++++--------------------------
 2 files changed, 50 insertions(+), 245 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 9af07fd9..980b0c90 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -853,6 +853,7 @@ config ADVANTECH_WDT
 
 config ALIM1535_WDT
 	tristate "ALi M1535 PMU Watchdog Timer"
+	select WATCHDOG_CORE
 	depends on X86 && PCI
 	---help---
 	  This is the driver for the hardware watchdog on the ALi M1535 PMU.
diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
index 60f0c2eb..747ba12c 100644
--- a/drivers/watchdog/alim1535_wdt.c
+++ b/drivers/watchdog/alim1535_wdt.c
@@ -12,29 +12,20 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
-#include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/ioport.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/init.h>
-#include <linux/fs.h>
 #include <linux/pci.h>
-#include <linux/uaccess.h>
-#include <linux/io.h>
 
 #define WATCHDOG_NAME "ALi_M1535"
 #define WATCHDOG_TIMEOUT 60	/* 60 sec default timeout */
 
 /* internal variables */
-static unsigned long ali_is_open;
-static char ali_expect_release;
 static struct pci_dev *ali_pci;
 static u32 ali_timeout_bits;		/* stores the computed timeout */
 static DEFINE_SPINLOCK(ali_lock);	/* Guards the hardware */
 
 /* module parameters */
-static int timeout = WATCHDOG_TIMEOUT;
+static int timeout;
 module_param(timeout, int, 0);
 MODULE_PARM_DESC(timeout,
 		"Watchdog timeout in seconds. (0 < timeout < 18000, default="
@@ -53,18 +44,15 @@ MODULE_PARM_DESC(nowayout,
  *	configuration set.
  */
 
-static void ali_start(void)
+static int ali_start(struct watchdog_device *wdd)
 {
 	u32 val;
 
-	spin_lock(&ali_lock);
-
 	pci_read_config_dword(ali_pci, 0xCC, &val);
 	val &= ~0x3F;	/* Mask count */
 	val |= (1 << 25) | ali_timeout_bits;
 	pci_write_config_dword(ali_pci, 0xCC, val);
-
-	spin_unlock(&ali_lock);
+	return 0;
 }
 
 /*
@@ -73,225 +61,53 @@ static void ali_start(void)
  *	Stop the ALi watchdog countdown
  */
 
-static void ali_stop(void)
+static int ali_stop(struct watchdog_device *wdd)
 {
 	u32 val;
 
-	spin_lock(&ali_lock);
-
 	pci_read_config_dword(ali_pci, 0xCC, &val);
 	val &= ~0x3F;		/* Mask count to zero (disabled) */
 	val &= ~(1 << 25);	/* and for safety mask the reset enable */
 	pci_write_config_dword(ali_pci, 0xCC, val);
-
-	spin_unlock(&ali_lock);
-}
-
-/*
- *	ali_keepalive	-	send a keepalive to the watchdog
- *
- *	Send a keepalive to the timer (actually we restart the timer).
- */
-
-static void ali_keepalive(void)
-{
-	ali_start();
+	return 0;
 }
 
 /*
- *	ali_settimer	-	compute the timer reload value
+ *	ali_set_timeout	-	compute the timer reload value
  *	@t: time in seconds
  *
  *	Computes the timeout values needed
  */
 
-static int ali_settimer(int t)
+static int ali_set_timeout(struct watchdog_device *wdd, unsigned int t)
 {
-	if (t < 0)
-		return -EINVAL;
-	else if (t < 60)
-		ali_timeout_bits = t|(1 << 6);
-	else if (t < 3600)
-		ali_timeout_bits = (t / 60)|(1 << 7);
-	else if (t < 18000)
-		ali_timeout_bits = (t / 300)|(1 << 6)|(1 << 7);
-	else
+	spin_lock(&ali_lock);
+	if (t < 0) {
+		spin_unlock(&ali_lock);
 		return -EINVAL;
-
-	timeout = t;
-	return 0;
-}
-
-/*
- *	/dev/watchdog handling
- */
-
-/*
- *	ali_write	-	writes to ALi watchdog
- *	@file: file from VFS
- *	@data: user address of data
- *	@len: length of data
- *	@ppos: pointer to the file offset
- *
- *	Handle a write to the ALi watchdog. Writing to the file pings
- *	the watchdog and resets it. Writing the magic 'V' sequence allows
- *	the next close to turn off the watchdog.
- */
-
-static ssize_t ali_write(struct file *file, const char __user *data,
-						size_t len, loff_t *ppos)
-{
-	/* See if we got the magic character 'V' and reload the timer */
-	if (len) {
-		if (!nowayout) {
-			size_t i;
-
-			/* note: just in case someone wrote the
-			   magic character five months ago... */
-			ali_expect_release = 0;
-
-			/* scan to see whether or not we got
-			   the magic character */
-			for (i = 0; i != len; i++) {
-				char c;
-				if (get_user(c, data + i))
-					return -EFAULT;
-				if (c == 'V')
-					ali_expect_release = 42;
-			}
-		}
-
-		/* someone wrote to us, we should reload the timer */
-		ali_start();
 	}
-	return len;
-}
-
-/*
- *	ali_ioctl	-	handle watchdog ioctls
- *	@file: VFS file pointer
- *	@cmd: ioctl number
- *	@arg: arguments to the ioctl
- *
- *	Handle the watchdog ioctls supported by the ALi driver. Really
- *	we want an extension to enable irq ack monitoring and the like
- */
-
-static long ali_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-	int __user *p = argp;
-	static const struct watchdog_info ident = {
-		.options =		WDIOF_KEEPALIVEPING |
-					WDIOF_SETTIMEOUT |
-					WDIOF_MAGICCLOSE,
-		.firmware_version =	0,
-		.identity =		"ALi M1535 WatchDog Timer",
-	};
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(argp, &ident, sizeof(ident)) ? -EFAULT : 0;
-
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
-	case WDIOC_SETOPTIONS:
-	{
-		int new_options, retval = -EINVAL;
-
-		if (get_user(new_options, p))
-			return -EFAULT;
-		if (new_options & WDIOS_DISABLECARD) {
-			ali_stop();
-			retval = 0;
-		}
-		if (new_options & WDIOS_ENABLECARD) {
-			ali_start();
-			retval = 0;
-		}
-		return retval;
+	} else if (t < 60) {
+		ali_timeout_bits = t | (1 << 6);
 	}
-	case WDIOC_KEEPALIVE:
-		ali_keepalive();
-		return 0;
-	case WDIOC_SETTIMEOUT:
-	{
-		int new_timeout;
-		if (get_user(new_timeout, p))
-			return -EFAULT;
-		if (ali_settimer(new_timeout))
-			return -EINVAL;
-		ali_keepalive();
+	} else if (t < 3600) {
+		ali_timeout_bits = (t / 60) | (1 << 7);
 	}
-		/* fall through */
-	case WDIOC_GETTIMEOUT:
-		return put_user(timeout, p);
-	default:
-		return -ENOTTY;
+	} else if (t < 18000) {
+		ali_timeout_bits = (t / 300) | (1 << 6) | (1 << 7);
 	}
-}
-
-/*
- *	ali_open	-	handle open of ali watchdog
- *	@inode: inode from VFS
- *	@file: file from VFS
- *
- *	Open the ALi watchdog device. Ensure only one person opens it
- *	at a time. Also start the watchdog running.
- */
-
-static int ali_open(struct inode *inode, struct file *file)
-{
-	/* /dev/watchdog can only be opened once */
-	if (test_and_set_bit(0, &ali_is_open))
-		return -EBUSY;
-
-	/* Activate */
-	ali_start();
-	return nonseekable_open(inode, file);
-}
-
-/*
- *	ali_release	-	close an ALi watchdog
- *	@inode: inode from VFS
- *	@file: file from VFS
- *
- *	Close the ALi watchdog device. Actual shutdown of the timer
- *	only occurs if the magic sequence has been set.
- */
-
-static int ali_release(struct inode *inode, struct file *file)
-{
-	/*
-	 *      Shut off the timer.
-	 */
-	if (ali_expect_release == 42)
-		ali_stop();
 	else {
-		pr_crit("Unexpected close, not stopping watchdog!\n");
-		ali_keepalive();
+		spin_unlock(&ali_lock);
+		return -EINVAL;
 	}
-	clear_bit(0, &ali_is_open);
-	ali_expect_release = 0;
+	wdd->timeout = t;
+	spin_unlock(&ali_lock);
 	return 0;
 }
 
 /*
- *	ali_notify_sys	-	System down notifier
- *
- *	Notifier for system down
+ *	/dev/watchdog handling
  */
 
-
-static int ali_notify_sys(struct notifier_block *this,
-					unsigned long code, void *unused)
-{
-	if (code == SYS_DOWN || code == SYS_HALT)
-		ali_stop();		/* Turn the WDT off */
-	return NOTIFY_DONE;
-}
-
 /*
  *	Data for PCI driver interface
  *
@@ -361,23 +177,25 @@ static int __init ali_find_watchdog(void)
  *	Kernel Interfaces
  */
 
-static const struct file_operations ali_fops = {
-	.owner		=	THIS_MODULE,
-	.llseek		=	no_llseek,
-	.write		=	ali_write,
-	.unlocked_ioctl =	ali_ioctl,
-	.open		=	ali_open,
-	.release	=	ali_release,
+static struct watchdog_ops alim1535wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = ali_start,
+	.stop = ali_stop,
+	.set_timeout = ali_set_timeout,
 };
 
-static struct miscdevice ali_miscdev = {
-	.minor =	WATCHDOG_MINOR,
-	.name =		"watchdog",
-	.fops =		&ali_fops,
-};
-
-static struct notifier_block ali_notifier = {
-	.notifier_call =	ali_notify_sys,
+static const struct watchdog_info alim1535wdt_ident = {
+	.firmware_version =	0,
+	.identity         =	"ALi M1535 Watchdog",
+ };
+
+static struct watchdog_device alim1535wdt_wdd = {
+	.ops = &alim1535wdt_ops,
+	.info = &alim1535wdt_ident,
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+	.min_timeout = 1,
+	.max_timeout = 18000,
+
 };
 
 /*
@@ -403,30 +221,20 @@ static int __init watchdog_init(void)
 			timeout);
 	}
 
-	/* Calculate the watchdog's timeout */
-	ali_settimer(timeout);
+	watchdog_stop_on_reboot(&alim1535wdt_wdd);
+
+	watchdog_init_timeout(&alim1535wdt_wdd, timeout, NULL);
+
+	watchdog_set_nowayout(&alim1535wdt_wdd, nowayout);
 
-	ret = register_reboot_notifier(&ali_notifier);
-	if (ret != 0) {
-		pr_err("cannot register reboot notifier (err=%d)\n", ret);
-		goto out;
-	}
+	ret = watchdog_register_device(&alim1535wdt_wdd);
 
-	ret = misc_register(&ali_miscdev);
 	if (ret != 0) {
-		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
-		       WATCHDOG_MINOR, ret);
-		goto unreg_reboot;
+		return ret;
 	}
+
+	return 0;
 
-	pr_info("initialized. timeout=%d sec (nowayout=%d)\n",
-		timeout, nowayout);
-
-out:
-	return ret;
-unreg_reboot:
-	unregister_reboot_notifier(&ali_notifier);
-	goto out;
 }
 
 /*
@@ -437,12 +245,8 @@ unreg_reboot:
 
 static void __exit watchdog_exit(void)
 {
-	/* Stop the timer before we leave */
-	ali_stop();
-
 	/* Deregister */
-	misc_deregister(&ali_miscdev);
-	unregister_reboot_notifier(&ali_notifier);
+	watchdog_unregister_device(&alim1535wdt_wdd);
 	pci_dev_put(ali_pci);
 }
 
@@ -451,4 +255,4 @@ module_exit(watchdog_exit);
 
 MODULE_AUTHOR("Alan Cox");
 MODULE_DESCRIPTION("ALi M1535 PMU Watchdog Timer driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL");
-- 
2.17.1

