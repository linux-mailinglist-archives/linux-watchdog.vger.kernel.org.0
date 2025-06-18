Return-Path: <linux-watchdog+bounces-3668-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F5ADED8C
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 15:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E37516B67D
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Jun 2025 13:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A31A296160;
	Wed, 18 Jun 2025 13:14:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF413957E
	for <linux-watchdog@vger.kernel.org>; Wed, 18 Jun 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252467; cv=none; b=BnTBAevTJxpVeARHM9Lug2GZESVrRYNOzEzsVf8X/0L279J9wgMmEdm21PFKWSd1XGD6N696bxevfOsgVnqwE7UL4aWhrEPULVQ2ftZR6ca4DwZ0v1TcIbNVA8nh5yopVqCKFJcynrHxI66GQrDipUeReC6EEMzNMw+qxH7pv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252467; c=relaxed/simple;
	bh=GPQr1P55CLuVArRbRA0VGeCsv2eJ1aIFkw6Elakegh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKDooQUzuGbCC6tWiOLRc4oeg0tATuizDKMq5qBC2EfqVTQfuzJoFjNbfnc1AA0czQebv6M+B9rYJ3yMcu9LBZNxZ0ThGVIWUPmfwOuAc1Glq/tM0J6ePiUELnjQtPGlwoXeJy1y6LH3d8/rlvbm5z9TkU1FkTWDEk+/Pca5vM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uRscP-0007dU-6k; Wed, 18 Jun 2025 15:14:21 +0200
Message-ID: <35925b11-175b-4185-8055-ba0374ce9a9a@pengutronix.de>
Date: Wed, 18 Jun 2025 15:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add compatible
 string fsl, ls1046a-wdt
To: Meng Li <Meng.Li@windriver.com>, krzk+dt@kernel.org, linux@roeck-us.net,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-2-Meng.Li@windriver.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250608030616.3874517-2-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org



On 6/8/25 05:06, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 8a6c3a75a547..34951783a633 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -37,6 +37,7 @@ properties:
>                - fsl,ls1012a-wdt
>                - fsl,ls1021a-wdt
>                - fsl,ls1043a-wdt
> +              - fsl,ls1046a-wdt
>                - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>  
> @@ -105,6 +106,7 @@ allOf:
>                  - fsl,ls1012a-wdt
>                  - fsl,ls1021a-wdt
>                  - fsl,ls1043a-wdt
> +                - fsl,ls1046a-wdt
>      then:
>        properties:
>          big-endian: false

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


