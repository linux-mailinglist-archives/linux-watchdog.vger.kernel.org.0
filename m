Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FB76F7D07
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 May 2023 08:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjEEGis (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 May 2023 02:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjEEGir (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 May 2023 02:38:47 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBF615EFA
        for <linux-watchdog@vger.kernel.org>; Thu,  4 May 2023 23:38:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so2185694a12.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 May 2023 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683268691; x=1685860691;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpIULi0+4Bfp/xJiTfMWkQ/k6JUnhuNHrZ6LaNN7SPA=;
        b=JLsG15svrFd18sXbxlA7hwHcbt3U/K7KPeX5Z9zDBevBqE+3rVq0285qQM2a/Sqb5H
         nMoxE4qHW84ZJgdBhcqXFDfdla7kCjpxGRMXsrIhVvmA8Ze5a493hi3vC3RyhtysYVlN
         2eKVRjNFkaoabacBwA3UXsoJMtWrFpJ4ik2B3W+XIaTrm4UB+vI+35h4Cx2SkBO5WgEq
         qyIxC9p3XwilwG+KenmADDRisRx4lOBm7l7VI40naeNGkVpMxBQARrbTfb4dI3byNUSI
         iOGimAnoI3RmkqguVa2jpZIrTGuFQKF1wxo+uiXByWnssWr3qFjEcTF107eOao7KcKma
         cxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683268691; x=1685860691;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpIULi0+4Bfp/xJiTfMWkQ/k6JUnhuNHrZ6LaNN7SPA=;
        b=Jq/JhUJ2Fsf0XGH7tMinQPfOWrOdkWzyUGqPHDz3J+lg1GzFg8L2oIxV79JHt8aizB
         Op86JgmzVRyJbYOg3FoxBg23HfHBxiXzfdxTSDMe5lazLN8wI5JeI3tpBYYzmQxpbNkz
         +CaQaFZRMWF8dCdTErPOwvA8lqjWa6CkMS7QRqklz61o8TgWkHnu6MUZhQc0NBQli4vT
         aIhkKuToqzzhmmHyzae3Ic3Zyu6ooOLwQVcG1HeAdSOiyOP8zgm1YeC6ak9syEJUm+TO
         +6blH1w8zah3ySxYO5vigUPlhGlucX3CVzxGn7V17w1Nd8tvYQsL/8mgcvC1Cppe92gt
         kylQ==
X-Gm-Message-State: AC+VfDxFPs/KPeIqkstiIfQQM9oDj6NIJdkNTL4PE+sjIdliJYm8hdD8
        RIq9lx9c7hiycpV2Nbuf108PbQ==
X-Google-Smtp-Source: ACHHUZ4KPWrb7SjKexz/1Aq185oQXmNDo2LtlnYVg5D4qGnObf00khD10WFgBBMG6CA73RI+Q6eCLg==
X-Received: by 2002:a17:907:a409:b0:94e:ffcb:b15d with SMTP id sg9-20020a170907a40900b0094effcbb15dmr216456ejc.71.1683268691269;
        Thu, 04 May 2023 23:38:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id ci17-20020a170907267100b00965cfc209d5sm536358ejc.8.2023.05.04.23.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 23:38:10 -0700 (PDT)
Message-ID: <e1760ba6-4200-4fa0-5298-f76575522764@linaro.org>
Date:   Fri, 5 May 2023 08:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXT] Re: [PATCH 1/2 v5] dt-bindings: watchdog: marvell GTI
 system watchdog driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <linux-kernel@vger.kernel.org, sgoutham@marvell.com>
 <20230503121016.6093-1-bbhushan2@marvell.com>
 <9911bb17-e8f7-b552-7056-a26b3194c416@linaro.org>
 <DM5PR1801MB1883A469C355797CE4A6E83CE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <bb52dbb7-7225-552c-2daa-688aa304a9a0@linaro.org>
 <DM5PR1801MB18835D6D376910DA60B36D5FE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB18835D6D376910DA60B36D5FE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/05/2023 19:10, Bharat Bhushan wrote:>>>>> +maintainers:
>>>>> +  - Bharat Bhushan <bbhushan2@marvell.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: marvell,gti-wdt
>>
>> So I guess we all thought "gti" means some soc. Now it is clear - you miss specific
>> compatibles. Generic blocks alone or wildcards are not allowed.
>>
>> And we have it clearly documented:
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-
>> 3A__elixir.bootlin.com_linux_v6.1-
>> 2Drc1_source_Documentation_devicetree_bindings_writing-2Dbindings.rst-
>> 23L42&d=DwICaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=PAAlWswPe7d8gHlGbCLmy
>> 2YezyK7O3Hv_t2heGnouBw&m=uy18AXnbGKMIcyPkTnWrPZoVBj8yzyjlGeNemR
>> MFgMVqkT6-4JVU5hWsVbcKPzTJ&s=XkqN7nbFOrtRnOJVqrgEDA9zinZxML4-
>> qSYQPElzVeg&e=
> 
> So Say currently Marvell have GTI watchdog timer in following series of SoCs
>  - octeon
>  - octeontx2
>  - cn10k
> 
> Compatible for octeon series is "marvell,octeon-wdt"
> Compatible for octeontx2 series is "marvell,octeontx2-wdt"
> Compatible for cn10k series is "marvell,cn10k-wdt"
> 
> So effectively we will have 3 compatibles, Is that correct?

I don't know your SoCs. I assume you should know.

> 
>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  wdt-timer-index:
>>>>
>>>> missing vendor prefix
>>>
>>> ack
>>>
>>>>
>>>> missing type
>>>
>>> Will add
>>>
>>>>
>>>>> +    maxItems: 1
>>>>
>>>> ???
>>>
>>> Removed
>>>
>>>>
>>>>> +    description:
>>>>> +      This contains the timer number out of total 64 timers supported
>>>>> +      by GTI hardware block.
>>>>
>>>> Why do you need it? What does it represent?
>>>>
>>>> We do not keep indices of devices other than something in reg, so
>>>> please justify why exception must be made here.
>>>
>>> Different platform have different number of GTI timers, for example some
>> platform have total 64 timer and other have 32 timers.
>>> So which GTI timer will be used for watchdog will depend on platform. So
>> added this property to enable this driver on platforms.
>>
>> This should be deducted from compatible.
> 
> If I understood correctly, we should add different compatible for each soc and use same to get the information we tried to get using "wdt-timer-index" property, is that correct?
> 
> But each series have many socs (10s) and GTI hardware is same except number of timers they supports, so should we add that many compatibles or add a property like this?

Same story every time... and was discussed many, many times on the lists.

https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42

You need anyway SoC specific compatibles. Once you add proper
compatibles, you will see that property is not needed.


Best regards,
Krzysztof

