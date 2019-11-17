Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4098FFBF2
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Nov 2019 23:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfKQW0V (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Nov 2019 17:26:21 -0500
Received: from smtpimr.rockwellcollins.com ([205.175.227.52]:50337 "EHLO
        da1vs04.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726134AbfKQW0U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Nov 2019 17:26:20 -0500
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Nov 2019 17:26:20 EST
IronPort-SDR: J2rICjvHnQ1Z1Qs1sbe6m6RT7yaQXRiIq9gH+cYijTg9bGBeM9j1hrU72o6ThDDX89i2yDMPA7
 XxlJ8mCnCmNZ3tPYmTbVyrJdoVZe4IhPE5ObWL+rNMiPOp/dYidBg6hRh9zhEUHYVloq5H7k8K
 3TcpPojda2C4IJYk8PwlDsL0xf+UuHupsCEnmBNnTsJPbnYPPl6RB8kM/8vDdfRpSwQOunl73y
 5aJf34Xhn6qOu+YRfv+VnNLjzDDM6kLTtj8WrJgTj+Y9+xMnm2HSzc87fmk1HLCGCrFL3cFuPM
 foI=
X-RC-All-From: , 205.175.227.20, No hostname, brandon.maier@rockwellcollins.com,
 Brandon Maier <brandon.maier@rockwellcollins.com>, , 
X-RC-Attachments: , ,
X-RC-RemoteIP: 205.175.227.20
X-RC-RemoteHost: No hostname
X-RC-IP-Hostname: da1ip04.rockwellcollins.com
X-RC-IP-MID: 33904514
X-RC-IP-Group: GOOGLE_RELAYED
X-RC-IP-Policy: $GOOGLE_RELAYED
X-RC-IP-SBRS: None
Received: from unknown (HELO mail-oi1-f198.google.com) ([205.175.227.20])
  by da1vs04.rockwellcollins.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2019 16:19:15 -0600
Received: by mail-oi1-f198.google.com with SMTP id z143so1448621oia.20
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Nov 2019 14:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QpOJRJNGMAuGbdVghkADlMv/2q0v+3PhNrfr3X+ChUA=;
        b=V+sjLcjdLeQPWOUwU6kUfJ1BLSkQNAnHF70iaT8Ny/1JiX+6fnv0ezx8o+vs+McXfp
         +ivSEq/hcCGOKatgHfYUDZdy5uFfGn39V/dM44IK7Pf+vyHO9+Bw0i6LakS6PEyk5JT9
         21GEajtjyJqFNuifgMxBM03FqB3Z98incrWjg/soSavw4WcY/gW34HkNYuq6AvRX1JQ/
         LzfAjb3EH35P7yjTQeopquPhdOZg3RrxNqip1FHOfmdORDE0zSw/YAHbr+mKcZ1mMkRH
         12cPaH7eLYBW1jsFBiS2vWFx2G1KJhG8+GVxqjW8mWvD8F0emwVx24KSJPXDY141+BYF
         aK1w==
X-Gm-Message-State: APjAAAUjtv/QDTj05eWDTDpl2e9MXKD/OQn2tb0DlsHEw5Sph+J5jztT
        IXEy3a5HonNfNxOAH+gx+KNnpbikvQVqbZB0HsaFL4pwWowxzP+4UreTfzmzlKKxhScW/XtP/iF
        YEj1uGMaTAZ7yjKGkLnFCPaVtLMKJslSMOSssJoiSfMyUsWbGHdBNuGuexxIHdg==
X-Received: by 2002:a05:6830:8b:: with SMTP id a11mr21193057oto.244.1574029154643;
        Sun, 17 Nov 2019 14:19:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiwO7cK0JptLg9P2RnUvpbmuQ+6LCvPtVmaR1BpL6l42mIewnCvir8f6dZHaGd0OE7PpT3l6Ck3OcRghJRpsc=
X-Received: by 2002:a05:6830:8b:: with SMTP id a11mr21193040oto.244.1574029154251;
 Sun, 17 Nov 2019 14:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20191117200325.142419-1-brandon.maier@rockwellcollins.com> <6e9a6f3b-0723-ac59-b859-f8b7b75d39a9@roeck-us.net>
In-Reply-To: <6e9a6f3b-0723-ac59-b859-f8b7b75d39a9@roeck-us.net>
From:   Brandon Maier <brandon.maier@rockwellcollins.com>
Date:   Sun, 17 Nov 2019 16:19:03 -0600
Message-ID: <CA+fik53-RrzN1Q-Y+6hgtFyjharyMOLAy9w6gn0bfsUN=AwEUA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: omap: Fix early_enable to start watchdogd
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 17, 2019 at 3:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/17/19 12:03 PM, Brandon Maier wrote:
> > When the 'early_enable' module_param is enabled, Linux's watchdogd
> > thread does not start, causing the watchdog to eventually fire.
> >
>
> What does early_enable have to do with watchdogd ?

The early_enable doesn't directly control the watchdogd, it only
controls starting the watchdog. The problem is that, if the watchdog
is started, we need the watchdogd to ping the watchdog. It watchdogd
is not running, then the watchdog will trip and reset the system.

> Why would watchdogd not start if this flag is set ?

watchdog_register_device() checks this flag, and only enables the
watchdogd if it's set. See following:
https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/watchdog_dev.c#L1031

>
> The purpose of early_enable in this driver, as I understand it,
> was to force watchdogd to start within the timeout period. So
> it does exactly what it is supposed to be doing.

I'm not sure what you're referring to by "timeout period". But
early_enable does force the watchdog to start during module insertion,
that works correctly. The issue is that the driver doesn't tell the
watchdog core to launch the watchdogd.

This change is based off many of the other watchdog drivers. They also
set the WDOG_HW_RUNNING flag if the watchdog is running. The only
significant difference is that those drivers don't typically have an
early_enable, they just detect if the watchdog was already running
before insertion. But the end result is the same, the watchdog is
running and will trigger if watchdogd isn't.

>
> Guenter
>
> > For the watchdogd to be started, the WDOG_HW_RUNNING flag must be set
> > before watchdog_register_device().
> >
> > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> > ---
> >   drivers/watchdog/omap_wdt.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> > index 9b91882fe3c4..ecc8592c00a5 100644
> > --- a/drivers/watchdog/omap_wdt.c
> > +++ b/drivers/watchdog/omap_wdt.c
> > @@ -268,8 +268,13 @@ static int omap_wdt_probe(struct platform_device *pdev)
> >                       wdev->wdog.bootstatus = WDIOF_CARDRESET;
> >       }
> >
> > -     if (!early_enable)
> > +     if (!early_enable) {
> >               omap_wdt_disable(wdev);
> > +             clear_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> > +     } else {
> > +             omap_wdt_start(&wdev->wdog);
> > +             set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
> > +     }
> >
> >       ret = watchdog_register_device(&wdev->wdog);
> >       if (ret) {
> > @@ -281,9 +286,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
> >               readl_relaxed(wdev->base + OMAP_WATCHDOG_REV) & 0xFF,
> >               wdev->wdog.timeout);
> >
> > -     if (early_enable)
> > -             omap_wdt_start(&wdev->wdog);
> > -
> >       pm_runtime_put(wdev->dev);
> >
> >       return 0;
> >
>

Brandon
