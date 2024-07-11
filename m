Return-Path: <linux-watchdog+bounces-1355-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBED92F0B6
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 23:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B115E282453
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 21:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECFA19EEC5;
	Thu, 11 Jul 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2/w+O8G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3819E826
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720732207; cv=none; b=t2zyPYOyOxRZBeQx4fhJ4Zx+O2zx0J1Pu3H8ONzU6Gp8TaA66Cbn7lx/7hJrE7xQTQwF4swExu8VACbRjq02XceEZih/UnkRJrUrrHDSv8klHIxgDfUrfzTauL1hq89VRxvp47rnBKxfGi5fyLZoOadjl2rpBG1xOzWdY38hTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720732207; c=relaxed/simple;
	bh=stNuospxxC8i0CvfYyborOTlp0KZM/6bNeZ1ALUa+Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfcSMSme6WmwhEKUUcng6ZPzxKetJaif/3BSkU9NlMQNtQChEs9w85SmFnCmxSU/PJ/9dVR8OCaeGcfiaHDH1Aq5+QKqcZHaGq521o62HQltndUY66qcZEEXtSoeLz/mgxESgLoSiwIBxrMsGBhDAbvO2cUilXZTpDsE0zRP3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2/w+O8G; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4f30734057bso455356e0c.1
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720732205; x=1721337005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/P7YgeM2OcluSP4urS1iTBrVU3ww3WLtM7FuXryT4g=;
        b=U2/w+O8Gg3RGHt9nQIOfOkiSI1LhzO1l4z1eTqO6bJwC4aFoa3jjp5e+82x7YSXHu/
         34BqPzGdpsrSeNY3intpCeVCiEFoazAl2y0aFy89WJoixYvjM25yZIeznLZVNKbIldDn
         Jp5qt3mfgjV4VlWWrqVwVQ/HMsp2mMkI4QtPBDCRiOfIjdOKza69+plPiSwhwbVTZUIu
         u0fABUV08C/daeoLaE6rL2qOqklluWMY6y3QIdkeCcKFLmLgE90jrsZNLslkh9k9kiGX
         eUDoIhPVasOgs6QTUS52eLPYQj0m3ZvmnQI7YVNvSIHUtgNNnYJGEcAOIZxQlmU4uYCr
         4uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720732205; x=1721337005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/P7YgeM2OcluSP4urS1iTBrVU3ww3WLtM7FuXryT4g=;
        b=hoAznuF7ELLB4WxtC9OUiqAQSmanBodb20lvBLiipEHa6FgEyfCAFQP66C4qv9nn//
         8hpTWzFsprLs4DBmZdxA6BRLuCvNYktVFd6ajxXPH8VNbkDzgl+HicmCH4gX5cQAzyQU
         4nXJyBIp9jyxFbgttzKgm5S0oLzXhAPEqFus3nWprml3iUkIkQS1cp/x1sjV3Ou/Bntj
         +ygN+o1wPORCiSqwlcmfcaByLf5yEFWf7hKqrR0dmvjoQtktclQYaNAonZ7aJfr207Wo
         a1PnkNIfANkh8ql7MumY6hZRDjzmyUJDlIKaR/3gz4Aa4PpV/21Ddj0nMytzHiefl7aD
         NGKA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzeb5teI+XMB/tcl2/BUTI0sgADqS4Hw4WYYrw0fAvaC3KE5xI/zRoNhmewfsXSt9f1xUy55/XLd1tvqD+RegCIqS1WHT6C5Jw+rUvMs=
X-Gm-Message-State: AOJu0Yxx53TVoe5J2ZfIQijIndzwPdGgVRlCfgqbTyWto2d8bFiJuq/R
	d+KNVTSz3Z1vq/GHxQlrCFO/pMih+K5APqN92TdndDfI7P/4YziPIMyHhlCQdepk9OHOgNEe08Y
	rFNYstAqKC5U2TEJnhnEso7EvbGkEYA==
X-Google-Smtp-Source: AGHT+IH/qQpL2pmA6ul26uSQ7PnVbK+eBqTpWRjCmmsaiIAZIffmLrpO4w0hLYMkwzTZm2a60Z/k/GDNHm5bBogKzAg=
X-Received: by 2002:a05:6122:2a0e:b0:4ef:6500:b6b3 with SMTP id
 71dfb90a1353d-4f33f1b859dmr11944389e0c.6.1720732204440; Thu, 11 Jul 2024
 14:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213094525.11849-1-devlists@wefi.net> <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
 <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net> <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
 <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net>
