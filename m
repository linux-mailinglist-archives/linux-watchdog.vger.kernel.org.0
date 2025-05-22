Return-Path: <linux-watchdog+bounces-3567-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94EAC040E
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 07:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ACFF1B64991
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 05:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4CC1A5BBD;
	Thu, 22 May 2025 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY4yQF/F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408A1A4E70;
	Thu, 22 May 2025 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892056; cv=none; b=NdrfY3s58PR4/M3bWhvVtfkIk60l1qOwZ+EORpuBxeSEB+XSWCSiCG4Qo8dBIiStpMnFCMI5pjrSu98kv7fxCilOMMIhSiK+qZj2JrgEq1MzyFuZcSFXKM5cvRU/n7IZCNefezcU4zPshBGu9mmu0EUDm0J4zE4lrrIEXYs/6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892056; c=relaxed/simple;
	bh=VcEm6E88vTCvvcgdadVdsooT6r/8MjHlLE00qeqYcDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDKO0joEQgIrr1QD6MOY+SKhldKhsOfsC50k3D+UzN7w5gTrens6fORbF89JDuRKUl/pK7tQmHhZEHlgvE0+FvTEeJGrAIsN1YJR8Hk51JwzmznULmaZNaZ2ljQ3RfpEIMmUlFcLeQaHF4YjEqxyhJOvVAjsPxjUDg4uV5wh/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY4yQF/F; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5675dec99so823292385a.0;
        Wed, 21 May 2025 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747892053; x=1748496853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YUkhdEd0QQUDppQNw/UgH6HjgrfQKtiPCLApZ8LbF4=;
        b=OY4yQF/FLHwTYDlkeeMxfNPUAS8tmaqgIKb6nL+H9KxBm7DIwOfdX0aDQW1Od80yxy
         78Tnl3N4SudSY8JZhz2VUYRt2UrZILkKyGHQGLR2IffVtJklrnObazLEqFMMmRZl3d8o
         0pM5WM3i973Y8TQv2pJgNRBHW/CnIzz8YK7/My41kSQ5jJSDJa5plXz3N6sKbCENvOfe
         l49iWFUBw38PuDRfeffQBjKlqESJ5JFhFGZQrsgzeT0qdX0E4pISsE1lBEb9T6X+KgZy
         HuNtEEdxxaPn7xmF6fhzYdYjMwp4rUtJl6WaaVUcdEifxOSmKyxJQXmwaxGeaAsvZd9I
         g40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892053; x=1748496853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YUkhdEd0QQUDppQNw/UgH6HjgrfQKtiPCLApZ8LbF4=;
        b=O8+du9BGFcBNfbWjxnahsMUIDBwSshWv63rxen7WPxJpVx1gNPleMAPU/Oa08Cb6Y3
         JtCwHmWBSweJSJIKY+gnWsU4pF3SSO4R7O8h4b8RNGO/VFp8Fguq0g3vNdhQQ/4Z0t+O
         TjPwBVofN9X6bujiXAI2U5rlTi8vFSb4l9VzPASw7yBy2PuPH7LRp+sZPDd2sUp3SQlq
         QCc8N292TKjVPbOcQaXOMb0YjLF8Mv0RXIvMBameAnV2OcfSZ0l/PJCmdcaLwdrvEPgf
         EsZF/piScuLj3/+mFR2Zvje+NFsM7Qpli4zUrHUX0CnNhz890jr+lX/PVxsKlOneZV60
         9mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxSSPn7MAr5WAwfc0QjF9WViGjjw+seM/JcQL0vk4+OBSRnS8TO2SFoR/qtJNw6GRHWBV6zfJlJ6WM@vger.kernel.org, AJvYcCXHtTW14EoNF+EAjLnugEXY2kKMCGK3GEcdci5WUm0YTLZ1uMaxe60PU8r0I41aHfKfC2XaFOCpaGOYU+Dg@vger.kernel.org, AJvYcCXzZQEIu//BOTwOgxkztjhLM4lI+dir565SRQufFJ1WyruroSozIQYNyMdYEotB5ufNxI4n3hOARu/qjCq2byA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHxPp2JNz6j6uOQdQBguChuA3Nq/Y4F1RWv2DiTlXOYXvEgt8a
	utoQDjm1NCRIkZAdqW6xw4OpbFbX1jkVjjL+aknL1ZS+bmv3sFVX6uPfZzHtRFJ1xJdT56p4SKK
	qQQgPSn4r/a0LbWEr8ocLpj/VURQwgss=
