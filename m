Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD396F6988
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 May 2023 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjEDLH5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 May 2023 07:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjEDLH4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 May 2023 07:07:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A52A26A4
        for <linux-watchdog@vger.kernel.org>; Thu,  4 May 2023 04:07:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94a34a14a54so62989666b.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 May 2023 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683198472; x=1685790472;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NW7kbDEfVJW8J3RZA/GxBQxEbwWy5IrOZG6U1th7Vzw=;
        b=adkaxhZM4q8nCzeMiMJYfJZExhR0Rq2YB0rb2F+unG7NlsauXxlch7zKjM/m7Wmy3q
         bO+eSP2r9WxvYxaWYT4shRAmJ8w0U99D9ttEqRl1iAoVXcgeLeR0lv1mV9Q724e2F7IS
         vcTqfmqaoUZDBFX2Ee+4ecCrLfDsrgi/02McpWEG8cW7FZJabpkwBhUvTBv43jwT4I5g
         qBCAryRrlCTbB6NHAKA2vybwDzjbEWAAGzAh+JKilyireG7B75BT/R/N0JoldHQOIyqN
         /fKJpJ4R0G+WzhWxOT8PVd7Wbi4VmyYjOjCZogifyy+/yPjFHEtS4Ym7SItAJ3OI1D0l
         5nnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198472; x=1685790472;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NW7kbDEfVJW8J3RZA/GxBQxEbwWy5IrOZG6U1th7Vzw=;
        b=fvDmdL9VPc3aiHN+6OMd9gQdN1Do28MBd9RZ8Y/8wfP4GUL8gKc+qYOoqa2QD3+vTF
         ICQCdY32MhWCwmUG401Q2EJ/utF2SqbJ89T0ptUfe61K67y2kCRcEdXH0h83hixH9M3O
         P4xf66uGiuvArSE5Jz5HwHEeqP4jVeikY9/0DP8O41BbyfYBZhdXYG2J1OqCPtfVnfHw
         0y9JwZJyYKxtZ3VU+3YCcvh9cxPEDRyKohAqiZjDNObLtoj9DtcrdhwPe0Ci45dqHWi7
         a9GurGoLOoV5DSq1L2qzIdkWO/KrxSNr/sEOHKj21O3lTqEqMzY8b62ytBZHDvc4FhxF
         /32w==
X-Gm-Message-State: AC+VfDwMX9Pw7oedOBuxXRdugK/a38aCDfxSEhrv/H+0hYmNQi3ErpNE
        Be3nPrHO08xLZlW2hK6zODAMhg==
X-Google-Smtp-Source: ACHHUZ4Anx4ObSza6JX1kb3Xf0BhAOKAgg9wxlJDZZOuwPiP9Xg4iNsZKQMenCecyW/yAT7jyhcelA==
X-Received: by 2002:a17:907:7ba5:b0:965:9d94:66e7 with SMTP id ne37-20020a1709077ba500b009659d9466e7mr2399469ejc.15.1683198471797;
        Thu, 04 May 2023 04:07:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id hx4-20020a170906846400b009659ad1072fsm1152053ejc.113.2023.05.04.04.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:07:51 -0700 (PDT)
