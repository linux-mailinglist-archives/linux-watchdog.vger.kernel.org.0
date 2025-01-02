Return-Path: <linux-watchdog+bounces-2651-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10342A000DA
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 22:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D5141883C85
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2025 21:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B7C1B6CF1;
	Thu,  2 Jan 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltfpcrVU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1543173;
	Thu,  2 Jan 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735854161; cv=none; b=dgfXECHmWTcOrUqxHymNB2HGD4dsi34s23iEsobiSsBY7M/3OBtUr2LVMZ5/yqM4EW56SZz0eMKD9d6KIuO4KQrpZmgal15J7jGg0T1yKkg452o0E1Yx58/4zUgNdnivnVxmCq1zqjZVa7ilTX7kvDdVLurEkdIugxyN+U7WBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735854161; c=relaxed/simple;
	bh=uDMyXn3LiiyKF4pIUlHSNryFTjlmWZMhMoFJsaSUZTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrhoA9hkGHRsYAFsGDyGhZrElo36lEyxGuvJrsZZbcgyV3Y1agljFdwg96nfR4eXwzy9sQWwIFdn7Q4V1NS2/SXl4zwuz+dvM7ZtCnVbHzAvZ2kqCv2zeGXVqa49gtPWG0rrJsjrRyeFrot8JAXr5R1qI+UDxD4s4eIH5yXR/fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltfpcrVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A438EC4CED0;
	Thu,  2 Jan 2025 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735854160;
	bh=uDMyXn3LiiyKF4pIUlHSNryFTjlmWZMhMoFJsaSUZTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltfpcrVUydeBWC3tP1Tkm1jkhtmpkl67oE3dyG7XvG/nmFt8D7ECg+gxTv0JzKJFC
	 NeZsrCWq3+OxY8hF+YGH/q5UoXpu8wizxJU7RhAujTYuw2mDdGnOTfJxlwRM4eeN7d
	 Cz6TCW7tvQW2P3mok4Xjg9GekmW06OClgUyIX4fQn6cJE2AWBcIBBKsKsguoDiNNQP
	 cvkNPrc4R+4J2R4vPZteGKOQZGMk/wc/lHiulBkLP7LIveZXDPsXuJEmKbSvODjbf/
	 rbVMRjgGUX6rPl7SWK83OPa0f6eS1OOU7YH3D2C08Mgsub3UyU5f6/Dca531J0saod
	 ffB1evLEKS1kg==
Date: Thu, 2 Jan 2025 15:42:38 -0600
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
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: rzv2h-cpg: Add syscon
 compatible for CPG block
Message-ID: <20250102214238.GA614405-robh@kernel.org>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227190210.69025-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227190210.69025-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Dec 27, 2024 at 07:02:05PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset
> Registers (CPG_ERROR_RSTm). A system reset is triggered in response to
> error interrupt factors, and the corresponding bit is set in the
> CPG_ERROR_RSTm register. These registers can be utilized by various IP
> blocks as needed.
> 
> For example, specific bits in these registers indicate resets caused by
> events such as underflow or overflow of the watchdog timer. This
> functionality allows the watchdog driver to determine whether the current
> boot resulted from a `Power-on Reset` or a `Watchdog Reset`.
> 
> Add the syscon-compatible property to the RZ/V2H(P) and RZ/G3E CPG block,
> allowing drivers to interact with the CPG_ERROR_RSTm registers as required.

This is an ABI change. That's okay because...?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - No change
> ---
>  .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> index c3fe76abd549..f42d79e73e70 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -17,9 +17,11 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a09g047-cpg # RZ/G3E
> -      - renesas,r9a09g057-cpg # RZ/V2H
> +    items:
> +      - enum:
> +          - renesas,r9a09g047-cpg # RZ/G3E
> +          - renesas,r9a09g057-cpg # RZ/V2H
> +      - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -73,7 +75,7 @@ additionalProperties: false
>  examples:
>    - |
>      clock-controller@10420000 {
> -        compatible = "renesas,r9a09g057-cpg";
> +        compatible = "renesas,r9a09g057-cpg", "syscon";
>          reg = <0x10420000 0x10000>;
>          clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
>          clock-names = "audio_extal", "rtxin", "qextal";
> -- 
> 2.43.0
> 

