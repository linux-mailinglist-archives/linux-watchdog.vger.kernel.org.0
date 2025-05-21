Return-Path: <linux-watchdog+bounces-3555-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D85ABEBDA
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 08:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 866353A5290
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 06:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CA7230BC5;
	Wed, 21 May 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGexIUPb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CECBA27;
	Wed, 21 May 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808453; cv=none; b=RDSkSK6I95+AUhCeyeCBA9Cit4kziYmNGVrg46zJNuwqYRq473YPhk/FPXizwKnKAYLWwWf4Q2xhthm6ZjESsUNWJrIMt9FNESzbmT+YGWvGpTPDsdX5wOudgDpleBa3kdXptcJXU7QglXIrWG58KFVXtc8U3e/pjJ2JVgnWAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808453; c=relaxed/simple;
	bh=gE38frMN/JeTXaKFPZ9mTU3IR80HA4hEnJBcNEHgy8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XotK3mqweKPMQyn1BPHR6GobQJbwY1EYAtWDp1MyeXUU6umUR/uAl0b7hRALWfruLGNYiQh76mHNCJadVxfgAPN2FPrwveEH2F9z/AVUjTJX/nlH+eVA3JSo/ooC1JSxh73mVTZuCwQge2//MGVjf9ryj0X5yVfxpVEOGZt2mxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGexIUPb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7cd0a7b672bso431804385a.2;
        Tue, 20 May 2025 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808450; x=1748413250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLhLiGzM45hB2OU8IkkJdEpBj3k3ldSSfXABvEjzrrw=;
        b=EGexIUPbxq6nBjkXDB40Xs65IDgoBCJI91Op+PEYDQbJGKpV5kXV4xnoWr2IJBE42r
         g5XehEHrgfsU4qVbJ3wmkw+9cCYCzb07YXjZ8i6/8s+jNVkJ0iHLheS5VHX28K7qi2yt
         YvtrOrMoK/b7JUiJUuoZNa11KME4PJqxK/E5uLkA1hXxLstnKT2TSb7OOEXE/v1AflYc
         TuTdKwCVrPB7s3hf7th9UkVnKZRvcjtZDstXxA0sSdAWCw27niTf58gEOCoMp4qGYzU2
         5qZS6qL+aYVEMODMA0v90Wt8DPyDjlwJhNUAi9CZodPX7nc1F8qc0ffLFXuCc05jRKWV
         iTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808450; x=1748413250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLhLiGzM45hB2OU8IkkJdEpBj3k3ldSSfXABvEjzrrw=;
        b=r/ZT71MpUtr41HV7TbFgHqUbc4dWQli+CkeztIu1IbmjEy9KbTQr4VFG9X45KXVF52
         W0y60H4TYl/sLsKlCIQPUn4i7daBaRw5YhQZq5Pcc7D10E3MwPwnTcJmDOqw/IebfoTQ
         jUwZTHNMHyyo1yXH0982dZrj82D6Nx/Zqt1seqtX3FxZBEm6DXlUjpCWvklM26ZHmzgw
         0nRUZG2kRTDw1OvT4AIqFM5RzPj2UuAYmrPXQgCEZcerkV+vqkMTxClkQLl6KRNuOLPa
         dv/uPmW43tnOoKEhhCTNfFdUSuf35onHaxufoUV5vDYcy/dO4/ihCdGiGkjyb7ELhTbm
         /xmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmPBnsKT9aq8IGVhT3rsU+8Ja1yUJ817Sr3Hl3YaARPXsbC6Od7P27mFSpUcpGL4SdJRf6B6tQJP4YVCOq13Q=@vger.kernel.org, AJvYcCWnZ7E/LkWC4nbGkFgXWvBJmIHmrVu9i+4cUnuF11vaZ8KTCPftdr1385slakchFENUQOzca/l8j1fq@vger.kernel.org, AJvYcCX/4INoXOxH//Ky8aRyIOpp4oHtdTpcFeP6FZFKBLt3awlzMKBFSxSw6DAkewTSd8d2NhBMCGnW/KWfYvRr@vger.kernel.org
X-Gm-Message-State: AOJu0YyCc+AKLIY9r7YcH6hZH72PLgpVViEV747l2iPcL0TYpFbxUUta
	BIwcEixls57kXLjJIOTAxbL/hBPZQaTvcfNvYTm/iHUpMj6WwhfIVopxn1uQkJTYjGu+oqTqEmR
	HvZWhl2ESNzKjVil43aZYtvCVdzNTBy4=
