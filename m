Return-Path: <linux-watchdog+bounces-3571-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E9AC0606
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 09:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B1677ACD2C
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 07:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBD321CA17;
	Thu, 22 May 2025 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvSA7QOS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790891990B7;
	Thu, 22 May 2025 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899949; cv=none; b=tI7cn+yq+REWFywZV9+kYCXJBlOM+iZ3nfwyDM5lMhnSPoMJlSB3aSLf1PVFEI3iZWFfaSY3Sqtwl7YTr9RdD6od3JojfUXOBCT7ZV12a1OBFLCb4Lka3CHU8iLJeoOJa5c5e2xRi0XW1tXoECeZ8TIKs23hk0Y8H5WtJXHrF5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899949; c=relaxed/simple;
	bh=zY+lXrRwgKHQKa2ZtuH4yodp16PGhqZFM1RmRq3oX9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMcQJXNTlvGCQrvTiu1KqJEVJN3AEPL6/pmPipWN2w/Qa2DxyQNjp8wksjhNTJXeVAY4uH9nsnYsvoiy/OlRorOyft+TKIzq9QuVlfY3Un4EN2DdgqBlr1OHFvLbBGG+RHItqRNtGkB45+y29pV75uXM9K+cWskWNl6u8UFYaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvSA7QOS; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-604f0d27c24so4044289eaf.2;
        Thu, 22 May 2025 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747899946; x=1748504746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzW20nwC4VuWDQE29Tj4IgyVUfkVJ+JnWCtTS9PiDHI=;
        b=UvSA7QOSfSq/Qaq5y0YdXWVEgLYXJzYbb0maA5Mkqv3KkJ2a00frG2WxQVU/xt4j00
         8a1jtXkr9EE4SDVQLxVeq+rYy//WMDNj20Ix/nmpVmPcVY0aGQY9J4tu955DmqUTQFIB
         nBkxJIsEP7eTlnr02Lwe4L5Hc6IPBY9sEEQs7wMMeYkpkqw74Qc88nD1PaEm2keqMq7z
         uPJKfda70dDW2MvRv/LejTHqIQyG2q8+H3K5UWDpY8U/TaoUqUrPR7cTToUMd4kx1M7r
         66nesz9fQ0VJJA3qWD9317SR6wHmWDXqRQFIrZcNpLkPyrIu7uAUF6YjJ3GE50/RoxF/
         HmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899946; x=1748504746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzW20nwC4VuWDQE29Tj4IgyVUfkVJ+JnWCtTS9PiDHI=;
        b=uZMy1uEYjiQzs0p6dleX4Rk0YSRakzKG0umbIkB7EDr4+OfDreN14sW5yOfpVynpHL
         azurAMtY84KgA560rvv4DBRqiSnR7/iMKBpFdMk1z3u+HcpuqA41+/O3f9RcjhJRor6s
         TraGoY5jS7R+W6LY2gDbkBOXE1qtl/U8nD0luFBRyv7Q25vzaOUl2BZqnXP2yLS9+I96
         uFZPWQsQoqjHpx2JigpFmA0MkezWzhu+VH9KA3yJoR32zIoM16U8iu2c75jb0QI4dZJN
         MMeEvIwaNc2a4396sax4aOdZshv7aMYolfk3wSnfLl3hL0tVS+pGkvwiynf/ABYJisxT
         1F6A==
X-Forwarded-Encrypted: i=1; AJvYcCUMHwHGfIkgWRqQ3DBjBeNgW8NcXUrVm/qtZzmaxlwFWkramxDnb3pFExg+WYLTLZlPJC0GXIauj7QMemLKQVM=@vger.kernel.org, AJvYcCW14VVqrjZc06INkDtKesf/tQNsRt/CFgdViIISw/x9jwbV737pVw6DN+FT5eVQ43v0kTJ9V6ZPB/v0nIHq@vger.kernel.org, AJvYcCWS5suHYgD10xOu7/rzuWB2OYje3C6ZbixdzmWYa8ye6MwKDnTRvgccHVa2lV/Fcr3uQh0gNQd8sl60@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55civ+CyX0QJWHumdNOL55W/DNO6j+EgiS8OCJxrKCbRLwAKC
	ydf8xBzUOxjvk2s4Wdhk0ETcACV01FoDUnDgWXRjMN57Kwx9p7vK60XAFqOPFQL3PW6qjpZEtzo
	T0XVQhySbucmWyWk+gtRFv+eTqx7KH+W7XfSfxJY=
