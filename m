Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC6479AF7
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 23:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388335AbfG2VUV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 17:20:21 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42718 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388163AbfG2VUV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 17:20:21 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so28025322plb.9;
        Mon, 29 Jul 2019 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=pLxOSUlgvFvZ+NHInjaSidGzwEkbddZeMHAYPkY3L0Y=;
        b=XuNvhrj0OHl3ZuX/5Z7S771rB521yCtPq4fJWwI7xKNvtdC4GZFqcefsVsup8flt5K
         dM1/hkimfdmXnd8LEHPuejWhsqPZmRLFWqOG3QSQdgNyUfO6MQxDeetfI0Jf7vhc38EG
         eP5apLklvSpkxcgtzbZGfLxp1kmFGFOhTkF92PdNV/tkS97ps14a33yAWYL4lOMyWbVa
         Wr7nnMUpG+eaKYvzxDNwxWbrj8YpiOCC92Uro0w5pdUqor8WwMz5g9Aq6ppbhvTnXTF4
         WrUpRUjrLTF0rxo/67Ynr3uFFz3Knh2UE14BRdTdyrF2aMrgxl6hGv3R3J7KQcQr9VUk
         I4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=pLxOSUlgvFvZ+NHInjaSidGzwEkbddZeMHAYPkY3L0Y=;
        b=NsJFDj7siFeeLGFzt+mhPPDrtIlwte7y+6k5r1qTjWL1mtfjrV8vbS2va8CB3MS8D7
         nwtdzSp8DOPetHpJlzzV9i9DVPADNkCJhBRx079OOKdAJI4J5Sm3Ofh6ys5AJENhq/Te
         fl1PzDaylHtFgGbRCtkbRNr+lfwtphDTUauLyB9/QxM8i4oIObIX+IEqgM9Bm9gl+50Y
         hOYDj1ZJbHChHHNsPptrSBOoZtKJ6nCc2JBZnI1KathcRzG9NydQTYZfPexCNxeas+YF
         IcIaNZGGGZxIBshXmWVtLqX8iodw/9QrRv+Oz7gK6PMSJt/uklCw+UNPFsTcUzFVyOvS
         nM4A==
X-Gm-Message-State: APjAAAWo+Fb9oRfR8zjDAyMhjjIfxOu8t5RklWGGSegdmZPKyxNTrOe8
        0jyF7uqOFjwxZFFLeHnKTB8=
X-Google-Smtp-Source: APXvYqw/e6wQ1WJ7jT+Xst62GiiOt8j/exqhW2n/imkDWpYuCqeCICExn4cRmzXFseRiNL6y9ou+7g==
X-Received: by 2002:a17:902:23:: with SMTP id 32mr25181963pla.34.1564435220618;
        Mon, 29 Jul 2019 14:20:20 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id o11sm103038218pfh.114.2019.07.29.14.20.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 14:20:20 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 14:20:16 -0700 (PDT)
To:     linux@roeck-us.net
cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog device drivers:pc87413_wdt: Rewriting of pc87413_wdt
 driver to utilize common watchdog interface
Message-ID: <alpine.DEB.2.21.1907291408100.33418@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is a potential for the variable swc_base_addr in the call chain of the driver initialization function (init) to be used before 
initialization. This brought up the need for, by rewriting the driver to use the common watchdog interface, ensuring to have all resources in place. This patch addresses this need by rewriting into common watchdog interface utilization for the driver.

Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>

---
  drivers/media/pci/tw686x/Kconfig |  1 +
  drivers/watchdog/pc87413_wdt.c   | 92 +++++++++++++++-----------------
  2 files changed, 45 insertions(+), 48 deletions(-)

diff --git a/drivers/media/pci/tw686x/Kconfig 
b/drivers/media/pci/tw686x/Kconfig
index da8bfee7..079d7464 100644
--- a/drivers/media/pci/tw686x/Kconfig
+++ b/drivers/media/pci/tw686x/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_TW686X
  	select VIDEOBUF2_DMA_CONTIG
  	select VIDEOBUF2_DMA_SG
  	select SND_PCM
+	select WATCHDOG_CORE
  	help
  	  Support for Intersil/Techwell TW686x-based frame grabber cards.

diff --git a/drivers/watchdog/pc87413_wdt.c 
b/drivers/watchdog/pc87413_wdt.c
index 06a892e3..4c330ee5 100644
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
@@ -65,7 +63,6 @@ static char expect_close;		/* is the close 
expected? */

  static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */

-static bool nowayout = WATCHDOG_NOWAYOUT;

  /* -- Low level function ----------------------------------------*/

@@ -216,9 +213,9 @@ static inline void pc87413_disable_sw_wd_trg(void)

  /* -- Higher level functions ------------------------------------*/

-/* Enable the watchdog */
+/* Enable/start the watchdog */

