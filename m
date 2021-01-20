Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4582FD5BF
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 17:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbhATQcG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 11:32:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:46302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404047AbhATQ3V (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 11:29:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D682233F7;
        Wed, 20 Jan 2021 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611160080;
        bh=LnUV+hFL+Xwa15dWXaTs7it/pxp2PINo57tMZTpMIoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZ+B0jYI96pSgfPuQskSiVzZhDEfw7qz4qwws+KtYcKT+tO6iakXjKQtPX3Pihsfk
         u9xr0bpySexycyFMY49qVz7e+wSABSVBIfpdzunQ7J2NURPhAAR3j1ydsRRMZgGMc2
         YfeZTK0Ly5BvQPt8FFhv2OhLliXbAJf3zRUEkl+AHCrb+ui9vguiAGzB4XMHSVHG+w
         RuX93qGLntbn2LrFKevf4sHK1QMcQ99a8D8PawHRsgLW2XSrRjbsYGWvtjvdk9pD9m
         KH1mvFGRlWrBZw++jUDVCxX67O7UR8a8IMC8nUgsrjr0QqCs3zq22+0gO4YUopyQZM
         IjzyNl7a3fI1g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] watchdog: remove coh901 driver
Date:   Wed, 20 Jan 2021 17:27:45 +0100
Message-Id: <20210120162745.61268-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120162745.61268-1-arnd@kernel.org>
References: <20210120162745.61268-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The ST-Ericsson U300 platform is getting removed, so this driver is no
longer needed.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../watchdog/stericsson-coh901327.txt         |  19 -
 drivers/watchdog/Kconfig                      |  11 -
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/coh901327_wdt.c              | 408 ------------------
 4 files changed, 439 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
 delete mode 100644 drivers/watchdog/coh901327_wdt.c

diff --git a/Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt b/Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
deleted file mode 100644
index 8ffb88e39e76..000000000000
--- a/Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-ST-Ericsson COH 901 327 Watchdog timer
-
-Required properties:
-- compatible: must be "stericsson,coh901327".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: the interrupt used for the watchdog timeout warning.
-
-Optional properties:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-watchdog: watchdog@c0012000 {
-	compatible = "stericsson,coh901327";
-	reg = <0xc0012000 0x1000>;
-	interrupts = <3>;
-	timeout-sec = <60>;
-};
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 10efbb351f14..3b73735b0c8b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -619,17 +619,6 @@ config SUNXI_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called sunxi_wdt.
 
-config COH901327_WATCHDOG
-	bool "ST-Ericsson COH 901 327 watchdog"
-	depends on ARCH_U300 || (ARM && COMMON_CLK && COMPILE_TEST)
-	default y if MACH_U300
-	select WATCHDOG_CORE
-	help
-	  Say Y here to include Watchdog timer support for the
-	  watchdog embedded into the ST-Ericsson U300 series platforms.
-	  This watchdog is used to reset the system and thus cannot be
-	  compiled as a module.
-
 config NPCM7XX_WATCHDOG
 	tristate "Nuvoton NPCM750 watchdog"
 	depends on ARCH_NPCM || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1ff40d6a027f..1685dbc70a15 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -61,7 +61,6 @@ obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
 obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
 obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
 obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
-obj-$(CONFIG_COH901327_WATCHDOG) += coh901327_wdt.o
 obj-$(CONFIG_NPCM7XX_WATCHDOG) += npcm_wdt.o
 obj-$(CONFIG_STMP3XXX_RTC_WATCHDOG) += stmp3xxx_rtc_wdt.o
 obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
