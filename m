Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C394232364
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 19:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgG2Rdr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 13:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2Rdr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 13:33:47 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC32C061794;
        Wed, 29 Jul 2020 10:33:47 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id t15so16465561iob.3;
        Wed, 29 Jul 2020 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+vixry6nEfXY47k6g2NXP88IRhPMZr+Wty/TXFz87ZI=;
        b=gEZonXZ2LluZLk3wgSvAmRHYh6Y5lkUAK4lLJMc1yVFPJR1PO91DBhcC5QCIyyCjrb
         38uWEJfu/NMrP6fqwOUe6lVlmItgvFQAWWXDRTB95Af3MUfosDIBCdYm1lXzREIWKrvx
         qTdsZg/nO5MEdzBj54EfbseYbNCqzHZW13pAnxqyLYrPghobQlD0a8hinT3BLQ3RzZet
         /aVm3iDE7LrJLe87AUDX+qaj58ymtPru1aTDSBC/0Of4VifVNzKviVn4RPLcjsWqLA2z
         ulcu71J6axfi77BFKVZwDBjc5YyOreWrm9HdaSkR0eyP5XYVpC1ZvGrW3AArhyQhQg6p
         9Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+vixry6nEfXY47k6g2NXP88IRhPMZr+Wty/TXFz87ZI=;
        b=qwHD+2qJSBRWtex3q9lGnBqMuV71gPOqdCknN+UyajEq5lAIfsWiyyHfDYNwIjCRJA
         07VSTS5FWi6uGIIgvlBNMGXE5Wm0AobqXF/qd9+EIppis/7I3+HAvSCi2fWTCodlNmJ9
         93e/EJ5zCjw9VI3TjxoyfD25YhyiccjI26oSL1HxBomq2855X7+4CxGi9olcRsmWi+po
         r/QGe8xQ+XeAzywaUoBb1ic89p09yJDeQlgzjPQp0AlFq0crXdzFnTQaqXtXr3drgBPm
         wChlHs6nSGLtNLSL6mOioJsKzbwxi95E2bmE1Na84YiqpbnGlWKtkjQn0M48DNOq8y8I
         YYHw==
X-Gm-Message-State: AOAM533Reh1dvnJRys/a005joFDkfaUBg3VZz4j2OzUpmfDzyG06b4xv
        2mVcC63vCcw0lwZjR2xAhpme1D6szd1mxpH5GFc=
X-Google-Smtp-Source: ABdhPJyU3nx+6KzmW6K1NkPxxx1sarMux4E+xojFgg0PzkSzoL7OvYQEsP5p3zMcB3nMwxoG31aqQdwbPDeMstxfK4Y=
X-Received: by 2002:a02:aa1b:: with SMTP id r27mr38565873jam.89.1596044026207;
 Wed, 29 Jul 2020 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org> <20200729160942.28867-7-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-7-krzk@kernel.org>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Wed, 29 Jul 2020 19:33:33 +0200
Message-ID: <CA+Ln22F_PaEMNyEg4XSR0PXHTa+3dQyEvzgtnRNHMu61uZytQg@mail.gmail.com>
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

Hi Krzysztof,

