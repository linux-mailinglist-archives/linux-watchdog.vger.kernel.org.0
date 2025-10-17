Return-Path: <linux-watchdog+bounces-4400-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816ABEBB21
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 22:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CC3E4E3110
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 20:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6592417DE;
	Fri, 17 Oct 2025 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSijbWam"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0A354AFA;
	Fri, 17 Oct 2025 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733290; cv=none; b=J5eT76RZOJ+G8CycNqXyR4cVMZHIKnEwfyNhbZ+PVofLyVi+be56pwdC4eqAzj4lLhG9eNF42ndUcIQwlUlhzzS1CNZGDS1nxqS8o9ERDrnMBINlzRQKStxKR4xT1lfvJNd+i+/ECMBvAlBG9idzxRrMGLfa2nsDsNl6G7D6ahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733290; c=relaxed/simple;
	bh=fWvHCw6nIOZqg4sbQwQpfdMHsmBtlYkdr7cGLgSJTz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0AD10Yu3qTokywBIYXFjdr6gAAPgtel20PZbUrhRQjkbQmCJcy7uMZMU/hCk9o7MjugPv1l2Jt3v0S0B3/T1XauRQ430iCmUQWirqVHgDng1VXBk8J2cWQwXrrFzVWC7+FVSXDLF1Q4g/uSJ7ycuhpjIT2lo1lqj3A2XrN2txo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSijbWam; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9ABC4CEE7;
	Fri, 17 Oct 2025 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760733290;
	bh=fWvHCw6nIOZqg4sbQwQpfdMHsmBtlYkdr7cGLgSJTz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSijbWam3hRjP9xhyo7k2xlflu0yI5XcINS12zqZIYKtlCbE3s8d6/dV3AD58EbYh
	 S5JU2wd45aW4PJj2tcl3WzaWkylzoJzNmrW7xUBUYJaGcs8AT51m6pArpwnnvHEw9W
	 Qfd2Vz/FrMc+AGejLwdBmJQDUT3pfRmvdktt3KAvC82nz01+e9Pp8Be2GlzqEaGKSX
	 wQinvo8tecu/+kQ4RPODC/1heR1HtgAsfL/vpm9iCchL9NoL/hfnccFbTgm+iNJg3i
	 ttBuUG2qzKUftY6X+tP27M2tJfGw31DdEiZIjImM3Di8CMxbuvZGKFVXMfcGH1jcYx
	 /zAU561rN6sCA==
Date: Fri, 17 Oct 2025 15:34:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Renesas WWDT
Message-ID: <176073328372.47864.18309535932587493216.robh@kernel.org>
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
 <20251014112953.25712-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014112953.25712-5-wsa+renesas@sang-engineering.com>


On Tue, 14 Oct 2025 13:29:53 +0200, Wolfram Sang wrote:
> Describe the Window Watchdog Timer found on Renesas R-Car SoCs from late
> Gen3 onwards.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Note: Despite the name, V3U is considered to be a Gen4 SoC.
> 
> Changes since v1:
> 
> * support not only V4H but all Gen3/4 SoCs having this WWDT
> * handle the two-resets exception for V3U and S4
> * switch order of clocks, so it is the same as for the resets
>   (for resets, "cnt" is always present and "bus" is optional)
> * rename the file to match the base compatible
> * require interrupts and resets
> * drop unneeded label from the example
> 
>  .../watchdog/renesas,rcar-gen3-wwdt.yaml      | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