Message-ID: <bb52dbb7-7225-552c-2daa-688aa304a9a0@linaro.org>
Date:   Thu, 4 May 2023 13:07:49 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR1801MB1883A469C355797CE4A6E83CE36D9@DM5PR1801MB1883.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/05/2023 11:02, Bharat Bhushan wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, May 4, 2023 12:25 PM
>> To: Bharat Bhushan <bbhushan2@marvell.com>; wim@linux-watchdog.org;
>> linux@roeck-us.net; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org
>> Subject: [EXT] Re: [PATCH 1/2 v5] dt-bindings: watchdog: marvell GTI system
>> watchdog driver
>>
>> External Email
>>
>> ----------------------------------------------------------------------
>> On 03/05/2023 14:10, Bharat Bhushan wrote:
>>> Add binding documentation for the Marvell GTI system watchdog driver.
>>>
>>> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
>>> ---
>>> v5:
>>>  - Added wdt-timer-index property
>>
>> I did not ask for it...
>>
>>>  - Get clock frequency from clocks/clock-name device tree property
>>
>> Where? It's not possible in current code. I don't think you tested this at all.
> 
> My bad, Missed clock related binding changes while doing last minute rework.
> Will send updated patch adding the dt-binding properties.
> 
> It is testing exactly with below node:
>                 watchdog@802000040000 {
>                         compatible = "marvell,gti-wdt";
>                         reg = <0x8020 0x40000 0x0 0x20000>;
>                         interrupts = <0 62 1>;
>                         wdt-timer-index = <63>;
>                         clocks = <&sclk>;
>                         clock-names = "ref_clk";
> 
>>
>>>
>>>  .../bindings/watchdog/marvell,gti-wdt.yaml    | 54 +++++++++++++++++++
>>>  1 file changed, 54 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/watchdog/marvell,gti-wdt.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/watchdog/marvell,gti-wdt.yaml
>>> b/Documentation/devicetree/bindings/watchdog/marvell,gti-wdt.yaml
>>> new file mode 100644
>>> index 000000000000..e3315653f961
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/watchdog/marvell,gti-wdt.yaml
>>> @@ -0,0 +1,54 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id:
>>> +https://urldefense.proofpoint.com/v2/url?u=http-3A__devicetree.org_sc
>>> +hemas_watchdog_marvell-2Cgti-2Dwdt.yaml-
>> 23&d=DwICaQ&c=nKjWec2b6R0mOyP
>>>
>> +az7xtfQ&r=PAAlWswPe7d8gHlGbCLmy2YezyK7O3Hv_t2heGnouBw&m=ts41IUd
>> c422tK
>>> +gF0cnYI7jTqJ1dvTm-FNq1pILCyrOuwqKu2UVnwWEVy-
>> aZAMsme&s=fVo903PvFGVqR_P
>>> +G6r91BBtzOTLz4Mixh1Tqu1GAp6E&e=
>>> +$schema:
>>> +https://urldefense.proofpoint.com/v2/url?u=http-3A__devicetree.org_me
>>> +ta-2Dschemas_core.yaml-
>> 23&d=DwICaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=PAAlWsw
>>>
>> +Pe7d8gHlGbCLmy2YezyK7O3Hv_t2heGnouBw&m=ts41IUdc422tKgF0cnYI7jTqJ1
>> dvTm
>>> +-FNq1pILCyrOuwqKu2UVnwWEVy-
>> aZAMsme&s=ebh6bxE3wbSmwrOnHmUHMM_L77f6bY6W
>>> +Ifye_sXDNzI&e=
>>> +
>>> +title: Marvell Global Timer (GTI) system watchdog
>>> +
>>> +allOf:
>>> +  - $ref: watchdog.yaml#
>>> +
>>> +maintainers:
>>> +  - Bharat Bhushan <bbhushan2@marvell.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: marvell,gti-wdt

So I guess we all thought "gti" means some soc. Now it is clear - you
miss specific compatibles. Generic blocks alone or wildcards are not
allowed.

And we have it clearly documented:

https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42

>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  wdt-timer-index:
>>
>> missing vendor prefix
> 
> ack
> 
>>
>> missing type
> 
> Will add
> 
>>
>>> +    maxItems: 1
>>
>> ???
> 
> Removed
> 
>>
>>> +    description:
>>> +      This contains the timer number out of total 64 timers supported
>>> +      by GTI hardware block.
>>
>> Why do you need it? What does it represent?
>>
>> We do not keep indices of devices other than something in reg, so please justify
>> why exception must be made here.
> 
> Different platform have different number of GTI timers, for example some platform have total 64 timer and other have 32 timers.
> So which GTI timer will be used for watchdog will depend on platform. So added this property to enable this driver on platforms.

This should be deducted from compatible.

Best regards,
Krzysztof

