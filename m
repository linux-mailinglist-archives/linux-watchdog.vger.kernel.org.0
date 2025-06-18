Return-Path: <linux-watchdog+bounces-3667-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A253ADED80
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 15:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B9B18837D4
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1080D2E54AA;
	Wed, 18 Jun 2025 13:11:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045A2E54A8
	for <linux-watchdog@vger.kernel.org>; Wed, 18 Jun 2025 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252313; cv=none; b=bwStF/rpePzKtNErOJdRutTZCEpVZOZqcjMTXduO0bTK/HP0W5Qr87+a+78h7+jZExOtfp6TrArQ88VWTtQ31CzrDlMaeGP90lSpaqUQPp9YRtvnFVJaSmiOL/RVQrBYs4ESBUhGRC54uXGu/oKxLv0gs0ss9F2HRRYR565Uns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252313; c=relaxed/simple;
	bh=tgC4nmRXi4zcdcc1QRmEL30wObl5ZmPG+uUMqEukGOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfxU+uVin21XTe1ofsGhpoc19waO4Bg0q0yT+dX5d+LY7MpweNvWEKxTdqb9a9yxCfNJOvos+Kv9iRPTFlON05wtCsK8J6/E1f7cdy5o/UIhQ1Qms+sy/fvQ3cjJ3G7Ma4Bu++ApHm+gqX87jNUE3mJtRUow8lmkqhBdOljxewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uRsZs-0003ce-3M; Wed, 18 Jun 2025 15:11:44 +0200
Message-ID: <7b863418-1554-4948-a863-e71991ef6442@pengutronix.de>
Date: Wed, 18 Jun 2025 15:11:42 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
To: Meng Li <Meng.Li@windriver.com>, krzk+dt@kernel.org, linux@roeck-us.net,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-3-Meng.Li@windriver.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250608030616.3874517-3-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org

On 6/8/25 05:06, Meng Li wrote:
> Watchdog doesn't work on NXP ls1046ardb board because in commit
> 7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
> it intended to remove the big-endian from mmc node, but the big-endian of
> watchdog node is also removed by accident. So, add watchdog big-endian
> property back.
> 
> In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
> property.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 0baf256b4400..983b2f0e8797 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
>  		};
>  
>  		wdog0: watchdog@2ad0000 {
> -			compatible = "fsl,imx21-wdt";
> +			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
>  			reg = <0x0 0x2ad0000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(2)>;
> +			big-endian;
>  		};
>  
>  		edma0: dma-controller@2c00000 {

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


