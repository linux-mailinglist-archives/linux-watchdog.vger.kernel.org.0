Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403335E93A9
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Sep 2022 16:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIYOlQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Sep 2022 10:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIYOlP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Sep 2022 10:41:15 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470B01143;
        Sun, 25 Sep 2022 07:41:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so10170258pjk.4;
        Sun, 25 Sep 2022 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=sigKRfSkAiO2kFqtIbx47IrV5wj83Mq/lBVxt9nCwyE=;
        b=UVKTidEKCVgkXPQ/bQz7C46knVD2p2JS/O8CEb4bZ9ELHkpmgXxfxYRMoorGhnwnJH
         w90QnvwBnysIPhGDX04NN7PYqMuOOGBUSeBEz/UKxcB2WVawEYS8mx0WKvC7twAoqHYx
         eZqhhdI/ZcffaBP+a4xHySFIodaXuHxXzCVXNJJGju6j+WQf8ZtI2fdPQqfVGv6HFdHQ
         WxxrtMbnkId9tJUicXiS2eypLlSv0JFZoGYvJ1zuDuvTt+Pn5nKWi0NWVD1B5f5r9Bnn
         1608QFR5yjgbnmoWguM+FoAafjg5QL/SK17SodFDfwncFqQdkM+o2zfecxfnb99Mmjxx
         JtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sigKRfSkAiO2kFqtIbx47IrV5wj83Mq/lBVxt9nCwyE=;
        b=vxexQWF75ENYDU1QiiVS2hjAbbOgwhYaEAKdCuU5evfDk111daBMkyjajkbFAWVQms
         0+ECn8L1l/lFbZfmCGgsT3ynCVxPXx2WE7S8Gc71fK9xFkkqVpKb8TJUIlSBwDhKQ5mu
         llmqqHY13x4J+4VG7ngf2k8m/6NoVRstl1PFwsSK/lYuX+0JVm7iRCt0FEGLT9/TcZWp
         B0uhrDVFy3fGCqFrax4LkRPdu7ZdnkE/Arq/Cr72Tr5W6ShO0BlmAqX5QbK1YUPaxa/u
         Agj6A3i6N+uwLjvwrocxn4l08mvtPV1YFpzomH9/rv593g8XkhMQxNyqQQJGpQXirUHB
         3FHw==
X-Gm-Message-State: ACrzQf21YQ9uId3GddIUFF0ATZ4kMns4nr2zO95mQT0eMdW5lftm82R2
        n3BPCq52t578FWPQUOvILNk=
X-Google-Smtp-Source: AMsMyM6FsjUUkVLQNxFxDrcrwBHZIep3P2qbOnjpucj/XJI3yYJo/Qt6ak+kiROpkzc6HBsMv5yElA==
X-Received: by 2002:a17:90b:350b:b0:202:8495:6275 with SMTP id ls11-20020a17090b350b00b0020284956275mr32415257pjb.216.1664116873726;
        Sun, 25 Sep 2022 07:41:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c79-20020a624e52000000b00553b37c7736sm9089286pfb.25.2022.09.25.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:41:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 07:41:11 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Message-ID: <20220925144111.GA1753424@roeck-us.net>
References: <20220823093233.8577-1-phil.edworthy@renesas.com>
 <20220823093233.8577-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823093233.8577-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Aug 23, 2022 at 10:32:32AM +0100, Phil Edworthy wrote:
> Add the documentation for the r9a09g011 SoC, but in doing so also
> reorganise the doc to make it easier to read.
> Additionally, make the binding require an interrupt to be specified.
> Whilst the driver does not need an interrupt, all of the SoCs that use
> this binding actually provide one.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v4:
>  - No change
> v3:
>  - Add check for too many interrupts or clocks
> v2:
>  - Added minItems for interrupt-names and clock-names
> ---
>  .../bindings/watchdog/renesas,wdt.yaml        | 73 +++++++++++++------
>  1 file changed, 52 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index a8d7dde5271b..0f5675d695d6 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -31,6 +31,11 @@ properties:
>                - renesas,r9a07g054-wdt    # RZ/V2L
>            - const: renesas,rzg2l-wdt
>  
> +      - items:
> +          - enum:
> +              - renesas,r9a09g011-wdt    # RZ/V2M
> +          - const: renesas,rzv2m-wdt     # RZ/V2M
> +
>        - items:
>            - enum:
>                - renesas,r8a7742-wdt      # RZ/G1H
> @@ -70,13 +75,29 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts: true
> -
> -  interrupt-names: true
> -
> -  clocks: true
> -
> -  clock-names: true
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Timeout
> +      - description: Parity error
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: wdt
> +      - const: perrout
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Register access clock
> +      - description: Main clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: pclk
> +      - const: oscclk
>  
>    power-domains:
>      maxItems: 1
> @@ -89,6 +110,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - interrupts
>    - clocks
>  
>  allOf:
> @@ -113,31 +135,38 @@ allOf:
>            contains:
>              enum:
>                - renesas,rzg2l-wdt
> +              - renesas,rzv2m-wdt
>      then:
>        properties:
> -        interrupts:
> -          maxItems: 2
> -        interrupt-names:
> -          items:
> -            - const: wdt
> -            - const: perrout
>          clocks:
> -          items:
> -            - description: Register access clock
> -            - description: Main clock
> +          minItems: 2
>          clock-names:
> -          items:
> -            - const: pclk
> -            - const: oscclk
> +          minItems: 2
>        required:
>          - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rzg2l-wdt
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +        interrupt-names:
> +          minItems: 2
> +      required:
>          - interrupt-names
>      else:
>        properties:
>          interrupts:
>            maxItems: 1
> -        clocks:
> -          maxItems: 1
>  
>  additionalProperties: false
>  
> @@ -145,9 +174,11 @@ examples:
>    - |
>      #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
>      #include <dt-bindings/power/r8a7795-sysc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>      wdt0: watchdog@e6020000 {
>              compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
>              reg = <0xe6020000 0x0c>;
> +            interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>              clocks = <&cpg CPG_MOD 402>;
>              power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>              resets = <&cpg 402>;
