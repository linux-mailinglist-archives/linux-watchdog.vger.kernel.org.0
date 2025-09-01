Return-Path: <linux-watchdog+bounces-4138-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EFB3EF35
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 22:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A33212C12DE
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 20:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C9E25A2B5;
	Mon,  1 Sep 2025 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLuG8zB+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D91EE7C6;
	Mon,  1 Sep 2025 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757428; cv=none; b=YwzMCd0CN4wRgcsd0zU64ORdWLInLyDdwp9IHLf9/vnTamEE36JyQTjwE5mv3aSR+IwechqjuQ0w9bDGqPYJuNTONlZx0D4SIvLj+I/8wcyixc3Xshj6UDNQH1rWsqu7SA/R4sAuPwZd/EvZZelXrclsX2cS2IGHwrTb0Q00h6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757428; c=relaxed/simple;
	bh=KC7znHm/JWj2lUNyyD/hNxr00ZjOsviTmeJPi/mJ7yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9AJilwPKll1HvOPwDVsJbTDpI4a82tIqNFQIwhH1sUAz08IabL3LnL9l7K30YL5NYBSHZ78jwCrgbkTv4FC6ZlZu2pZ7HqvmI1e68aRZfHsY71mSyZNnX4LLAIkKYdpU5CSiZ2y9UAc1ZPQJbHQWjknA9huRqOd7OQOrdyjCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLuG8zB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B48C4CEF0;
	Mon,  1 Sep 2025 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757428;
	bh=KC7znHm/JWj2lUNyyD/hNxr00ZjOsviTmeJPi/mJ7yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GLuG8zB+B/JpFd0k2fxHxl18Gg90ZA+2ntUJL9eFr5YjtbCq8wdWC0inzQ+8ca5KF
	 9ZI59H5/yUaNhjuFBLYkyk+vk4NrwIqUTUd6DTaUD0tE9gDbF7fzo01Pjtv39d/Dfh
	 cXHfwy4XloOyMWZ+DBRSLQZE5/eJLZkKMOsu7N5dHLk4WsUAxaqVHGtuX0V5IWhBVv
	 EDsdR2ZH8pAh2+jpIPipwhdZyNIc4lZYgscilkw/2vtY2erX5+oifY9SxBknzdDAl4
	 wxHNoKbbtfFSd3MIyoob3vP0JZbVBhPNVRVuBHtsCv7tgL6rMoBShtqBUgLcF+U8PB
	 FAahBotHFN7AQ==
Date: Mon, 1 Sep 2025 15:10:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Message-ID: <175675742654.261403.14863029084501002736.robh@kernel.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>


On Sat, 30 Aug 2025 12:18:57 +0200, Krzysztof Kozlowski wrote:
> Properties should be always constrained in top-level part of the
> bindings, so move the samsung,cluster-index constrain from if: block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


