Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE0823237D
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2Rgw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2Rgv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:36:51 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DBEC061794;
        Wed, 29 Jul 2020 10:36:51 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id l17so9917975ilq.13;
        Wed, 29 Jul 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TPkQZ+i6FNOpeVE5UI8sOClQcfRSIKgGPE2poece49s=;
        b=Eqc51qVeFI98Oc3hTdLNU+peZGDMM37nNeuyqcLydOpLmLb/tS1IW8KyhSpJlyWfbj
         IiNuooj5682TF+MYWIwjOKgMQnkMjAd0qLwKzXLnNnsfT14RnSupiqBHWKpqmSnVDacn
         2Hh1BVBnB+Xtx+DRvtMVT/lLM2iWsdjKg8mIMz/H3dWm2nnmjzAY4Wtiuy1Cm6Zg1Ww9
         olM8c99kkOWnvNxCaigydG6OXpIFWVhqrTj7Zzr9Ucs1lP55Eyb5BsgkQqazUmmyfeck
         R2CNwI7kC4o2GFgSU8JSQgO8GIqqX7pqPuGDibDqr1jSRdDtHeeFUkBmTw8u6CWUEsxY
         Pq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TPkQZ+i6FNOpeVE5UI8sOClQcfRSIKgGPE2poece49s=;
        b=Bsa3OP3n7oCSEiQfzdN+3+QaON/dMavIfNPEdNSk5KvMUVuDTQlaIkiuDbdVhsUc8R
         +5Le+Iv4KfFzC/N6tlXXHi7XdninyOXDqX+Vv2H64d+6hdKCEhUV1TJZeudrrDmWVmCM
         e2pP93INyd3/ijIqEM1zs18Au6OdYLsnBx+RAyqoCuwun3+zDwEKLQ4SFPxcpdX/eDmk
         QkTSeB24Y5mCBc/qMg0I+L+pp/aDi+XIV30m/v1YRTkEsvhHpss+YQW8847hrFPnNcP0
         cUC7bEQ6/1Db8+L37g/Kq6R6n7111/HqQnl/gDw/DkIdj2xozmDNb+wVbVf7WcuKY/wk
         JgLQ==
X-Gm-Message-State: AOAM532UkC0e0q73YRuWtHTzPrOLQAP9qAhBOvcPoZGppAoKK6LQzBBl
        pJdS5H6Om8ShjBCGuHOAAPvVjwl44EeHWARp/24=
X-Google-Smtp-Source: ABdhPJzQoh3Q5hlftFKhVObcMJoJHWzuUT/Govxl7BfCvrO+4waxHHNt4wgq/AKdhB49k1Tt+AmucFAExWMV23SzKqo=
X-Received: by 2002:a92:4b08:: with SMTP id m8mr33857774ilg.150.1596044210954;
 Wed, 29 Jul 2020 10:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-6-krzk@kernel.org>
 <20200729170245.GA177035@roeck-us.net>
In-Reply-To: <20200729170245.GA177035@roeck-us.net>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 29 Jul 2020 19:36:38 +0200
Message-ID: <CA+Ln22EcU+mhaYJYd3M-S0ZP-mA0bW4Qit-Kh6MyvwzxTRJ3GQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: samsung: Kill useless HAVE_S3C2410_WATCHDOG
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:SAMSUNG SOC CLOCK DRIVERS" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

2020=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 19:02 Guenter Roeck <linux@ro=
eck-us.net>:
>
> On Wed, Jul 29, 2020 at 06:09:40PM +0200, Krzysztof Kozlowski wrote:
> > A separate Kconfig option HAVE_S3C2410_WATCHDOG for Samsung SoCs does
> > not have sense, because:
> > 1. All ARMv7 and ARMv8 Samsung SoCs have watchdog,
> > 2. All architecture Kconfigs were selecting it (if WATCHDOG framework i=
s
> >    chosen),
> > 3. HAVE_S3C2410_WATCHDOG is doing nothing except being a dependency of
> >    actual Samsung SoC watchdog driver, which is enabled manually by
> >    specific defconfigs.
> >
> > HAVE_S3C2410_WATCHDOG can be safely removed.
> >
>
> That is not really correct. HAVE_S3C2410_WATCHDOG is used to ensure
> that users can only enable S3C2410_WATCHDOG if the watchdog actually
> exists in a system. With this change, it can be enabled for all
> architectures and platforms.
>
> NACK.
>
> Guenter
>

I'd side with Guenter on this. We better not flood users' screens with
options that are not relevant to their hardware.

