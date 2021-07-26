Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F6C3D593B
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 14:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhGZLdw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 07:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbhGZLdw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 07:33:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D32C061757
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 05:14:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d17so15143986lfv.0
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Jul 2021 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrzEno3oSaS/WGf845YAVvb6GaJC29SaAVK5IB4T71g=;
        b=WxHLf3mtEYdmoOeyv0YVFX0YVyprpGQscHbRu+i1IIOxAKN2eqq6YTEP6LmpEyBM6f
         +O+FeS5OYoRlC/QiR8PaWBkEOWmum/aB3M6NKrE8qW52F4YkFClmekhxlNw302R2dXRW
         /WwOvo3CWOWEBqTtrefMFKp2w7zE0sMcWNrH1ht5WINIwqH6fHCTF/uLrMZrkKfdwwKq
         xnQvAAQauVi4TsGMG6VVjuDRbzPjJDlWr2rbTP4su8l1L8pDakaHOQTqfoNxC/QI/gH2
         4gRdz27P+gj6nXIjvwAf3fWHmm+xWJxi/JZENEfuhFlvppeb/KzZJhoI4zoO6zIfVijh
         ohlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrzEno3oSaS/WGf845YAVvb6GaJC29SaAVK5IB4T71g=;
        b=AdXbD4hgtbkv5RjhmNKkfeYJ80iUiV0a+FZl3uD6+zb5qzBdDMVB6ve9/kZK4snvmw
         VS9aZvK4rlR+AiMRJtyjkTzvqWLqwAieH8WpZDEm5ilJZY9S5H67YwO22SkFJsxiUREF
         R1dU+FtA2B5P+P+5CbODskbJxuMLnjXRe4Ix2pQAnPGb84uUNN9s8BUkVGKiVgTz5HwB
         +vy74sMwLmsaG2SQdPXknBaWMYom7gBmPbTTFdDvTosjLA/DprLkwYjfk9IYRZ+HrqUV
         00jZeLVhr3pX3ol3EswpWJOgFsN41ompu3iUQgSD0of2bEdgCbHI5gdNM0TkQuD9OBca
         vfOg==
X-Gm-Message-State: AOAM530yxdNIf3SWMv7fh0QJdNafeNLuiJjq3K6hsD/55hzqWIdRTGlv
        FBaUmSUibRVX5WxDszccyiXSRQ==
X-Google-Smtp-Source: ABdhPJyePnllJqKe2gaTp6Njs8keZHuPosS1OJ8M6NxMuw9SK8tZ8ZSvWR8LtDiEhoYDTTzgJ495xA==
X-Received: by 2002:a19:7b04:: with SMTP id w4mr8886961lfc.255.1627301658988;
        Mon, 26 Jul 2021 05:14:18 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p3sm943691lfa.228.2021.07.26.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 05:14:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3] watchdog: ixp4xx: Rewrite driver to use core
Date:   Mon, 26 Jul 2021 14:12:14 +0200
Message-Id: <20210726121214.2572836-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This rewrites the IXP4xx watchdog driver as follows:

- Spawn the watchdog driver as a platform device from the timer
  driver. It's one device in the hardware, and the fact that
  Linux splits the handling into two different devices is
  a Linux pecularity, and thus it becomes a Linux pecularity
  to spawn a separate watchdog driver.

- Spawn the watchdog driver from the timer driver at probe().
  This is well after the timer driver as actually registered and
  started and we know the register base is available.

- Instead of looping back callbacks to the timer drivers for all
  watchdog calls, pass the register base to the watchdog driver
  and manage the registers there. The two drivers aren't even
  interested in the same register so the spinlock is totally
  surplus, delete it.

- Replace pretty much all of the content in the watchdog driver
  with a simple, modern watchdog driver utilizing the watchdog
  core instead of registering its own misc device and ioctl()
  handling.

- Drop module parameters as the same already exist in the
  watchdog core.

What remains is a slim elegant (IMO) watchdog driver using the
watchdog core, spawning from device tree or boardfile alike.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Depend on ARCH_IXP4XX since we use SoC code accessors (drop
  COMPILE_TEST).
