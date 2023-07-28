Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBB67766D62
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jul 2023 14:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbjG1Mjr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Jul 2023 08:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbjG1Mjq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Jul 2023 08:39:46 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A1A930E1
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jul 2023 05:39:43 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so436392066b.0
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jul 2023 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690547981; x=1691152781;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rBzfWXB7xNQDsEV4qCRmgvtd9bp9OhfVonlnSy76S8=;
        b=A0D05NGxqfkg31cngaT2LDDxF3MQdZ3uo3q4ewllKU7r4sbqg+/pW0u7LK04KDAI3z
         FWFT1Xu2v0sY/fFwrj4D4bMCVc7o5Tb08dljKXwq8+mvtWTlraqN2xnYq8Pd/tXEStL/
         DLnKgnyNgGWefEPzk0F2v1GrnrVpaANTSmwPfnaTFYY367+nmp/QYdy+vBPZ2T3+/5V2
         bSuu5bdGrXkpD2E0oPRlOfmrCS2w4PHtPCtnWu06JcGfBqr10OJM0qE7kUGjA2Yj5tAr
         Uo+I+oRxfUp8kOROYhZ+ggZ1PnVtzlWAY9BF+O3Fhcd3meE7oqxU4ITONwBwgxZb1VVf
         NBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690547981; x=1691152781;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rBzfWXB7xNQDsEV4qCRmgvtd9bp9OhfVonlnSy76S8=;
        b=Qo50c8plnhOdqm6ArREvysyK3ghAPwFVmwKLWjOjRa3cO9hwM5NfcE5j/2uCwN2hde
         LWoR34XQPa9gb26786p51V8EZVWlO7jF42vUVp08Mxtx9N1kGGH7upoXOg1cOQzeQLNH
         VbrL9LdxzdLI3kAceqwlVg1gwJ7OnLF0+mIB4aL9cxLkHhH+27TddEphAGoQ7fEQm3Od
         t5/E4stOkSThDyyrBWTtES/U7lK4bK4Py/ZR0Ov/GNfYx6VirYRQiTsJhJDrcsMUeHHP
         YDIBiikX6ux/l2KcPCzFK3vpk7kIl9Q6fXglT0uNDeTU4IfJYAI2LXAX7+UoPBfLpS7X
         gGAw==
X-Gm-Message-State: ABy/qLbJJaUg7PRnMH4WaLN0V+TYQNA+d4xUA+zMCyC2y+1r70B5s112
        UHDvpGzStgMuuu9N7cjwSW89ew==
X-Google-Smtp-Source: APBJJlEWHsZu0sU6xKqxR3mcuZD7XYG2BIHCSX3zHi7HmYycGTD1JKEV0OksBYVVI8xrnx0iB3MgoA==
X-Received: by 2002:a17:907:7b9d:b0:98d:4b97:acc8 with SMTP id ne29-20020a1709077b9d00b0098d4b97acc8mr6574780ejc.25.1690547981591;
        Fri, 28 Jul 2023 05:39:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n16-20020a1709067b5000b009927a49ba94sm2009719ejo.169.2023.07.28.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:39:41 -0700 (PDT)
Message-ID: <bfd3d138-5cfa-1ee3-f578-1f2452900f9f@linaro.org>
Date:   Fri, 28 Jul 2023 14:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/50] dt-bindings: watchdog: sama5d4-wdt: add
 compatible for sam9x7-wdt
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, eugen.hristev@collabora.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230728102801.266709-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102801.266709-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/07/2023 12:28, Varshini Rajendran wrote:
> Add compatible microchip,sam9x7-wdt to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml      | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> index 816f85ee2c77..ce3d046e7244 100644
> --- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> @@ -14,10 +14,17 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - atmel,sama5d4-wdt
> -      - microchip,sam9x60-wdt
> -      - microchip,sama7g5-wdt
> +    oneOf:
> +      - items:

Drop items.

> +          - enum:
> +              - atmel,sama5d4-wdt
> +              - microchip,sam9x60-wdt
> +              - microchip,sama7g5-wdt
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-wdt
> +          - enum:

Not an enum.

It is surprising how the same change look different between two of your
patches.


Best regards,
Krzysztof

