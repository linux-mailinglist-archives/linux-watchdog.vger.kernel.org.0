Return-Path: <linux-watchdog+bounces-2972-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C0A3CAB2
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 22:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5FD93B238E
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 21:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9729A252917;
	Wed, 19 Feb 2025 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FX2ww+BL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612452528E7;
	Wed, 19 Feb 2025 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998847; cv=none; b=V912xexSyHSp0Jh+efEfun2mHw+TJyRTRot3zro8ZxUICoSVUBKac7B3LLsyukQSuqQFXVmNddTZ454wIaJt4aaUiSTS2niubsxt2QDjJpVuwUWhiQ0nRddZJm/OS04Fv6DPU88A9zYs5sQsR3Gyft+usS4C+3ob7YbXMKftTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998847; c=relaxed/simple;
	bh=dJby0au1n3GBFIoEqGjVxlDENJfg02NZV93N6+XJVWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc7H54LPoFS32ZF7SFZuuk9jZxdZnRU8ZPr1JWodR0gG80p4nkNer2/lw+cUMc5388UNPuMhUVoPrzmDyfdiQRgyyn0+sqI1q82SIRTE5LNkcfMlRUH+mfmj8QgpNs3A0rb0Adt2bNYSctD8N2ctgry+praRBqmcQXjRUh501GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FX2ww+BL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CFDC4CED1;
	Wed, 19 Feb 2025 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739998846;
	bh=dJby0au1n3GBFIoEqGjVxlDENJfg02NZV93N6+XJVWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FX2ww+BLXHMG+0m0u/PcpcdXd89TlO17qoAv2DCAwcN5mzSUelnVXlsRsDU902R5u
	 TndA9Sv6ZSs9tzMKMJA45mPV688267VtW8HKg+BV6+F2P1h1aWAH5Psf1nCKnvPH8F
	 QfdJfBONXDKTPPC+xxI9sy0e4UA560pYlF1GJOcqT9zhHg2O6OMiu++T3LNOfUy5Fr
	 WcM8aJgnIfke2wGPjqX4vBMK+1XRQXWxkAOSdxT6KwLvKTFpIXaULTpv92U8S4H30h
	 jYvUaPsreiK6bEHjF8PTkgPTZyAE0J5IonNyzdsWAmHnigJqsrbCQCRe4QlUvfQ8Pa
	 NNxqJRFo+FlCQ==
Date: Wed, 19 Feb 2025 15:00:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v4 5/9] dt-bindings: watchdog: renesas: Document
 `renesas,syscon-cpg-error-rst` property
Message-ID: <173999884492.2929715.139176403208414695.robh@kernel.org>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250210184910.161780-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210184910.161780-6-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 10 Feb 2025 18:49:06 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset Select
> Registers (`CPG_ERRORRST_SELm`) and Error Reset Registers
> (`CPG_ERROR_RSTm`). The `CPG_ERRORRST_SELm` register must be configured to
> trigger a system reset in response to specific error conditions, while the
> `CPG_ERROR_RSTm` registers store the error interrupt factors that caused
> the system reset.
> 
> For the watchdog IP to trigger a system reset on a watchdog timer
> underflow, the `CPG_ERRORRST_SEL2` and `CPG_ERROR_RST2` registers in the
> CPG block must be configured. For example, setting `BIT(1)` in
> `CPG_ERRORRST_SEL2` allows WDT1 to issue a system reset upon a watchdog
> timer underflow. Similarly, `BIT(1)` in `CPG_ERROR_RST2` indicates whether
> the system reset was caused by a WDT1 underflow. This functionality
> enables the watchdog driver to configure the `CPG_ERRORRST_SEL2` register
> and determine whether the system booted due to a `Power-on Reset` or a
> `Watchdog Reset`.
> 
> To support this operation, add the `renesas,syscon-cpg-error-rst` property
> to the WDT node. This property maps to the `syscon` CPG node, allowing the
> watchdog driver to configure and retrieve the necessary reset information.
> 
> Additionally, this property is marked as required for the RZ/V2H(P) and
> RZ/G3E SoC to ensure future compatibility and is explicitly disallowed
> for other SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, this change doesnt break any ABI, as the subsequent driver patch
> handles the case elegantly if the `syscon` node is missing to handle
> backward compatibility.
> 
> v3->v4
> - Updated commit message
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


