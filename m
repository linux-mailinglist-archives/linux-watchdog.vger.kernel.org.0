Return-Path: <linux-watchdog+bounces-3951-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F7B18FCB
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 21:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B586C7AD15E
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Aug 2025 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6563A257436;
	Sat,  2 Aug 2025 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeqChygs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11224EAAA;
	Sat,  2 Aug 2025 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162796; cv=none; b=a0C4Np4h3UWoIROtpSJXOP4ofq7rzlbJq9JnHn1Jtdzn73E5Z8ohNhZ4GO5mhZ+HwJKJYbalPz0YkvaDz9b048k01NFcpHR9KY5SOOykZqzb4IrKGgExGTMq2bzHLSEUMGejJ0rMJnvubWM82J11sCm+Z8ONZEEud0eTgGA4mU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162796; c=relaxed/simple;
	bh=qn2y4GX7gcq9xSJIsK0Lvy2UCjUWamUIXMJi6/g8GKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnefCr4WHifZApYFTiLX6sDCgbq72+JaVYz/eAQRm+7zvo2CsY7Dh8gCgaUu32pTYZB33zxWl4FBgxUlinsIIppczpQmS/GqQiU+eyNVjwtQBMCTJ0INuorm8c5AWCKDtuYLsd8EGmhOQj85LxNW0YLAnhsmCzGQGy9phMbZU7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeqChygs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-458a84e2917so23001505e9.1;
        Sat, 02 Aug 2025 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754162793; x=1754767593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY7zr7G5cKhNulSAW1Lq16tDxmJUxs63l5EtnihI7w8=;
        b=VeqChygsUcYF9QURVLF5dtMi/WdN8M7FlUAgiwtv7E6ZO+pftqmCEB3JyDwKf94kxJ
         DJRpmHpScwz3wBzWrgP5nMIlM/VYNSeb+MnBw0gNztzcOBoXCoKEHNTh0qMNuzRAc9vg
         AjLmAXL1ZjLg23f8CPKj39WncLbDDG9j7vHUYW4HQQ5KXDtzX+GB/b7Yk/gaBJVNJYAx
         sJ+ZZYJkX1jOS0isIS1KvriphMubldOmO+3pZIMRsBSIBdQB4mobAWLFzo6IdANpdkVA
         3eokcXGY+MDXMIi9lfmPPmKrVsFgLjf0oTW6Uq195cLMzDHSUxY7JRQOT9xZPThiRc+A
         yPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754162793; x=1754767593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY7zr7G5cKhNulSAW1Lq16tDxmJUxs63l5EtnihI7w8=;
        b=n7zeHIOpJqVjVMxidiHL56msb9BUw6A92JGWKaBgWdPQbHdeJTaIrycs6b5vmbZ6kU
         ZpGa8Fmipj3tDlFxQrV7Dlnc7abHPKTlJ8ik90ohLI+7k9l6dlKetDx7UWTWtRH3V6SW
         5gNPhNAp+AFVO8Xv9mF1fSxCQl6XDwZENCLyfez2tzSiwtkse1aAtOtq5Ti0h5B9nk56
         kHO3kD7XERzFoPh0U0872KYZ1SSD3g9Rt9+DzfOBM+v81FQUgxtaIeIKrfdiN1dcwjmE
         /mvYDoSFShbtB2BXwaLMSryRJJxwjGAJ+nmRCRrnE82c5VHBjAVtq6OqqvZNho2G1YIq
         tiww==
X-Forwarded-Encrypted: i=1; AJvYcCUN90G/rCIiarOxpevqRpIGJNYyXiZSMSMKQvprL4++94+ZbuaC9AuyMdEAWCk1SD4I4qpakm8rYc5U5QyArFxnv9A=@vger.kernel.org, AJvYcCUy9pjSi4K8edViMfm8nvmvaYyeM43SzBPPEjEMAcXiLcZP5xawdkamEvMQ/LYoOrMH8JI57UAD6U8D@vger.kernel.org, AJvYcCVHHHxY8R+B2rruQRV4M9Fv3GeY2sY7GUxu1SSY4ymr9CbjLhA7pWeoB65fdFPDrg/Fknb5jMQBEdEr+Aii@vger.kernel.org, AJvYcCWCuuf+/vXeD5ChhfhYB9fDjDe21tAZ/y0Apyk1Fmpnm7J61XHbzi5T8g8jonB0XaOLeBbi0a0siO0+DfLgBFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUy5OT1iNO12zFu8v0fJE/bTdhjVOHbfPc4c8dQWljWViQShdq
	kZAuB4qUO6lTwB5o56TwUOub2/rGx5hZ9Haqoa6qERSNk49q8pxpPfDRC/te9YJoLYpOECwBnUz
	Ug327Bsi/MHH+VHGrlg05FrYMoK07AZM=
X-Gm-Gg: ASbGncsIvHv+E5Ub0eEwJl1tY+a2IWG3XAsvsRF8o84VLd+abbrvYe4oWI7wLDCx5Yb
	ts3vGeZJj8SJ4ZsJAAdfrXLR+Vur/Gw1fLO9ZnIXLKOjwVAq8aEGZZgFWsvP/NgA2JLAsBvcGHz
	Z+1UdirMDi3uzppd0BjqKrbd9PzXNKwAdSKfOGxAyrXw63my+IDQcxlo439hPAMEUX9/B0ZwMH9
	ZhDJysl
