Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE9A23BFD6
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgHDT2F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:40314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgHDT2E (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:04 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B27A22B45;
        Tue,  4 Aug 2020 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569283;
        bh=jHU1RBVm0WqvZsCowGFRQGPvTtPcfYKwacHFFIilqw0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gsgPIIq/2qoG9XZ0oVbwG7wrgs7HPnObaJcJb80gzkCdUYSC3r1B+SLeskQygJay0
         EQz4cout+DxUiYHNPn2ieEjSuzI/GJ847+iddxI3Isp6JOMhLDIfJSfowiRP+W1KdI
         GB9gCirLARlV/3XZaFWNkKpqVQ0ku6hUJOWaQDQU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH v2 07/13] ARM: s3c64xx: switch to generic watchdog driver reset
Date:   Tue,  4 Aug 2020 21:26:48 +0200
Message-Id: <20200804192654.12783-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
code"), the platform watchdog reset code can be removed in favor of
a generic watchdog driver which already handles reset.

This allows removal of a bunch of machine code and fixes also W=1
compile warnings:

    arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
       29 | void samsung_wdt_reset(void)
    arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
       69 | void __init samsung_wdt_reset_of_init(void)
    arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
       89 | void __init samsung_wdt_reset_init(void __iomem *base)

The generic watchdog-based system reset is not exactly the same as
before.  The previous method had a fallback to soft_restart() which now
is gone.

The commit also removes a FIXME note about calling s3c64xx_clk_init()
inside s3c64xx_init_irq().  No one fixed this since long time and the
note is not meaningful anymore because watchdog part is removed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Drop FIXME note and update commit msg, after talks with Tomasz,
2. Add Tomasz's review tag.
---
 arch/arm/mach-s3c64xx/Kconfig           |  3 +-
 arch/arm/mach-s3c64xx/common.c          | 16 -----
 arch/arm/mach-s3c64xx/common.h          |  2 -
 arch/arm/mach-s3c64xx/mach-anw6410.c    |  1 -
 arch/arm/mach-s3c64xx/mach-crag6410.c   |  1 -
 arch/arm/mach-s3c64xx/mach-hmt.c        |  1 -
 arch/arm/mach-s3c64xx/mach-mini6410.c   |  1 -
 arch/arm/mach-s3c64xx/mach-ncp.c        |  1 -
 arch/arm/mach-s3c64xx/mach-real6410.c   |  1 -
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 17 -----
 arch/arm/mach-s3c64xx/mach-smartq5.c    |  1 -
 arch/arm/mach-s3c64xx/mach-smartq7.c    |  1 -
 arch/arm/mach-s3c64xx/mach-smdk6400.c   |  1 -
 arch/arm/mach-s3c64xx/mach-smdk6410.c   |  1 -
 arch/arm/mach-s3c64xx/watchdog-reset.h  | 16 -----
 arch/arm/plat-samsung/Kconfig           |  6 --
 arch/arm/plat-samsung/Makefile          |  1 -
 arch/arm/plat-samsung/watchdog-reset.c  | 93 -------------------------
 18 files changed, 2 insertions(+), 162 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
 delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index e208c2b48853..f3fcb570edf5 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -18,9 +18,10 @@ menuconfig ARCH_S3C64XX
 	select PM_GENERIC_DOMAINS if PM
 	select S3C_DEV_NAND if ATAGS
 	select S3C_GPIO_TRACK if ATAGS
+	select S3C2410_WATCHDOG
 	select SAMSUNG_ATAGS if ATAGS
 	select SAMSUNG_WAKEMASK if PM
-	select SAMSUNG_WDT_RESET
+	select WATCHDOG
 	help
 	  Samsung S3C64XX series based systems
 
diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index a655bf0c7802..c9c20256488b 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -50,7 +50,6 @@
 
 #include "common.h"
 #include "irq-uart.h"
-#include "watchdog-reset.h"
 
 /* External clock frequency */
 static unsigned long xtal_f __ro_after_init = 12000000;
@@ -229,13 +228,7 @@ core_initcall(s3c64xx_dev_init);
 
 void __init s3c64xx_init_irq(u32 vic0_valid, u32 vic1_valid)
 {
-	/*
-	 * FIXME: there is no better place to put this at the moment
-	 * (s3c64xx_clk_init needs ioremap and must happen before init_time
-	 * samsung_wdt_reset_init needs clocks)
-	 */
 	s3c64xx_clk_init(NULL, xtal_f, xusbxti_f, soc_is_s3c6400(), S3C_VA_SYS);
-	samsung_wdt_reset_init(S3C_VA_WATCHDOG);
 
 	printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
 
@@ -429,12 +422,3 @@ static int __init s3c64xx_init_irq_eint(void)
 	return 0;
 }
 arch_initcall(s3c64xx_init_irq_eint);
