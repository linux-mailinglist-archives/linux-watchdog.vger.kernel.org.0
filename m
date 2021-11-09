Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B438A44A803
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 08:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243874AbhKIICC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241329AbhKIICA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:02:00 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21A7C061764;
        Mon,  8 Nov 2021 23:59:14 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id 14so3827796ioe.2;
        Mon, 08 Nov 2021 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3dqwTZmCriG4FBtW0Dj6eQjJQwrJD1vpEOEBYRc03hQ=;
        b=l9t7XJJQyuTms6XdlpuI3CXb8lhtPGmNo/2GOP86zR7v4reD/UwlbevzwkwWBwslGK
         bbV2kQLqFrYUtkx320JM3asdIJ07W18N4Cj61nW/nWorcAOzxve9FLTDVIFWlpzvxU7b
         MVGECHR1bMn1jkUed9sKZOL7pUd8+IN6OoIKpU7jtp8tmL8gnj8P/Z6tIAEaXE34llry
         xsSczdQovB0c4fgPSg0/oXF4DS03Kxpx8EclpIiWiUzoJlluZpMcPBdVnK7wvtdo9aN5
         zrH0a5W0irYJcsBYRJ5TQx1Feghzzsr6YINpcw9Sphn+m9uDgSwC7GApDg6iFPXi+XBa
         ZHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3dqwTZmCriG4FBtW0Dj6eQjJQwrJD1vpEOEBYRc03hQ=;
        b=WIZno3+/CiE68EJgfZUULRzMXUgTNotGQcf4xBlgcOlXD7VY9E8KIedgRyDPgKgLLj
         VDO5tl+qD22pBfn4Dt/C6KlTyrkwoPn/LnEbZuwAlZbxAmmTfZ0hHrYUQXwXE16AXRJT
         wysD/1xDTSQp1mvQbFkjR8/+A6jZZvU1a2L+aEMY3QEvBXhyIRopCDdPwTTjw/NVXIFn
         F2iQlcmNZVFJrZiS3l2R/PhqDWL9zwZVp8y/MjSywlTMtHRxCK+01ngWrMxfEl5R5YV2
         BlafebIR0VYSMXbaY74w40hHIpevgHEvCXBDKXvsENbQ3byKFUbxGpbt24O+gfnWYWPZ
         CAMw==
X-Gm-Message-State: AOAM531BWduoFJWX09yJ2XX+sEf3cmMLqEyUAFsftaNhU6tUikttHnd3
        iGLV74/9cdMUJOFbZZRNTP9TP2Mr9Tf0ugIY/VY=
X-Google-Smtp-Source: ABdhPJxbSrFiGYk9Uu30K4T24GGtAKXGSf5L5IRpY6dpQETbJb4emTri0zTlJHUZIvH4Fvf4igTuMFeD3YvFAoHMvCg=
X-Received: by 2002:a6b:b886:: with SMTP id i128mr3746017iof.151.1636444754272;
 Mon, 08 Nov 2021 23:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com> <20210730041355.2810397-2-art@khadas.com>
 <20210730044538.GA2110311@roeck-us.net>
In-Reply-To: <20210730044538.GA2110311@roeck-us.net>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Tue, 9 Nov 2021 15:59:03 +0800
Message-ID: <CAKaHn9L5h98XgndA+xBP2MUrRevVM7pRPJN6zFh4fBaUdv7QZA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, wim@linux-watchdog.org,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
        Gouwa Wang <gouwa@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 30, 2021 at 12:13:53PM +0800, Artem Lapkin wrote:
> > Add nowayout module parameter
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
>
> <Formletter>
> Change log goes here. If it is missing, I won't know what changed.
> That means I will have to dig out older patch versions to compare.
> That costs time and would hold up both this patch as well as all other
> patches which I still have to review.
>
> For this reason, I will not review patches without change log.
> </Formletter>
>
> The change is small and recent enough that I remember, so
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> but please keep this in mind for future submissions.
>
> Thanks,
> Guenter
>
> >  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 5a9ca10fbcfa..5aebc3a09652 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -29,6 +29,11 @@
> >  #define GXBB_WDT_TCNT_SETUP_MASK             (BIT(16) - 1)
> >  #define GXBB_WDT_TCNT_CNT_SHIFT                      16
> >
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> > +              __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> >  struct meson_gxbb_wdt {
> >       void __iomem *reg_base;
> >       struct watchdog_device wdt_dev;
> > @@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
> >       data->wdt_dev.min_timeout = 1;
> >       data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> > +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
> >       watchdog_set_drvdata(&data->wdt_dev, data);
> >
> >       /* Setup with 1ms timebase */
> > --
> > 2.25.1
> >