- Drop <linux/init.h> use <linux/bits.h> rather than bitops.h
- Fix some tabs vs spaces issues in the defines.
- Call clk_disable_unprepare(d) directly from the devres
  callback, the void * argument will be handled.
ChangeLog v1->v2:
- Pull out dirty patches underneath this patch. Tested on a
  clean v5.14-rc1, sorry for the mess :(
- Drop tick rate from the timer driver - was only used by this
  watchdog after all.
- Retrieve a clock from the parent to get rate if possible,
  fallback to a default clock rate if not. Prepare and
  enable the clock.
- Add a devres hook to disable the clock after use.
- Drop pointless platfrom_set_drvdata()
- Put a more technically correct print at end of probe.
Merge path: I expect this to be merged through the watchdog
subsystem once the timer maintainers are happy with the patch,
so Daniel or tglx: once you approve the patch please ACK this.
---
 drivers/clocksource/timer-ixp4xx.c |  48 +++--
 drivers/watchdog/Kconfig           |   1 +
 drivers/watchdog/ixp4xx_wdt.c      | 283 ++++++++++++-----------------
 3 files changed, 155 insertions(+), 177 deletions(-)

diff --git a/drivers/clocksource/timer-ixp4xx.c b/drivers/clocksource/timer-ixp4xx.c
index 9396745e1c17..cbb184953510 100644
--- a/drivers/clocksource/timer-ixp4xx.c
+++ b/drivers/clocksource/timer-ixp4xx.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 /* Goes away with OF conversion */
 #include <linux/platform_data/timer-ixp4xx.h>
 
@@ -29,9 +30,6 @@
 #define IXP4XX_OSRT1_OFFSET	0x08  /* Timer 1 Reload */
 #define IXP4XX_OST2_OFFSET	0x0C  /* Timer 2 Timestamp */
 #define IXP4XX_OSRT2_OFFSET	0x10  /* Timer 2 Reload */
-#define IXP4XX_OSWT_OFFSET	0x14  /* Watchdog Timer */
-#define IXP4XX_OSWE_OFFSET	0x18  /* Watchdog Enable */
-#define IXP4XX_OSWK_OFFSET	0x1C  /* Watchdog Key */
 #define IXP4XX_OSST_OFFSET	0x20  /* Timer Status */
 
 /*
@@ -45,17 +43,10 @@
 #define IXP4XX_OSST_TIMER_1_PEND	0x00000001
 #define IXP4XX_OSST_TIMER_2_PEND	0x00000002
 #define IXP4XX_OSST_TIMER_TS_PEND	0x00000004
-#define IXP4XX_OSST_TIMER_WDOG_PEND	0x00000008
-#define IXP4XX_OSST_TIMER_WARM_RESET	0x00000010
-
-#define	IXP4XX_WDT_KEY			0x0000482E
-#define	IXP4XX_WDT_RESET_ENABLE		0x00000001
-#define	IXP4XX_WDT_IRQ_ENABLE		0x00000002
-#define	IXP4XX_WDT_COUNT_ENABLE		0x00000004
+/* Remaining registers are for the watchdog and defined in the watchdog driver */
 
 struct ixp4xx_timer {
 	void __iomem *base;
-	unsigned int tick_rate;
 	u32 latch;
 	struct clock_event_device clkevt;
 #ifdef CONFIG_ARM
@@ -181,7 +172,6 @@ static __init int ixp4xx_timer_register(void __iomem *base,
 	if (!tmr)
 		return -ENOMEM;
 	tmr->base = base;
-	tmr->tick_rate = timer_freq;
 
 	/*
 	 * The timer register doesn't allow to specify the two least
@@ -239,6 +229,40 @@ static __init int ixp4xx_timer_register(void __iomem *base,
 	return 0;
 }
 
+static struct platform_device ixp4xx_watchdog_device = {
+	.name = "ixp4xx-watchdog",
+	.id = -1,
+};
+
+/*
+ * This probe gets called after the timer is already up and running. The main
+ * function on this platform is to spawn the watchdog device as a child.
+ */
+static int ixp4xx_timer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	/* Pass the base address as platform data and nothing else */
+	ixp4xx_watchdog_device.dev.platform_data = local_ixp4xx_timer->base;
+	ixp4xx_watchdog_device.dev.parent = dev;
+	return platform_device_register(&ixp4xx_watchdog_device);
+}
+
+static const struct of_device_id ixp4xx_timer_dt_id[] = {
+	{ .compatible = "intel,ixp4xx-timer", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver ixp4xx_timer_driver = {
+	.probe  = ixp4xx_timer_probe,
+	.driver = {
+		.name = "ixp4xx-timer",
+		.of_match_table = ixp4xx_timer_dt_id,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(ixp4xx_timer_driver);
+
 /**
  * ixp4xx_timer_setup() - Timer setup function to be called from boardfiles
  * @timerbase: physical base of timer block
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 546dfc1e2349..0bc7046ab942 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -487,6 +487,7 @@ config FTWDT010_WATCHDOG
 config IXP4XX_WATCHDOG
 	tristate "IXP4xx Watchdog"
 	depends on ARCH_IXP4XX
+	select WATCHDOG_CORE
 	help
 	  Say Y here if to include support for the watchdog timer
 	  in the Intel IXP4xx network processors. This driver can
diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index aae29dcfaf11..2693ffb24ac7 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -1,220 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * drivers/char/watchdog/ixp4xx_wdt.c
  *
  * Watchdog driver for Intel IXP4xx network processors
  *
  * Author: Deepak Saxena <dsaxena@plexity.net>
+ * Author: Linus Walleij <linus.walleij@linaro.org>
  *
  * Copyright 2004 (c) MontaVista, Software, Inc.
  * Based on sa1100 driver, Copyright (C) 2000 Oleg Drokin <green@crimea.edu>
- *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/miscdevice.h>
-#include <linux/of.h>
 #include <linux/watchdog.h>
-#include <linux/init.h>
-#include <linux/bitops.h>
-#include <linux/uaccess.h>
-#include <mach/hardware.h>
+#include <linux/bits.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/soc/ixp4xx/cpu.h>
+
+struct ixp4xx_wdt {
+	struct watchdog_device wdd;
+	void __iomem *base;
+	unsigned long rate;
+};
 
-static bool nowayout = WATCHDOG_NOWAYOUT;
-static int heartbeat = 60;	/* (secs) Default is 1 minute */
-static unsigned long wdt_status;
-static unsigned long boot_status;
-static DEFINE_SPINLOCK(wdt_lock);
+/* Fallback if we do not have a clock for this */
+#define IXP4XX_TIMER_FREQ	66666000
 
-#define WDT_TICK_RATE (IXP4XX_PERIPHERAL_BUS_CLOCK * 1000000UL)
+/* Registers after the timer registers */
+#define IXP4XX_OSWT_OFFSET	0x14  /* Watchdog Timer */
+#define IXP4XX_OSWE_OFFSET	0x18  /* Watchdog Enable */
+#define IXP4XX_OSWK_OFFSET	0x1C  /* Watchdog Key */
+#define IXP4XX_OSST_OFFSET	0x20  /* Timer Status */
 
-#define	WDT_IN_USE		0
-#define	WDT_OK_TO_CLOSE		1
+#define IXP4XX_OSST_TIMER_WDOG_PEND	0x00000008
+#define IXP4XX_OSST_TIMER_WARM_RESET	0x00000010
+#define IXP4XX_WDT_KEY			0x0000482E
+#define IXP4XX_WDT_RESET_ENABLE		0x00000001
+#define IXP4XX_WDT_IRQ_ENABLE		0x00000002
+#define IXP4XX_WDT_COUNT_ENABLE		0x00000004
 
-static void wdt_enable(void)
+static inline
+struct ixp4xx_wdt *to_ixp4xx_wdt(struct watchdog_device *wdd)
 {
-	spin_lock(&wdt_lock);
-	*IXP4XX_OSWK = IXP4XX_WDT_KEY;
-	*IXP4XX_OSWE = 0;
-	*IXP4XX_OSWT = WDT_TICK_RATE * heartbeat;
-	*IXP4XX_OSWE = IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE;
-	*IXP4XX_OSWK = 0;
-	spin_unlock(&wdt_lock);
+	return container_of(wdd, struct ixp4xx_wdt, wdd);
 }
 
-static void wdt_disable(void)
+static int ixp4xx_wdt_start(struct watchdog_device *wdd)
 {
-	spin_lock(&wdt_lock);
-	*IXP4XX_OSWK = IXP4XX_WDT_KEY;
-	*IXP4XX_OSWE = 0;
-	*IXP4XX_OSWK = 0;
-	spin_unlock(&wdt_lock);
-}
+	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
 
-static int ixp4xx_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(WDT_IN_USE, &wdt_status))
-		return -EBUSY;
+	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWE_OFFSET);
+	__raw_writel(wdd->timeout * iwdt->rate,
+		     iwdt->base + IXP4XX_OSWT_OFFSET);
+	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
+		     iwdt->base + IXP4XX_OSWE_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWK_OFFSET);
 
-	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-	wdt_enable();
-	return stream_open(inode, file);
+	return 0;
 }
 
-static ssize_t
-ixp4xx_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
+static int ixp4xx_wdt_stop(struct watchdog_device *wdd)
 {
-	if (len) {
-		if (!nowayout) {
-			size_t i;
-
-			clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-
-			for (i = 0; i != len; i++) {
-				char c;
-
-				if (get_user(c, data + i))
-					return -EFAULT;
-				if (c == 'V')
-					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
-			}
-		}
-		wdt_enable();
-	}
-	return len;
-}
+	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
 
-static const struct watchdog_info ident = {
-	.options	= WDIOF_CARDRESET | WDIOF_MAGICCLOSE |
-			  WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
-	.identity	= "IXP4xx Watchdog",
-};
+	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWE_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWK_OFFSET);
 
-
-static long ixp4xx_wdt_ioctl(struct file *file, unsigned int cmd,
-							unsigned long arg)
-{
-	int ret = -ENOTTY;
-	int time;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		ret = copy_to_user((struct watchdog_info *)arg, &ident,
-				   sizeof(ident)) ? -EFAULT : 0;
-		break;
-
-	case WDIOC_GETSTATUS:
-		ret = put_user(0, (int *)arg);
-		break;
-
-	case WDIOC_GETBOOTSTATUS:
-		ret = put_user(boot_status, (int *)arg);
-		break;
-
-	case WDIOC_KEEPALIVE:
-		wdt_enable();
-		ret = 0;
-		break;
-
-	case WDIOC_SETTIMEOUT:
-		ret = get_user(time, (int *)arg);
-		if (ret)
-			break;
-
-		if (time <= 0 || time > 60) {
-			ret = -EINVAL;
-			break;
-		}
-
-		heartbeat = time;
-		wdt_enable();
-		fallthrough;
-
-	case WDIOC_GETTIMEOUT:
-		ret = put_user(heartbeat, (int *)arg);
-		break;
-	}
-	return ret;
+	return 0;
 }
 
