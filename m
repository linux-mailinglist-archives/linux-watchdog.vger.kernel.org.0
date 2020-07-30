Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA35233123
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 13:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG3Lp0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 07:45:26 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:33995 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgG3LpZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 07:45:25 -0400
Received: by mail-ej1-f68.google.com with SMTP id o23so183424ejr.1;
        Thu, 30 Jul 2020 04:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dmIx6K39AwVClBedb7QkpR0HhfnQSCjcLCYyud3CBv4=;
        b=iE/NNV7zTGzRl8FAj6VR0lC86+5TkKuHPVT0PK+6S57ujDEq6i/gzAo/TLibq5GDgk
         mhqv8ki48eNvvEs5eF3y0fjigV7ScfVelG+XrE+s+Em7rLUIBSD/j6orl05YEW94xo2M
         f+WQ/i2bnRYsgvSNrQlDcDevzJVV+sWEtGeiUjA5nM2ULVrKaTim1eN7RT0y47rQ7Lw6
         9Y3LLs9UmCyrWG14JxKa6iB89XrdMg9lEy25RgKk8MDh7FpLa8ufAoSobr6XxzNjC+w0
         YIGB+0aPH1VTcK74HpFGHliOjGE+WytfbLGsa7dY1/ws4kmSiAjMrjkYRkfaR3slc7+Q
         Ybug==
X-Gm-Message-State: AOAM5327pELRF0a+qzf1Is4t1jCgumvoERAjnk9LI3GLEyUXHLQ9flwY
        qXAC9a7FXV2POYfSBDX0jh0=
X-Google-Smtp-Source: ABdhPJw5Nk510vllHk10fhn8xgW3ei+PX5ztO4fQj7uiS9l3iTHjtMnKWBz5JnnoLkSsrfF2wmI07w==
X-Received: by 2002:a17:906:6dd1:: with SMTP id j17mr2282792ejt.272.1596109521064;
        Thu, 30 Jul 2020 04:45:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id e26sm3161870edq.23.2020.07.30.04.45.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:45:19 -0700 (PDT)
Date:   Thu, 30 Jul 2020 13:45:15 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
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
        Guenter Roeck <linux@roeck-us.net>,
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
Subject: Re: [PATCH 6/7] ARM: s3c64xx: Switch to generic watchdog driver reset
Message-ID: <20200730114515.GA20438@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-7-krzk@kernel.org>
 <CA+Ln22F_PaEMNyEg4XSR0PXHTa+3dQyEvzgtnRNHMu61uZytQg@mail.gmail.com>
 <20200729191544.GB5822@kozik-lap>
 <CA+Ln22ED+-B96jf8p89sXpD2vmDLuteKXQiuKPy50vJ80MgSjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CA+Ln22ED+-B96jf8p89sXpD2vmDLuteKXQiuKPy50vJ80MgSjA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 30, 2020 at 01:34:38PM +0200, Tomasz Figa wrote:
