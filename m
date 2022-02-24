Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211964C2897
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbiBXJyx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiBXJyx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:54:53 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CEC285714;
        Thu, 24 Feb 2022 01:54:23 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id d11so1519652vsm.5;
        Thu, 24 Feb 2022 01:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mru2FE10dG9bV1APdfhAjWIDvBCNgLJ0fPdX2ljWRrE=;
        b=V+SstRrua7FzOSQknPoTRfFSvN0CZMlQ6aGG8oiGAnT66V5D20Et/SFtUGO7dWIAMl
         9eUECQeMB49HX5QcWbXAKXhlv/N1CSUffVeqeOUXkHW3M2My2kvrtmQJ0CNXgA/4zraP
         pvq9uJKVonUEvTg7QO8SBYv5IqpAklUc7uDoIshWIFitgORJrjwPvZpTOJdXR1RAMY6Y
         AvV8ROlX89aTqErjDB/8hxudt22c1HIg2ID8u88lIW632MLdsX0TlCsiTFY2/1OV+baw
         DWMlpym9QWypFF7+zQBaQ+m85H0BwY2IvpurrZJoQT1LSC70XAxiE7iDbEytW6JMWcgx
         umkw==
X-Gm-Message-State: AOAM533NzcUPalVwTq/JrxWq0gsQvNFiMEpNEqiO4jLTsjd5IEbcIduo
        ucLaNTgc5CsJa1buTWrOuAvTDf+JphfaiA==
X-Google-Smtp-Source: ABdhPJxp+/EtFCEM6t/8uS+W1cBw5Zsul6JU+TbBHLfhbSBp0kqhBSxLWtTcojoPOpx5B6mblgeleg==
X-Received: by 2002:a67:5e87:0:b0:30d:14c1:719 with SMTP id s129-20020a675e87000000b0030d14c10719mr646776vsb.37.1645696462954;
        Thu, 24 Feb 2022 01:54:22 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id u16sm297298vsi.2.2022.02.24.01.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:54:22 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id l10so862517vki.9;
        Thu, 24 Feb 2022 01:54:22 -0800 (PST)
X-Received: by 2002:a05:6122:8ca:b0:332:64b4:8109 with SMTP id
 10-20020a05612208ca00b0033264b48109mr689512vkg.7.1645696462346; Thu, 24 Feb
 2022 01:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
 <20220223160100.23543-6-biju.das.jz@bp.renesas.com> <CAMuHMdXnLOVSi62_kiZBr2Fze_jr2wNxLfz3ZC8SXU1ei3yecw@mail.gmail.com>
 <OS0PR01MB5922F825BB8E04A3C5F75300863D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F825BB8E04A3C5F75300863D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:54:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+D+Vb3vy-vaNUcZaco2=2Sb3Bna+=UoiRENgz1__1Vg@mail.gmail.com>
Message-ID: <CAMuHMdU+D+Vb3vy-vaNUcZaco2=2Sb3Bna+=UoiRENgz1__1Vg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Thu, Feb 24, 2022 at 10:51 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT
> > reset
> > On Wed, Feb 23, 2022 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > This patch uses the force reset(WDTRSTB) for triggering WDT reset for
> > > restart callback. This method(ie, Generate Reset (WDTRSTB) Signal on
> > > parity error)is faster compared to the overflow method for triggering
> > > watchdog reset.
> > >
> > > Overflow method:
> > >         reboot: Restarting system
> > >         Reboot failed -- System halted
> > >         NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
> > >
> > > Parity error method:
> > >         reboot: Restarting system
> > >         NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/watchdog/rzg2l_wdt.c
> > > +++ b/drivers/watchdog/rzg2l_wdt.c
> >
> > > @@ -117,17 +120,14 @@ static int rzg2l_wdt_restart(struct
> > > watchdog_device *wdev,  {
> > >         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > >
> > > -       /* Reset the module before we modify any register */
> > > -       reset_control_reset(priv->rstc);
> > > -
> >
> > I think this part belongs in patch 4/6.
>
> For Overflow method we need to reset the module, so that we can
> update WDTSET register to change the timeout value from 60sec to 43.69 msec,
> so that reboot can occur after 43.69 msec which corresponds to counter value of 1.
>
> Where as on parity error case, Generating parity error
> immediately trigger the reboot. Here we don't need to reset the module,
> for Generating parity error, that is the reason it got removed in this patch.

Right, so please ignore my comment.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
