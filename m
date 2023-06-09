Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD3F72975F
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jun 2023 12:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbjFIKs7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Jun 2023 06:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjFIKs5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Jun 2023 06:48:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB310F5
        for <linux-watchdog@vger.kernel.org>; Fri,  9 Jun 2023 03:48:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f63ea7bfb6so1944459e87.3
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jun 2023 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686307733; x=1688899733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJw54Q4fVjs8P5l9B0Tjils38orMhfU15KqusaeW5hA=;
        b=vSTghP27g5F/WqVfqOP4V7ruKh49rrqlyulafGPLSQ9r1tzLiUJEqis8BDW7S8Gaw3
         VvBhoMrNwPZ+gqRszig8uB1XLpE/kxUpwNq3JS0y10xnuzUKGYSeDjHqA44UTeJUb42K
         AKIoGqgyo2yuhjeYFPuEi7KCULKJF2B2SNsOyYjGyFnhyCDh8iNOglwVKrdh2oE59dRv
         YjFVZNWVUgVp2LgWBi/LQRPvJ3dcyfmFCRRJ4jaA79rmKYIgrhwOECkDODaOWF8VHOeq
         0n2EEGguLrO+HEoafh9k1TeD8aVcroUZb3++Rf2OjHVUEBP/Jl+2snZH65gEBeWNv6f8
         stzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686307733; x=1688899733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJw54Q4fVjs8P5l9B0Tjils38orMhfU15KqusaeW5hA=;
        b=TJwyYqaw0QzaP0vPl+rMRmQdw/KkZsZxV2N9sXm4jIzWKKs1QUlwJl61Ypyu6tgvzB
         UPL3MUP8zwAClsXKqgP0VYbB9ZMeEYVrYype/F4WkDpDzWDFd6R25itomqvzZ2G6Tb2Q
         tNYoxIh+2yPCMARAV+HmnoPR1uhlmIWxDi5PBKLu2qYjbuFB8bIxccq8KawKPxOXGERs
         A1+XbM0h+rpPgSnYRM7m5otpS/SvNi6U/Vv7U0mjdGqAoMdFMr4PhKEXtMMVH4ofasxA
         KzfS6rx4sxpROtRYnHeYIp5ovaEYnf1CiXY+8Z/7WbogIIycYeGaEYziawPMRYotX19+
         21+w==
X-Gm-Message-State: AC+VfDzR1XD9ZMZ7x1usCjCFv9jm3gf0wP8ev319SajH4EIRETuWjyFU
        59immpRROljZ+eQ3JrfuVlZSmw==
X-Google-Smtp-Source: ACHHUZ7vb9ttZnmbgAmzyayjpYnO1ROhtDc9BPMXhg9NoPAv2nBO3etq94NJTjTiDUp9xyyiFW/lPw==
X-Received: by 2002:a19:4347:0:b0:4f3:b2a7:68ef with SMTP id m7-20020a194347000000b004f3b2a768efmr555798lfj.10.1686307732870;
        Fri, 09 Jun 2023 03:48:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w25-20020a056402129900b0051659c6d50csm1620799edv.22.2023.06.09.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 03:48:52 -0700 (PDT)
Message-ID: <9e4a0756-8b42-81a7-5b5c-60c0ebea0d7f@linaro.org>
Date:   Fri, 9 Jun 2023 12:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] dt-bindings: timer: atmel,at91sam9260-pit: convert
 to yaml
Content-Language: en-US
To:     Claudiu.Beznea@microchip.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20230530090758.1652329-1-claudiu.beznea@microchip.com>
 <20230530090758.1652329-2-claudiu.beznea@microchip.com>
 <46eced08-5bf6-3e4b-7a91-ff4d16c7dab9@linaro.org>
 <e816a8c2-e4fb-a608-f8e0-232135243c8a@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e816a8c2-e4fb-a608-f8e0-232135243c8a@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 09/06/2023 12:22, Claudiu.Beznea@microchip.com wrote:
> On 31.05.2023 11:55, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 30/05/2023 11:07, Claudiu Beznea wrote:
>>> Convert Microchip AT91 PIT bindings to YAML. Along with it clocks and
>>> clock-names bindings were added as the drivers needs it to ensure proper
>>> hardware functionality.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>> ---
>>>  .../devicetree/bindings/arm/atmel-sysregs.txt | 12 ---
>>>  .../bindings/timer/atmel,at91sam9260-pit.yaml | 99 +++++++++++++++++++
>>>  2 files changed, 99 insertions(+), 12 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/timer/atmel,at91sam9260-pit.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>>> index 67a66bf74895..54d3f586403e 100644
>>> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>>> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
>>> @@ -4,18 +4,6 @@ Chipid required properties:
>>>  - compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
>>>  - reg : Should contain registers location and length
>>>
>>> -PIT Timer required properties:
>>> -- compatible: Should be "atmel,at91sam9260-pit"
>>> -- reg: Should contain registers location and length
>>> -- interrupts: Should contain interrupt for the PIT which is the IRQ line
>>> -  shared across all System Controller members.
>>> -
>>> -PIT64B Timer required properties:
>>> -- compatible: Should be "microchip,sam9x60-pit64b"
>>> -- reg: Should contain registers location and length
>>> -- interrupts: Should contain interrupt for PIT64B timer
>>> -- clocks: Should contain the available clock sources for PIT64B timer.
>>> -
>>>  System Timer (ST) required properties:
>>>  - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
>>>  - reg: Should contain registers location and length
>>> diff --git a/Documentation/devicetree/bindings/timer/atmel,at91sam9260-pit.yaml b/Documentation/devicetree/bindings/timer/atmel,at91sam9260-pit.yaml
>>> new file mode 100644
>>> index 000000000000..d0f3f80db4cb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/atmel,at91sam9260-pit.yaml
>>> @@ -0,0 +1,99 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/timer/atmel,at91sam9260-pit.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip AT91 Periodic Interval Timer (PIT)
>>> +
>>> +maintainers:
>>> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
>>> +
>>> +description:
>>> +  Microchip AT91 periodic interval timer provides the operating system scheduler
>>> +  interrupt. It is designed to offer maximum accuracy and efficient management,
>>> +  even for systems with long response time.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: microchip,sama7g5-pit64b
>>
>> >From where do you have this compatible? Wasn't in old binding and commit
>> msg does not explain it.
> 
> ok, I'll update it in the commit message. It is from the available device
> trees.

Add them in next patch, so the conversion is only conversion.

> 
>>
>>
>>> +          - const: microchip,sam9x60-pit64b
>>> +      - items:
>>> +          enum:
>>
>> These are not items. Just enum.. Does it even work?
> 
> Yes, it compiles w/o issues. I'll update it anyway.

Yeah, but does it work as intended? This should allow any order of below
compatibles - from 1 to 2, so totally not what you wanted.

> 
>>
>>> +            - atmel,at91sam9260-pit
>>> +            - microchip,sam9x60-pit64b

>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +        clock-names:
>>> +          items:
>>> +            - const: pclk
>>> +            - const: gclk
>>
>> interrupts? They are still required, so why no description here?
> 
> It was here in the previous versions but Conor suggested to remove it as it
> was nothing specific about this description. For the if-then branch I kept
> it to specify that the interrupt is share with other devices. In this
> branch the interrupt is only for the timer itself. With this, would you
> still prefer to add it back?

I just don't understand why interrupts are in one arm of the if: and not
in the other.

> 
>>
>>> +      required:
>>> +        - clock-names
>>> +
>>> +unevaluatedProperties: false
>>
>> additionalProperties:false instead
> 
> Having additionalProperties:false instead of unevaluatedProperties: false
> thows the following error on make dt_binding_check and make dtbs_check:
> 
> Documentation/devicetree/bindings/timer/atmel,at91sam9260-pit.example.dtb:
> timer@f0028000: 'clock-names' does not match any of the regexes:
> 'pinctrl-[0-9]+'

So it nicely points to something you need to fix in the binding.



Best regards,
Krzysztof

