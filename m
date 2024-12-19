Return-Path: <linux-watchdog+bounces-2595-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F69F77E7
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 10:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA8B7A2C9E
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D055621639E;
	Thu, 19 Dec 2024 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBH9V3Ec"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9842914AD2B;
	Thu, 19 Dec 2024 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598935; cv=none; b=FfrWI0VfKzijA5Qr7abwcSkeaVU5K2BKz44Hq8IM4EE7fKZYRs3OdbBmwdGAKtuWZJNQ3TiTcKhdeuigACJ6tDu1JofzH5oB0XUxcZg7GIXWMNQ1rYB2htPpnd5tT1LoRzmjqq8MtfgosMKlQpbxW3b1VtkZIE77jdwDc1JbWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598935; c=relaxed/simple;
	bh=TbCe4RXQAeYeYJ/+ZSxGUf1agPRvKjC84JeBcIC3cj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q95Fojb0m9H3yT70GClCaJDMotvT6yV36XyOfB2Klpbpgpt6E/38G1pNFVO7lhS5NdUxT+ZZnbMS1gNEjqdCYCd9eNRHriYZhqJO8VUljCJirlD5aYJZvXT2c8GZl9hIaFhzrb0o4GOUyOZ9Atuxzxdjr4RL2Ztv0czhWoFFR20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBH9V3Ec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EAAC4CECE;
	Thu, 19 Dec 2024 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734598933;
	bh=TbCe4RXQAeYeYJ/+ZSxGUf1agPRvKjC84JeBcIC3cj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBH9V3EchidZhqFdYOsA4XvAkIulaup+JSSJdnkantrno3evNT1MzIzFNELCY7sr8
	 U2AxUsm/ALvUElqKReBdS9/it2fesf7dg7QOXxeOvaXVn9LYbalamIpwIzGCNjD6Te
	 4fNdxLQi+8pTdVTkuMivVPYt3LxwTNDTJKgPbSpv7Tc61bY/ZWnxNKHRCmOALpCbR2
	 y8C1Bhn9DaFShGsaAGmbPwOHO51H8zT8c/hwJHsvkP3SMar9+YJ0/Ytk5xlL+JsMJ1
	 qu8cdwzhBCQYicPTTOUPJE6aH7pAJ058pr0dcABM4bNFW3gGGhgb844ayvNJ2eLsBB
	 mxUGeRoq54aPA==
Date: Thu, 19 Dec 2024 10:02:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,r9a09g057-syscon-wdt-errorrst` property
Message-ID: <wouo4k7rd7y57jzez3qdrz27fscozofuksgs4ivft75y6cwvqa@zfq3wgerwaza>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Dec 18, 2024 at 12:34:12AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/V2H(P) CPG block includes Error Reset Registers (CPG_ERROR_RSTm).
> A system reset is triggered in response to error interrupt factors, and
> the corresponding bit is set in the CPG_ERROR_RSTm register. These
> registers can be utilized by various IP blocks as needed.
> 
> In the event of a watchdog overflow or underflow, a system reset is issued,
> and the CPG_ERROR_RST2[0/1/2/3] bits are set depending on the watchdog in
> use: CM33 = 0, CA55 = 1, CR8_0 = 2, CR8_1 = 3. For the watchdog driver to
> determine and report the current boot status, it needs to read the
> CPG_ERROR_RST2[0/1/2/3]bits and provide this information to the user upon
> request.
> 
> To facilitate this operation, add `renesas,r9a09g057-syscon-wdt-errorrst`
> property to the WDT node, which maps to the `syscon` CPG node, enabling
> retrieval of the necessary information. For example:
> 
>     wdt1: watchdog@14400000 {
>         compatible = "renesas,r9a09g057-wdt";
>         renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 1>;
>         ...

Drop, obvious.

>     };
> 
> The `renesas,r9a09g057-syscon-wdt-errorrst` property consists of three
> cells:
> 1. The first cell is a phandle to the CPG node.
> 2. The second cell specifies the offset of the CPG_ERROR_RSTm register
>    within the SYSCON.
> 3. The third cell indicates the specific bit within the CPG_ERROR_RSTm
>    register.

Don't describe the contents of patch.  Drop paragraph. There is no need
to make commit msg unnecessary long. Focus on explaining unknown parts
of commit: why? or who is affected by ABI break? why breaking ABI?
instead of repeating diff.

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 29ada89fdcdc..8d29f5f1be7e 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -112,6 +112,19 @@ properties:
>  
>    timeout-sec: true
>  
> +  renesas,r9a09g057-syscon-wdt-errorrst:

There are never, *never* SoC names in property names, because we want
properties to be re-usable.

Make the property generic for all your devices and be sure to disallow
it everywhere the CPG_ERROR_RSTm *does not* exist (which is different
from "where CPG_ERROR_RSTm is not used by watchdog driver").

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The first cell is a phandle to the SYSCON entry required to obtain
> +      the current boot status. The second cell specifies the CPG_ERROR_RSTm
> +      register offset within the SYSCON, and the third cell indicates the
> +      bit within the CPG_ERROR_RSTm register.
> +    items:
> +      - items:
> +          - description: Phandle to the CPG node
> +          - description: The CPG_ERROR_RSTm register offset
> +          - description: The bit within CPG_ERROR_RSTm register of interest
> +
>  required:
>    - compatible
>    - reg
> @@ -182,7 +195,11 @@ allOf:
>        properties:
>          interrupts: false
>          interrupt-names: false
> +      required:
> +        - renesas,r9a09g057-syscon-wdt-errorrst

No, ABI break.

Best regards,
Krzysztof


