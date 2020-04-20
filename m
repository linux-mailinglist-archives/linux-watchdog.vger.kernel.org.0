Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FF11B1870
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Apr 2020 23:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgDTV3N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Apr 2020 17:29:13 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44395 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgDTV3N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Apr 2020 17:29:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id a2so5554992oia.11;
        Mon, 20 Apr 2020 14:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pVvaPy9TriCxXUNOlVqLauolz3jDKaAdK4fSEUctuf0=;
        b=EhU9p7YcOFSqelU8j2WjxdXSIdseLQd1/JOhYHqnAWUyEo5ygx4KRs9CmpI/jTvb5o
         CHwk8U9RA2S9hEcucR18BDuMAqwmrmBmE9kCGuWpltzI/agKINOZzhQOrxXRbVvb8cIZ
         huCyl5hdKRskHxt4IpHjb+o6IK/+CgmSG/2YJdlDs9+hxvZHktPRXzmB0m0qr9a5fy4l
         tfb+6BOtaquDC2FS9HIXgXscyjJg5ppSqyMB5hsT0ORc4s2eE59XwtwX4Jong/2Y6j8/
         itghq3Taqqka2iaE5wk2Zuwza7MYock52burp1/hSIQ16YIjDUOXHrRU4pERZnF7qjDH
         LFmQ==
X-Gm-Message-State: AGi0Pua23vH4fLO5beTFngf7Z1fVs4eWDtzt+3YrF1Brq9FoVetzo/sy
        hWykvBC2I1fH6QYe4GscGQ==
X-Google-Smtp-Source: APiQypKKosF3ptynJlahs4jhDzXsM68ALGaWcgwNZ/s1v7FiGz78riXbUIaqOwO7V7Tj/97B0k7ZMA==
X-Received: by 2002:aca:4588:: with SMTP id s130mr1047118oia.133.1587418152449;
        Mon, 20 Apr 2020 14:29:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t13sm225254otr.43.2020.04.20.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:29:11 -0700 (PDT)
Received: (nullmailer pid 16602 invoked by uid 1000);
        Mon, 20 Apr 2020 21:29:10 -0000
Date:   Mon, 20 Apr 2020 16:29:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 1/2] dt-bindings: watchdog: Convert i.MX to json-schema
Message-ID: <20200420212910.GB7615@bogus>
References: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 15, 2020 at 08:40:10AM +0800, Anson Huang wrote:
> Convert the i.MX watchdog binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change.
> ---
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.txt   | 24 ----------
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> deleted file mode 100644
> index adc6b76..0000000
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -* Freescale i.MX Watchdog Timer (WDT) Controller
> -
> -Required properties:
> -- compatible : Should be "fsl,<soc>-wdt"
> -- reg : Should contain WDT registers location and length
> -- interrupts : Should contain WDT interrupt
> -
> -Optional properties:
> -- big-endian: If present the watchdog device's registers are implemented
> -  in big endian mode, otherwise in native mode(same with CPU), for more
> -  detail please see: Documentation/devicetree/bindings/regmap/regmap.txt.
> -- fsl,ext-reset-output: If present the watchdog device is configured to
> -  assert its external reset (WDOG_B) instead of issuing a software reset.
> -- timeout-sec : Contains the watchdog timeout in seconds
> -
> -Examples:
> -
> -wdt@73f98000 {
> -	compatible = "fsl,imx51-wdt", "fsl,imx21-wdt";
> -	reg = <0x73f98000 0x4000>;
> -	interrupts = <58>;
> -	big-endian;
> -	timeout-sec = <20>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> new file mode 100644
> index 0000000..674d902
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX Watchdog Timer (WDT) Controller
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
> +      - fsl,imx21-wdt
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

Drop this. No description needed if single entry.

> +    maxItems: 1
> +
> +  fsl,ext-reset-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      If present, the watchdog device is configured to assert its
> +      external reset (WDOG_B) instead of issuing a software reset.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    wdog1: watchdog@20bc000 {

Drop the unused label.

> +        compatible = "fsl,imx21-wdt";
> +        reg = <0x020bc000 0x4000>;
> +        interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks IMX6QDL_CLK_IPG>;
> +    };
> +
> +...
> -- 
> 2.7.4
> 
