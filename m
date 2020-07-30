Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295F4233103
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgG3Lev (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 07:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgG3Leu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 07:34:50 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791A1C061794;
        Thu, 30 Jul 2020 04:34:50 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id z6so27896838iow.6;
        Thu, 30 Jul 2020 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/cCy3e2/ARsCaPTvfDZ1uKfIB+o4G74oHwe5Mn6cKCA=;
        b=CAkTfwVMKQWGuz9ekL1cJ3HgC/qgAGLTmvVrwvcx01jtGw6HYmAD8Pt9aQ0wWPq8dX
         BBGkShFGHPYnAFuaPIaAVljma+aRynx8GrTI42nCbD1HNTK9iQnhL+gVAIhjqoe6ZtUJ
         3EGZDx8UTtF6o4mEoKrmpQ+p7YVQdXnh+XMrXFRnm4OtB8q0v7m4qyZ9nfjSSYSDgTop
         Sqj7uaYCx8TcapSGqvuPot/sdUTAeObLbMo6k0KL/axM1WR8EpHRdXEuYvrckcW0MkkX
         rQysbHpIjupRsbJZFVFGxJKftGdT/IJlFhNxDYN4GuFe7M+0lKtaL7D0a9/LZcswsa6P
         +wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/cCy3e2/ARsCaPTvfDZ1uKfIB+o4G74oHwe5Mn6cKCA=;
        b=NDhhRBM6DKeT3/UjymaGMVjqxVNGHbR4XywnHbHUKDVQ37ZjB5HVdkw+x2aYFM7yPj
         kGB9Xc7WKaF/zW+LwTAzK78PthhluHwyIhEzDO4Cg8Qt2X89tn2ZO2QP4CQCi1wja4HV
         kcN1ivwF9yTUxRuMJ8dy3fftpbdIdThBZD204jDYsV7F6hHHcMlqgTpc534RvuLQJUEN
         uoiBoJlwJKO92gd1mRSuzcq6KGW1M8h+eqiSohnsWftLLQikuocnFlpHjPx11qSWyauI
         D77ErTo0iS2YdfW9ydpn8Qd++MVRMOasSdevSezLtHhpTPXAfZQsUGX4X6fEpGTLxYxC
         Q4CA==
X-Gm-Message-State: AOAM530qH+2xU9tyC90DtgRvYyiRtdOQtKtAOKkngu++pcMvewhnkmWw
        +B6zLh+5NytY8xr+Sc/a/hE8oSdemZ6yAsQLsTk=
X-Google-Smtp-Source: ABdhPJyd4mFaZ3dVHSZ0+D3fgyXhU3yNg3UTIH3UHlRjZwBERyG5jEtfls1uM+yzJ3hkFSZsknSWsJ8rX5KHKVOeWtQ=
X-Received: by 2002:a02:6d5d:: with SMTP id e29mr2778861jaf.139.1596108889675;
 Thu, 30 Jul 2020 04:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-7-krzk@kernel.org>
 <CA+Ln22F_PaEMNyEg4XSR0PXHTa+3dQyEvzgtnRNHMu61uZytQg@mail.gmail.com> <20200729191544.GB5822@kozik-lap>
In-Reply-To: <20200729191544.GB5822@kozik-lap>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Thu, 30 Jul 2020 13:34:38 +0200
Message-ID: <CA+Ln22ED+-B96jf8p89sXpD2vmDLuteKXQiuKPy50vJ80MgSjA@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: s3c64xx: Switch to generic watchdog driver reset
To:     Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

2020=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 21:15 Krzysztof Kozlowski <kr=
zk@kernel.org>:
>
> On Wed, Jul 29, 2020 at 07:33:33PM +0200, Tomasz Figa wrote:
> > Hi Krzysztof,
> >
> > 2020=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 18:11 Krzysztof Kozlowski=
 <krzk@kernel.org>:
> > >
> > > Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate rest=
art
> > > code"), the platform watchdog reset code can be removed in favor of
> > > a generic watchdog driver which already handles reset.
> > >
> > > This allows removal of a bunch of machine code and fixes also W=3D1
> > > compile warnings:
> > >
> > >     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous=
 prototype for 'samsung_wdt_reset' [-Wmissing-prototypes]
> > >        29 | void samsung_wdt_reset(void)
> > >           |      ^~~~~~~~~~~~~~~~~
> > >     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previou=
s prototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
> > >        69 | void __init samsung_wdt_reset_of_init(void)
> > >           |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previou=
s prototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
> > >        89 | void __init samsung_wdt_reset_init(void __iomem *base)
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  arch/arm/mach-s3c64xx/Kconfig           |  3 +-
> > >  arch/arm/mach-s3c64xx/common.c          | 15 +---
> > >  arch/arm/mach-s3c64xx/common.h          |  2 -
> > >  arch/arm/mach-s3c64xx/mach-anw6410.c    |  1 -
> > >  arch/arm/mach-s3c64xx/mach-crag6410.c   |  1 -
> > >  arch/arm/mach-s3c64xx/mach-hmt.c        |  1 -
> > >  arch/arm/mach-s3c64xx/mach-mini6410.c   |  1 -
> > >  arch/arm/mach-s3c64xx/mach-ncp.c        |  1 -
> > >  arch/arm/mach-s3c64xx/mach-real6410.c   |  1 -
> > >  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 17 -----
> > >  arch/arm/mach-s3c64xx/mach-smartq5.c    |  1 -
> > >  arch/arm/mach-s3c64xx/mach-smartq7.c    |  1 -
> > >  arch/arm/mach-s3c64xx/mach-smdk6400.c   |  1 -
> > >  arch/arm/mach-s3c64xx/mach-smdk6410.c   |  1 -
> > >  arch/arm/mach-s3c64xx/watchdog-reset.h  | 16 -----
> > >  arch/arm/plat-samsung/Kconfig           |  6 --
> > >  arch/arm/plat-samsung/Makefile          |  1 -
> > >  arch/arm/plat-samsung/watchdog-reset.c  | 93 -----------------------=
--
> > >  18 files changed, 5 insertions(+), 158 deletions(-)
> > >  delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
> > >  delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
> > >
> >
> > Thanks for the patch! Please see my comments inline.
> >
> > > diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kc=
onfig
> > > index e208c2b48853..f3fcb570edf5 100644
> > > --- a/arch/arm/mach-s3c64xx/Kconfig
> > > +++ b/arch/arm/mach-s3c64xx/Kconfig
> > > @@ -18,9 +18,10 @@ menuconfig ARCH_S3C64XX
> > >         select PM_GENERIC_DOMAINS if PM
> > >         select S3C_DEV_NAND if ATAGS
> > >         select S3C_GPIO_TRACK if ATAGS
> > > +       select S3C2410_WATCHDOG
> > >         select SAMSUNG_ATAGS if ATAGS
> > >         select SAMSUNG_WAKEMASK if PM
> > > -       select SAMSUNG_WDT_RESET
> > > +       select WATCHDOG
> > >         help
> > >           Samsung S3C64XX series based systems
> > >
> > > diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/c=
ommon.c
> > > index a655bf0c7802..42e96d196f61 100644
> > > --- a/arch/arm/mach-s3c64xx/common.c
> > > +++ b/arch/arm/mach-s3c64xx/common.c
> > > @@ -50,7 +50,6 @@
> > >
> > >  #include "common.h"
> > >  #include "irq-uart.h"
> > > -#include "watchdog-reset.h"
> > >
> > >  /* External clock frequency */
> > >  static unsigned long xtal_f __ro_after_init =3D 12000000;
> > > @@ -232,10 +231,11 @@ void __init s3c64xx_init_irq(u32 vic0_valid, u3=
2 vic1_valid)
> > >         /*
> > >          * FIXME: there is no better place to put this at the moment
> > >          * (s3c64xx_clk_init needs ioremap and must happen before ini=
t_time
> > > -        * samsung_wdt_reset_init needs clocks)
> > > +        * samsung_wdt_reset_init needs clocks).  However
> > > +        * samsung_wdt_reset_init() was removed in favor of watchdog =
driver
> > > +        * so this should be revised.
> >
> > This leaves the comment referring to an inexistent function.
>
> Yes, I left it as a reference/reason. Although might be quite confusing
> now...
>
> >
> > I wonder if this being here is actually a problem at all. It's legacy
> > code and probably there isn't much value in reshuffling it further.
> > Rather than that, we would probably want to make sure that everything
> > migrated to DT and just drop the board files.
>
> Maybe let's remove the FIXME and leave the clock init. Since all these
> times no one fixed the FIXME, so now with limited hardware access I do
> not expect any movements here.
>

I think that would be fairly uncontroversial at this point.

> >
> > >          */
> > >         s3c64xx_clk_init(NULL, xtal_f, xusbxti_f, soc_is_s3c6400(), S=
3C_VA_SYS);
> > > -       samsung_wdt_reset_init(S3C_VA_WATCHDOG);
> > >
> > >         printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
> > >
> > > @@ -429,12 +429,3 @@ static int __init s3c64xx_init_irq_eint(void)
> > >         return 0;
> > >  }
> > >  arch_initcall(s3c64xx_init_irq_eint);
> > > -
> > > -void s3c64xx_restart(enum reboot_mode mode, const char *cmd)
> > > -{
> > > -       if (mode !=3D REBOOT_SOFT)
> > > -               samsung_wdt_reset();
> > > -
> > > -       /* if all else fails, or mode was for soft, jump to 0 */
> > > -       soft_restart(0);
> >
> > Does this remove the soft reboot capability? I'm not sure how much of
> > a problem that would be, though.
>
> 1. No one cared about it in f6361c6b3880 :)