In-Reply-To: <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 11 Jul 2024 15:09:53 -0600
Message-ID: <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
To: Guenter Roeck <linux@roeck-us.net>
Cc: Werner Fischer <devlists@wefi.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 1:17=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/11/24 10:43, James Hilliard wrote:
> > On Sat, Jul 6, 2024 at 1:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 7/6/24 12:06, James Hilliard wrote:
> >>> On Wed, Dec 13, 2023 at 1:45=E2=80=AFAM Werner Fischer <devlists@wefi=
.net> wrote:
> >>>>
> >>>> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT8=
786.
> >>>> Some motherboards require this bit to be set to 1 (=3D PCICLK mode),
> >>>> otherwise the watchdog functionality gets broken. The BIOS of those
> >>>> motherboards sets WDTCTRL bit 3 already to 1.
> >>>>
> >>>> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, k=
eep
> >>>> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 ke=
eps
> >>>> the status as set by the BIOS of the motherboard.
> >>>
> >>> I have a board(https://qotom.net/product/94.html) with an IT8786
> >>> revision 4 which is recognized but doesn't seem to ever trigger. Did
> >>> your IT8786 based boards show revision 4 like mine do?
> >>>
> >>> [    1.607590] it87_wdt: Chip IT8786 revision 4 initialized.
> >>> timeout=3D60 sec (nowayout=3D0 testmode=3D0)
> >>> [    2.367608] systemd[1]: Using hardware watchdog 'IT87 WDT', versio=
n
> >>> 1, device /dev/watchdog0
> >>>
> >>> Docs I have from the vendor just show bit 3 as reserved:
> >>>
> >>> https://qotom.us/download/SuperIO/IT8786_B_V0.2_industrial_111412.pdf
> >>>
> >>> 8.10.8 Watch Dog Timer Control Register (Index=3D71h, Default=3D00h)
> >>>
> >>> Bit      Description
> >>> 7        WDT is reset upon a CIR interrupt.
> >>> 6        WDT is reset upon a KBC(Mouse) interrupt.
> >>> 5        WDT is reset upon a KBC(Keyboard) interrupt.
> >>> 4        WDT Status will not be cleared by VCCOK or LRESET#, and only
> >>> be cleared while write one to WDT Status
> >>>            1: Enable
> >>>            0: Disable
> >>> 3-2      Reserved
> >>> 1        Force Time-out
> >>>            This bit is self-cleared.
> >>> 0        WDT Status
> >>>            1: WDT value is equal to 0.
> >>>            0: WDT value is not is equal to 0.
> >>>
> >>> Any idea why the docs I have would just show bit 3 as reserved?
> >>>
> >>> Did you have any information from your vendor under what conditions
> >>> bit 3 should be set?
> >>>
> >>
> >> On ITE8784E bit 3 is "External CLK_IN Select".
> >>
> >>>>
> >>>> Watchdog tests have been successful with this patch with the followi=
ng
> >>>> systems:
> >>>>     IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
> >>>>     IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
> >>>>     IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
> >>>>
> >>>> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f=
71@roeck-us.net/
> >>>>
> >>>> Signed-off-by: Werner Fischer <devlists@wefi.net>
> >>>> ---
> >>>>    drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
> >>>>    1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt=
.c
> >>>> index f6a344c002af..9297a5891912 100644
> >>>> --- a/drivers/watchdog/it87_wdt.c
> >>>> +++ b/drivers/watchdog/it87_wdt.c
> >>>> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev =3D {
> >>>>    static int __init it87_wdt_init(void)
> >>>>    {
> >>>>           u8  chip_rev;
> >>>> +       u8 ctrl;
> >>>>           int rc;
> >>>>
> >>>>           rc =3D superio_enter();
> >>>> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
> >>>>
> >>>>           superio_select(GPIO);
> >>>>           superio_outb(WDT_TOV1, WDTCFG);
> >>>> -       superio_outb(0x00, WDTCTRL);
> >>>> +
> >>>> +       switch (chip_type) {
> >>>> +       case IT8784_ID:
> >>>> +       case IT8786_ID:
> >>>> +               ctrl =3D superio_inb(WDTCTRL);
> >>>
> >>> If I print this value out like this:
> >>> pr_warn("WDTCTRL initial: %02x\n", ctrl);
> >>>
> >>> I get 0x00:
> >>> [    1.607480] it87_wdt: WDTCTRL initial: 00
> >>>
> >>> Do you think it's required that the kernel set bit 3 for some boards =
for
> >>> the watchdog to work correctly if not set by the BIOS?
> >>>
> >> That is done for none of the boards. The code in question does not _cl=
ear_ the bit,
> >> but it is never set.
> >>
> >>> Or maybe it's required to configure additional registers?
> >>>
> >> I would suspect that to be the case. You might want to check register =
0x72.
> >
> > So it turns out using the wdat_wdt driver works on this board.
> >
> > If I log register 0xF1 I get a value of 0x44 which the IT8786 docs
> > indicate for bit 2:
> > This bit is to enable the generation of an SMI# due to WDT=E2=80=99s IR=
Q (EN_WDT).
> >
>
> Interesting find. I looked into some other ITE datasheets; they all have =
this bit.
>
> > If SMI is enabled for the WDT IRQ does that mean one can't use the it87=
_wdt
> > driver and instead must use wdat_wdt?
> >
> Looks like it.
>
> > I noticed there's some ACPI resource conflict detection in the hwmon IT=
8786
> > driver(although the hwmon driver doesn't indicate a resource conflict o=
n this
> > board for me. I wonder if there is a resource conflict here with the wa=
tchdog
> > that should be detected?
> >
>
> The hwmon driver detects the conflict on the hwmon register space, not th=
e
> Super-IO configuration address space. I would suspect that pretty much al=
l
> systems would show a resource conflict on the Super-IO configuration spac=
e.
>
> The best we could possibly do might be to add a check for the bit in regi=
ster
> 0xf1 and warn the user that they might have to use the ACPI driver if the=
 bit
> is set. I am not sure if that would be helpful or just add noise, though.

Do your systems which work with the it87_wdt driver have that 0xF1 bit not =
set?

I'm thinking we should check for that bit and prevent loading the
it87_wdt driver if
it's set(maybe along with an override param). That way the wdat_wdt driver =
I
think should end up as the primary watchdog(systemd only seems to properly
handle one watchdog).

>
> Guenter
>

