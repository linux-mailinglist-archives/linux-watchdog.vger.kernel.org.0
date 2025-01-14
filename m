Return-Path: <linux-watchdog+bounces-2708-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AFA1123B
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 21:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 948637A0FA9
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 20:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B653C20AF65;
	Tue, 14 Jan 2025 20:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRATKsoI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80668146590;
	Tue, 14 Jan 2025 20:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887223; cv=none; b=KWGKZg2JM2Sg/WPrx0NQOOqeBa5SUF5xS9fXBS5zGB5om5iHEgZj+rfgwttAS7jNV/pCciPodV3kxjMEcnX9J6R77GsdRGag4VbaUvJbujR7w1t9qyG3WWbCmLfralEUUp9wtykZginvKiDQw2f9EqPFTokQFKxEBENwAKT6ATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887223; c=relaxed/simple;
	bh=gfRSX2GYBFaW3+bJZ4OY5mVTnljCuw1ZvJQxSJCMgWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QY+JDebHE2n78Ng7qyDRGvukYU2b/LIc2fZYo7LpfEt7YJMok0u3K1GxZrdud77S6d+4+M0prlRLr14dOjpi0tzuVCDW6teWMKdIY/kjPVY215E2zXGOPoPUhcX/ppY5h8i/WkcSceZ6b2FZ+QMo1ntFx+F4vpRtX6HjMj06WTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRATKsoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B64C4CEDD;
	Tue, 14 Jan 2025 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736887223;
	bh=gfRSX2GYBFaW3+bJZ4OY5mVTnljCuw1ZvJQxSJCMgWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRATKsoIY3LO2ovpqzgCudm88TPSEUQ8NKJV2//zqUhewA8om56zVReEyD7lmsTKX
	 vrhhfJ4YBlhX1bmPy947jzhNSVLLNJeH+GOKqOAiWJo0Fw84mRSjCqFmjjl9SGwP3S
	 Qf86rmgd8equripDjT+3cVAsCWcq1lEETE8xQ3lOa1np/MJErebfeKmwOpk1vCZhWw
	 FCGiwSXENAXQDgVeqa10fmE861CM6xtBun4KfmjMyBxQbbx17Rn1wtoAXMfjv9GyJD
	 K3jA91U/KePWtAMdd3hioeX7CxybbZB+lzEAeJCdw8E/Ink/nJfJK6PWlR0YKP8nJ8
	 rySkbkgO0rNDQ==
Date: Tue, 14 Jan 2025 14:40:21 -0600
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
Subject: Re: [PATCH v3 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,syscon-cpg-error-rst` property
Message-ID: <20250114204021.GA1676959-robh@kernel.org>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250113112349.801875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113112349.801875-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Jan 13, 2025 at 11:23:47AM +0000, Prabhakar wrote:
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
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, this change doesnt break any ABI, as the subsequent driver patch handles
> the case elegantly if the `syscon` node is missing to handle backward compatibility.
> 
> v2->v3
> - No change
> 
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

Why does the watchdog node care about the reset reason? Why doesn't the 
CPG handle that? Seems like this is the Linux watchdog subsystem handles 
reset reasons, so let's stick a property in the watchdog node. Sounds 
like OS design dictating bindings.

Rob