-static int ixp4xx_wdt_release(struct inode *inode, struct file *file)
+static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
+				  unsigned int timeout)
 {
-	if (test_bit(WDT_OK_TO_CLOSE, &wdt_status))
-		wdt_disable();
-	else
-		pr_crit("Device closed unexpectedly - timer will not stop\n");
-	clear_bit(WDT_IN_USE, &wdt_status);
-	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
+	wdd->timeout = timeout;
+	if (watchdog_active(wdd))
+		ixp4xx_wdt_start(wdd);
 
 	return 0;
 }
 
-
-static const struct file_operations ixp4xx_wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.write		= ixp4xx_wdt_write,
-	.unlocked_ioctl	= ixp4xx_wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= ixp4xx_wdt_open,
-	.release	= ixp4xx_wdt_release,
+static const struct watchdog_ops ixp4xx_wdt_ops = {
+	.start = ixp4xx_wdt_start,
+	.stop = ixp4xx_wdt_stop,
+	.set_timeout = ixp4xx_wdt_set_timeout,
+	.owner = THIS_MODULE,
 };
 
-static struct miscdevice ixp4xx_wdt_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &ixp4xx_wdt_fops,
+static const struct watchdog_info ixp4xx_wdt_info = {
+	.options = WDIOF_KEEPALIVEPING
+		| WDIOF_MAGICCLOSE
+		| WDIOF_SETTIMEOUT,
+	.identity = KBUILD_MODNAME,
 };
 
