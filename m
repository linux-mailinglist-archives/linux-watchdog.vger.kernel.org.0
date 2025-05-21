Return-Path: <linux-watchdog+bounces-3563-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBFABF797
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 16:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50B5501876
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 14:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E2C18E02A;
	Wed, 21 May 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdAeN4Lh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BB17A309;
	Wed, 21 May 2025 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836950; cv=none; b=jWbzn+gEfxGjKHPvVDPlE6+2scsAeuPuwJOdPrtD7+Wu9XmPlr8ONeAuwcgr6Pe4jfVdaomKtNlDxA3kdgoZ17eNRoTwsdv8vvKyW8pzjHZM1CXAM479cKVH8iIk+JvLNDwhuR80yzKfOPkzUZDK3qf2swBfkw2gHZSZaaOGr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836950; c=relaxed/simple;
	bh=GQnfmFRZtLvsS4DejkJ7fH99PhZjUCOSuyapWW0RsYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rC0tq6XXzrEaVtB+vhmPkRyp3uqEkDDI6hjyjEeXcFBkKgyee6fEJ0AdHtlnkIblIMcVsmIlTxAPUnxNvfYCbF7L4WlqMVLhW84RA24tCFo8Qy1A6F2m34psnzROSUkiy0bKX0Jbf7cTvCECS8NqWOX3Jsfmd173BxzA502a/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdAeN4Lh; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476977848c4so72530831cf.1;
        Wed, 21 May 2025 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836947; x=1748441747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX/Z/xH5TjB+vI+iZlL+8jgmL2VhAdgdSQGMqiSf1Z8=;
        b=KdAeN4LhiyUjhLRcU0tpprJjKOS1oHmvIvqjYdEBCq4K5hWMTpCsr/HQ5kG+ilqK2p
         1sn1T1XsqBntR5z8JF9ku9jZMe3sU1jrL8ejNZZMDkA9tb01Ulx5f4f9M3SpeNlcOQgD
         tEJXyTwsoYWr3YeveSllaMoGt4Znn4M6j5XLs5qfOOdioCiYqx7nFWMsFPpwF9bJeJwv
         5oswWN5JagVM+BghSZ0hIfLy/haa67oy0WMrPUj34Bmf6h4aAxBt4NukmxZhPNoRz/tH
         XpklejW7Dfiu0OUi3lE4TFWHu6yW3ynHzpNHAH5zGEZbjDxcvK/HxxgffQByybPmW8We
         ez8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836947; x=1748441747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX/Z/xH5TjB+vI+iZlL+8jgmL2VhAdgdSQGMqiSf1Z8=;
        b=hPuG4EiXEO+x/d3JY8hdGGDnsTxLJIWB1PRZHSSZ69ix075aZnl00bD3KhBBF3P1ZP
         Sf7bGxHXUBBlyyAE4zhUzgSB4z/iFHZ091XXhUji75Ke/rkour6XdlFc+WiRQdR/jTo4
         gj7bpNX9Itn1t4er+crpSWbqOPVYETr4LM+ShtM2fiZQN8X2eg+9b5XSDRXrKXIYNtZq
         QUqoO5xwqBTsp16rw3dyyPMozzQHynaNdR0pXz/EAZa2XYaW4IqSS5cmhaq52YLXMKwT
         tz61WsF/EvhinT8/a+/xyaWK6iwkBNZXvL4ZNo383rHv6kUHc+Rm4ZHfL4erokxQI51X
         eiaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+1J2yqvKSTb3MZ9SPX8LHH2K7HXz0eovdIZnW09RCZ2kwCLkOJz1KaBFo3R2J9XCs09ZUbTXtRt8j@vger.kernel.org, AJvYcCXTMdleiOViYqarrVOrSC6WLVcmY8koXXGV7TozgbuABALy4wWzyatJPeJE7AUHnOMS6uhuB9bMhgyxi8ya@vger.kernel.org, AJvYcCXnGmoxJR7rRH0tp95LazqP9F9YEqUWGuuiHPtbQNcrjYmS8PCndItUkj5sOpY3sxB07pebn+OTbDs2Y7uMyGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd9YE8rEqRI4E4j9CPWbmga/gzi1Fu2TlnmW8ds+BKXhxAb4wc
	OriJGovjB45CUHWxsBXwsDuUtO1J0rMW7HmjOlOJ7nQtHEqGJgutJ+Rn//bEGwVKnN1vHqZG2IA
	E70tPZN1DjNT/ytylF3WV8HBaUXN5W2s=
