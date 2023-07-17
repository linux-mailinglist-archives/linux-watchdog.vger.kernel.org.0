Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C1F755B5B
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jul 2023 08:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjGQGPk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jul 2023 02:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjGQGPi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jul 2023 02:15:38 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD0D1A6
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:15:37 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-521662a6c9cso3900491a12.1
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Jul 2023 23:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574535; x=1692166535;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejXGyih3xF4ffLRs0pLC8DgO1NGQahK2RFWKi9nWcvw=;
        b=hWxvheVNctpKsVRb7FDxYVkaYHZVqWTlOr2Y2akV7Ockqpl3FrM0r+nwV1Y506uNOD
         wk6shHKSZopYbknwGynryWV40isxf1Az5x23P3gc7FKb4V2iqGRdDFRUCbmm0jprbIpn
         FbLymmd0jFJRPZq91Xu//LdfzPlnehyDOUeBEVb28TpSyq5tZxtDwAGABKP/elX3o2lI
         5JzV8N2BgyFFOJhZGt7t2Ke/iAIsjMpYCJ7JOt6wUI/LuPxJBxUVsFqNiBoBjtlYP5PZ
         rkYYxGuaAmPiN449WrnI6pIg09/DApADilEUiuPsCXL1vm63004TaIhrqmUZwQ4JzNZm
         P3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574535; x=1692166535;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejXGyih3xF4ffLRs0pLC8DgO1NGQahK2RFWKi9nWcvw=;
        b=IV3gsiSxVEUC4b7f0DiMoU2Moo7acFnjWCwrCZ3VNdEVRpUub8Uu1w1JaXwPns1FTQ
         e+cgGYDSOIQAgrcol2UQX05thfRniBSM2DY3nLJwl6qAgz7Yr5l+J8N9AKhx48OQX61h
         Ff4Oc9z0rf2EyevUv/eg0jQUt7tl9Nt3ngz2OoiadmWOOeu+7FLAUWTTQAqNI3Bs1yc9
         3JoOXN4HE1ZFhNWWvf5cAz/OiU1bEi753j98IpAH0NsdLM3Hu/YWqjIDoTcpmvlzbaKN
         1c3AZCEUHBxLox7WvXtFEnt0ar3scDF5YHVPhWevzvbbzEx0NwNn93w6BUObkaQxi3zO
         6EUA==
X-Gm-Message-State: ABy/qLbooKcguTcY92GmRJg/XNHWpH5Ss9mu77NVaTFqbrz9ZNjoVrMg
        dhy1i4Q+PgC6Mm1kgRY9Mn5VQw==
X-Google-Smtp-Source: APBJJlFT/e50s8dyS/qS9MGkbRQ/aKQ9RXVgZsFeZRK105sRCfsVXLvqV6dkFyBY2t0cU7w8TmQ2dA==
X-Received: by 2002:a05:6402:68e:b0:51e:17d:a1c3 with SMTP id f14-20020a056402068e00b0051e017da1c3mr9984462edy.32.1689574535749;
        Sun, 16 Jul 2023 23:15:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n20-20020a05640204d400b00521936fadabsm1079890edw.89.2023.07.16.23.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 23:15:35 -0700 (PDT)
Message-ID: <cbaccbe5-7c82-88b9-2570-4c8a249324a8@linaro.org>
Date:   Mon, 17 Jul 2023 08:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: ti,rti-wdt: Add support for
 WDIOF_CARDRESET
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     huaqian.li@siemens.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20230717040723.1306374-1-huaqian.li@siemens.com>
 <20230717040723.1306374-2-huaqian.li@siemens.com>
 <57015d8a-a65a-dd2f-3260-3f78b32db884@linaro.org>
In-Reply-To: <57015d8a-a65a-dd2f-3260-3f78b32db884@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/07/2023 08:13, Krzysztof Kozlowski wrote:
> On 17/07/2023 06:07, huaqian.li@siemens.com wrote:
>> From: Li Hua Qian <huaqian.li@siemens.com>
>>
>> TI RTI (Real Time Interrupt) Watchdog doesn't support to record the
>> watchdog cause. Add a reserved memory to know the last reboot was caused
>> by the watchdog card. In the reserved memory, some specific info will be
>> saved to indicate whether the watchdog reset was triggered in last
>> boot.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Conor Dooley <conor@kernel.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> What? Where did these happened? Please provide links.

To clarify: that's a NAK.

Best regards,
Krzysztof

