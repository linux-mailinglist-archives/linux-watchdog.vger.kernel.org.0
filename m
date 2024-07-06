Return-Path: <linux-watchdog+bounces-1319-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E256B92950E
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Jul 2024 21:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94A651F21797
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Jul 2024 19:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9A813A86E;
	Sat,  6 Jul 2024 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5i7Spel"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7B43AA1
	for <linux-watchdog@vger.kernel.org>; Sat,  6 Jul 2024 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720292808; cv=none; b=Hx7qEY5ehVTtJPg43yDtzSRIjcVZNiIywUbeT1XrP92daKsfsOCAOZ0rZDtY7ZbPPnhDDfkjjgIxuR4sGxMcQf8QbyCfcxUvjFBkJP6cL3dcdqizZjxuVIKN+31ZskaQFq4MVuovmkUWFmZtAXkmSUbI4cGBX6ZoR6zyFywF/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720292808; c=relaxed/simple;
	bh=Ojp49ManWO2IirW9TjwtELzYgSyFBMcpdkfLvfG8HRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XryOAwb3HSaDtawDCLhMvMn63lA5hRFhap5OHfSjFpOFtCub3WkuUraRUADTTJkMAdcyjBqC8einsHDccosPtjTuzni80bQXmZdhOMPQiqyKnGJycWMuOZ7Z1Qo8nIQJUwlQ70yeECCk6x7NQg6kyLwU4cfJo7eGOZDpiupfyPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5i7Spel; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48c2d353b01so979094137.2
        for <linux-watchdog@vger.kernel.org>; Sat, 06 Jul 2024 12:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720292806; x=1720897606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhMSleQYWWMGhImiz0WGzT6kG0QUzRxW4aAKwrwtzhQ=;
        b=i5i7SpelTstfyy46syMIgIfhz5qSmHYc14Zxs18DhFp0xp0iDNnoR1UiXLZ3fndhck
         GKhLx+jTGKJf+LO+JKpUdINQdtc+BHlAsmsvIA8WAXGZ0az5gEf+MzPtT7LV0Ifczw06
         rzOy1lGsO5gNfvtKtMMWycniVhQamOgUwWQvwX5niz6Qb1FDPjkquNUn8BrCXG2sORVQ
         JH/uhb2Vch0OIKAxEUJU7Vg8qoGAuqzh4vqlXttU+rLrM1a/7KoA6qtcvpPYRAFWLvy2
         lggMzFGtkMOsd0pPvrkrZs5XAT24J3xfTAmJnHrrQluAF0EPigx9+sIQqaYerl/yslqs
         kLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720292806; x=1720897606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhMSleQYWWMGhImiz0WGzT6kG0QUzRxW4aAKwrwtzhQ=;
        b=sCt0fzua7QXFJ1UCkH7dgH7f56gCOxnrgLLL4YitkHZyNl5W58/kmPUWJegnz3kVJ8
         e7rxW8gKkn8DSYsdzF2Xi2M9VEQXbG6eAu7Ua7oObu2KBdfhbP06rqOrce5HtNI8SorR
         /+Fq+wOtsQ8IEoyhWWSIykuEbW70jLJMYQ24l5K2surDQTfsyK440y4KXNqS5pJc1rhl
         jJEXIC6V6dGJiLhhJoNU2M46VyUOMvspDkT8QfGSnHXK5WBWjr0kEtdOKLmgNxjF4Prb
         TCb2mbw4bsEFIMAQU54bSceSGDt49/geHrhfiNQDwO5Qoh1Bz6uhCaWBXCGlkEGjDUuP
         fDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1yK11JY7PhAmjvqvjtDmQ3h0w80csrx/QoUxDPw0neirQ/nyLkmQYqsZUof5BZW2k9x/NJkKAnARqh8DQ0XOEKE0cZpuO+5KGtPfeMrA=
X-Gm-Message-State: AOJu0Yz5rAOA7TqRKEVYwQvC36b6zfD4BByfJBHXy+Maw16y7SXVk0Du
	ICG5nnTBWrJ7zEwYr7ZEKiUMLieJ51NW1c/6DvQ75YBGhhG/tG/XMeakh9/pLQfhLyZ1Kta0GIT
	gUT2hiPhMvSBglieE2nYGhQZp53de+2MGvMk=
