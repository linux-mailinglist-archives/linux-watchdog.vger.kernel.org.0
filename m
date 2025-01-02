Return-Path: <linux-watchdog+bounces-2652-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AFBA000E3
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 22:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A362E7A15F6
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 21:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB541A9B53;
	Thu,  2 Jan 2025 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0BCZAMD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B31BBBFD;
	Thu,  2 Jan 2025 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735854385; cv=none; b=nwhy6QECnAvvl4Z9A6TVyo1Vny9+1w3E1s1EepyAXzRSKa5s0ynmd0nl0mnL3lvf3w0/YaQA2wSuPfMIOiZHZg5slkMmSI29mvhtnuRggHpporOGASylFMRZiGe8kAjsRTDA0B8T7wUxpc17xDMn40YHhrfx/WCnc6Ogug7EAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735854385; c=relaxed/simple;
	bh=IIcoarqQCxX9xoh+g26S7scU2rRS9h++sWTepXNVPrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AycXjhGfhh6QQcIivbS7qw+7yugaDSFRku3EJwa4Fa+GCF+pClLxuPlZPJVFnBskS4IyBc7I4rxu29jmWcZ8qySidFAB5WJzDXehqRJuz2NDjI/kWC2iyK2hs9MQV6L4ljg4b0aLuKOBQ8PQQ1q1eoQQXRiMCBcp3R7LXYEHPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0BCZAMD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389D9C4CED0;
	Thu,  2 Jan 2025 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735854384;
	bh=IIcoarqQCxX9xoh+g26S7scU2rRS9h++sWTepXNVPrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0BCZAMDx818Y7ToRSgAk31RgThZeJ4UgiCzsWZ53ylKJpAS3gvOBMoQbEO3Bvd/I
	 1IdmEegutH1d9/7d8xaPW74sy0G+BwQ95bgfBbj47OY3h/RIoruWLSmHf2Ge1gk3Hv
	 n4l4ozgbChOWUJ3QYIAWmJvFoiRdsDbvj9mE4cxTOntLyFc0mTI2w+nA3XUYbKLO92
	 tB6GmVbpNGoQ7OcbDBNXtTgWcHPPjGSgErV3QmgMLjU0MvHWuB/Xth6QB6V0rIQUMj
	 p9zODEx/hFdy1jkmFA0sqCEalD9kEkt16XnUrIfzhscJw2gXux93puRHMIvZbSqxq9
	 TFwgKgCGwJPow==
Date: Thu, 2 Jan 2025 15:46:22 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,syscon-cpg-error-rst` property
Message-ID: <20250102214622.GB614405-robh@kernel.org>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227190210.69025-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227190210.69025-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Dec 27, 2024 at 07:02:08PM +0000, Prabhakar wrote:
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
> To facilitate this operation, add `renesas,syscon-cpg-error-rst`
> property to the WDT node, which maps to the `syscon` CPG node, enabling
> retrieval of the necessary information.
> 
> Additionally, the property is marked as required for the RZ/V2H(P) SoC to
> ensure future compatibility (e.g., where the same IP block is present on
> the RZ/G3E SoC) and explicitly disallowed for other SoCs.

This is the other half of the ABI change. 

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Renamed `renesas,r9a09g057-syscon-wdt-errorrst` to `renesas,syscon-cpg-error-rst`
> - Updated commit message
> ---
>  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 29ada89fdcdc..ca62ae8b1b0c 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -112,6 +112,19 @@ properties:
>  
>    timeout-sec: true
>  
> +  renesas,syscon-cpg-error-rst:
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
> +        - renesas,syscon-cpg-error-rst

New required property == ABI break

Once the OS driver relies on this being present, then older DTs will 
break.

That's all fine if you spell it out in the commit message and any users 
are fine with the breakage.

Rob

