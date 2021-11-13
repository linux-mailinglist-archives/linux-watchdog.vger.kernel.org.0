Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C443944F569
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 22:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbhKMVRS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 16:17:18 -0500
Received: from sibelius.xs4all.nl ([83.163.83.176]:50106 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhKMVRR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 16:17:17 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Nov 2021 16:17:16 EST
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 56ef4aee;
        Sat, 13 Nov 2021 22:07:42 +0100 (CET)
Date:   Sat, 13 Nov 2021 22:07:42 +0100 (CET)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org, sven@svenpeter.dev,
        wim@linux-watchdog.org, linux@roeck-us.net, marcan@marcan.st,
        alyssa@rosenzweig.io, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211113094732.73889-1-sven@svenpeter.dev> (message from Sven
        Peter on Sat, 13 Nov 2021 10:47:31 +0100)
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Apple Watchdog
References: <20211113094732.73889-1-sven@svenpeter.dev>
Message-ID: <d3cad37524f7debf@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> From: Sven Peter <sven@svenpeter.dev>
> Date: Sat, 13 Nov 2021 10:47:31 +0100
> 
> Apple SoCs come with a simple embedded watchdog. This watchdog is also
> required in order to reset the SoC.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../bindings/watchdog/apple,wdt.yaml          | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> new file mode 100644
> index 000000000000..e58c56a6fdf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC Watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"

I believew this should be:

  - $ref: /schemas/watchdog/watchdog.yaml#

with that fixed:

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>


> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-wdt
> +          - apple,t6000-wdt
> +      - const: apple,wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    wdt: watchdog@50000000 {
> +        compatible = "apple,t8103-wdt", "apple,wdt";
> +        reg = <0x50000000 0x4000>;
> +        clocks = <&clk>;
> +        interrupts = <AIC_IRQ 123 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b7a13f706fa..ba480837724d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1749,6 +1749,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
>  F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> +F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>  F:	arch/arm64/boot/dts/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> -- 
> 2.25.1
> 
> 
