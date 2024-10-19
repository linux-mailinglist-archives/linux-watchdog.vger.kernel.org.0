Return-Path: <linux-watchdog+bounces-2238-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDE9A509A
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Oct 2024 21:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4ABF1C21642
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Oct 2024 19:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED121925AA;
	Sat, 19 Oct 2024 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USZLWNCN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F3191F98;
	Sat, 19 Oct 2024 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729367748; cv=none; b=AV7H9o7L1gLeaUSJB9S+dcXcneYgnDMoUNdiGt/UnwflfpMNhTiOZ685yK/UWJ0uHfSUwo7/jZmvknf9z+fCSjGq+rwI6NgHZZhue9st6+8ay4gwFcy55uS1ytoABsaHWsIIfX7SK9S6lkhGAo8J+PcPQ2NlWfzxcJUKrZI0uJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729367748; c=relaxed/simple;
	bh=a8wcSQxvTMi76TdHpDJv9XEQwj7X2A/YYQCLkafB71g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRelKWybtRYn3UF1UA5tq1dAxDHNnHtUpFtRhodtT4hGDARSAaUPt/4zWv9jZRuIsxSo143DjR6D4w528aJJBJdQA310cPN04xQQT4JbZhsCfrPMJr8/Z4mUe0ZU5UorqPHPeMCsnVBE4n5OqtMz0rqoB4O0gBFHCDcQ9uaTJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USZLWNCN; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4a47dc2ef46so892956137.3;
        Sat, 19 Oct 2024 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729367745; x=1729972545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhN4CrXvfABg8gdMj0MWuoKz5nFu2BJgZUyLymgeWfY=;
        b=USZLWNCNIqmP7jVVOs+lxjPcxSWvrAUkCzn8BPlaHlxFK0pHs/kq9vIDPy+LWgF504
         wbOVoB/3r1BIJIoiKenv2qoQRmBmbXOyWBO5lwnApgopEHCbsNZoudND1IwlB5KPM12j
         uCSPh15wsA7FSZl5AcG5E+SaJME1uUvx36ApUOeAgyfKvNk6iz4dh+DkYgD0nr9ssLfK
         RS5bX6pdYQ4hO1xzSdK2jJ0mWOnZa2TXdBmB/EcP2H6V11956JOJs5rvIzSGYaeQ2r5H
         ZOsn17gEpGDCX9UITNDXior6R5EE7WsMf1I3w1m3U2pa5Mnug6DSYriEKHQ2q09D1KBR
         pBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729367745; x=1729972545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhN4CrXvfABg8gdMj0MWuoKz5nFu2BJgZUyLymgeWfY=;
        b=GA4qYg/1U5ZHZogZ+2bzGmXIAOThZjnHardauxtTKQFRF5+MB/BJGTvVejPRFhFPml
         B3OcfKQ45FJG7IjYLsfF6U4CtiSSh4xNtUku+sQDRnFtLRS9v0YGcjP9v2NfC+72j9tW
         hbrAIH6uN7P0V3Vc1fjoWTU/opW+WRa4HkgCz6Pveq/N/Adv0iBt2tng9NvPcFWrYHjo
         PUMPO5TJjgDSodhS1qCMj+zSzMNiHx4OAQ8zLGej5QGa9NNgcyVI9D01EEUB4rj8KEcl
         ifDTkCHpnKeIJySp6B0v8A/bYGdou6czKXACk4AvcwU6L/mU55zf2ianJ2K0hNznrtkk
         cfLA==
X-Forwarded-Encrypted: i=1; AJvYcCWkmnbKxJttvfG6QW93Kd/7Ogklq0B3QXP2D8UL8hkyxb4k52rvKpvqlD7StrSj9kzgakJMSHq+TO6+9H0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjTOIM2g/sgCMSEJyGYTsNl1MLdHh+sfXDTqkNyTDAI5yj/Twb
	WRXuLm543uRcpFBjpqujp5GEBH3Ok7NnelL4JdvLFJQAI5CX1KX7PCEX7kM9WALVSL730j1KBfW
	QniEwZWXdbbzVRM6nOqT4Ya1wpjhdQ6QR
X-Google-Smtp-Source: AGHT+IGXEZXhYRVTUdFPsInMwqRHGsHyEzcGO10TGYS2p0uCHgXBvFvghKHa0QvrSKY8rEYb9jHob5O3EhOTFNzd+qk=
X-Received: by 2002:a05:6102:3914:b0:4a5:b543:ee64 with SMTP id
 ada2fe7eead31-4a5d6a8c680mr5567864137.11.1729367745074; Sat, 19 Oct 2024
 12:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018154859.2543595-1-james.hilliard1@gmail.com> <74b01dd4-79bb-44bb-98a4-a478a99a5654@roeck-us.net>
