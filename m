Return-Path: <linux-watchdog+bounces-4415-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB4C0B488
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Oct 2025 22:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D42189FD79
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Oct 2025 21:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E238279918;
	Sun, 26 Oct 2025 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDz7+CPb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52154244665;
	Sun, 26 Oct 2025 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761514390; cv=none; b=rsah1q4+8TWBpT09wj+niPKp1q7miQBXv+bMQlOMmKYG8G/c3qQbQ4/HF8G/q43UNcs0BgU0TKw3BbhS92OKqnO0qBQNzY2hjK75GrNim8BgVx9m9SbJX6kT/PgbrGthY6cC7bNYbf3Cxr5JNUGAHEoOi2iF+o9PtfImy0SWyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761514390; c=relaxed/simple;
	bh=uNnLaovdSmxAQg01TxXDoRG/A4T5PuTAYKuZ8IcgHXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTLIrQGDO0U+7g58FoCm5t7P6bBu0bG/c0y8fydpk0zd+HQSDAncqn5aEwY+XUlmMAnmItELN3TGn2nykKPxyx3fzzghTV97froCBF4rOnrbRWhF41dsZKXpswm++H1O25Zs3cPo9Tlt64Dcl3Lcfdc4kEEjZUbWucz9sdhztFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDz7+CPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA51C4CEE7;
	Sun, 26 Oct 2025 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514388;
	bh=uNnLaovdSmxAQg01TxXDoRG/A4T5PuTAYKuZ8IcgHXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDz7+CPbpCdKnicDIR6ppQlToFLeaU90j/IrZN0HE4Eupp9mXszRajjYXjDK3OSZ1
	 w6dyvPZ601Mtiu3uOnRGzw6+y5zkhlKAnr287oQ8TZUAoTQJHu3XOLwUupfuzehgzj
	 XXFv3kzBHw/Jt9hVDvmMfWMVmBzLXiolG07jIOmFDXWbKoaT46qlCN9DavU4nVDEXR
	 e58+VagNlsX9G2HAFguERKwMH6sh8UU8N7b/lqDMxZ6CruEDHGdmtEnJB+hjOba1Oy
	 3a2R+YuhgNI5as0BzTYOw9oLURw2u92dnJYILzmMcZHhqxl6Xy9EzF/oC50zvI4ulY
	 3o9FJpMGLQE4A==
Date: Sun, 26 Oct 2025 16:33:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: Allow node names named 'pmic'
Message-ID: <176151438420.2977076.1358541102873016338.robh@kernel.org>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-2-d0f3235eb327@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-2-d0f3235eb327@linaro.org>


On Mon, 20 Oct 2025 18:52:21 +0200, Krzysztof Kozlowski wrote:
> Watchdog is often part of more complex devices like Power Management ICs
> (PMIC), e.g. on rohm,bd96801, and the schema can be referenced by a
> binding describing parent (main) node.  Allow another typical name for
> such PMIC devices: pmic.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


