Return-Path: <linux-watchdog+bounces-4452-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DAC18B77
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 08:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E646A3A8E56
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Oct 2025 07:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D635F2D97AA;
	Wed, 29 Oct 2025 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEUqaJAd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA030F93A
	for <linux-watchdog@vger.kernel.org>; Wed, 29 Oct 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723233; cv=none; b=sq+OCDdWPQ1R0bEPTHcptzXDEs97uH4t2/wkUZeZcWcGc/7UHHTQ6rqTgTG9TWgY+VdRpgTULrso59tre1N19odg16hPihZEu0gx9qW0hh95S6wbyUrG2yp6G768QkmJq+phrhEl5H2MmVssZapC2ZIx8osu0GlWrmaH6nYUCS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723233; c=relaxed/simple;
	bh=um3dhCwuxIhchysf4KVWj40F3Mmovi64QpAZjze1StE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLVdQpngshdfiBR05MW2/GTcP0SxrA5GEoR8uZY/cb0lcCr6MVmQdFpyEZiuD2cXNDsPth+vRZTo90tHAc9rt3UbLDXngAqyeDMMjUBMeVgzTAYl2FGZg9mvvu2h1sdh1olwcECv00bqjVpXq0mhZQAvmxws81caHJSEJDulFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEUqaJAd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso11098329a12.3
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Oct 2025 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761723230; x=1762328030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsodC3FWvlnb/LUjIJTURF4MPYAArEifAvf57pNwduM=;
        b=bEUqaJAdubmozR9z/YXYIyQJwN92vLDkmRJ7yyuQwQnU7NPlbtqlig3hYaGIKkWiu0
         VbscwokGsGER/TgCyoXdNpsgP26rWUtnSdIxcIVQ6fqMNoJ5EBNvJU9NkxnBYz3Gf5g7
         WNFyAESau01AvYcoED6O78EWDgEXuvFowAUNyVssZA43JXN2Ag6OJxT4/rsJomuIS6/l
         uGAH9urvuX1SndVZQo1sigdV3kmevoDPUV+Bi29KIOioJw0UKZRoUVsWGKmPGp/WhmAc
         DsMsOFjHe6KxW4JWbzIgT/2ZeejeYFY+fOWkisoUtmLqZiNhOlVZE0LQakwy+RqHMNVf
         CWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723230; x=1762328030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsodC3FWvlnb/LUjIJTURF4MPYAArEifAvf57pNwduM=;
        b=X+mpOpmyfZo8WK/ELsXdSukBLJqAdmDnJNAWnqxuWdvCem/QBTzLDX4O9vEQlC8eXB
         joXIRMUDDYlw2CC6fCYqVFT/ddLuc1Yvs3QMbVu3qUrTM2vjjCPYU/qRJXzEruZaICD/
         6rWmOKTQVrWgFVHR1xWLK+EXnnXJii8RtDYqaXs9N0EXB/IwcdRRE1IsN+AoNSeRXmaw
         IoSIju0W4g72JmlRgsPiT+9OV6Y7Xp1Rhu8QgpyyJMS7+Voap74H/6NNkcMUHJTdvI8j
         kCY6zWg47zQoVcmqNxyEL0hb/Un7aZLODVaTEfcOO7EYCZhGNuF/Hoz3uqUjT/GWV7Nm
         kwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaJ9IsYLrCTTvl+TgW8twnmIQpJi10FTYg3WgU1SpA7vGYjreKICwl2gQME169ND/zzduaKwib49e0i/ah3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsMjWO0fvU7bi6d3syu2HfvPKze45vA56Ik8HxIEBuzu+GY0vd
	xPWzjT11OVNYK3bZOGepWO4K8LBn6YQo27oQqaqkmIYw/+YPNrrWnbCO6M6yojsaNB8Xf+P6kyE
	ICGGe4lf8MYgAV5+mn4C2ar967YVIBTs=
X-Gm-Gg: ASbGncuTChKTCwOHS0SjSbW+H0DZ00pDHTNhNPc1nWhRr1Idk1d5wkm4KXvgC5jr+lt
	rL3emAMjCtJA2BZPf6HX4m3Q64TJwpzaKpBmANiC9lMaW6GVA8xWwqeSB78epYuMYy+VKkL1zI5
	HI66Zn/K/i0FTHhZZl1JdWGaLbAYJJXS4C80fh9EQ54spCahnEPWXgBswtu5C0uMw9IV+Ezv3ND
	Edr7RMfT1uCx0QgZxaxYOkasoHnFG9klfMlpJ7lrNOby0mh0H4CLpZ5WYepUkk=
