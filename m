Return-Path: <linux-watchdog+bounces-4688-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7CCB9EFA
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16EC030000B9
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0322E201033;
	Fri, 12 Dec 2025 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPnjsd+F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571C1D5CC6
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578528; cv=none; b=g/f8H/hfKHbxzOURS37sDI0gxWBQn8v3rDYCeAPu43qd7gUBkMNs/VrQyE514/wzdvY0mHuvNqrYtuH6TXfJmChRA/XG3oc+HmTBI+ngxglV6fHyLJtSw8xF2aDFQwHQgN6hOhTRFvZDSkW40vMTSu9LVUM9Ck0AcX2QUOcOafM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578528; c=relaxed/simple;
	bh=mtQMoHnGWwcw4V66tXiiXNplnxzjPvnKEgaOK2vSxYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MH1vujQxH9T1tmnf/nLC8ilIW6rfm45Xbb2a0m+WBC+bereFywzoNLEECl069PW1qcR00AS6eIAqlgYG+fkII5gJQnT4sB0KSij9acyguQU61XPMeYIXsb+kuHGd/AHJw/6epN/Z1/YOw6Pktiraa2eyP+zUJSnqdAQFslQ8t94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPnjsd+F; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso1091319137.0
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 14:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765578526; x=1766183326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onjgbltRJ6XQwkv2zYHtXPVMkX8YaRQO/Gad02SilSI=;
        b=RPnjsd+FFzGBRTv2UVQ2Ip5FE+fv330MLsj/iaO1Bvk9acrCkzFC/9TM5Qzr13f78z
         xzoFGh71pm5EpFezB0g6BPUEEIn4zXqDqfwo3omw4MH41trFZcD7frmF8SiSZaIAjWvJ
         yKWrnv2kw9yHG+KA8OnmXH+uDzEkOYbWS1/8FNEZfnnlvyGhVahsLk6iz8VQ7KsX6Mkk
         DqghzIe2lpJr0hkOgendEe+zDOm0G52am9VynqvkYqRFx/GEKkLR1pgdzEUxlyn371bn
         bbSNKV964OGD+8C+1RHWRDxeUiWtqbtzxLGRxVU+Ad5hyJFv5yC3RG3r7wImyRnl44DG
         LNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578526; x=1766183326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=onjgbltRJ6XQwkv2zYHtXPVMkX8YaRQO/Gad02SilSI=;
        b=gGqxf51O7jPQDT6A5q7tXNlnIk80AL8tXeLB/OzlUylsfr5VukJxEE3oc/iAISsLti
         L4xiBc4Q/4H+d/5wI90S3OUsSSJ/xzaM9ycDdvGWaIp4LQ1ibB39NX8XI0fTxArerRuJ
         Q2Q1lYhylG5SR6E1J+P3Hp/HWFxQwk1riS0RJT4b5t8R2kGNMucJk4XSVyuOQUqYncew
         pD/8tTHj7F01m7vEuIPQ0/pFEi8w0g7jR8ZTbm30ASRXDG0f1/1IQ8/fpLlb7e2YNpoI
         qIWzW8vpDBFoVIaKCEq8Xa9P6+cOVMB/g9CBqRUJwOj9jPkf+TlDRe4vqVl2OvgZ/u9Q
         ZCIw==
X-Forwarded-Encrypted: i=1; AJvYcCUiW+wNJGD4QAu2N3ORufmhe30l9a9DMgzPryjJ7dfLycFFbuU/d07OqnDj76nqXlx71RpMHQ607R8mP5OoKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ul1FvglvUM0/0Ihccic3MYPwRy+KRZTzvO2jfj4dSARffUIE
	SUMWrUy1yJ/btNGsT1PhxiEInWZn32W1vvvjDbBEb2ckjmPML1t0ZgtzCPa5BxS+/DsByv/dqTM
	iwvSrQco6YBkN4gfEf28jwzQWr4IDM+AVeWYB
X-Gm-Gg: AY/fxX7Cy/H1wgCD13JjOCq5GncuBRL5TmbUQMnLRhPg/NOlELS56KYbIVG1FiHwZgl
	YBHUpo9cF0BAi13WxQk3AGyXEPDrtivd78/VK1X3mI4hH6wphZzOWa1UUeqlORqEgEvcGznyh4B
	IVMJP7lMNIqNM2NqHaKzu8qaG/VnMrI9rXYURdRXRygmTy/1mVM4WGBq9LHhNsJ5kR592euK55+
	Re+kW6QCgJm7ggwjrienV5dz5RlWfWfng05wGgC1CcpTXngSu8uksO9+OMAzho36lPgHZKJsBrX
	L0Lf
