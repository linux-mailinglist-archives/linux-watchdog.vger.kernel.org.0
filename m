Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04DD88408
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 22:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfHIU25 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 16:28:57 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40777 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfHIU24 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 16:28:56 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MiJhW-1iZ4UU3SoY-00fOaA; Fri, 09 Aug 2019 22:28:28 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] watchdog: remove ks8695 driver
Date:   Fri,  9 Aug 2019 22:27:32 +0200
Message-Id: <20190809202749.742267-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/xUJ0urBROFGs9psZRmzii/x6kcPUzVYJxl3kP276+fX5WTKDQJ
 AEr5kjNrQllMr6Z7NrWzUAosq4zoo17U5hXEHU1wpbNBF/FzqZG5NpMpn5LmfTvS/oHwrSC
 SPivcPSIrBUD3Wt8JtE7FjLsqknJiLKaxARHJY18MFfhys5Pi20FKvPXIZaoXZvjWMEWqsn
 y86kNTdsiTwj2mtVjJDZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5F3GSB/6Nc0=:0OfCFRE5YMaF7NC0TBIXLU
 yk6ETYg8YqB8FGy11h7Y7L//B6f4+goRdrik/F0V+bk2DatX85QQd1DlyqCc96+UiFGNwBS09
 Qv7z6vjR890ibcchOcnmadBVZwSeVZZecL1nP/dE2FKDZyzUnngL0NFlMS+70zsMTqejaGjXI
 ob413DTJ7ukWeWZoRr9XQm4BpR0Z5okW6FQTFQYFnIDBeUoGV9olG6F67BZJc1er/W0GThp8e
 XXcBv+2HMkW40pV9DNFpARsx/Hkd+2g6rJ1WRiEpPfssyi/QQGZRt/yYPaqjWbv4brrZricO6
 LmPEXGI/nZQ8ZBfoWM0y74zwS76J42av57ifvnBX047rWSB66X+a1NRNKhS8S1m+HFiZU6Ipj
 XxxbRiv1mf5oyRPGuybzhvh5ZLYZIUbC33ryujyvR2dpz5GGdPIRbaS+K4CDGhmzGfkbmbWJw
 zXO1836RFCCdJnYKli0kYcVkQ6W+5gg3jmihOj0GINi46YolfvGpxjEoTFfGAFMrKFRzg2/Bt
 2C7SB49uCVUFbPjRiFfWM31aJDzk/xqYJ7ggWMhMtL7JQ+MVLkBKssvFPynYos9VEeWdV5hhA
 ofdgyBI6o2R8VV6BBdJU869DdteYXhWNJx6xtRuhs2IljiuS2jJv0b3y4Sp21qR55wqH7PsIJ
 cYiASF9Jr6JhBiZ1SPtml20vBsMSx2jWu0hvpDRvxA7eobSIDfE2GoB/WCkkwHVzD5bl+WbCf
 QxWYyqW/tuMzAmZTlvB6KDUvTckS6Ma3M+KXOg==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The platform is getting removed, so there are no remaining
users of this driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../watchdog/watchdog-parameters.rst          |   9 -
 drivers/watchdog/Kconfig                      |   7 -
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/ks8695_wdt.c                 | 319 ------------------
 4 files changed, 336 deletions(-)
 delete mode 100644 drivers/watchdog/ks8695_wdt.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index a3985cc5aeda..226aba56f704 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -301,15 +301,6 @@ ixp4xx_wdt:
 
 -------------------------------------------------
 
-ks8695_wdt:
-    wdt_time:
-	Watchdog time in seconds. (default=5)
-    nowayout:
-	Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-
--------------------------------------------------
-
 machzwd:
     nowayout:
 	Watchdog cannot be stopped once started
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 8188963a405b..e631f1ae303a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -477,13 +477,6 @@ config IXP4XX_WATCHDOG
 
 	  Say N if you are unsure.
 
-config KS8695_WATCHDOG
-	tristate "KS8695 watchdog"
-	depends on ARCH_KS8695
-	help
-	  Watchdog timer embedded into KS8695 processor. This will reboot your
-	  system when the timeout is reached.
-
 config HAVE_S3C2410_WATCHDOG
 	bool
 	help
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 7caa920e7e60..85f55ec76f8d 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -49,7 +49,6 @@ obj-$(CONFIG_21285_WATCHDOG) += wdt285.o
 obj-$(CONFIG_977_WATCHDOG) += wdt977.o
 obj-$(CONFIG_FTWDT010_WATCHDOG) += ftwdt010_wdt.o
 obj-$(CONFIG_IXP4XX_WATCHDOG) += ixp4xx_wdt.o