X-Gm-Gg: ASbGncu4t8boDV6J3/k9riKsqryjK//FkA2cyJDLxS9tQJ7LiL+v4GUevApnkYJosZ5
	vFSQYIvDNqK7clnkDQ/tCGhm4EbsuxVTmcPGlGtLQiQWjLkoLlR+zcId7tqXP8alz/fRboYEG3f
	r71NQ6THvJx9KUbBok9ONhZJSimhQVlApdLw24qUMhZ8SdUa/z65S1LIE/KALZ22zlQ1QnjULFj
	d+C
X-Google-Smtp-Source: AGHT+IHQH0M4abcXZ9UcUrAXrorTjVO+BBeR2ZeH9Mp2Y0MovIJp2bP045sv7bTxDr7At2nGf5HnsY/U+aWu0hD2Ung=
X-Received: by 2002:a05:622a:418a:b0:48e:ef59:db50 with SMTP id
 d75a77b69052e-494ae3dffbdmr356956261cf.31.1747808450026; Tue, 20 May 2025
 23:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com> <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
In-Reply-To: <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 10:20:46 +0400
X-Gm-Features: AX0GCFu7nbWcnctAyXMfHnwG2aQXQ0NvTnyt98ffoC7G_taLGMiut-Sz-MFKf-Q
Message-ID: <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
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

On Wed, May 21, 2025 at 3:15=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 5/20/25 13:01, Alexey Charkov wrote:
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
> >   MAINTAINERS                   |  1 +
> >   drivers/watchdog/Kconfig      | 15 ++++++++
> >   drivers/watchdog/Makefile     |  1 +
> >   drivers/watchdog/vt8500-wdt.c | 80 ++++++++++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 97 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556=
260662dab469ed091 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
> >   F:  drivers/video/fbdev/vt8500lcdfb.*
> >   F:  drivers/video/fbdev/wm8505fb*
> >   F:  drivers/video/fbdev/wmt_ge_rops.*
> > +F:   drivers/watchdog/vt8500-wdt.c
> >   F:  include/linux/vt8500-timer.h
> >
> >   ARM/ZYNQ ARCHITECTURE
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6=
e3ee868bd3bf1534a 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -2003,6 +2003,21 @@ config PIC32_DMT
> >         To compile this driver as a loadable module, choose M here.
> >         The module will be called pic32-dmt.
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
> > +
> >   # PARISC Architecture
> >
> >   # POWERPC Architecture
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be37=
34fe6e701f753d45b 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) +=3D msc313e_wdt.o
> >   obj-$(CONFIG_APPLE_WATCHDOG) +=3D apple_wdt.o
> >   obj-$(CONFIG_SUNPLUS_WATCHDOG) +=3D sunplus_wdt.o
> >   obj-$(CONFIG_MARVELL_GTI_WDT) +=3D marvell_gti_wdt.o
> > +obj-$(CONFIG_VT8500_WATCHDOG) +=3D vt8500-wdt.o
> >
> >   # X86 (i386 + ia64 + x86_64) Architecture
> >   obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o
> > diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wd=
t.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d2=
8e955f00bef00e9db
> > --- /dev/null
> > +++ b/drivers/watchdog/vt8500-wdt.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/container_of.h>
> > +#include <linux/io.h>
> > +#include <linux/limits.h>
> > +#include <linux/module.h>
> > +#include <linux/types.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/vt8500-timer.h>
> > +
> > +static int vt8500_watchdog_start(struct watchdog_device *wdd)
> > +{
> > +     struct vt8500_wdt_info *info =3D watchdog_get_drvdata(wdd);
> > +     u64 deadline =3D info->timer_next(wdd->timeout * VT8500_TIMER_HZ)=
;
> > +
>
> wdd->timeout is the soft timeout, which may be larger
> than the maximum hardware timeout. That means you'll need
> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
> * VT8500_TIMER_HZ" as parameter to the timer_next call.

Indeed. For some reason I thought the core splits up large user
requested timeout values into at most max_hw_heartbeat_ms long chunks
and feeds those to the driver via the timeout field, but now I see it
doesn't.

Do I get it right that the core worker will try and do its last ping
of the hardware at exactly max_hw_heartbeat_ms before the user
specified deadline?

> > +     writel((u32)deadline, info->wdt_match);
>
> Can deadline overflow ?

Yes. The underlying hardware counter is a u32 value incrementing at
VT8500_TIMER_HZ and continuing past wraparound. This register sets the
next match value: once the hardware counter reaches the value of
(u32)deadline (which might be after the counter wrapping around iff
deadline > U32_MAX) the system resets. Perhaps it warrants a comment
in code.

Thanks for your review, Guenter!

Best regards,
Alexey

