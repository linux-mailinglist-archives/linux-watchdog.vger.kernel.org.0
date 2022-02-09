Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 304DC4AFD67
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 20:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiBIT25 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 14:28:57 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbiBIT2D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 14:28:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DAFE015666;
        Wed,  9 Feb 2022 11:26:06 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id j14so4884350lja.3;
        Wed, 09 Feb 2022 11:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=/ln5Mp+HCnWmWQZs56Ri/Ntn7CZTvz8QSkeLgVNdOsA=;
        b=HRJoU2LrNz/1AmsgIPze9Zw4gNeNcCJU9ICSBAIyuc3k+AC6fZpmKSpx4q8d7AbhK+
         4wgKi00lxQWluqR/kWu0TtmxV1p8F4cVzexfyWk6h5fJkk/cixk6o2hFMJ/UUc96L7vX
         v2iWRgkYrkIw1TgW6LqwaxhbxMFHF0bcv8I6Oslg/hPyJ9YS6Fz2eSxsDBzprM5Yfxm9
         D4/amD7R48wqfF877FTaNdzLebw4h0sjEnD8aIYTMfimWK4LmSCfOyDfGYfk+2gze5x0
         bOXqsUYSurzMWL/rAUr76ZzT/D3v1MNGBxCNJ0IzJ/P1hmkkmx1NZxulb5wK8Jv6TFHb
         2PaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/ln5Mp+HCnWmWQZs56Ri/Ntn7CZTvz8QSkeLgVNdOsA=;
        b=V43MmZTeAOTKej6IAB4yHsf2H26hlI3/xQW1hUABoN+zuw+sehBq5p10tiYdio/T3C
         P2gUjHKbDTY2rTNjRilSODVkhgfIQS8bA+d/sJ9dv/M+q1G1ONz1pSfh9zX6OYn5csCa
         1LbDIBoaPOqTS5FX4WnkwtUisWZRHOH56jWtdM0q8yyLgPD7BB0Bx9H0SGB+GqwETCCj
         OoA3M42lCL3T2e0lxEuBtO2oZxE5n2HssZ5X7/60nerJhGZgUyzibaHu6vJ4g8kmT9F9
         6tIixdzIbkofrSOfv3/N/Se9QHV40vCARCMN1/pzX/BGTTYWrMVKgCxPLFfnw1KGscOV
         cRUA==
X-Gm-Message-State: AOAM530fD8+zMcdc7EgjvdggWB3TgW8XFTBPRMNBrR9ymHJ57m3Oq1T1
        Ia0DbSiNK1Fuc++14Nmshuw=
X-Google-Smtp-Source: ABdhPJzJMPOPE290N8cmhkhKXbMH2HyLwDK5e0CgDiOmGJyErUZiaV1M3ty5TUYx6sa+6HgemTzMCQ==
X-Received: by 2002:a2e:8798:: with SMTP id n24mr2488631lji.404.1644434764285;
        Wed, 09 Feb 2022 11:26:04 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id c7sm2506009lfj.99.2022.02.09.11.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 11:26:03 -0800 (PST)
Message-ID: <7b60d62b-9828-cc74-8d03-64ef5f722661@gmail.com>
Date:   Wed, 9 Feb 2022 20:26:00 +0100
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YgQRam1RFim1AMMf@robh.at.kernel.org>
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

On 9.02.2022 20:09, Rob Herring wrote:
> On Wed, Jan 26, 2022 at 11:20:34PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This hardware block is used on almost all BCM63xx family chipsets and
>> BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
>> strings and also include a generic one.
>>
>> The only SoC with a different block I found is BCM6838 (thus not included
>> in this change).
>>
>> It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
>> include "SoftRst" register but that can be handled by drivers based on
>> precise compatible string.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Sort enum entries & update brcm,twd.yaml
>> ---
>>   .../devicetree/bindings/mfd/brcm,twd.yaml     |  2 +-
>>   .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
>>   2 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>> index 634526f790b8..3f5db1990aba 100644
>> --- a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
>> @@ -55,7 +55,7 @@ examples:
>>           #size-cells = <1>;
>>   
>>           watchdog@28 {
>> -            compatible = "brcm,bcm7038-wdt";
>> +            compatible = "brcm,bcm4908-wdt", "brcm,bcm63xx-wdt";
>>               reg = <0x28 0x8>;
>>           };
>>       };
>> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>> index a926809352b8..4d848442913c 100644
>> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
>> @@ -16,9 +16,22 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - brcm,bcm6345-wdt
>> -      - brcm,bcm7038-wdt
>> +    items:
>> +      - enum:
>> +          - brcm,bcm4908-wdt
>> +          - brcm,bcm6338-wdt
>> +          - brcm,bcm6345-wdt
>> +          - brcm,bcm6348-wdt
>> +          - brcm,bcm6848-wdt
>> +          - brcm,bcm6858-wdt
>> +          - brcm,bcm7038-wdt
>> +          - brcm,bcm60333-wdt
>> +          - brcm,bcm63138-wdt
>> +          - brcm,bcm63148-wdt
>> +          - brcm,bcm63268-wdt
>> +          - brcm,bcm63381-wdt
>> +          - brcm,bcm68360-wdt
>> +      - const: brcm,bcm63xx-wdt
> 
> Is it really worthwhile to update all these DTs?:
> 
> arch/mips/boot/dts/brcm/bcm63268.dtsi:                  compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm6328.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm6358.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm6362.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm6368.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7125.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7346.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7358.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7360.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7362.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7420.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7425.dtsi:                   compatible = "brcm,bcm7038-wdt";
> arch/mips/boot/dts/brcm/bcm7435.dtsi:                   compatible = "brcm,bcm7038-wdt";

I don't have problem handling that.


> I don't think so.
So what's the policy for such bindings then? How to select SoCs that
should have their own bindings? How can I tell which should /borrow/ a
binding instead?

I assumed we want binding per SoC based on the
17fffe91ba36 ("dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=17fffe91ba36d11c7b17be154ecc7c1ed31527eb
