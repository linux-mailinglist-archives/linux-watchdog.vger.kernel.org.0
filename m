Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493C14FA9A7
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Apr 2022 18:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241492AbiDIQph (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 9 Apr 2022 12:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbiDIQpf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 9 Apr 2022 12:45:35 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2310128E2B
        for <linux-watchdog@vger.kernel.org>; Sat,  9 Apr 2022 09:43:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v15so3296498edb.12
        for <linux-watchdog@vger.kernel.org>; Sat, 09 Apr 2022 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q2Xgrp2SvwSgy23wzVIg4eWWwU/q3lLMvMENos7vSco=;
        b=WPkK7WqS+9VyphmH4DzUlDA2VtRDTpcKYuK2SHqPk/Sgy1ZJXGPWhilZ56r9NRaD54
         w12G5FzPAKESkVLeSgLLe/TwgEnMtHM1RjvrZ5vv8gf8pP2CVdkFj0yHA4arB+qZ512o
         6iklEqmaDYMmBCeWYrUwEtkJIOI7nUOEsBjUM+u7D4k9OW3u0HjWBemszqvjta9ejEI1
         NYoibLGq4zj6pRGeO4AZpgPboQDM8A8OUfXbMDJFfPB1Ob4PYdq6iaEfaHSsXe2B2mQb
         O/WND9wDzOXtdtWvYNcgC1BEXCQuYyDXJJACc9jCWxKDyZ4vi0TvO30L2lnLuTMdNxEj
         o5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q2Xgrp2SvwSgy23wzVIg4eWWwU/q3lLMvMENos7vSco=;
        b=NPZWBfy5apd41c0ZrBHCjitE9CZcR3u8O3V/CPrZrWb+2bRBIschQVZp2NQwAp2nLr
         R7/8z/Nu3T2Dn7ZOhPYbTKCFgjV4RH2Gs3mJ89xQ3Lh/zGjrbxspy8hdSXJMUFKHtapt
         fb7Xkdh0CCSdmS2Fl5f9Qse9EmlQRMxOv1jBQVHF8HhdtJ5BonqJCVcA03LNvobYIu5C
         mWbtUXvOZF9upX2t9tHVDUsF9/2O+WYFfK1hzcAtL2Z3ZdFQl9vfy7Y+9MFmQImGDuYO
         6eY6IRDyg2bZsB2K8sOI3BcJsCm8qc2lrFACppI8DiELYVmY4ylBRV0oCz2CuIe92E5z
         J+1Q==
X-Gm-Message-State: AOAM533j/zVDhwHYs+b/R0qLIHx38sFXaxta0hs/dbwuFdG+nzmZFEXN
        cMfL41lnIY9XqNz34jnz7GkMnQ==
X-Google-Smtp-Source: ABdhPJxItMkFoN+71dJAmgY4CgUb2u9HoeScZoyiwkXHZZapD1U5eSQywJx4BHh3SJ/VFXak2lPGZg==
X-Received: by 2002:a50:d4d9:0:b0:41d:6ee0:80d with SMTP id e25-20020a50d4d9000000b0041d6ee0080dmr2512412edj.254.1649522606745;
        Sat, 09 Apr 2022 09:43:26 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j12-20020a056402238c00b0041ce094cf47sm6588602eda.60.2022.04.09.09.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:43:26 -0700 (PDT)
Message-ID: <f2b65fad-6c95-493d-1714-d9d3fcfb2705@linaro.org>
Date:   Sat, 9 Apr 2022 18:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: watchdog: Add SC8180X and SC8280XP
 compatibles
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220408212854.581481-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408212854.581481-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08/04/2022 23:28, Bjorn Andersson wrote:
> Add compatibles for the SC8180X and SC8280XP platforms to the Qualcomm
> watchdog binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
