Return-Path: <linux-watchdog+bounces-4692-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7BCBA011
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Dec 2025 00:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23E6430050B1
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66355239E60;
	Fri, 12 Dec 2025 23:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLhQJ5YK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F151DF27F
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580447; cv=none; b=MFc4+y3xFiarYwrHRZMm3eHQAME0u8E+6MZQZXHAm3dwrep6rhAQauAi26M1taGN/T3QgZUW0zlsKLaxnKLArlHSORMyjyO2G09cMF9eMGTFv0f/NABqFQTFvIrDPPxu/cK3pR56QgBSWpXLrM95+njZqWLpdhL2eX+aDp4l1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580447; c=relaxed/simple;
	bh=s9Mc1vZ+0rymhY8seT0ltljQ0q5u4/taQzf3+pIQ0NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2WWlxOajZOHLdZgzYNCx56UJFm8mZhulJfL36q9VYJ0Dm9qiL3Rma+y+8nZ1Qb/hegVDvgz4ARBZEPTLIGp/N3xZtS2THjgIN9sWNIE+PQGldtvCMSv5s4OOeI2+m2X8xchRy6wJUtiNFQuAK/htXGRbxIdW4VDVCG6IrFdnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLhQJ5YK; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1316423137.1
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 15:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765580444; x=1766185244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SrSAHQbNXvUWM85AMeYWvz8TNfdVV+k1BlDj9dF878=;
        b=BLhQJ5YK2G9QJYgyAeKs0FHVGHALy8K6yHfbwFkUeDL/NuF6mw1SHCUYJfmMHxiDOV
         GoHPen+r6+pB4B/ckHoR1UCzILMooyTxBp66GrTaiiAhoQ26sjQbLZoYqrE4ueHaJuAZ
         3vg7aa/6t9Qf8k0pT1sDWQHQUO+uigZ+0LylFket3+0obHxw9sBaK2eH94DlxB1QbYEW
         8nD+fHiAR1PZWszWrj1Uwnh7I51q7bliP6N9N+MNmfJqcCVfD/FYmFWSjopQDu1O88MU
         DY/EDJZ/DiELBLKalLYeLgtOvZ0cQ7lhahGd9U7TsaDx6UtRa93pM0ZyVhaqvkCNriu6
         BdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765580444; x=1766185244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SrSAHQbNXvUWM85AMeYWvz8TNfdVV+k1BlDj9dF878=;
        b=TB2B//PdtYLceRqPC2ZKgLIi4UM5muTvEY9+P+PDRQhClOVxyLALeFzyfGAIydUr4P
         2UtKVUtlgA3o/Myoe/wXQ+mN7v18BAhROaEfRALTU9GKjxWo+z/v5vnUb3ut21X2ZKHI
         KMJX0cDwgHZ4D8SwuNpOPiuFzgTZJEzMeuL5SgycmgrLlDCEXEugFyHfPVBJc1EJLTzC
         8TgmDhYIJGDDkomhKLeBNBVi/Mza0ei1CrVDHnPD9ygVvog9Pg8x7JUfI+oxgiKhp/yX
         fXURuWq0z/Nidv2zS98m0RLdNLMzFHDI4O1Sds7sEg9bErbZl/fiovsEVq1fzcRrHz3U
         u14A==
X-Forwarded-Encrypted: i=1; AJvYcCWfviNZ3XYgDnaSkIdZfehiB4bbb6dq33sVQ3tnout45R7BJ/DLarACI8FCYMY3XYnSs4+jRCORpDUiZOFqzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCeJdiMcxqWwRkftw36eJ0sXsI0f0DEr3KjJ/w2AH48/WVEO8q
	B0h++oNA4oHe4u9iziTO+IEHjQEl2LN0XdFenNRkbtQNoNfMitfpxH5VNIlcYvs7K2Sx12IfhZb
	Dpz87tB3oOuezFnlxBT0gQ8d/d3xvRtQ=
X-Gm-Gg: AY/fxX7RSjph323GedhPuCW7BAxabjP1rwyqhdqTAIQ4IMrYSf7yUcdZgdXV9ZZ1p7c
	dkj/MpQuS3OClK4/OLC05kgQbUN3Oa9SC8x64MTVKd1cFQx+6ktTZ4vTEbpLHex6Zlco57rVxe9
	zM9A7c1no8L80sn+0osEsAdYU6Svl1geaVPMEGb5TU/iCMVAcbnPCmRQ/Rez2SKroEySOg4X9Ni
	p5OipLYZlyBLqbt0QbqjkBGTdIMh2AOvTTJTbt2d8EaBpd7Gk2HPSPH7yV7lvE3skfYiw==
X-Google-Smtp-Source: AGHT+IHKpLAWL0hv2q6ijwXHxn4oxioZFgjdeVF6X+x813arxAao6wwWKjwd8pZ5B42d/7l/BRgeJ1XoY14W/IpH3To=
X-Received: by 2002:a05:6102:6d0:b0:5db:d36c:89d4 with SMTP id
 ada2fe7eead31-5e8258ff070mr1613743137.3.1765580444390; Fri, 12 Dec 2025
 15:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net> <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
 <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de> <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
 <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de> <CADvTj4qWfq4OgGfYECuepazbwNWWhtH7qy6cAzCYeFKYDFGt-w@mail.gmail.com>
 <D6B291A1-0657-4DA6-A7F8-40C19AB9064D@exactco.de>
