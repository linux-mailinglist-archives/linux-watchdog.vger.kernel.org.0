Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3ACD6C0E78
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Mar 2023 11:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCTKQx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Mar 2023 06:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjCTKQw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Mar 2023 06:16:52 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A59113C4
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Mar 2023 03:16:51 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r11so44523131edd.5
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Mar 2023 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679307410;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cp2vcmT9t7MwTIVUhMaRHgkJtFsq3TIFJhEabjBhHw=;
        b=Sf2AK1h17dFTqQdc8T5OXngd3bKxjdnHs+jR3C8FZScRTy+ScAkn3r1qSguhGmT3ot
         PUHgpjarbh1R0yMhkh6qE3yxI2NndF4x7Jl/+RKqoBw7cFOwdIt4Nv7d7y2GTx6l24hd
         YTDR1qGFJ0zKnUQlVlOeMPzNTcYRVmWcaXu1YbZN03qwr+jjgd8mcAhkDPjRQl5M5yoL
         W2+fw93ZZ2tzTYsSWy0/5wJmdwWJzZq4p1mFPY1mGqR9ccQg79A+de/fFbph1Ci6EDzB
         TlCuwdiGSmk5BwiDVn6BJkmW99YHjyjskgymaIJ8jXM0wB8jNrKqEQuwIm2TMclJnoud
         FNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307410;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cp2vcmT9t7MwTIVUhMaRHgkJtFsq3TIFJhEabjBhHw=;
        b=SHfFj9LmWCVx+lPgm0AmYyGbnuxLFJorqOqGJv4xqYylUVB39ZuH+vL4b/TSuW+HAU
         LSCmwUNkkg9oV3xgV66aCCnh/30UuAlFVuCFmueyjTBXXeu95fgvYFcRYDiEjZixlHXW
         p5hhD+EFH0lJI0UmaTkIliKdncr0SnRXLaGarveYB/Elr0QUf25LhWvFRutTfuiVLr8V
         EHKUoXWZZ2CDe4+r56UiEt5aMxF1hReqZ/iVx9St6PuwDdrQsrn8lWO4Ja7EiWdJNAyE
         d/Fe8M8aBGmF3on/u7t8/Ohw7qfuHVNpB4FN4H/CUXcVzxDue4U9tFXxhuoXIL0hqv1w
         h78g==
X-Gm-Message-State: AO0yUKUaZpqhqfpwZvTgPt/M/xjd9GrHqyAfzqzcP817QNOqe8MgunOK
        Y17nlaF5mLygKj4iNouhBuJim6W/s/4nXWe+ecY=
X-Google-Smtp-Source: AK7set9InN8Bu9+KED91WH/pYzS9/MBNPou7AP7fDvubN8arUIh0W6GH8gqBDB0OKzGRcYlDy2SzNQ==
X-Received: by 2002:a17:906:13d2:b0:931:de86:1879 with SMTP id g18-20020a17090613d200b00931de861879mr8882806ejc.9.1679307409815;
        Mon, 20 Mar 2023 03:16:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id e9-20020a17090681c900b008cf377e8795sm4221067ejx.199.2023.03.20.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:16:49 -0700 (PDT)
Message-ID: <1ee23674-8c1a-7b84-c759-d9f963b66cd4@linaro.org>
Date:   Mon, 20 Mar 2023 11:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: qcom-wdt: add
 qcom,apss-wdt-ipq5332 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230320094450.8015-1-quic_kathirav@quicinc.com>
 <20230320094450.8015-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320094450.8015-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/03/2023 10:44, Kathiravan T wrote:
> Add a compatible for the IPQ5332 platform's APSS watchdog.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

