Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E2F29EE5F
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 15:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgJ2OfR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 10:35:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbgJ2OfR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 10:35:17 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCDB820825;
        Thu, 29 Oct 2020 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603982116;
        bh=NjCLBLN1s5/OvjkAdf/CApoQzyKpqMjSB64Sql133xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuwWNOnkCHWgL51XIbCYqYP8ZzAsgJB42MqL1fjUJ/0QYjMe0A7iDwh/U8KGBk28u
         qQ5ZY9klAblUFQMqf5PsQDaDLekIxZqi4MYC2tCrOIJB58cJD/5nODKr2INTXFYqrS
         fQV/FoWRmXg0/wNN2pEUmHekX4hlmUHemYlVpiHc=
Date:   Thu, 29 Oct 2020 22:35:09 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: fsl-imx: document i.MX
 compatibles
Message-ID: <20201029143508.GO28755@dragon>
References: <20200926162302.32525-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926162302.32525-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Sep 26, 2020 at 06:23:00PM +0200, Krzysztof Kozlowski wrote:
> Document all ARMv5, ARMv6 and ARMv7 i.MX compatibles used in DTSes (even
> though driver binds only to fsl,imx21-wdt) to fix dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/imx53-qsb.dt.yaml: gpio@53fe0000: compatible:
>     ['fsl,imx53-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> index 991b4e33486e..a06e70f44fd0 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -18,10 +18,24 @@ properties:
>        - const: fsl,imx21-wdt
>        - items:
>            - enum:
> +              - fsl,imx25-wdt
> +              - fsl,imx27-wdt
> +              - fsl,imx31-wdt
> +              - fsl,imx35-wdt
> +              - fsl,imx50-wdt
> +              - fsl,imx51-wdt
> +              - fsl,imx53-wdt
> +              - fsl,imx6q-wdt
> +              - fsl,imx6sl-wdt
> +              - fsl,imx6sll-wdt
> +              - fsl,imx6sx-wdt
> +              - fsl,imx6ul-wdt
> +              - fsl,imx7d-wdt
>                - fsl,imx8mm-wdt
>                - fsl,imx8mn-wdt
>                - fsl,imx8mp-wdt
>                - fsl,imx8mq-wdt

Could you add the following two as well?

    - fsl,ls1012a-wdt
    - fsl,ls1043a-wdt

Shawn

> +              - fsl,vf610-wdt
>            - const: fsl,imx21-wdt
>  
>    reg:
> -- 
> 2.17.1
> 
