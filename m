Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4CD2FD5A5
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 17:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404030AbhATQ2r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 11:28:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:46102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404027AbhATQ2i (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 11:28:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55155233EE;
        Wed, 20 Jan 2021 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611160076;
        bh=7TGl8HqFqI9FAYY9FCNFdEC8Z9zVI6dvTu3BosBJog4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qljxx9wZaWFVhlZfYQufR4XUqH0wOq4857aBe841fZQVYZUMn1bPvTx84dWhNnHjp
         GLxxCdJL30e6JWGuGx8WfkEdWIayFsJhVxQaWwGhMQ2lY4B1t1ixqGSdQgUIE1Ib3N
         MGErghUKbPZDBeqLrEkcvB0wNT/3P/Fb+3+mAhYgqPMjIv7Naz8BPHrSDQoEgOtdEy
         QqaPBhNcKPjpbr4PVjKi0tFTvGd8bbjq3Nw5tcj0k3DSW7AnUlYDtUKMIRKyduCraG
         +VtCjd2UBr9farNYdclxARj2D4uArAUzjHCH+bwQD+MtKYN9gJGOHeQV7nHLGB7bbd
         g3VverGkA2W0g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 3/5] watchdog: remove zte zx driver
Date:   Wed, 20 Jan 2021 17:27:43 +0100
Message-Id: <20210120162745.61268-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120162745.61268-1-arnd@kernel.org>
References: <20210120162745.61268-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The zte zx platform is getting removed, so this driver is no
longer needed.

Cc: Jun Nie <jun.nie@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/watchdog/zte,zx2967-wdt.txt      |  32 --
 drivers/watchdog/Kconfig                      |  10 -
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/zx2967_wdt.c                 | 279 ------------------
 4 files changed, 322 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
 delete mode 100644 drivers/watchdog/zx2967_wdt.c

diff --git a/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt b/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
deleted file mode 100644
index 06ce67766756..000000000000
--- a/Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-ZTE zx2967 Watchdog timer
-
-Required properties:
-
-- compatible : should be one of the following.
-       * zte,zx296718-wdt
-- reg : Specifies base physical address and size of the registers.
-- clocks : Pairs of phandle and specifier referencing the controller's clocks.
-- resets : Reference to the reset controller controlling the watchdog
-           controller.
-
-Optional properties:
-
-- timeout-sec : Contains the watchdog timeout in seconds.
-- zte,wdt-reset-sysctrl : Directs how to reset system by the watchdog.
-	if we don't want to restart system when watchdog been triggered,
-	it's not required, vice versa.
-	It should include following fields.
-	  * phandle of aon-sysctrl.
-	  * offset of register that be written, should be 0xb0.
-	  * configure value that be written to aon-sysctrl.
-	  * bit mask, corresponding bits will be affected.
-
-Example:
-
-wdt: watchdog@1465000 {
-	compatible = "zte,zx296718-wdt";
-	reg = <0x1465000 0x1000>;
-	clocks = <&topcrm WDT_WCLK>;
-	resets = <&toprst 35>;
-	zte,wdt-reset-sysctrl = <&aon_sysctrl 0xb0 1 0x115>;
-};
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 5559e4325f6a..c36f8233f60b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -919,16 +919,6 @@ config ASPEED_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called aspeed_wdt.
 
-config ZX2967_WATCHDOG
-	tristate "ZTE zx2967 SoCs watchdog support"
-	depends on ARCH_ZX
-	select WATCHDOG_CORE
-	help
-	  Say Y here to include support for the watchdog timer
-	  in ZTE zx2967 SoCs.
-	  To compile this driver as a module, choose M here: the
-	  module will be called zx2967_wdt.
-
 config STM32_WATCHDOG
 	tristate "STM32 Independent WatchDoG (IWDG) support"
 	depends on ARCH_STM32
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 40b94403c487..7a95b280cd9f 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -86,7 +86,6 @@ obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
 obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
 obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
 obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
-obj-$(CONFIG_ZX2967_WATCHDOG) += zx2967_wdt.o
 obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
 obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
 obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