X-Gm-Gg: ASbGnctiMyMWRoB/pLrFgHntIWpHrlR7ATbxgHH8xZhPaByOnTQpsIxipLJu3HZ2uuk
	PM4C5ENBpmPv6xjNC8FZ7h8OSM9vCnHxhfhyfYJget7sP8Djh60lA0jSerwM3On1h9MdXfNwpGp
	0K+u1lVZEJU3F6Wcn0f4rEThuNFtZAc4bvT1lGwvinRvii388aXym2zQLYUbKxxqoRVg==
X-Google-Smtp-Source: AGHT+IH+sFe/00LC82lChdaqpHX3ynAV5L9IbuDF4Vx4OIu+c9DVXkOKwcSM0tGgH5FbhmtibOWhO+4UzN974C3Q8Hc=
X-Received: by 2002:ac8:5ccd:0:b0:48b:50ea:85af with SMTP id
 d75a77b69052e-494ae353b1amr376196131cf.8.1747892052546; Wed, 21 May 2025
 22:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-3-7e4bd11df72e@gmail.com> <aC4Ma3E461XMBig0@mai.linaro.org>
In-Reply-To: <aC4Ma3E461XMBig0@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 22 May 2025 09:34:09 +0400
X-Gm-Features: AX0GCFtb-57_ZpBzRmHvZ9tosIN3IcdFjFNTkT9IoDYGJf6KA7HEPxpktqxPEQw
Message-ID: <CABjd4YzQgjwYgTHCTz9_2T0Hr3oXu4SZjxjjbVPk4UjKoLC2TA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:25=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 21, 2025 at 05:00:11PM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia system timer can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and reserve match register 0 f=
or
> > the watchdog. Instantiate an auxiliary device for the watchdog
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  MAINTAINERS                        |   1 +
> >  drivers/clocksource/Kconfig        |   1 +
> >  drivers/clocksource/timer-vt8500.c | 111 +++++++++++++++++++++++++++++=
+++++---
> >  include/linux/vt8500-timer.h       |  18 ++++++
>
> It should endup in include/clocksource/vt8500-timer.h

Noted, will move.

> >  4 files changed, 122 insertions(+), 9 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 783e5ee6854b69cca87b6f0763844d28b4b2213f..5362095240627f613638197=
fda275db6edc16cf7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >  F:   drivers/video/fbdev/vt8500lcdfb.*
> >  F:   drivers/video/fbdev/wm8505fb*
> >  F:   drivers/video/fbdev/wmt_ge_rops.*
> > +F:   include/linux/vt8500-timer.h
> >
> >  ARM/ZYNQ ARCHITECTURE
> >  M:   Michal Simek <michal.simek@amd.com>
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..92f071aade10b7c0f0bba4b=
47dc6228a5e50360f 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -178,6 +178,7 @@ config TEGRA186_TIMER
> >  config VT8500_TIMER
> >       bool "VT8500 timer driver" if COMPILE_TEST
> >       depends on HAS_IOMEM
> > +     select AUXILIARY_BUS
> >       help
> >         Enables support for the VT8500 driver.
> >
> > diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/t=
imer-vt8500.c
> > index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..cdea5245f8e41d65b8b9beb=
ad3fe3a55f43a18fa 100644
> > --- a/drivers/clocksource/timer-vt8500.c
> > +++ b/drivers/clocksource/timer-vt8500.c
> > @@ -11,6 +11,7 @@
> >   * Alexey Charkov. Minor changes have been made for Device Tree Suppor=
t.
> >   */
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/io.h>
> >  #include <linux/irq.h>
> >  #include <linux/interrupt.h>
> > @@ -22,9 +23,6 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >
> > -#define VT8500_TIMER_OFFSET  0x0100
> > -#define VT8500_TIMER_HZ              3000000
> > -
> >  #define TIMER_MATCH_REG(x)   (4 * (x))
> >  #define TIMER_COUNT_REG              0x0010   /* clocksource counter *=
/
> >
> > @@ -53,8 +51,14 @@
> >  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
> >
> >  #define MIN_OSCR_DELTA               16
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/vt8500-timer.h>
> >
> >  static void __iomem *regbase;
> > +static unsigned int sys_timer_ch;     /* which match register to use
> > +                                       * for the system timer
> > +                                       */
>
> The comment format is a bit odd. It would be nicer on top of the
> variable.
>
> /*
>  * Which match register to use for the system timer
>  */