X-Google-Smtp-Source: AGHT+IGqc6X5GtrjPGlNv1NCDGIO6l7qdQqwI7nkyT65ycp7yP7ha7Dzo4OcwQHy2kemlSlAC/sTwney30WroOSbImw=
X-Received: by 2002:a05:6102:3a09:b0:5de:e881:1a8d with SMTP id
 ada2fe7eead31-5e827861c79mr1432890137.45.1765578526129; Fri, 12 Dec 2025
 14:28:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net> <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
 <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
In-Reply-To: <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 15:28:35 -0700
X-Gm-Features: AQt7F2oBJJQMECVC0gTdzA15EfI2VzBcLLaHDpjvilfnmcZOJfBJ_P-XqtW_UtU
Message-ID: <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:16=E2=80=AFPM Ren=C3=A9 Rebe <rene@exactco.de> wr=
ote:
>
>
> > On 12. Dec 2025, at 23:04, James Hilliard <james.hilliard1@gmail.com> w=
rote:
> >
> > On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 12/12/25 12:17, James Hilliard wrote:
> >> ...
> >>>    +       /* wdt already left running by firmware? */
> >>>    +       if (_wdt_running()) {
> >>>    +               pr_info("Left running by firmware.\n");
> >>>
> >>>
> >>> I'm wondering, is there a way other than looking at dmesg to identify=
 if
> >>> a wdt was left running by the firmware? I'm thinking having an ioctl =
or
> >>> similar could be useful as a way to notify a user that a BIOS or firm=
ware
> >>> configuration change may be needed.
> >>>
> >>
> >> This is not a bug, so there is no need to notify the user in the first=
 place.
> >> The only reason for accepting the message is that I was tired arguing.
> >> It is even misleading, because loading the driver, starting the watchd=
og
> >> by touching the watchdog device, unloading it, and loading it again wi=
ll
> >> likely trigger the message.
> >
> > Yeah, I'm aware it's not a bug, I'm just thinking it might be good to h=
ave
> > watchdog drivers record the initial running state.
>
> The kernel logs so much pointless random stuff; an info about a
> running watchdog timer is more than warranted in this case IMHO.
> It wasted quite a bit of my valuable time.
>
> >> Userspace can check if a watchdog is running by reading
> >> /sys/class/watchdog/watchdog<index>/state. Do that after loading the d=
river
> >> and before starting the watchdog daemon and you'll see if the watchdog
> >> was running when the driver was loaded. But that doesn't mean it was
> >> running when the system booted; it only means that the watchdog was ru=
nning
> >> when the driver was loaded.
> >
> > Hmm, this seems impossible in some configurations, AFAIU systemd's
> > watchdog is integrated into PID 1, so loading a watchdog daemon later
> > doesn't appear possible.
> >
> > Maybe it would make sense to have a sysfs variable like
> > /sys/class/watchdog/watchdog<index>/initial_state so that
> > there's a way for userspace to determine if a watchdog was
> > already armed by the time the driver was loaded?
>
> This would be quite wasteful overkill for something that unimportant.
> It is rare that firmware leaves a watchdog timer enabled in any case.

I think your presumption that a watchdog is unimportant is wrong,
in my case I want to identify systems and send alerts if it's detected
that a watchdog was NOT armed by the firmware.

I manage a bunch of x86_64 based embedded systems and
we always want the watchdog enabled, including in the BIOS,
however unlike on your system the watchdogs on my systems are
disabled by default and must be manually configured in the BIOS.
We do still arm them from Linux either way but it would be nice
to warn users that their systems have bad BIOS settings, on the
systems I work with failing to arm the watchdog in both the BIOS
and Linux can result in the watchdog failing to fire when we need
it to under some circumstances(we're not sure exactly why this
happens but failing to arm the watchdog in the BIOS can result
in the watchdog not always firing if the system freezes during a
reboot from what we can tell, although it's difficult to reproduce
this issue in our hardware testing lab).

>
>         Ren=C3=A9
>
> --
> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 https://patreo=
n.com/renerebe
>

