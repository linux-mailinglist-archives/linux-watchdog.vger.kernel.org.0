Return-Path: <linux-watchdog+bounces-339-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD78812990
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 08:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6CA71F211F5
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 07:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED78C12E63;
	Thu, 14 Dec 2023 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6W/vGRZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4165A3
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 23:39:49 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso57512625e9.2
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 23:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702539588; x=1703144388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VW4wVDHDIDRG/QG+aGoy/gqSKcXM6UwBG8v8hXKmGlA=;
        b=l6W/vGRZpK+v2pmqGZG1WYAvErxX2/wC+iJLfaeJ6n4Yst2nKDicfHaS8+zVkG+tIz
         e4RPWVmNcYFgBCU7+rzPAAP+3CLpxfV3THerVNfiFl4RhBgS4PuwDPdukpZ1QV8t7dPx
         4C74ZEp47vYjrAWgtuBHQqwNsz1N0xX8NZyCozo3LG4zNRhyjHM+r1rAeYUHf5Z4iPdI
         ri+ddsPrIYNgAhQCowAacKygbMlWnWKzcJWxeJLgz+fN++ujfwXzzFj5upfF2UYWeiAu
         F6TZeQ+qbP5XJ1fFhNzytDzYvzPPN+ousmtO7OaGRhis1h7N8Ncw4hCIbNNJ+75W93gt
         J/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539588; x=1703144388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW4wVDHDIDRG/QG+aGoy/gqSKcXM6UwBG8v8hXKmGlA=;
        b=g7yRavau/mNdDaChbxxUF7OCvLWmv/pNXX32wU3HoPW2ICK6OJ1zbzOG1XeHH3ArYt
         zll83DaNjngkhefDg+eHj1t9tx27GM9LG8IMciB0awsMxAmuqJAr3pyVdnnqMcr2eu+X
         Oew2TBR7W1T+HAsvE6UHnNhq4IIcG60//HP2sJKDh1PVFAPDZZX/gJ5yg9nrvbUU3Frj
         g0sgz6V71IPRS0ZEyqHidMEmbv1Hfsmom9HhEuHR7mv396p11T4Nx/lvp4oUeTnU9CEy
         XT1sLsfKk0z37Yt9+9bPpq7Qaq+iQop29DR2lTHh3cXecVDu6ODnKaXvN+6l284qwWwf
         EVIQ==
X-Gm-Message-State: AOJu0YxN/N48On1o6lj/cP0iPmXZJ22NBC1ePeqsBJHkjKIDzVePhudc
	Fj2LIzQYxRPx5cU7BaSs0nM5IA==
X-Google-Smtp-Source: AGHT+IFKfVsa71JYjz6AOShAoEET5JTqa7UESNpG9Wz3xkSPVHkkhcXSxiTRLFBGsag/bUgSJ0RlfQ==
X-Received: by 2002:a05:600c:430c:b0:409:6e0e:e948 with SMTP id p12-20020a05600c430c00b004096e0ee948mr3260793wme.1.1702539588412;
        Wed, 13 Dec 2023 23:39:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b00407b93d8085sm25890269wmb.27.2023.12.13.23.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 23:39:48 -0800 (PST)
Message-ID: <40b5d1a8-37d2-4c68-8d16-33c92c3e5716@linaro.org>
Date: Thu, 14 Dec 2023 08:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: watchdog: starfive,jh7100-wdt: Add
 compatible for JH8100
Content-Language: en-US
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231214033056.3953143-1-jisheng.teoh@starfivetech.com>
 <20231214033056.3953143-2-jisheng.teoh@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231214033056.3953143-2-jisheng.teoh@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 04:30, Ji Sheng Teoh wrote:
> Add "starfive,jh8100-wdt" compatible string for StarFive's JH8100
> watchdog.
> Since JH8100 watchdog only has 1 reset signal, update binding
> document to support one reset for "starfive,jh8100-wdt" compatible.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7100-wdt.yaml         | 48 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> index 68f3f6fd08a6..79082c5f9971 100644
> --- a/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7100-wdt.yaml
> @@ -19,14 +19,17 @@ description:
>    isn't cleared, the watchdog will reset the system unless the watchdog
>    reset is disabled.
>  
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - starfive,jh7100-wdt
> -      - starfive,jh7110-wdt
> +    oneOf:
> +      - items:

Drop items, it wasn't here in the first place.

> +          - enum:
> +              - starfive,jh7100-wdt
> +              - starfive,jh7110-wdt
> +      - items:
> +          - enum:
> +              - starfive,jh8100-wdt
> +          - const: starfive,jh7110-wdt
>  
>    reg:
>      maxItems: 1
> @@ -45,10 +48,33 @@ properties:
>        - const: core
>  
>    resets:
> +    minItems: 1
>      items:
>        - description: APB reset
>        - description: Core reset

This is not valid for jh8100. Move it to else: part. Here maxItems: 2.

>  
> +allOf:

allOf goes after required:, see example-schema

> +  - $ref: watchdog.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jh8100-wdt
> +    then:
> +      properties:
> +        resets:
> +          description: |
> +            Must contain Core reset entry.
> +          maxItems: 1

Instead of both, items: with description.

> +    else:
> +      properties:
> +        resets:
> +          description: |
> +            Must contain APB reset and Core reset entry.
> +          minItems: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -69,3 +95,13 @@ examples:
>          resets = <&rst 99>,
>                   <&rst 100>;
>      };
> +
> +  - |
> +    watchdog@12270000 {
> +        compatible = "starfive,jh8100-wdt", "starfive,jh7110-wdt";
> +        reg = <0x12270000 0x10000>;
> +        clocks = <&clk 78>,
> +                 <&clk 79>;

No need for new example with difference in one property.

Best regards,
Krzysztof


