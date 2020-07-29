Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902B123224C
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 18:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2QL3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 12:11:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgG2QL3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 12:11:29 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E84D222B42;
        Wed, 29 Jul 2020 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596039088;
        bh=OXqoLRPWrFXdPQQV3M48e6KajASXOamRb8ttR+387g4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SNngFMhVUI1LUQW9j6tkfXjCB72IzTD0gdKxc35B/QMA6JhCWvm4G2tqQfpeXBLQt
         L7aUbnH1KvskPwGNbZE/0+XXX4JIfAn4C94Jb9V/GU5g99TM1c90rpoa44u4bL9Zf0
         +Sz6i2VzPl21U0nmw8utOnGJlmzA6YoxDUB1irQA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH 5/7] ARM: samsung: Kill useless HAVE_S3C2410_WATCHDOG
Date:   Wed, 29 Jul 2020 18:09:40 +0200
Message-Id: <20200729160942.28867-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
References: <20200729160942.28867-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs does
not have sense, because:
1. All ARMv7 and ARMv8 Samsung SoCs have watchdog,
2. All architecture Kconfigs were selecting it (if WATCHDOG framework is
   chosen),
3. HAVE_S3C2410_WATCHDOG is doing nothing except being a dependency of
   actual Samsung SoC watchdog driver, which is enabled manually by
   specific defconfigs.

HAVE_S3C2410_WATCHDOG can be safely removed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/Kconfig              | 1 -
 arch/arm/mach-exynos/Kconfig  | 1 -
 arch/arm/mach-s3c64xx/Kconfig | 2 --
 arch/arm/mach-s5pv210/Kconfig | 1 -
 arch/arm64/Kconfig.platforms  | 1 -
 drivers/watchdog/Kconfig      | 8 --------
 6 files changed, 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7564f293f107..fe95777af653 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -504,7 +504,6 @@ config ARCH_S3C24XX
 	select GPIOLIB
 	select GENERIC_IRQ_MULTI_HANDLER
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select NEED_MACH_IO_H
 	select SAMSUNG_ATAGS
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index f185cd3d4c62..d2d249706ebb 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -24,7 +24,6 @@ menuconfig ARCH_EXYNOS
 	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
 	select HAVE_ARM_SCU if SMP
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index ac3e3563487f..e208c2b48853 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -13,7 +13,6 @@ menuconfig ARCH_S3C64XX
 	select GPIO_SAMSUNG if ATAGS
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_TCM
 	select PLAT_SAMSUNG
 	select PM_GENERIC_DOMAINS if PM
@@ -165,7 +164,6 @@ config MACH_SMDK6410
 	bool "SMDK6410"
 	depends on ATAGS
 	select CPU_S3C6410
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_I2C1
 	select S3C64XX_SETUP_IDE
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 03984a791879..b3db1191e437 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,7 +14,6 @@ config ARCH_S5PV210
 	select COMMON_CLK_SAMSUNG
 	select GPIOLIB
 	select HAVE_S3C2410_I2C if I2C
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cd58f8495c45..d235b27cf372 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -80,7 +80,6 @@ config ARCH_EXYNOS
 	select EXYNOS_CHIPID
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
-	select HAVE_S3C2410_WATCHDOG if WATCHDOG
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4f4687c46d38..ae86ea135d2b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -478,16 +478,8 @@ config IXP4XX_WATCHDOG
 
 	  Say N if you are unsure.
 
-config HAVE_S3C2410_WATCHDOG
-	bool
-	help
-	  This will include watchdog timer support for Samsung SoCs. If
-	  you want to include watchdog support for any machine, kindly
-	  select this in the respective mach-XXXX/Kconfig file.
-
 config S3C2410_WATCHDOG
 	tristate "S3C2410 Watchdog"
-	depends on HAVE_S3C2410_WATCHDOG || COMPILE_TEST
 	select WATCHDOG_CORE
 	select MFD_SYSCON if ARCH_EXYNOS
 	help
-- 
2.17.1