-static int __init ixp4xx_wdt_init(void)
+/* Devres-handled clock disablement */
+static void ixp4xx_clock_action(void *d)
+{
+	clk_disable_unprepare(d);
+}
+
+static int ixp4xx_wdt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct ixp4xx_wdt *iwdt;
+	struct clk *clk;
 	int ret;
 
-	/*
-	 * FIXME: we bail out on device tree boot but this really needs
-	 * to be fixed in a nicer way: this registers the MDIO bus before
-	 * even matching the driver infrastructure, we should only probe
-	 * detected hardware.
-	 */
-	if (of_have_populated_dt())
-		return -ENODEV;
 	if (!(read_cpuid_id() & 0xf) && !cpu_is_ixp46x()) {
-		pr_err("Rev. A0 IXP42x CPU detected - watchdog disabled\n");
-
+		dev_err(dev, "Rev. A0 IXP42x CPU detected - watchdog disabled\n");
 		return -ENODEV;
 	}
-	boot_status = (*IXP4XX_OSST & IXP4XX_OSST_TIMER_WARM_RESET) ?
-			WDIOF_CARDRESET : 0;
-	ret = misc_register(&ixp4xx_wdt_miscdev);
-	if (ret == 0)
-		pr_info("timer heartbeat %d sec\n", heartbeat);
-	return ret;
-}
 