-static void pc87413_enable(void)
+static void pc87413_start(void)
  {
  	spin_lock(&io_lock);

@@ -231,9 +228,9 @@ static void pc87413_enable(void)
  	spin_unlock(&io_lock);
  }

-/* Disable the watchdog */
+/* Disable/stop the watchdog */

-static void pc87413_disable(void)
+static void pc87413_stop(void)
  {
  	spin_lock(&io_lock);

@@ -245,9 +242,9 @@ static void pc87413_disable(void)
  	spin_unlock(&io_lock);
  }

-/* Refresh the watchdog */
+/* Refresh/keepalive the watchdog */

-static void pc87413_refresh(void)
+static void pc87413_keepalive(struct watchdog_device *wdd)
  {
  	spin_lock(&io_lock);

@@ -260,6 +257,8 @@ static void pc87413_refresh(void)
  	pc87413_enable_sw_wd_trg();

  	spin_unlock(&io_lock);
+
+	return 0;
  }

  /* -- File operations -------------------------------------------*/
@@ -278,9 +277,6 @@ static int pc87413_open(struct inode *inode, struct 
file *file)
  	if (test_and_set_bit(0, &timer_enabled))
  		return -EBUSY;

-	if (nowayout)
-		__module_get(THIS_MODULE);
-
  	/* Reload and activate timer */
  	pc87413_refresh();

@@ -331,7 +327,6 @@ static int pc87413_status(void)

  /**
   *	pc87413_write:
- *	@file: file handle to the watchdog
   *	@data: data buffer to write
   *	@len: length in bytes
   *	@ppos: pointer to the position to write. No seeks allowed
@@ -345,26 +340,25 @@ static ssize_t pc87413_write(struct file *file, 
const char __user *data,
  {
  	/* See if we got the magic character 'V' and reload the timer */
  	if (len) {
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
+		size_t i;
+
+		/* reset expect flag */
+		expect_close = 0;
+
+		/* scan to see whether or not we got the
+		   magic character */
+		for (i = 0; i != len; i++) {
+			char c;
+			if (get_user(c, data + i))
+				return -EFAULT;
+			if (c == 'V')
+				expect_close = 42;
  		}
+	}

  		/* someone wrote to us, we should reload the timer */
-		pc87413_refresh();
-	}
+	pc87413_refresh();
+
  	return len;
  }

@@ -417,7 +411,7 @@ static long pc87413_ioctl(struct file *file, unsigned 
int cmd,
  			retval = 0;
  		}
  		if (options & WDIOS_ENABLECARD) {
-			pc87413_enable();
+			pc87413_start();
  			retval = 0;
  		}
  		return retval;
@@ -466,31 +460,32 @@ static int pc87413_notify_sys(struct notifier_block 
*this,
  {
  	if (code == SYS_DOWN || code == SYS_HALT)
  		/* Turn the card off */
-		pc87413_disable();
+		pc87413_stop();
  	return NOTIFY_DONE;
  }

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
+static struct notifier_block pc87413wdt_notifier = {
  	.notifier_call  = pc87413_notify_sys,
  };

-static struct miscdevice pc87413_miscdev = {
-	.minor          = WATCHDOG_MINOR,
-	.name           = "watchdog",
-	.fops           = &pc87413_fops,
+static struct watchdog_ops pc87413wdt_ops = {
+       .owner = THIS_MODULE,
+       .start = pc87413wdt_start,
+       .stop = pc87413wdt_stop,
+       .ping = pc87413wdt_keepalive,
+       .set_timeout = pc87413wdt_set_heartbeat,
+};
+
+static struct watchdog_device pc87413wdt_wdd = {
+       	.info = &pc87413wdt_ident,
+       	.ops = &pc87413wdt_ops,
+	.status = WATCHDOG_NOWAYOUT_INIT_STATUS
  };

+
  /* -- Module init functions -------------------------------------*/

  /**
@@ -515,7 +510,7 @@ static int __init pc87413_init(void)
  	if (ret != 0)
  		pr_err("cannot register reboot notifier (err=%d)\n", ret);

-	ret = misc_register(&pc87413_miscdev);
+	ret = watchdog_register_device(&pc87413wdt_wdd);
  	if (ret != 0) {
  		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
  		       WATCHDOG_MINOR, ret);
@@ -533,13 +528,14 @@ static int __init pc87413_init(void)
  		goto misc_unreg;
  	}

-	pc87413_enable();
+	pc87413_start();

  	release_region(io, 2);
+	pc87413_keepalive(&pc87413wdt_wdd);
  	return 0;

  misc_unreg:
-	misc_deregister(&pc87413_miscdev);
+	watchdog_unregister_device(&pc87413wdt_wdd)
  reboot_unreg:
  	unregister_reboot_notifier(&pc87413_notifier);
  	release_region(io, 2);
-- 
2.17.1

