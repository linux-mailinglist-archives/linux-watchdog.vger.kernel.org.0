Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9304745475D
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237657AbhKQNhK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhKQNhJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:37:09 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF4BC061570;
        Wed, 17 Nov 2021 05:34:11 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so4727135ote.8;
        Wed, 17 Nov 2021 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eJ2h57U70O+XZY/9fLZ6/+QjQXZVa4MLDwNZ007lsdo=;
        b=SB/Xqt/30VGQo7aDUbtPd4/Lp774cJJ0KCamjXYMQ47KUSKCGRVGJq//RdcBFxprOJ
         s4C2AfxmSBh6IqMEzl0t5HrqX1Y6uClBoobtvPK2I+eq0J50m06/55Hb2HbD6L1B/8Nu
         4Y50fpDdzPs7YftkDqmw6ERrDPRb3Q4wPzJsOzl3LEPl26L2GIT14Arg0GVjFiHSFBoF
         edLvBCqiy6Tyksr3Jk9QoZxtyTGhW8Be8y6iBVE/l9vpSJzhSAfZ8F1Sis41ioqC8SoR
         BFlnZxueniS64EmfuoLzVBAdZ7JGGkwhAJsEgR1FJdkPjgCz2myqmi7JSSA3LbTdcH68
         3JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eJ2h57U70O+XZY/9fLZ6/+QjQXZVa4MLDwNZ007lsdo=;
        b=iJDOkGZVxSRWtye+G5uEz99ZO0BaUX7YXwfXqCic2JK6wJQo2TOws27mLPKgq9vNhY
         zrlUMVwjgtVwilvkWghvPCHP3QJQqhACCQ/lo9d9MgK1DLhP4ZV6IcfPa+jFpO6/+5oA
         xA5X8LOK4lNIcT6HOEJwmIoRe+Eimn5+JAG4JczCa0kY2b/RbdRLGLX9KdpZsnfLloEz
         XMIIyOiqo9KmsAatrQp8ddI9dfWowKYCk3NDuK7rsUr33SAcdet21YSxBh5hAOk5Oc3T
         sDceOV3G2bqUa14VeiAih2AhcJXKBvG+uNAtB3wBjqODH1x/XOOx3tOcTz2XLlu3exxz
         P8lw==
X-Gm-Message-State: AOAM530PyhnBaTYbQzgZGq7qbuHkky7ftM+OFo7IzHZNqDDQgf43Er45
        s39mdCcj0nsk6WOSAwEg9vI=
X-Google-Smtp-Source: ABdhPJxa7FsXXTIlRNIpY7q8YXjk9n5N0nGsvSUen66dQCJNICV9vG7cwD4qQEVjhJUI77+OTVdj0g==
X-Received: by 2002:a05:6830:270c:: with SMTP id j12mr13790544otu.231.1637156050961;
        Wed, 17 Nov 2021 05:34:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f32sm4236809otf.35.2021.11.17.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:34:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:34:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: watchdog: Document Exynos850
 watchdog bindings
Message-ID: <20211117133409.GB2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:33PM +0200, Sam Protsenko wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Renamed "samsung,index" property to more descriptive
>     "samsung,cluster-index"
>   - Disabled "samsung,cluster-index" property for SoCs other than
>     Exynos850
> 
> Changes in v2:
>   - Stated explicitly that Exynos850 driver requires 2 clocks
>   - Used single compatible for Exynos850
>   - Added "index" property to specify CPU cluster index
>   - Fixed a typo in commit message: dedicater -> dedicated
> 
>  .../bindings/watchdog/samsung-wdt.yaml        | 45 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 93cd77a6e92c..b08373336b16 100644
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
> +  samsung,cluster-index:
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
> @@ -59,9 +66,39 @@ allOf:
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
> +        samsung,cluster-index:
> +          enum: [0, 1]
> +      required:
> +        - samsung,cluster-index
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, which is also a source clock
> +        clock-names:
> +          items:
> +            - const: watchdog
> +        samsung,cluster-index: false
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.30.2
> 