diff --git a/drivers/watchdog/coh901327_wdt.c b/drivers/watchdog/coh901327_wdt.c
deleted file mode 100644
index 260c50b08483..000000000000
--- a/drivers/watchdog/coh901327_wdt.c
+++ /dev/null
@@ -1,408 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * coh901327_wdt.c
- *
- * Copyright (C) 2008-2009 ST-Ericsson AB
- * Watchdog driver for the ST-Ericsson AB COH 901 327 IP core
- * Author: Linus Walleij <linus.walleij@stericsson.com>
- */
-#include <linux/moduleparam.h>
-#include <linux/mod_devicetable.h>
-#include <linux/types.h>
-#include <linux/watchdog.h>
-#include <linux/interrupt.h>
-#include <linux/pm.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/bitops.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-
-#define DRV_NAME "WDOG COH 901 327"
-
-/*
- * COH 901 327 register definitions
- */
-
-/* WDOG_FEED Register 32bit (-/W) */
-#define U300_WDOG_FR							0x00
-#define U300_WDOG_FR_FEED_RESTART_TIMER					0xFEEDU
-/* WDOG_TIMEOUT Register 32bit (R/W) */
-#define U300_WDOG_TR							0x04
-#define U300_WDOG_TR_TIMEOUT_MASK					0x7FFFU
-/* WDOG_DISABLE1 Register 32bit (-/W) */
-#define U300_WDOG_D1R							0x08
-#define U300_WDOG_D1R_DISABLE1_DISABLE_TIMER				0x2BADU
-/* WDOG_DISABLE2 Register 32bit (R/W) */
-#define U300_WDOG_D2R							0x0C
-#define U300_WDOG_D2R_DISABLE2_DISABLE_TIMER				0xCAFEU
-#define U300_WDOG_D2R_DISABLE_STATUS_DISABLED				0xDABEU
-#define U300_WDOG_D2R_DISABLE_STATUS_ENABLED				0x0000U
-/* WDOG_STATUS Register 32bit (R/W) */
-#define U300_WDOG_SR							0x10
-#define U300_WDOG_SR_STATUS_TIMED_OUT					0xCFE8U
-#define U300_WDOG_SR_STATUS_NORMAL					0x0000U
-#define U300_WDOG_SR_RESET_STATUS_RESET					0xE8B4U
-/* WDOG_COUNT Register 32bit (R/-) */
-#define U300_WDOG_CR							0x14
-#define U300_WDOG_CR_VALID_IND						0x8000U
-#define U300_WDOG_CR_VALID_STABLE					0x0000U
-#define U300_WDOG_CR_COUNT_VALUE_MASK					0x7FFFU
-/* WDOG_JTAGOVR Register 32bit (R/W) */
-#define U300_WDOG_JOR							0x18
-#define U300_WDOG_JOR_JTAG_MODE_IND					0x0002U
-#define U300_WDOG_JOR_JTAG_WATCHDOG_ENABLE				0x0001U
-/* WDOG_RESTART Register 32bit (-/W) */
-#define U300_WDOG_RR							0x1C
-#define U300_WDOG_RR_RESTART_VALUE_RESUME				0xACEDU
-/* WDOG_IRQ_EVENT Register 32bit (R/W) */
-#define U300_WDOG_IER							0x20
-#define U300_WDOG_IER_WILL_BARK_IRQ_EVENT_IND				0x0001U
-#define U300_WDOG_IER_WILL_BARK_IRQ_ACK_ENABLE				0x0001U
-/* WDOG_IRQ_MASK Register 32bit (R/W) */
-#define U300_WDOG_IMR							0x24
-#define U300_WDOG_IMR_WILL_BARK_IRQ_ENABLE				0x0001U
-/* WDOG_IRQ_FORCE Register 32bit (R/W) */
-#define U300_WDOG_IFR							0x28
-#define U300_WDOG_IFR_WILL_BARK_IRQ_FORCE_ENABLE			0x0001U
-
-/* Default timeout in seconds = 1 minute */
-#define U300_WDOG_DEFAULT_TIMEOUT					60
-
-static unsigned int margin;
-static int irq;
-static void __iomem *virtbase;
-static struct device *parent;
-
-static struct clk *clk;
-
-/*
- * Enabling and disabling functions.
- */
-static void coh901327_enable(u16 timeout)
-{
-	u16 val;
-	unsigned long freq;
-	unsigned long delay_ns;
-
-	/* Restart timer if it is disabled */
-	val = readw(virtbase + U300_WDOG_D2R);
-	if (val == U300_WDOG_D2R_DISABLE_STATUS_DISABLED)
-		writew(U300_WDOG_RR_RESTART_VALUE_RESUME,
-		       virtbase + U300_WDOG_RR);
-	/* Acknowledge any pending interrupt so it doesn't just fire off */
-	writew(U300_WDOG_IER_WILL_BARK_IRQ_ACK_ENABLE,
-	       virtbase + U300_WDOG_IER);
-	/*
-	 * The interrupt is cleared in the 32 kHz clock domain.
-	 * Wait 3 32 kHz cycles for it to take effect
-	 */
-	freq = clk_get_rate(clk);
-	delay_ns = DIV_ROUND_UP(1000000000, freq); /* Freq to ns and round up */
-	delay_ns = 3 * delay_ns; /* Wait 3 cycles */
-	ndelay(delay_ns);
-	/* Enable the watchdog interrupt */
-	writew(U300_WDOG_IMR_WILL_BARK_IRQ_ENABLE, virtbase + U300_WDOG_IMR);
-	/* Activate the watchdog timer */
-	writew(timeout, virtbase + U300_WDOG_TR);
-	/* Start the watchdog timer */
-	writew(U300_WDOG_FR_FEED_RESTART_TIMER, virtbase + U300_WDOG_FR);
-	/*
-	 * Extra read so that this change propagate in the watchdog.
-	 */
-	(void) readw(virtbase + U300_WDOG_CR);
-	val = readw(virtbase + U300_WDOG_D2R);
-	if (val != U300_WDOG_D2R_DISABLE_STATUS_ENABLED)
-		dev_err(parent,
-			"%s(): watchdog not enabled! D2R value %04x\n",
-			__func__, val);
-}
-
-static void coh901327_disable(void)
-{
-	u16 val;
-
-	/* Disable the watchdog interrupt if it is active */
-	writew(0x0000U, virtbase + U300_WDOG_IMR);
-	/* If the watchdog is currently enabled, attempt to disable it */
-	val = readw(virtbase + U300_WDOG_D2R);
-	if (val != U300_WDOG_D2R_DISABLE_STATUS_DISABLED) {
-		writew(U300_WDOG_D1R_DISABLE1_DISABLE_TIMER,
-		       virtbase + U300_WDOG_D1R);
-		writew(U300_WDOG_D2R_DISABLE2_DISABLE_TIMER,
-		       virtbase + U300_WDOG_D2R);
-		/* Write this twice (else problems occur) */
-		writew(U300_WDOG_D2R_DISABLE2_DISABLE_TIMER,
-		       virtbase + U300_WDOG_D2R);
-	}
-	val = readw(virtbase + U300_WDOG_D2R);
-	if (val != U300_WDOG_D2R_DISABLE_STATUS_DISABLED)
-		dev_err(parent,
-			"%s(): watchdog not disabled! D2R value %04x\n",
-			__func__, val);
-}
-
-static int coh901327_start(struct watchdog_device *wdt_dev)
-{
-	coh901327_enable(wdt_dev->timeout * 100);
-	return 0;
-}
-
-static int coh901327_stop(struct watchdog_device *wdt_dev)
-{
-	coh901327_disable();
-	return 0;
-}
-
-static int coh901327_ping(struct watchdog_device *wdd)
-{
-	/* Feed the watchdog */
-	writew(U300_WDOG_FR_FEED_RESTART_TIMER,
-	       virtbase + U300_WDOG_FR);
-	return 0;
-}
-
-static int coh901327_settimeout(struct watchdog_device *wdt_dev,
-				unsigned int time)
-{
-	wdt_dev->timeout = time;
-	/* Set new timeout value */
-	writew(time * 100, virtbase + U300_WDOG_TR);
-	/* Feed the dog */
-	writew(U300_WDOG_FR_FEED_RESTART_TIMER,
-	       virtbase + U300_WDOG_FR);
-	return 0;
-}
-
-static unsigned int coh901327_gettimeleft(struct watchdog_device *wdt_dev)
-{
-	u16 val;
-
-	/* Read repeatedly until the value is stable! */
-	val = readw(virtbase + U300_WDOG_CR);
-	while (val & U300_WDOG_CR_VALID_IND)
-		val = readw(virtbase + U300_WDOG_CR);
-	val &= U300_WDOG_CR_COUNT_VALUE_MASK;
-	if (val != 0)
-		val /= 100;
-
-	return val;
-}
-
-/*
- * This interrupt occurs 10 ms before the watchdog WILL bark.
- */
-static irqreturn_t coh901327_interrupt(int irq, void *data)
-{
-	u16 val;
-
-	/*
-	 * Ack IRQ? If this occurs we're FUBAR anyway, so
-	 * just acknowledge, disable the interrupt and await the imminent end.
-	 * If you at some point need a host of callbacks to be called
-	 * when the system is about to watchdog-reset, add them here!
-	 *
-	 * NOTE: on future versions of this IP-block, it will be possible
-	 * to prevent a watchdog reset by feeding the watchdog at this
-	 * point.
-	 */
-	val = readw(virtbase + U300_WDOG_IER);
-	if (val == U300_WDOG_IER_WILL_BARK_IRQ_EVENT_IND)
-		writew(U300_WDOG_IER_WILL_BARK_IRQ_ACK_ENABLE,
-		       virtbase + U300_WDOG_IER);
-	writew(0x0000U, virtbase + U300_WDOG_IMR);
-	dev_crit(parent, "watchdog is barking!\n");
-	return IRQ_HANDLED;
-}
-
-static const struct watchdog_info coh901327_ident = {
-	.options = WDIOF_CARDRESET | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
-	.identity = DRV_NAME,
-};
-
-static const struct watchdog_ops coh901327_ops = {
-	.owner = THIS_MODULE,
-	.start = coh901327_start,
-	.stop = coh901327_stop,
-	.ping = coh901327_ping,
-	.set_timeout = coh901327_settimeout,
-	.get_timeleft = coh901327_gettimeleft,
-};
-
-static struct watchdog_device coh901327_wdt = {
-	.info = &coh901327_ident,
-	.ops = &coh901327_ops,
-	/*
-	 * Max timeout is 327 since the 10ms
-	 * timeout register is max
-	 * 0x7FFF = 327670ms ~= 327s.
-	 */
-	.min_timeout = 1,
-	.max_timeout = 327,
-	.timeout = U300_WDOG_DEFAULT_TIMEOUT,
-};
-
-static int __init coh901327_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	int ret;
-	u16 val;
-
-	parent = dev;
-
-	virtbase = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(virtbase))
-		return PTR_ERR(virtbase);
-
-	clk = clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		dev_err(dev, "could not get clock\n");
-		return ret;
-	}
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "could not prepare and enable clock\n");
-		goto out_no_clk_enable;
-	}
-
-	val = readw(virtbase + U300_WDOG_SR);
-	switch (val) {
-	case U300_WDOG_SR_STATUS_TIMED_OUT:
-		dev_info(dev, "watchdog timed out since last chip reset!\n");
-		coh901327_wdt.bootstatus |= WDIOF_CARDRESET;
-		/* Status will be cleared below */
-		break;
-	case U300_WDOG_SR_STATUS_NORMAL:
-		dev_info(dev, "in normal status, no timeouts have occurred.\n");
-		break;
-	default:
-		dev_info(dev, "contains an illegal status code (%08x)\n", val);
-		break;
-	}
-
-	val = readw(virtbase + U300_WDOG_D2R);
-	switch (val) {
-	case U300_WDOG_D2R_DISABLE_STATUS_DISABLED:
-		dev_info(dev, "currently disabled.\n");
-		break;
-	case U300_WDOG_D2R_DISABLE_STATUS_ENABLED:
-		dev_info(dev, "currently enabled! (disabling it now)\n");
-		coh901327_disable();
-		break;
-	default:
-		dev_err(dev, "contains an illegal enable/disable code (%08x)\n",
-			val);
-		break;
-	}
-
-	/* Reset the watchdog */
-	writew(U300_WDOG_SR_RESET_STATUS_RESET, virtbase + U300_WDOG_SR);
-
-	irq = platform_get_irq(pdev, 0);
-	if (request_irq(irq, coh901327_interrupt, 0,
-			DRV_NAME " Bark", pdev)) {
-		ret = -EIO;
-		goto out_no_irq;
-	}
-
-	watchdog_init_timeout(&coh901327_wdt, margin, dev);
-
-	coh901327_wdt.parent = dev;
-	ret = watchdog_register_device(&coh901327_wdt);
-	if (ret)
-		goto out_no_wdog;
-
-	dev_info(dev, "initialized. (timeout=%d sec)\n",
-			coh901327_wdt.timeout);
-	return 0;
-
-out_no_wdog:
-	free_irq(irq, pdev);
-out_no_irq:
-	clk_disable_unprepare(clk);
-out_no_clk_enable:
-	clk_put(clk);
-	return ret;
-}
-
-#ifdef CONFIG_PM
-
-static u16 wdogenablestore;
-static u16 irqmaskstore;
-
-static int coh901327_suspend(struct platform_device *pdev, pm_message_t state)
-{
-	irqmaskstore = readw(virtbase + U300_WDOG_IMR) & 0x0001U;
-	wdogenablestore = readw(virtbase + U300_WDOG_D2R);
-	/* If watchdog is on, disable it here and now */
-	if (wdogenablestore == U300_WDOG_D2R_DISABLE_STATUS_ENABLED)
-		coh901327_disable();
-	return 0;
-}
-
-static int coh901327_resume(struct platform_device *pdev)
-{
-	/* Restore the watchdog interrupt */
-	writew(irqmaskstore, virtbase + U300_WDOG_IMR);
-	if (wdogenablestore == U300_WDOG_D2R_DISABLE_STATUS_ENABLED) {
-		/* Restart the watchdog timer */
-		writew(U300_WDOG_RR_RESTART_VALUE_RESUME,
-		       virtbase + U300_WDOG_RR);
-		writew(U300_WDOG_FR_FEED_RESTART_TIMER,
-		       virtbase + U300_WDOG_FR);
-	}
-	return 0;
-}
-#else
-#define coh901327_suspend NULL
-#define coh901327_resume  NULL
-#endif
-
-/*
- * Mistreating the watchdog is the only way to perform a software reset of the
- * system on EMP platforms. So we implement this and export a symbol for it.
- */
-void coh901327_watchdog_reset(void)
-{
-	/* Enable even if on JTAG too */
-	writew(U300_WDOG_JOR_JTAG_WATCHDOG_ENABLE,
-	       virtbase + U300_WDOG_JOR);
-	/*
-	 * Timeout = 5s, we have to wait for the watchdog reset to
-	 * actually take place: the watchdog will be reloaded with the
-	 * default value immediately, so we HAVE to reboot and get back
-	 * into the kernel in 30s, or the device will reboot again!
-	 * The boot loader will typically deactivate the watchdog, so we
-	 * need time enough for the boot loader to get to the point of
-	 * deactivating the watchdog before it is shut down by it.
-	 *
-	 * NOTE: on future versions of the watchdog, this restriction is
-	 * gone: the watchdog will be reloaded with a default value (1 min)
-	 * instead of last value, and you can conveniently set the watchdog
-	 * timeout to 10ms (value = 1) without any problems.
-	 */
-	coh901327_enable(500);
-	/* Return and await doom */
-}
-
-static const struct of_device_id coh901327_dt_match[] = {
-	{ .compatible = "stericsson,coh901327" },
-	{},
-};
-
-static struct platform_driver coh901327_driver = {
-	.driver = {
-		.name	= "coh901327_wdog",
-		.of_match_table = coh901327_dt_match,
-		.suppress_bind_attrs = true,
-	},
-	.suspend	= coh901327_suspend,
-	.resume		= coh901327_resume,
-};
-builtin_platform_driver_probe(coh901327_driver, coh901327_probe);
-
-/* not really modular, but ... */
-module_param(margin, uint, 0);
-MODULE_PARM_DESC(margin, "Watchdog margin in seconds (default 60s)");
-- 
2.29.2

