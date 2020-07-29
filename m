Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16F523230C
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgG2RCs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RCr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:02:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9D8C061794;
        Wed, 29 Jul 2020 10:02:47 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l12so3489821pgt.13;
        Wed, 29 Jul 2020 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xtqCPAZNxab7obAfm7++LTbvH7dNhg0P0KIRGD5EzeI=;
        b=aGqeuLKOzgNcfhya9sQK3coK1kl3GVMYKFr3x1SV5UCfe2X0O1AdN+tnxf+TeFg/o3
         iqW3kB4RJ5diJhHYeBcfy8SjrXvEGi1ZaplHoEFYp3e3r5Tbmfm+9Wp+MRcYd5JaPnyG
         S6iTXsgMH4xENZcjLPRikafGXw3xj6uTtqHEB7nWQc4JO3xsfk50GlSJfM71Y2bIodVK
         MjwSwKmoMRWsfEJPkcbAowlXzD3dUPjL1oaIh1rHFPyznOsO+atvXcseaSs1CCEEoQA7
         JWz7H9S7Wxtmd0lsQyOtiFlcDogOd9rv2KeCd01vQIUoAisWh4NUcqrEIZ18jmTiBEO2
         r3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xtqCPAZNxab7obAfm7++LTbvH7dNhg0P0KIRGD5EzeI=;
        b=Vgl7i20Xf5AJVyV7vuWA7drPb375EMG6hrSHvTC4QF3M0zdnGPPB3W/11LcbEoBHfH
         4TNrwuJPR9HXfgQskLNBHC+c10Z/qInYxQOKglZdT6V34hpbAF8HbUp7iTNVxMAVVFtC
         baM24JjJPR3Wle1VutkcesKmbj6pDOotW/XqZ+rpdaHczdo8D2JNHC/Ah5VZntx+P/L/
         T+i37sduHHsqjIBVUSkymRZ3elaY8ZYQQvERAakxn+SV9qtY8CyCXyY7WwqtS2uYLvPO
         Q22HOIpRARsNtc3+WhalknDpb8QJjUXpxT3MEZOxBzSakQPLJKTP32QYcixLHxFc+kg3
         n4+Q==
X-Gm-Message-State: AOAM532aUjWwc2vBOiJOk6JW6wvGrZBXXbRKdIblE76SJ4kplEXEBRAN
        yCN1rPXAqBOcClw4JM4AICU=
X-Google-Smtp-Source: ABdhPJzULaOVQ0tOHf7TxVqsmf9UR8ysNODjrXMfRJJtpEZ0uM9i9DYpEFzw/2aHDHyHlfcNVuYGig==
X-Received: by 2002:a63:fc1f:: with SMTP id j31mr30573226pgi.104.1596042167176;
        Wed, 29 Jul 2020 10:02:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b128sm2876722pfg.114.2020.07.29.10.02.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 10:02:46 -0700 (PDT)
Date:   Wed, 29 Jul 2020 10:02:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
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
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [PATCH 5/7] ARM: samsung: Kill useless HAVE_S3C2410_WATCHDOG
Message-ID: <20200729170245.GA177035@roeck-us.net>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729160942.28867-6-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 06:09:40PM +0200, Krzysztof Kozlowski wrote:
> A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs does
> not have sense, because:
> 1. All ARMv7 and ARMv8 Samsung SoCs have watchdog,
> 2. All architecture Kconfigs were selecting it (if WATCHDOG framework is
>    chosen),
> 3. HAVE_S3C2410_WATCHDOG is doing nothing except being a dependency of
>    actual Samsung SoC watchdog driver, which is enabled manually by
>    specific defconfigs.
> 
> HAVE_S3C2410_WATCHDOG can be safely removed.
> 

That is not really correct. HAVE_S3C2410_WATCHDOG is used to ensure
that users can only enable S3C2410_WATCHDOG if the watchdog actually
exists in a system. With this change, it can be enabled for all
architectures and platforms.

NACK.

Guenter

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/Kconfig              | 1 -
>  arch/arm/mach-exynos/Kconfig  | 1 -
>  arch/arm/mach-s3c64xx/Kconfig | 2 --
>  arch/arm/mach-s5pv210/Kconfig | 1 -
>  arch/arm64/Kconfig.platforms  | 1 -
>  drivers/watchdog/Kconfig      | 8 --------
>  6 files changed, 14 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 7564f293f107..fe95777af653 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -504,7 +504,6 @@ config ARCH_S3C24XX
>  	select GPIOLIB
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select NEED_MACH_IO_H
>  	select SAMSUNG_ATAGS
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index f185cd3d4c62..d2d249706ebb 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -24,7 +24,6 @@ menuconfig ARCH_EXYNOS
>  	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> index ac3e3563487f..e208c2b48853 100644
> --- a/arch/arm/mach-s3c64xx/Kconfig
> +++ b/arch/arm/mach-s3c64xx/Kconfig
> @@ -13,7 +13,6 @@ menuconfig ARCH_S3C64XX
>  	select GPIO_SAMSUNG if ATAGS
>  	select GPIOLIB
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_TCM
>  	select PLAT_SAMSUNG
>  	select PM_GENERIC_DOMAINS if PM
> @@ -165,7 +164,6 @@ config MACH_SMDK6410
>  	bool "SMDK6410"
>  	depends on ATAGS
>  	select CPU_S3C6410
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select S3C64XX_SETUP_FB_24BPP
>  	select S3C64XX_SETUP_I2C1
>  	select S3C64XX_SETUP_IDE
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 03984a791879..b3db1191e437 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -14,7 +14,6 @@ config ARCH_S5PV210
>  	select COMMON_CLK_SAMSUNG
>  	select GPIOLIB
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index cd58f8495c45..d235b27cf372 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -80,7 +80,6 @@ config ARCH_EXYNOS
>  	select EXYNOS_CHIPID
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 4f4687c46d38..ae86ea135d2b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -478,16 +478,8 @@ config IXP4XX_WATCHDOG
>  
>  	  Say N if you are unsure.
>  
> -config HAVE_S3C2410_WATCHDOG
> -	bool
> -	help
> -	  This will include watchdog timer support for Samsung SoCs. If
> -	  you want to include watchdog support for any machine, kindly
> -	  select this in the respective mach-XXXX/Kconfig file.
> -
>  config S3C2410_WATCHDOG
>  	tristate "S3C2410 Watchdog"
> -	depends on HAVE_S3C2410_WATCHDOG || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	select MFD_SYSCON if ARCH_EXYNOS
>  	help
> -- 
> 2.17.1
> 
