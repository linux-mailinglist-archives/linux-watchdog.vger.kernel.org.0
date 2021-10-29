Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7422143F859
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 10:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhJ2IEf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 04:04:35 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39072
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232236AbhJ2IEe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 04:04:34 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D67F43F19E
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635494525;
        bh=YZHX5XPqeCgDiFoFSMyeZ0BtWYEy7HV1zu3lUGcO6rM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=O2ZpQ6RwzJoEDU+snFjWALD9NtoI2SD1BKJPe0deqeOgV6Eby/T2AAuTM2+5FB0oM
         Uq0uCPojpx4DU73W5u89P6owkkQ/tWf8ZsPPXrXLJmJ2BQNyVjw4Q4eqqZOw00NVNe
         tbrdKvrX793lXdDQIH1YZOdxxay1ZLF5Z5TqZWAMeatHGLUJnZLdOpiOVFIzxTvrre
         rFt9p4PhaRIucva+cOzpvI1Eo1CEVYFTS7NDe92HQYes4q5f+/Y8EKfK7O2mx5SOui
         hnroIafOqO1GOcf0bjXLW6STFTokL4GOVm1M4b0t0v+z4ON0jk8yLnMXf1zfDlsoxK
         6bGSRxRw4cAyw==
Received: by mail-lj1-f200.google.com with SMTP id d20-20020a2e8114000000b00212bedb4998so695191ljg.14
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 01:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YZHX5XPqeCgDiFoFSMyeZ0BtWYEy7HV1zu3lUGcO6rM=;
        b=NBBNYgTwIwihpCX0JaqJGNT/p2nvzWx/jLFxRjjoYL/T8XQuZF2lXj3JIN1Fps+22H
         k+ezhwppbSQiaMcBsIoIPtywn3vgcfKDuvfoMveQO0P10l6mKP2d5KCJlnRZxNIrsDzB
         ipzCBPA+d98R9ze3NdaL2/cDZnsQo/vnKF7Cj33OqUdkyvchSnkJM8x+CGjORA2YOa1b
         HoLaRog0wJnOpYOayr+kKMmiKRH4G+ENDOHaFXvhkjzipjm9A4mgPULi9fyc7IBM0Svn
         FW5UyZ88sdJvqZeNZZM/xshOjeYy8TbFnX5p6mxTxaTMc4jeC0azqZxhFHO2d4gUX9wj
         aRSw==
X-Gm-Message-State: AOAM530kQXfa9uXaVneHPLYDVaEtsxO35nxgy8Km011UU8AJdnJTEfB0
        AUCpf8UBKmdj2qIEWIqRg3oLWZPkkxBrp2HITQJQVaIP0HlwVt7fcpFl1gOrHme6wEqtr1DWoU3
        0hGevEgcsaAEVMcdQ9Gpyj0CboRbQumh31fUYFbpMBkqd
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr9086992lfm.484.1635494525193;
        Fri, 29 Oct 2021 01:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAjnJ8XQoAHqEARf5VyzKcgRTHX/sDddni3/2wZIwVLFfjC+xdgOo+HOWeD/ogCW/dZJmcIA==
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr9086978lfm.484.1635494525019;
        Fri, 29 Oct 2021 01:02:05 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c27sm537130lfm.59.2021.10.29.01.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:02:04 -0700 (PDT)
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: Document Exynos850 watchdog
 bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <33c823c6-c105-68f1-e7c8-de6c27c5c33c@canonical.com>
Date:   Fri, 29 Oct 2021 10:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/10/2021 20:35, Sam Protsenko wrote:
> Exynos850 SoC has two CPU clusters:
>   - cluster 0: contains CPUs #0, #1, #2, #3
>   - cluster 1: contains CPUs #4, #5, #6, #7
> 
> Each cluster has its own dedicater watchdog timer. Those WDT instances
> are controlled using different bits in PMU registers, so there should be
> two different compatible strings (for each cluster), to tell the driver
> which bits to use for each WDT instance.
> 
> Also on Exynos850 the peripheral clock and the source clock are two
> different clocks. Provide a way to specify two clocks in watchdog device
> tree node.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 93cd77a6e92c..19c7f7767559 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -22,16 +22,24 @@ properties:
>        - samsung,exynos5250-wdt                # for Exynos5250
>        - samsung,exynos5420-wdt                # for Exynos5420
>        - samsung,exynos7-wdt                   # for Exynos7
> +      - samsung,exynos850-cl0-wdt             # for Exynos850 (CPU cluster 0)
> +      - samsung,exynos850-cl1-wdt             # for Exynos850 (CPU cluster 1)

I would prefer to have one compatible and additional u32 property
pointing to cluster index. The driver would use this property to adjust
the PMU register offsets or bits.

Why? Because if next time you have three clusters, you will need to make
three compatibles for something which differs by only two register
offsets. Both watchdog instances (or three in some unspecified future)
are here the same, they just control different blocks, therefore should
accept some parameter instead of making them different compatibles.

>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Peripheral clock used for register interface; if it's the
> +                     only clock, it's also a source clock
> +      - description: Source clock (optional)
>  
>    clock-names:
> +    minItems: 1
>      items:
>        - const: watchdog
> +      - const: watchdog_src

Don't you require src clock on Exynos850?



Best regards,
Krzysztof