diff --git a/drivers/watchdog/zx2967_wdt.c b/drivers/watchdog/zx2967_wdt.c
deleted file mode 100644
index bf183e73671a..000000000000
--- a/drivers/watchdog/zx2967_wdt.c
+++ /dev/null
@@ -1,279 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * watchdog driver for ZTE's zx2967 family
- *
- * Copyright (C) 2017 ZTE Ltd.
- *
- * Author: Baoyou Xie <baoyou.xie@linaro.org>
- */
-
-#include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/mfd/syscon.h>
-#include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/reset.h>
-#include <linux/watchdog.h>
-
-#define ZX2967_WDT_CFG_REG			0x4
-#define ZX2967_WDT_LOAD_REG			0x8
-#define ZX2967_WDT_REFRESH_REG			0x18
-#define ZX2967_WDT_START_REG			0x1c
-
-#define ZX2967_WDT_REFRESH_MASK			GENMASK(5, 0)
-
-#define ZX2967_WDT_CFG_DIV(n)			((((n) & 0xff) - 1) << 8)
-#define ZX2967_WDT_START_EN			0x1
-
-/*
- * Hardware magic number.
- * When watchdog reg is written, the lowest 16 bits are valid, but
- * the highest 16 bits should be always this number.
- */
-#define ZX2967_WDT_WRITEKEY			(0x1234 << 16)
-#define ZX2967_WDT_VAL_MASK			GENMASK(15, 0)
-
-#define ZX2967_WDT_DIV_DEFAULT			16
-#define ZX2967_WDT_DEFAULT_TIMEOUT		32
-#define ZX2967_WDT_MIN_TIMEOUT			1
-#define ZX2967_WDT_MAX_TIMEOUT			524
-#define ZX2967_WDT_MAX_COUNT			0xffff
-
-#define ZX2967_WDT_CLK_FREQ			0x8000
-
-#define ZX2967_WDT_FLAG_REBOOT_MON		BIT(0)
-
-struct zx2967_wdt {
-	struct watchdog_device	wdt_device;
-	void __iomem		*reg_base;
-	struct clk		*clock;
-};
-
-static inline u32 zx2967_wdt_readl(struct zx2967_wdt *wdt, u16 reg)
-{
-	return readl_relaxed(wdt->reg_base + reg);
-}
-
-static inline void zx2967_wdt_writel(struct zx2967_wdt *wdt, u16 reg, u32 val)
-{
-	writel_relaxed(val | ZX2967_WDT_WRITEKEY, wdt->reg_base + reg);
-}
-
-static void zx2967_wdt_refresh(struct zx2967_wdt *wdt)
-{
-	u32 val;
-
-	val = zx2967_wdt_readl(wdt, ZX2967_WDT_REFRESH_REG);
-	/*
-	 * Bit 4-5, 1 and 2: refresh config info
-	 * Bit 2-3, 1 and 2: refresh counter
-	 * Bit 0-1, 1 and 2: refresh int-value
-	 * we shift each group value between 1 and 2 to refresh all data.
-	 */
-	val ^= ZX2967_WDT_REFRESH_MASK;
-	zx2967_wdt_writel(wdt, ZX2967_WDT_REFRESH_REG,
-			  val & ZX2967_WDT_VAL_MASK);
-}
-
-static int
-zx2967_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
-{
-	struct zx2967_wdt *wdt = watchdog_get_drvdata(wdd);
-	unsigned int divisor = ZX2967_WDT_DIV_DEFAULT;
-	u32 count;
-
-	count = timeout * ZX2967_WDT_CLK_FREQ;
-	if (count > divisor * ZX2967_WDT_MAX_COUNT)
-		divisor = DIV_ROUND_UP(count, ZX2967_WDT_MAX_COUNT);
-	count = DIV_ROUND_UP(count, divisor);
-	zx2967_wdt_writel(wdt, ZX2967_WDT_CFG_REG,
-			ZX2967_WDT_CFG_DIV(divisor) & ZX2967_WDT_VAL_MASK);
-	zx2967_wdt_writel(wdt, ZX2967_WDT_LOAD_REG,
-			count & ZX2967_WDT_VAL_MASK);
-	zx2967_wdt_refresh(wdt);
-	wdd->timeout =  (count * divisor) / ZX2967_WDT_CLK_FREQ;
-
-	return 0;
-}
-
-static void __zx2967_wdt_start(struct zx2967_wdt *wdt)
-{
-	u32 val;
-
-	val = zx2967_wdt_readl(wdt, ZX2967_WDT_START_REG);
-	val |= ZX2967_WDT_START_EN;
-	zx2967_wdt_writel(wdt, ZX2967_WDT_START_REG,
-			val & ZX2967_WDT_VAL_MASK);
-}
-
-static void __zx2967_wdt_stop(struct zx2967_wdt *wdt)
-{
-	u32 val;
-
-	val = zx2967_wdt_readl(wdt, ZX2967_WDT_START_REG);
-	val &= ~ZX2967_WDT_START_EN;
-	zx2967_wdt_writel(wdt, ZX2967_WDT_START_REG,
-			val & ZX2967_WDT_VAL_MASK);
-}
-
-static int zx2967_wdt_start(struct watchdog_device *wdd)
-{
-	struct zx2967_wdt *wdt = watchdog_get_drvdata(wdd);
-
-	zx2967_wdt_set_timeout(wdd, wdd->timeout);
-	__zx2967_wdt_start(wdt);
-
-	return 0;
-}
-
-static int zx2967_wdt_stop(struct watchdog_device *wdd)
-{
-	struct zx2967_wdt *wdt = watchdog_get_drvdata(wdd);
-
-	__zx2967_wdt_stop(wdt);
-
-	return 0;
-}
-
-static int zx2967_wdt_keepalive(struct watchdog_device *wdd)
-{
-	struct zx2967_wdt *wdt = watchdog_get_drvdata(wdd);
-
-	zx2967_wdt_refresh(wdt);
-
-	return 0;
-}
-
-#define ZX2967_WDT_OPTIONS \
-	(WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
-static const struct watchdog_info zx2967_wdt_ident = {
-	.options          =     ZX2967_WDT_OPTIONS,
-	.identity         =	"zx2967 watchdog",
-};
-
-static const struct watchdog_ops zx2967_wdt_ops = {
-	.owner = THIS_MODULE,
-	.start = zx2967_wdt_start,
-	.stop = zx2967_wdt_stop,
-	.ping = zx2967_wdt_keepalive,
-	.set_timeout = zx2967_wdt_set_timeout,
-};
-
-static void zx2967_wdt_reset_sysctrl(struct device *dev)
-{
-	int ret;
-	void __iomem *regmap;
-	unsigned int offset, mask, config;
-	struct of_phandle_args out_args;
-
-	ret = of_parse_phandle_with_fixed_args(dev->of_node,
-			"zte,wdt-reset-sysctrl", 3, 0, &out_args);
-	if (ret)
-		return;
-
-	offset = out_args.args[0];
-	config = out_args.args[1];
-	mask = out_args.args[2];
-
-	regmap = syscon_node_to_regmap(out_args.np);
-	if (IS_ERR(regmap)) {
-		of_node_put(out_args.np);
-		return;
-	}
-
-	regmap_update_bits(regmap, offset, mask, config);
-	of_node_put(out_args.np);
-}
-
-static void zx2967_clk_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
-static int zx2967_wdt_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct zx2967_wdt *wdt;
-	int ret;
-	struct reset_control *rstc;
-
-	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
-	if (!wdt)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, wdt);
-
-	wdt->wdt_device.info = &zx2967_wdt_ident;
-	wdt->wdt_device.ops = &zx2967_wdt_ops;
-	wdt->wdt_device.timeout = ZX2967_WDT_DEFAULT_TIMEOUT;
-	wdt->wdt_device.max_timeout = ZX2967_WDT_MAX_TIMEOUT;
-	wdt->wdt_device.min_timeout = ZX2967_WDT_MIN_TIMEOUT;
-	wdt->wdt_device.parent = dev;
-
-	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->reg_base))
-		return PTR_ERR(wdt->reg_base);
-
-	zx2967_wdt_reset_sysctrl(dev);
-
-	wdt->clock = devm_clk_get(dev, NULL);
-	if (IS_ERR(wdt->clock)) {
-		dev_err(dev, "failed to find watchdog clock source\n");
-		return PTR_ERR(wdt->clock);
-	}
-
-	ret = clk_prepare_enable(wdt->clock);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable clock\n");
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, zx2967_clk_disable_unprepare,
-				       wdt->clock);
-	if (ret)
-		return ret;
-	clk_set_rate(wdt->clock, ZX2967_WDT_CLK_FREQ);
-
-	rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(rstc)) {
-		dev_err(dev, "failed to get rstc");
-		return PTR_ERR(rstc);
-	}
-
-	reset_control_assert(rstc);
-	reset_control_deassert(rstc);
-
-	watchdog_set_drvdata(&wdt->wdt_device, wdt);
-	watchdog_init_timeout(&wdt->wdt_device,
-			ZX2967_WDT_DEFAULT_TIMEOUT, dev);
-	watchdog_set_nowayout(&wdt->wdt_device, WATCHDOG_NOWAYOUT);
-
-	ret = devm_watchdog_register_device(dev, &wdt->wdt_device);
-	if (ret)
-		return ret;
-
-	dev_info(dev, "watchdog enabled (timeout=%d sec, nowayout=%d)",
-		 wdt->wdt_device.timeout, WATCHDOG_NOWAYOUT);
-
-	return 0;
-}
-
-static const struct of_device_id zx2967_wdt_match[] = {
-	{ .compatible = "zte,zx296718-wdt", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, zx2967_wdt_match);
-
-static struct platform_driver zx2967_wdt_driver = {
-	.probe		= zx2967_wdt_probe,
-	.driver		= {
-		.name	= "zx2967-wdt",
-		.of_match_table	= of_match_ptr(zx2967_wdt_match),
-	},
-};
-module_platform_driver(zx2967_wdt_driver);
-
-MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
-MODULE_DESCRIPTION("ZTE zx2967 Watchdog Device Driver");
-MODULE_LICENSE("GPL v2");
-- 
2.29.2

