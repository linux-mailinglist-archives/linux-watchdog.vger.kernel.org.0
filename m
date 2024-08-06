Return-Path: <linux-watchdog+bounces-1456-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46794920D
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 15:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680B8B2CA5A
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 13:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F15B1D47AD;
	Tue,  6 Aug 2024 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFV2X6VH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F51D47A2;
	Tue,  6 Aug 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952093; cv=none; b=LC+ppo0XKpP/JbFO9fQ72mMsD/PYoXHDE4VEstybjfhPpW6a4ERpTX81iVtzn3/c5EbNLTr2RCNNhOzqHIB6vG5aSh2T2ySniWO9TUqG9P/POrqjmgWTfViPzzvRleMqN9U1fJmHi7gcASqeYcGlUDBGGtj0KGuI7v4xuLVmZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952093; c=relaxed/simple;
	bh=BqnKAUCWcDIjhm2+lTYpZTWTssaO70bBdk2S0yIbdWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdciUFfxeg0JXLA5HaRntozkBF5pEMKsGORY7roZxmikvxJjl31jU2dbAxdo5OkcIDrX94gu25QEhi8WZfDNb5j7ZaEVyNKiTD3r7vCi3dNmqZeSEzB72Sp3KZelzfFF2slHjbDNOQBiShY59+E0ivRno6giLxvByOhTB/yMZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFV2X6VH; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f6b7250d6dso221923e0c.0;
        Tue, 06 Aug 2024 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722952090; x=1723556890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECT70F8ui5lw6WNFO/lAOYt5X8TuJlJygMtjeEHBoFU=;
        b=hFV2X6VH3pHV5jYXjBdiRrh3sRyOkTuZeoTAecDm+nZlOloC9oAkrJ1uAcpCYqGFvY
         DQXP4V1pHKgOLR1O8RDlVtoaelkTyZSHjF12Kd9Wd15V2y3NOf+QgZUSdcSPURRxLfBA
         FCVWg7E0ThmpdbF6PKrtx3mgvbpIas/VW9+bmA51EY/cpkNY+UQ0yjHBXx91EPvmUoWl
         PHkiBwx+vOQIhM8YAgC4JI4vneQW4Ol2XGVR3bdmY42Vori+iw0g5CIArNp1kimK+ZXE
         IyN2jmQWZrYy2DEOGR4NrtXMobiDM2mDYLTRAAdAWXsAn1K7AJESCdLxg75MKqMiSIzl
         jyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952090; x=1723556890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECT70F8ui5lw6WNFO/lAOYt5X8TuJlJygMtjeEHBoFU=;
        b=taS2mXRC8uKLqEcQiEfiptPQ8MUjSMQbfWuanhjfn+EBsLmPvckK5zgUqUViuTFeVm
         TAjAnuvGdFIgQQxmQGN/XZPi/+5Utz/XksZl2vLaS2OBIWXrM04NrT5cljqxjjXXrfvB
         cevJ6jCj92WbJP86oxzB49oaCSpLDOQMycidTxg2zPjoihJ52muuS1nZjzvZrTL+S49d
         QLXhApno6nruIdPSrT+vt8DoYatlLwebh7+AGuSxLfX+AAYk12ba5Z95AEdiN3lBKJSm
         PumHSf/TlRNG+VKKoySJSG4gpRzmf9A0Ig7TkQSK63OeKx+j6DbdBWiXyZb9VqTSkavj
         2JgA==
X-Forwarded-Encrypted: i=1; AJvYcCUX3atfEN03LQCXCisXilWZsLOwGN8rzsmr9F8oCJ86InsFDp37JgqwC+FERgPONz5ud679Nm7PCyk38vZ6m9MMzaIjt1kHiTxV8noYGyZvmNf1Sq+KCv7569CljNYZXXCOu4i3ZDr5hEgi/UyEsed/kIpC9nGsqRKBvxuzp9ijbypqgdnum+RjHbUldnRJPBjyhQZhFMc7852JPF5ICvcJ7o7lGddomEm3IWs=
X-Gm-Message-State: AOJu0Yyls+gYDsu4s1ohKJUxLEJxhbWtGXrV07bRgQ/sLIBBQaFTwhRZ
	qU85Hf+v8k3X9AnqwA8CCgfgZtr26Nf+JrF/+s8OLZ8f66NTKoj8ADst3yaIYDx+KQjUHnOfgHK
	xoEpYL9sTp93wpK+yj3qrvB/yEKM=