In-Reply-To: <D6B291A1-0657-4DA6-A7F8-40C19AB9064D@exactco.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 16:00:33 -0700
X-Gm-Features: AQt7F2per3DTyxna00lxQ_Wbkd2IkMscwi10TGQ4-Y3ZdzlKjSEl7w-dyWhv_fw
Message-ID: <CADvTj4r+SJ6+jbOOkdjoiZFqwMFx2XLkHu6kwkaewW5a2w71aA@mail.gmail.com>
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:44=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.de> wr=
ote:
>
>
> > On 12. Dec 2025, at 23:41, James Hilliard <james.hilliard1@gmail.com> w=
rote:
> >
> > On Fri, Dec 12, 2025 at 3:34=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.de=
> wrote:
> >>
> >>> On 12. Dec 2025, at 23:28, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
> >>>
> >>> On Fri, Dec 12, 2025 at 3:16=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.=
de> wrote:
> >>>>
> >>>>
> >>>>> On 12. Dec 2025, at 23:04, James Hilliard <james.hilliard1@gmail.co=
m> wrote:
> >>>>>
> >>>>> On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-=
us.net> wrote:
> >>>>>>
> >>>>>> On 12/12/25 12:17, James Hilliard wrote:
> >>>>>> ...
> >>>>>>>  +       /* wdt already left running by firmware? */
> >>>>>>>  +       if (_wdt_running()) {
> >>>>>>>  +               pr_info("Left running by firmware.\n");
> >>>>>>>
> >>>>>>>
> >>>>>>> I'm wondering, is there a way other than looking at dmesg to iden=
tify if
> >>>>>>> a wdt was left running by the firmware? I'm thinking having an io=
ctl or
> >>>>>>> similar could be useful as a way to notify a user that a BIOS or =
firmware
> >>>>>>> configuration change may be needed.
> >>>>>>>
> >>>>>>
> >>>>>> This is not a bug, so there is no need to notify the user in the f=
irst place.
> >>>>>> The only reason for accepting the message is that I was tired argu=
ing.
> >>>>>> It is even misleading, because loading the driver, starting the wa=
tchdog
> >>>>>> by touching the watchdog device, unloading it, and loading it agai=
n will
> >>>>>> likely trigger the message.
> >>>>>
> >>>>> Yeah, I'm aware it's not a bug, I'm just thinking it might be good =
to have
> >>>>> watchdog drivers record the initial running state.
> >>>>
> >>>> The kernel logs so much pointless random stuff; an info about a
> >>>> running watchdog timer is more than warranted in this case IMHO.
> >>>> It wasted quite a bit of my valuable time.
> >>>>
> >>>>>> Userspace can check if a watchdog is running by reading
> >>>>>> /sys/class/watchdog/watchdog<index>/state. Do that after loading t=
he driver
> >>>>>> and before starting the watchdog daemon and you'll see if the watc=
hdog
> >>>>>> was running when the driver was loaded. But that doesn't mean it w=
as
> >>>>>> running when the system booted; it only means that the watchdog wa=
s running
> >>>>>> when the driver was loaded.
> >>>>>
> >>>>> Hmm, this seems impossible in some configurations, AFAIU systemd's
> >>>>> watchdog is integrated into PID 1, so loading a watchdog daemon lat=
er
> >>>>> doesn't appear possible.
> >>>>>
> >>>>> Maybe it would make sense to have a sysfs variable like
> >>>>> /sys/class/watchdog/watchdog<index>/initial_state so that
> >>>>> there's a way for userspace to determine if a watchdog was
> >>>>> already armed by the time the driver was loaded?
> >>>>
> >>>> This would be quite wasteful overkill for something that unimportant=
.
> >>>> It is rare that firmware leaves a watchdog timer enabled in any case=
.
> >>>
> >>> I think your presumption that a watchdog is unimportant is wrong,
> >>> in my case I want to identify systems and send alerts if it's detecte=
d
> >>> that a watchdog was NOT armed by the firmware.
> >>>
> >>> I manage a bunch of x86_64 based embedded systems and
> >>> we always want the watchdog enabled, including in the BIOS,
> >>> however unlike on your system the watchdogs on my systems are
> >>> disabled by default and must be manually configured in the BIOS.
> >>> We do still arm them from Linux either way but it would be nice
> >>> to warn users that their systems have bad BIOS settings, on the
> >>> systems I work with failing to arm the watchdog in both the BIOS
> >>> and Linux can result in the watchdog failing to fire when we need
> >>> it to under some circumstances(we're not sure exactly why this
> >>> happens but failing to arm the watchdog in the BIOS can result
> >>> in the watchdog not always firing if the system freezes during a
> >>> reboot from what we can tell, although it's difficult to reproduce
> >>> this issue in our hardware testing lab).
> >>
> >> Instead of adding new kernel state, you could probably just read
> >> the initial state as suggested by Guenter.
> >
> > As I mentioned earlier, I don't think we can read initial state since
> > AFAIU systemd PID1 will immediately arm the watchdog prior
> > to anything else running, so by the time we could read the state
> > variable the watchdog would have already been armed so the
> > state var would be meaningless in regards to determining if the
> > firmware armed the watchdog.
>
> You can either adjust systemd accordingly or add a /sbin/init
> wrapper for systemd to check the state before executing init.

This seems super hacky to me and likely to cause weird issues.

I'm thinking recording initial_state would be probably something
that makes more sense to have for all watchdog drivers that have
the ability to read the initial state at least, not sure how common
a use case that would be but I think it would be helpful for debugging
watchdog issues in general, especially on systems that might
expose multiple types of watchdog times with different drivers.

> With the added benefit of working with older kernels.

I don't think that's all that important. When updating we use A/B
partition rotation and always swap both the userspace and kernel
at the same time so that we don't have to worry about that sort of
issue at least for our use case.

>
>         Ren=C3=A9
>
> --
> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 https://patreo=
n.com/renerebe
>

