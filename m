Return-Path: <linux-watchdog+bounces-2826-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942FFA26F86
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2025 11:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EB033A807B
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2025 10:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76C320B1EB;
	Tue,  4 Feb 2025 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsN6deVy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5FD20B1E0;
	Tue,  4 Feb 2025 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666110; cv=none; b=Wy//Gq3eApwHR2NMaO0vcBYXaD4ROBWUemfNulls3biF+7CDSGDun9M3rNdNDyqWmtEaQSWxPW9aRKKQf33tQWI+GYHFtFmCnkhm1UYyMhC5dk1+uFOb3t0QtFYjXbUdJMRgwkH4B/BBadfIVOWdCCCxwRk0iDY0UKsOu9nRuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666110; c=relaxed/simple;
	bh=iIOyQqK2JUjh2rscZEMfvq/pbw9sd7AmroWd/zVeCuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMS4dCUAuMUVnWKqYLK57l+lYba4AnBnbmzOWN5dIIBsUtTj9/yYdxdO6JQ5gTLcwy/WeUgQpNBQ14dxSfDjrG+7eQwD+2bnOxeleK4jXPO5EhVj/hDvG+NLMPDd6tTkJm0Z9SgZdF1kpZ3e+lb+nzhAAGRXBDfHaQwwSvYnqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsN6deVy; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-866dc3cd96eso129414241.3;
        Tue, 04 Feb 2025 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738666108; x=1739270908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC2vRRW/Kf2UPav9OdbBLlCMqBd9LT0RXpPkOPJfFNY=;
        b=gsN6deVyM4PduuvSftJ9D1shD6bapEUP6SN7fAjYxVYcX15z4wvKcrXpkvNy40dZ8v
         TYgpRYoUYFBnBH0M59Jqj+6OilxnLdiblP1R9eFdvUmXF8FVoDV3fpRz5Sez6Xps7wjI
         7Az1aYgDpxy1cM0yXEh0UjtRCQ8lpIgmyGLA7zG9ZUOlozIZKQxSI3HxZ2f4ZDmUdN5s
         k9jJygKIJTK0iild0POo+EB/4lg3g5Z5JI/5a7oJwTa2s4/vPTHYSzGyuLQrtEglbrGo
         3FHtMQSipsDMzyADR2j79sYI8Bo6tvAL82uzVRa5kmRNY8udiuqxXYL8wqTLQo8k9Wot
         xHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666108; x=1739270908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC2vRRW/Kf2UPav9OdbBLlCMqBd9LT0RXpPkOPJfFNY=;
        b=cYnJU8EQ1PxQgizV6puAbiZEILUXhzbcy5lXOiiIZaBlCuBrixuPgOn0HoP0IqzXFM
         ZM9fJ/sLZGADrysEJusWAlxzw/VRK9JgNo6UwnWFzO5xTXn3anBAsIfCu2Tey9OiZavy
         1/TFglB+4eSuZXpUhb7ekQ9qb8ZNAyfiBA1ew3YM0HM+ebpE4Rq+lieNGmWJganN9WaS
         iFIyrN97Pv/aQr5ZeCQi9knLKiCie7psyFj8itKtd/lUci2BJVowSZ/QALBH+ISCi9of
         ikAwdjXX4MZCBa0+2SOdCseNSgmMwNLuQ0an5t8/yuKXHE3CfkROs5Xn9VdTEOP3huOx
         QWog==
X-Forwarded-Encrypted: i=1; AJvYcCUNBV46aWF0r2hUccaZd/dpIoe2DylFBSIM8B2gi+Ya0s/Ie+rQ6QuKBlikpbNCYlEhbZrsGcwmnoYOz9WMXiqRPsk=@vger.kernel.org, AJvYcCVT4YMs+LOcqlGWRoCSy83N8JpT6MsItZAaRfx0MqQJ95xv0hmeGuNHa9LOORf/6uZzP4j/FJaI+0s1TMsU@vger.kernel.org, AJvYcCWFSDDlu+DKheY36ErdMHtSuxQAg9+taMU98ifqs3WrWHx2yJ+/U5qS9/ONH2OY9aaj3YLP2ed+Us6k@vger.kernel.org, AJvYcCWc25LOgYVZHSQ5YoE2pY3lOPsYPCYjXu4l8Qdtuw2nxwXt2W59pw5Fslg1T3cxYWguJ/+yfMU+BAju@vger.kernel.org, AJvYcCXehd813UH7VwusDGC5KcHlvirPUN0TcE7sCcUZjNW/VvciDRWlMwNe8H11sghvNpWOHdNQuvPfwpRmW8jXXS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOaTVoDTXITqgyuj3czoMdcDpzYq5mfgQZWf7PQL0lWGRDS5L8
	nw3fhQ4Bo6riiRCbzVlTpXu1RJNBP7+NONFV63OBIJrKMgwV2QiO22e21k8UvUVfOI+Tkr4+pPZ
	q9Cqk84w/1uPNXjmbOzGjfePBmFmCwtwuGsDxXg==
