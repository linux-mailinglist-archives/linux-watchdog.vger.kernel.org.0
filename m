Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7741B28E2A8
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 16:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgJNO5L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Oct 2020 10:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgJNO5K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Oct 2020 10:57:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79324C061755;
        Wed, 14 Oct 2020 07:57:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y16so3558437ljk.1;
        Wed, 14 Oct 2020 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WpfvZK3mHQN5Vub48fIs0k/8Dso0F8GdFnC1f6FiMnU=;
        b=cvSr4MKtdpeh694cJedKO+s47zIq4uBOH2qYyqEAcp7IjwgI8W12JpOXXrPz5a8SQD
         rgUdZ1Nn9eJRh3kVU/2yC0i4ml78pe/s4EBTBSSQwiXw1NCs22U+9sm6+gxv7QZs5/6z
         jh8zFHw5vUB+mbpGBG3jL9ZkGaN9qEu7NzbZ5GncNr0j8V/K6K9tHvyJNfdQx/AFd2Ju
         sBJlgvW1tGYtlcAOpr1fPcp1xB88MH9aWx/FnzTWNTcXM8x7+pjY/hnGnVNhTbNBv8it
         WwZAHdwpHn9eLWXJvMMgYWUsLUnCXI4tIxw5fy6tb2Cr0vV4pwPmjht/UCOLisCgvPu9
         tBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WpfvZK3mHQN5Vub48fIs0k/8Dso0F8GdFnC1f6FiMnU=;
        b=MSfygMCoanE8N8bisIauZw3XEITdfSyEZ0w1jHaVDIxGo8dybKiiC4d2ClbC7Hp5nk
         2BFaogh1boW5W8sQKys9cR22GAk7gi+qmukuJ1S1ibBcql8GbHAuoi6wQw3FX6+CKHMs
         79whpDpXgb8LPIFAIOIHfagr25tOkhUmAKDqAQaPaewK8d4ZBSSrPIaJkHxsVfYYd0Jm
         W0grcwHzQRRtWc2DMkGlSwhdyN/kiSROylSRXRvNIeStJkyyg1T+zgaLkI7+Kr2X4X3L
         RKT9MHOLRA8yH0U4vqybfoW4CpNM2CnCfzhaa3357PT5xKFkIrQL5L2aFs+UuiC6dgWi
         sRlA==
X-Gm-Message-State: AOAM530Mh8MyPi2epIZBVcmizbu4+ur243df69QHgTIuylIVDDO61bvk
        74oF5gPfkNMgrpMkz9gxLXMub2y+k6mqV2Wv
X-Google-Smtp-Source: ABdhPJxtyeZ4BMvPmH3Wr/w0mbHyVa/+DcAIBItQo0ss6gxgG4Ks2/9vCeNjbwEbbwl7AkTpit1R2g==
X-Received: by 2002:a2e:9e95:: with SMTP id f21mr2178692ljk.40.1602687428926;
        Wed, 14 Oct 2020 07:57:08 -0700 (PDT)
Received: from localhost.localdomain (mail.vissa.org. [37.17.23.68])
        by smtp.gmail.com with ESMTPSA id v123sm1214532lfa.129.2020.10.14.07.57.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 07:57:08 -0700 (PDT)
From:   Sergey Yasinsky <seregajsv@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Sergey Yasinsky <seregajsv@gmail.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] watchdog: repair pnx833x_wdt
Date:   Wed, 14 Oct 2020 17:56:32 +0300
Message-Id: <20201014145633.25680-1-seregajsv@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Using watchdog core functions instead of miscdevice.

Signed-off-by: Sergey Yasinsky <seregajsv@gmail.com>
---
 drivers/watchdog/Kconfig       |   2 +-
 drivers/watchdog/pnx833x_wdt.c | 219 ++++++++-------------------------
 2 files changed, 53 insertions(+), 168 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ab7aad5a1e69..e9b86dbbb8fa 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1686,7 +1686,7 @@ config WDT_MTX1
 config PNX833X_WDT
 	tristate "PNX833x Hardware Watchdog"
 	depends on SOC_PNX8335
-	depends on BROKEN
+	select WATCHDOG_CORE
 	help
 	  Hardware driver for the PNX833x's watchdog. This is a
 	  watchdog timer that will reboot the machine after a programmable
diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
index 4097d076aab8..4ec852c423da 100644
--- a/drivers/watchdog/pnx833x_wdt.c
+++ b/drivers/watchdog/pnx833x_wdt.c
@@ -17,21 +17,11 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/miscdevice.h>
 #include <linux/watchdog.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/init.h>
 #include <asm/mach-pnx833x/pnx833x.h>
 
-#define WATCHDOG_TIMEOUT 30		/* 30 sec Maximum timeout */
+#define WATCHDOG_DEFAULT_TIMEOUT 30
 #define WATCHDOG_COUNT_FREQUENCY 68000000U /* Watchdog counts at 68MHZ. */
