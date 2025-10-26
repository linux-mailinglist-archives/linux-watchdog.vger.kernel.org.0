Return-Path: <linux-watchdog+bounces-4414-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A4C0B47F
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Oct 2025 22:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F013B5393
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Oct 2025 21:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49101DFE22;
	Sun, 26 Oct 2025 21:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxoyB0ro"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12A11712;
	Sun, 26 Oct 2025 21:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514327; cv=none; b=J7ODA8qtvZ0jTrC/RNMBCp9YN8IPC2abQcYkWUYP1bx+ngQf5JXAPRxekUYvZuUYrZcEo5PmcYh687Vru1op7XxMeagfX6Op2tPI2NkIfLZH4aHBZ0V9BsbC/gcBWU4kB/+DjWIaQ86+zfSUY40zpZMx2xidhovmx/ONCjaFwws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514327; c=relaxed/simple;
	bh=US7eMlOLrgyVd4jEE8B8b2qj9d94Auh08iSfYQGsbA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz/Lknwm7uxSgVv/cDkBdSvL8cVRiEcudbGjSBvKhouk+5I9FxBFgYp6jEtXv7ThWkgCNvHg26vuc9O6P7TA0PXaS2ljZ3FdEeH9EVQUbCkjysDeprnAdAd3iMcouJAKHNG2TMOHuIvj84N41QqgTjJDIT/26AE04roQ19SfYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxoyB0ro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0918C4CEE7;
	Sun, 26 Oct 2025 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514324;
	bh=US7eMlOLrgyVd4jEE8B8b2qj9d94Auh08iSfYQGsbA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxoyB0roejZPSe6LY0Vsb7SJE5zLJzq3Tc5YYIDJSIva1ANGmmM5Zsmw4/GdUuXAA
	 +CuLhNWeZ1UUPW9Y/JRRmFwMnNLhhnk5mD7pQWNEmVCEBsZqU7ZggD8I7fAjPR+/mw
	 bfqH6HCTCdpkXHYuwgaz4yDe/V3EECl//ToJ3WGYPUb1EamELhIl8lwNC38BNxKNvK
	 ygyeGTtyBVgqSy8/BK9s3iB8tQovF8JaU0uB24kBcuY8jxevmL4OD6r67vLNGpu2J8
	 3ktGJ9wiEVaOU02y7bCPW1bEyn4Wm7IftgczD3hu4unyaS2LSMR0aPrVrrMniVb99H
	 0QLwUzRlkC8WQ==
Date: Sun, 26 Oct 2025 16:32:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Restrict timeout-sec to one
 number
Message-ID: <176151431943.2975743.4026259275617476670.robh@kernel.org>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-1-d0f3235eb327@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-1-d0f3235eb327@linaro.org>


On Mon, 20 Oct 2025 18:52:20 +0200, Krzysztof Kozlowski wrote:
> Linux kernel expects only one number for the watchdog timeout and the
> type is an array (defined in property-units.yaml in DT schema), so
> restrict the property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


