Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65FF44A85A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 09:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244068AbhKIId1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:33:27 -0500
Received: from mail-vk1-f174.google.com ([209.85.221.174]:33718 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhKIId0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:33:26 -0500
Received: by mail-vk1-f174.google.com with SMTP id d130so9622088vke.0;
        Tue, 09 Nov 2021 00:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGstnhGZbRY0Qd8//rKyVCZDyuB1qDxTjF/eZkOvFlU=;
        b=H0Upa6jU4LDLBG1zP0XUZO7vMowA3FOAW++BBkVon2LoDWSegz4g8ox3L5UPVKgscy
         j5IN9wwM3Wec2IxV66dBek177UI0BMo36hG4ItnqYBMbnTz8S6u9gyIQgKTW3tqWKcmr
         w87llQX4KJt9qO8XcXjww5cw9W3bjcm5CchWG4b6dlCUZNkJDqeRwQdjtPcMgH9oKaFd
         JFaB4EBPSTXldrKHlVfHDZkzhSwDaIXXCnKK7miuxWCpLD1YCf/8l4DlxUa6AAn+0Xvc
         hqYWDRKCe3eVoMARuAynsOqVQn4idt5EZQqUOSnP1PyGMW3RyDaiucBAJVYZZp5qqkBu
         vvIQ==
X-Gm-Message-State: AOAM530QotiJAHqja77y6IFOmZwRUBvC7gWPfETJQKEDz0r06+Z25+Pa
        yjPRuaUsczdl9ujYNgu07K+m2KBWkLsEu3SS
X-Google-Smtp-Source: ABdhPJz3uA//hLkDB1L1TCC+Y689SiR00uwWOCHBsVUHmdIGEHW5mDV8iyUTrcTpoGsIgeIKd8wwsQ==
X-Received: by 2002:a05:6122:ca7:: with SMTP id ba39mr8457930vkb.25.1636446640710;
        Tue, 09 Nov 2021 00:30:40 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id f188sm48432vsc.16.2021.11.09.00.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:30:40 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id s13so21466615uaj.11;
        Tue, 09 Nov 2021 00:30:39 -0800 (PST)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr7912090uam.14.1636446639734;
 Tue, 09 Nov 2021 00:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
 <20211104160858.15550-5-biju.das.jz@bp.renesas.com> <70ba0c57-aca5-4822-631b-1eb7e7b9b3a2@roeck-us.net>
 <CAMuHMdXrqkowJnQAT2DvcJx6jsEoMcrEUN6k=NNcqoxc8-aKFw@mail.gmail.com> <OS0PR01MB59222E6080E92731DD66A03586929@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59222E6080E92731DD66A03586929@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:30:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnyTPB2bo5PS=A4iwUfLivJa=KC7u7urWb0jDvpnuc+g@mail.gmail.com>
Message-ID: <CAMuHMdXnyTPB2bo5PS=A4iwUfLivJa=KC7u7urWb0jDvpnuc+g@mail.gmail.com>
Subject: Re: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Tue, Nov 9, 2021 at 9:22 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
> > On Mon, Nov 8, 2021 at 7:38 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 11/4/21 9:08 AM, Biju Das wrote:
> > > > Add Watchdog Timer driver for RZ/G2L SoC.
> > > >
> > > > WDT IP block supports normal watchdog timer function and reset
> > > > request function due to CPU parity error.
> > > >
> > > > This driver currently supports normal watchdog timer function and
> > > > later will add support for reset request function due to CPU parity
> > > > error.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > > --- /dev/null
> > > > +++ b/drivers/watchdog/rzg2l_wdt.c
> >
> > > > +struct rzg2l_wdt_priv {
> > > > +     void __iomem *base;
> > > > +     struct watchdog_device wdev;
> > > > +     struct reset_control *rstc;
> > > > +     unsigned long osc_clk_rate;
> > > > +     unsigned long pclk_rate;
> > >
> > > pclk_rate is only used in the probe function and thus not needed here.
> >
> > Indeed...
> OK.
> >
> > > > +static int rzg2l_wdt_probe(struct platform_device *pdev) {
> > > > +     struct device *dev = &pdev->dev;
> > > > +     struct rzg2l_wdt_priv *priv;
> > > > +     struct clk *wdt_clk;
> > > > +     int ret;
> > > > +
> > > > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     priv->base = devm_platform_ioremap_resource(pdev, 0);
> > > > +     if (IS_ERR(priv->base))
> > > > +             return PTR_ERR(priv->base);
> > > > +
> > > > +     /* Get watchdog main clock */
> > > > +     wdt_clk = devm_clk_get(&pdev->dev, "oscclk");
> > > > +     if (IS_ERR(wdt_clk))
> > > > +             return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no
> > > > + oscclk");
> > > > +
> > > > +     priv->osc_clk_rate = clk_get_rate(wdt_clk);
> > > > +     if (!priv->osc_clk_rate)
> > > > +             return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate
> > > > + is 0");
> > > > +
> > > > +     /* Get Peripheral clock */
> > > > +     wdt_clk = devm_clk_get(&pdev->dev, "pclk");
> > > > +     if (IS_ERR(wdt_clk))
> > > > +             return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no
> > > > + pclk");
> > > > +
> > > > +     priv->pclk_rate = clk_get_rate(wdt_clk);
> > > > +     if (!priv->pclk_rate)
> > > > +             return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate
> > > > + is 0");
> >
> > ... and this can't really happen, can it?
>
> But I need pclk frequency  for delay calculation. That is the reason I am doing a get. Probably after
> Getting the rate, I should do a "put". So that Run time PM will be in full control for the clocks.
> Same for oscillator clk. Is it ok?

Oops, I missed that.  Please ignore my comment, I'll grab a coffee
soon ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