Indeed. Will reformat, thanks!

> >  static u64 vt8500_timer_read(struct clocksource *cs)
> >  {
> > @@ -75,21 +79,26 @@ static struct clocksource clocksource =3D {
> >       .flags          =3D CLOCK_SOURCE_IS_CONTINUOUS,
> >  };
> >
> > +static u64 vt8500_timer_next(u64 cycles)
> > +{
> > +     return clocksource.read(&clocksource) + cycles;
> > +}
> > +
> >  static int vt8500_timer_set_next_event(unsigned long cycles,
> >                                   struct clock_event_device *evt)
> >  {
> >       int loops =3D msecs_to_loops(10);
> > -     u64 alarm =3D clocksource.read(&clocksource) + cycles;
> > +     u64 alarm =3D vt8500_timer_next(cycles);
> >
> > -     while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
> > +     while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sy=
s_timer_ch)
> >              && --loops)
> >               cpu_relax();
> > -     writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
> > +     writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_=
ch));
> >
> >       if ((signed)(alarm - clocksource.read(&clocksource)) <=3D MIN_OSC=
R_DELTA)
> >               return -ETIME;
> >
> > -     writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
> > +     writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_R=
EG);
> >
> >       return 0;
> >  }
> > @@ -131,7 +140,9 @@ static int __init vt8500_timer_init(struct device_n=
ode *np)
> >               return -ENXIO;
> >       }
> >
> > -     timer_irq =3D irq_of_parse_and_map(np, 0);
>
> It may be worth to repeat part of what is said in the changelog

Will do, thanks!

