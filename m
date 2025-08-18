Return-Path: <linux-watchdog+bounces-4008-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D56B2A64B
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 15:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52063682C65
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 13:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1948532145A;
	Mon, 18 Aug 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj+nNV7m"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5DC31AF15;
	Mon, 18 Aug 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523882; cv=none; b=GGVb032ZwUK989msXMAHoJ8VNp8p5a2euv6nl/Fxzee0pdYXursG3yiW8I6Iz+mXEsOVVlGhc1nb14iTeO2N2Titp/gX/e449eqF+1WJZ9An2HZ8ZCCPaNwQit/2aM1TGgWQ6hC0sWGW82cHNh7sQxSTJP1nbVXr73bgXFcIsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523882; c=relaxed/simple;
	bh=GXIKmHfNeJgLdupYy7oBHA4mmU8qKo5cPTOi9EPu/Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExK95RcEe1SHZx2QlTiN3go5HjaVhX8IpcrTzxmtwuotgEy/qA9VHpHXZGmQzHHfRY8NcZHV6sO6UtM9ACzejPSwTa5EGZoJUe5o5jqV+u863FeDDy6wLQGNJGR00dvnuRARuTBFUrWa425IEY9XBbK0gmNRL6ijjkah2gppcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj+nNV7m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e414252dso1960387f8f.3;
        Mon, 18 Aug 2025 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755523878; x=1756128678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON9o8DC/r8O1HoJIVtc/mFrDX+9Ao0HbkG/SK7DWW6o=;
        b=Kj+nNV7mOyq4eLfqtRoEiSj5FwjIAIobVuazqLbwoNqm/4GFiA5T2eZMtP7PWRUsbg
         Z+37Ep9mByu9j735BNKqDxksnu+nlznIyZCepyWs06Ams70jwHcR4Og+WfRSxyxWt8d7
         NcNSDYRsX/w1gOIwZ947q3w/KXtc9XL/0HG/3BWnbe/mEJKqD1G2hUDolXqs2HKWzB93
         3qKl2BdTD7SFrH0GqZW7PsPJcH4swhDX6cmvjWv7A9jx1Hus9KN4f4iC2/TrUplxxfbD
         zTC+/m/rTMCB0xv+A/Qpgsm4GpxDScp3B3MiCPNJ93ot+rYP+qjlosiMIRjUJCfSv5DY
         QgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523878; x=1756128678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON9o8DC/r8O1HoJIVtc/mFrDX+9Ao0HbkG/SK7DWW6o=;
        b=S5iFdNI+Qtwgrp0gopfbHpRiLDCjlu7W5cTUM1GhBk3CyHwS5dJC64EeYOw+zEIWSM
         7NMd4K25xmja7HZTE9Q8lV5sfMvotmh4oKA6kl/SGdDNmcuKSFfacFynZjTV7ZTfc8C4
         gg59xK0WhLnB9wdz3+q00pNnfg9se1wIHtQ/Pm/Lrl8ZZey0BJUKLIvJuB94zFKngrr6
         ZOCwZg+k2WnBLnanZifXsQ58KVmruIddgtEhuSjpd/hNmTnl4Wg/nSyb+zWXamwDsNeh
         RlfaJZCeszXAIMtjPZ8MyuvMRfM0oyXjG3P2B4QHDqkt7XGLiufsxh3p1zRib0khmH6R
         OdOA==