-
-void s3c64xx_restart(enum reboot_mode mode, const char *cmd)
-{
-	if (mode != REBOOT_SOFT)
-		samsung_wdt_reset();
-
-	/* if all else fails, or mode was for soft, jump to 0 */
-	soft_restart(0);
-}
diff --git a/arch/arm/mach-s3c64xx/common.h b/arch/arm/mach-s3c64xx/common.h
index 6fcfb0e0ffa5..567bf3017171 100644
--- a/arch/arm/mach-s3c64xx/common.h
+++ b/arch/arm/mach-s3c64xx/common.h
@@ -19,8 +19,6 @@
 void s3c64xx_init_irq(u32 vic0, u32 vic1);
 void s3c64xx_init_io(struct map_desc *mach_desc, int size);
 
-void s3c64xx_restart(enum reboot_mode mode, const char *cmd);
-
 struct device_node;
 void s3c64xx_set_xtal_freq(unsigned long freq);
 void s3c64xx_set_xusbxti_freq(unsigned long freq);
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64xx/mach-anw6410.c
index 495549573d36..e783f5b3593a 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -228,5 +228,4 @@ MACHINE_START(ANW6410, "A&W6410")
 	.map_io		= anw6410_map_io,
 	.init_machine	= anw6410_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 3cb43a33e3f8..223a3d51d8b6 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -877,5 +877,4 @@ MACHINE_START(WLF_CRAGG_6410, "Wolfson Cragganmore 6410")
 	.map_io		= crag6410_map_io,
 	.init_machine	= crag6410_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index cadb63103517..ad15260c12b4 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -280,5 +280,4 @@ MACHINE_START(HMT, "Airgoo-HMT")
 	.map_io		= hmt_map_io,
 	.init_machine	= hmt_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c64xx/mach-mini6410.c
index 77bad2891020..636d312add81 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -362,5 +362,4 @@ MACHINE_START(MINI6410, "MINI6410")
 	.map_io		= mini6410_map_io,
 	.init_machine	= mini6410_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/mach-ncp.c
index a7c328d32824..0a67ff173575 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -98,5 +98,4 @@ MACHINE_START(NCP, "NCP")
 	.map_io		= ncp_map_io,
 	.init_machine	= ncp_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c64xx/mach-real6410.c
index 993ce7bdd740..56fc21f02c7b 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -330,5 +330,4 @@ MACHINE_START(REAL6410, "REAL6410")
 	.map_io		= real6410_map_io,
 	.init_machine	= real6410_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
index 1724f5ea5c46..09c4e8742629 100644
--- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
+++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
@@ -12,7 +12,6 @@
 #include <mach/map.h>
 
 #include "common.h"
