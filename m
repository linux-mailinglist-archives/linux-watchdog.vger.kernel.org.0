Return-Path: <linux-watchdog+bounces-1686-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29196A51B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 19:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79EE91F23EE8
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 17:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4CA18D64F;
	Tue,  3 Sep 2024 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6AW/4mM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2641C14;
	Tue,  3 Sep 2024 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383625; cv=none; b=dD4x8X1dkM/Jjoxxa7HBcRGDx+jcgY+APTO+Omwo8TYGq0C9d6jG76Ycg0H66f14uAItgfAJw+nCav0UNlbW23DNXSP6J4KPrJMSAmdB2IUmWPMv8/nV2PAJUp4vNsmapmbbpQm7Z1k4qh8yPQyZrIkazOk79WbkQ9uH133ocIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383625; c=relaxed/simple;
	bh=NtlTnC0QsS/egsQ9FKZqT+K+AlktbHnzwk5mJ3lRnlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFLjyjLnCVqsyH3u/IdxQIgUzphK1xp8/cXyEUDAxjqLtZd6+ZwNtjODDPWXlEKhjwNLC5siY0p6Bpngi+GXQ6RvRejILd4B1QO7Es0kF88iIoVszaHIqUMn46AIFdE0QQs7g1+iL5Vw8BCe8PyE83t9MZsw+BPgRr4W8oUPq+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6AW/4mM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633FCC4CEC4;
	Tue,  3 Sep 2024 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725383624;
	bh=NtlTnC0QsS/egsQ9FKZqT+K+AlktbHnzwk5mJ3lRnlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6AW/4mMK5gJj/eTBROlH+M5L9Dyk9/na7fnfdJn204eMRGkzJXp16VwGauWZEqgC
	 MB7MbJ8D0cjwiPRPomg8iOiXUVTkdCQe8UPHUMpTYCHAPi7MWVGVilSWlH9kVRu0Ke
	 rP6C58tcOuh2IOwe7YJH4FRqiAsDEHWkJc+rTITpvRPqocIBUV3oU87azGUAN81Z1g
	 7gfvjW9CpKj6TuO7FkrZBiK2/fXURJYm2tf/CA0gCPKWvIXATngETeCYJ6LRpLYPfr
	 c4VBE3kf3d7sbAzf7GK+DZE1/qq5AA4d5S/PcejYRrdTK4Z1pX9aMybk2k/AlT2R6P
	 lJriuJDGne+bA==
Date: Tue, 3 Sep 2024 12:13:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Van Sebroeck <wim@iguana.be>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Martyn Welch <martyn.welch@collabora.co.uk>, imx@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to
 yaml
Message-ID: <172538362087.1746034.1985438397803851680.robh@kernel.org>
References: <20240814161250.4017427-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814161250.4017427-1-Frank.Li@nxp.com>


On Wed, 14 Aug 2024 12:12:48 -0400, Frank Li wrote:
> Convert ziirave-wdt.txt to yaml format.
> 
> Additional change:
> - Add i2c node in example.
> - Add ref to watchdog.yaml
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38:
> 	failed to match any schema with compatible: ['zii,rave-wdt']
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - using original driver submitter and wdt maintainer as maintainter
> - add conor dooley review tag
> - remove value in milliseconds
> 
> Change from v1 to v2
> - add ref watchdog.yaml
> - Remove timeout-sec
> ---
>  .../bindings/watchdog/zii,rave-wdt.yaml       | 49 +++++++++++++++++++
>  .../bindings/watchdog/ziirave-wdt.txt         | 19 -------
>  2 files changed, 49 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
> 

Applied, thanks!