X-Forwarded-Encrypted: i=1; AJvYcCU2nJIQ6J+o8rJDKOva9Ga1rrUHAXB2HGijFNqmXO2oWSQA56lj1HcdMs6JiNvgp8JBtd2rdg+P+/+7YVAigY8=@vger.kernel.org, AJvYcCUJjen3Bi7IfSEJLUPwVZh0Jo333HjXbxTOPN+WSCThYOrCmO2rOlOKtcgCsBGAP2qZ5toSLTSj+jVJ6RPl@vger.kernel.org, AJvYcCV8mU0wL6Dm9cNiMEZJyhB2xnVgTxNH/I/sPoGY/WBqbg/sWuyIP6zJHbAsI0+qFqiCdrD1/9YtZseC@vger.kernel.org, AJvYcCX35FdthuFEPVeRfSzMhJ/UF0rlvHSK7CkEOX+2O+y32UI5EJzVMZelmq0oVpVcvckLLh6ayC6yB4yvf/zkdY6yzKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcgeo8goAl4AIING2Ci0Jbji0zJufiiY+Kbi6oT8H5SLcZ8Evr
	EGMUO3ZPIPGn72ioJBTY6a2Qo+p4yKCnydYr0sD6Kkhz7UUMfLfVZa30xCDWX4JSDvnKC/0ZZOv
	3XPGGFtSJgWrbgAQU9qXKXI7GH6raA4U=
X-Gm-Gg: ASbGncueF4Ldx1NY3YspUOqQSMhkNGgTf0tmkPCOUGlJfry0rEGGZ75/deuLxIJ2mZy
	nR68Fnn+1NnTUY4RTiGFiV8WdWJR+ncthR+1mE+XIC8xFqHPvK8VGNWs7Sidb8Vh8Oev6wyyFD8
	hOFEZiPlm028e29PmNij1sDdDfUoiVn7l+KwQmNYnLZ9WkeCjNi9G0l21J7pBn2Ett+FUAWDhG7
	EUiYk92
X-Google-Smtp-Source: AGHT+IHyIe2aZodzz7Da137QbUuwfG00VdpY2MHscAOGpwolYywyp/u7sLO8kiP9MMSyGPBcB+2rCNv7mvV7/saSBos=
X-Received: by 2002:a05:6000:1447:b0:3b7:7749:aa92 with SMTP id
 ffacd0b85a97d-3bb69a82f9emr9258509f8f.58.1755523877567; Mon, 18 Aug 2025
 06:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804195723.3963524-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250804195723.3963524-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUtG6Sb1WCAGBzyzxrS7rNBvyMa1NZdRiJuysUsYJMKfg@mail.gmail.com>
In-Reply-To: <CAMuHMdUtG6Sb1WCAGBzyzxrS7rNBvyMa1NZdRiJuysUsYJMKfg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 14:30:50 +0100
X-Gm-Features: Ac12FXw1JKgerlmhNA-3eXk1VvdnlvIq9C7AJKYBeDhFL_z3Eic56nvX2_0Q5C0
Message-ID: <CA+V-a8sop9mwGCr4RkB_kG5gkLi3QxqhyFzP8Uy9oKfKMa4B4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/T2H and RZ/N2H
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 11:01=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 4 Aug 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Extend the Renesas WDT device tree bindings to support the watchdog tim=
er
> > found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> >
> > The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P)=
,
> > but includes an additional register and differs in the clock division
> > ratio settings for the WDTCR[CKS] field. To reflect these differences,
> > introduce a new compatible string, "renesas,r9a09g077-wdt".
> >
> > The binding schema is updated accordingly. On RZ/T2H, the WDT does not
> > require the "resets" property. It also requires two register regions an=
d
> > the presence of a "power-domains" property. The "clock-names" property =
is
> > limited to a single entry, "pclk", for this SoC.
> >
> > The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
> > using "renesas,r9a09g087-wdt" as the primary compatible string, with
> > "renesas,r9a09g077-wdt" listed as a fallback to describe the shared
> > hardware features.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > @@ -81,10 +81,17 @@ properties:
> >                - renesas,r9a09g056-wdt # RZ/V2N
> >            - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> >
> > -      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
> > +      - enum:
> > +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> > +          - renesas,r9a09g077-wdt    # RZ/T2H
> > +
> > +      - items:
> > +          - const: renesas,r9a09g087-wdt # RZ/N2H
> > +          - const: renesas,r9a09g077-wdt # RZ/T2H
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
>
> The second register block is just a single register, right?
Yes, the second register block is just a single register.

> Showing an (early) example of the device node would make such
> details easier to notice...
>
Ok, I'll update the commit message to include an example node for clarity.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

