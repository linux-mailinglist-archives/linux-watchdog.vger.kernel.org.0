Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ADC1BBCEE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgD1L7v (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 07:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgD1L7v (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 07:59:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF28CC03C1AB
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Apr 2020 04:59:50 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y3so1032182lfy.1
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Apr 2020 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ci6AnaZs+phF6Uq7cCmI4TbqBRGDetYLVHrxk+OWc8Y=;
        b=ZPEwPF+P/0xkAz9yaF0uD9im7GoReeJYOoUhaZEgqRiqcbs9+abPWP/KebN/t3Tqtv
         qn6x/P8RpKqGI7HypSxJjFVe1hmh3Xv50WIBDSr/0ONOrO3Uslr0erWXNDHUodqlEfxn
         xLuinBg/ixAXf7molK5YqfC0hsTTIHr9oq9TlXEMXIGJuXGiScV7VrWhBEEcqUhqfHPB
         exlGrOoeo/q1g3VdSVda4S5QCM100lm7bNiQqYdo6ZLPifmyy9vYIFPAJdNR6X5HGAKp
         d9bdjr9fNp9OpQyBdgG0ApGRuERvNGq/ncbY9qjPBWhxVrSxtY7wsJBWWFvy8Wf1uKqT
         DFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ci6AnaZs+phF6Uq7cCmI4TbqBRGDetYLVHrxk+OWc8Y=;
        b=sCj0p+rC7ZyAMUDLC6d3CGeb4vG5aMoTcRbguHsb5iBUrRtcUsm1ChMRxy1EJX1xkb
         /SUysi4vcPQEzJlRRMAr3J0ig/OJ0DWf+G/G7Ilr0FFbx6P1IXgyhdWW/bSxcKySVane
         W+ntyT/V1osrSqxYNSmqq1GrrjPIin870x1RP+kF7NtHOYR1W7DwdIAyPaFUT9DwCbf7
         GK3PthjqyOlGQGHslZccGjDhspHD2s7/aYkBbKvTeyMgSof3VfWCsOd4EQ18NC8XUkS0
         DAYtEsGeUBZKVqb9hUI1egwGF+LXGXR/wQiRGDhly8mUWVhCw+/5mKdJCTb9DV6kjRpv
         7N7w==
X-Gm-Message-State: AGi0Pua4CZqS04uPv8S/bWSKwhRvuYnEUZ8Zf0XQXrbVGRxe9q4kAxF3
        35OKNoYDcCF3LKvSGbJhF3bTzw==
X-Google-Smtp-Source: APiQypLnDUnvyacSwLSYAYfJKo3gWIU/uhkoHOKBJOlia2z57wfmR2TD7zhqwWzsVtoguKUseoi/mg==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr19148619lfl.125.1588075189187;
        Tue, 28 Apr 2020 04:59:49 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t12sm14179453lfq.71.2020.04.28.04.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 04:59:48 -0700 (PDT)
Date:   Tue, 28 Apr 2020 13:59:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Convert to
 json-schema
Message-ID: <20200428115947.GA1372619@oden.dyn.berto.se>
References: <20200427192522.28365-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427192522.28365-1-geert+renesas@glider.be>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-04-27 21:25:22 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Watchdog Timer (WDT) Controller Device Tree binding
> documentation to json-schema.
> 
> Add missing "renesas,r8a77980-wdt" compatible value.
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/watchdog/renesas,wdt.txt         |  50 ---------
>  .../bindings/watchdog/renesas,wdt.yaml        | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> deleted file mode 100644
> index 79b3c62f183d26dc..0000000000000000
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Renesas Watchdog Timer (WDT) Controller
> -
> -Required properties:
> - - compatible : Must be "renesas,<soctype>-wdt", followed by a generic
> -		fallback compatible string when compatible with the generic
> -		version.
> -	       Examples with soctypes are:
> -		 - "renesas,r8a7743-wdt" (RZ/G1M)
> -		 - "renesas,r8a7744-wdt" (RZ/G1N)
> -		 - "renesas,r8a7745-wdt" (RZ/G1E)
> -		 - "renesas,r8a77470-wdt" (RZ/G1C)
> -		 - "renesas,r8a774a1-wdt" (RZ/G2M)
> -		 - "renesas,r8a774b1-wdt" (RZ/G2N)
> -		 - "renesas,r8a774c0-wdt" (RZ/G2E)
> -	         - "renesas,r8a7790-wdt" (R-Car H2)
> -	         - "renesas,r8a7791-wdt" (R-Car M2-W)
> -	         - "renesas,r8a7792-wdt" (R-Car V2H)
> -	         - "renesas,r8a7793-wdt" (R-Car M2-N)
> -	         - "renesas,r8a7794-wdt" (R-Car E2)
> -	         - "renesas,r8a7795-wdt" (R-Car H3)
> -	         - "renesas,r8a7796-wdt" (R-Car M3-W)
> -	         - "renesas,r8a77961-wdt" (R-Car M3-W+)
> -		 - "renesas,r8a77965-wdt" (R-Car M3-N)
> -	         - "renesas,r8a77970-wdt" (R-Car V3M)
> -	         - "renesas,r8a77990-wdt" (R-Car E3)
> -	         - "renesas,r8a77995-wdt" (R-Car D3)
> -	         - "renesas,r7s72100-wdt" (RZ/A1)
> -	         - "renesas,r7s9210-wdt"  (RZ/A2)
> -		The generic compatible string must be:
> -		 - "renesas,rza-wdt" for RZ/A
> -		 - "renesas,rcar-gen2-wdt" for R-Car Gen2 and RZ/G1
> -		 - "renesas,rcar-gen3-wdt" for R-Car Gen3 and RZ/G2
> -
> -- reg : Should contain WDT registers location and length
> -- clocks : the clock feeding the watchdog timer.
> -
> -Optional properties:
> -- timeout-sec : Contains the watchdog timeout in seconds
> -- power-domains : the power domain the WDT belongs to
> -- interrupts: Some WDTs have an interrupt when used in interval timer mode
> -
> -Examples:
> -
> -	wdt0: watchdog@e6020000 {
> -		compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
> -		reg = <0 0xe6020000 0 0x0c>;
> -		clocks = <&cpg CPG_MOD 402>;
> -		power-domains = <&cpg>;
> -		timeout-sec = <60>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> new file mode 100644
> index 0000000000000000..27e8c4accd67bfff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r7s72100-wdt     # RZ/A1
> +              - renesas,r7s9210-wdt      # RZ/A2
> +          - const: renesas,rza-wdt       # RZ/A
> +
> +      - items:
> +          - enum:
> +              - renesas,r8a7743-wdt      # RZ/G1M
> +              - renesas,r8a7744-wdt      # RZ/G1N
> +              - renesas,r8a7745-wdt      # RZ/G1E
> +              - renesas,r8a77470-wdt     # RZ/G1C
> +              - renesas,r8a7790-wdt      # R-Car H2
> +              - renesas,r8a7791-wdt      # R-Car M2-W
> +              - renesas,r8a7792-wdt      # R-Car V2H
> +              - renesas,r8a7793-wdt      # R-Car M2-N
> +              - renesas,r8a7794-wdt      # R-Car E2
> +          - const: renesas,rcar-gen2-wdt # R-Car Gen2 and RZ/G1
> +
> +      - items:
> +          - enum:
> +              - renesas,r8a774a1-wdt     # RZ/G2M
> +              - renesas,r8a774b1-wdt     # RZ/G2N
> +              - renesas,r8a774c0-wdt     # RZ/G2E
> +              - renesas,r8a7795-wdt      # R-Car H3
> +              - renesas,r8a7796-wdt      # R-Car M3-W
> +              - renesas,r8a77961-wdt     # R-Car M3-W+
> +              - renesas,r8a77965-wdt     # R-Car M3-N
> +              - renesas,r8a77970-wdt     # R-Car V3M
> +              - renesas,r8a77980-wdt     # R-Car V3H
> +              - renesas,r8a77990-wdt     # R-Car E3
> +              - renesas,r8a77995-wdt     # R-Car D3
> +          - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - renesas,rza-wdt

:-)

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +then:
> +  required:
> +    - power-domains
> +    - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +    wdt0: watchdog@e6020000 {
> +            compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
> +            reg = <0xe6020000 0x0c>;
> +            clocks = <&cpg CPG_MOD 402>;
> +            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +            resets = <&cpg 402>;
> +            timeout-sec = <60>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