> > +     sys_timer_ch =3D of_irq_count(np) > 1 ? 1 : 0;
> > +
> > +     timer_irq =3D irq_of_parse_and_map(np, sys_timer_ch);
> >       if (!timer_irq) {
> >               pr_err("%s: Missing irq description in Device Tree\n",
> >                                                               __func__)=
;
> > @@ -140,7 +151,7 @@ static int __init vt8500_timer_init(struct device_n=
ode *np)
> >
> >       writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
> >       writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
> > -     writel(~0, regbase + TIMER_MATCH_REG(0));
> > +     writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
> >
> >       ret =3D clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
> >       if (ret) {
> > @@ -166,4 +177,86 @@ static int __init vt8500_timer_init(struct device_=
node *np)
> >       return 0;
> >  }
> >
> > +static void vt8500_timer_aux_uninit(void *data)
> > +{
> > +     auxiliary_device_uninit(data);
> > +}
> > +
> > +static void vt8500_timer_aux_delete(void *data)
> > +{
> > +     auxiliary_device_delete(data);
> > +}
> > +
> > +static void vt8500_timer_aux_release(struct device *dev)
> > +{
> > +     struct auxiliary_device *aux;
> > +
> > +     aux =3D container_of(dev, struct auxiliary_device, dev);
> > +     kfree(aux);
>
> That will result in a double kfree because the data belongs to the
> wdt_info structure. It is not a pointer allocated. So when the
> wdt_info will be freed, it will free the area already freed by this
> function.

Hmm, it will probably even work still, due to the fact that auxdev is
the first member of wdt_info. But at least a container_of is required
as long as the wdt_info struct is allocated with plain kzalloc not its
devm_* sibling.

> Please note, a timer should never be unloaded, so not sure if the wdt
> should handle the case.

I think this function is rather meant for freeing the parent allocated
resources when the child unregisters from the auxiliary bus, which may
happen earlier than the parent itself unloading (at least that's what
I'm getting from the auxiliary bus documentation). The auxiliary bus
doesn't even allow a child device to be added without specifying the
release callback, which leads me to believe that manual object
lifecycle management is preferred over devm managed one [1].

[1] https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/auxiliary=
_bus.h#L22

But it does make me wonder if e.g. unloading the wdt module would
trigger a release here, which might get messy upon loading it again.

> > +}
> > +
> > +/*
> > + * This probe gets called after the timer is already up and running. T=
his will
> > + * create the watchdog device as a child since the registers are share=
d.
> > + */
> > +static int vt8500_timer_probe(struct platform_device *pdev)
> > +{
> > +     struct vt8500_wdt_info *wdt_info;
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
>
> >>>>>
>
> > +     if (!sys_timer_ch) {
> > +             dev_info(dev, "Not enabling watchdog: only one irq was gi=
ven");
> > +             return 0;
> > +     }
> > +
> > +     if (!regbase)
> > +             return dev_err_probe(dev, -ENOMEM,
> > +                     "Timer not initialized, cannot create watchdog");
>
> The block above seems to be a bit wobbly as it relies on
> vt8500_timer_init() to have succeeded.
>
> Why not have vt8500_timer_probe() called by vt8500_timer_init() (with
> a proper name like vt8500_timer_wdt_init()) ?

I need a struct device to hang all the devm_*, dev_* and auxiliary bus
stuff on to. I couldn't find anything readymade in the timers
framework, thus the platform probe function to put something on a bus
first and get a valid dev pointer.

What are the chances of reaching the point of platform devices probing
without a successfully initialized system timer? I have a strong
suspicion that the system will be unusable anyway if vt8500_timer_init
is unsuccessful, given that it's the only clocksource on VT8500. In
which case being unable to initialize a watchdog would be the least of
my concerns :)

> <<<<<
>
> > +     wdt_info =3D kzalloc(sizeof(*wdt_info), GFP_KERNEL);
>
> devm_kzalloc()

I tried to find examples of other auxiliary_device structures
allocated with the managed functions and could only find plain
kzalloc, which makes me wonder if it's appropriate here?

> > +     if (!wdt_info)
> > +             return dev_err_probe(dev, -ENOMEM,
> > +                     "Failed to allocate vt8500-wdt info");
>
> Is it possible kzalloc to return -EPROBE_DEFER ?

I don't think so, but I like how dev_err_probe formats its output
including the textual representation of the errno, and also its inline
return. The docs also say it's fine to use even if -EPROBE_DEFER is
not expected [2]

[2] https://elixir.bootlin.com/linux/v6.14.6/source/drivers/base/core.c#L50=
57

> > +
> > +     wdt_info->timer_next =3D &vt8500_timer_next;
> > +     wdt_info->wdt_en =3D regbase + TIMER_WATCHDOG_EN_REG;
> > +     wdt_info->wdt_match =3D regbase + TIMER_MATCH_REG(0);
>
> The two fields above can be merged into one : wdt_info->regbase
>
> Move TIMER_WATCHDOG_EN_REG to the watchdog driver code.
>
> And as TIMER_MATCH_REG(__channel) =3D=3D 4 * (__channel),
> then TIMER_MATCH_REG =3D=3D 0, so regbase + 0 =3D=3D regbase

Could do that, but frankly I find it neat that the watchdog driver
doesn't need to do offsets into the parent's MMIO registers and just
uses descriptive names for the two registers it actually needs access
to.

> > +     wdt_info->auxdev.name =3D "vt8500-wdt";
> > +     wdt_info->auxdev.dev.parent =3D dev;
> > +     wdt_info->auxdev.dev.release =3D &vt8500_timer_aux_release;
> > +
> > +     ret =3D auxiliary_device_init(&wdt_info->auxdev);
> > +     if (ret) {
> > +             kfree(wdt_info);
>
> Remove kfree because of devm_kzalloc
>
> > +             return ret;
> > +     }
>
> nit: add line
>
> > +     ret =3D devm_add_action_or_reset(dev, vt8500_timer_aux_uninit,
> > +                                    &wdt_info->auxdev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D auxiliary_device_add(&wdt_info->auxdev);
> > +     if (ret)
> > +             return ret;
>
> nit: add line

Thanks for your review Daniel!

Best regards,
Alexey