In-Reply-To: <74b01dd4-79bb-44bb-98a4-a478a99a5654@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 19 Oct 2024 13:55:31 -0600
Message-ID: <CADvTj4qZf=1tfqPmN0tY-Rr5Z4BZJAxSZez=789f3wLRfhcXvA@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 8:33=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/18/24 08:48, James Hilliard wrote:
> > For the watchdog timer to work properly on the QCML04 board we need to
> > set PWRGD enable in the Environment Controller Configuration Registers
> > Special Configuration Register 1 when it is not already set, this may
> > be the case when the watchdog is not enabled from within the BIOS.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >    - remove QGLK02/IT87_WDT_BROKEN
> > ---
> >   drivers/watchdog/it87_wdt.c | 44 ++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> > index 3e8c15138edd..b8be9af065b2 100644
> > --- a/drivers/watchdog/it87_wdt.c
> > +++ b/drivers/watchdog/it87_wdt.c
> > @@ -20,6 +20,7 @@
> >
> >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> > +#include <linux/dmi.h>
> >   #include <linux/init.h>
> >   #include <linux/io.h>
> >   #include <linux/kernel.h>
> > @@ -40,6 +41,7 @@
> >   #define VAL         0x2f
> >
> >   /* Logical device Numbers LDN */
> > +#define EC           0x04
> >   #define GPIO                0x07
> >
> >   /* Configuration Registers and Functions */
> > @@ -73,6 +75,12 @@
> >   #define IT8784_ID   0x8784
> >   #define IT8786_ID   0x8786
> >
> > +/* Environment Controller Configuration Registers LDN=3D0x04 */
> > +#define SCR1         0xfa
> > +
> > +/* Environment Controller Bits SCR1 */
> > +#define WDT_PWRGD    0x20
>
> The IT8786 documentation I have states that this bit is reserved.
> Do you have information suggesting otherwise ?

Yes, if you clone this repo you'll see the docs in the .rar archive:
https://gitcode.com/open-source-toolkit/c602e.git

>
> > +
> >   /* GPIO Configuration Registers LDN=3D0x07 */
> >   #define WDTCTRL             0x71
> >   #define WDTCFG              0x72
> > @@ -240,6 +248,20 @@ static int wdt_set_timeout(struct watchdog_device =
*wdd, unsigned int t)
> >       return ret;
> >   }
> >
> > +enum {
> > +     IT87_WDT_OUTPUT_THROUGH_PWRGD   =3D BIT(0),
>
> I don't mind starting to use BIT(), but then <linux/bits.h> needs to be
> included as well.

Ok, will add in v3.

>
> > +};
> > +
> > +static const struct dmi_system_id it8786_quirks[] =3D {
>
> I see that bit 5 of EC register 0xfa _is_ documented for this purpose on
> at least one other chip supported by this driver, so the flag should be m=
ade
> generic, and not be IT8786 specific. Please name the quirks it87_quirks
> or similar and check it for all chips.

So, the enum is generic but I wanted to separate out the quirks by chip
since from my understanding each board only uses one chip model and
thus doing the DMI check for chips with no known boards that need
quirks applied would be unnecessary. This also helps to document in the
code which chip a specific board uses which I think is potentially useful
information to have. If quirks for additional chips end up being needed
one can simply add another quirks table for that chip.

I'm also trying to be as specific as possible for the DMI match since these
Qotom boards only set board names and have no other unique DMI attributes
we can match against like vendor names.

Maybe I'm being a bit overly paranoid here but I figured it would be best
to minimize the probability of a bad match as much as possible.

>
> Thanks,
> Guenter
>
> > +     {
> > +             /* Qotom Q30900P */
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "QCML04"),
> > +             },
> > +             .driver_data =3D (void *)IT87_WDT_OUTPUT_THROUGH_PWRGD,
> > +     }
> > +};
> > +
> >   static const struct watchdog_info ident =3D {
> >       .options =3D WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIV=
EPING,
> >       .firmware_version =3D 1,
> > @@ -261,8 +283,10 @@ static struct watchdog_device wdt_dev =3D {
> >
> >   static int __init it87_wdt_init(void)
> >   {
> > +     const struct dmi_system_id *dmi_id;
> >       u8  chip_rev;
> >       u8 ctrl;
> > +     int quirks =3D 0;
> >       int rc;
> >
> >       rc =3D superio_enter();
> > @@ -273,6 +297,17 @@ static int __init it87_wdt_init(void)
> >       chip_rev  =3D superio_inb(CHIPREV) & 0x0f;
> >       superio_exit();
> >
> > +     switch (chip_type) {
> > +     case IT8786_ID:
> > +             dmi_id =3D dmi_first_match(it8786_quirks);
> > +             break;
> > +     default:
> > +             dmi_id =3D NULL;
> > +     }
> > +
> > +     if (dmi_id)
> > +             quirks =3D (long)dmi_id->driver_data;
> > +
> >       switch (chip_type) {
> >       case IT8702_ID:
> >               max_units =3D 255;
> > @@ -333,6 +368,15 @@ static int __init it87_wdt_init(void)
> >               superio_outb(0x00, WDTCTRL);
> >       }
> >
> > +     if (quirks & IT87_WDT_OUTPUT_THROUGH_PWRGD) {
> > +             superio_select(EC);
> > +             ctrl =3D superio_inb(SCR1);
> > +             if (!(ctrl & WDT_PWRGD)) {
> > +                     ctrl |=3D WDT_PWRGD;
> > +                     superio_outb(ctrl, SCR1);
> > +             }
> > +     }
> > +
> >       superio_exit();
> >
> >       if (timeout < 1 || timeout > max_units * 60) {
>

