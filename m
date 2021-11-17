Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10FE45475A
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237605AbhKQNgy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhKQNgx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:36:53 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2721DC061570;
        Wed, 17 Nov 2021 05:33:55 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso4775842otr.2;
        Wed, 17 Nov 2021 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h8IGQMb0erjUKL1xjZe1XLR4Mk4lsb3qRDwWaS0JiAA=;
        b=CLuF6ak2zCfniZ+XBAvWakd6bCiw3JYVB3OHJjMXzNF+Nxp/8ley1FBdqq4G/rHaI8
         6t54ZzCSgNqKNf2hRyK57l2GBIJJXwdeFNKQDCZ0skPjsSJrv99PDbkSTy+pw06+7lch
         UPh1cJbMK6JdR3c8T645K5FgXHEKeJpyIF+mfshfyO+Z0O5V6sT5VYYvxDLMpTEcAw4m
         IqitOxZsooRATydzULtCrJk7LvRWEYREno4DMHHUJuu/Q0HPzIleV6UFlPJVZXQpVCMi
         6GMdL2PW5on9BgQc4OlqjbbjrHAry2dKGrNDR7YNR/G7AnQizusT4lCq6Lyg33JDjKX/
         XnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=h8IGQMb0erjUKL1xjZe1XLR4Mk4lsb3qRDwWaS0JiAA=;
        b=Uvxs09hy1YAi46ZY2aFMMExZz94KcVpkfr2KkzhE6oyG+lUKUYkfX4JVWVtUfZIb0f
         LcwzYjNCTN/Eof9EI3Pq+mbhYHLNOeJogXkrpXxYuRVbhWeP+rBNxiECSDNjV76h5Pzf
         4p6sFTw66C7n7pOqRUs5iTOk2zCZNR/rlnjGAvX8yBjGx6G0XH+RRplNapd8NJxRBDPN
         F6AcLdMp2kafnNFEF+rBuotGwoe5M8/uf/FAr7zwD1wW45BdakocomjP8kTojKeCrPTN
         ogN7/GYETZv4qEbdGAl89OQeDfDAKLqe6QWQGfDLRta5sjenrXkbI1BW3M8XxwXvxxhc
         IN+w==
X-Gm-Message-State: AOAM533Q98bV+45LWlvOk4X2s5FbrEN2nQRCByNO4AHYlGb2GCE+U2de
        6IyN7Aeg1Urd+v27NbNQXX0=
X-Google-Smtp-Source: ABdhPJxLazLcFA1HX/Su+OgejZxVktBZJPe+o+ukEQMjpwMXoCMe7IJUu1T7GJVhgYbEEq3lZ5nXaA==
X-Received: by 2002:a9d:61ce:: with SMTP id h14mr13760606otk.303.1637156034573;
        Wed, 17 Nov 2021 05:33:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n189sm4474594oif.33.2021.11.17.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:33:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:33:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: watchdog: Require
 samsung,syscon-phandle for Exynos7
Message-ID: <20211117133351.GA2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:32PM +0200, Sam Protsenko wrote:
> Exynos7 watchdog driver is clearly indicating that its dts node must
> define syscon phandle property. That was probably forgotten, so add it.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog device on Exynos7")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Rob Herring
> 
> Changes in v2:
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added "Fixes" tag
> 
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 76cb9586ee00..93cd77a6e92c 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -39,8 +39,8 @@ properties:
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -      Phandle to the PMU system controller node (in case of Exynos5250
> -      and Exynos5420).
> +      Phandle to the PMU system controller node (in case of Exynos5250,
> +      Exynos5420 and Exynos7).
>  
>  required:
>    - compatible
> @@ -58,6 +58,7 @@ allOf:
>              enum:
>                - samsung,exynos5250-wdt
>                - samsung,exynos5420-wdt
> +              - samsung,exynos7-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> -- 
> 2.30.2
> 