X-Google-Smtp-Source: AGHT+IFoElBJzMz+S7sFHgF+i0aRhwEmOv6jEVOsP0y3fEEDYoyM0elt64gdocJadGJ4z6nVpqQQtrCRkokOEbSnFXc=
X-Received: by 2002:a05:6402:50d0:b0:638:74dc:cf78 with SMTP id
 4fb4d7f45d1cf-64044380bd9mr1618966a12.34.1761723229788; Wed, 29 Oct 2025
 00:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029020847.1946295-1-zhoubinbin@loongson.cn>
 <20251029020847.1946295-2-zhoubinbin@loongson.cn> <dd97339d-a984-4e74-8043-be99046c5102@roeck-us.net>
In-Reply-To: <dd97339d-a984-4e74-8043-be99046c5102@roeck-us.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 29 Oct 2025 15:33:37 +0800
X-Gm-Features: AWmQ_bm5aypQJFVdhgGPmy69k7CbHcJ7S1fFWahyivSzAlBIFVkdYJo0hz2UKx0
Message-ID: <CAMpQs4L2cGjTFUWAkFaXuvYpHS-SYC=8X5HD=yR6aQMkdvr9xg@mail.gmail.com>
Subject: Re: [PATCH 1/6] watchdog: loongson1: Rename the prefix from ls1x to loongson
To: Guenter Roeck <linux@roeck-us.net>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter:

Thanks for your reply.

On Wed, Oct 29, 2025 at 11:39=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 10/28/25 19:08, Binbin Zhou wrote:
> > In order to introduce the watchdog driver of the Loongson-2K0300 SoC,
> > which is similar to Loongson-1.
> >
> > As preparation, rename all prefixes from ls1x-specific to
> > Loongson-generic.
> >
> > No functional change intended.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> This is unnecessary. We don't rename drivers or function names because
> other chips are added to a driver. Doing so causes unnecessary churn
> and other problems, such as (in this case) loongson1_defconfig no longer
> enabling this watchdog. Any userspace depending (for whatever reason)
> on the driver name would also have problems.
>
> It is ok to make the driver more generic and remove the "1" from
> the Kconfig description and from MODULE_DESCRIPTION. However,
> please leave function and driver names alone.

My initial thought was that the loongson1_* prefix might cause
confusion for others, since we aim to support watchdog driver across
the entire Loongson series.

Additionally, looking across the entire kernel, only
loongson1_defconfig enables it. My initial code synchronously updated
this file, but the watchdog repository appears not to have updated the
code base, resulting in code conflicts [1]. Therefore, changes to this
section have been temporarily excluded.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Dad79935dbc22

