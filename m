Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6077D686D8C
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Feb 2023 19:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjBASCW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Feb 2023 13:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjBASCU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Feb 2023 13:02:20 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C75D5898C
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Feb 2023 10:02:19 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y1so18128612wru.2
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Feb 2023 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62hI4yt+UQdwx/zIJIco0w25GXgj5x+2Kr4IBhEFYh8=;
        b=qm44UDjeb9bLbRRIn7KlMQ8GiKI1FLltEh6nH8Mh2GySNNgKamHmvYQmwCKOXpwHP8
         CYnhZHb/OEVoyxv/7jJp5KxXkONe3hHiyZsOAjcWt+DvbbyjBqqCpK6vJVgXlqvIfI2J
         immEB1xXOVylm56kug5/KabmYpti201rDSpGB2RsGo4TNZ4fmR1nEtDusAWGDjyjv6DY
         fBcLuDljCRIYkYnguWuYCtjZPt7LYdV/QmGPrrq5JawX5VW1qK9TC8pKUX1N/grs/whm
         KUvZy14Zbq6kGSSss4S3qZJSieyfPXlLlknAVhDTkypTe0kU3An7+34TRB87JBcJZKjK
         Rj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62hI4yt+UQdwx/zIJIco0w25GXgj5x+2Kr4IBhEFYh8=;
        b=b0yFXPM6qkvk5fGEVwumogHgwyKPckFNxv/hpLeQy0PiUbR51A5Odncya2sFoEnde0
         S+P8HoHj5MNuROVIiupBLYhdoUyyJgeIfIYW8QbVp8L3nfi6MFqmciR+fa51MyLRRLVU
         dOAovhmztkTm3uKI2VVLpfzN5OtiA8mKd9TlmDRJDtim8xD9iDmlwasSLsLiPjY+Oesx
         YdnTc6DI96IwUbA+139S1zRdqnQWsPt/C1hPFxRFh8N/Q5zX0NiaFeV5Ra1XuE5VuKBF
         TPmpKM1ZVsNZ9+GP34TWXInQkRxr51C9CzsEgVL7as1O6OIiwL7AuN46ymoF82LPo8+E
         Ugfg==
X-Gm-Message-State: AO0yUKWvKGB+Mrlzmm7mKre8rcAjqWRCBq5bZyERs6gNeoXfkVtLIuNL
        VGggr8gIBmoisAxt/1LWz3QYEw==
X-Google-Smtp-Source: AK7set81SBNn1oYaO7IaGnXvEp+O2Yrp1xtj2FSzaNFiIzta0aVB2a9l32agDpbvAlAFYmb1OQcxuw==
X-Received: by 2002:adf:a212:0:b0:2bf:ef08:4b6c with SMTP id p18-20020adfa212000000b002bfef084b6cmr2909824wra.33.1675274537966;
        Wed, 01 Feb 2023 10:02:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm18097850wrp.53.2023.02.01.10.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:02:17 -0800 (PST)
Message-ID: <65869fa2-c9bb-1b0c-4f00-91685646a0b5@linaro.org>
Date:   Wed, 1 Feb 2023 19:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: add initial support for qcom
 sa8775p-ride
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230201152038.203387-1-brgl@bgdev.pl>
 <20230201152038.203387-6-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201152038.203387-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/02/2023 16:20, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This adds basic support for the Qualcomm sa8775p platform and the
> reference board: sa8775p-ride. The dt files describe the basics of the
> SoC and enable booting to shell.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

