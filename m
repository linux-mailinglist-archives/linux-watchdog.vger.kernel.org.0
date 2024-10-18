Return-Path: <linux-watchdog+bounces-2229-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984F9A33D0
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 06:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BE341C20E25
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 04:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747A61714A5;
	Fri, 18 Oct 2024 04:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG7GeQXi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468520E32F;
	Fri, 18 Oct 2024 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225795; cv=none; b=cC9U5jQJz+gVASLeZqT748KoJ0j+iQd31EGM/IthcUSSGSVFehB7l0Lmb3S595EtkvZIg6bo0VM5T10QI+JahplnUztLAF8tBt7AcZsz1MjN9+shms+jGK+SCzzoC6pc07C3UFeLBnL2q0jHlUxOFXjQajsdRc1x5toTc35/63Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225795; c=relaxed/simple;
	bh=Vv3Y5ZH+3zJm4Gn7OSRkForj6TI3DVIQ473KN96JQ2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLvuFlXuXyarxAa3jiIX4h0Rj/aw+r7AF8NlbvnQ0bx2LzQ0QjU7SW7b4x+THNlt7CKjyJHkx9W7cg6K6vAYxcKX5uRemFFkRcYzzl55fYdifnYlyO+RyRbQNiVKEOrDKKo5IbOw8Xbxpk168+CfKWUydaFdkI3VRKxG7wqNNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG7GeQXi; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4a487a7519fso494562137.0;
        Thu, 17 Oct 2024 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729225792; x=1729830592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIficAJv2QmRgfNKu6z0Gj8S6rkpuYN83vvojTzaMZM=;
        b=TG7GeQXiberyBhrK8VfdRj29ZVl9kYCW5xb2X8ww+p/X0w8MXHL8+JknBDshfuq9Fb
         t4ZodaAn5ClWXKjqg58rhi6yb0/EN4IlC+v+Jl9QbxGNjv5Rs7i+91CyY0QiSBwq5kTO
         v1bwCxSnTf6R7YaGin7tqLLmyt9Ksuf4fUJ8Idfif+07L9sy9IPan00ishSwBO+98UtF
         +ZZ0mbOzdnE5xdd+AO6NmFucdh0dr8Ax7J3UFNEemoBKx1a6Px69ekY+OxkPoYOsW92J
         z+AsRVuGb+Sn4k6pKGkKnyKISF4OieKBsIJ9AgbXONsUeB1LSjiqZ4sUbYMzsqvehOiN
         Mj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729225792; x=1729830592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIficAJv2QmRgfNKu6z0Gj8S6rkpuYN83vvojTzaMZM=;
        b=V1UpqDAjU5Zy1YP5n54ldsxFXc8YaNavhBCvOMegFtJHsUUGwqhkg8Cre99OVF06ts
         r87+B/1ZQ62fmMLtwNxzNi3bpJGsK161HKIcL2TEbJyiR1RRHm2o4ZOo+DC90jvIiLc3
         eP71IlQIIlD1/2G7IZN1FlrLuY5EpEr/t+PaB+P225c7th522HOXiz/UJ5ySIQpfm1+K
         Aik4QsptVHuY+KojN6hYAowrI6tARcUJvCe7dYhWugdyUArpTTisexmrLWxzbxICkA0J
         cc+WVw5oglCr9I/PPZ/XemdtUXusGJltmpqCrONx6XSKQOtNvpItpd52Ai3jQTCYKGz3
         wIlg==
X-Forwarded-Encrypted: i=1; AJvYcCWB9/lMBBkZbxOtNG4taLlSc70SNvyAj4oUZb0YAjzY6/F/8mT1zgy0XYinhEFVWnACynBZ6gCGAnLYyig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/FytXE3cLPcL38Os+ic7Yvzh5U/l/7fkse6yX79NOO9yupQXe
	pBPr6OC3Ww2q6XC7TMuuuJusC2rQ5SZhIowknx3hEwu8a5MM5kjIZN0k09e0MtAvxWoOhKIvggB
	K8XC1wRm0w/xKiKmzdXdGIO4GImpkWw/F
X-Google-Smtp-Source: AGHT+IFY+skUvXKTmPtXePBZRhZjdxHs8SBVKUpgXoawLa1v+kAY84pgsdMUhY6RlgRWxS2eqWCVmMV/XvVRESIjRpo=
X-Received: by 2002:a05:6102:c90:b0:4a5:ad80:a9e1 with SMTP id
 ada2fe7eead31-4a5d6bd77efmr485137137.28.1729225792571; Thu, 17 Oct 2024
 21:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018030917.2540841-1-james.hilliard1@gmail.com> <66922a0b-6e30-4501-9262-8bdd224155f9@roeck-us.net>
In-Reply-To: <66922a0b-6e30-4501-9262-8bdd224155f9@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Oct 2024 22:29:41 -0600
Message-ID: <CADvTj4pnYn478mzM6LQFJ7x1SBANY_Q4JBygTUqx2PnJgJkQxg@mail.gmail.com>
Subject: Re: [PATCH] watchdog: it87_wdt: add quirks for some Qotom IT8786 boards
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 9:59=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/17/24 20:09, James Hilliard wrote:
> > For the watchdog timer to work properly on the QCML04 board we need to
> > set PWRGD enable in the Environment Controller Configuration Registers
> > Special Configuration Register 1 when it is not already set, this may
> > be the case when the watchdog is not enabled from within the BIOS.
> >
> > For the Qotom QGLK02 board the vendor indicates that the IT8786
> > watchdog hardware is not functional due to a conflict with the BIOS
> > power-on function, with PWRGD set the watchdog will trigger but the
> > board will poweroff rather than restart as expected. Disable the
> > it87 driver on this broken hardware.
> >
>
> This shouldn't be done in drivers, and it doesn't scale. The driver needs
> to be disabled with the mechanism supported by the distribution, for exam=
ple
> in /etc/modprobe.d/blacklist-watchdog.conf, or by whatever other mechanis=
m
> the distribution supports for that purpose.

There isn't really a good way that I've found with my setup since I use com=
mon
images for both of these boards. I'm also worried that it's much easier to =
mess
something critical like this up if user space is involved in hardware detec=
tion.

Many other watchdog drivers do this sort of thing so I'm a bit confused why=
 we
would want to not do that here as well, for example:
https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/renesas_wdt.c=
#L176-L207
https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/ebc-c384_wdt.=
c#L125
https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/lenovo_se10_w=
dt.c#L242-L285
https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/sbc_fitpc2_wd=
t.c#L203-L206

>
> Guenter
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   drivers/watchdog/it87_wdt.c | 55 ++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 55 insertions(+)
> >
> > diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> > index 3e8c15138edd..dec501c21fd3 100644
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
> > +
> >   /* GPIO Configuration Registers LDN=3D0x07 */
> >   #define WDTCTRL             0x71
> >   #define WDTCFG              0x72
> > @@ -240,6 +248,28 @@ static int wdt_set_timeout(struct watchdog_device =
*wdd, unsigned int t)
> >       return ret;
> >   }
> >
> > +enum {
> > +     IT87_WDT_BROKEN                 =3D BIT(0),
> > +     IT87_WDT_OUTPUT_THROUGH_PWRGD   =3D BIT(1),
> > +};
> > +
> > +static const struct dmi_system_id it8786_quirks[] =3D {
> > +     {
> > +             /* Qotom Q730P/Q8XXG2-P */
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "QGLK02"),
> > +             },
> > +             .driver_data =3D (void *)IT87_WDT_BROKEN,
> > +     },
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
> > @@ -261,8 +291,10 @@ static struct watchdog_device wdt_dev =3D {
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
> > @@ -273,6 +305,20 @@ static int __init it87_wdt_init(void)
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
> > +     if (quirks & IT87_WDT_BROKEN)
> > +             return -ENODEV;
> > +
> >       switch (chip_type) {
> >       case IT8702_ID:
> >               max_units =3D 255;
> > @@ -333,6 +379,15 @@ static int __init it87_wdt_init(void)
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

