Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3625E949F
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Sep 2022 19:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbiIYREg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Sep 2022 13:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiIYREf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Sep 2022 13:04:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B10BD71;
        Sun, 25 Sep 2022 10:04:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso4695350pjm.5;
        Sun, 25 Sep 2022 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=b0h2czVB/7Od2VAzQRnv6Sbu1dZeTnUR004aPG/rFw8=;
        b=pek1j/wvAQPNAhLApLtZl5UGDp6+M1BrCzKmHMZokDAB8qMuV7mGORGY1HQFxQ3P/t
         OHD9vuS+hrkbnvoDr730dtCiJOGlpAp8qReZwVdyJqe5E3TofqUnbUHoaIaoQyb9lytl
         ddPZfxmWttnNUAj0M2SGiatknpw+FW0NK1M16AOtrjdXlfw3nOI+I44SFngCmN+l1Scm
         8x+0RHmYwdabN29GA5b9zG2+7ttThopG/MftnmpDMRRUPG2NLJPMce7yq+uHGXDRbJP2
         CjLy6guqKap5XQe6K2r54BhOGvCyRbMYWr7u3ntWjRRNdPeIvrqPpSxB2AkOhT7I+qvN
         VaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b0h2czVB/7Od2VAzQRnv6Sbu1dZeTnUR004aPG/rFw8=;
        b=LcqbWNsLdLdQrt56KwRcUV5feEAz4KRr7p2fufFGqps8CK+cHz6mn1vRN//Yb0Eg1I
         u7zC6UE2mOBI/K+1fPuoKKifKM8AdEs03xS9pZ9jcoo2aoOmd7k1eY/9GEEioBF34pd1
         3f2NEZwZb5roFpnHdsmaTGa7CpZ3IkIvkjnUVc5BqEgXn1ZIFhEThNzQks9f01MTKHdf
         OAwvqlOdqVZFvK/Vvjy/77xrfXIEuRia6MO7ZlBeMu1Y+JIQnfk+gon2xmN3vS2bplRO
         4Gqn9FMDNko/oAwXjbxpJWjvhBXSdFPK+zTvwn4RZl8PVwXCpBE2nqofQAIk0F5OO2oA
         Ppfg==
X-Gm-Message-State: ACrzQf2nr6FGZaQIahYQagjS73gogaf+zh26x1nNf1DnpIxH0R//y135
        vJCBzRwKZQmq8ERJjmMl6h0=
X-Google-Smtp-Source: AMsMyM7JdbaQcggZYrdpuOBICj9n09KQNrJK6h43aZ6P3Ox8WtZ35Cxso+2u2F1/zhWOVku/pRDGSA==
X-Received: by 2002:a17:90b:4f90:b0:202:9be9:2c92 with SMTP id qe16-20020a17090b4f9000b002029be92c92mr32213253pjb.140.1664125471496;
        Sun, 25 Sep 2022 10:04:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902ec0600b0017839e5abfasm9345390pld.263.2022.09.25.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 10:04:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 10:04:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: add exynosautov9 compatible
Message-ID: <20220925170429.GA1761593@roeck-us.net>
References: <20220520121750.71473-1-chanho61.park@samsung.com>
 <CGME20220520121722epcas2p359f331c9276eeac5d027b0fe068296f1@epcas2p3.samsung.com>
 <20220520121750.71473-2-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520121750.71473-2-chanho61.park@samsung.com>
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

On Fri, May 20, 2022 at 09:17:47PM +0900, Chanho Park wrote:
> Adds "samsung,exynosautov9-wdt" to samsung-wdt compatible. This has two
> cpu watchdogs like exynos850.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index b08373336b16..8fb6656ba0c2 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -23,6 +23,7 @@ properties:
>        - samsung,exynos5420-wdt                # for Exynos5420
>        - samsung,exynos7-wdt                   # for Exynos7
>        - samsung,exynos850-wdt                 # for Exynos850
> +      - samsung,exynosautov9-wdt              # for Exynosautov9
>  
>    reg:
>      maxItems: 1
> @@ -67,6 +68,7 @@ allOf:
>                - samsung,exynos5420-wdt
>                - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
> +              - samsung,exynosautov9-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> @@ -76,6 +78,7 @@ allOf:
>            contains:
>              enum:
>                - samsung,exynos850-wdt
> +              - samsung,exynosautov9-wdt
>      then:
>        properties:
>          clocks:
