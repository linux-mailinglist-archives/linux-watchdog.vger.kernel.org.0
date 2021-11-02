Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAB9442A9D
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Nov 2021 10:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhKBJsn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Nov 2021 05:48:43 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60246
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230333AbhKBJsm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Nov 2021 05:48:42 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB8863F1B6
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Nov 2021 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635846366;
        bh=AIE9FAySoNRsrP7PrL6ZA4sX/6rA6VP1KSokv/7FLdQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=iMxqROzVM8xBNf+M8akn9ynW+el17BQvEtDkn//gaBeQtWUk9PBjWU2TYLEtG+87V
         2u0FkWA5OtgWsQb72kfh4kiL3OryjL52eTGXvUaQWnh2UDxas8A0FIhOepvfcZexW9
         2Qu7V3HZCeuD93jxUImPvXG0+YSBJXimuI6LowVnWXCcrK+8kjrXcjlCOT7H1rcPOa
         yX5VoXtRxNf6nEmR9D1olDkZ0zt6EIpaID845ikWLyQC6/2Fiui8h9FlqOhVnIlP0J
         pmhpAj0ksusCH0XKNP5HszW8xzzlpKCSmbt4sfoY7XFXMkOlhCd3FI3ZNMmPCUIuvu
         U/cBmoWlQvTtA==
Received: by mail-lf1-f69.google.com with SMTP id b12-20020a0565120b8c00b003ffa7050931so6792661lfv.13
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Nov 2021 02:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AIE9FAySoNRsrP7PrL6ZA4sX/6rA6VP1KSokv/7FLdQ=;
        b=JaQq6Es2bSsV3G/eF2OcaCRUqgHsE+OgifV+Ks3yq90lATTePcXK+ZaCGkNH/72eY9
         KT048OonAsxlWEcq4mc6qIdgPXPoU6M4Mg9i5JwUmGKkUVpcvcAV0brcCQQikUJMbhqk
         W5jLUQwOqSm86RteNPe5NDSdmhLl3kJmXrQJJbfU/hsffiOwAOMsGBo+g9ELPZN0OCut
         0GYtioYRHvLlT4zxWHBXJrhLIV9LTIigGVNkrPwP1opDThl59hkgG6LwiFjUmgjcVZnw
         JTQW1AIuln0ogda8bZmxadGXW4N2tqGE0KT8bjrKeAuN6jR7DJfFNmDMSfXAZ43sbkEI
         Oxzg==
X-Gm-Message-State: AOAM5336WpP0sTzvnKpDiXwiEz4EnI9XB+egQIXxck6UDrxNzkk4I/0s
        izAsdYpWzysIsBxuIJUWa1xj11/4Yl281CY/5SfDShGykhcqyf1JkoEvPZzZ5ksZYF/O77gnBPO
        o4LsNYlSv06TW8gpe3ByjUaV2HfmUusVZxcPQVM84ODdd
X-Received: by 2002:a05:651c:158e:: with SMTP id h14mr2640491ljq.401.1635846365796;
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw341bie4LqR7uIAJM+FCfENRp0QNBPgOqp2JCB6H+SjqSWv2AkkbKW3S3/KlpYJAuR7O6XxQ==
X-Received: by 2002:a05:651c:158e:: with SMTP id h14mr2640474ljq.401.1635846365566;
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y19sm1637963lfa.123.2021.11.02.02.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:46:05 -0700 (PDT)
Message-ID: <ab1d3a57-37fb-2329-33a4-8fe40a472518@canonical.com>
Date:   Tue, 2 Nov 2021 10:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: Document Exynos850
 watchdog bindings
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Exynos850 SoC has two CPU clusters:
>   - cluster 0: contains CPUs #0, #1, #2, #3
>   - cluster 1: contains CPUs #4, #5, #6, #7
> 
> Each cluster has its own dedicated watchdog timer. Those WDT instances
> are controlled using different bits in PMU registers, new
> "samsung,index" property is added to tell the driver which bits to use
> for defined watchdog node.
> 
> Also on Exynos850 the peripheral clock and the source clock are two
> different clocks. Provide a way to specify two clocks in watchdog device
> tree node.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Stated explicitly that Exynos850 driver requires 2 clocks
>   - Used single compatible for Exynos850
>   - Added "index" property to specify CPU cluster index
>   - Fixed a typo in commit message: dedicater -> dedicated
> 
>  .../bindings/watchdog/samsung-wdt.yaml        | 44 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 93cd77a6e92c..f29d0ca4eced 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -22,25 +22,32 @@ properties:
>        - samsung,exynos5250-wdt                # for Exynos5250
>        - samsung,exynos5420-wdt                # for Exynos5420
>        - samsung,exynos7-wdt                   # for Exynos7
> +      - samsung,exynos850-wdt                 # for Exynos850
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
> -    items:
> -      - const: watchdog
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupts:
>      maxItems: 1
>  
> +  samsung,index:

Slightly more descriptive, e.g.:
samsung,cluster-index

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Index of CPU cluster on which watchdog is running (in case of Exynos850)
> +
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420 and Exynos7).
> +      Exynos5420, Exynos7 and Exynos850).
>  
>  required:
>    - compatible
> @@ -59,9 +66,38 @@ allOf:
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
> +              - samsung,exynos850-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos850-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, used for register interface
> +            - description: Source clock (driving watchdog counter)
> +        clock-names:
> +          items:
> +            - const: watchdog
> +            - const: watchdog_src
> +        samsung,index:
> +          enum: [0, 1]
> +      required:
> +        - samsung,index
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, which is also a source clock
> +        clock-names:
> +          items:
> +            - const: watchdog

Also under this else:
   samsung,cluster-index: false

>  
>  unevaluatedProperties: false
>  
> 


Best regards,
Krzysztof
