Return-Path: <linux-watchdog+bounces-4377-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46FBCE340
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 20:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 043934F966E
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 18:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232492F7442;
	Fri, 10 Oct 2025 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5fgZ3nB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EF2F5487;
	Fri, 10 Oct 2025 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120058; cv=none; b=R5HPNGX18Q2Cs9fQOdWGj8US5wfY17+j6a8DZKmh02w7Kf4WGVp2z4Seb1fTglQ3KfMmF4UFD1JYN2eTRCb9e3rk1hV5/5blJ/dbrIROSD3qzCeuDx7Sis2u8gP/xjn3hQsW0v1wpVThFGe3sNZ7y1RhhuM8G9OgY5oDLni8+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120058; c=relaxed/simple;
	bh=WykGdIgrKV3qVAkKEUu62ycGYqWV9fyAYr+Ox74s+Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx7k4iz7Gyg+HMqZytifQn42cESnOa9nf0qdai2yFLeqaei6/mZmjxrUFFbsR8JKsOD9OdJ9KdJ6T20j5ty9RZqj+8vtrXKxFhxlVeTVoM7VSgq7JCaJ9Pq366wfj9rC9v2LMGNqvw1/MP+kV7M204ag96Cza/PAvlTZ9e0/PN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5fgZ3nB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3758BC4CEF1;
	Fri, 10 Oct 2025 18:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760120057;
	bh=WykGdIgrKV3qVAkKEUu62ycGYqWV9fyAYr+Ox74s+Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5fgZ3nBZd0UJnUGugzaqPns9akl58JXDw6jZ+KMggSrCjD9ogWtc14sBNZBk4Bh3
	 ExxnPrgkpKTMXRCx7DXm/tFHhfCeKbItfjBLvOZ5BExW9n2x+zKouvZ8KJVejmEBJD
	 RCGmY5oEDDpZTaDLOtrA0jFN+91hRDrJSQMiQNfs42ZVKDN6hh8WzXlptfLW+xwS0Y
	 YahLVhgiTvPM7/MyZ4pJRrTPAtA2kfcKd74upS/TLGSBtyXxJaU55YQt8cBjjM/n9W
	 p22T8py8c8yLLu6dtch6ApwtiyrzjehFTE54+e1ckoU/0QdCmDp52K34x2zAhawEDL
	 G/aOD3/Beb/yg==
Date: Fri, 10 Oct 2025 13:14:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
Message-ID: <176012005479.654031.91907462455772331.robh@kernel.org>
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
 <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009104500.69787-12-wsa+renesas@sang-engineering.com>


On Thu, 09 Oct 2025 12:45:03 +0200, Wolfram Sang wrote:
> The SWDT on V3H has no reset bit. Make resets optional on this SoC.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v3:
> * don't introduce new compatible, just make resets optional (Geert)
> 
>  .../devicetree/bindings/watchdog/renesas,wdt.yaml     | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


