Return-Path: <linux-watchdog+bounces-3020-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE5A47971
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Feb 2025 10:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 419E87A251C
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Feb 2025 09:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203C822655B;
	Thu, 27 Feb 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTgtBK/J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98C270024;
	Thu, 27 Feb 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649211; cv=none; b=H4M7Qy5RboZ+oCHND+NnfVJsMER597uwG477YTLRXinI7W3HVYDRfSnEnAv1s2V68sV1SmZspDGcOndK3p2+v8D1SaDLMtsh5l2BqvuDve4xmEwn4WrDI4QthHB65/NILh37mFNKDngA399cHI6TcV5GvroqmN3khKXJ064ExIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649211; c=relaxed/simple;
	bh=G56e6T7N0AS1QUnn4c+GxR6le/4/uvsYzyrCw8JfIDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nosf0n37JcA7IrRfpPVuYWczUN99bOIOpuI2igemPGPA13YbkeHXNE5WHblL8UiqY7K8c94ns3vGBj0pwQNqsxJ0RBtALcWu9obawK+/VCvJxzMep6mihqSPcSG7UY96IYRDI0ixS/N91MiuHJOuULOlN2GvnmJixOwlhFv6ads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTgtBK/J; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e3b3d432so361488f8f.2;
        Thu, 27 Feb 2025 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740649207; x=1741254007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=FTgtBK/JgCbIsNj2j5kgq0q80z1xkkbJ9PW/6kg2Ah0V94BYKhaZpZPdt+SuXQzvPZ
         i/iHtmEnUDxmguQDLchOWWV+nJgLGrZOrIA0xKf6hjguqxitWkgTpUlrIYh6+npUHikU
         pcP44DHuI1yHtGdGJMsW0kUC/QUheIioR0qfLa9C8II0CYXVhy6GCvbyx8xSYry8yUIO
         i/8EKcLeTZejZONwCsFVIxcscGGVnrxoMy+LJp3NqZQcuBsPs3IJaRHJhymKjBbxhwuR
         sQ67CzJSQa43/Vi9KHM177hs3+6hvTviZ3gE9R1TnLM0M0v8KU/jaC96r4ZfBjMIu3qf
         /UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649207; x=1741254007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=KLkgKaJY8NrgRnYtKFeibabJBwNGggGemhC0Onn/2kcNZbNipSznOaAla92BuynyTc
         tZB+hZSv3SXWi8rSfr8wzBWxn0gu7Kceh80/qCb8rkLVPPVouIB298kRieWhxzlWnR0r
         uUC6ropfYjC9hL0O/AxZ8/+w6Q1G6lS9b4KhuRQy++0g2y1rrKr33bEPsn9iXxpWrAxe
         rRfhJkCUIjuDB43228QJBL7xGuL4905Q3Uh5xofwcigHlY8APDT4HeIIzzcEnTMTgHne
         twK08sN2VRhg1vgU+yTjGnF9t5PKutPr5CLD2nqzX6pXkwOrMKY1R3E12MDzpFImfFV5
         aIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0tT3thWKqOa+oG45UuV69AZUhO/1yFSibQFNr0ezQhOPvoulBkB5zsxNZgVCvx9GdDQj+Jk6S0rmtUjsa/g=@vger.kernel.org, AJvYcCWiX9UOzrukPPQ8J4RyjLQ/8cqd1snSWTWGtiBdnGZRpburHeZiMvIDoN4hGg4wmm4/RNtuqy8J63KaSMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNunfFCyW5YrzF7mkNpFkLRX9Urb5ZNr6jT5Mso+47ytk15yr
	KHQRkqYFI1DlnRSmYtX3zEKeltoPjl1oiIFX/CvhloTckPsOuBbC5HH4RzlYRVzkB+a3NeQBILi
	co0eiUHgAhuTSjjT4X3Z6JdFMISI=
X-Gm-Gg: ASbGnctunoXalkakZmZ8bL3j6WQ9U4BLLpqnkdp/Q0KJEYGsJda6OV9fiDnQUb3Je8L
	/Gj7DYC9uOEtDAkt4VnPJfi+3Q1kyi5URTNxMZ5NfV+rSbT4AMWLUcNKNedGLHEf2luKpM+jrdj
	kyh2SWx5k2
X-Google-Smtp-Source: AGHT+IHVxpKqJjF6Oy3UiSsoNMUk3O6YtCQmwyuh/+RElalPL6ZKmZpdr7GUuDOpP7wb1pIYfzRVat/b4jfY+6rXg4Q=
X-Received: by 2002:adf:ed4c:0:b0:38f:476f:e176 with SMTP id
 ffacd0b85a97d-38f6ec63868mr17667271f8f.31.1740649207536; Thu, 27 Feb 2025
 01:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
 <20250225143638.1989755-2-regis.dargent@gmail.com> <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
