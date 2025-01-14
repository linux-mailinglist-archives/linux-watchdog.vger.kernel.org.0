Return-Path: <linux-watchdog+bounces-2706-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F061FA111A2
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 21:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE4C3A119D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 20:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FCD1FDE05;
	Tue, 14 Jan 2025 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHo2NxWe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61119149F;
	Tue, 14 Jan 2025 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885017; cv=none; b=OrT6RswSaljyfX3FJ6hL8y203+XYpneG3I6UvmLe2D9xrRWhg662Py1c1s1zE7S1PqCRbZk6luMjvk7pkQQHqi/tN+Zb4ySOI65yX+g6IFXSge/lpv7q9s0gJkzkPZFIw+f5iOmk4m4mPA5GJJMLTaEYWGCnMXMeVsLZi7eRhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885017; c=relaxed/simple;
	bh=VvF68fnl5Cqm9qY20iFeMcP+DYp/YWXE36Bm8gfWFG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOY5zI4TsoxSlWVymTkoH2tPW+iknWIaWZxguA5Ctuk6boaOnxHbYfFwity9hfxvXztPQoHlf+xHUV/O0whvaCHydx5cD16KVnxKQ0rPGSUJkKsnJkcA0K+wlTXpWbsvUQqkE6n1g0xVcVQO/tkvUCN/wXu4dppmDFu66V+FaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHo2NxWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0D3C4CEDD;
	Tue, 14 Jan 2025 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736885016;
	bh=VvF68fnl5Cqm9qY20iFeMcP+DYp/YWXE36Bm8gfWFG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHo2NxWepfL2y4LhkgD/8SyK4GYqlrRl4KckXA4sdg0oRnaIVg3RVIThHwzNTajdE
	 xO1J7r4jKPIixh0G54iDX+BPEqsjHfFlLX/5qfAgjikh3iteUhYq2aRiZZfP2+aOqc
	 f1Vys3aTCCiNBDAjIVyNEQoATwOVqsefIEWFljMDHfLg6qyAqiV5fk6nuiqRgeU5t6
	 LiYa1eVpoRmnyVmKGTe5MloREqB9Ik/c/qj2Z9tNFJh75mw1sGvJxFQa4z+8OtHrA4
	 lPh34yRimlmlA/KrFg9OjNwjhelav7szjNj1bRFk4/z1UFTV1GLPXUd19873voRKjG
	 uQYPfrP4JDGTQ==
Date: Tue, 14 Jan 2025 14:03:35 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
Message-ID: <20250114200335.GA1626474-robh@kernel.org>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Jan 13, 2025 at 11:38:08AM +0000, Biju Das wrote:
> Hi Prabhakar,
> 
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 13 January 2025 11:24
> > Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
> > 
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > Hi All,
> > 
> > This patch series adds SYSCON support to retrieve boot status information for RZ/V2H(P) SoC.
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
> > These changes enable the watchdog driver to identify boot sources like Power-on Reset and Watchdog
> > Reset, improving system diagnostics.
> 
> This means that, we should assume U-boot/bootloader should not clear the WDT reset status bit.
> 
> If they clear it, there should be a way to propagate it from u-boot/bootloader to linux,
> otherwise, we get wrong bootstatus in linux.
> But the clearing of watchdog status by one of the cases: 
> 
> 1) u-boot identify the boot source and clear the status bit
> 2) u-boot identify the boot source and does not clear the status bit, but linux clear it.
> 3) u-boot does not touch WDT status bits, but linux clear it.

Sounds like the same problem as this[1]. If that works for you, please 
comment there. Always better if there is more than 1 user for something 
"common".

Rob

[1]https://lore.kernel.org/devicetree-spec/48defa98-9718-4997-86cb-b171187708a6@cherry.de/T/#u

