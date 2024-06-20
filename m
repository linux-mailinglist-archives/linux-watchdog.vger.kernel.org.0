Return-Path: <linux-watchdog+bounces-1178-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A789109D2
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 17:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1128228228B
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 15:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B830F1AF697;
	Thu, 20 Jun 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmol2VVN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2893158DCE;
	Thu, 20 Jun 2024 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897226; cv=none; b=et3WjhMF45UM4Cs2KbGnSJcj6Jc8eNuUTAUEcTb8tzOFYdf1Zm0pThTOa0d7rIreWn5MtNeNrp+4zIgi7pOlK2x/1F2rlySAA1WsV/amOBZtHAjZ7BkCYjx49PlhbLS8fq4liGIt8hEF/29/ZAkdoqy7LZthjsdY482+T0f/7lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897226; c=relaxed/simple;
	bh=2XrRRjYF1uqiDwFMGp264d7TNOKR4vo+7hL+13XX10o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hl7XT0XCVu9IpeA3miolUX9odzlR7WzIhFOQhrH3TM9PBaX6RfjWHblFLidAFSG0eYodUq4RgRuJFHh4g4pVv2OBFo9Orc1aQQLbyi6lUhpG9EV0FaQneQe5Dd7DK4n9RCqdd3wbv1Hs3gd5OcTAg0qSJo2utHWwSIg+hz84R5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmol2VVN; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-48c4268adfeso336204137.1;
        Thu, 20 Jun 2024 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718897224; x=1719502024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnZARGKyWFgO8+qiE4D0Qv1mwYwIeF0Y3Q9hF2+I9x0=;
        b=jmol2VVNRfWDNNI6Cdd7lXG5NKYZ3iD412aZXw7N0RLfoNc9263UMZTeR+c3sSn8Hg
         tLb2xPgCfjCNNPFWzHQhV529c+cjfmcC6bicbl59E1GSNdahuT3jaDjsufliTjNlNl3M
         GDi22HIsUzYYNKeq8Iv5ZfyA6vdx8yzIbg/dFaMySLuIG0QmYP6eSS5COBYHVlmr+YEd
         WbR0BRSeVGM3hhhM9WZ7GWN+UDI6l6fgcTMFKB7Y09H0WM9ZGkHTjLUoV6KflNFU9ABU
         oxaPgnHJFlCF74p966xG2EjHXw9g83j3F1zS8G033cifM+ZQIcl7T/XWyDGUc5NnNJbW
         1SaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897224; x=1719502024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnZARGKyWFgO8+qiE4D0Qv1mwYwIeF0Y3Q9hF2+I9x0=;
        b=KdejI8lj4EFF2a45QBTNh/BFnAFBLEyrdn50qEKXX1ZJT0KsmN5mxmjyg1miHT3OPj
         BBDhVrpqq/CBX8BdBOt9zj0hcE9lnfTFGRpFBIgi2yaNl997rOUGkz1aVe2haq0MP1nP
         Atw+1mFWUfJa/kRlqZE2kYEHNSX7gO2jgoo0W3GrzJB+sTH/oxPKdKWq9Fwj6qj2jZVM
         UkC38DpElywvsQ7BP4mep3BbxAzVKeZ/famBzVUwWlUOUvCq819Q3pi8GjL83jqerEVt
         R3EcAqrra1E0EirdhFbJhkqRcCkSq/ZrBC3U8CiesRsnw/kWOwLUrA24wd/365baJXi/
         UBpg==
X-Forwarded-Encrypted: i=1; AJvYcCXaAlZCckTcXE8QNmWIJPFlE4FHAcVkjT2Ica9KWw02UetujPdOJQAD7McqtC297il2BjZ0Th9IFHbr6zo6WTAedfErKSQrInxE3WFZ2ifDDeIxw3+8VcjP9rYYH1hZeKnYWfRY/gy+oL5l1A8t2W74FEkCVD01PYdzjML8HjQWFA3uDSczZjgId9Fps1ok6iEj76zPwTKZOYJsfl8UyBPHg9AlHXkESHiVgbs=
X-Gm-Message-State: AOJu0YyFIeZkmcg70hI1qtuZTCV0dUQVlplGP18gmx2YDsPxFXi5w9o/
	bBG23n8+kt0QUX86XBYosDWRZwobnEI6QLgBhysaZRABre4j14FZ4bUr6wF6EsbTwT8xtQ1qxwr
	muBkup8opF6g1iW7sIn+KEvC6J1Y=
X-Google-Smtp-Source: AGHT+IF9wWjFT/oXYKfheDYuwzcjUvYS61Gxy7ssfcblP4Zs9P+hcLZaQLihuPc5JHmVNVvfTOriddQZXw5Y2/pPDHM=
X-Received: by 2002:a05:6122:2515:b0:4e4:eda9:ec32 with SMTP id
 71dfb90a1353d-4ef2779ffb5mr6997993e0c.10.1718897222232; Thu, 20 Jun 2024
 08:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618222403.464872-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618222403.464872-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <a86797d6-e262-483c-92de-cfab5dfaff69@tuxon.dev>
