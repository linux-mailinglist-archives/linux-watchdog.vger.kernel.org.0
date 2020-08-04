Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C3B23BFD3
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgHDT17 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbgHDT15 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:27:57 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F2D822BED;
        Tue,  4 Aug 2020 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569277;
        bh=xu/9q4hYHAExdq/ZRSjnP/5CZOvcepxWipTUMi8/0t4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JS4vwQpV2jwtuWClC5javqmvUqo219E9nShZAVmB/+5iHJvOjMsi4WZciIiI2eNww
         cL6tNHvoV1yV5sUj0Y+lv82KMzyJqnjxlQsjBs0+jNZ3C1ZUDZV+nkj5rZfUvk2504
         1yTA/IoiHdsOAjjKKnMXmtxn7eIwDfikyKrzuOlU=
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
Subject: [PATCH v2 06/13] ARM: samsung: remove HAVE_S3C2410_WATCHDOG and use direct dependencies
Date:   Tue,  4 Aug 2020 21:26:47 +0200
Message-Id: <20200804192654.12783-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs is not
really needed and the s3c24xx watchdog driver can depend on Samsung ARM
architectures instead.

The "HAVE_xxx_WATCHDOG" pattern of dependency is not popular and Samsung
platforms are here exceptions.  All others just depend on
CONFIG_ARCH_xxx.

This makes the code slightly smaller without any change in
functionality.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Re-add the dependency on architectures to keep same functionality.
---
 arch/arm/Kconfig              |  1 -
 arch/arm/mach-exynos/Kconfig  |  1 -
 arch/arm/mach-s3c64xx/Kconfig |  2 --
 arch/arm/mach-s5pv210/Kconfig |  1 -
 arch/arm64/Kconfig.platforms  |  1 -
 drivers/watchdog/Kconfig      | 10 ++--------
 6 files changed, 2 insertions(+), 14 deletions(-)

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
index 4f4687c46d38..297af1c40643 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -478,16 +478,10 @@ config IXP4XX_WATCHDOG
 
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
+	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || \
+		   COMPILE_TEST
 	select WATCHDOG_CORE
 	select MFD_SYSCON if ARCH_EXYNOS
 	help
-- 
2.17.1

