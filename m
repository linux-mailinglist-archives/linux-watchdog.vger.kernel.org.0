Return-Path: <linux-watchdog+bounces-4690-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F49CB9F9A
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05FB1300B801
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7E82D47EE;
	Fri, 12 Dec 2025 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg+wh8LK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB4221F0A
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579305; cv=none; b=ByA2N/7SOR6Z9rEdAHIpJHgbaw8aDGCyu5OmAXQcmog5s76acxFsEptULNEf3TwFOhYP7RDfAjajKPij1CywAuk2eypTSdZRVzSLqlKWOSC7M4IeVsrnC8E6XwwD8XpBrME59IszjsSDK8CYdmv67DTnUDEWdwsjsaYHWGVdXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579305; c=relaxed/simple;
	bh=OCvuJrteewmTxxnOnG+52PpwVsq7ou6djpgPf3kSByg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFz7tkvUyHn/xyHRnmwAmsw0zJ09VCH2MrhJtT6pXd9nckZBQFOB7l7ix5Xsf78rHqN6nIinEJJou9nvtdYvIsC1YmWfOzDfutXnCebo3y2b/5WeC6jMn/KA/gvjKlH/q7RyBsMneB3F3H32UeEmCo3TvpA02QPAYz43DNOoS40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg+wh8LK; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so665431137.3
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 14:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765579302; x=1766184102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Sak3ngH7dz2GKgNtuAPMH/WzuKP6GwcdV/kovJ0RuQ=;
        b=Fg+wh8LKVhH7saeMia8ECySVjgqb1KFq0eiww2MZtRGkZyuxzVZX6OCuarHNllIvr/
         onZ4hbg00jIWl11C30o5om4iyhhTsCqfrpmv0JcNx/Opvf5dkzzxVwr3tMV30E9xMG/W
         A/cy7EqfkD+fbVAtuoFS2s5y4Fe7YuydfqiVtHzptFaleDF1QZgJHR6dVokweWKm/xbo
         uC9sl6SCw7hsqfaRB42TIzoQSerK1Ctoq7d3hixK1Kk7FPWXZ4BAYhqHpqt0Tyo3soV5
         Cjxqj6nMrHl6iL+ILYyiDDbrt5C5BiKR5SAZ3pI7fSKWpIVeBKzQMkG1xYOW6lsQKSE8
         tEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765579302; x=1766184102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Sak3ngH7dz2GKgNtuAPMH/WzuKP6GwcdV/kovJ0RuQ=;
        b=LmLhm20JmEawjQaOjNbt5gm90EAc9tmOzDgHLMRrvk1ZXTVJSaI8CBMOLWbT1KNK68
         qJuhH43/XEdCF7s97hH4dFdMwUksQymp0IBJ2Sr7QZjrDWmu2XiXXsoz/zjjTds05PSs
         qnz39H9UHd0n/2PmDQJJkfc4PMTgFfvYRAyq1ZuyTg13pOwmsdcFwjpkvI4ODv9SUl6Z
         jw1Bz29n5kHmYgwtKcAcUDjScltKURRw2qUa5i6GqgAf4e+x2IrESRs35IokrQzAX4n4
         ONm0O6j43G+ZX/KkhdZaXYlPS0nBQJwleBs5ykpBEoGJe5hQn7BgsWhWwTUNW99CAtQZ
         Pavg==
X-Forwarded-Encrypted: i=1; AJvYcCWc7WPGVCflMfDoJ/iWw2qyWnvwI/YIkmvlpQSvzaQfj0hS4G3nwTMKEPkAzjtOVu65ugzgVu55T64NitKQdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFTIDVtxhAM2y0E5waSJtZnt67IGTANQ1SkT/RlRH/56McpzB
	vPaAdJMyJ2PFAhNva8iR/z23kMcLVYzO2JGsIEB5OtHiq14Ib2+gMMH+UBlW77c3iwLJxbhvcfW
	jyPayflaG8S5P90B2mGA+Oh491rQ1y0Q=
X-Gm-Gg: AY/fxX4GRlctT5XSXhPD9Tc2h/BxnSdGeCCHUEosvQqiAm8+HzY21DTgdgNa951Z21D
	tm+qWfbpy8LFcp2sasDxH7A9kQF9NB1YJQSQRBZw2XX0MPvXzMtOhkcwrWzQ9SngmhtiFTMS+cf
	uYpCeTcaqWa/ohw9cNF33SL6bi5DFnvIosqoABTrvcvbQYcCzfPOFwr9HUZdR+1t/EegpeNDs65
	NA1k1gt/w6dm8Zb4XfBMWSdp0X0pSJfOdsxMc87gKR/SIW4EDK+f6gvBzEe5Z8e7kSjYQ==