X-Gm-Gg: ASbGncvO8j5OBOSxmZkHOF58MC4/ppsBIYxnPawg8vrOJV3IHVW7f9fEowaVq/DmExW
	vuUVbty2KI00848lbiIVgj4sPyjbD/9qlUqLqG90QH+hoOjYjEPtk/OSexjg4Sq/HqpkCqtJg97
	WZ0lfHEJYoTfc+qyz3oIJ10Ghz2QdDihnSr34Rd/44DQ5Q1L47aY1qEQ+2ZlRQTALT9A==
X-Google-Smtp-Source: AGHT+IHx9WwGAeBBgIJ2VZAo/LAtKYEWKxbcrPGYRDL9PPLwEM0HTBz1LK7Lmmv50E3X9O8VXiDRpGFVmpONGdmsjyE=
X-Received: by 2002:a05:622a:244f:b0:494:7ab9:60ad with SMTP id
 d75a77b69052e-494b09397ebmr403217461cf.38.1747899936138; Thu, 22 May 2025
 00:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
 <20250521-vt8500-timer-updates-v5-4-7e4bd11df72e@gmail.com> <aC4MNjZxnQu8b0kR@mai.linaro.org>
In-Reply-To: <aC4MNjZxnQu8b0kR@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 22 May 2025 11:45:33 +0400
X-Gm-Features: AX0GCFv6jhcev6GhPYo0l88C_vd8Mhb7eF6cQfp7Ylfbkj6Kxv47qMniq6WrRRE
Message-ID: <CABjd4Yzv6-9KFC1fXcLQ5XPcbWDWdpYgkZJgNr1ygipVd0PV3A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:24=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 21, 2025 at 05:00:12PM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia SoCs can use their system timer's first channel as a
> > watchdog device which will reset the system if the clocksource counter
> > matches the value given in its match register 0 and if the watchdog
> > function is enabled.
> >
> > Since the watchdog function is tightly coupled to the timer itself, it
> > is implemented as an auxiliary device of the timer device
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  MAINTAINERS                   |  1 +
> >  drivers/watchdog/Kconfig      | 15 ++++++++
> >  drivers/watchdog/Makefile     |  1 +
> >  drivers/watchdog/vt8500-wdt.c | 88 +++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 105 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556=
260662dab469ed091 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >  F:   drivers/video/fbdev/vt8500lcdfb.*
> >  F:   drivers/video/fbdev/wm8505fb*
> >  F:   drivers/video/fbdev/wmt_ge_rops.*
> > +F:   drivers/watchdog/vt8500-wdt.c
> >  F:   include/linux/vt8500-timer.h
> >
> >  ARM/ZYNQ ARCHITECTURE
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..2e59303306feba7e15a015c=
2fce25b1290dc4cbc 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1115,6 +1115,21 @@ config SUNPLUS_WATCHDOG
> >         To compile this driver as a module, choose M here: the
> >         module will be called sunplus_wdt.
> >
> > +config VT8500_WATCHDOG
> > +     tristate "VIA/WonderMedia VT8500 watchdog support"
> > +     depends on ARCH_VT8500 || COMPILE_TEST
> > +     select WATCHDOG_CORE
> > +     select AUXILIARY_BUS
> > +     help
> > +       VIA/WonderMedia SoCs can use their system timer as a hardware
> > +       watchdog, as long as the first timer channel is free from other
> > +       uses and respective function is enabled in its registers. To
> > +       make use of it, say Y here and ensure that the device tree
> > +       lists at least two interrupts for the VT8500 timer device.
> > +
> > +       To compile this driver as a module, choose M here.
> > +       The module will be called vt8500-wdt.
>
> Module is not supported by the timers. That will change in a very near
> future but unloading won't be supported, you should consider tying the
> wdt life cycle with the subsystem it is connected to.

But there's an auxiliary bus between the timer and this module, so it
should be possible to boot a system with the timer initialized as
usual, and then load the watchdog if/when needed. Which also saves a
bit of space in the main kernel image.

Or am I missing anything here?

Best regards,
Alexey

