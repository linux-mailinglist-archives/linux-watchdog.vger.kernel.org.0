Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF1B4630BD
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Nov 2021 11:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240746AbhK3KNi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Nov 2021 05:13:38 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:38860 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbhK3KNi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Nov 2021 05:13:38 -0500
Received: by mail-ua1-f43.google.com with SMTP id w23so40205030uao.5;
        Tue, 30 Nov 2021 02:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCjDDNwhJun6MwwZpGvEQyBJ1git34Vqcy1BJCk/owM=;
        b=caIFIK7DNkfGER4/IXbeMmwRZdib1iJlWrGGofwsq6Rq14ZUC7zlJyfucgW6IJeG0d
         eT36ECe9NJ/Iuy5q8V7wZJg017147zOYO1Sb69qYCC3rziPa+66iIxlyKK8oWKAHMc66
         7bF4Fp+u4z4dw0nQS2IiFy74uD0YEzO8QdlK7SdZXuvhBUxbccJZ0JC3S7ew0vtsLzbi
         EXD+M2yWuxHx33/7qDCHSzM320LT6NO9H3b5PRiZBzfsst5G9XbSdv/8KMPYiTZAE7Pk
         4cXzhljEwWTbtsHm7qQ985w4vlGsq+aNNiOmm099W/qVzpMyAAiDyTrjld2TB1Af+93S
         dq1w==
X-Gm-Message-State: AOAM5303YjzFg7Y7N+yeox/nBJ3fc1WEBBgbo/QXm1evG0utFuIU9579
        7fyi/wwmozS3Rbo219CWNlhSf0xdJbR2zg==
X-Google-Smtp-Source: ABdhPJzjTqucqd0xUDFAKztP0gRizUM2dezf1M4ZqNbb7P2aXHf8NRD67niWKv+MJnoI/XfT1a3ksQ==
X-Received: by 2002:a05:6102:38b:: with SMTP id m11mr38947011vsq.36.1638267019064;
        Tue, 30 Nov 2021 02:10:19 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id u20sm9735203vke.0.2021.11.30.02.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 02:10:18 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id j14so40101144uan.10;
        Tue, 30 Nov 2021 02:10:18 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr55509931uar.14.1638267017324;
 Tue, 30 Nov 2021 02:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
 <20211122113554.15990-3-biju.das.jz@bp.renesas.com> <1c369614-0a8d-dfea-d9b6-2d299b2b60c8@roeck-us.net>
 <OS0PR01MB5922FA2BBB2FBC235E3E8AC286679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922FA2BBB2FBC235E3E8AC286679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Nov 2021 11:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeOWoD8NYZc+qPPF39eqXC6gyLVuEbVfAfTkm8mLo+1A@mail.gmail.com>
Message-ID: <CAMuHMdUeOWoD8NYZc+qPPF39eqXC6gyLVuEbVfAfTkm8mLo+1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Tue, Nov 30, 2021 at 10:59 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
> > On 11/22/21 3:35 AM, Biju Das wrote:
> > > Add Watchdog Timer driver for RZ/G2L SoC.
> > >
> > > WDT IP block supports normal watchdog timer function and reset request
> > > function due to CPU parity error.
> > >
> > > This driver currently supports normal watchdog timer function and
> > > later will add support for reset request function due to CPU parity
> > > error.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> > > --- /dev/null
> > > +++ b/drivers/watchdog/rzg2l_wdt.c
> > > @@ -0,0 +1,255 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Renesas RZ/G2L WDT Watchdog Driver
> > > + *
> > > + * Copyright (C) 2021 Renesas Electronics Corporation  */ #include
> > > +<linux/bitops.h> #include <linux/clk.h> #include <linux/delay.h>
> > > +#include <linux/io.h> #include <linux/kernel.h> #include
> > > +<linux/module.h> #include <linux/of.h> #include
> > > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > > +<linux/reset.h> #include <linux/watchdog.h>
> > > +
> > > +#define WDTCNT             0x00
> > > +#define WDTSET             0x04
> > > +#define WDTTIM             0x08
> > > +#define WDTINT             0x0C
> > > +#define WDTCNT_WDTEN       BIT(0)
> > > +#define WDTINT_INTDISP     BIT(0)
> > > +
> > > +#define WDT_DEFAULT_TIMEOUT                60U
> > > +
> > > +/* Setting period time register only 12 bit set in WDTSET[31:20] */
> > > +#define WDTSET_COUNTER_MASK                (0xFFF00000)
> > > +#define WDTSET_COUNTER_VAL(f)              ((f) << 20)
> > > +
> > > +#define F2CYCLE_NSEC(f)                    (1000000000 / (f))
> > > +#define WDT_CYCLE_MSEC(f, wdttime) ((1024 * 1024 * (((u64)wdttime)
> > + 1)) / \
> > > +                                    ((f) / 1000000))
> >
> > This macro generates a 64 bit divide operation - as noticed by 0-day - and
> > will have to be rewritten.
> >
>
> OK, will rewrite like below to make the ARCH=m68k compiler happy
>
> -#define F2CYCLE_NSEC(f)                        (1000000000 / (f))
> -#define WDT_CYCLE_MSEC(f, wdttime)     ((1024 * 1024 * (((u64)wdttime) + 1)) / \
> -                                        ((f) / 1000000))
> +#define F2CYCLE_NSEC(f)                (1000000000 / (f))
> +#define WDT_CYCLE_MSEC_CONST           (1024 * 1024 * (u64)1000000)

1000000ULL (casts are evil ;-)

>
> +static u32 rzg2l_wdt_get_cycle_msec(u32 cycle, u32 wdttime)

cycle == priv->osc_clk_rate, i.e. unsigned long?

> +{
> +       /* timer_cycle = clk_cycle *1024 *1024 * (WDTTIME + 1) */

Comment not needed if you get rid of WDT_CYCLE_MSEC_CONST?

> +       u64 timer_cycle_ms = WDT_CYCLE_MSEC_CONST * (wdttime + 1);
> +       do_div(timer_cycle_ms, cycle);

div64_ul()?

> +
> +       return timer_cycle_ms;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
