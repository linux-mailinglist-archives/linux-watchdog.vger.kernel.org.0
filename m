Return-Path: <linux-watchdog+bounces-2131-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC799358B
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 19:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DFB3283BA1
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 17:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BD21DDA3F;
	Mon,  7 Oct 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq+TQvbd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1D1DDA3B;
	Mon,  7 Oct 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323990; cv=none; b=oYNZnUmqKT9+aBUaHL96Hu96B0/xQQ6IZ718EO3mrtipn4WWWL39QNbEEJ5nAA2Llcok9Om6utclzYRwER21qOO7ES+JKX68xRgphjb8K6+aG7JH2BD7+wrX54qb9hq+BA4q2qDIf7jdxaBlpnpYUPbe9zFgeUVOc6RMrjmY9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323990; c=relaxed/simple;
	bh=nX4QdvK4jon6rwcgdgSFV/YaFDuwES1YhsvSlSFRGic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbhh7s2UZ0WsmW4P5VOZNPE+M0OsfUbvIX5JPfXZlTFVAEPpr6jp6IpTHjmia4i/6J4lRhBSp7+ob4c4efiV3/Zir9DULdDVVH73OHuWQJdRzmR0eczO6ABEp1WLr0diVBgRgQHw4BXKJD9ojG6zzN/xUs5ZvxzD8quFYLIhnnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nq+TQvbd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2DCC4CEC7;
	Mon,  7 Oct 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728323990;
	bh=nX4QdvK4jon6rwcgdgSFV/YaFDuwES1YhsvSlSFRGic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nq+TQvbdERuBePxTB4ZMGYW1C13CoKCVd0CTzUs/6e5JZp9lz7LWMnY57/sPa7Ut+
	 Tq2Wb6XLhgOBjqavluAa4FJywZOXi1gUtrXOwSX8SskoIfUW18iiEyGkfTIKuteDtX
	 4t/YsU4EbyaeJF6EIbiQ69mt0mdgw6w5pCcuVb+Ns3R/5WCQZz9axhJDNXP5q22U7b
	 JWdrlOhK062mXhH5jw8fhMHLrXooaKggTmyXSQ8J4t3CCRVkgHH9FzgGgeumVx9VfW
	 ZSQkiocKHFIh1OohSwQnsfwLvIdoOfNCS2kU6e46pQOImlIT74CPnOELVAsNhFF9RD
	 fjA4gNrftwPnA==
Date: Mon, 7 Oct 2024 12:59:49 -0500
From: Rob Herring <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: patrick@stwcx.xyz, wim@linux-watchdog.org, linux@roeck-us.net,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com,
	Bonnie_Lo@wiwynn.com, DELPHINE_CHIU@wiwynn.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
Message-ID: <20241007175949.GA1738291-robh@kernel.org>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>

On Mon, Oct 07, 2024 at 02:34:05PM +0800, Chin-Ting Kuo wrote:
> Add "aspeed,restart-sw" property to distinguish normal WDT
> reset from system restart triggered by SW consciously.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> index be78a9865584..6cc3604c295a 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
> @@ -95,6 +95,17 @@ properties:
>        array with the first word defined using the AST2600_WDT_RESET1_* macros,
>        and the second word defined using the AST2600_WDT_RESET2_* macros.
>  
> +  aspeed,restart-sw:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: >
> +      Normally, ASPEED WDT reset may occur when system hangs or reboot
> +      triggered by SW consciously. However, system doesn't know whether the
> +      restart is triggered by SW consciously since the reset event flag is
> +      the same as normal WDT timeout reset. With this property, SW can
> +      restart the system immediately and directly without wait for WDT
> +      timeout occurs. The reset event flag is also different from the normal
> +      WDT reset. This property is only supported since AST2600 platform.

Why can't this be implicit based on the ast2600 compatible string?

Rob

