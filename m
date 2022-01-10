Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235674896D2
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jan 2022 11:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244317AbiAJK5i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jan 2022 05:57:38 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:42945 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244301AbiAJK5h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jan 2022 05:57:37 -0500
Received: by mail-ua1-f50.google.com with SMTP id p1so22591192uap.9;
        Mon, 10 Jan 2022 02:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyoGsoFBBq9ImALPMX/uND5ztYbxYfQJAbF4lcqlrQM=;
        b=d8qkdWz5n/cVJru5BxY+zQ1sKKKBVEJneHDRF6l99XOQIFsZFSGunDzskmEvzyCaAW
         MNVREWYpFN1RrZ8gvn89/4jff9dpsihS8cvP9kXZREFZ/ydjsPLsR+kl0PqQ62O5ClR/
         MGbkEHvHy01JIDiWKOD2W/Dbvbu+9meu5T9+K+gJxBn9Qhe3g6ZcytJ+9MgDt6nNwCd8
         EtjmdI1AZIADVtes1ZcrOYcw6tl6jAs4IEEPbkNfPrThSAPqiAL8Y6q5w7ejMb5Fotfn
         dG4Xz907gVgR1yfXGdtsPefKoByZztH8WkUjOhl6hD+3dN6d2+IaJw/qRKUOEtd6UTbZ
         Sx8A==
X-Gm-Message-State: AOAM533eKO/tuMvtNXQqr6dP4VPac1FNww8avlhpqGwJv7E+GtujMVX9
        NmwwKpfBxd0ZKG2oq/qTBLcK1uqho8V+mg==
X-Google-Smtp-Source: ABdhPJzZzd7FA+nM9kwVvOVEqObh+5KmQTt3ZRzWBMMa1IKvZ5b7ld2uDSjQXnJ7FDNk9t0u/FQ8QQ==
X-Received: by 2002:a67:f497:: with SMTP id o23mr1403309vsn.70.1641812256525;
        Mon, 10 Jan 2022 02:57:36 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id j129sm2565698vkh.16.2022.01.10.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 02:57:36 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id n12so220676vkc.12;
        Mon, 10 Jan 2022 02:57:36 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr85598vkb.33.1641812255898;
 Mon, 10 Jan 2022 02:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
 <20220104181249.3174-2-biju.das.jz@bp.renesas.com> <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
 <OS0PR01MB5922F9FAC00C07568D399F6C86509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F9FAC00C07568D399F6C86509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 11:57:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViRF+zNyOTRTu0qAgDG1gSG-VsXXT+SLyJZ7bBHb1Yvg@mail.gmail.com>
Message-ID: <CAMuHMdViRF+zNyOTRTu0qAgDG1gSG-VsXXT+SLyJZ7bBHb1Yvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Mon, Jan 10, 2022 at 11:51 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT
> > reset
> > On Tue, Jan 4, 2022 at 7:12 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > This patch uses the force reset(WDTRSTB) for triggering WDT reset for
> > > restart callback. This method is faster compared to the overflow
> > > method for triggering watchdog reset.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/watchdog/rzg2l_wdt.c
> > > +++ b/drivers/watchdog/rzg2l_wdt.c

> > >  #define WDT_DEFAULT_TIMEOUT            60U
> > >
> > > @@ -116,15 +119,11 @@ static int rzg2l_wdt_restart(struct
> > > watchdog_device *wdev,  {
> > >         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> > >
> > > -       /* Reset the module before we modify any register */
> > > -       reset_control_reset(priv->rstc);
> > > -       pm_runtime_get_sync(wdev->parent);
> >
> > Why are these no longer needed? Because .probe() takes care of that?
>
> This code is added to modify WDTSET register.
> Once watchdog is started, On the fly, we won't be able to
> update WDTSET register. By resetting(assert/deassert) the module
> we can update the WDTSET register. It takes 34 millisec to trigger reset.
>
> But with PEEN_FORCE, on the fly we can update register and it immediately triggers reset.
>
> Then why do .start() and .stop() have
> > reset and Runtime PM handling, too?
>
> .start-> turns on the Clocks using Runtime PM.
>
> We cannot Update WDTSET/WDTEN registers, once watchdog is started.
> Adding reset and Runtime PM handling in .stop, allows to stop the watchdog.
>
> .stop-> turns off the clock using Runtime PM and does the reset(assert/deassert) of the module
>         in order to modify WDTSET/WDTEN registers after stop operation.
>
> May be I should keep pm_runtime_get_sync(wdev->parent) in restart callback,
> To turn on the clocks, If someone calls stop followed by restart

I'm still confused: .probe() turns the clock on through Runtime PM,
so it's always running.  Calling .start() merely increases the usage
count, and a subsequent .stop() will decrease it again.  But the
clock keeps on running? What am I missing?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