X-Google-Smtp-Source: AGHT+IEgVKQKxDwOgcwGk18Kt/NqnmqqGmYxVHAW5BHdAfFl5GlA18IAiehWzhlqK9KL4jpScLYvZBXzimNn4LdWBSs=
X-Received: by 2002:a05:600c:4688:b0:456:2000:2f3f with SMTP id
 5b1f17b1804b1-458b6b3d718mr29415205e9.23.1754162792365; Sat, 02 Aug 2025
 12:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro> <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
 <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net> <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
 <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net> <CA+V-a8v0KZaeJwJAmEpRRdS3F3vC_CYv7zGN_n9a+M6qhFDMHg@mail.gmail.com>
 <6b9338c0-e333-47dd-a3e0-0446b346f008@roeck-us.net>
In-Reply-To: <6b9338c0-e333-47dd-a3e0-0446b346f008@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 2 Aug 2025 20:26:04 +0100
X-Gm-Features: Ac12FXwWG34lE_fRCv_YLxV3pwPn3r-HAw8KVZNMb8WDNvQbjrY1y5-JH_AK11I
Message-ID: <CA+V-a8tJMfjVUNfA5wue0Zwpj=dDC9XypQ69L9SeZApRH8i1aA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Aug 1, 2025 at 10:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 8/1/25 13:51, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Fri, Aug 1, 2025 at 7:04=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 8/1/25 08:30, Lad, Prabhakar wrote:
> >>> Hi Guenter,
> >>>
> >>> On Fri, Aug 1, 2025 at 2:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
> >>>>
> >>>> On 8/1/25 04:05, Lad, Prabhakar wrote:
> >>>>> Hi Wolfram,
> >>>>>
> >>>>> Thank you for the review.
> >>>>>
> >>>>> On Fri, Aug 1, 2025 at 5:10=E2=80=AFAM Wolfram Sang
> >>>>> <wsa+renesas@sang-engineering.com> wrote:
> >>>>>>
> >>>>>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
> >>>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>>>>
> >>>>>>> Update the watchdog minimum timeout value to be derived from
> >>>>>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid an=
d
> >>>>>>> consistent minimum timeout in seconds.
> >>>>>>
> >>>>>> I don't understand this change. Why is the _minimum_ timeout based=
 on
> >>>>>> the _maximum_ heartbeat?
> >>>>>>
> >>>>> The reason for deriving min_timeout from max_hw_heartbeat_ms is to
> >>>>> ensure the minimum watchdog period (in seconds) is compatible with =
the
> >>>>> underlying hardware.
> >>>>>
> >>>>> max_hw_heartbeat_ms is calculated as:
> >>>>> max_hw_heartbeat_ms =3D (1000 * 16384 * cks_div) / clk_rate;
> >>>>>
> >>>>> This value varies by SoC:
> >>>>>     RZ/T2H: cks_div =3D 8192, clk =E2=89=88 62.5 MHz -> max_hw_hear=
tbeat_ms ~ 2147ms
> >>>>>     RZ/V2H: cks_div =3D 256, clk =E2=89=88 240 MHz -> max_hw_heartb=
eat_ms ~ 174ms
> >>>>>
> >>>>> Since min_timeout is in seconds, setting it to:
> >>>>> min_timeout =3D DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
> >>>>>
> >>>>> ensures:
> >>>>> The minimum timeout period is never less than what the hardware can=
 support.
> >>>>> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
> >>>>> - For V2H, it=E2=80=99s just 1s (174ms -> 1s).
> >>>>>
> >>>>
> >>>> Sorry, I completely fail to understand the logic.
> >>>>
> >>>> If the maximum timeout is, say, 2 seconds, why would the hardware
> >>>> not be able to support a timeout of 1 second ?
> >>>>
> >>> The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter. O=
n
> >>> initialization the down counters on the SoCs are configured to the ma=
x
> >>> down counter. On RZ/V2H down counter value 4194304 (which evaluates t=
o
> >>> 174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). The
> >>> board will be reset when we get an underflow error.
> >>>
> >>> So for example on T2H consider this example:
> >>> - down counter is 134217728
> >>> - min_timeout is set to 1 in the driver
> >>> - When set  WDIOC_SETTIMEOUT to 1
> >>> In this case the board will be reset after 2147ms, i.e. incorrect
> >>> behaviour as we expect the board to be reset after 1 sec. Hence the
> >>> min_timeout is set to 3s (2147ms -> 3s).
> >>>
> >>> Please let me know if my understanding of min_timeout is incorrect he=
re.
> >>>
> >>
> >> The driver is missing a set_timeout function. It should set RZ/T2H
> >> to 62514079 if a timeout of 1 second is configured.
> >>
> > Ok, you mean to handle the 1sec case, introduce the set_timeout for RZ/=
T2H SoC.
> >
> > Although we cannot achieve the exact 1sec case as we can have only 4
> > timeout period options (number of cycles):
> >
> > 1] For TIMEOUT_CYCLES =3D 1024
> >   - (1000=C3=971024=C3=978192)/62500000 =3D 134.22 ms
> > 2] For TIMEOUT_CYCLES =3D 4096
> > - (1000=C3=974096=C3=978192)/62500000 =3D 536.87 ms
> > 3] For TIMEOUT_CYCLES =3D 8192
> > - (1000=C3=978192=C3=978192)/62500000 =3D 1,073.74 ms
> > 4] For TIMEOUT_CYCLES =3D 16384
> > - (1000=C3=9716384=C3=978192)/62500000 =3D 2,147.48 ms
> >
> > So to handle the 1sec case I'll set the timeout period to 8192 with
> > which we get a timeout of 1,073.74 ms.
> >
>
> Just four possible values to set the hardware timeout ? That is an odd
> hardware. In that case, you could also set the period to 1024 or 4096
> and set max_hw_heartbeat_ms accordingly. That would avoid the rounding
> error.
>
Yes sadly we have four timeout periods only. To clarify, you mean to
set `max_hw_heartbeat_ms` in set_timeout?

Cheers,
Prabhakar

