Return-Path: <linux-watchdog+bounces-4214-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF1B52307
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 22:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5FF587338
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 20:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFF82F3632;
	Wed, 10 Sep 2025 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpyqPUro"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109ED2EE60E;
	Wed, 10 Sep 2025 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537643; cv=none; b=PWqAX/Nmk8k1qWSwR1FyYqUh/H6XI/7X8oz0uu1uzyrz/5GxFe1qTRwx0PSRQeF+hD17wlB6I9WpkMAsxP46SfXY4Jswkak1lxOoBAOlzqoDczB52Sml+hn1IwsfpOeY5Y/q13Fruy2FK+k1jeRXj7UBmEvmfJnY727Ugq4lIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537643; c=relaxed/simple;
	bh=5OnkuBJyue+zQyX6Q2eCfHtTU3Z+nyV5kgiMTsJaO1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srxV2hUYT6nvvtDGx/y0BOAitK28cYokcq1cAj58dHzDGgJmXKnRpXQdRkY0P6sNHtCc3jCP6ClKZNtqdPFksQuMwOb9kqkix710AF2MGxVIiQ2dB/04GAQLnh31rLb4brXC99SgLWVmuhpy/xqCSgz41fwlfm6QSKn55SZk4nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpyqPUro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83208C4CEEB;
	Wed, 10 Sep 2025 20:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757537640;
	bh=5OnkuBJyue+zQyX6Q2eCfHtTU3Z+nyV5kgiMTsJaO1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpyqPUroqt68uLM2rNNFEMdXw3AX+sWGNucFF/ESuJHuDRJO9bIVzG9cuVb+NLEeQ
	 4TNJ7mp1BIr3t3wyMCK4b/M+vSwhp8dzJ8L0p306SV8VCatWseWWqGzR3cqOdcnDuH
	 nsOxauTwdZz9vo7Zf7DQwVaSD7boLxqQaOpx7D05s6s2LiPHBv7gqMawHIxbuc9vfu
	 l6lmNOzyQgQVhdqxatA2Ix1+2LLoD35XL86UkU+sEck0cgdOvePgE0DRGZRtJM7tbY
	 qmwkn1HLaU2aoL/nEzl82qQ2TRhH+1Yeoeo1RjAXPnpbjJaRphYKXdruhiTmQjLjRZ
	 Dy2OM4gzl2cBQ==
Date: Wed, 10 Sep 2025 15:53:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Drop duplicate
 moxa,moxart-watchdog.txt
Message-ID: <175753763932.388606.6667909056688824715.robh@kernel.org>
References: <20250807214222.4170236-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807214222.4170236-1-robh@kernel.org>


On Thu, 07 Aug 2025 16:42:21 -0500, Rob Herring (Arm) wrote:
> "moxa,moxart-watchdog" is already documented in faraday,ftwdt010.yaml,
> so drop the old text binding.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/watchdog/moxa,moxart-watchdog.txt    | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/moxa,moxart-watchdog.txt
> 

Applied, thanks!