-obj-$(CONFIG_KS8695_WATCHDOG) += ks8695_wdt.o
 obj-$(CONFIG_S3C2410_WATCHDOG) += s3c2410_wdt.o
 obj-$(CONFIG_SA1100_WATCHDOG) += sa1100_wdt.o
 obj-$(CONFIG_SAMA5D4_WATCHDOG) += sama5d4_wdt.o
diff --git a/drivers/watchdog/ks8695_wdt.c b/drivers/watchdog/ks8695_wdt.c
deleted file mode 100644
index 1550ce3c5702..000000000000
--- a/drivers/watchdog/ks8695_wdt.c
+++ /dev/null
@@ -1,319 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Watchdog driver for Kendin/Micrel KS8695.
- *
- * (C) 2007 Andrew Victor
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/bitops.h>
-#include <linux/errno.h>
-#include <linux/fs.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/miscdevice.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/platform_device.h>
-#include <linux/types.h>
-#include <linux/watchdog.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
-#include <mach/hardware.h>
-
-#define KS8695_TMR_OFFSET	(0xF0000 + 0xE400)
-#define KS8695_TMR_VA		(KS8695_IO_VA + KS8695_TMR_OFFSET)
-
-/*
- * Timer registers
- */
-#define KS8695_TMCON		(0x00)		/* Timer Control Register */
-#define KS8695_T0TC		(0x08)		/* Timer 0 Timeout Count Register */
-#define TMCON_T0EN		(1 << 0)	/* Timer 0 Enable */
-
-/* Timer0 Timeout Counter Register */
-#define T0TC_WATCHDOG		(0xff)		/* Enable watchdog mode */
-
-#define WDT_DEFAULT_TIME	5	/* seconds */
-#define WDT_MAX_TIME		171	/* seconds */
-
-static int wdt_time = WDT_DEFAULT_TIME;
-static bool nowayout = WATCHDOG_NOWAYOUT;
-
-module_param(wdt_time, int, 0);
-MODULE_PARM_DESC(wdt_time, "Watchdog time in seconds. (default="
-					__MODULE_STRING(WDT_DEFAULT_TIME) ")");
-
-#ifdef CONFIG_WATCHDOG_NOWAYOUT
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
-				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-#endif
-
-
-static unsigned long ks8695wdt_busy;
-static DEFINE_SPINLOCK(ks8695_lock);
-
-/* ......................................................................... */
-
-/*
- * Disable the watchdog.
- */
-static inline void ks8695_wdt_stop(void)
-{
-	unsigned long tmcon;
-
-	spin_lock(&ks8695_lock);
-	/* disable timer0 */
-	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
-	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
-	spin_unlock(&ks8695_lock);
-}
-
-/*
- * Enable and reset the watchdog.
- */
-static inline void ks8695_wdt_start(void)
-{
-	unsigned long tmcon;
-	unsigned long tval = wdt_time * KS8695_CLOCK_RATE;
-
-	spin_lock(&ks8695_lock);
-	/* disable timer0 */
-	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
-	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
-
-	/* program timer0 */
-	__raw_writel(tval | T0TC_WATCHDOG, KS8695_TMR_VA + KS8695_T0TC);
-
-	/* re-enable timer0 */
-	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
-	__raw_writel(tmcon | TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
-	spin_unlock(&ks8695_lock);
-}
-
-/*
- * Reload the watchdog timer.  (ie, pat the watchdog)
- */
-static inline void ks8695_wdt_reload(void)
-{
-	unsigned long tmcon;
-
-	spin_lock(&ks8695_lock);
-	/* disable, then re-enable timer0 */
-	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
-	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
-	__raw_writel(tmcon | TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
-	spin_unlock(&ks8695_lock);
-}
-
-/*
- * Change the watchdog time interval.
- */
-static int ks8695_wdt_settimeout(int new_time)
-{
-	/*
-	 * All counting occurs at KS8695_CLOCK_RATE / 128 = 0.256 Hz
-	 *
-	 * Since WDV is a 16-bit counter, the maximum period is
-	 * 65536 / 0.256 = 256 seconds.
-	 */
-	if ((new_time <= 0) || (new_time > WDT_MAX_TIME))
-		return -EINVAL;
-
-	/* Set new watchdog time. It will be used when
-	   ks8695_wdt_start() is called. */
-	wdt_time = new_time;
-	return 0;
-}
-
-/* ......................................................................... */
-
-/*
- * Watchdog device is opened, and watchdog starts running.
- */
-static int ks8695_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &ks8695wdt_busy))
-		return -EBUSY;
-
-	ks8695_wdt_start();
-	return stream_open(inode, file);
-}
-
-/*
- * Close the watchdog device.
- * If CONFIG_WATCHDOG_NOWAYOUT is NOT defined then the watchdog is also
- *  disabled.
- */
-static int ks8695_wdt_close(struct inode *inode, struct file *file)
-{
-	/* Disable the watchdog when file is closed */
-	if (!nowayout)
-		ks8695_wdt_stop();
-	clear_bit(0, &ks8695wdt_busy);
-	return 0;
-}
-
-static const struct watchdog_info ks8695_wdt_info = {
-	.identity	= "ks8695 watchdog",
-	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
-};
-
-/*
- * Handle commands from user-space.
- */
-static long ks8695_wdt_ioctl(struct file *file, unsigned int cmd,
-							unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-	int __user *p = argp;
-	int new_value;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(argp, &ks8695_wdt_info,
-					sizeof(ks8695_wdt_info)) ? -EFAULT : 0;
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
-	case WDIOC_SETOPTIONS:
-		if (get_user(new_value, p))
-			return -EFAULT;
-		if (new_value & WDIOS_DISABLECARD)
-			ks8695_wdt_stop();
-		if (new_value & WDIOS_ENABLECARD)
-			ks8695_wdt_start();
-		return 0;
-	case WDIOC_KEEPALIVE:
-		ks8695_wdt_reload();	/* pat the watchdog */
-		return 0;
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_value, p))
-			return -EFAULT;
-		if (ks8695_wdt_settimeout(new_value))
-			return -EINVAL;
-		/* Enable new time value */
-		ks8695_wdt_start();
-		/* Return current value */
-		return put_user(wdt_time, p);
-	case WDIOC_GETTIMEOUT:
-		return put_user(wdt_time, p);
-	default:
-		return -ENOTTY;
-	}
-}
-
-/*
- * Pat the watchdog whenever device is written to.
- */
-static ssize_t ks8695_wdt_write(struct file *file, const char *data,
-						size_t len, loff_t *ppos)
-{
-	ks8695_wdt_reload();		/* pat the watchdog */
-	return len;
-}
-
-/* ......................................................................... */
-
-static const struct file_operations ks8695wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.unlocked_ioctl	= ks8695_wdt_ioctl,
-	.open		= ks8695_wdt_open,
-	.release	= ks8695_wdt_close,
-	.write		= ks8695_wdt_write,
-};
-
-static struct miscdevice ks8695wdt_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &ks8695wdt_fops,
-};
-
-static int ks8695wdt_probe(struct platform_device *pdev)
-{
-	int res;
-
-	if (ks8695wdt_miscdev.parent)
-		return -EBUSY;
-	ks8695wdt_miscdev.parent = &pdev->dev;
-
-	res = misc_register(&ks8695wdt_miscdev);
-	if (res)
-		return res;
-
-	pr_info("KS8695 Watchdog Timer enabled (%d seconds%s)\n",
-		wdt_time, nowayout ? ", nowayout" : "");
-	return 0;
-}
-
-static int ks8695wdt_remove(struct platform_device *pdev)
-{
-	misc_deregister(&ks8695wdt_miscdev);
-	ks8695wdt_miscdev.parent = NULL;
-
-	return 0;
-}
-
-static void ks8695wdt_shutdown(struct platform_device *pdev)
-{
-	ks8695_wdt_stop();
-}
-
-#ifdef CONFIG_PM
-
-static int ks8695wdt_suspend(struct platform_device *pdev, pm_message_t message)
-{
-	ks8695_wdt_stop();
-	return 0;
-}
-
-static int ks8695wdt_resume(struct platform_device *pdev)
-{
-	if (ks8695wdt_busy)
-		ks8695_wdt_start();
-	return 0;
-}
-
-#else
-#define ks8695wdt_suspend NULL
-#define ks8695wdt_resume	NULL
-#endif
-
-static struct platform_driver ks8695wdt_driver = {
-	.probe		= ks8695wdt_probe,
-	.remove		= ks8695wdt_remove,
-	.shutdown	= ks8695wdt_shutdown,
-	.suspend	= ks8695wdt_suspend,
-	.resume		= ks8695wdt_resume,
-	.driver		= {
-		.name	= "ks8695_wdt",
-	},
-};
-
-static int __init ks8695_wdt_init(void)
-{
-	/* Check that the heartbeat value is within range;
-	   if not reset to the default */
-	if (ks8695_wdt_settimeout(wdt_time)) {
-		ks8695_wdt_settimeout(WDT_DEFAULT_TIME);
-		pr_info("ks8695_wdt: wdt_time value must be 1 <= wdt_time <= %i"
-					", using %d\n", wdt_time, WDT_MAX_TIME);
-	}
-	return platform_driver_register(&ks8695wdt_driver);
-}
-
-static void __exit ks8695_wdt_exit(void)
-{
-	platform_driver_unregister(&ks8695wdt_driver);
-}
-
-module_init(ks8695_wdt_init);
-module_exit(ks8695_wdt_exit);
-
-MODULE_AUTHOR("Andrew Victor");
-MODULE_DESCRIPTION("Watchdog driver for KS8695");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:ks8695_wdt");
-- 
2.20.0

