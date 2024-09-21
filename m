Return-Path: <linux-watchdog+bounces-1999-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0697DB02
	for <lists+linux-watchdog@lfdr.de>; Sat, 21 Sep 2024 02:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BDBD283D7B
	for <lists+linux-watchdog@lfdr.de>; Sat, 21 Sep 2024 00:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D54A1392;
	Sat, 21 Sep 2024 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkYvB4LQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D03D64;
	Sat, 21 Sep 2024 00:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726878628; cv=none; b=kzcfujfSf+QynQDiCuAL8LpN0CN2vzpoDvGgmn60zJ/aUL96YKRM7BIhsYFnU0TaFATary03RoZp4yITw8ST3ZLD8SGBHGWCktKxfAthOJSHkvxZxC4r6jE2Tt1/4au8dykSif8+h5RoCbbeqARLnSbg0nyQTpHWIzkWkpepXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726878628; c=relaxed/simple;
	bh=0E2hh/Hbwp/4wGH1f5ZmXQBrdqgwQEbctDjx0ejkdOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCjDwO7iM76XrB/dpiyiJbWnv3Jr9p5qXkA1+9wb0+GJYsGmm0//24zxn6ZsLahluLB90MFbEu56zyMrvIF/wwM1vGf+YdJBCufe2eJhlUKSXe+IhcECjgrjvwvFdM4YA+tSlgoCBzRWAL9jTJYAbjNvwszxwJ622VRVsfd0Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkYvB4LQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C46AC4CEC3;
	Sat, 21 Sep 2024 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726878627;
	bh=0E2hh/Hbwp/4wGH1f5ZmXQBrdqgwQEbctDjx0ejkdOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkYvB4LQKH80ISALZ36rGQY6YcTfsVjpBKsphHukJdoFiRizCHqYGV1zjrw2cf7l8
	 PDnEiA6fcI5YSnAepKAXzgOUInT+5JLdRWhFzMzVE50DY2LWNkYHj3Br0gcl+8ibsY
	 wmxpyRG/JP6mnoTzWq/iHYzuqQ9j0mKt2w7nTg7193rjQb0OTCVj1i9hiybfeT5YfG
	 qvuaqt8SueIPS6YUnB/KJZI6V030iXuzF5SwF3fsh+vd8HcKc5sLR+pocqzYaYRcDI
	 ygVTm3k2XkUaEbRxyuHUxQU47bgT15DQ77/jYsRBwWghcAr95lYNnHj1eXRzDrgnE2
	 /fLaVSC+wZp4g==
Date: Fri, 20 Sep 2024 19:30:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taewan Kim <trunixs.kim@samsung.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org,
	Byoungtae Cho <bt.cho@samsung.com>, linux-watchdog@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Document ExynosAutoV920
 watchdog bindings
Message-ID: <172687862569.155942.9712969028766494667.robh@kernel.org>
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
 <CGME20240913080347epcas2p3f92c8fe85b252f8ac2033261db345837@epcas2p3.samsung.com>
 <20240913080325.3676181-2-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913080325.3676181-2-trunixs.kim@samsung.com>


On Fri, 13 Sep 2024 17:03:23 +0900, Taewan Kim wrote:
> From: Byoungtae Cho <bt.cho@samsung.com>
> 
> Add "samsung-exynosautov920-wdt" compatible to the dt-schema
> document. ExynosAutoV920 is new SoC for automotive, similar to
> exynosautov9 but some CPU configurations are quite different.
> 
> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


