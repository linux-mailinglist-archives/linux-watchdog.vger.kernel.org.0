Return-Path: <linux-watchdog+bounces-2683-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94135A0B721
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 13:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 451B17A1645
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF8622A4FE;
	Mon, 13 Jan 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtVXcCWP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F522A4D1;
	Mon, 13 Jan 2025 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772064; cv=none; b=utqiGZlwK5jWNaPDBVnyY+khkmTGd3Xl9FAjG9tqxVbmL2GnhuxIC640/hSAXfMTc1Vfw1tZZ1VmHS/E4jX5fCPLs7YJmYjXDZSE4kRKxp5lS4VVdGTCm0fQW0dWryewDKWxZ3F50nZbo5UtwDu5AH+ilVrMgssHbx4Pf+3tUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772064; c=relaxed/simple;
	bh=O85+Z9UZF+eVdNlADq/jx6gqrVveANxisqyvRXkMKS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sptFv/2FrmVPkE3FUduu76xmnjvPN5N6Wu+rhEQ1YsoAjC9+HQsl24VWIVZJzXXxwXxJIkhy+xB1KOtZ870IQH3e87F/fYEG5C8RQK/bBOrTupa2L6JS7P2pmGu9/gCV8KnvgprNskJohrG9ixQ6WUlZ8KCtdL+zWSZ82dIxw1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtVXcCWP; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso1524283e0c.2;
        Mon, 13 Jan 2025 04:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772061; x=1737376861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbYfOIsPsYkd3/eNbN10A7EuEo53UW73o1TC5uqOCds=;
        b=UtVXcCWPYLN4EHuGu0hv3mdzz/hX05+SVHL1C4OkSggsOhJvZ72IYsqjNGiuvFKsp2
         jdU6ByI/PRL3QDyeQSkKlQfpSgsRxqXCQ62NHFfWT7i0Kj/WrYWdtS5qH7zdv0n0vrpJ
         RPuEtuf3hi1b6saqcAJzc7NbohquB2JMKy3qgFxU66vhBgkns9D/6YKd5KMFIg5wBTU2
         eF+rhKMH6JHryBtEF+ZoXxxn6KO2bwGOUAbI9z9PKqvfHgzbdWrLJA/D3QD+2+at7haH
         xvjO5DdjDxD9JIoZeG4ALOSoZ5txi8mXsvyiO0EGuuU2gVQbxhYJWyS6tZUcPPylzN1l
         0kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772061; x=1737376861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbYfOIsPsYkd3/eNbN10A7EuEo53UW73o1TC5uqOCds=;
        b=LDIuEZjfkTQ08IjCI0uuOW4Bypf9PYzQzFUztrKJhfXcNtIaexDJSm/vnrGC58UcGY
         wD5rqj4iT1ADWcpV+3LGFHoxkSpK3w2m2S4D7MML2+6OgfsvKPTlHLYSAeYLQ9pzQcT9
         rcHgRMbMlw+205E6WHnPX2xowfEQ3Cd0uyX2COK/2tXiePmoYLDzjv2+2VYk8Ga598KB
         R4hHT2vucJ+Y7rnGK4lf6pIEc8i65U6eDDDtikWjhHVPS87Jt20CSsabEvH3j5QTjPU2
         pkhGgJWO3VLuh3efntlMUIoQqD38V+pdxbcxvwpggIn0Q30xr8ucJWt5XqAtNKGvU4+D
         fQRw==
