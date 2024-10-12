Return-Path: <linux-watchdog+bounces-2195-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9F99B103
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 07:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190C328455C
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 05:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7FE2746A;
	Sat, 12 Oct 2024 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1Jctcwj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E91F5FA
	for <linux-watchdog@vger.kernel.org>; Sat, 12 Oct 2024 05:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728709336; cv=none; b=Oz5IkYK9FKi3tJIguog0ZS973TH5dbRxcl2QKczkCLWUgVAQH2845Hrl3zP/mCMwid1DZPPk0CgfPFq5yVzg1pJt/XGpl1uOJMzuh6SiBNMk4UN7jUF00WZBCvzRFjYEXG26Er3qIJXzCixTL2ZybrVSzCQFvi+t7Za6fOK5bLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728709336; c=relaxed/simple;
	bh=sVeCdv7RiAyU+fIsBG9nv4NkdXUIMq4xcwkQAhhHHAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyDz52YlAiuzAxXobqzv10I7qPESqyg0BLf6LTEnLOhvue8tR14YzvsOiv6VP66VTxuk4g5XHPvJPpSjBEdd4b5N776HZR88TJs1IMMRAvJoSZ8zAPWDlgyEnP9eNpqexgNzwTE9t4YezPm4YKNUPzT51rhIIMMK5VtSP1OnQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1Jctcwj; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4a3c8b8cf78so932655137.0
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Oct 2024 22:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728709334; x=1729314134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srtXtOe4NzvAKG4iLyd34O55zcI/IITHcQJU3/jN0p8=;
        b=I1Jctcwjf+K0qI05xCX+AihaN/2iiUu3WYcjtRQQf5IA7IstKO66fxMmxZywRQQ6L6
         T8ECbbS68KQy7sOrriHVMqLxa9M3q92k5MLH+5/Nij0QdOqt4OPfxUHgR9p0aTrHyeoB
         oh1Jnh0yDf9aHMLtTcI2++xWYdm5O8dJVu3/PyzjxgwGJah/bUweckvqfJJa2tJH2ovN
         uS1QchJQvv5FnSIyyWrihVeHadUziOfcIB+teT3UI7CgdjDa9f0AEsgpFoFy8L9GcvLP
         Ckr/lDA/ewJUW8IqFmVO8MuGaUlop3YtLvMF9wawG1WfcN89bmCRiGzLdJ9OoTh+4P9f
         a41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728709334; x=1729314134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srtXtOe4NzvAKG4iLyd34O55zcI/IITHcQJU3/jN0p8=;
        b=tztC3wA6bBMHdJGzVp7yfu7LXdugpTAzBwN1+cEN4Vc2im02tObSyZqctOxDcZ3J4J
         bzxsZM9Cj74l/GUrzEMwCsWKhY9OS/ZIynci+gt2pH+Nsnh8OT/GbhqPpr/zcD8fD/3M
         JifLRa0XcJqHjq+owo/dg3ba8bpGgmgUIHaAx9n2kD8TRJ/UZVG7K5RAj7KphKYBmpJM
         Iim43JzFEz+Hy4fJVeA1/xE1zaZMNpzz1WUcNNkwdzhWB1Ypl7MjRI143uph/I0wQzEa
         sH8mSVi+/okvb7kuifQIK8pCBzBrwissfFsisQ020aSxBIjJ0hC2fDAVedptqHZxA/ZP
         a4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVbKXsHY5OjUPmSu12Cyt4RKzqLDhn+Oj5soRgtQ1+mF3ISZejP6EOfuGiVtJKv3o5Vn/rR4ypyXaWSct02gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgVC0+VwO7ZzvH1CG/+JY7OGdP/1N4IHfQE0Mzr2G7u2c/qGg
	khlZOUY4R5V1UKlFxeVTl3IlddIOVNt75zRUQb4mPqP/E0NYP3NhCjdOo8BQjf/ne1+kgk+61Gt
	dSS1O+/rUkY+MtgvpOWSpVU3JXeqs0Zzd
X-Google-Smtp-Source: AGHT+IFNZD5CNR54hUzO9/7Wp/RteQ5supmMX0prgWhh4THU3ViZFGpYSLOX5ZItdkYawFMMSYNnB1dqwnoI/eW1Wgg=
X-Received: by 2002:a05:6102:18d9:b0:4a4:6858:334a with SMTP id
 ada2fe7eead31-4a4685833c9mr2456004137.27.1728709334017; Fri, 11 Oct 2024
 22:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213094525.11849-1-devlists@wefi.net> <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
 <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net> <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
 <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net> <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
 <b09058ca-9547-4d70-96a7-b7fe6b8beb3e@roeck-us.net> <CADvTj4r3y4W=PwP4aw1TsKpe1pY=SKBTWjfKZJqFe5J-GxNOJA@mail.gmail.com>
 <213f1f7c-aa0a-49b4-a6af-d76a2cbc2299@roeck-us.net>
In-Reply-To: <213f1f7c-aa0a-49b4-a6af-d76a2cbc2299@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2024 00:02:02 -0500
Message-ID: <CADvTj4rmNOrowVyJnyBmWQAu=e=WdV3KVfMJGq1vQ9v=a6ssqQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
To: Guenter Roeck <linux@roeck-us.net>
Cc: Werner Fischer <devlists@wefi.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 5:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/11/24 15:14, James Hilliard wrote:
> > On Thu, Jul 11, 2024 at 3:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 7/11/24 14:09, James Hilliard wrote:
> >>
> >>>> The best we could possibly do might be to add a check for the bit in=
 register
