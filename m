Return-Path: <linux-watchdog+bounces-1353-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F232192EDFC
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 19:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739811F20355
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 17:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE7B16C852;
	Thu, 11 Jul 2024 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz3DVYgj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97347F7F
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720719808; cv=none; b=oT99R1dBHhMACWEumoXdhCepldaXUBHnSpjAqfArKDeQXHWYAsK6dzTmZLUVYcl/74YVvkoSpNxwywDt2NK1ZJgPPKMPLcQmfDzTt/cFnfHcbQXAnCyaSroIKLScPL/el3PuOjveQQglTtP+XEl/VkTKnNHwzXdn9yZGnTuwHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720719808; c=relaxed/simple;
	bh=kRTMBdiLmDmhmNqOkhR1m5Jg7S1izG5T8nVJ/t1Uob4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMZE0mt7PticGgxVclv+iKpfTpOhqMdISKgbuVifc11HjRT8q0ZWLBOKdMWDcBupoMOh9hJ/4+tuLxXJHQg2MQHAuFQRVSex5z2ZkeVyQPBoUbtrV/0CzcqM+m8ftK4JTNoDwxGfOFdbfm3HRbuTHO8C5rD5GNGFjBXd6jgm6Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz3DVYgj; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8100ff1cec5so362765241.3
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720719806; x=1721324606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJx4/chv7tjuJi/DHYJXAx1QfaWPs3gydOHFTAi0pqg=;
        b=fz3DVYgj2nMsOXvfGzIDdIu57/F5ImnjjlbMbRF9GxMz7yXTan7rKR8KHn3PZ5Zhqk
         67N+FmqT7ET52K+srXZfrh+s0U5fF2uYEixU++eNYh4cC5SE97tK+oJ6S0IG+uzA9qBE
         jiSreYJVnAIpUi8AqfYmWtMqExqsC4NKcp+zDqRozdW/5SZPV9bhCcW64za+HqowyqWs
         bUFzuSa3jsquEa0PIFtDh8L4Q8pNJFqlqnxa4t9d3P3aXob1eQYH+9wYQB7MM0fFV969
         JcMuND193BewJTfkvHQQHIlHDOOtgDasNm6l+vIAQT1JBCguN8QF2SdxgaEp+aCvo8Nr
         4I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720719806; x=1721324606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJx4/chv7tjuJi/DHYJXAx1QfaWPs3gydOHFTAi0pqg=;
        b=aZoTGZkCTaiBQgq0bdkPOFLxoZJmQRnTPXB/84VtKC+pdzHrUXgctWaiwdDZ1UvuFj
         bG5JQUeDykgYisSHQXmcM+6j/kke044eg6WckDMXiSYqdkpi3VVaFa5bzGUwCDg9e1eB
         LUlMF3p1VlovF2e3yzbGK9/Gtsnw9jOslZquZmkyx0OHZ/tfejy132y+SRYEiCfhBD5C
         5pRpC0dB6nQ2DVVOydFGneNzi35W2DP0Hc9ZZK6ntc2KcDA2zoFL5/DZhoVE1yMSqBAj
         jp3dYV0G3rmMapk2CWhT/cCeIGSM6MmrTFpj+rXf80ZtPQD0+H28KrTEPRBI1lKxz0zY
         MFlg==
X-Forwarded-Encrypted: i=1; AJvYcCUwWDtMZDPBtL73LisDr7/UcpQ6v1vIGe6nXpXYMJfdnzPRrLyZzIf+3d+YQNkHS4eQHV22AHSXgmyv26g88bpghrztilzg4YZsVn0nJcU=
X-Gm-Message-State: AOJu0YwSGMEg01hvyxELpx0mqZXZAiL1NrKmvbt2lISi0BBhrIB7WRGS
	2W17mPqg7M5ZdiXpUqPyTLfCCYbJdqMqCCTXHEJBZItWLTOYqBxv7I4WymuujwwXcR/rAQonZ8q
	0iVqTrriohBZdPHT8jCmT0Oo/CeCswlzE
X-Google-Smtp-Source: AGHT+IGaaX/YAtC4hmjT/091xmksaa3fnkjZM0UmVZdoQfDC9fRyNI+QIAZNFvdiYmWCcSRjX6hwzvtJ9oaO6d8Svw0=
X-Received: by 2002:a05:6102:2b8a:b0:48c:3e33:998f with SMTP id
 ada2fe7eead31-4903221f439mr11585104137.31.1720719805871; Thu, 11 Jul 2024
 10:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213094525.11849-1-devlists@wefi.net> <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com> <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net>