X-Gm-Gg: ASbGncvX2Pbh5rpT7xuOKks9hjaJzWK/J2X0Sx7Za2+Z4cWOZdZoBXUPfu9b3n5Hpch
	kUvSlVE8hZ44NrHfZ/6iq6YzciYWOnglbn57ltlwpVQyTZuWN3+veTYaqhDKa0SOKZ5q9M+RgKf
	H0sV5zYFWTJObal+yO/WLV6t50iku4SaZNE16A73XlJb5Byie1o13lX76885DHHIHJ5A==
X-Google-Smtp-Source: AGHT+IG65h/nKA2J2iUE51lnHxvDcG5rrR5l2GuLcWFMV2UNRCvs4wib/LqSZVzL+JTCvKRcXMsDTnTi8KGlN+5/w40=
X-Received: by 2002:a05:622a:4406:b0:494:99ed:1607 with SMTP id
 d75a77b69052e-494ae366cacmr298873241cf.3.1747836947371; Wed, 21 May 2025
 07:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
 <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net> <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
 <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
In-Reply-To: <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 18:15:44 +0400
X-Gm-Features: AX0GCFs__lAG49URpvw4duA8KsLg_Jnwr6hpjs3l-kk9UHP4SXqRTeQaxAZH4oo
Message-ID: <CABjd4YxE4eDYt7MEZCrqHK7G9SuziBYEtWSK35DEUxsMmW60tA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 5:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/20/25 23:20, Alexey Charkov wrote:
> > On Wed, May 21, 2025 at 3:15=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 5/20/25 13:01, Alexey Charkov wrote:
> >>> VIA/WonderMedia SoCs can use their system timer's first channel as a
> >>> watchdog device which will reset the system if the clocksource counte=
r
> >>> matches the value given in its match register 0 and if the watchdog
> >>> function is enabled.
> >>>
> >>> Since the watchdog function is tightly coupled to the timer itself, i=
t
> >>> is implemented as an auxiliary device of the timer device
> >>>
> >>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> >>> ---
> >>>    MAINTAINERS                   |  1 +
> >>>    drivers/watchdog/Kconfig      | 15 ++++++++
> >>>    drivers/watchdog/Makefile     |  1 +
> >>>    drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++=
++++++++++++
> >>>    4 files changed, 97 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca35=
56260662dab469ed091 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >>>    F:  drivers/video/fbdev/vt8500lcdfb.*
> >>>    F:  drivers/video/fbdev/wm8505fb*
> >>>    F:  drivers/video/fbdev/wmt_ge_rops.*
> >>> +F:   drivers/watchdog/vt8500-wdt.c
> >>>    F:  include/linux/vt8500-timer.h
> >>>
> >>>    ARM/ZYNQ ARCHITECTURE
> >>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >>> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97=
f6e3ee868bd3bf1534a 100644
> >>> --- a/drivers/watchdog/Kconfig
> >>> +++ b/drivers/watchdog/Kconfig
> >>> @@ -2003,6 +2003,21 @@ config PIC32_DMT
> >>>          To compile this driver as a loadable module, choose M here.
> >>>          The module will be called pic32-dmt.
> >>>
> >>> +config VT8500_WATCHDOG
> >>> +     tristate "VIA/WonderMedia VT8500 watchdog support"
> >>> +     depends on ARCH_VT8500 || COMPILE_TEST
> >>> +     select WATCHDOG_CORE
> >>> +     select AUXILIARY_BUS
> >>> +     help
> >>> +       VIA/WonderMedia SoCs can use their system timer as a hardware
> >>> +       watchdog, as long as the first timer channel is free from oth=
er
> >>> +       uses and respective function is enabled in its registers. To
> >>> +       make use of it, say Y here and ensure that the device tree
> >>> +       lists at least two interrupts for the VT8500 timer device.
> >>> +
> >>> +       To compile this driver as a module, choose M here.
> >>> +       The module will be called vt8500-wdt.
> >>> +
> >>>    # PARISC Architecture
> >>>
> >>>    # POWERPC Architecture
> >>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> >>> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be=
3734fe6e701f753d45b 100644
> >>> --- a/drivers/watchdog/Makefile
> >>> +++ b/drivers/watchdog/Makefile
> >>> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) +=3D msc313e_wdt.o
> >>>    obj-$(CONFIG_APPLE_WATCHDOG) +=3D apple_wdt.o
> >>>    obj-$(CONFIG_SUNPLUS_WATCHDOG) +=3D sunplus_wdt.o
> >>>    obj-$(CONFIG_MARVELL_GTI_WDT) +=3D marvell_gti_wdt.o
> >>> +obj-$(CONFIG_VT8500_WATCHDOG) +=3D vt8500-wdt.o
> >>>
> >>>    # X86 (i386 + ia64 + x86_64) Architecture
> >>>    obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o
> >>> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-=
wdt.c
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1=
d28e955f00bef00e9db
> >>> --- /dev/null
> >>> +++ b/drivers/watchdog/vt8500-wdt.c
> >>> @@ -0,0 +1,80 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> >>> +
> >>> +#include <linux/auxiliary_bus.h>
> >>> +#include <linux/container_of.h>
> >>> +#include <linux/io.h>
> >>> +#include <linux/limits.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/types.h>
> >>> +#include <linux/watchdog.h>
> >>> +#include <linux/vt8500-timer.h>
> >>> +
> >>> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> >>> +{
> >>> +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> >>> +     u64 deadline =3D info->timer_next(wdd->timeout * VT8500_TIMER_H=
Z);
> >>> +
> >>
> >> wdd->timeout is the soft timeout, which may be larger
> >> than the maximum hardware timeout. That means you'll need
> >> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
> >> * VT8500_TIMER_HZ" as parameter to the timer_next call.
> >
> > Indeed. For some reason I thought the core splits up large user
> > requested timeout values into at most max_hw_heartbeat_ms long chunks
> > and feeds those to the driver via the timeout field, but now I see it
> > doesn't.
> >
> > Do I get it right that the core worker will try and do its last ping
> > of the hardware at exactly max_hw_heartbeat_ms before the user
> > specified deadline?
> >
>
> Where do you see that ? In the watchdog core:
>
>          hw_heartbeat_ms =3D min_not_zero(timeout_ms, wdd->max_hw_heartbe=
at_ms);
>          keepalive_interval =3D ms_to_ktime(hw_heartbeat_ms / 2);

This comment [1] which follows the lines you've pasted: "To ensure
that the watchdog times out wdd->timeout seconds after the most recent
ping from userspace, the last worker ping has to come in
hw_heartbeat_ms before this timeout."

I'm not exactly sure I'm following the code path there 100%, so wanted
to double check. Meanwhile, I've just sent a new version [2] adding
the min function as you pointed out.

[1] https://elixir.bootlin.com/linux/v6.14.6/source/drivers/watchdog/watchd=
og_dev.c#L120
[2] https://lore.kernel.org/all/20250521-vt8500-timer-updates-v5-0-7e4bd11d=
f72e@gmail.com/

Best regards,
Alexey

