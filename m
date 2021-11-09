Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3BD44A81A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 09:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243831AbhKIIHB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:07:01 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:37861 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236699AbhKIIHA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:07:00 -0500
Received: by mail-ua1-f54.google.com with SMTP id l43so36881739uad.4;
        Tue, 09 Nov 2021 00:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/VUCaCbmYd5eG70UdhdrMxO7JHAC6pRXvIV7ydAWZU=;
        b=0m7ewwO+GqJyy5mqEkYJn5MBdqiyo5lbfwOzhyiyMmz0VGkk/njAkEw1gy0Loi1QWL
         nkLrqOutCo3TkVaylqYN9AOFqvXnHihlFwpdEQT9RNtE4CBxTxaFJwTG1X7jiVuHsQo1
         sfU7+chX/bgqe02IDTDqmKH4qg2/XYTkxWkoN4c5bRRg6IFz/IbxegRVe/Ux5U0+rDOu
         zkvZxVQKTRqQPPIIPBZyUbWGsnvn7OHqpuFbJoXjuOcpZcEE+kB3PBsiYc+6WIUsVIrY
         tFMkWn+F5F/M2hTZ5n+djZ+j/Il3IFFhiTIlb1hVbpmGD3wmhLlhurCcgSI8GzBN/k++
         FK9w==
X-Gm-Message-State: AOAM532VTH8/WuVPfuHSent7Hj2Z+spfvVjMrwCxfOC5DP6O4ZUN//+E
        KS3gUvIIrEsaOhXgrnarsu6dz86Zr8N/R3BF
X-Google-Smtp-Source: ABdhPJxc0U6Ei3cRX1pDvSeiFD+yrZCjYwFO4Xp8VMPIC5P39phwdRECalg2PBAFTzwNuLe3kArfpA==
X-Received: by 2002:a67:ca10:: with SMTP id z16mr8395328vsk.52.1636445054417;
        Tue, 09 Nov 2021 00:04:14 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 128sm692566vsx.19.2021.11.09.00.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:04:13 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id az37so36894971uab.13;
        Tue, 09 Nov 2021 00:04:13 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr84277679vsu.35.1636445053306;
 Tue, 09 Nov 2021 00:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
 <20211104160858.15550-5-biju.das.jz@bp.renesas.com> <70ba0c57-aca5-4822-631b-1eb7e7b9b3a2@roeck-us.net>
In-Reply-To: <70ba0c57-aca5-4822-631b-1eb7e7b9b3a2@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:04:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrqkowJnQAT2DvcJx6jsEoMcrEUN6k=NNcqoxc8-aKFw@mail.gmail.com>
Message-ID: <CAMuHMdXrqkowJnQAT2DvcJx6jsEoMcrEUN6k=NNcqoxc8-aKFw@mail.gmail.com>
Subject: Re: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
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

On Mon, Nov 8, 2021 at 7:38 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 11/4/21 9:08 AM, Biju Das wrote:
> > Add Watchdog Timer driver for RZ/G2L SoC.
> >
> > WDT IP block supports normal watchdog timer function and reset
> > request function due to CPU parity error.
> >
> > This driver currently supports normal watchdog timer function
> > and later will add support for reset request function due to
> > CPU parity error.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- /dev/null
> > +++ b/drivers/watchdog/rzg2l_wdt.c

> > +struct rzg2l_wdt_priv {
> > +     void __iomem *base;
> > +     struct watchdog_device wdev;
> > +     struct reset_control *rstc;
> > +     unsigned long osc_clk_rate;
> > +     unsigned long pclk_rate;
>
> pclk_rate is only used in the probe function and thus not needed here.

Indeed...

> > +static int rzg2l_wdt_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct rzg2l_wdt_priv *priv;
> > +     struct clk *wdt_clk;
> > +     int ret;
> > +
> > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->base))
> > +             return PTR_ERR(priv->base);
> > +
> > +     /* Get watchdog main clock */
> > +     wdt_clk = devm_clk_get(&pdev->dev, "oscclk");
> > +     if (IS_ERR(wdt_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no oscclk");
> > +
> > +     priv->osc_clk_rate = clk_get_rate(wdt_clk);
> > +     if (!priv->osc_clk_rate)
> > +             return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> > +
> > +     /* Get Peripheral clock */
> > +     wdt_clk = devm_clk_get(&pdev->dev, "pclk");
> > +     if (IS_ERR(wdt_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> > +
> > +     priv->pclk_rate = clk_get_rate(wdt_clk);
> > +     if (!priv->pclk_rate)
> > +             return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");

... and this can't really happen, can it?

So you don't need to get pclk at all.  It will be controlled through
Runtime PM anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