-static void __exit ixp4xx_wdt_exit(void)
-{
-	misc_deregister(&ixp4xx_wdt_miscdev);
-}
+	iwdt = devm_kzalloc(dev, sizeof(*iwdt), GFP_KERNEL);
+	if (!iwdt)
+		return -ENOMEM;
+	iwdt->base = dev->platform_data;
 
+	/*
+	 * Retrieve rate from a fixed clock from the device tree if
+	 * the parent has that, else use the default clock rate.
+	 */
+	clk = devm_clk_get(dev->parent, NULL);
+	if (!IS_ERR(clk)) {
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(dev, ixp4xx_clock_action, clk);
+		if (ret)
+			return ret;
+		iwdt->rate = clk_get_rate(clk);
+	}
+	if (!iwdt->rate)
+		iwdt->rate = IXP4XX_TIMER_FREQ;
 
-module_init(ixp4xx_wdt_init);
-module_exit(ixp4xx_wdt_exit);
+	iwdt->wdd.info = &ixp4xx_wdt_info;
+	iwdt->wdd.ops = &ixp4xx_wdt_ops;
+	iwdt->wdd.min_timeout = 1;
+	iwdt->wdd.max_timeout = U32_MAX / iwdt->rate;
+	iwdt->wdd.parent = dev;
+	/* Default to 60 seconds */
+	iwdt->wdd.timeout = 60U;
+	watchdog_init_timeout(&iwdt->wdd, 0, dev);
 
-MODULE_AUTHOR("Deepak Saxena <dsaxena@plexity.net>");
-MODULE_DESCRIPTION("IXP4xx Network Processor Watchdog");
+	if (__raw_readl(iwdt->base + IXP4XX_OSST_OFFSET) &
+	    IXP4XX_OSST_TIMER_WARM_RESET)
+		iwdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	ret = devm_watchdog_register_device(dev, &iwdt->wdd);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "IXP4xx watchdog available\n");
 
-module_param(heartbeat, int, 0);
-MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds (default 60s)");
+	return 0;
+}
 
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started");
+static struct platform_driver ixp4xx_wdt_driver = {
+	.probe = ixp4xx_wdt_probe,
+	.driver = {
+		.name   = "ixp4xx-watchdog",
+	},
+};
+module_platform_driver(ixp4xx_wdt_driver);
 
+MODULE_AUTHOR("Deepak Saxena <dsaxena@plexity.net>");
+MODULE_DESCRIPTION("IXP4xx Network Processor Watchdog");
 MODULE_LICENSE("GPL");
-- 
2.31.1