2020=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 18:11 Krzysztof Kozlowski <kr=
zk@kernel.org>:
>
> Similarly to commit f6361c6b3880 ("ARM: S3C24XX: remove separate restart
> code"), the platform watchdog reset code can be removed in favor of
> a generic watchdog driver which already handles reset.
>
> This allows removal of a bunch of machine code and fixes also W=3D1
> compile warnings:
>
>     arch/arm/plat-samsung/watchdog-reset.c:29:6: warning: no previous pro=
totype for 'samsung_wdt_reset' [-Wmissing-prototypes]
>        29 | void samsung_wdt_reset(void)
>           |      ^~~~~~~~~~~~~~~~~
>     arch/arm/plat-samsung/watchdog-reset.c:69:13: warning: no previous pr=
ototype for 'samsung_wdt_reset_of_init' [-Wmissing-prototypes]
>        69 | void __init samsung_wdt_reset_of_init(void)
>           |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>     arch/arm/plat-samsung/watchdog-reset.c:89:13: warning: no previous pr=
ototype for 'samsung_wdt_reset_init' [-Wmissing-prototypes]
>        89 | void __init samsung_wdt_reset_init(void __iomem *base)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c64xx/Kconfig           |  3 +-
>  arch/arm/mach-s3c64xx/common.c          | 15 +---
>  arch/arm/mach-s3c64xx/common.h          |  2 -
>  arch/arm/mach-s3c64xx/mach-anw6410.c    |  1 -
>  arch/arm/mach-s3c64xx/mach-crag6410.c   |  1 -
>  arch/arm/mach-s3c64xx/mach-hmt.c        |  1 -
>  arch/arm/mach-s3c64xx/mach-mini6410.c   |  1 -
>  arch/arm/mach-s3c64xx/mach-ncp.c        |  1 -
>  arch/arm/mach-s3c64xx/mach-real6410.c   |  1 -
>  arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c | 17 -----
>  arch/arm/mach-s3c64xx/mach-smartq5.c    |  1 -
>  arch/arm/mach-s3c64xx/mach-smartq7.c    |  1 -
>  arch/arm/mach-s3c64xx/mach-smdk6400.c   |  1 -
>  arch/arm/mach-s3c64xx/mach-smdk6410.c   |  1 -
>  arch/arm/mach-s3c64xx/watchdog-reset.h  | 16 -----
>  arch/arm/plat-samsung/Kconfig           |  6 --
>  arch/arm/plat-samsung/Makefile          |  1 -
>  arch/arm/plat-samsung/watchdog-reset.c  | 93 -------------------------
>  18 files changed, 5 insertions(+), 158 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c64xx/watchdog-reset.h
>  delete mode 100644 arch/arm/plat-samsung/watchdog-reset.c
>

Thanks for the patch! Please see my comments inline.

> diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfi=
g
> index e208c2b48853..f3fcb570edf5 100644
> --- a/arch/arm/mach-s3c64xx/Kconfig
> +++ b/arch/arm/mach-s3c64xx/Kconfig
> @@ -18,9 +18,10 @@ menuconfig ARCH_S3C64XX
>         select PM_GENERIC_DOMAINS if PM
>         select S3C_DEV_NAND if ATAGS
>         select S3C_GPIO_TRACK if ATAGS
> +       select S3C2410_WATCHDOG
>         select SAMSUNG_ATAGS if ATAGS
>         select SAMSUNG_WAKEMASK if PM
> -       select SAMSUNG_WDT_RESET
> +       select WATCHDOG
>         help
>           Samsung S3C64XX series based systems
>
> diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/commo=
n.c
> index a655bf0c7802..42e96d196f61 100644
> --- a/arch/arm/mach-s3c64xx/common.c
> +++ b/arch/arm/mach-s3c64xx/common.c
> @@ -50,7 +50,6 @@
>
>  #include "common.h"
>  #include "irq-uart.h"
> -#include "watchdog-reset.h"
>
>  /* External clock frequency */
>  static unsigned long xtal_f __ro_after_init =3D 12000000;
> @@ -232,10 +231,11 @@ void __init s3c64xx_init_irq(u32 vic0_valid, u32 vi=
c1_valid)
>         /*
>          * FIXME: there is no better place to put this at the moment
>          * (s3c64xx_clk_init needs ioremap and must happen before init_ti=
me
> -        * samsung_wdt_reset_init needs clocks)
> +        * samsung_wdt_reset_init needs clocks).  However
> +        * samsung_wdt_reset_init() was removed in favor of watchdog driv=
er
> +        * so this should be revised.

This leaves the comment referring to an inexistent function.

I wonder if this being here is actually a problem at all. It's legacy
code and probably there isn't much value in reshuffling it further.
Rather than that, we would probably want to make sure that everything
migrated to DT and just drop the board files.

>          */
>         s3c64xx_clk_init(NULL, xtal_f, xusbxti_f, soc_is_s3c6400(), S3C_V=
A_SYS);
> -       samsung_wdt_reset_init(S3C_VA_WATCHDOG);
>
>         printk(KERN_DEBUG "%s: initialising interrupts\n", __func__);
>
> @@ -429,12 +429,3 @@ static int __init s3c64xx_init_irq_eint(void)
>         return 0;
>  }
>  arch_initcall(s3c64xx_init_irq_eint);
> -
> -void s3c64xx_restart(enum reboot_mode mode, const char *cmd)
> -{
> -       if (mode !=3D REBOOT_SOFT)
> -               samsung_wdt_reset();
> -
> -       /* if all else fails, or mode was for soft, jump to 0 */
> -       soft_restart(0);

Does this remove the soft reboot capability? I'm not sure how much of
a problem that would be, though.

[snip]
> diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c6=
4xx/mach-s3c64xx-dt.c
> index 1724f5ea5c46..09c4e8742629 100644
> --- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> +++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> @@ -12,7 +12,6 @@
>  #include <mach/map.h>
>
>  #include "common.h"
> -#include "watchdog-reset.h"
>
>  /*
>   * IO mapping for shared system controller IP.
> @@ -39,20 +38,6 @@ static void __init s3c64xx_dt_map_io(void)
>                 panic("SoC is not S3C64xx!");
>  }
>
> -static void __init s3c64xx_dt_init_machine(void)
> -{
> -       samsung_wdt_reset_of_init();
> -}
> -
> -static void s3c64xx_dt_restart(enum reboot_mode mode, const char *cmd)
> -{
> -       if (mode !=3D REBOOT_SOFT)
> -               samsung_wdt_reset();
> -
> -       /* if all else fails, or mode was for soft, jump to 0 */
> -       soft_restart(0);

Ditto.

Best regards,
Tomasz
