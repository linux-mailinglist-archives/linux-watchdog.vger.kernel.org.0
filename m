Return-Path: <linux-watchdog+bounces-1485-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB8950958
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 17:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB481B2677E
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Aug 2024 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BE51A071E;
	Tue, 13 Aug 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcSAepR8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6596B19CCFC;
	Tue, 13 Aug 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723563932; cv=none; b=IFTJ5qepxM4OXr9o8cP+Wb7IGdlL/XStDkcYn08MqZUVeyVZnPyUBHNQ68RziCj2TV3UWrPup5yz+JZcrkxHWPTYnlkHUEw1DbVsjL4pLm/sBYJ/9C/r5RRoiMyhYKSGilM8lu6ewwtyf7oeCilTpiNt2qfMuGL+hRg3FJAbm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723563932; c=relaxed/simple;
	bh=k//UBH4jM4TsTT++ZUHXzx+i4dSCfaga5dq+y+X9nRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqTMofa40QO2twmcaGVhuFCdlf7XexnsyG/V1ehQUd6s5sR5q0r6H6dC1ZItRS+RCpGgFsr7ySDrhoOFvQ5N4i+r5QDHp+QVMDqrkyigK/7IHQGs9ISXvD8BeE5oZLgdLpQOrDSjaE+6Mw/3SS1jhJkoYKvAac+EQSG7p3aXy1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcSAepR8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D456BC4AF0B;
	Tue, 13 Aug 2024 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723563932;
	bh=k//UBH4jM4TsTT++ZUHXzx+i4dSCfaga5dq+y+X9nRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcSAepR8f/+7LUKb7/+zx5jNmK2Xlcst9AtmUFI/jIzRVRwpI5c4DjsQWp3UVj5Cj
	 bUnt/wEb8cgREveVRruCdpwhUjREbmQNoGkM0+y9eBeo081wu/fpw/a8mwwQPbxkYB
	 cNLUA7YknHs1XyOKdAvpnUJwlF9pV3WbPmLgX0LcaFxcU8NnpgHNo94N2wHMpllKzi
	 I1c0vXd9eGC88F/f9YqcsCtk3RiIB2qfpYgrnRvdtKSVSJte5Lmf5ullLHOwU4+Ydm
	 7KsXnYyR+91GnBlkLfwL5VSZ6y63WoURGElm17DAO/1MLgfQOtLLKzS5cBG30xV/nu
	 pnB5dGTEQ1NZA==
Date: Tue, 13 Aug 2024 09:45:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kousik Sanagavarapu <five231003@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 2/2] dt-bindings: watchdog: ti,davinci-wdt: convert to
 dtschema
Message-ID: <172356392942.1007351.13568087913065764519.robh@kernel.org>
References: <20240727050736.4756-1-five231003@gmail.com>
 <20240727050736.4756-3-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727050736.4756-3-five231003@gmail.com>


On Sat, 27 Jul 2024 10:34:44 +0530, Kousik Sanagavarapu wrote:
> Convert txt bindings of TI's DaVinci/Keystone Watchdog Timer Controller
> to dtschema to allow for validation.
> 
> While at it,
> - Change the order of the compatibles.
> - Add "power-domains" to represent that the power domain maybe managed by
>   TI-SCI controller if found on the SoC (for example, Keystone based K2G).
> 
> w.r.t. to the txt binding to stay in sync with existing DTS.
> 
> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/watchdog/davinci-wdt.txt         | 24 --------
>  .../bindings/watchdog/ti,davinci-wdt.yaml     | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml
> 

Applied, thanks!