That was a different SoC family, though.

> 2. Exynos does not have it
> 3. Does soft_restart really work? It would be worth to keep it if more
>    or less it was working.

Anyway, I guess there is no way to know other than just removing it.
It can be always brought back if it turns out that someone needs it.
Please just mention that in the commit message.

With that addressed:

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

>
> Best regards,
> Krzysztof
>
> >
> > [snip]
> > > diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-=
s3c64xx/mach-s3c64xx-dt.c
> > > index 1724f5ea5c46..09c4e8742629 100644
> > > --- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> > > +++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> > > @@ -12,7 +12,6 @@
> > >  #include <mach/map.h>
> > >
> > >  #include "common.h"
> > > -#include "watchdog-reset.h"
> > >
> > >  /*
> > >   * IO mapping for shared system controller IP.
> > > @@ -39,20 +38,6 @@ static void __init s3c64xx_dt_map_io(void)
> > >                 panic("SoC is not S3C64xx!");
> > >  }
> > >
> > > -static void __init s3c64xx_dt_init_machine(void)
> > > -{
> > > -       samsung_wdt_reset_of_init();
> > > -}
> > > -
> > > -static void s3c64xx_dt_restart(enum reboot_mode mode, const char *cm=
d)
> > > -{
> > > -       if (mode !=3D REBOOT_SOFT)
> > > -               samsung_wdt_reset();
> > > -
> > > -       /* if all else fails, or mode was for soft, jump to 0 */
> > > -       soft_restart(0);
> >
> > Ditto.
> >
> > Best regards,
> > Tomasz