X-Forwarded-Encrypted: i=1; AJvYcCUFABrT5tER/aAGO1RukGhpVUxYWywvZhQJFeMucr40N77PWjiVVve34PSVIlH65h3/+n3oF2//Z2Lz@vger.kernel.org, AJvYcCUMjzFOsK86cfNPfF/vDN9BgikTTG0VsmZ6zlNGw13hNKxBvk9Rc26JQ5mu6RwTFq4zuN7IKRfzxswiorZKV2c=@vger.kernel.org, AJvYcCWvF5CGVLzpMmHye7CXlF4Gw8XBRogFx5lS1rZuQnJRloB+5N+q8qE5f+ldcWm+31/kIW3ZAIicPwDvXrM3gANOcks=@vger.kernel.org, AJvYcCXNO/OvJdvlQvkOy+hn/XEzX/I42IhHrJaCj5hAbA7GJFCTkWgkSurbeo+eABRdUcbh8pFhaz/AWy6Q@vger.kernel.org, AJvYcCXhYYYH9g6XanMcqzDmSMayXmntA4Nv0eqsVeMv4isodlN2ydUqj6UA1QnVZK0joPuByOME5uYz9gh2zkfw@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2LRZ58hK/0UJ5LQB09h2MOzJYpBzt2yBZI7Pu0gYU8EGcCye
	8Yrul56n+LHZf+v+sJSzpD090OzqG9RgHlUNhbf/jxtF+W8/4YlddU7rNhGfktBXYTlAh2zcHKm
	3n9XsFXuo8cRoHH2rXmv++hBtj00=
X-Gm-Gg: ASbGncsi0QjQ8PlNN4bUURMfNPeKjkS2Euk+tkfRKdRsUE3PdX0rElVcP0W1IZWtcVg
	9yU408YhHHXvK02usLdDQD22gS0p11sb0yqTou4I=
X-Google-Smtp-Source: AGHT+IEY6Lh8p4eF9JzEPm1V+mWfKXtieyo7nbeSUWhLLqKanFFUUYTByNlPBo2fzKO3WrlPTQKg1SULA9DF5CycXI0=
X-Received: by 2002:a05:6122:510:b0:515:daa7:ed07 with SMTP id
 71dfb90a1353d-51c6c1cd3dcmr15614435e0c.0.1736772061470; Mon, 13 Jan 2025
 04:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Jan 2025 12:40:35 +0000
X-Gm-Features: AbW1kvaxlIESxJqj1vJ4FPNOFvj1nHLzDyf9sFgK9BkMkK7ltbc-rjC_JsrGybc
Message-ID: <CA+V-a8tQ_tyxPn2pO=mSPVW2RffVhFz=CPCxR2pxXP1FLkcQcA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Jan 13, 2025 at 11:38=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 13 January 2025 11:24
> > Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from wat=
chdog for RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series adds SYSCON support to retrieve boot status informati=
on for RZ/V2H(P) SoC.
> > Summary of Changes,
> >
> >     Clock:
> >         Add syscon compatible support to the CPG block in bindings and
> >         device trees.
> >
> >     Watchdog:
> >         Document the renesas,r9a09g057-syscon-wdt-errorrst property.
> >         Update the watchdog driver to fetch and report boot status via
> >         Error Reset Registers (CPG_ERROR_RSTm).
> >
> >     Device Tree:
> >         Add the syscon property to CPG and WDT nodes in R9A09G057 and
> >         R9A09G047 SoC DTSI.
> >
> > These changes enable the watchdog driver to identify boot sources like =
Power-on Reset and Watchdog
> > Reset, improving system diagnostics.
>
> This means that, we should assume U-boot/bootloader should not clear the =
WDT reset status bit.
>
> If they clear it, there should be a way to propagate it from u-boot/bootl=
oader to linux,
> otherwise, we get wrong bootstatus in linux.
> But the clearing of watchdog status by one of the cases:
>
> 1) u-boot identify the boot source and clear the status bit
>
I agree, if the tf-a/u-boot clears the register, the bootstatus
reported by Linux will be in-correct.

Alternative solution, would be:

Let the TF-A create WDT nodes for us and add a property
`renesas,r9a09g057-wdt-bootstatus` and propagate the WDT nodes to
Linux.

renesas,r9a09g057-wdt-bootstatus =3D <0/1>;

0 -> Power on reset
1 -> WDT reset

Geert/Rob/Krzysztof - Is the proposed approach acceptable or is there
any alternative where this can be avoided.

Cheers,
Prabhakar

