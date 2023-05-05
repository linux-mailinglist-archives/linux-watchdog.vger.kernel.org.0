Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03A26F825B
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 May 2023 13:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjEEL5f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 May 2023 07:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjEEL5e (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 May 2023 07:57:34 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28FD1A613
        for <linux-watchdog@vger.kernel.org>; Fri,  5 May 2023 04:57:30 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so26339462a12.0
        for <linux-watchdog@vger.kernel.org>; Fri, 05 May 2023 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683287849; x=1685879849;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1h6TlZ3XcQPUIwIHsCNcSEEsdfENwVRWlIa4SCh0jM=;
        b=H0yd5VGDnV7yLOhlh3WDDz3sVfRlMbI14kuh615ecivAmjRuY5iWjz35FvyeNZtr2a
         Vk5gHv2oLeG6in5PJnj/woS/Y/I574DpfhIn5r9E5eH3ZgEYFtyN7t/a3PtgGVseAm/s
         aeFB+LuyrdBO20XBm2Yr1vcdaV9TaeqEnY/uiRsZ6XKCNTNKqwUuIa4oLQHmBfizz4lY
         guuT51hENau4g47WK7UFf4mFmWcyu3LP+jjTY1SZWGZJAOBYwAfyqBATgayIvqTzZqFX
         cBtUtGIaZOO6pP7iMenZvbvkl1CEhQQDq5GJmGfKoMNPfdwzktmBjURjvjh/ozR/K7cj
         PqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287849; x=1685879849;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1h6TlZ3XcQPUIwIHsCNcSEEsdfENwVRWlIa4SCh0jM=;
        b=In9oIW/ucIwZu7xaJTFsyVY3CECsrpsN7nXOS/Jz0r1kzUO2pwUWYFsUEhcvXwSpMN
         VS6pwJ8eORY0WWh/5mqnzxJap5QVcs+SBKTTAe57J0jDT/DPtOn0r1WvGLTnVCU6MZE8
         laolQFZrceUmrvhT38LKwl3EmKcfJGUefwAzYwsKMuWhg9T0EFfQZVxPf+0oZd9ovfzQ
         RhRu14RmMa10O0Ha5dauXNqrpbJTiG41g+KRyCngcym0izxdz2GbNP4f0QLz/RIE6j1Z
         TspeikbdXypSK0ANswUofdzaTINl0yQWV9YafEetvYioO5X1owmxGin5gv25ZUESMEgk
         PRoA==
X-Gm-Message-State: AC+VfDwVSJXykb2WCeIMPndIKTOHH8v6i3Wfq31Eu8i70Rry55rEPcUb
        UUS1UF8victjmXyqB7W+lgSx/Q==
X-Google-Smtp-Source: ACHHUZ6GLKQ8Cwm0kHM+vtGN9Ongi2CCZvHNsXMAn5lgUA3q9ck0YP9LVePpfPOcxBJTConx9TqJHg==
X-Received: by 2002:a17:906:5d13:b0:960:6263:138f with SMTP id g19-20020a1709065d1300b009606263138fmr2216338ejt.27.1683287849326;
        Fri, 05 May 2023 04:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id sz26-20020a1709078b1a00b00965d1ecef30sm848979ejc.155.2023.05.05.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 04:57:28 -0700 (PDT)
Message-ID: <72205e59-f535-cba1-dc65-544f919b7b6b@linaro.org>
Date:   Fri, 5 May 2023 13:57:26 +0200
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
 <e1760ba6-4200-4fa0-5298-f76575522764@linaro.org>
 <DM5PR1801MB1883EE6116A2D63660871F8DE3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <d9c0bef4-de7a-2a0d-17b1-822978d27177@linaro.org>
 <DM5PR1801MB1883479AE3CE111B5FC3E5C8E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
 <731e99e6-9e48-8f80-7f95-ec8d23a85252@linaro.org>
 <DM5PR1801MB18838CCEDD015A9E09E9CC01E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB18838CCEDD015A9E09E9CC01E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
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

On 05/05/2023 13:15, Bharat Bhushan wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, May 5, 2023 4:27 PM
>> To: Bharat Bhushan <bbhushan2@marvell.com>; wim@linux-watchdog.org;
>> linux@roeck-us.net; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: Re: [EXT] Re: [PATCH 1/2 v5] dt-bindings: watchdog: marvell GTI system
>> watchdog driver
>>
>> On 05/05/2023 12:41, Bharat Bhushan wrote:
>>>>>>
>>>>>> You need anyway SoC specific compatibles. Once you add proper
>>>>>> compatibles, you will see that property is not needed.
>>>>>
>>>>> Also on a given soc, firmware can configure one of 64 timer to be
>>>>> used as
>>>> system watchdog time then compatible will not work.
>>>>
>>>> Can't you query the firmware for that? Or can't you just choose first
>>>> unused timer? DT is for non-discoverable properties.
>>>
>>> Query to firmware required arm SMC call, to me that does not look correct
>> approach. Thought of using first one but that is already used and moving that is as
>> same as this.
>>>
>>> Hardcoding to 63 will make it work on some SoCs but not all.
>>
>> But you know which one is started or is not. GTI_CWD_WDOG tells you this.
> 
> On a given SoC, Firmware can reserve and/or use one or more timer for some other use case (customer use) and configure one of the timer as watchdog timer. Linux have to use the configured timer only and cannot decide by its own.

Then the SoCs which have such firmware could use proposed property.
Provide some rationale property description in your next version (adding
necessary compatibles).

Best regards,
Krzysztof

