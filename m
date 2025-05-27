Return-Path: <linux-watchdog+bounces-3586-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20042AC56C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 May 2025 19:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2C71BA7F0D
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 May 2025 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5612A27FD41;
	Tue, 27 May 2025 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUsJ2P2S"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275121E89C;
	Tue, 27 May 2025 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366718; cv=none; b=ZyXtXpfZWHf98YlaGFpnkrtmVqhEihJ6wvV7iGwQEhzVwwcjaRIfP7BD48WokQh6iTmkWX8Mi3sgydQxbU6nvcKcbfRNQk4/24viBK0KnyHn3H1PwU0X/oKrPBsivvg4oSNvjSX5wot1Dk4RGPW71eBV6Kq5uuTcE2tSzP0wRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366718; c=relaxed/simple;
	bh=junkeJlGysPy7xuXICzT2b/jFzfkYfjCQAKr5XJ8z+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX6PN9/S7AM93ewVKNcR+4rfFScQaHkSQStxlVAWCgY9RE6vIU8ro/GZ4WMCI145UVNuGuOr9/Nat8WBHVZg7rwBOKotuF1bxUVlbOB2PSenGoRKwTwwwfMwiX6A4687hZ0LUs20whm39UXd+JP8SZ2bWbTyrEWssW/PfLH4Rvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUsJ2P2S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B24C4CEE9;
	Tue, 27 May 2025 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366718;
	bh=junkeJlGysPy7xuXICzT2b/jFzfkYfjCQAKr5XJ8z+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUsJ2P2S8joJzEiWaXS91VGajLP7dsGlHthSCBMlTsw9fXmgbnAJ+xX5SWcceq0HL
	 rFykLPlqp5tr6FgZhMWKOQtgKFfVT7Zq55IM3lvQIhI5XMM7CHvoPAiZg/2kmJhcMG
	 4vNen0YomaFTBjoNGeNalXEOOR0APDEhbqlxCJu/rdSFLKdTQk4Nd0UkIMP6e1AT/A
	 5+g21VWvwfc8JKkAVzab6BLMrJJCVhe20xpspqxelT/GigvPxtCOt0MOETKx8V6D+D
	 /FyMoznRJzje8gAyKP9dSSUbv1XbIlGpWmU39M6O/G1ot4ZW6FgEB5Mi3R7x0IWRtV
	 K3Je3idb9MG2g==
Date: Tue, 27 May 2025 12:25:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl,ls1021a-wdt
Message-ID: <174836671477.753304.3606658463007715272.robh@kernel.org>
References: <20250522194732.493624-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522194732.493624-1-Frank.Li@nxp.com>


On Thu, 22 May 2025 15:47:31 -0400, Frank Li wrote:
> Add compatible string fsl,ls1021a-wdt for ls1021a SoC. fsl,ls1021a-wdt
> allow big-endian property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


