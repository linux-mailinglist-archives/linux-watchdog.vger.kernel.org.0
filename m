Return-Path: <linux-watchdog+bounces-44-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E6F7F91F1
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Nov 2023 10:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3765B20D2D
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Nov 2023 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B375683;
	Sun, 26 Nov 2023 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWkNP4DG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F520FA;
	Sun, 26 Nov 2023 09:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562A6C433C7;
	Sun, 26 Nov 2023 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700989909;
	bh=gwi2O8NXY8zMJqR9PPUCK789M/onA+FRT7MLBztXinY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWkNP4DGItnMd7Z2iP9WUrd2r7mcIUrwN9Cx4meOX1fpyQl89NikYVNeQasS+1YTw
	 jAFq+TxoKo0JAMdxh4Z5R3gFAGGIO+hGL3fKSPbW+q6Wqrbd4I0WX1G9P0INF0ExVW
	 qViEvvcrkA4cN3ooJuK7I2haaJqftw9aHhTjNU1ECYR02G+Fzp3ZmpZ69WSmm9oKfv
	 tKUvUr532PjLOh9nHQoNAjE9E3lpu3MQYJoH0eBDCoAClaFHt50vkddQEeqfF7QnwN
	 jPF3NFEew0Zr2iH5e8a9QYNyO4lh4BnZbeeGX6EcssbxoRh1HcN5hH7o6G6TD7orMv
	 2pQEUAnWAiAgQ==
Date: Sun, 26 Nov 2023 17:11:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: imx93: Add the 'fsl,ext-reset-output'
 property for wdog3
Message-ID: <20231126091143.GA87953@dragon>
References: <20231010081909.2899101-1-ping.bai@nxp.com>
 <20231010081909.2899101-3-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010081909.2899101-3-ping.bai@nxp.com>

On Tue, Oct 10, 2023 at 04:19:09PM +0800, Jacky Bai wrote:
> Add 'fsl,ext-reset-output' property for wdog3 to let it to trigger
> external reset through wdog_any pin.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index f20dd18e0b65..bb40a022601d 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -562,6 +562,7 @@ wdog3: watchdog@42490000 {
>  				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
>  				timeout-sec = <40>;
> +				fsl,ext-reset-output;

Shouldn't this be a board level setting?

Shawn

>  				status = "disabled";
>  			};
>  
> -- 
> 2.34.1
> 