X-Gm-Gg: ASbGncsrH8cza2vh/iX0hXNl/SliuLP6MMKqjStFkgTPlJe7uy52PR5iul08mVks9rB
	0Z1iDfZke+2gFNpqfjBPTPk9PFB1dVg/5L2Bg93o1QKmc4DGdEQbCIeDkd80y2b7TEWa/psxM
X-Google-Smtp-Source: AGHT+IHcocGGipmX2tlrKsnQTcJY6JRWYgrNpEAV/bSPbiniGDmvkDVtYdocUMr0YE++t2jaDjHLk1KBJqx3xSwtuiI=
X-Received: by 2002:a05:6122:45a1:b0:50a:b728:5199 with SMTP id
 71dfb90a1353d-51e9e4fdb03mr20990003e0c.7.1738666107927; Tue, 04 Feb 2025
 02:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20250114200335.GA1626474-robh@kernel.org> <e74391e7-c7ab-422b-9dab-dbde9ce55204@roeck-us.net>
In-Reply-To: <e74391e7-c7ab-422b-9dab-dbde9ce55204@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Feb 2025 10:48:02 +0000
X-Gm-Features: AWEUYZkjdRPGf4IpLF2l35NAVBIXPh_8XYPcTIQ85vWtHQ6cImY8aU7Ha3TVdr0
Message-ID: <CA+V-a8vBi9Dmrm00N=xNNRPPi4TBk2ZBBkPEyC2YBDAa8gN4hA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter and Rob,

On Tue, Jan 14, 2025 at 8:17=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/14/25 12:03, Rob Herring wrote:
> > On Mon, Jan 13, 2025 at 11:38:08AM +0000, Biju Das wrote:
> >> Hi Prabhakar,
> >>
> >>> -----Original Message-----
> >>> From: Prabhakar <prabhakar.csengg@gmail.com>
> >>> Sent: 13 January 2025 11:24
> >>> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from w=
atchdog for RZ/V2H(P) SoC
> >>>
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Hi All,
> >>>
> >>> This patch series adds SYSCON support to retrieve boot status informa=
tion for RZ/V2H(P) SoC.
> >>> Summary of Changes,
> >>>
> >>>      Clock:
> >>>          Add syscon compatible support to the CPG block in bindings a=
nd
> >>>          device trees.
> >>>
> >>>      Watchdog:
> >>>          Document the renesas,r9a09g057-syscon-wdt-errorrst property.
> >>>          Update the watchdog driver to fetch and report boot status v=
ia
> >>>          Error Reset Registers (CPG_ERROR_RSTm).
> >>>
> >>>      Device Tree:
> >>>          Add the syscon property to CPG and WDT nodes in R9A09G057 an=
d
> >>>          R9A09G047 SoC DTSI.
> >>>
> >>> These changes enable the watchdog driver to identify boot sources lik=
e Power-on Reset and Watchdog
> >>> Reset, improving system diagnostics.
> >>
> >> This means that, we should assume U-boot/bootloader should not clear t=
he WDT reset status bit.
> >>
> >> If they clear it, there should be a way to propagate it from u-boot/bo=
otloader to linux,
> >> otherwise, we get wrong bootstatus in linux.
> >> But the clearing of watchdog status by one of the cases:
> >>
> >> 1) u-boot identify the boot source and clear the status bit
> >> 2) u-boot identify the boot source and does not clear the status bit, =
but linux clear it.
> >> 3) u-boot does not touch WDT status bits, but linux clear it.
> >
> > Sounds like the same problem as this[1]. If that works for you, please
> > comment there. Always better if there is more than 1 user for something
> > "common".
> >
> > Rob
> >
> > [1]https://lore.kernel.org/devicetree-spec/48defa98-9718-4997-86cb-b171=
187708a6@cherry.de/T/#u
>
> If this ends up being provided through /chosen, it should probably be sup=
ported
> in the watchdog core.
>
There wasn't any conclusion on the thread [0]. Can you please
recommend how you want me to proceed on this series.

[0] https://lore.kernel.org/devicetree-spec/48defa98-9718-4997-86cb-b171187=
708a6@cherry.de/T/#m2f1c7f5c8166522982cecf9351903ab06ca4f9ee

Cheers,
Prabhakar