In-Reply-To: <a86797d6-e262-483c-92de-cfab5dfaff69@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 16:26:36 +0100
Message-ID: <CA+V-a8sZJhqf9TKVo7znS9HKhfRR7pBw4eWjXkQa9FC6+F41xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the review.

On Thu, Jun 20, 2024 at 8:40=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Prabhakar,
>
> On 19.06.2024 01:24, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add Watchdog Timer driver for RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/watchdog/Kconfig     |   8 ++
> >  drivers/watchdog/Makefile    |   1 +
> >  drivers/watchdog/rzv2h_wdt.c | 248 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 257 insertions(+)
> >  create mode 100644 drivers/watchdog/rzv2h_wdt.c
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 85eea38dbdf4..3f7bcc10ccc2 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -938,6 +938,14 @@ config RENESAS_RZG2LWDT
> >         This driver adds watchdog support for the integrated watchdogs =
in the
> >         Renesas RZ/G2L SoCs. These watchdogs can be used to reset a sys=
tem.
> >
> > +config RENESAS_RZV2HWDT
> > +     tristate "Renesas RZ/V2H(P) WDT Watchdog"
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> > +     select WATCHDOG_CORE
> > +     help
> > +       This driver adds watchdog support for the integrated watchdogs =
in the
> > +       Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a =
system.
> > +
> >  config ASPEED_WATCHDOG
> >       tristate "Aspeed BMC watchdog support"
> >       depends on ARCH_ASPEED || COMPILE_TEST
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index 2d1117564f5b..295909a1b3b9 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -86,6 +86,7 @@ obj-$(CONFIG_RENESAS_WDT) +=3D renesas_wdt.o
> >  obj-$(CONFIG_RENESAS_RZAWDT) +=3D rza_wdt.o
> >  obj-$(CONFIG_RENESAS_RZN1WDT) +=3D rzn1_wdt.o
> >  obj-$(CONFIG_RENESAS_RZG2LWDT) +=3D rzg2l_wdt.o
> > +obj-$(CONFIG_RENESAS_RZV2HWDT) +=3D rzv2h_wdt.o
> >  obj-$(CONFIG_ASPEED_WATCHDOG) +=3D aspeed_wdt.o
> >  obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o
> >  obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > new file mode 100644
> > index 000000000000..08f97b4bab7f
> > --- /dev/null
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -0,0 +1,248 @@
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
> > +#define WDTRCR_RSTIRQS         BIT(7)
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
> > +     struct watchdog_device wdev;
> > +     struct reset_control *rstc;
>
> You can keep the pointers first to save some padding, if any.
>
OK.

> > +     unsigned long oscclk_rate;
> > +};
> > +
> > +static u32 rzv2h_wdt_get_cycle_usec(struct rzv2h_wdt_priv *priv,
> > +                                 unsigned long cycle,
> > +                                 u16 wdttime)
> > +{
> > +     int clock_division_ratio;
> > +     u64 timer_cycle_us;
> > +
> > +     clock_division_ratio =3D CLOCK_DIV_BY_256;
> > +
> > +     timer_cycle_us =3D clock_division_ratio * (wdttime + 1) * MICRO;
> > +
> > +     return div64_ul(timer_cycle_us, cycle);
> > +}
> > +
> > +static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +     unsigned long delay;
> > +
> > +     writeb(0x0, priv->base + WDTRR);
> > +     writeb(0xFF, priv->base + WDTRR);
> > +
> > +     /*
> > +      * Refreshing the down-counter requires up to 4 cycles
> > +      * of the signal for counting
> > +      */
> > +     delay =3D 4 * rzv2h_wdt_get_cycle_usec(priv, priv->oscclk_rate, 0=
);
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
> > +     /* LSI needs RSTIRQS to be cleared */
> > +     writeb(readb(priv->base + WDTRCR) & ~WDTRCR_RSTIRQS, priv->base +=
 WDTRCR);
> > +}
> > +
> > +static int rzv2h_wdt_start(struct watchdog_device *wdev)
> > +{
> > +     pm_runtime_get_sync(wdev->parent);
>
> You may consider using pm_runtime_resume_and_get() which takes care of
> failures from __pm_runtime_resume(), if any.
>
OK.

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
> > +     return 0;
> > +}
> > +
> > +static int rzv2h_wdt_stop(struct watchdog_device *wdev)
> > +{
> > +     struct rzv2h_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> > +
> > +     pm_runtime_put(wdev->parent);
> > +     reset_control_reset(priv->rstc);
> > +
> > +     return 0;
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
> > +     rzv2h_wdt_stop(wdev);
>
> Calling pm_runtime_put() though this function may lead to unbalanced
> runtime PM counter if the device is not used at this moment. I may be wro=
ng
> though, I'm just reading the code, anyway (see below).
>
Agreed, I have added a check now to call stop only if WDT is active.

> > +
> > +     pm_runtime_get_sync(wdev->parent);
>
> If compiled with LOCKDEP this should trigger an invalid wait context
> (see commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
> context'") and maybe [2] for a possible fix (if it's considered ok).
>
I finally managed to replicate the issue and now replaced it with the
clk_enable() api to turn ON the clocks.

Cheers,
Prabhakar

