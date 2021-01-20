Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED03C2FD5A6
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 17:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404039AbhATQ2u (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 11:28:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:46124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404029AbhATQ2k (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 11:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A72C233EF;
        Wed, 20 Jan 2021 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611160078;
        bh=jPW3DWnen6gp/eVSJofcmx953mXWqom339hMbgq0tXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KXuzufr9iuru6KOWWMcZp0a8VOXD4+ZN/gA87wSieCBKT+fUCGprL9XiE8WzqpdOt
         Qa9jCxeQyreDsCvFPtAI0OgqHw9A6kP2mi/NKzKqd5TFB7hS8XU3Gp7PBS0nhq/3HL
         E/b2mCfIqyg8OAOzvsEj1KM20sHm0ireZACBQgHVm7nsGCXSUVFBTcGhJVluUoLYAP
         U1emkGVWAGhvMXvo3fets0VB4Qdts4S6Wul0qIWsDV8Ap8GHcYPC1PjvhecuSjk6YI
         qP5m/5+G3Dj404/W0cfVS+RiDCZd+PBekcbFhPJnczf01HciqaZR8WOCBM9uDKEnfU
         mE3hql7XFqtEQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
Subject: [PATCH 4/5] watchdog: remove tango driver
Date:   Wed, 20 Jan 2021 17:27:44 +0100
Message-Id: <20210120162745.61268-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120162745.61268-1-arnd@kernel.org>
References: <20210120162745.61268-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The tango platform is getting removed, so the driver is no
longer needed.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Mans Rullgard <mans@mansr.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/Kconfig      |  11 --
 drivers/watchdog/Makefile     |   1 -
 drivers/watchdog/tangox_wdt.c | 209 ----------------------------------
 3 files changed, 221 deletions(-)
 delete mode 100644 drivers/watchdog/tangox_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c36f8233f60b..10efbb351f14 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -254,17 +254,6 @@ config MENZ069_WATCHDOG
 	  This driver can also be built as a module. If so the module
 	  will be called menz069_wdt.
 
-config TANGOX_WATCHDOG
-	tristate "Sigma Designs SMP86xx/SMP87xx watchdog"
-	select WATCHDOG_CORE
-	depends on ARCH_TANGO || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  Support for the watchdog in Sigma Designs SMP86xx (tango3)
-	  and SMP87xx (tango4) family chips.
-
-	  This driver can be built as a module. The module name is tangox_wdt.
-
 config WDAT_WDT
 	tristate "ACPI Watchdog Action Table (WDAT)"
 	depends on ACPI
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 7a95b280cd9f..1ff40d6a027f 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -210,7 +210,6 @@ obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
 obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
 obj-$(CONFIG_DA9063_WATCHDOG) += da9063_wdt.o
 obj-$(CONFIG_GPIO_WATCHDOG)	+= gpio_wdt.o
-obj-$(CONFIG_TANGOX_WATCHDOG) += tangox_wdt.o
 obj-$(CONFIG_WDAT_WDT) += wdat_wdt.o
 obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
 obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
diff --git a/drivers/watchdog/tangox_wdt.c b/drivers/watchdog/tangox_wdt.c
deleted file mode 100644
index 1afb0e9d808c..000000000000
--- a/drivers/watchdog/tangox_wdt.c
+++ /dev/null
@@ -1,209 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *  Copyright (C) 2015 Mans Rullgard <mans@mansr.com>
- *  SMP86xx/SMP87xx Watchdog driver
- */
-
-#include <linux/bitops.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-#include <linux/watchdog.h>
-
-#define DEFAULT_TIMEOUT 30
-
-static bool nowayout = WATCHDOG_NOWAYOUT;
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout,
-		 "Watchdog cannot be stopped once started (default="
-		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-
-static unsigned int timeout;
-module_param(timeout, int, 0);
-MODULE_PARM_DESC(timeout, "Watchdog timeout");
-
-/*
- * Counter counts down from programmed value.  Reset asserts when
- * the counter reaches 1.
- */
-#define WD_COUNTER		0
-
-#define WD_CONFIG		4
-#define WD_CONFIG_XTAL_IN	BIT(0)
-#define WD_CONFIG_DISABLE	BIT(31)
-
-struct tangox_wdt_device {
-	struct watchdog_device wdt;
-	void __iomem *base;
-	unsigned long clk_rate;
-	struct clk *clk;
-};
-
-static int tangox_wdt_set_timeout(struct watchdog_device *wdt,
-				  unsigned int new_timeout)
-{
-	wdt->timeout = new_timeout;
-
-	return 0;
-}
-
-static int tangox_wdt_start(struct watchdog_device *wdt)
-{
-	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
-	u32 ticks;
-
-	ticks = 1 + wdt->timeout * dev->clk_rate;
-	writel(ticks, dev->base + WD_COUNTER);
-
-	return 0;
-}
-
-static int tangox_wdt_stop(struct watchdog_device *wdt)
-{
-	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
-
-	writel(0, dev->base + WD_COUNTER);
-
-	return 0;
-}
-
-static unsigned int tangox_wdt_get_timeleft(struct watchdog_device *wdt)
-{
-	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
-	u32 count;
-
-	count = readl(dev->base + WD_COUNTER);
-
-	if (!count)
-		return 0;
-
-	return (count - 1) / dev->clk_rate;
-}
-
-static const struct watchdog_info tangox_wdt_info = {
-	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
-	.identity = "tangox watchdog",
-};
-
-static int tangox_wdt_restart(struct watchdog_device *wdt,
-			      unsigned long action, void *data)
-{
-	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
-
-	writel(1, dev->base + WD_COUNTER);
-
-	return 0;
-}
-
-static const struct watchdog_ops tangox_wdt_ops = {
-	.start		= tangox_wdt_start,
-	.stop		= tangox_wdt_stop,
-	.set_timeout	= tangox_wdt_set_timeout,
-	.get_timeleft	= tangox_wdt_get_timeleft,
-	.restart	= tangox_wdt_restart,
-};
-
-static void tangox_clk_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int tangox_wdt_probe(struct platform_device *pdev)
-{
-	struct tangox_wdt_device *dev;
-	u32 config;
-	int err;
-
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
-		return -ENOMEM;
-
-	dev->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dev->base))
-		return PTR_ERR(dev->base);
-
-	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk))
-		return PTR_ERR(dev->clk);
-
-	err = clk_prepare_enable(dev->clk);
-	if (err)
-		return err;
-	err = devm_add_action_or_reset(&pdev->dev,
-				       tangox_clk_disable_unprepare, dev->clk);
-	if (err)
-		return err;
-
-	dev->clk_rate = clk_get_rate(dev->clk);
-	if (!dev->clk_rate)
-		return -EINVAL;
-
-	dev->wdt.parent = &pdev->dev;
-	dev->wdt.info = &tangox_wdt_info;
-	dev->wdt.ops = &tangox_wdt_ops;
-	dev->wdt.timeout = DEFAULT_TIMEOUT;
-	dev->wdt.min_timeout = 1;
-	dev->wdt.max_hw_heartbeat_ms = (U32_MAX - 1) / dev->clk_rate;
-
-	watchdog_init_timeout(&dev->wdt, timeout, &pdev->dev);
-	watchdog_set_nowayout(&dev->wdt, nowayout);
-	watchdog_set_drvdata(&dev->wdt, dev);
-
-	/*
-	 * Deactivate counter if disable bit is set to avoid
-	 * accidental reset.
-	 */
-	config = readl(dev->base + WD_CONFIG);
-	if (config & WD_CONFIG_DISABLE)
-		writel(0, dev->base + WD_COUNTER);
-
-	writel(WD_CONFIG_XTAL_IN, dev->base + WD_CONFIG);
-
-	/*
-	 * Mark as active and restart with configured timeout if
-	 * already running.
-	 */
-	if (readl(dev->base + WD_COUNTER)) {
-		set_bit(WDOG_HW_RUNNING, &dev->wdt.status);
-		tangox_wdt_start(&dev->wdt);
-	}
-
-	watchdog_set_restart_priority(&dev->wdt, 128);
-
-	watchdog_stop_on_unregister(&dev->wdt);
-	err = devm_watchdog_register_device(&pdev->dev, &dev->wdt);
-	if (err)
-		return err;
-
-	platform_set_drvdata(pdev, dev);
-
-	dev_info(&pdev->dev, "SMP86xx/SMP87xx watchdog registered\n");
-
-	return 0;
-}
-
-static const struct of_device_id tangox_wdt_dt_ids[] = {
-	{ .compatible = "sigma,smp8642-wdt" },
-	{ .compatible = "sigma,smp8759-wdt" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, tangox_wdt_dt_ids);
-
-static struct platform_driver tangox_wdt_driver = {
-	.probe	= tangox_wdt_probe,
-	.driver	= {
-		.name		= "tangox-wdt",
-		.of_match_table	= tangox_wdt_dt_ids,
-	},
-};
-
-module_platform_driver(tangox_wdt_driver);
-
-MODULE_AUTHOR("Mans Rullgard <mans@mansr.com>");
-MODULE_DESCRIPTION("SMP86xx/SMP87xx Watchdog driver");
-MODULE_LICENSE("GPL");
-- 
2.29.2