-#define	PNX_WATCHDOG_TIMEOUT	(WATCHDOG_TIMEOUT * WATCHDOG_COUNT_FREQUENCY)
-#define PNX_TIMEOUT_VALUE	2040000000U
 
 /** CONFIG block */
 #define PNX833X_CONFIG                      (0x07000U)
@@ -43,40 +33,37 @@
 #define PNX833X_RESET                       (0x08000U)
 #define PNX833X_RESET_CONFIG                (0x08)
 
-static int pnx833x_wdt_alive;
+struct pnx833x_wdt {
+	struct watchdog_device wdd;
+};
 
-/* Set default timeout in MHZ.*/
-static int pnx833x_wdt_timeout = PNX_WATCHDOG_TIMEOUT;
+/* Set default timeout */
+static int pnx833x_wdt_timeout = WATCHDOG_DEFAULT_TIMEOUT;
 module_param(pnx833x_wdt_timeout, int, 0);
-MODULE_PARM_DESC(timeout, "Watchdog timeout in Mhz. (68Mhz clock), default="
-			__MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
+		__MODULE_STRING(WATCHDOG_DEFAULT_TIMEOUT) ")");
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 					__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-#define START_DEFAULT	1
-static int start_enabled = START_DEFAULT;
-module_param(start_enabled, int, 0);
-MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
-				"(default=" __MODULE_STRING(START_DEFAULT) ")");
-
-static void pnx833x_wdt_start(void)
+static int pnx833x_wdt_start(struct watchdog_device *wdd)
 {
 	/* Enable watchdog causing reset. */
 	PNX833X_REG(PNX833X_RESET + PNX833X_RESET_CONFIG) |= 0x1;
 	/* Set timeout.*/
-	PNX833X_REG(PNX833X_CONFIG +
-		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
 	/* Enable watchdog. */
 	PNX833X_REG(PNX833X_CONFIG +
 				PNX833X_CONFIG_CPU_COUNTERS_CONTROL) |= 0x1;
 
 	pr_info("Started watchdog timer\n");
+	return 0;
 }
 
-static void pnx833x_wdt_stop(void)
+static int pnx833x_wdt_stop(struct watchdog_device *wdd)
 {
 	/* Disable watchdog causing reset. */
 	PNX833X_REG(PNX833X_RESET + PNX833X_CONFIG) &= 0xFFFFFFFE;
@@ -85,149 +72,54 @@ static void pnx833x_wdt_stop(void)
 			PNX833X_CONFIG_CPU_COUNTERS_CONTROL) &= 0xFFFFFFFE;
 
 	pr_info("Stopped watchdog timer\n");
-}
-
-static void pnx833x_wdt_ping(void)
-{
-	PNX833X_REG(PNX833X_CONFIG +
-		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
-}
-
-/*
- *	Allow only one person to hold it open
- */
-static int pnx833x_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &pnx833x_wdt_alive))
-		return -EBUSY;
-
-	if (nowayout)
-		__module_get(THIS_MODULE);
-
-	/* Activate timer */
-	if (!start_enabled)
-		pnx833x_wdt_start();
-
-	pnx833x_wdt_ping();
-
-	pr_info("Started watchdog timer\n");
-
-	return stream_open(inode, file);
-}
-
-static int pnx833x_wdt_release(struct inode *inode, struct file *file)
-{
-	/* Shut off the timer.
-	 * Lock it in if it's a module and we defined ...NOWAYOUT */
-	if (!nowayout)
-		pnx833x_wdt_stop(); /* Turn the WDT off */
-
-	clear_bit(0, &pnx833x_wdt_alive);
 	return 0;
 }
 
-static ssize_t pnx833x_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
+static int pnx833x_wdt_ping(struct watchdog_device *wdd)
 {
-	/* Refresh the timer. */
-	if (len)
-		pnx833x_wdt_ping();
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
 
-	return len;
+	return 0;
 }
 