X-Google-Smtp-Source: AGHT+IHhElSupydm9Pu8Q2cCtAhcr2G+W8uC687+2vGI6V7+dLh4KkHCNjePrtfwGAhHDTl8L3bMjI5q6uAafHbuczU=
X-Received: by 2002:a05:6122:a11:b0:4f5:130c:bef3 with SMTP id
 71dfb90a1353d-4f89ff3aca6mr18358968e0c.1.1722952090043; Tue, 06 Aug 2024
 06:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240805200400.54267-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <81ac76eb-8b43-457b-80be-c588ac4790e1@roeck-us.net>
In-Reply-To: <81ac76eb-8b43-457b-80be-c588ac4790e1@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Aug 2024 14:47:42 +0100
Message-ID: <CA+V-a8u0dFGmNqJWuXXH3mVVTT6dWBhSr+SM7nFyu3DAeACjNA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Mon, Aug 5, 2024 at 9:34=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/5/24 13:04, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add Watchdog Timer driver for RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Fixed dependency, ARCH_R9A09G011->ARCH_R9A09G057
> > - Added dependency for PM
> > - Added delay after de-assert operation as clks are halted temporarily
> >    after de-assert operation
> > - clearing WDTSR register
> >
> > v1->v2
> > - Stopped using PM runtime calls in restart handler
> > - Dropped rstc deassert from probe
> > ---
> >   drivers/watchdog/Kconfig     |   9 ++
> >   drivers/watchdog/Makefile    |   1 +
> >   drivers/watchdog/rzv2h_wdt.c | 259 ++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 269 insertions(+)
> >   create mode 100644 drivers/watchdog/rzv2h_wdt.c
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index bae1d97cce89..684b9fe84fff 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -953,6 +953,15 @@ config RENESAS_RZG2LWDT
> >         This driver adds watchdog support for the integrated watchdogs =
in the
> >         Renesas RZ/G2L SoCs. These watchdogs can be used to reset a sys=
tem.
> >
> > +config RENESAS_RZV2HWDT
> > +     tristate "Renesas RZ/V2H(P) WDT Watchdog"
> > +     depends on ARCH_R9A09G057 || COMPILE_TEST
> > +     depends on PM || COMPILE_TEST
> > +     select WATCHDOG_CORE
> > +     help
> > +       This driver adds watchdog support for the integrated watchdogs =
in the
> > +       Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a =
system.
> > +
> >   config ASPEED_WATCHDOG
> >       tristate "Aspeed BMC watchdog support"
> >       depends on ARCH_ASPEED || COMPILE_TEST
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index b51030f035a6..ab6f2b41e38e 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -86,6 +86,7 @@ obj-$(CONFIG_RENESAS_WDT) +=3D renesas_wdt.o
> >   obj-$(CONFIG_RENESAS_RZAWDT) +=3D rza_wdt.o
> >   obj-$(CONFIG_RENESAS_RZN1WDT) +=3D rzn1_wdt.o
> >   obj-$(CONFIG_RENESAS_RZG2LWDT) +=3D rzg2l_wdt.o
> > +obj-$(CONFIG_RENESAS_RZV2HWDT) +=3D rzv2h_wdt.o
> >   obj-$(CONFIG_ASPEED_WATCHDOG) +=3D aspeed_wdt.o
> >   obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o
> >   obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > new file mode 100644
> > index 000000000000..b6183940b221
> > --- /dev/null
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -0,0 +1,259 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) WDT Watchdog Driver
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corporation.
> > + */
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <linux/units.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define WDTRR                        0x00    /* RW, 8  */
> > +#define WDTCR                        0x02    /* RW, 16 */
> > +#define WDTSR                        0x04    /* RW, 16 */
> > +#define WDTRCR                       0x06    /* RW, 8  */
> > +
> > +#define WDTCR_TOPS_1024              0x00
> > +#define WDTCR_TOPS_16384     0x03
> > +
> > +#define WDTCR_CKS_CLK_1              0x00
> > +#define WDTCR_CKS_CLK_256    0x50
> > +
> > +#define WDTCR_RPES_0         0x300
> > +#define WDTCR_RPES_75                0x000
> > +
> > +#define WDTCR_RPSS_25                0x00
> > +#define WDTCR_RPSS_100               0x3000
> > +
> > +#define WDTRCR_RSTIRQS               BIT(7)
> > +
> > +#define CLOCK_DIV_BY_256     256
> > +
> > +#define WDT_DEFAULT_TIMEOUT  60U
> > +
> > +static bool nowayout =3D WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (d=
efault=3D"
> > +              __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +struct rzv2h_wdt_priv {
> > +     void __iomem *base;
> > +     struct clk *pclk;
> > +     struct clk *oscclk;
> > +     struct reset_control *rstc;
> > +     struct watchdog_device wdev;
> > +     unsigned long oscclk_rate;
> > +};
> > +
> > +static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     static unsigned long delay;
> > +
> > +     writeb(0x0, priv->base + WDTRR);
> > +     writeb(0xFF, priv->base + WDTRR);
> > +
> > +     /*
> > +      * Refreshing the down-counter requires up to 4 cycles
> > +      * of the signal for counting
> > +      */
>
> That doesn't explain why the delay (after pinging the watchdog) is necess=
ary.
>
> > +     if (!delay)
> > +             delay =3D 4 * div64_ul(CLOCK_DIV_BY_256 * MICRO, priv->os=
cclk_rate);
>
> "MICRO" is 1000000UL, and CLOCK_DIV_BY_256 is 256, making this 256000000 =
which fits
> into 32 bit. oscclk_rate is unsigned long. Please explain the need for us=
ing div64_ul(),
> because I don't see it.
>
> Besides that, please explain the benefit of storing "delay" in a static v=
ariable
> instead of calculating it with oscclk_rate and storing it in struct rzv2h=
_wdt_priv.
> This should better be a good explanation because it is very unlikely that=
 I'll accept
> the code as written.
>
As per the HW manual  we have, "After FFh is written to the WDT
Refresh Register (WDTRR), refreshing the down-counter requires up to 4
cycles of the signal for counting. To meet this requirement, complete
writing FFh to WDTRR 4 count cycles before the ms", which I misread
that delay is required as 4 cycles are required to reflect, but this
isnt the case we can return as soon as FFh is written and let the HW
to start down-counter after 4 cycles.

So Ive now updated the code to drop any delay in ping operation.

> > +     udelay(delay);
> > +
> > +     return 0;
> > +}
> > +
> > +static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +
> > +     writew(wdtcr, priv->base + WDTCR);
> > +
> > +     writeb(0, priv->base + WDTRCR);
> > +
> > +     writew(0, priv->base + WDTSR);
> > +}
> > +
> > +static int rzv2h_wdt_start(struct watchdog_device *wdev)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     int ret;
> > +
> > +     ret =3D reset_control_deassert(priv->rstc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     udelay(5);
> > +
> > +     ret =3D pm_runtime_resume_and_get(wdev->parent);
> > +     if (ret) {
> > +             reset_control_assert(priv->rstc);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * WDTCR
> > +      * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
> > +      * - RPSS[13:12] - Window Start Position Select - 11b: 100%
> > +      * - RPES[9:8] - Window End Position Select - 11b: 0%
> > +      * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FFFh=
)
> > +      */
> > +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
> > +                     WDTCR_RPES_0 | WDTCR_TOPS_16384);
> > +
> > +     rzv2h_wdt_ping(wdev);
> > +
>
> The need to ping the watchdog immediately after enabling it is unusual.
> Please explain.
>
The down counting operation starts only after the ping operation, so
after starting the wdt a ping is issued here.

