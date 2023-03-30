Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD916D082F
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Mar 2023 16:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbjC3OZ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Mar 2023 10:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjC3OZZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Mar 2023 10:25:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C6276B3
        for <linux-watchdog@vger.kernel.org>; Thu, 30 Mar 2023 07:25:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g17so24772681lfv.4
        for <linux-watchdog@vger.kernel.org>; Thu, 30 Mar 2023 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680186319;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbcdKtnU83MjCH5VKN7UVMZjINa3aw1O5eVk90/Jzi4=;
        b=Jeg6DoMgQCqG62qFOyKTTEO0dhDPpXJsCB8Kbrrp0vXO9/SYHnjiyC6i/NIDHyXX3e
         6ieUpxUfydyiTPGgQSchraJ4Arz7jEvw+Hm+WT9xiePCI1yu2G1DCOAGnNSgaf5LH5Ij
         iPzgXoGKDNQtH77tfR+idnlt44Td30jTu4/TlLMwbHVqubnjD0CHEvsknLeQ2OAM/0wA
         ADBcr0khUC7xqF6euWik8Sft+jQMvOt9gdowPhe41ghHtZknP6PLgRpLWgHeuX2dPXx8
         xiBOdP4KlMAGsKwXpCRXEyzJPuHXY9OLY4dwipHiJn9049Ss65GaJFC2JJMyPbTy32m+
         /WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680186319;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbcdKtnU83MjCH5VKN7UVMZjINa3aw1O5eVk90/Jzi4=;
        b=CB7SUAF2oLUDal+dSphxyATqV/cVURhAQ3dcevCwlQY11zM1Fp/6DxAleS3hlNJKBl
         wXLZKIW4GcanKlxprSojRR01WQ31Bkl+W7XRtYhIGpgRHFdtsP5QVMTkXGKWQZqpJCGh
         xFVpOvCE804ijoNbBAX4rDZlue0kRMPo/GPOAvEwbEdI0C50v3Q+rjTX1asjxf/2Dp2o
         yhW+x0BvZz4A4F+Sm2QyqKb9UV5SdY05DMPhuUCQ+0tYFu3Rbox2uMiaAq+Nn9lnov6c
         GzPoP8yrSa/oVaXWfln71AVLzhkqsTqod9MSWg9Aa1XyxKGT+zaFpwpUraZ7vqvHrBq7
         O25A==
X-Gm-Message-State: AAQBX9e/cGXLEmK+Iam47YeX6TUvhDgbf05JFcWPy6hZDxV9AJW1x7KV
        fl1NR+5cXEzzH1gYIo23BL9AJw==
X-Google-Smtp-Source: AKy350Y6Wd0/7Vc5j1u6Qe33IRFjD1O5MeToNQ2eZmV+zgyh/Vkr0JS/6i+vN/GCjwzKkITMt3tsMA==
X-Received: by 2002:a19:5502:0:b0:4ea:e262:b94e with SMTP id n2-20020a195502000000b004eae262b94emr6585300lfe.21.1680186319269;
        Thu, 30 Mar 2023 07:25:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d3-20020ac25ec3000000b004d575f56227sm5864812lfq.114.2023.03.30.07.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:25:18 -0700 (PDT)
Message-ID: <89b350bd-94c0-c853-0ba7-808a426a2317@linaro.org>
Date:   Thu, 30 Mar 2023 16:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: qcom-wdt: add
 qcom,apss-wdt-ipq9574 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230329053726.14860-1-quic_kathirav@quicinc.com>
 <20230329053726.14860-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329053726.14860-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 29/03/2023 07:37, Kathiravan T wrote:
> Add a compatible for the IPQ9574 platform's APSS watchdog.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