-static long pnx833x_wdt_ioctl(struct file *file, unsigned int cmd,
-							unsigned long arg)
+static int pnx833x_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
 {
-	int options, new_timeout = 0;
-	uint32_t timeout, timeout_left = 0;
-
-	static const struct watchdog_info ident = {
-		.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
-		.firmware_version = 0,
-		.identity = "Hardware Watchdog for PNX833x",
-	};
-
-	switch (cmd) {
-	default:
-		return -ENOTTY;
-
-	case WDIOC_GETSUPPORT:
-		if (copy_to_user((struct watchdog_info *)arg,
-				 &ident, sizeof(ident)))
-			return -EFAULT;
-		return 0;
-
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, (int *)arg);
-
-	case WDIOC_SETOPTIONS:
-		if (get_user(options, (int *)arg))
-			return -EFAULT;
-
-		if (options & WDIOS_DISABLECARD)
-			pnx833x_wdt_stop();
-
-		if (options & WDIOS_ENABLECARD)
-			pnx833x_wdt_start();
-
-		return 0;
-
-	case WDIOC_KEEPALIVE:
-		pnx833x_wdt_ping();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-	{
-		if (get_user(new_timeout, (int *)arg))
-			return -EFAULT;
-
-		pnx833x_wdt_timeout = new_timeout;
-		PNX833X_REG(PNX833X_CONFIG +
-			PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = new_timeout;
-		return put_user(new_timeout, (int *)arg);
-	}
-
-	case WDIOC_GETTIMEOUT:
-		timeout = PNX833X_REG(PNX833X_CONFIG +
-					PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
-		return put_user(timeout, (int *)arg);
-
-	case WDIOC_GETTIMELEFT:
-		timeout_left = PNX833X_REG(PNX833X_CONFIG +
-						PNX833X_CONFIG_CPU_WATCHDOG);
-		return put_user(timeout_left, (int *)arg);
-
-	}
+	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
+		t * WATCHDOG_COUNT_FREQUENCY;
+	wdd->timeout = t;
+	return 0;
 }
 
-static int pnx833x_wdt_notify_sys(struct notifier_block *this,
-					unsigned long code, void *unused)
+static unsigned int pnx833x_wdt_get_timeleft(struct watchdog_device *wdd)
 {
-	if (code == SYS_DOWN || code == SYS_HALT)
-		pnx833x_wdt_stop(); /* Turn the WDT off */
+	unsigned int timeout = PNX833X_REG(PNX833X_CONFIG +
+		 PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
+	unsigned int curval = PNX833X_REG(PNX833X_CONFIG +
+		PNX833X_CONFIG_CPU_WATCHDOG);
 
-	return NOTIFY_DONE;
+	return (timeout - curval) / WATCHDOG_COUNT_FREQUENCY;
 }
 
-static const struct file_operations pnx833x_wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.write		= pnx833x_wdt_write,
-	.unlocked_ioctl	= pnx833x_wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= pnx833x_wdt_open,
-	.release	= pnx833x_wdt_release,
+static const struct watchdog_info pnx833x_wdt_ident = {
+	.identity = "PNX833x Watchdog Timer",
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE
 };
 
-static struct miscdevice pnx833x_wdt_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &pnx833x_wdt_fops,
+static struct watchdog_ops pnx833x_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pnx833x_wdt_start,
+	.stop = pnx833x_wdt_stop,
+	.ping = pnx833x_wdt_ping,
+	.set_timeout = pnx833x_wdt_set_timeout,
+	.get_timeleft = pnx833x_wdt_get_timeleft,
 };
 
-static struct notifier_block pnx833x_wdt_notifier = {
-	.notifier_call = pnx833x_wdt_notify_sys,
+struct pnx833x_wdt pnx833x_wdd = {
+	.wdd = {
+		.info = &pnx833x_wdt_ident,
+		.ops = &pnx833x_wdt_ops,
+	},
 };
 
 static int __init watchdog_init(void)
@@ -237,36 +129,29 @@ static int __init watchdog_init(void)
 	/* Lets check the reason for the reset.*/
 	cause = PNX833X_REG(PNX833X_RESET);
 	/*If bit 31 is set then watchdog was cause of reset.*/
-	if (cause & 0x80000000) {
+	if (cause & 0x80000000)
 		pr_info("The system was previously reset due to the watchdog firing - please investigate...\n");
-	}
 
-	ret = register_reboot_notifier(&pnx833x_wdt_notifier);
-	if (ret) {
-		pr_err("cannot register reboot notifier (err=%d)\n", ret);
-		return ret;
-	}
+	pnx833x_wdd.wdd.max_timeout = U32_MAX / WATCHDOG_COUNT_FREQUENCY;
+	pnx833x_wdd.wdd.timeout = pnx833x_wdt_timeout;
+	if (pnx833x_wdd.wdd.timeout > pnx833x_wdd.wdd.max_timeout)
+		pnx833x_wdd.wdd.timeout = pnx833x_wdd.wdd.max_timeout;
 
-	ret = misc_register(&pnx833x_wdt_miscdev);
+	watchdog_set_nowayout(&pnx833x_wdd.wdd, nowayout);
+	ret = watchdog_register_device(&pnx833x_wdd.wdd);
 	if (ret) {
-		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
-		       WATCHDOG_MINOR, ret);
-		unregister_reboot_notifier(&pnx833x_wdt_notifier);
+		pr_err("Failed to register watchdog device");
 		return ret;
 	}
 
 	pr_info("Hardware Watchdog Timer for PNX833x: Version 0.1\n");
 
-	if (start_enabled)
-		pnx833x_wdt_start();
-
 	return 0;
 }
 
 static void __exit watchdog_exit(void)
 {
-	misc_deregister(&pnx833x_wdt_miscdev);
-	unregister_reboot_notifier(&pnx833x_wdt_notifier);
+	watchdog_unregister_device(&pnx833x_wdd.wdd);
 }
 
 module_init(watchdog_init);
-- 
2.26.2

