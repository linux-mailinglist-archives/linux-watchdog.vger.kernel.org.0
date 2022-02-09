Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334424AFDFE
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 21:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiBIUFy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 15:05:54 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiBIUFy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 15:05:54 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E16E0536E9;
        Wed,  9 Feb 2022 12:05:53 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m18so6337127lfq.4;
        Wed, 09 Feb 2022 12:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=3ey/rvoC/My8lgu2h1tjSnO3Rywhq0b6MzF/kqfqRZs=;
        b=XXo2DQnW+fAVbOB/k5mx9IuS0YLQBxnjNOoz/J8CKw1wBozqF1ljthuEB9VKXE/mFf
         EIWknlt9Kw8x6nDYWKnmNQ4o3T01MpZTpMa27aj1wAkzTf7pKm7irV2ganP/+dskPb+U
         GR7NlqBLkJCnbpPDFG0FYln3lxWRSZNSNqZuKXYk1vGOZK0b1YFF6N46RfwEo6MWf9rI
         lN4rGvKYYk10NceuVCd7RW6IfUg27w9zM7YrJ3s163LqmWFOQLR448NGpeU5plEhGfEY
         sVTnu0DOQlG4bfBGXnwoTV41J12sjJviPPa+x5It1S70UrM2K0MiCzwDEbiYo2hpzboo
         g0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3ey/rvoC/My8lgu2h1tjSnO3Rywhq0b6MzF/kqfqRZs=;
        b=tc36t0XEFdJyETJmY1dFdUYEfPjo66SbmQ0l2O0xvLSMUY6nfhYoiYvRPoE1vOwldO
         GA31sQuT1FWeD2my8vmkQ+DzC/XXKflXPZj6FrR+9ioF+PzA8l2ZM9v8NHsKRnkzoIMX
         Or+BDgLJyZKA/vrF5+qPyIQ0VuJ4ArIMMuYe64PahZxdPzLu/bYNYUawkREwaEXcEJLF
         iqgf/Rx/+8IckdjZF3VuIVLb6LtYtchDDUIjZH+Wof/YQTBvGIGC8y/Jkdty+SDK2bPi
         eOAezCdIQ6onSfjiiXbkDiH+SLWx5BORqKrJn586lJ1ZLMcjPWSkpmZq2lrt1R5WJUNl
         WYIg==
X-Gm-Message-State: AOAM533AlPt8FCLeixOzAXjc5fv6zuFlB8olPnWIMaVuo6sWolRr7reR
        eA257uwoU6RdXdjulrQwzig=
X-Google-Smtp-Source: ABdhPJw4S9ZJVZa1qJxliI2glYts95uC9G7uoDOXRsA3u+2+dQ0WrliCoU3B+BldWmFaadI4i1NG2g==
X-Received: by 2002:a05:6512:3094:: with SMTP id z20mr2588470lfd.398.1644437151253;
        Wed, 09 Feb 2022 12:05:51 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id d18sm404083lfg.20.2022.02.09.12.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 12:05:50 -0800 (PST)
Message-ID: <b29cd450-3753-2971-86ba-2f1e719b151f@gmail.com>
Date:   Wed, 9 Feb 2022 21:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2] dt-bindings: watchdog: brcm,bcm7038: add more
 compatible strings
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220126132116.11070-1-zajec5@gmail.com>
 <20220126222034.16889-1-zajec5@gmail.com>
 <YgQRam1RFim1AMMf@robh.at.kernel.org>
 <7b60d62b-9828-cc74-8d03-64ef5f722661@gmail.com>
 <YgQd25G0UROyTMA9@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YgQd25G0UROyTMA9@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9.02.2022 21:02, Rob Herring wrote:
