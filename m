Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F5732E2A
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Jun 2019 13:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfFCLFB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Jun 2019 07:05:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35059 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfFCLFA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Jun 2019 07:05:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so15783186ljb.2;
        Mon, 03 Jun 2019 04:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XY6x7wElLRELybiA3dUH5o7XF7+hg1cYM1kQQXOPTY4=;
        b=COqUzarSEq1RhN9seOB3dX/9L0ztEBKVhJvu2+7yffuKbMtrZBYVt1j+oHwOs+YyNW
         3CAyQQb1/1MswAgx1UqTXtTZ/sUaWZvjm/jaf7qcobtSfGaSgBaTctUg2T4qNIsZZWxu
         b41erdyZQbNf2nU6hEpmvF4clX3D5C33lYf9LeOWV0MidFp+rLp6gvdJaxjqmCEGfxTe
         GoofNlBEqzY2ZFWq7X1i5j5Ap2rR3eczGt8j23ZMNvwvc2OSWTAQbkoUyS5XORi4AtHr
         17qcX2skIiYqtcF9T8ptaFJlxkiLisFvAor0QG1hHkVT0hoh1lt3hOgWN2DUmwe3pkFM
         CKdg==
X-Gm-Message-State: APjAAAWk9YvLsaajENWuXL5kWFA5+GesyJQ9AVr7g84xNKdWWZfZfgqt
        CIVFqPEvTaYZ+8KtQ5utAXWttmKyx+JkT8ubyS0=
X-Google-Smtp-Source: APXvYqyzlbaH1PKUCSmcRzjG8rU1vnEs776p+VDoY6vOfBv/IKZXqSMgp/aOJjqZWZ/9rcY84ieuvr0s0k1IPeL7qOU=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr13207945ljc.135.1559559898548;
 Mon, 03 Jun 2019 04:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <1559553957-5764-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWGBr+kwY18o657J_SCTONSJLZMUs2qMBvBU84p-UNfYA@mail.gmail.com> <OSAPR01MB3089AE3893A8DA4D77F34413D8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB3089AE3893A8DA4D77F34413D8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Jun 2019 13:04:46 +0200
Message-ID: <CAMuHMdUKugUiqAi=o14BTG5Tihq_H04DOs0ixkGEHxc7vo9uCQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 3, 2019 at 12:28 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Monday, June 3, 2019 6:59 PM
> > On Mon, Jun 3, 2019 at 11:31 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > According to the hardware manual of R-Car Gen2 and Gen3,
> > > software should wait a few RLCK cycles as following:
> > >  - Delay 2 cycles before setting watchdog counter.
> > >  - Delay 3 cycles before disabling module clock.
> > >
> > > So, this patch adds such delays.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
>
> Thank you for your review!
>
> > > --- a/drivers/watchdog/renesas_wdt.c
> > > +++ b/drivers/watchdog/renesas_wdt.c
> >
> > > @@ -70,6 +71,16 @@ static int rwdt_init_timeout(struct watchdog_device *wdev)
> > >         return 0;
> > >  }
> > >
> > > +static void rwdt_wait(struct rwdt_priv *priv, unsigned long cycles)
> >
> > "unsigned int" should be sufficiently large.
>
> I got it.
>
> > > +{
> > > +       unsigned long periods, delays;
> > > +
> > > +       periods = DIV_ROUND_UP(priv->clk_rate, cycles);
> >
> > Shouldn't the above be a division with rounding down (i.e. a plain C
> > division), instead of a division with rounding up?
>
> I have no idea which is the correct way (rounding down vs rounding up here).
> At least, I tried to use rounding down before submitting patch and then
> the result seemed the same. So, I submitted this patch with rounding up
> (because the next step also used rounding up...).

If you round up periods, it will decrease the delay, which may become
too small.
If you round up delays, it will increase the delay, which doesn't hurt.

> > > +       delays = DIV_ROUND_UP(1000000UL, periods);
> >
> > Given cycles is always a small number, accuracy can be improved, and one
> > division can be avoided, by calculation this as:
> >
> >     delays = DIV_ROUND_UP(cycles * 1000000 /  priv->clk_rate);
>
> Thank you for your suggest! I think so.
> It should be "s/ \//,/" like below though :)

>         delays = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);

Oops, indeed. Sorry for that silly mistake.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
