Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5BC44BA51
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Nov 2021 03:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhKJCas (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 21:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbhKJCar (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 21:30:47 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2024EC061764;
        Tue,  9 Nov 2021 18:28:01 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id f9so1028929ioo.11;
        Tue, 09 Nov 2021 18:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZa7ro0mt+1m73OfXo7S1sh7QMO6OoAdAVHj6tyyP3w=;
        b=RwGT3awlgpV7L6eTUuK+fhfL8t4M2SvV96j1JF+T3BtTm0WgyYoxws36gSEjazdUx0
         ooWxhkSKADc5pu1Z+APBY73BmzWMW92OvwmvQ9sdHM5PdJGdoBz8OLih73W+n159xsP2
         F1U4CwQ1qMuhi86TruvllC0JEulr9Sn28uQEhk/XsNtTf9BgsG9rhVxgMeYx8yjkcqXn
         sl2LbIEhHfS2XKjo1sMHoV7XsYMnB2pEj4Xjlh4gvFbsCyl1ZqPzBj6qVbbw4EV4DOGk
         YQ4SWyErdWOOnHbsXgvuE6QTzkHZdVEqQ58qq6SaDrI+20EcSJH67EaDQNy0n7GlXEe4
         MKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZa7ro0mt+1m73OfXo7S1sh7QMO6OoAdAVHj6tyyP3w=;
        b=QdV3FbmbWMShUtbIG3A9Cxjk7WrGDyhwFdiMJUH8hZlVS1I7ilhkJe7lzqj9lBAPWC
         nL02efs/FD2ED8We1uqTRxOe7nc9Wz1nXn8R4ei86Xpex8cO5ZWSOdM6SCTEviDzYigR
         T9hUezCSbdaiInvXarkqISxgGucwQ+PAAmf44bhf3+N43PBoPT29SJe8YBaNHbxcMBVY
         a01qsIKuv+2Fqlf+Y8uJtSu4N0+a9b1X2qfFMRT+W53aUAipzhAfNAw160zPqX2/3zAC
         du7M7ACbKWdLvmwONMKHiieKdr6JB34wRAc1hU1Tofbd53yYDYNkfp+rjzGWgpqymTvP
         94FQ==
X-Gm-Message-State: AOAM5320IhWReNs/MtVkrMWv544v5yCMy0M5T0/vuHxFn3BVdW73yA5/
        6FmfNyXxNJxG+oAvkz5i6FB0ms1bpiaRMMqrsRo=
X-Google-Smtp-Source: ABdhPJz2OQAmvT8DPC+HdByniVeapr1YeGE2uk9XjMA0mDMCS0vKj6j44XdMVIWTqAolIW3RZSLLDd9BdIE5WyvnXqU=
X-Received: by 2002:a02:cf3c:: with SMTP id s28mr9384203jar.140.1636511280320;
 Tue, 09 Nov 2021 18:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com> <20210730041355.2810397-4-art@khadas.com>
 <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com> <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
In-Reply-To: <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Wed, 10 Nov 2021 10:27:48 +0800
Message-ID: <CAKaHn9JgcZUHDu8=rWiN8p=Pow-iK73Be9s837+oyS_YcMkCxA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
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

On Tue, Nov 9, 2021 at 11:30 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/8/21 11:59 PM, Art Nikpal wrote:
> > hi Guenter Roeck
> > why still not merged to upstream ?
> >
>
> I had asked you to provide an updated description, without the "personal
> opinion" part which does not belong into a commit log. The other two
> patches wait for Wim to send them upstream.
>

ok i have send this patch with new description again

> Guenter
>
>
> > On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
> >>
> >> Remove watchdog_stop_on_reboot()
> >>
> >> Meson platform still have some hardware drivers problems for some
> >> configurations which can freeze device on shutdown/reboot stage and i
> >> think better to have reboot warranty by default.
> >>
> >> I feel that it is important to keep the watchdog running during the
> >> reboot sequence, in the event that an abnormal driver freezes the reboot
> >> process.
> >>
> >> This is my personal opinion and I hope the driver authors will agree
> >> with my proposal, or just ignore this commit if not.
> >>
> >> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> >>
> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> ---
> >>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> >> index 945f5e65db57..d3c9e2f6e63b 100644
> >> --- a/drivers/watchdog/meson_gxbb_wdt.c
> >> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> >> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >>
> >>          meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >>
> >> -       watchdog_stop_on_reboot(&data->wdt_dev);
> >>          return devm_watchdog_register_device(dev, &data->wdt_dev);
> >>   }
> >>
> >> --
> >> 2.25.1
> >>
>
