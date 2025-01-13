Return-Path: <linux-watchdog+bounces-2685-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA8A0BBC7
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 16:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 308641882777
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581111C5D40;
	Mon, 13 Jan 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrMOxQ1M"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202D240253;
	Mon, 13 Jan 2025 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781970; cv=none; b=s/QjsY/4ZzztEpPRZ/E/5+sVWjHZKJDI/3fB4nlsez/HUS3D7b+2ckqNV+vCPmUx+ZB1Cp9F2XIoxFLE/M0HI/31mhLWJ2p/vEs9L3A1TSS7cCyQ9kuSlIclWIwSBnFh15/RU5BvO7nACH0YVrSAD0bssZyzvbtu3TUCVTuH2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781970; c=relaxed/simple;
	bh=SHv5WGVqcb9Ckrr9LW4LClgkQEX+U6HBdJhDCMNsKWA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dz9/+A4gaikoGf74GyaNQuuop5TvkcbIxzBrnnMQb4rpzfAs973ZekmgKrb82jj3eyalDFGzbEiqdn1uYXPVKTTrWDLZ88MJhYhUbegGW7xKjgbS3c6Eaa4McFkrcWcaS7IK1igCAhOdLVD2brREip29XLOvqgmAnaxE1L6XMBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrMOxQ1M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87055C4CED6;
	Mon, 13 Jan 2025 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781969;
	bh=SHv5WGVqcb9Ckrr9LW4LClgkQEX+U6HBdJhDCMNsKWA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IrMOxQ1MPWoCY7zQ0i7+/pUC0xeQ57oKXxNKhyK3p45LnKDFNSoAcTMElCZM37OJ/
	 a5sLBtFXtPXFbqnwlFViqhKUYtHsL7AQQ/UKQ4RbonIWLYbRJjEJcxUSwZHysOMjhe
	 aSSjlzLntzKNk/0qna8VMPq+pQnuMimPF+4hUTW/mu44sTtSt6D4DdFLP5N3r25XhU
	 A3ddfhLLJCAkI7EEAMZLeb6no2vZGVKT3G9RpiQI4/St5VMbQvHoetV82WnqtZjPYS
	 sG5ubspWVrAo/6GnXImz8FmP2KwO0ercQbMNfu4JRjf6/fn5U0Z1muAae3VVTQKZGa
	 KW+O/QjJ11/ZA==
Date: Mon, 13 Jan 2025 09:26:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-renesas-soc@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <173678160483.2153339.17454160603856685559.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC


On Mon, 13 Jan 2025 11:23:43 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds SYSCON support to retrieve boot status information
> for RZ/V2H(P) SoC.
> Summary of Changes,
> 
>     Clock:
>         Add syscon compatible support to the CPG block in bindings and
>         device trees.
> 
>     Watchdog:
>         Document the renesas,r9a09g057-syscon-wdt-errorrst property.
>         Update the watchdog driver to fetch and report boot status via
>         Error Reset Registers (CPG_ERROR_RSTm).
> 
>     Device Tree:
>         Add the syscon property to CPG and WDT nodes in R9A09G057 and
>         R9A09G047 SoC DTSI.
> 
> These changes enable the watchdog driver to identify boot sources like
> Power-on Reset and Watchdog Reset, improving system diagnostics.
> 
> v2->v3
> - Updated comment section to mentione there arent any ABI breakages with
>   this patch series.
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (6):
>   dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
>   arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
>   arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
>   dt-bindings: watchdog: renesas: Document
>     `renesas,syscon-cpg-error-rst` property
>   watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
>     information
>   arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst`
>     property to WDT node
> 
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     | 10 +++---
>  .../bindings/watchdog/renesas,wdt.yaml        | 17 +++++++++
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  2 +-
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  6 +++-
>  drivers/watchdog/rzv2h_wdt.c                  | 35 +++++++++++++++++++
>  5 files changed, 64 insertions(+), 6 deletions(-)
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']