-#include "watchdog-reset.h"
 
 /*
  * IO mapping for shared system controller IP.
@@ -39,20 +38,6 @@ static void __init s3c64xx_dt_map_io(void)
 		panic("SoC is not S3C64xx!");
 }
 
-static void __init s3c64xx_dt_init_machine(void)
-{
-	samsung_wdt_reset_of_init();
-}
-
-static void s3c64xx_dt_restart(enum reboot_mode mode, const char *cmd)
-{
-	if (mode != REBOOT_SOFT)
-		samsung_wdt_reset();
-
-	/* if all else fails, or mode was for soft, jump to 0 */
-	soft_restart(0);
-}
-
 static const char *const s3c64xx_dt_compat[] __initconst = {
 	"samsung,s3c6400",
 	"samsung,s3c6410",
@@ -63,6 +48,4 @@ DT_MACHINE_START(S3C6400_DT, "Samsung S3C64xx (Flattened Device Tree)")
 	/* Maintainer: Tomasz Figa <tomasz.figa@gmail.com> */
 	.dt_compat	= s3c64xx_dt_compat,
 	.map_io		= s3c64xx_dt_map_io,
-	.init_machine	= s3c64xx_dt_init_machine,
-	.restart        = s3c64xx_dt_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/mach-smartq5.c
index c1d173a97f2a..789876a20534 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -151,5 +151,4 @@ MACHINE_START(SMARTQ5, "SmartQ 5")
 	.map_io		= smartq_map_io,
 	.init_machine	= smartq5_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c
index 493fd8cd83eb..d004e34b63bb 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -167,5 +167,4 @@ MACHINE_START(SMARTQ7, "SmartQ 7")
 	.map_io		= smartq_map_io,
 	.init_machine	= smartq7_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c64xx/mach-smdk6400.c
index 76b676b6acbb..d24899dd3883 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -88,5 +88,4 @@ MACHINE_START(SMDK6400, "SMDK6400")
 	.map_io		= smdk6400_map_io,
 	.init_machine	= smdk6400_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index 3bd13701d01c..104548fb192a 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -704,5 +704,4 @@ MACHINE_START(SMDK6410, "SMDK6410")
 	.map_io		= smdk6410_map_io,
 	.init_machine	= smdk6410_machine_init,
 	.init_time	= samsung_timer_init,
-	.restart	= s3c64xx_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c64xx/watchdog-reset.h b/arch/arm/mach-s3c64xx/watchdog-reset.h
deleted file mode 100644
index 1042d6c463dc..000000000000
--- a/arch/arm/mach-s3c64xx/watchdog-reset.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2008 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *
- * S3C2410 - System define for arch_reset() function
- */
-
-#ifndef __PLAT_SAMSUNG_WATCHDOG_RESET_H
-#define __PLAT_SAMSUNG_WATCHDOG_RESET_H
-
-extern void samsung_wdt_reset(void);
-extern void samsung_wdt_reset_of_init(void);
-extern void samsung_wdt_reset_init(void __iomem *base);
-
-#endif /* __PLAT_SAMSUNG_WATCHDOG_RESET_H */
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 43a8b2bd16ff..3aca01067b3c 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -290,12 +290,6 @@ config SAMSUNG_WAKEMASK
 	  and above. This code allows a set of interrupt to wakeup-mask
 	  mappings. See <plat/wakeup-mask.h>
 
-config SAMSUNG_WDT_RESET
-	bool
-	help
-	  Compile support for system restart by triggering watchdog reset.
-	  Used on SoCs that do not provide dedicated reset control.
-
 config DEBUG_S3C_UART
 	depends on PLAT_SAMSUNG
 	int
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 3db9d2c38258..ce339a96fbf7 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -32,4 +32,3 @@ obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 obj-$(CONFIG_SAMSUNG_PM_DEBUG)	+= pm-debug.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
-obj-$(CONFIG_SAMSUNG_WDT_RESET)	+= watchdog-reset.o
diff --git a/arch/arm/plat-samsung/watchdog-reset.c b/arch/arm/plat-samsung/watchdog-reset.c
deleted file mode 100644
index 71d85ff323f7..000000000000
--- a/arch/arm/plat-samsung/watchdog-reset.c
+++ /dev/null
@@ -1,93 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Copyright (c) 2008 Simtec Electronics
-//	Ben Dooks <ben@simtec.co.uk>
-//
-// Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
-//
-// Watchdog reset support for Samsung SoCs.
-
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#define S3C2410_WTCON			0x00
-#define S3C2410_WTDAT			0x04
-#define S3C2410_WTCNT			0x08
-
-#define S3C2410_WTCON_ENABLE		(1 << 5)
-#define S3C2410_WTCON_DIV16		(0 << 3)
-#define S3C2410_WTCON_RSTEN		(1 << 0)
-#define S3C2410_WTCON_PRESCALE(x)	((x) << 8)
-
-static void __iomem *wdt_base;
-static struct clk *wdt_clock;
-
-void samsung_wdt_reset(void)
-{
-	if (!wdt_base) {
-		pr_err("%s: wdt reset not initialized\n", __func__);
-		/* delay to allow the serial port to show the message */
-		mdelay(50);
-		return;
-	}
-
-	if (!IS_ERR(wdt_clock))
-		clk_prepare_enable(wdt_clock);
-
-	/* disable watchdog, to be safe  */
-	__raw_writel(0, wdt_base + S3C2410_WTCON);
-
-	/* put initial values into count and data */
-	__raw_writel(0x80, wdt_base + S3C2410_WTCNT);
-	__raw_writel(0x80, wdt_base + S3C2410_WTDAT);
-
-	/* set the watchdog to go and reset... */
-	__raw_writel(S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV16 |
-			S3C2410_WTCON_RSTEN | S3C2410_WTCON_PRESCALE(0x20),
-			wdt_base + S3C2410_WTCON);
-
-	/* wait for reset to assert... */
-	mdelay(500);
-
-	pr_err("Watchdog reset failed to assert reset\n");
-
-	/* delay to allow the serial port to show the message */
-	mdelay(50);
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id s3c2410_wdt_match[] = {
-	{ .compatible = "samsung,s3c2410-wdt" },
-	{ .compatible = "samsung,s3c6410-wdt" },
-	{},
-};
-
-void __init samsung_wdt_reset_of_init(void)
-{
-	struct device_node *np;
-
-	np = of_find_matching_node(NULL, s3c2410_wdt_match);
-	if (!np) {
-		pr_err("%s: failed to find watchdog node\n", __func__);
-		return;
-	}
-
-	wdt_base = of_iomap(np, 0);
-	if (!wdt_base) {
-		pr_err("%s: failed to map watchdog registers\n", __func__);
-		return;
-	}
-
-	wdt_clock = of_clk_get(np, 0);
-}
-#endif
-
-void __init samsung_wdt_reset_init(void __iomem *base)
-{
-	wdt_base = base;
-	wdt_clock = clk_get(NULL, "watchdog");
-}
-- 
2.17.1