>
> Thanks,
> Guenter
>
> > ---
> >   drivers/watchdog/Kconfig                      |  6 +-
> >   drivers/watchdog/Makefile                     |  2 +-
> >   .../{loongson1_wdt.c =3D> loongson_wdt.c}       | 86 +++++++++-------=
---
> >   3 files changed, 46 insertions(+), 48 deletions(-)
> >   rename drivers/watchdog/{loongson1_wdt.c =3D> loongson_wdt.c} (50%)
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 0c25b2ed44eb..74edeb13e95b 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1963,12 +1963,12 @@ config LANTIQ_WDT
> >       help
> >         Hardware driver for the Lantiq SoC Watchdog Timer.
> >
> > -config LOONGSON1_WDT
> > -     tristate "Loongson1 SoC hardware watchdog"
> > +config LOONGSON_WDT
> > +     tristate "Loongson SoC hardware watchdog"
> >       depends on MACH_LOONGSON32 || COMPILE_TEST
> >       select WATCHDOG_CORE
> >       help
> > -       Hardware driver for the Loongson1 SoC Watchdog Timer.
> > +       Hardware driver for the Loongson SoC Watchdog Timer.
> >
> >   config RALINK_WDT
> >       tristate "Ralink SoC watchdog"
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index bbd4d62d2cc3..70be11bf7bbf 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -178,7 +178,7 @@ obj-$(CONFIG_TXX9_WDT) +=3D txx9wdt.o
> >   obj-$(CONFIG_OCTEON_WDT) +=3D octeon-wdt.o
> >   octeon-wdt-y :=3D octeon-wdt-main.o octeon-wdt-nmi.o
> >   obj-$(CONFIG_LANTIQ_WDT) +=3D lantiq_wdt.o
> > -obj-$(CONFIG_LOONGSON1_WDT) +=3D loongson1_wdt.o
> > +obj-$(CONFIG_LOONGSON_WDT) +=3D loongson_wdt.o
> >   obj-$(CONFIG_RALINK_WDT) +=3D rt2880_wdt.o
> >   obj-$(CONFIG_IMGPDC_WDT) +=3D imgpdc_wdt.o
> >   obj-$(CONFIG_MT7621_WDT) +=3D mt7621_wdt.o
> > diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongs=
on_wdt.c
> > similarity index 50%
> > rename from drivers/watchdog/loongson1_wdt.c
> > rename to drivers/watchdog/loongson_wdt.c
> > index 0587ff44d3a1..19f6a19fc811 100644
> > --- a/drivers/watchdog/loongson1_wdt.c
> > +++ b/drivers/watchdog/loongson_wdt.c
> > @@ -10,7 +10,7 @@
> >   #include <linux/platform_device.h>
> >   #include <linux/watchdog.h>
> >
> > -/* Loongson 1 Watchdog Register Definitions */
> > +/* Loongson Watchdog Register Definitions */
> >   #define WDT_EN                      0x0
> >   #define WDT_TIMER           0x4
> >   #define WDT_SET                     0x8
> > @@ -23,26 +23,25 @@ module_param(nowayout, bool, 0444);
> >   static unsigned int heartbeat;
> >   module_param(heartbeat, uint, 0444);
> >
> > -struct ls1x_wdt_drvdata {
> > +struct loongson_wdt_drvdata {
> >       void __iomem *base;
> >       struct clk *clk;
> >       unsigned long clk_rate;
> >       struct watchdog_device wdt;
> >   };
> >
> > -static int ls1x_wdt_ping(struct watchdog_device *wdt_dev)
> > +static int loongson_wdt_ping(struct watchdog_device *wdt_dev)
> >   {
> > -     struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> > +     struct loongson_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt=
_dev);
> >
> >       writel(0x1, drvdata->base + WDT_SET);
> >
> >       return 0;
> >   }
> >
> > -static int ls1x_wdt_set_timeout(struct watchdog_device *wdt_dev,
> > -                             unsigned int timeout)
> > +static int loongson_wdt_set_timeout(struct watchdog_device *wdt_dev, u=
nsigned int timeout)
> >   {
> > -     struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> > +     struct loongson_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt=
_dev);
> >       unsigned int max_hw_heartbeat =3D wdt_dev->max_hw_heartbeat_ms / =
1000;
> >       unsigned int counts;
> >
> > @@ -54,28 +53,27 @@ static int ls1x_wdt_set_timeout(struct watchdog_dev=
ice *wdt_dev,
> >       return 0;
> >   }
> >
> > -static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
> > +static int loongson_wdt_start(struct watchdog_device *wdt_dev)
> >   {
> > -     struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> > +     struct loongson_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt=
_dev);
> >
> >       writel(0x1, drvdata->base + WDT_EN);
> >
> >       return 0;
> >   }
> >
> > -static int ls1x_wdt_stop(struct watchdog_device *wdt_dev)
> > +static int loongson_wdt_stop(struct watchdog_device *wdt_dev)
> >   {
> > -     struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> > +     struct loongson_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt=
_dev);
> >
> >       writel(0x0, drvdata->base + WDT_EN);
> >
> >       return 0;
> >   }
> >
> > -static int ls1x_wdt_restart(struct watchdog_device *wdt_dev,
> > -                         unsigned long action, void *data)
> > +static int loongson_wdt_restart(struct watchdog_device *wdt_dev, unsig=
ned long action, void *data)
> >   {
> > -     struct ls1x_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt_dev=
);
> > +     struct loongson_wdt_drvdata *drvdata =3D watchdog_get_drvdata(wdt=
_dev);
> >
> >       writel(0x1, drvdata->base + WDT_EN);
> >       writel(0x1, drvdata->base + WDT_TIMER);
> > @@ -84,25 +82,25 @@ static int ls1x_wdt_restart(struct watchdog_device =
*wdt_dev,
> >       return 0;
> >   }
> >
> > -static const struct watchdog_info ls1x_wdt_info =3D {
> > +static const struct watchdog_info loongson_wdt_info =3D {
> >       .options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGIC=
CLOSE,
> > -     .identity =3D "Loongson1 Watchdog",
> > +     .identity =3D "Loongson Watchdog",
> >   };
> >
> > -static const struct watchdog_ops ls1x_wdt_ops =3D {
> > +static const struct watchdog_ops loongson_wdt_ops =3D {
> >       .owner =3D THIS_MODULE,
> > -     .start =3D ls1x_wdt_start,
> > -     .stop =3D ls1x_wdt_stop,
> > -     .ping =3D ls1x_wdt_ping,
> > -     .set_timeout =3D ls1x_wdt_set_timeout,
> > -     .restart =3D ls1x_wdt_restart,
> > +     .start =3D loongson_wdt_start,
> > +     .stop =3D loongson_wdt_stop,
> > +     .ping =3D loongson_wdt_ping,
> > +     .set_timeout =3D loongson_wdt_set_timeout,
> > +     .restart =3D loongson_wdt_restart,
> >   };
> >
> > -static int ls1x_wdt_probe(struct platform_device *pdev)
> > +static int loongson_wdt_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> > -     struct ls1x_wdt_drvdata *drvdata;
> > -     struct watchdog_device *ls1x_wdt;
> > +     struct loongson_wdt_drvdata *drvdata;
> > +     struct watchdog_device *loongson_wdt;
> >       unsigned long clk_rate;
> >       int err;
> >
> > @@ -123,17 +121,17 @@ static int ls1x_wdt_probe(struct platform_device =
*pdev)
> >               return -EINVAL;
> >       drvdata->clk_rate =3D clk_rate;
> >
> > -     ls1x_wdt =3D &drvdata->wdt;
> > -     ls1x_wdt->info =3D &ls1x_wdt_info;
> > -     ls1x_wdt->ops =3D &ls1x_wdt_ops;
> > -     ls1x_wdt->timeout =3D DEFAULT_HEARTBEAT;
> > -     ls1x_wdt->min_timeout =3D 1;
> > -     ls1x_wdt->max_hw_heartbeat_ms =3D U32_MAX / clk_rate * 1000;
> > -     ls1x_wdt->parent =3D dev;
> > +     loongson_wdt =3D &drvdata->wdt;
> > +     loongson_wdt->info =3D &loongson_wdt_info;
> > +     loongson_wdt->ops =3D &loongson_wdt_ops;
> > +     loongson_wdt->timeout =3D DEFAULT_HEARTBEAT;
> > +     loongson_wdt->min_timeout =3D 1;
> > +     loongson_wdt->max_hw_heartbeat_ms =3D U32_MAX / clk_rate * 1000;
> > +     loongson_wdt->parent =3D dev;
> >
> > -     watchdog_init_timeout(ls1x_wdt, heartbeat, dev);
> > -     watchdog_set_nowayout(ls1x_wdt, nowayout);
> > -     watchdog_set_drvdata(ls1x_wdt, drvdata);
> > +     watchdog_init_timeout(loongson_wdt, heartbeat, dev);
> > +     watchdog_set_nowayout(loongson_wdt, nowayout);
> > +     watchdog_set_drvdata(loongson_wdt, drvdata);
> >
> >       err =3D devm_watchdog_register_device(dev, &drvdata->wdt);
> >       if (err)
> > @@ -141,30 +139,30 @@ static int ls1x_wdt_probe(struct platform_device =
*pdev)
> >
> >       platform_set_drvdata(pdev, drvdata);
> >
> > -     dev_info(dev, "Loongson1 Watchdog driver registered\n");
> > +     dev_info(dev, "Loongson Watchdog driver registered\n");
> >
> >       return 0;
> >   }
> >
> >   #ifdef CONFIG_OF
> > -static const struct of_device_id ls1x_wdt_dt_ids[] =3D {
> > +static const struct of_device_id loongson_wdt_dt_ids[] =3D {
> >       { .compatible =3D "loongson,ls1b-wdt", },
> >       { .compatible =3D "loongson,ls1c-wdt", },
> >       { /* sentinel */ }
> >   };
> > -MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> > +MODULE_DEVICE_TABLE(of, loongson_wdt_dt_ids);
> >   #endif
> >
> > -static struct platform_driver ls1x_wdt_driver =3D {
> > -     .probe =3D ls1x_wdt_probe,
> > +static struct platform_driver loongson_wdt_driver =3D {
> > +     .probe =3D loongson_wdt_probe,
> >       .driver =3D {
> > -             .name =3D "ls1x-wdt",
> > -             .of_match_table =3D of_match_ptr(ls1x_wdt_dt_ids),
> > +             .name =3D "loongson-wdt",
> > +             .of_match_table =3D of_match_ptr(loongson_wdt_dt_ids),
> >       },
> >   };
> >
> > -module_platform_driver(ls1x_wdt_driver);
> > +module_platform_driver(loongson_wdt_driver);
> >
> >   MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
> > -MODULE_DESCRIPTION("Loongson1 Watchdog Driver");
> > +MODULE_DESCRIPTION("Loongson Watchdog Driver");
> >   MODULE_LICENSE("GPL");
>

--=20
Thanks.
Binbin