X-Google-Smtp-Source: AGHT+IHCJnB4324KeYGj9fDxJovtbKs7hXvipHVuFIW5UISP8nt8ym6DfS9NmQh+d8oYCTkZ2MgeTRKg2/J1+akcEhQ=
X-Received: by 2002:a05:6102:498:b0:48f:4c0c:9dc2 with SMTP id
 ada2fe7eead31-48fee7ec6d7mr8114944137.34.1720292805483; Sat, 06 Jul 2024
 12:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213094525.11849-1-devlists@wefi.net> <20231213094525.11849-4-devlists@wefi.net>
In-Reply-To: <20231213094525.11849-4-devlists@wefi.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 6 Jul 2024 13:06:34 -0600
Message-ID: <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
To: Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 1:45=E2=80=AFAM Werner Fischer <devlists@wefi.net> =
wrote:
>
> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT8786.
> Some motherboards require this bit to be set to 1 (=3D PCICLK mode),
> otherwise the watchdog functionality gets broken. The BIOS of those
> motherboards sets WDTCTRL bit 3 already to 1.
>
> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, keep
> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 keeps
> the status as set by the BIOS of the motherboard.

I have a board(https://qotom.net/product/94.html) with an IT8786
revision 4 which is recognized but doesn't seem to ever trigger. Did
your IT8786 based boards show revision 4 like mine do?

[    1.607590] it87_wdt: Chip IT8786 revision 4 initialized.
timeout=3D60 sec (nowayout=3D0 testmode=3D0)
[    2.367608] systemd[1]: Using hardware watchdog 'IT87 WDT', version
1, device /dev/watchdog0

Docs I have from the vendor just show bit 3 as reserved:

https://qotom.us/download/SuperIO/IT8786_B_V0.2_industrial_111412.pdf

8.10.8 Watch Dog Timer Control Register (Index=3D71h, Default=3D00h)

Bit      Description
7        WDT is reset upon a CIR interrupt.
6        WDT is reset upon a KBC(Mouse) interrupt.
5        WDT is reset upon a KBC(Keyboard) interrupt.
4        WDT Status will not be cleared by VCCOK or LRESET#, and only
be cleared while write one to WDT Status
         1: Enable
         0: Disable
3-2      Reserved
1        Force Time-out
         This bit is self-cleared.
0        WDT Status
         1: WDT value is equal to 0.
         0: WDT value is not is equal to 0.

Any idea why the docs I have would just show bit 3 as reserved?

Did you have any information from your vendor under what conditions
bit 3 should be set?

>
> Watchdog tests have been successful with this patch with the following
> systems:
>   IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
>   IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
>   IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
>
> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f71@ro=
eck-us.net/
>
> Signed-off-by: Werner Fischer <devlists@wefi.net>
> ---
>  drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index f6a344c002af..9297a5891912 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev =3D {
>  static int __init it87_wdt_init(void)
>  {
>         u8  chip_rev;
> +       u8 ctrl;
>         int rc;
>
>         rc =3D superio_enter();
> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
>
>         superio_select(GPIO);
>         superio_outb(WDT_TOV1, WDTCFG);
> -       superio_outb(0x00, WDTCTRL);
> +
> +       switch (chip_type) {
> +       case IT8784_ID:
> +       case IT8786_ID:
> +               ctrl =3D superio_inb(WDTCTRL);

If I print this value out like this:
pr_warn("WDTCTRL initial: %02x\n", ctrl);

I get 0x00:
[    1.607480] it87_wdt: WDTCTRL initial: 00

Do you think it's required that the kernel set bit 3 for some boards for
the watchdog to work correctly if not set by the BIOS?

Or maybe it's required to configure additional registers?

For my board I don't see options in BIOS for configuring the watchdog.

> +               ctrl &=3D 0x08;
> +               superio_outb(ctrl, WDTCTRL);
> +               break;
> +       default:
> +               superio_outb(0x00, WDTCTRL);
> +       }
> +
>         superio_exit();
>
>         if (timeout < 1 || timeout > max_units * 60) {
> --
> 2.39.2
>

