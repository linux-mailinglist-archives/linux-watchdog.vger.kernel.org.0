Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9334460E2EE
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Oct 2022 16:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiJZOMS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Oct 2022 10:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbiJZOMQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Oct 2022 10:12:16 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEF1107A97
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Oct 2022 07:12:15 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id w29so2838333qtv.9
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Oct 2022 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGbHuCEYdpPdrNmRy3KRJXWEMPpe/Yl4yYbiL7G5pI4=;
        b=aI3SgU/o1B2M/H6X1N1ybICwefhQuyMnMU+xDhAda4rQ9GF9Hn7lTutEP2dSljFwDm
         LNGUaLiXZkIFCetzK0stTLFVY5xkl+5x4+O2aE1xzGKzPEnjThfdaH5mdD8wRlGQF3Ar
         zdLQGyIpYGveQVdB3InsYbQgbhjDfjY9o6Op7+cXJ8NDgmla2LaU4k/EJ8GfvJ1Kvdjp
         kNzeeCsxiTkNZoTXEydWORLk54L2rnVam0Iv3Cm8mkk8TevcoUuWl8R1ODrD4aoAa/Bz
         BgtAulbiOtieEdpBIEDG1iZQdBLcOsEXG7Rc1H1V+bRFaL3Tct4sayaA68UEvuJbRN/M
         lTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGbHuCEYdpPdrNmRy3KRJXWEMPpe/Yl4yYbiL7G5pI4=;
        b=1CIX98KJOXRP1CQEZ9H8k99myyCWVgmzPfF9yX1rhEj6zzNAbaStmmc7GLmIT8mU6y
         bLuNPUIcL9baLhtqb7HwVtk0uc0VMrVtnu37Vcce27CBekDYdb6uRg9RvmtmxKWg2W1x
         66UDd3hgLbSZmD7DeGl6WdF1PmrBJA0QToIpcLU1dJ9EM8lVymSfr4UgjlLfjh1FslxC
         dHpArWhdcfJLFmJb+EkaXDpCfGo0LRub0xR0RyHbbcbrJ8xz7wxu/C/pct+f2JwuecIr
         FEz3yynmNSgrPU69ovRpXSk2/qQ1sYi05KjQFJ8dAhljLH0U0ilGoh7XDhuDXuq5winW
         +X5g==
X-Gm-Message-State: ACrzQf2jyyjRd8b+WCZt+64IxyjFRlyHxmXzc737cPVQipOyUp0XEy4g
        go81GJ0RDmKrrDnTikn6yLZLxg==
X-Google-Smtp-Source: AMsMyM7b/EkQh+RWqeoLHn2b9Hjxnnpl67n8IyVDCyNP1zMzoVmRnoUDP8KhxgY6DseThPc6o+7mNA==
X-Received: by 2002:ac8:5cc6:0:b0:3a4:e3a6:5dd5 with SMTP id s6-20020ac85cc6000000b003a4e3a65dd5mr5599860qta.468.1666793535009;
        Wed, 26 Oct 2022 07:12:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id de30-20020a05620a371e00b006e99290e83fsm2417302qkb.107.2022.10.26.07.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:12:14 -0700 (PDT)
Message-ID: <91e83eeb-24b5-4602-c132-c23a2fb5d756@linaro.org>
Date:   Wed, 26 Oct 2022 10:12:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/3] dt-bindings: watchdog: fsl-imx: document suspend
 in wait mode
Content-Language: en-US
To:     Andrej Picej <andrej.picej@norik.com>,
        linux-watchdog@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221025072533.2980154-1-andrej.picej@norik.com>
 <20221025072533.2980154-3-andrej.picej@norik.com>
 <ca484809-07e4-44ca-0ab3-26947bda7fa8@linaro.org>
 <a600b0e3-19ab-47df-4315-48b8554cb12f@norik.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a600b0e3-19ab-47df-4315-48b8554cb12f@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26/10/2022 02:38, Andrej Picej wrote:
> On 25. 10. 22 15:48, Krzysztof Kozlowski wrote:
>> On 25/10/2022 03:25, Andrej Picej wrote:
>>> Property "fsl,suspend-in-wait" suspends watchdog in "WAIT" mode which
>>> corresponds to Linux's Suspend-to-Idle S0 mode. If this property is not
>>> set and the device is put into Suspend-to-Idle mode, the watchdog
>>> triggers a reset after 128 seconds.
>>>
>>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>>> ---
>>> Changes in v2:
>>>   - add a commit message,
>>>   - add a list of devices which support this functionality
>>> ---
>>>   .../bindings/watchdog/fsl-imx-wdt.yaml        | 22 +++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>> index fb7695515be1..9289de97859b 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
>>> @@ -55,6 +55,28 @@ properties:
>>>         If present, the watchdog device is configured to assert its
>>>         external reset (WDOG_B) instead of issuing a software reset.
>>>   
>>> +  fsl,suspend-in-wait:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: |
>>> +      If present, the watchdog device is suspended in WAIT mode
>>> +      (Suspend-to-Idle). Only supported on following devices:
>>> +        - "fsl,imx25-wdt",
>>
>> You need to define such allow/disallow in allOf:if:then, instead. Like
>> example-schema is doing for foo-supply, just disallow it for some types
>> or use "if: not: ..."
> 
> Sorry missed that. So something like that should be added?:
> 
>> allOf:
>>   - if:
>>       not:
>>         properties:
>>           compatible:
>>             contains:
>>               enum:
>>                 - fsl,imx25-wdt
>>                 - fsl,imx35-wdt
>>                 - fsl,imx50-wdt
>>                 - fsl,imx51-wdt
>>                 - fsl,imx53-wdt
>>                 - fsl,imx6q-wdt
>>                 - fsl,imx6sl-wdt
>>                 - fsl,imx6sll-wdt
>>                 - fsl,imx6sx-wdt
>>                 - fsl,imx6ul-wdt
>>                 - fsl,imx7d-wdt
>>                 - fsl,imx8mm-wdt
>>                 - fsl,imx8mn-wdt
>>                 - fsl,imx8mp-wdt
>>                 - fsl,imx8mq-wdt
>>                 - fsl,vf610-wdt

Yes.

>>     then:
>>       properties:
>>         fsl,suspend-in-wait: false
> 
> And I'm assuming I can then remove the supported devices list from 
> property description.

Yes.

> 
> Are you fine with this, so we don't have to split the compatible list 
> like Alexander suggested? Basically we have the same list of WDW 
> supported devices in the driver.

I don't know to what you refer.

Best regards,
Krzysztof