> 2020年7月29日(水) 21:15 Krzysztof Kozlowski <krzk@kernel.org>:
> >
> > On Wed, Jul 29, 2020 at 07:33:33PM +0200, Tomasz Figa wrote:
> > > Hi Krzysztof,
> > >
> > > 2020年7月29日(水) 18:11 Krzysztof Kozlowski <krzk@kernel.org>:
> > > >
> > > > Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
> > > > code"), the platform watchdog reset code can be removed in favor of
> > > > a generic watchdog driver which already handles reset.
> > > >
> > > > This allows removal of a bunch of machine code and fixes also W=1
> > > > compile warnings:
> > > >
> > > >     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
> > > >        29 | void samsung_wdt_reset(void)
> > > >           |      ^~~~~~~~~~~~~~~~~
> > > >     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
> > > >        69 | void __init samsung_wdt_reset_of_init(void)
> > > >           |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > >     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
> > > >        89 | void __init samsung_wdt_reset_init(void __iomem *base)
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > ---
> > > >  arch/arm/mach-s3c64xx/Kconfig           |  3 +-
> > > >  arch/arm/mach-s3c64xx/common.c          | 15 +---
> > > >  arch/arm/mach-s3c64xx/common.h          |  2 -
> > > >  arch/arm/mach-s3c64xx/mach-anw6410.c    |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-crag6410.c   |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-hmt.c        |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-mini6410.c   |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-ncp.c        |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-real6410.c   |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 17 -----
> > > >  arch/arm/mach-s3c64xx/mach-smartq5.c    |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-smartq7.c    |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-smdk6400.c   |  1 -
> > > >  arch/arm/mach-s3c64xx/mach-smdk6410.c   |  1 -
> > > >  arch/arm/mach-s3c64xx/watchdog-reset.h  | 16 -----
> > > >  arch/arm/plat-samsung/Kconfig           |  6 --
> > > >  arch/arm/plat-samsung/Makefile          |  1 -
> > > >  arch/arm/plat-samsung/watchdog-reset.c  | 93 -------------------------
> > > >  18 files changed, 5 insertions(+), 158 deletions(-)
> > > >  delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
> > > >  delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
> > > >
> > >
> > > Thanks for the patch! Please see my comments inline.
> > >
> > > > diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> > > > index e208c2b48853..f3fcb570edf5 100644
> > > > --- a/arch/arm/mach-s3c64xx/Kconfig
> > > > +++ b/arch/arm/mach-s3c64xx/Kconfig
> > > > @@ -18,9 +18,10 @@ menuconfig ARCH_S3C64XX
> > > >         select PM_GENERIC_DOMAINS if PM
> > > >         select S3C_DEV_NAND if ATAGS
> > > >         select S3C_GPIO_TRACK if ATAGS
> > > > +       select S3C2410_WATCHDOG
> > > >         select SAMSUNG_ATAGS if ATAGS
> > > >         select SAMSUNG_WAKEMASK if PM
> > > > -       select SAMSUNG_WDT_RESET
> > > > +       select WATCHDOG
> > > >         help
> > > >           Samsung S3C64XX series based systems
> > > >
> > > > diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
> > > > index a655bf0c7802..42e96d196f61 100644
> > > > --- a/arch/arm/mach-s3c64xx/common.c
> > > > +++ b/arch/arm/mach-s3c64xx/common.c
> > > > @@ -50,7 +50,6 @@
> > > >
> > > >  #include "common.h"
> > > >  #include "irq-uart.h"
> > > > -#include "watchdog-reset.h"
> > > >
> > > >  /* External clock frequency */
> > > >  static unsigned long xtal_f __ro_after_init = 12000000;
> > > > @@ -232,10 +231,11 @@ void __init s3c64xx_init_irq(u32 vic0_valid, u32 vic1_valid)
> > > >         /*
> > > >          * FIXME: there is no better place to put this at the moment
> > > >          * (s3c64xx_clk_init needs ioremap and must happen before init_time
> > > > -        * samsung_wdt_reset_init needs clocks)
> > > > +        * samsung_wdt_reset_init needs clocks).  However
> > > > +        * samsung_wdt_reset_init() was removed in favor of watchdog driver
> > > > +        * so this should be revised.
> > >
> > > This leaves the comment referring to an inexistent function.
> >
> > Yes, I left it as a reference/reason. Although might be quite confusing
> > now...
> >
> > >
> > > I wonder if this being here is actually a problem at all. It's legacy
> > > code and probably there isn't much value in reshuffling it further.
> > > Rather than that, we would probably want to make sure that everything
> > > migrated to DT and just drop the board files.
> >
> > Maybe let's remove the FIXME and leave the clock init. Since all these
> > times no one fixed the FIXME, so now with limited hardware access I do
> > not expect any movements here.
> >
> 
> I think that would be fairly uncontroversial at this point.
> 
> > >
> > > >          */
> > > >         s3c64xx_clk_init(NULL, xtal_f, xusbxti_f, soc_is_s3c6400(), S3C_VA_SYS);
> > > > -       samsung_wdt_reset_init(S3C_VA_WATCHDOG);
> > > >
> > > >         printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
> > > >
> > > > @@ -429,12 +429,3 @@ static int __init s3c64xx_init_irq_eint(void)
> > > >         return 0;
> > > >  }
> > > >  arch_initcall(s3c64xx_init_irq_eint);
> > > > -
> > > > -void s3c64xx_restart(enum reboot_mode mode, const char *cmd)
> > > > -{
> > > > -       if (mode != REBOOT_SOFT)
> > > > -               samsung_wdt_reset();
> > > > -
> > > > -       /* if all else fails, or mode was for soft, jump to 0 */
> > > > -       soft_restart(0);
> > >
> > > Does this remove the soft reboot capability? I'm not sure how much of
> > > a problem that would be, though.
> >
> > 1. No one cared about it in f6361c6b3880 :)
> 
> That was a different SoC family, though.
> 
> > 2. Exynos does not have it
> > 3. Does soft_restart really work? It would be worth to keep it if more
> >    or less it was working.
> 
> Anyway, I guess there is no way to know other than just removing it.
> It can be always brought back if it turns out that someone needs it.
> Please just mention that in the commit message.
> 
> With that addressed:
> 
> Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Sure, I'll do it. Thanks for review.

Best regards,
Krzysztof