An alternative here could be making CONFIG_S3C2410_WATCHDOG depend on
a general symbol for Samsung SoC support if there is such, but then,
are we 100% sure that all the Samsung SoCs would actually have exactly
this watchdog? If a new one shows up, one would have to bring back
this HAVE_S3C2410_WATCHDOG symbol.

Best regards,
Tomasz

> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/Kconfig              | 1 -
> >  arch/arm/mach-exynos/Kconfig  | 1 -
> >  arch/arm/mach-s3c64xx/Kconfig | 2 --
> >  arch/arm/mach-s5pv210/Kconfig | 1 -
> >  arch/arm64/Kconfig.platforms  | 1 -
> >  drivers/watchdog/Kconfig      | 8 --------
> >  6 files changed, 14 deletions(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 7564f293f107..fe95777af653 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -504,7 +504,6 @@ config ARCH_S3C24XX
> >       select GPIOLIB
> >       select GENERIC_IRQ_MULTI_HANDLER
> >       select HAVE_S3C2410_I2C if I2C
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select HAVE_S3C_RTC if RTC_CLASS
> >       select NEED_MACH_IO_H
> >       select SAMSUNG_ATAGS
> > diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfi=
g
> > index f185cd3d4c62..d2d249706ebb 100644
> > --- a/arch/arm/mach-exynos/Kconfig
> > +++ b/arch/arm/mach-exynos/Kconfig
> > @@ -24,7 +24,6 @@ menuconfig ARCH_EXYNOS
> >       select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
> >       select HAVE_ARM_SCU if SMP
> >       select HAVE_S3C2410_I2C if I2C
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select HAVE_S3C_RTC if RTC_CLASS
> >       select PINCTRL
> >       select PINCTRL_EXYNOS
> > diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kcon=
fig
> > index ac3e3563487f..e208c2b48853 100644
> > --- a/arch/arm/mach-s3c64xx/Kconfig
> > +++ b/arch/arm/mach-s3c64xx/Kconfig
> > @@ -13,7 +13,6 @@ menuconfig ARCH_S3C64XX
> >       select GPIO_SAMSUNG if ATAGS
> >       select GPIOLIB
> >       select HAVE_S3C2410_I2C if I2C
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select HAVE_TCM
> >       select PLAT_SAMSUNG
> >       select PM_GENERIC_DOMAINS if PM
> > @@ -165,7 +164,6 @@ config MACH_SMDK6410
> >       bool "SMDK6410"
> >       depends on ATAGS
> >       select CPU_S3C6410
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select S3C64XX_SETUP_FB_24BPP
> >       select S3C64XX_SETUP_I2C1
> >       select S3C64XX_SETUP_IDE
> > diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kcon=
fig
> > index 03984a791879..b3db1191e437 100644
> > --- a/arch/arm/mach-s5pv210/Kconfig
> > +++ b/arch/arm/mach-s5pv210/Kconfig
> > @@ -14,7 +14,6 @@ config ARCH_S5PV210
> >       select COMMON_CLK_SAMSUNG
> >       select GPIOLIB
> >       select HAVE_S3C2410_I2C if I2C
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select HAVE_S3C_RTC if RTC_CLASS
> >       select PINCTRL
> >       select PINCTRL_EXYNOS
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index cd58f8495c45..d235b27cf372 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -80,7 +80,6 @@ config ARCH_EXYNOS
> >       select EXYNOS_CHIPID
> >       select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
> >       select EXYNOS_PMU
> > -     select HAVE_S3C2410_WATCHDOG if WATCHDOG
> >       select HAVE_S3C_RTC if RTC_CLASS
> >       select PINCTRL
> >       select PINCTRL_EXYNOS
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 4f4687c46d38..ae86ea135d2b 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -478,16 +478,8 @@ config IXP4XX_WATCHDOG
> >
> >         Say N if you are unsure.
> >
> > -config HAVE_S3C2410_WATCHDOG
> > -     bool
> > -     help
> > -       This will include watchdog timer support for Samsung SoCs. If
> > -       you want to include watchdog support for any machine, kindly
> > -       select this in the respective mach-XXXX/Kconfig file.
> > -
> >  config S3C2410_WATCHDOG
> >       tristate "S3C2410 Watchdog"
> > -     depends on HAVE_S3C2410_WATCHDOG || COMPILE_TEST
> >       select WATCHDOG_CORE
> >       select MFD_SYSCON if ARCH_EXYNOS
> >       help
> > --
> > 2.17.1
> >
