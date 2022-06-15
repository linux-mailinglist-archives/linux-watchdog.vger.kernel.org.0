Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF5954CB9D
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jun 2022 16:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346340AbiFOOoI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jun 2022 10:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349512AbiFOOnd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jun 2022 10:43:33 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D829A33A09;
        Wed, 15 Jun 2022 07:43:31 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id g15so7478330qke.4;
        Wed, 15 Jun 2022 07:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QZpSdk1nDBhJenw4xCw1aDDsykpwxeKRuaT0/mDHxTw=;
        b=mNBFPJBD2ZJHPUh++vPW9yBQYcEwamli0Z+x8agxCpqQljJKbulv1Uqp/5ei8emLYR
         FO6X06Hjr7e+my8stwk2AF11f9zcMEC3vTpSimAzKjmXb1GsaIINKZZ6RuCWj8v5xAzM
         UX4qrfoJYRLq6U522OcjRnRoQ0m1D51Ec79byw6QbUu0FnTlwq2k6L2fBqNd7PrM9hFv
         V7qdXR6NhzyvBTXuSA1ZwITLSbBGOTxnFsxLrY6+AqFLVHkbc65urV0S/1RlwQoAOvGH
         eM3q7VYUxhXdTU/zbXnXr1rmGUlxs35lTo+a0dflbf3RIRyfW0q5zMSqLICKUf3+cMOg
         lOvg==
X-Gm-Message-State: AJIora/DP/bGj52Hw5Zu17YG2xmFfYoJSqKYUXfwcGQxERFMGb7aF/mx
        TG8rOT3I6SMMJo6fT7lfIJQ9ItHScabbYA==
X-Google-Smtp-Source: AGRyM1vK5LD56di92URfoUExqwteW89wodI5r8qCgdTGDH7KyyEqxsBkUboOofqzcPg7SPf+3HCErg==
X-Received: by 2002:a37:e216:0:b0:6a6:fd52:19de with SMTP id g22-20020a37e216000000b006a6fd5219demr8193qki.102.1655304210840;
        Wed, 15 Jun 2022 07:43:30 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id q18-20020a05622a04d200b002f906fc8530sm10167242qtx.46.2022.06.15.07.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 07:43:30 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-31336535373so63687347b3.2;
        Wed, 15 Jun 2022 07:43:30 -0700 (PDT)
X-Received: by 2002:a0d:e657:0:b0:314:7e4d:30a9 with SMTP id
 p84-20020a0de657000000b003147e4d30a9mr7826637ywe.316.1655304210200; Wed, 15
 Jun 2022 07:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220613150550.70334-1-phil.edworthy@renesas.com>
 <20220613150550.70334-3-phil.edworthy@renesas.com> <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
 <TYYPR01MB7086A4D1B42A213937EB6229F5AD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086A4D1B42A213937EB6229F5AD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 16:43:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLz5=0XfBQcQnVTkkhCxYJ-fQz0qu-cTAgs=G5jbJrpQ@mail.gmail.com>
Message-ID: <CAMuHMdXLz5=0XfBQcQnVTkkhCxYJ-fQz0qu-cTAgs=G5jbJrpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Phil,

On Wed, Jun 15, 2022 at 4:32 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 15 June 2022 10:41 Phil Edworthy wrote:
> > On Mon, Jun 13, 2022 at 5:06 PM Phil Edworthy wrote:
> > > The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> > > the parity error registers. This means the driver has to reset the
> > > hardware plus set the minimum timeout in order to do a restart and has
> > > a single interrupt.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/watchdog/rzg2l_wdt.c
> > > +++ b/drivers/watchdog/rzg2l_wdt.c
> >
> > > @@ -139,14 +146,25 @@ static int rzg2l_wdt_restart(struct
> > watchdog_device *wdev,
> > >  {
> > >         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > >
> > > -       clk_prepare_enable(priv->pclk);
> > > -       clk_prepare_enable(priv->osc_clk);
> > > +       if (priv->devtype == I2C_RZG2L) {
> > > +               clk_prepare_enable(priv->pclk);
> > > +               clk_prepare_enable(priv->osc_clk);
> > >
> > > -       /* Generate Reset (WDTRSTB) Signal on parity error */
> > > -       rzg2l_wdt_write(priv, 0, PECR);
> > > +               /* Generate Reset (WDTRSTB) Signal on parity error */
> > > +               rzg2l_wdt_write(priv, 0, PECR);
> > >
> > > -       /* Force parity error */
> > > -       rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> > > +               /* Force parity error */
> > > +               rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> > > +       } else {
> > > +               /* RZ/V2M doesn't have parity error registers */
> > > +
> > > +               wdev->timeout = 0;
> > > +               rzg2l_wdt_start(wdev);
> >
> > This will call pm_runtime_get_sync(), which is not allowed in this
> > context, cfr. commit e4cf89596c1f1e33 ("watchdog: rzg2l_wdt: Fix
> > 'BUG: Invalid wait context'").
> Ok, I see. I haven't been able to trigger that bug on rz/v2m. I'm
> Not sure what I can't trigger it though.
>
> > While you can call clk_prepare_enable() instead, that can only be
> > used as a temporary workaround, until you have implemented RZ/V2M
> > power domain support...
> Sorry, my knowledge of power domain is somewhat lacking...
>
> I followed the code into rpm_resume() and see from that commit msg
> that the problem arises in rpm_callback().
> Looking at the code is appears that if power domain doesn’t set any
> callbacks it's considered a success and so won’t call rpm_callback().
>
> Is that why power domain support will allow the driver to call
> pm_runtime_get_sync() without issue?

Not really.

You cannot call pm_runtime_get_sync() from a restart notifier.
Hence the RZ/G2L restart code works around that by enabling the
clocks manually, which works as the PM Domain on RZ/G2L is only a
clock domain.

However, unlike RZ/G2L, RV/V2M also has power areas[1].  Currently
Linux does not support the RZ/V2M power areas yet, so you can use
the same workaround as on RZ/G2L, i.e. enable the clocks manually.
When support for RZ/V2M power areas will be added, you will have
a problem, as you cannot enable power areas manually, only through
pm_runtime_get_sync().

Does RZ/V2M support alternative ways to reboot, e.g. PSCI reboot?

[1] Section 51, Internal Power Domain Controller (PMC).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