> >>>> 0xf1 and warn the user that they might have to use the ACPI driver i=
f the bit
> >>>> is set. I am not sure if that would be helpful or just add noise, th=
ough.
> >>>
> >>> Do your systems which work with the it87_wdt driver have that 0xF1 bi=
t not set?
> >>>
> >>
> >> I only have one such system left, and the bit is not set on that syste=
m.
> >> I avoid buying hardware with ITE Super-IO chips nowadays since their s=
upport
> >> for Linux is non-existent.
> >
> > Yeah, I got stuck with a fleet of these boards, trying to make the best=
 of it.
> >
> >>
> >>> I'm thinking we should check for that bit and prevent loading the
> >>> it87_wdt driver if
> >>
> >> No. That would create the risk of no longer loading the driver on syst=
ems where
> >> it currently works.
> >
> > Hmm, any idea how likely it would be that the bit could be set on a boa=
rd
> > which the driver works on?
> >
>
> No idea, but I would not want to disable it just to find out with a flurr=
y
> of angry e-mails.
>
> > Or maybe best to have a quirks table with dmi matching to disable the
> > driver on known broken systems?
> >
> >>
> >>> it's set(maybe along with an override param). That way the wdat_wdt d=
river I
> >>
> >> I prefer the less invasive version of logging a message. The user can =
then
> >> block the it87_wdt driver if it doesn't work.
> >
> > Hmm, I build multiple watchdog drivers into the same kernel and somewha=
t
> > rely on the autodetection working correctly as I support multiple board=
s
> > with the same kernel build. It's not exactly trivial to conditionally p=
revent
> > drivers from loading when built into the kernel AFAIU.
> >
>
> Those drivers should never be built into the kernel; they should be built
> as modules, and module load instructions in /etc/modprobe.d (or whatever =
the
> distribution uses) should be used to determine which drivers to load. I r=
eally
> would not want to rely on a bit such as the smi interrupt bit to determin=
e
> if the watchdog is used by ACPI.
>
> This is actually a multi-level problem: Even if there is an ACPI watchdog=
,
> that does not mean that ACPI uses the Super-IO chip for its watchdog impl=
ementation.
> It might as well using the ICH watchdog on Intel systems or the TCO watch=
dog on
> AMD systems. Similar, even if the SMI interrupt bit is not set, it is ess=
entially
> unknown if the it87_wdt driver actually works, because its reset pins mig=
ht not
> be connected. Or, of course, both watchdogs might work.
>
> Assuming the wdat_wdt driver auto-loads on your system (I think it should=
),
> can you write a little script which loads the it87_wdt driver only if the
> wdat_wdt driver is not loaded ?

I'm a bit wary of using scripts to manually choose drivers like this, I
suppose it could work but I'm thinking it may be somewhat brittle.

So I ended up just disabling the it87_wdt driver, but a different batch of
boards also with the it8786 wdt chip we found doesn't appear to have a
functional wdat_wdt and does have working it87_wdt support so I'm now
looking at this again.

I messaged the vendor and they sent me some wdt sample code(that
I still need to test) which is supposed to be for the board that I'm having=
 to
use wdat_wdt on.

It's setting some additional bits(like bit 5) which is interesting.

#include <sys/io.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/io.h>
#include <string.h>

#define BIT0 0x01
#define BIT1 0x02
#define BIT2 0x04
#define BIT3 0x08
#define BIT4 0x10
#define BIT5 0x20
#define BIT6 0x40
#define BIT7 0x80

#define BYTE unsigned char

main(int argc, char* argv[])
{

int TValue;
BYTE data =3D0;

ioperm(0x2e,1,1);
ioperm(0x2f,1,1);

//Enter SIO  Configuration Mode
outb(0x87,0x2e);
outb(0x01,0x2e);
outb(0x55,0x2e);
outb(0x55,0x2e);

//Select Logic Device 7
outb(0x07,0x2e);
outb(0x07,0x2f);

//Setting Default Watch Dog is Disabled
outb(0x71,0x2e);
outb(0x00,0x2f);

//Watchdog Reset Code
outb(0x72,0x2e);
outb(0x80,0x2f);


if(argc =3D=3D 3)
{
    if(strcmp(argv[1], "-M") =3D=3D 0)
    {
        outb(0x72,0x2e);
        data =3D inb(0x2f);
        data &=3D ~BIT7;
        outb(data,0x2f);

        TValue =3D atoi(argv[2]);
        outb(0x73,0x2e);
        outb((BYTE)TValue,0x2f);
    }

    if(strcmp(argv[1], "-S") =3D=3D 0)
    {
       outb(0x72,0x2e);
        data =3D inb(0x2f);
        data |=3D BIT7;
        outb(data,0x2f);

        TValue =3D atoi(argv[2]);
        outb(0x73,0x2e);
        outb((BYTE)TValue,0x2f);
    }

    outb(0x07,0x2e);
    outb(0x04,0x2f);

    outb(0xFA,0x2e);
    data =3D inb(0x2f);
    data |=3D BIT5;
    outb(data,0x2f);

}
}


>
> Actually, just building the wdat_wdt driver into the kernel and it87_wdt =
as
> module (and loading it via modules.d) should work since the wdat_wdt driv=
er
> would then be instantiated first, and the first watchdog is all that syst=
emd
> cares about.
>
> Thanks,
> Guenter
>