> > +     return 0;
> > +}
> > +
> > +static int rzv2h_wdt_stop(struct watchdog_device *wdev)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_put(wdev->parent);
> > +     if (ret < 0)
> > +             return ret;
>
> Shouldn't this be called _after_ stopping the watchdog ?
>
Ideally this should be the reverse of start operation, hence stopping
the clocks first and then the assert operation. I did this because
there is a temporary halt of clock after de-assert operation. To
handle this now I ve update start and stop callbacks to below code:

static int rzv2h_wdt_start(struct watchdog_device *wdev)
{
    struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
    int ret;

    ret =3D pm_runtime_resume_and_get(wdev->parent);
    if (ret)
        return ret;

    ret =3D reset_control_deassert(priv->rstc);
    if (ret) {
        pm_runtime_put(wdev->parent);
        return ret;
    }

    /* delay to handle clock halt after de-assert operation */
    udelay(3);

.....
.....

    return 0;
}

static int rzv2h_wdt_stop(struct watchdog_device *wdev)
{
    struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
    int ret;

    ret =3D reset_control_assert(priv->rstc);
    if (ret)
        return ret;

    ret =3D pm_runtime_put(wdev->parent);
    if (ret < 0)
        return ret;

    return 0;
}


> > +
> > +     return reset_control_assert(priv->rstc);
> > +}
> > +
> > +static const struct watchdog_info rzv2h_wdt_ident =3D {
> > +     .options =3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTI=
MEOUT,
> > +     .identity =3D "Renesas RZ/V2H WDT Watchdog",
> > +};
> > +
> > +static int rzv2h_wdt_restart(struct watchdog_device *wdev,
> > +                          unsigned long action, void *data)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     int ret;
> > +
> > +     ret =3D reset_control_deassert(priv->rstc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* delay to handle clock halt after de-assert operation */
> > +     udelay(5);
> > +
> > +     ret =3D clk_enable(priv->pclk);
> > +     if (ret) {
> > +             reset_control_assert(priv->rstc);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_enable(priv->oscclk);
> > +     if (ret) {
> > +             clk_disable(priv->pclk);
> > +             reset_control_assert(priv->rstc);
> > +             return ret;
> > +     }
> > +
> Please explain the need for enabling the clocks here.
>
When using the below from user space, while the watchdog service is
not running, the below directly lands into restart callback, (please
let me know if my understanding is wrong here)

reboot(LINUX_REBOOT_CMD_RESTART);

Ive now updated restart with below, so that we dont touch clocks if
they are already ON,

    if (!watchdog_active(wdev)) {
        ret =3D clk_enable(priv->pclk);
        if (ret)
            return ret;

        ret =3D clk_enable(priv->oscclk);
        if (ret) {
            clk_disable(priv->pclk);
            return ret;
        }
    }

    if (!watchdog_active(wdev))
        ret =3D reset_control_deassert(priv->rstc);
    else
        ret =3D reset_control_reset(priv->rstc);
    if (ret) {
        clk_disable(priv->oscclk);
        clk_disable(priv->pclk);
        return ret;
    }

    /* delay to handle clock halt after de-assert operation */
    udelay(3);


> > +     /*
> > +      * WDTCR
> > +      * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
> > +      * - RPSS[13:12] - Window Start Position Select - 00b: 25%
> > +      * - RPES[9:8] - Window End Position Select - 00b: 75%
> > +      * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FFh)
> > +      */
> > +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
> > +                     WDTCR_RPES_75 | WDTCR_TOPS_1024);
> > +     rzv2h_wdt_ping(wdev);
> > +
> Why is the ping here necessary ?
>
The down counting starts after the refresh operation, hence the WDT is ping=
ed.

> > +     /* wait for underflow to trigger... */
> > +     mdelay(500);
>
> Does that really take 500 ms ?
>
Agreed this can be reduced as the WDT is configured to trigger asap.

> > +
> > +     return 0;
>
>
> > +}
> > +
> > +static const struct watchdog_ops rzv2h_wdt_ops =3D {
> > +     .owner =3D THIS_MODULE,
> > +     .start =3D rzv2h_wdt_start,
> > +     .stop =3D rzv2h_wdt_stop,
> > +     .ping =3D rzv2h_wdt_ping,
> > +     .restart =3D rzv2h_wdt_restart,
> > +};
> > +
> > +static int rzv2h_wdt_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rzv2h_wdt_priv *priv;
> > +     unsigned long rate;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->base))
> > +             return PTR_ERR(priv->base);
> > +
> > +     priv->pclk =3D devm_clk_get_prepared(&pdev->dev, "pclk");
> > +     if (IS_ERR(priv->pclk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk), "no=
 pclk");
> > +
> > +     priv->oscclk =3D devm_clk_get_prepared(&pdev->dev, "oscclk");
> > +     if (IS_ERR(priv->oscclk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(priv->oscclk), "=
no oscclk");
> > +
> > +     priv->oscclk_rate =3D clk_get_rate(priv->oscclk);
> > +     if (!priv->oscclk_rate)
> > +             return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is=
 0");
> > +
> > +     priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, 16383=
NULL);
> > +     if (IS_ERR(priv->rstc))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> > +                                  "failed to get cpg reset");
> > +
> > +     rate =3D priv->oscclk_rate / 256;
> > +     priv->wdev.max_hw_heartbeat_ms =3D (1000 * 16383) / rate;
>
> Not accounting to rounding, this translates to
>                 =3D (1000 * 16383) / (clk_rate / 256)
>                 =3D (1000 * 16383 * 256) / clk_rate
>
> Why the added complexity ?
>
Agreed, I will update the above.

> Also, what is the value of storing oscclk_rate instead of the calculated =
delay
> in the private data structure ?
>
Agreed, as mentioned above I no longer need storing the oscclk_rate in
priv structure as I have dropped adding delay in ping operation.

Cheers,
Prabhakar

