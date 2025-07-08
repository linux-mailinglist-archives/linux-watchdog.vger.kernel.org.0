Return-Path: <linux-watchdog+bounces-3845-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B593BAFD833
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 22:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 760D4542494
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 20:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B134D23D2BC;
	Tue,  8 Jul 2025 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZq2ZSm5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3F1D54E2;
	Tue,  8 Jul 2025 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752005888; cv=none; b=MUZEzUbo4ibu47hqdrG1Mfd8x4Sp2PiE4ILafxNO67+m/VsJoJOKB7LzSZ2owizjigtLxoggn2RHdI0aT+BqoRiCNhZ91dYGLVKD6CFYLYkgvWfl8DsxzvarVa3r4HxdDiZnltDUosjaZUjJSKFPPJErWb3sqglaa1R60+bDRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752005888; c=relaxed/simple;
	bh=zfkbjPg4tfTz4BD5E+6M+vCmZHxU3gsUQB6PvWPchNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPiAnwL2T2sbOIAmtfd2jIJlx0AMdPWpV6sz9QIUUj8cpJAmIGyqwhtDDmbOGh0pTxgoCZsvf6qu2b6/5Jx8EdOscd/rni1+dfYXK8tCWUSt83Hrb7Ydqul/WrCwyO02dIsAOOJQuV3zV3jiJMX1ihXpbp97JFf+1GbYHynPlfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZq2ZSm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6534C4CEF1;
	Tue,  8 Jul 2025 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005888;
	bh=zfkbjPg4tfTz4BD5E+6M+vCmZHxU3gsUQB6PvWPchNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZq2ZSm55e4ofOg+hNlkFpOxIV5V7eRne+d2kXkN110cHHYVQ8dYjm2LIrlDnQxCJ
	 PhKK0uGqlbgRLeTJihMhwiMOS9emQvGv42QvUGg52nOyin7M4jlPraFnYPgaWp/UKg
	 OvaPRBE5A2LQd5feBze+97YbboqOVJ5DaNQybooiYdcmwD0soFL4EPO60Qi34l6HVn
	 7oCaMp0yxWDwxsJrJehhDmxEiIb7bBkQmYkRXXyxzokxkLsa1ojG4gw2Aq0VBosMFs
	 +ajvyu23qepGhhAJtMJtLbJIGAVh2Tgrhdjpvi6eH09OJkc+fnwEJkxS0w1IoP8EDV
	 z2YaCt8KTOgIQ==
Date: Tue, 8 Jul 2025 15:18:06 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/9] dt-bindings: watchdog: renesas,wdt: Add support for
 RZ/T2H and RZ/N2H
Message-ID: <20250708201806.GA897559-robh@kernel.org>
References: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250707200111.329663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707200111.329663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Jul 07, 2025 at 09:01:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas WDT device tree bindings to support the watchdog timer
> found on the RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> 
> The RZ/T2H WDT is mostly compatible with the one found on the RZ/V2H(P),
> but includes an additional register and differs in the clock division
> ratio settings for the WDTCR[CKS] field. To reflect these differences,
> introduce a new compatible string, "renesas,r9a09g077-wdt".
> 
> The binding schema is updated accordingly. On RZ/T2H, the WDT does not
> require the "resets" property. It also requires two register regions and
> the presence of a "power-domains" property. The "clock-names" property is
> limited to a single entry, "pclk", for this SoC.
> 
> The RZ/N2H SoC uses the same WDT IP as the RZ/T2H. It is supported by
> using "renesas,r9a09g087-wdt" as the primary compatible string, with
> "renesas,r9a09g077-wdt" listed as a fallback to describe the shared
> hardware features.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/watchdog/renesas,wdt.yaml        | 37 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 78874b90c88c..ce439a401c12 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -81,10 +81,17 @@ properties:
>                - renesas,r9a09g056-wdt # RZ/V2N
>            - const: renesas,r9a09g057-wdt # RZ/V2H(P)
>  
> -      - const: renesas,r9a09g057-wdt       # RZ/V2H(P)
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupts:
>      minItems: 1
> @@ -132,6 +139,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - renesas,r9a09g077-wdt
>                  - renesas,rza-wdt
>                  - renesas,rzn1-wdt
>      then:
> @@ -183,7 +191,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,r9a09g057-wdt
> +            enum:
> +              - renesas,r9a09g057-wdt
> +              - renesas,r9a09g077-wdt
>      then:
>        properties:
>          interrupts: false
> @@ -192,6 +202,27 @@ allOf:
>        required:
>          - interrupts
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          items:
> +            - const: pclk

Just 'maxItems: 1' as pclk is already the defined name.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

