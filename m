Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724ED5474CE
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Jun 2022 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbiFKNWT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Jun 2022 09:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiFKNWT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Jun 2022 09:22:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2A1BC5
        for <linux-watchdog@vger.kernel.org>; Sat, 11 Jun 2022 06:22:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id m20so2838495ejj.10
        for <linux-watchdog@vger.kernel.org>; Sat, 11 Jun 2022 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pfX78KqgOSduBpoy4Zu2aWB7lpgcjxt2pBzkk7CLZdQ=;
        b=tvbQJ0I8Bv63cHerDMVZK2FqbDLX/nFl80ZyCGt42ELtzf5fYOs7UMDRslpkSrWJhP
         UiFx7xwGtkL8svqk4/qqYGgqtVHURnelAHHKDsOhIIpli0DUz8M5qUOeBk7PUS6CNSFK
         PlsDkJ4Imt5abdMtlj9CV33sM51mTVl64a+KkbVVb75jCR8X3mlpGhDBkzqIMWUI5M9v
         v4WT99zMGgB4IIIC5W4nK3x2jnEFvf8akvoFIBYLOLHRit6knjbH1grQ468eDIA2b1zo
         sMD5GojOwP5mq7WVG/1IYuEzBCvs4JxSpH6BwmiYzmJbhrD2zL2D9sWOI/kuPkJcW3NM
         nx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pfX78KqgOSduBpoy4Zu2aWB7lpgcjxt2pBzkk7CLZdQ=;
        b=L+Ib+9LylyAsx/bl8fFh16zQNV+YzIlM6FlO4baW/sKFPn5GCFR+iuADHfBqwrSsmX
         IedWTPBg/2viOTfDIBIQoY3wP/55OHc626wmOmDAnb2j3InK4Uu/L+mElOS1fvZrnJYx
         c6ciPmv/W+b6JU4kED3RDdKSa9w/rdH4QWkfe1ykO6W3yi5Sm3fnxPs9DtY329iTPKOj
         FaAbuiIWU641ZQLDBzyrq2TJT+QNTg690UFsBSxlE79RfHms0XBOKWuTpUp4skr0IVXe
         OS/shDsErOM0mz5FKQOqkhmacIFUFgLQAS2jhiXRWcNm6s4JMMjiKAS1uVbXtxaTqKVu
         gXvw==
X-Gm-Message-State: AOAM530ZGCB/zObXhKK0tqwgOSaRFdcdU+0fpuG1Ybb1/jSLeDXsL+zz
        nYIN913K5aW/l2IsXBTjzydnbQ==
X-Google-Smtp-Source: ABdhPJzfw/FFOwgsoIlsrs20Xnf1cUR6OnO79Bsn0q6KUMW2dsLYRbaM5a6SKi2Gm82CsS738vk+vQ==
X-Received: by 2002:a17:907:c20e:b0:710:7a7a:fd85 with SMTP id ti14-20020a170907c20e00b007107a7afd85mr34116414ejc.346.1654953734067;
        Sat, 11 Jun 2022 06:22:14 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402040800b0042dd4f9c464sm1382146edv.84.2022.06.11.06.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 06:22:13 -0700 (PDT)
Message-ID: <94f03fed-73f5-ce1e-7bbd-2f53f461816d@linaro.org>
Date:   Sat, 11 Jun 2022 15:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
 <20220607135619.174110-2-phil.edworthy@renesas.com>
 <83a8fb86-3311-87fe-c4ca-ab8e6d0cf784@linaro.org>
 <TYYPR01MB7086EFE64F1DF8C6141E8719F5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYYPR01MB7086EFE64F1DF8C6141E8719F5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/06/2022 16:38, Phil Edworthy wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On 08 June 2022 11:52 Krzysztof Kozlowski wrote:
>> On 07/06/2022 15:56, Phil Edworthy wrote:
>>> Add the documentation for the r9a09g011 SoC, but in doing so also
>>> reorganise the doc to make it easier to read.
>>> Additionally, make the binding require an interrupt to be specified.
>>> Whilst the driver does not need an interrupt, all of the SoCs that use
>>> this binding actually provide one.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>  .../bindings/watchdog/renesas,wdt.yaml        | 63 ++++++++++++-------
>>>  1 file changed, 42 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>> b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> index a8d7dde5271b..6473734921e3 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> @@ -31,6 +31,11 @@ properties:
>>>                - renesas,r9a07g054-wdt    # RZ/V2L
>>>            - const: renesas,rzg2l-wdt
>>>
>>> +      - items:
>>> +          - enum:
>>> +              - renesas,r9a09g011-wdt    # RZ/V2M
>>> +          - const: renesas,rzv2m-wdt     # RZ/V2M
>>> +
>>>        - items:
>>>            - enum:
>>>                - renesas,r8a7742-wdt      # RZ/G1H
>>> @@ -70,13 +75,27 @@ properties:
>>>    reg:
>>>      maxItems: 1
>>>
>>> -  interrupts: true
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Timeout
>>> +      - description: Parity error
>>>
>>> -  interrupt-names: true
>>> +  interrupt-names:
>>
>> This also needs minItems
> I left minItems off for interrupt-names and clock-names on the basis that
> they are only needed if you have more than one interrupt or clock.

True, but now you disallow them for one clock/interrupt cases in other
variants. Although after looking at existing bindings - it's even
messier there. For certain variants it is just ":true" which is not correct.

In general, the properties in "properties:" section should have
constraints - the most wide. These are narrowed for specific variants or
even disallowed for some. Old bindings allowed anything for some
variants, like 20 interrupt names so clearly wrong.

> 
> After adding the lines you suggested (minItems: 1), I find that
> 'make dtbs_check' passes even if there are no interrupt-names or
> clock-names specified. Is this expected?

These are not required, aren't they? If they are not required, they can
be missing...

> 
> minItems: 0 makes more sense to me, but it is required to be greater than
> or equal 1
> 
> Thanks
> Phil


Best regards,
Krzysztof
