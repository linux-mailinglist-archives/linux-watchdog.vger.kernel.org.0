Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DE91B186A
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Apr 2020 23:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgDTV1y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Apr 2020 17:27:54 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38014 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgDTV1y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Apr 2020 17:27:54 -0400
Received: by mail-oi1-f196.google.com with SMTP id r66so10197232oie.5;
        Mon, 20 Apr 2020 14:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XubFQFGj+oE5E81AV09uEAWEQbJMsk1LmCjakkP+xS8=;
        b=cXXQur5XI1hPr0gk1XS4o4L08LI7Z8bpK8goE3pUPBssZBJDRH5ivIYhF5JVRmfsHR
         E+YcIEe0UwoMdjVFUst5Am8k+A5kr9UPzUyg1INnwQX3Jac40KyAbw+y7yJ3LsQnApzG
         P6pd15ONbzq5pRIuW4tU3grUEGmDbZPypLGrvULHQpitxpusWDiGrB2g4WBRbWNvWYpi
         7Xt3S3/wi9aCvmdqcDk92+jDJ4n9x5s112EAvTUtDoN0Um/ZYPum4ZJAo88WXSmaEoTn
         gDvrsvJlB4G7RvMCg4mm3OtvSAV2GIE8bDdRuJ/YuvWf0WcjEIoKziRNWiX6vk1OiSjz
         h2pA==
X-Gm-Message-State: AGi0PuYODOl6EvIEfyR/TxN+IdqKsqD4mRYMmup0P75hal3qJvowSBRj
        UHPlEIpSY3Lu9ao68X1bpg==
X-Google-Smtp-Source: APiQypKA8/DjgklKphF/q6s1sPMusvYqMqJJGh1gdjSYDDBmjDBbaTp+L99fqFcY2mwLoCgx5i9uAQ==
X-Received: by 2002:aca:6143:: with SMTP id v64mr1039248oib.36.1587418073095;
        Mon, 20 Apr 2020 14:27:53 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 69sm218723otm.60.2020.04.20.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:27:52 -0700 (PDT)
Received: (nullmailer pid 13638 invoked by uid 1000);
        Mon, 20 Apr 2020 21:27:51 -0000
Date:   Mon, 20 Apr 2020 16:27:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 2/2] dt-bindings: watchdog: Convert i.MX7ULP to
 json-schema
Message-ID: <20200420212751.GA7615@bogus>
References: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
 <1586911211-1141-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586911211-1141-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 15, 2020 at 08:40:11AM +0800, Anson Huang wrote:
> Convert the i.MX7ULP watchdog binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- Add 'timeout-sec' property to avoid build error.
> ---
>  .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 --------
>  .../bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 65 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> deleted file mode 100644
> index f902508..0000000
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Freescale i.MX7ULP Watchdog Timer (WDT) Controller
> -
> -Required properties:
> -- compatible : Should be "fsl,imx7ulp-wdt"
> -- reg : Should contain WDT registers location and length
> -- interrupts : Should contain WDT interrupt
> -- clocks: Should contain a phandle pointing to the gated peripheral clock.
> -
> -Optional properties:
> -- timeout-sec : Contains the watchdog timeout in seconds
> -
> -Examples:
> -
> -wdog1: watchdog@403d0000 {
> -	compatible = "fsl,imx7ulp-wdt";
> -	reg = <0x403d0000 0x10000>;
> -	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> -	assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> -	assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> -	timeout-sec = <40>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> new file mode 100644
> index 0000000..86b4d93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/fsl-imx7ulp-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX7ULP Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7ulp-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Watchdog's clock source.
> +    maxItems: 1
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clocks-parents:
> +    maxItems: 1
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Contains the watchdog timeout in seconds.

This already has a definition in watchdog.yaml, just need:

timeout-sec: true

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx7ulp-clock.h>
> +
> +    wdog1: watchdog@403d0000 {
> +        compatible = "fsl,imx7ulp-wdt";
> +        reg = <0x403d0000 0x10000>;
> +        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> +        assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> +        assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> +        timeout-sec = <40>;
> +    };
> +
> +...
> -- 
> 2.7.4
> 
