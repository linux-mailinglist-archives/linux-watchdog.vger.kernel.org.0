Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC40232530
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 21:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgG2TPw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 15:15:52 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:39930 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgG2TPv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 15:15:51 -0400
Received: by mail-ej1-f67.google.com with SMTP id f24so4991616ejx.6;
        Wed, 29 Jul 2020 12:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QZvLyh/VTiAroCKTHFmeviwTx1lu+DKij2yBWYhIrcw=;
        b=G9bggxMB1xUmuQebRKNSKXFkdL466vZOuAuEv+NRzyFQapAr7eu5N1nW4TKq4WfIIs
         rHILIs3vsdndInHTsiccxM7m8eu/iS7CMvn/r3CjG7HqdVl6NPxXC4jyduqvEaekGnMW
         rXznwJCsmvgYpB4wT6DyzfLnB0N3bNHWOvtkJfKNrYzeq58RuLJ6GOiJMgHdXUjf0ous
         R2nZKDQR6hRaLjuBA1rHUX++bL2PZLbhCpsCcI7uRVPPtpYUcwi1c0iRhRjZ741KgtHu
         VrsoDBKr6rvZu7ewxejxtiX8/Rs7QUwni52qBaO8+wbyl1Ja1Zr2XRLztE1PorMxaxsQ
         yPcw==
X-Gm-Message-State: AOAM531POhmbcCzQ5Y97K891zHxvuIUMtd1Sz9mQ2waT7a0rofqg0jhY
        61jg3YWmCBODTrxjnOrX5gw=
X-Google-Smtp-Source: ABdhPJxbsPHi+l7rio/Z0goWffH1GbVr5+PSMaXjywPWSYEaxGui4MiOyNpWy06XsJSiPrUEKZdNFQ==
X-Received: by 2002:a17:906:264d:: with SMTP id i13mr7219416ejc.284.1596050148541;
        Wed, 29 Jul 2020 12:15:48 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id m12sm1550383edv.94.2020.07.29.12.15.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 12:15:47 -0700 (PDT)
Date:   Wed, 29 Jul 2020 21:15:44 +0200
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
Message-ID: <20200729191544.GB5822@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-7-krzk@kernel.org>
 <CA+Ln22F_PaEMNyEg4XSR0PXHTa+3dQyEvzgtnRNHMu61uZytQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CA+Ln22F_PaEMNyEg4XSR0PXHTa+3dQyEvzgtnRNHMu61uZytQg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 29, 2020 at 07:33:33PM +0200, Tomasz Figa wrote:
> Hi Krzysztof,
> 
> 2020年7月29日(水) 18:11 Krzysztof Kozlowski <krzk@kernel.org>:
> >
> > Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
> > code"), the platform watchdog reset code can be removed in favor of
> > a generic watchdog driver which already handles reset.
> >
> > This allows removal of a bunch of machine code and fixes also W=1
> > compile warnings:
> >
> >     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
> >        29 | void samsung_wdt_reset(void)
> >           |      ^~~~~~~~~~~~~~~~~
> >     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
> >        69 | void __init samsung_wdt_reset_of_init(void)
> >           |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
> >        89 | void __init samsung_wdt_reset_init(void __iomem *base)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/mach-s3c64xx/Kconfig           |  3 +-
> >  arch/arm/mach-s3c64xx/common.c          | 15 +---
> >  arch/arm/mach-s3c64xx/common.h          |  2 -
> >  arch/arm/mach-s3c64xx/mach-anw6410.c    |  1 -
> >  arch/arm/mach-s3c64xx/mach-crag6410.c   |  1 -
> >  arch/arm/mach-s3c64xx/mach-hmt.c        |  1 -
> >  arch/arm/mach-s3c64xx/mach-mini6410.c   |  1 -
> >  arch/arm/mach-s3c64xx/mach-ncp.c        |  1 -
> >  arch/arm/mach-s3c64xx/mach-real6410.c   |  1 -
> >  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 17 -----
> >  arch/arm/mach-s3c64xx/mach-smartq5.c    |  1 -
> >  arch/arm/mach-s3c64xx/mach-smartq7.c    |  1 -
> >  arch/arm/mach-s3c64xx/mach-smdk6400.c   |  1 -
> >  arch/arm/mach-s3c64xx/mach-smdk6410.c   |  1 -
> >  arch/arm/mach-s3c64xx/watchdog-reset.h  | 16 -----
> >  arch/arm/plat-samsung/Kconfig           |  6 --
> >  arch/arm/plat-samsung/Makefile          |  1 -
> >  arch/arm/plat-samsung/watchdog-reset.c  | 93 -------------------------
> >  18 files changed, 5 insertions(+), 158 deletions(-)
> >  delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
> >  delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
> >
> 
> Thanks for the patch! Please see my comments inline.
> 
> > diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
> > index e208c2b48853..f3fcb570edf5 100644
> > --- a/arch/arm/mach-s3c64xx/Kconfig
> > +++ b/arch/arm/mach-s3c64xx/Kconfig
> > @@ -18,9 +18,10 @@ menuconfig ARCH_S3C64XX
> >         select PM_GENERIC_DOMAINS if PM
> >         select S3C_DEV_NAND if ATAGS
> >         select S3C_GPIO_TRACK if ATAGS
> > +       select S3C2410_WATCHDOG
> >         select SAMSUNG_ATAGS if ATAGS
> >         select SAMSUNG_WAKEMASK if PM
> > -       select SAMSUNG_WDT_RESET
> > +       select WATCHDOG
> >         help
> >           Samsung S3C64XX series based systems
> >
> > diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
> > index a655bf0c7802..42e96d196f61 100644
> > --- a/arch/arm/mach-s3c64xx/common.c
> > +++ b/arch/arm/mach-s3c64xx/common.c
> > @@ -50,7 +50,6 @@
> >
> >  #include "common.h"
> >  #include "irq-uart.h"
> > -#include "watchdog-reset.h"
> >
> >  /* External clock frequency */
> >  static unsigned long xtal_f __ro_after_init = 12000000;
> > @@ -232,10 +231,11 @@ void __init s3c64xx_init_irq(u32 vic0_valid, u32 vic1_valid)
> >         /*
> >          * FIXME: there is no better place to put this at the moment
> >          * (s3c64xx_clk_init needs ioremap and must happen before init_time
> > -        * samsung_wdt_reset_init needs clocks)
> > +        * samsung_wdt_reset_init needs clocks).  However
> > +        * samsung_wdt_reset_init() was removed in favor of watchdog driver
> > +        * so this should be revised.
> 
> This leaves the comment referring to an inexistent function.

Yes, I left it as a reference/reason. Although might be quite confusing
now...

> 
> I wonder if this being here is actually a problem at all. It's legacy
> code and probably there isn't much value in reshuffling it further.
> Rather than that, we would probably want to make sure that everything
> migrated to DT and just drop the board files.

Maybe let's remove the FIXME and leave the clock init. Since all these
times no one fixed the FIXME, so now with limited hardware access I do
not expect any movements here.

> 
> >          */
> >         s3c64xx_clk_init(NULL, xtal_f, xusbxti_f, soc_is_s3c6400(), S3C_VA_SYS);
> > -       samsung_wdt_reset_init(S3C_VA_WATCHDOG);
> >
> >         printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
> >
> > @@ -429,12 +429,3 @@ static int __init s3c64xx_init_irq_eint(void)
> >         return 0;
> >  }
> >  arch_initcall(s3c64xx_init_irq_eint);
> > -
> > -void s3c64xx_restart(enum reboot_mode mode, const char *cmd)
> > -{
> > -       if (mode != REBOOT_SOFT)
> > -               samsung_wdt_reset();
> > -
> > -       /* if all else fails, or mode was for soft, jump to 0 */
> > -       soft_restart(0);
> 
> Does this remove the soft reboot capability? I'm not sure how much of
> a problem that would be, though.

1. No one cared about it in f6361c6b3880 :)
2. Exynos does not have it
3. Does soft_restart really work? It would be worth to keep it if more
   or less it was working.

Best regards,
Krzysztof

> 
> [snip]
> > diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> > index 1724f5ea5c46..09c4e8742629 100644
> > --- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> > +++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> > @@ -12,7 +12,6 @@
> >  #include <mach/map.h>
> >
> >  #include "common.h"
> > -#include "watchdog-reset.h"
> >
> >  /*
> >   * IO mapping for shared system controller IP.
> > @@ -39,20 +38,6 @@ static void __init s3c64xx_dt_map_io(void)
> >                 panic("SoC is not S3C64xx!");
> >  }
> >
> > -static void __init s3c64xx_dt_init_machine(void)
> > -{
> > -       samsung_wdt_reset_of_init();
> > -}
> > -
> > -static void s3c64xx_dt_restart(enum reboot_mode mode, const char *cmd)
> > -{
> > -       if (mode != REBOOT_SOFT)
> > -               samsung_wdt_reset();
> > -
> > -       /* if all else fails, or mode was for soft, jump to 0 */
> > -       soft_restart(0);
> 
> Ditto.
> 
> Best regards,
> Tomasz
