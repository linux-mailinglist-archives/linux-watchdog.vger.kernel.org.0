Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B306D88E83
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Aug 2019 23:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfHJVSG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Aug 2019 17:18:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39793 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfHJVSF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Aug 2019 17:18:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id r21so139991209otq.6;
        Sat, 10 Aug 2019 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2aM8t3WhsaooH6EEZEJW0NsTgNSeJNjQFlo07zB0t00=;
        b=i0s5tj1C46sBobVdbSPsy1m8MpWVhnyMzFOhTUQUB51kGRgwelP8hmCkJpNiClOONK
         rkDNNymwtNfBGIOwc0+M0YON4W4D/SO5hMPiCsxBgivLkz3uSPcBR+vJDqF2kayWf+HS
         hsn46uqrMoOec12ORT9ueoLxtFyt2iBsRhixZYKhbxixFyAa2vy2gYtYWnQkFceXsuqw
         oSOmAV9DBd8ZG/rrUC4RiDo9Icqtm/hGNg9YVdiqSlz9dCl5imIpAPIhf0xX+4j6wuzv
         0Oo3p5HeSdkbQhTLNPev+9gzk5FC/ldoY2+TQ79XNvn26YvJjekzcmQ+MkWAJQYPjgfp
         GT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2aM8t3WhsaooH6EEZEJW0NsTgNSeJNjQFlo07zB0t00=;
        b=DspXDOAdv5dj8SzKN/N9bWbyv8u1mp2+f1XgfjSJv5DJTOiKmXRRN1ntO7kaCnneqM
         pDmh6ztauYS4sXOceIctu+j3UUEKaiQal8L0/fvlu1u+HLEDS379HOhlk8KXhy1kdl7S
         ro1zBx6LHVXPojIJVdrsYbNRZAAk/Byiz7admpoUbm9BBy/vr3eXAbM5iv1Xlh2a9Nza
         beH9NTOBdpzioEQH0yQGiroB8gsf81bEIjaxGjOSoFwIvSaQo3qKhDgMjhvlgixVeMdf
         ZrQIld8vCctFbkfRQpd0/0x9c5vMrNivHnBikdhMRgMuu0HXv4tfWfDmcHghWcSgmAdr
         gydQ==
X-Gm-Message-State: APjAAAUiElqgGNZhaQwdDk+v6lBNnB8q9Vo/dihFJ6My3VPEWUAlF2tG
        lgjoKFbzXZ5BSNKowaV5UwXZv/6vtBvYU69F+Xc=
X-Google-Smtp-Source: APXvYqwUjNy0XboHs0xSwGayID+rdnMFYzrqtC1LXm1bn6Gm4sTNY3tq0OSCovSgmEeTLTSL2ARUYNoyPKaUq5SqHFI=
X-Received: by 2002:a02:16c5:: with SMTP id a188mr12946978jaa.86.1565471884546;
 Sat, 10 Aug 2019 14:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
 <20190731174252.18041-5-andrew.smirnov@gmail.com> <20190731180938.GA3885@roeck-us.net>
In-Reply-To: <20190731180938.GA3885@roeck-us.net>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Sat, 10 Aug 2019 14:17:52 -0700
Message-ID: <CAHQ1cqFNju7+GSFvUwZ1Vtt_TW=1qDj9eqbJ3fUb1R7jZoF-XA@mail.gmail.com>
Subject: Re: [PATCH 4/5] watchdog: ziirave_wdt: Don't bail out on unexpected
 timeout value
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 31, 2019 at 11:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Jul 31, 2019 at 10:42:51AM -0700, Andrey Smirnov wrote:
> > Reprogramming bootloader on watchdog MCU will result in reported
> > default timeout value of "0". That in turn will be unnecesarily
>
> unnecessarily
>
> > rejected by the driver as invalid device (-ENODEV). Simplify probe to
> > just read stored timeout value, clamp it to an acceptable range and
> > program the value unconditionally to fix the above.
> >
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > Cc: Chris Healy <cphealy@gmail.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Rick Ramstetter <rick@anteaterllc.com>
> > Cc: linux-watchdog@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/watchdog/ziirave_wdt.c | 22 +++++++++-------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> > index 89ce6982ba53..33c8d2eadada 100644
> > --- a/drivers/watchdog/ziirave_wdt.c
> > +++ b/drivers/watchdog/ziirave_wdt.c
> > @@ -667,22 +667,18 @@ static int ziirave_wdt_probe(struct i2c_client *client,
> >                       return val;
> >               }
> >
> > -             if (val < ZIIRAVE_TIMEOUT_MIN)
> > -                     return -ENODEV;
> > -
> > -             w_priv->wdd.timeout = val;
> > -     } else {
> > -             ret = ziirave_wdt_set_timeout(&w_priv->wdd,
> > -                                           w_priv->wdd.timeout);
> > -             if (ret) {
> > -                     dev_err(&client->dev, "Failed to set timeout\n");
> > -                     return ret;
> > -             }
> > +             w_priv->wdd.timeout = clamp(val, ZIIRAVE_TIMEOUT_MIN,
> > +                                         ZIIRAVE_TIMEOUT_MAX);
>
> Are you sure ? Effectively that will set the timeout to the minimum,
> ie three seconds. It might be better to define and set some default.
> Your call, of course.
>

It doesn't really matter in my use-case (set timeout is a no-op),  but
it sounds like a better approach, so I'll change it in v2.

Thanks,
Andrey Smirnov