> On Wed, Feb 09, 2022 at 08:26:00PM +0100, Rafał Miłecki wrote:
>> On 9.02.2022 20:09, Rob Herring wrote:
>>> On Wed, Jan 26, 2022 at 11:20:34PM +0100, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> This hardware block is used on almost all BCM63xx family chipsets and
>>>> BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
>>>> strings and also include a generic one.
>>>>
>>>> The only SoC with a different block I found is BCM6838 (thus not included
>>>> in this change).
>>>>
>>>> It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
>>>> include "SoftRst" register but that can be handled by drivers based on
>>>> precise compatible string.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>> V2: Sort enum entries & update brcm,twd.yaml
>>>> ---
>>>>    .../devicetree/bindings/mfd/brcm,twd.yaml     |  2 +-
>>>>    .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
>>>>    2 files changed, 18 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>>>> index 634526f790b8..3f5db1990aba 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>>>> @@ -55,7 +55,7 @@ examples:
>>>>            #size-cells = <1>;
>>>>            watchdog@28 {
>>>> -            compatible = "brcm,bcm7038-wdt";
>>>> +            compatible = "brcm,bcm4908-wdt", "brcm,bcm63xx-wdt";
>>>>                reg = <0x28 0x8>;
>>>>            };
>>>>        };
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>>>> index a926809352b8..4d848442913c 100644
>>>> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>>>> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>>>> @@ -16,9 +16,22 @@ maintainers:
>>>>    properties:
>>>>      compatible:
>>>> -    enum:
>>>> -      - brcm,bcm6345-wdt
>>>> -      - brcm,bcm7038-wdt
>>>> +    items:
>>>> +      - enum:
>>>> +          - brcm,bcm4908-wdt
>>>> +          - brcm,bcm6338-wdt
>>>> +          - brcm,bcm6345-wdt
>>>> +          - brcm,bcm6348-wdt
>>>> +          - brcm,bcm6848-wdt
>>>> +          - brcm,bcm6858-wdt
>>>> +          - brcm,bcm7038-wdt
>>>> +          - brcm,bcm60333-wdt
>>>> +          - brcm,bcm63138-wdt
>>>> +          - brcm,bcm63148-wdt
>>>> +          - brcm,bcm63268-wdt
>>>> +          - brcm,bcm63381-wdt
>>>> +          - brcm,bcm68360-wdt
>>>> +      - const: brcm,bcm63xx-wdt
>>>
>>> Is it really worthwhile to update all these DTs?:
>>>
>>> arch/mips/boot/dts/brcm/bcm63268.dtsi:                  compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm6328.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm6358.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm6362.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm6368.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7125.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7346.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7358.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7360.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7362.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7420.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7425.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>> arch/mips/boot/dts/brcm/bcm7435.dtsi:                   compatible = "brcm,bcm7038-wdt";
>>
>> I don't have problem handling that.
> 
> Even if the dts files above are updated, the driver still has to support
> the above case.
> 
> It's pointless to change this. We've already got 1000s of warnings to
> fix and 2000 bindings still to convert if you need something to do.
> 
>>> I don't think so.
>> So what's the policy for such bindings then? How to select SoCs that
>> should have their own bindings? How can I tell which should /borrow/ a
>> binding instead?
> 
> The way it is supposed to work is the first implementation gets
> 'soc1-block'. When the 2nd implementation comes about, it gets
> 'soc2-block'. If soc2 implementation is 'the same' or a superset, then
> it should have a fallback to 'soc1-block'. Another way to test that is,
> "I want my existing s/w to work as-is with this new h/w". The process
> repeats on the next SoC, but you could be backwards compatible with
> soc1, soc2, both or none. Is that what you are asking?
> 
> If you are doing all this after the fact at once, then it can be a
> bit different in how you do compatibles.
> 
> In this case, I would make "brcm,bcm7038-wdt" the fallback to the rest
> (granted, I know nothing about these chips or the relationship between
> them), but you have to keep supporting "brcm,bcm7038-wdt". 6345 is up
> to you I guess as there aren't any upstream dts files using it. Florian
> might care.

I think I got it now, thanks for explaining!
