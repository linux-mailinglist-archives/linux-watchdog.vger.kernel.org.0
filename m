Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA986F82E8
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 May 2023 14:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjEEM1D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 May 2023 08:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjEEM1C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 May 2023 08:27:02 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674EF1C0F7
        for <linux-watchdog@vger.kernel.org>; Fri,  5 May 2023 05:26:51 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965fc25f009so3087466b.3
        for <linux-watchdog@vger.kernel.org>; Fri, 05 May 2023 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683289610; x=1685881610;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU9/WTrf1AKBYSzWtIXW07uJPMygAJ5N2PfYWsgfd34=;
        b=KsVZtq2MdRvgAhccw4TyMNQWdDRhMgArOsyYcOu+oxGQAwUXOSyob2gklWbPv/9PHF
         fOMtNTAnT+pKDEWsokKnS8ahnmfRkR0LRgdjm/vPV4hwBmJ0bpX30t6IC2xmTsU0f3CD
         NOvAb25Rkj9k9AFLMyoCMt+rLfTBP5rhyHajk58ujZpFnYLD5mLBmMqnRtDRYPfWJbyG
         AVRA3HVkGiW+YdWlWUoaer9ULCe6dlB1U88O9uAZX5oY5wmo3BOpcN1yOpH4HO+2Tfdr
         x+9mzGwdx3sjZnavIpJv7tLosUT7TnHAEJZkSaF1Cgg60fq1rvcnxaFEo+t0LXSPu3rV
         NrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683289610; x=1685881610;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yU9/WTrf1AKBYSzWtIXW07uJPMygAJ5N2PfYWsgfd34=;
        b=ggXaG2jWxT5SbPBehKZ0lXzO3VcTNXv2yY7tuXrVC0TVOq3H+ulP8HY3epMrJ1jEVE
         l9FBMjDe775/ciPYFQ2MX456c8UmWDrsyt9gZfO7u7U5w4QoqJm4qubQYxe0jeVT0BiU
         0wHyOvnELB4IOnzrwuyg+0PXy3rs0/psvRsJvq/TUqMuY1Oue5aP3Ewkx7PcKsG74XoT
         K+bM4P1LB6TC7Z0hvRkV/EzB5iZWl2rmz8VIJnLM0sZCDo3aIaNPN13e9Uqb0LmZE4sq
         JSUoreNoGeD5hZBgk48k5w/EmQl6+BK9dRO8mIFHp2eV7Jbix4nKlz4WwB5lc3SDibjQ
         rpjA==
X-Gm-Message-State: AC+VfDzl9kFU4BPd8OLNAyuHYsflH10K1E/P+7kmFTKzecn1ZlmDePZO
        L3x/LG10BF4A1YNhKtUqkv1kJQ==
X-Google-Smtp-Source: ACHHUZ4rGmi0jjhamQT83l1bk1rgGhgl2LNuxKv7fGPYTIZjFN96fhdp0Td7yptN4leazHZqsKmJAw==
X-Received: by 2002:a17:907:c10:b0:95e:e0fa:f724 with SMTP id ga16-20020a1709070c1000b0095ee0faf724mr1108875ejc.39.1683289609844;
        Fri, 05 May 2023 05:26:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id b5-20020a170906194500b0094aa087578csm874138eje.171.2023.05.05.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:26:49 -0700 (PDT)
Message-ID: <231b4a1d-3f96-f53e-4741-5d3ca184c150@linaro.org>
Date:   Fri, 5 May 2023 14:26:48 +0200
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
 <72205e59-f535-cba1-dc65-544f919b7b6b@linaro.org>
 <DM5PR1801MB18836550BB8011352EEC11D6E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB18836550BB8011352EEC11D6E3729@DM5PR1801MB1883.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/05/2023 14:19, Bharat Bhushan wrote:

>>>>> Query to firmware required arm SMC call, to me that does not look
>>>>> correct
>>>> approach. Thought of using first one but that is already used and
>>>> moving that is as same as this.
>>>>>
>>>>> Hardcoding to 63 will make it work on some SoCs but not all.
>>>>
>>>> But you know which one is started or is not. GTI_CWD_WDOG tells you this.
>>>
>>> On a given SoC, Firmware can reserve and/or use one or more timer for some
>> other use case (customer use) and configure one of the timer as watchdog timer.
>> Linux have to use the configured timer only and cannot decide by its own.
>>
>> Then the SoCs which have such firmware could use proposed property.
>> Provide some rationale property description in your next version (adding
>> necessary compatibles).
> 
> Will add compatible as below:
> 
> properties:
>   compatible:
>     enum:
>      - marvell,cn10k-wdt
>      - marvell,octeontx2-wdt

And the rest? You said you have 10 SoCs.

You made them not compatible with each other, so I assume on purpose and
your driver will make use of it.

> 
> And define this as optional property 
>   marvell,wdt-timer-index:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     minimum: 0
>     maximum: 63
>     description:
>       An SoC have many timers (up to 64), firmware can reserve one or more timer 
>       for some other use case and configures one of the global timer as watchdog
>       timer. Firmware will update this field with the timer number configured
>       as watchdog timer.

Looks ok.

Best regards,
Krzysztof