In-Reply-To: <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 11 Jul 2024 11:43:14 -0600
Message-ID: <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
To: Guenter Roeck <linux@roeck-us.net>
Cc: Werner Fischer <devlists@wefi.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 1:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 7/6/24 12:06, James Hilliard wrote:
> > On Wed, Dec 13, 2023 at 1:45=E2=80=AFAM Werner Fischer <devlists@wefi.n=
et> wrote:
> >>
> >> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT878=
6.
> >> Some motherboards require this bit to be set to 1 (=3D PCICLK mode),
> >> otherwise the watchdog functionality gets broken. The BIOS of those
> >> motherboards sets WDTCTRL bit 3 already to 1.
> >>
> >> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, kee=
p
> >> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 keep=
s
> >> the status as set by the BIOS of the motherboard.
> >
> > I have a board(https://qotom.net/product/94.html) with an IT8786
> > revision 4 which is recognized but doesn't seem to ever trigger. Did
> > your IT8786 based boards show revision 4 like mine do?
> >
> > [    1.607590] it87_wdt: Chip IT8786 revision 4 initialized.
> > timeout=3D60 sec (nowayout=3D0 testmode=3D0)
> > [    2.367608] systemd[1]: Using hardware watchdog 'IT87 WDT', version
> > 1, device /dev/watchdog0
> >
> > Docs I have from the vendor just show bit 3 as reserved:
> >
> > https://qotom.us/download/SuperIO/IT8786_B_V0.2_industrial_111412.pdf
> >
> > 8.10.8 Watch Dog Timer Control Register (Index=3D71h, Default=3D00h)
> >
> > Bit      Description
> > 7        WDT is reset upon a CIR interrupt.
> > 6        WDT is reset upon a KBC(Mouse) interrupt.
> > 5        WDT is reset upon a KBC(Keyboard) interrupt.
> > 4        WDT Status will not be cleared by VCCOK or LRESET#, and only
> > be cleared while write one to WDT Status
> >           1: Enable
> >           0: Disable
> > 3-2      Reserved
> > 1        Force Time-out
> >           This bit is self-cleared.
> > 0        WDT Status
> >           1: WDT value is equal to 0.
> >           0: WDT value is not is equal to 0.
> >
> > Any idea why the docs I have would just show bit 3 as reserved?
> >
> > Did you have any information from your vendor under what conditions
> > bit 3 should be set?
> >
>
> On ITE8784E bit 3 is "External CLK_IN Select".
>
> >>
> >> Watchdog tests have been successful with this patch with the following
> >> systems:
> >>    IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
> >>    IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
> >>    IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
> >>
> >> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f71=
@roeck-us.net/
> >>
> >> Signed-off-by: Werner Fischer <devlists@wefi.net>
> >> ---
> >>   drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
> >>   1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> >> index f6a344c002af..9297a5891912 100644
> >> --- a/drivers/watchdog/it87_wdt.c
> >> +++ b/drivers/watchdog/it87_wdt.c
> >> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev =3D {
> >>   static int __init it87_wdt_init(void)
> >>   {
> >>          u8  chip_rev;
> >> +       u8 ctrl;
> >>          int rc;
> >>
> >>          rc =3D superio_enter();
> >> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
> >>
> >>          superio_select(GPIO);
> >>          superio_outb(WDT_TOV1, WDTCFG);
> >> -       superio_outb(0x00, WDTCTRL);
> >> +
> >> +       switch (chip_type) {
> >> +       case IT8784_ID:
> >> +       case IT8786_ID:
> >> +               ctrl =3D superio_inb(WDTCTRL);
> >
> > If I print this value out like this:
> > pr_warn("WDTCTRL initial: %02x\n", ctrl);
> >
> > I get 0x00:
> > [    1.607480] it87_wdt: WDTCTRL initial: 00
> >
> > Do you think it's required that the kernel set bit 3 for some boards fo=
r
> > the watchdog to work correctly if not set by the BIOS?
> >
> That is done for none of the boards. The code in question does not _clear=
_ the bit,
> but it is never set.
>
> > Or maybe it's required to configure additional registers?
> >
> I would suspect that to be the case. You might want to check register 0x7=
2.

So it turns out using the wdat_wdt driver works on this board.

If I log register 0xF1 I get a value of 0x44 which the IT8786 docs
indicate for bit 2:
This bit is to enable the generation of an SMI# due to WDT=E2=80=99s IRQ (E=
N_WDT).

If SMI is enabled for the WDT IRQ does that mean one can't use the it87_wdt
driver and instead must use wdat_wdt?

I noticed there's some ACPI resource conflict detection in the hwmon IT8786
driver(although the hwmon driver doesn't indicate a resource conflict on th=
is
board for me. I wonder if there is a resource conflict here with the watchd=
og
that should be detected?

>
> Guenter
>