In-Reply-To: <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
From: =?UTF-8?Q?R=C3=A9gis_DARGENT?= <regis.dargent@gmail.com>
Date: Thu, 27 Feb 2025 10:39:56 +0100
X-Gm-Features: AQ5f1JrSA6DaEhL-Nslpn5PJiSZvOfwBqv4VOqRh3wNZ-79IdfFHdRc-00phYLw
Message-ID: <CANarb_ci_vgBMU4XejMwOwxKjGVccfMuweUQA7JwbNzWZqotuw@mail.gmail.com>
Subject: Re: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled
 after probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 f=C3=A9vr. 2025 =C3=A0 22:51, Guenter Roeck <linux@roeck-us.net>=
 a =C3=A9crit :
>
> On 2/25/25 06:36, Regis Dargent wrote:
> > If the watchdog is already running during probe, let it run on, read it=
s
> > configured timeout, and set its status so that it is correctly handled =
by the
> > kernel.
> >
> > Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> >
> > --
> >
> > Changelog v1..v2:
> > - add sunxi_wdt_read_timeout function
> > - add signed-off-by tag
> >
> > Changelog v2..v3:
> > - WDIOF_SETTIMEOUT was set twice, and other code cleanup
> > ---
> >   drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.=
c
> > index b85354a99582..d509dbcb77ce 100644
> > --- a/drivers/watchdog/sunxi_wdt.c
> > +++ b/drivers/watchdog/sunxi_wdt.c
> > @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_de=
vice *wdt_dev,
> >               timeout++;
> >
> >       sunxi_wdt->wdt_dev.timeout =3D timeout;
> > +     sunxi_wdt->wdt_dev.max_hw_heartbeat_ms =3D 0;
> >
> >       reg =3D readl(wdt_base + regs->wdt_mode);
> >       reg &=3D ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> > @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_d=
evice *wdt_dev,
> >       return 0;
> >   }
> >
> > +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> > +{
> > +     struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev)=
;
> > +     void __iomem *wdt_base =3D sunxi_wdt->wdt_base;
> > +     const struct sunxi_wdt_reg *regs =3D sunxi_wdt->wdt_regs;
> > +     int i;
> > +     u32 reg;
> > +
> > +     reg =3D readl(wdt_base + regs->wdt_mode);
> > +     reg >>=3D regs->wdt_timeout_shift;
> > +     reg &=3D WDT_TIMEOUT_MASK;
> > +
> > +     /* Start at 0 which actually means 0.5s */
> > +     for (i =3D 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] !=3D r=
eg); i++)
>
> Unnecessary (). On top of that, its complexity is unnecessary.
> The timeout in seconds, except for reg =3D=3D 0, is wdt_timeout_map[reg],
> with values of 0x0c..0x0f undefined. Worse, the above code can access
> beyond the size of wdt_timeout_map[] if reg >=3D 0x0c.

Ok, I prefer parenthesis for (my) readability, but I will remove them.

wdt_timeout_map is not linear, so timeout in seconds is i when
wdt_timeout_map[i] =3D=3D reg, some values of i not corresponding to any
reg value.
reg values of 0x0c and more will end with a timeout of 16s
(i =3D=3D WDT_MAX_TIMEOUT) which will lead to unknown behaviour only
because these values are marked "reserved" in the HW timer documentation.

> > +             ;
> > +     if (i =3D=3D 0) {
> > +             wdt_dev->timeout =3D 1;
> > +             wdt_dev->max_hw_heartbeat_ms =3D 500;
>
> This is an unacceptable API abuse. max_hw_heartbeat_ms, if set,
> should be 16000, not 500. You could set the timeout to 1 second instead.

sorry about that, my comprehension of the documentation on
min/max_hw_heartbeat_ms suggested that they define the time window during
which the HW timer must receive a heartbeat or it will reset.
0-'timeout' defines the time window for the userspace point of view,
meaning that if 'timeout' > max_hw_heartbeat_ms, extra heartbeats must be
sent to HW timer so that the reset can occur only after 'timeout' seconds.

Just to be clear, setting max_hw_heartbeat_ms to the maximum HW possible
value (here 16000ms) means that one cannot use sub-second HW timer values,
while all the watchdog API actually handles them well enough (my tests on
the 500ms HW timer worked good).

For this sunxi driver case, this implies that instead of just reading the
current timeout value from the HW timer (if it was enabled before the
kernel start), I also have to reconfigure the HW timer (to 1sec) if its
timeout is less than a second (the 0 register value).

> Guenter
>

