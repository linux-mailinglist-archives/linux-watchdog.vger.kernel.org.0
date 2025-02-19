Return-Path: <linux-watchdog+bounces-2971-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588ECA3CAA6
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 22:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E620016F4A8
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 20:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96C624E4BC;
	Wed, 19 Feb 2025 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhATFANN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8121516A;
	Wed, 19 Feb 2025 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998790; cv=none; b=g3tVhqUaGs3eWqcJQerTYijw6bFpscciGzIHh/SELYdTf7c8mEVHKcsnPIWPPBOcthIKPscoz3dWi5tZvh6KkGLq/uAZsqFbWM55xU0ARpyUPfrGYY+2U5yPasOPevUTL6wh1y9c0jTrguYdfHSdkhFf4+evCsZnZ7j0qWBzVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998790; c=relaxed/simple;
	bh=dvKxf/qUFD6QnlirkXBKY1HZbjPnMYpsHH/KTkGADbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxjpOe3mj7cwaZV10B711vaTGgDDHeJ+sFRmYTyjGgXXYc2uDkg3A5ZN64esrgyeu+qPx8VYY0Yy4QYWylqBypTYZYicTnIXpDwdaZW2UC5p9JAQoUdcyaLtAo3EO5Pq5YPtr+9ZHi+/BhEh75LgG+ru/2wGTMSOwbxsrJHOcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhATFANN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2A6C4CED1;
	Wed, 19 Feb 2025 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739998789;
	bh=dvKxf/qUFD6QnlirkXBKY1HZbjPnMYpsHH/KTkGADbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhATFANN5fZNDsk2vd16D8hpEgGYsbMRmJeqAeSfBHaz7cDAOFvdLy8QWk/IQBFBx
	 rA0MGTnHBTRjCI0fsh4mvP3wvwHCa32Zv43x0ELdFM/tXDEiM5NrKGXvKHa/ducPN0
	 2pSUcI0esU7DUXb5AXPRGgPPNEOoqvP+5i+QApcLx/JIcMNXgjnVLySXMIGoqwPEnT
	 iyw9BMNP9prbO2KJHF+draikDPyMS8YUnQzbr4f75DNalpnJ67s/WSugZW8bCiwVEh
	 XwSKb+ojCI4PXWF5BOLZCm+CFUtuVVSDqAjTvbehcPKhr3b1HRBOvRa8uQCmNwAHOH
	 /P+VXstLmdzOA==
Date: Wed, 19 Feb 2025 14:59:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: clock: rzv2h-cpg: Add syscon
 compatible for CPG
Message-ID: <173999878831.2928343.14910610867424763036.robh@kernel.org>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250210184910.161780-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210184910.161780-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 10 Feb 2025 18:49:02 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The CPG block in the RZ/V2H(P) and RZ/G3E SoCs includes Error Reset Select
> Registers (`CPG_ERRORRST_SELm`) and Error Reset Registers
> (`CPG_ERROR_RSTm`). The `CPG_ERRORRST_SELm` register must be configured to
> trigger a system reset in response to specific error conditions, while the
> `CPG_ERROR_RSTm` registers store the error interrupt factors that caused
> the system reset. These registers can be used by various IP blocks as
> needed.
> 
> For example, in `CPG_ERRORRST_SEL2`, setting `BIT(1)` enables the WDT1 to
> issue a system reset upon a watchdog timer underflow. Similarly, `BIT(1)`
> in `CPG_ERROR_RST2` indicates whether the system reset was caused by a
> WDT1 underflow. This functionality allows the watchdog driver to configure
> the CPG_ERRORRST_SEL2 register and determine whether the system booted due
> to a `Power-on Reset` or a `Watchdog Reset`.
> 
> Add the `syscon` compatible property to the RZ/V2H(P) and RZ/G3E CPG
> blocks, enabling drivers to access the `CPG_ERRORRST_SELm` and
> `CPG_ERROR_RSTm` registers as needed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Updated commit meessage
> 
> v2->v3
> - No change
> 
> v1->v2
> - No change
> ---
>  .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