X-Google-Smtp-Source: AGHT+IH93072qCf8/0OiMIpVz9VuM6T5tDEv0+JVEdDvkCIQLylQR//DWCd8urxITviUlpXwjGavm7sbulrHXykHmrs=
X-Received: by 2002:a05:6102:2aca:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5e827840185mr1559889137.32.1765579302340; Fri, 12 Dec 2025
 14:41:42 -0800 (PST)
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
 <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de>
In-Reply-To: <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 15:41:31 -0700
X-Gm-Features: AQt7F2ry4ymWhj_9tfDnNeczfjsLbxRv8D0qQ4MkvOjHbQRVJ-tOouQiG5wil1A
Message-ID: <CADvTj4qWfq4OgGfYECuepazbwNWWhtH7qy6cAzCYeFKYDFGt-w@mail.gmail.com>
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:34=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.de> wr=
ote:
>
> > On 12. Dec 2025, at 23:28, James Hilliard <james.hilliard1@gmail.com> w=
rote:
> >
> > On Fri, Dec 12, 2025 at 3:16=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.de=
> wrote:
> >>
> >>
> >>> On 12. Dec 2025, at 23:04, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
> >>>
> >>> On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>>
> >>>> On 12/12/25 12:17, James Hilliard wrote:
> >>>> ...
> >>>>>   +       /* wdt already left running by firmware? */
> >>>>>   +       if (_wdt_running()) {
> >>>>>   +               pr_info("Left running by firmware.\n");
> >>>>>
> >>>>>
> >>>>> I'm wondering, is there a way other than looking at dmesg to identi=
fy if
> >>>>> a wdt was left running by the firmware? I'm thinking having an ioct=
l or
> >>>>> similar could be useful as a way to notify a user that a BIOS or fi=
rmware
> >>>>> configuration change may be needed.
> >>>>>
> >>>>
> >>>> This is not a bug, so there is no need to notify the user in the fir=
st place.
> >>>> The only reason for accepting the message is that I was tired arguin=
g.
> >>>> It is even misleading, because loading the driver, starting the watc=
hdog
> >>>> by touching the watchdog device, unloading it, and loading it again =
will
> >>>> likely trigger the message.
> >>>
> >>> Yeah, I'm aware it's not a bug, I'm just thinking it might be good to=
 have
> >>> watchdog drivers record the initial running state.
> >>
> >> The kernel logs so much pointless random stuff; an info about a
> >> running watchdog timer is more than warranted in this case IMHO.
> >> It wasted quite a bit of my valuable time.
> >>
> >>>> Userspace can check if a watchdog is running by reading
> >>>> /sys/class/watchdog/watchdog<index>/state. Do that after loading the=
 driver
> >>>> and before starting the watchdog daemon and you'll see if the watchd=
og
> >>>> was running when the driver was loaded. But that doesn't mean it was
> >>>> running when the system booted; it only means that the watchdog was =
running
> >>>> when the driver was loaded.
> >>>
> >>> Hmm, this seems impossible in some configurations, AFAIU systemd's
> >>> watchdog is integrated into PID 1, so loading a watchdog daemon later
> >>> doesn't appear possible.
> >>>
> >>> Maybe it would make sense to have a sysfs variable like
> >>> /sys/class/watchdog/watchdog<index>/initial_state so that
> >>> there's a way for userspace to determine if a watchdog was
> >>> already armed by the time the driver was loaded?
> >>
> >> This would be quite wasteful overkill for something that unimportant.
> >> It is rare that firmware leaves a watchdog timer enabled in any case.
> >
> > I think your presumption that a watchdog is unimportant is wrong,
> > in my case I want to identify systems and send alerts if it's detected
> > that a watchdog was NOT armed by the firmware.
> >
> > I manage a bunch of x86_64 based embedded systems and
> > we always want the watchdog enabled, including in the BIOS,
> > however unlike on your system the watchdogs on my systems are
> > disabled by default and must be manually configured in the BIOS.
> > We do still arm them from Linux either way but it would be nice
> > to warn users that their systems have bad BIOS settings, on the
> > systems I work with failing to arm the watchdog in both the BIOS
> > and Linux can result in the watchdog failing to fire when we need
> > it to under some circumstances(we're not sure exactly why this
> > happens but failing to arm the watchdog in the BIOS can result
> > in the watchdog not always firing if the system freezes during a
> > reboot from what we can tell, although it's difficult to reproduce
> > this issue in our hardware testing lab).
>
> Instead of adding new kernel state, you could probably just read
> the initial state as suggested by Guenter.

As I mentioned earlier, I don't think we can read initial state since
AFAIU systemd PID1 will immediately arm the watchdog prior
to anything else running, so by the time we could read the state
variable the watchdog would have already been armed so the
state var would be meaningless in regards to determining if the
firmware armed the watchdog.

>
>         Ren=C3=A9
>
> >>
> >>        Ren=C3=A9
> >>
> >> --
> >> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 https://pat=
reon.com/renerebe
> >>
>
> --
> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 https://patreo=
n.com/renerebe
>

