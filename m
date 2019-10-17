Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63760DAE75
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2019 15:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732372AbfJQNbt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Oct 2019 09:31:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44926 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730600AbfJQNbs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Oct 2019 09:31:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so1660678pfn.11;
        Thu, 17 Oct 2019 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=71uoj2yc29GeY1Xak3gbiDlj4sBCXAEhrB5t6JTQI38=;
        b=WYYEirct5vmYQhA3KbSc0XnVAk90uWlVOlRrknkYBh9IfN3mWq6s9p81I4fgMPf1/a
         N5U1UGBczLAnKbk05TO4JIqrrpEp88YnqFbKHJsHAj7I4v55SHK+1XV9y6bhlMUmPVKH
         noy70mkcKcAhSPEO+NKAF/eRLyW2v1lH1jVtK4SP1CVBCRdsGuxcl03sYINDQZwmUR7P
         E2Pdg8P8qFHC4636xQL74OWPUJtX3891CkPtWyHH1uJXCBXpYdGy9XSh2uPSh/WcjDJx
         MCRCmzG/3F4EwRdag/OCrs5i5Ju+axTNEJQZdVPj8SaAZnld0+agJcevwCTb1dbQwoLa
         ATbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=71uoj2yc29GeY1Xak3gbiDlj4sBCXAEhrB5t6JTQI38=;
        b=gfbe/CJfGJDam1b+uaQa55cNZ7Mj2vuocivT4jMCRze8RBeRGSgIHtj2QMiXznWuED
         N/Q0/lXMuNVMeD7bQVjrBe1LcgHP9V+hFhH7OCZqV+rgDsP8eZdiWk5k7MwUiZ1q+78v
         HTqy9X7wnX8POtjeBiu73T7AdnMc7TwAso0Cc3QXDidjfGqXrV9MqPPBPeIaNHTqLBFj
         Q7s4qDR2mwEZVsn4VYwvACElIYQit25nIrkBYRHuSbSTmefaBrAfzQv5fn3llzkp2mHF
         Yer1My3O20NxDoMFR8pH9reGfX2sk+y/QuMcJexVoUhYwV0kyruaAhXGtVBNu8H1xvoR
         faNA==
X-Gm-Message-State: APjAAAVMgFHo+v9mW68oTkamRxqEvyU6OBa42qA9NF9T7WE5K/mfciV1
        EPCWnyxlVVvSmDaT14sGitRLSR5b
X-Google-Smtp-Source: APXvYqwkCzg39D6E3HXdCGSejfd6HNsWplmWxSFhlmyOLuTWztuKgI2cctSMGidm0wpV+1lYpWpnWg==
X-Received: by 2002:a17:90a:da04:: with SMTP id e4mr4417537pjv.33.1571319107104;
        Thu, 17 Oct 2019 06:31:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o9sm4077093pfp.67.2019.10.17.06.31.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 06:31:46 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: watchdog: Convert stm32 watchdog bindings to
 json-schema
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191017124159.13869-1-benjamin.gaignard@st.com>
 <63f96a2f-78c0-21ae-781b-e52068f57103@st.com>
 <6597f899-f049-02dc-de59-07a0f23a88b8@st.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d0c1af15-a647-8d80-81c9-fc07b926856c@roeck-us.net>
Date:   Thu, 17 Oct 2019 06:31:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6597f899-f049-02dc-de59-07a0f23a88b8@st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/17/19 6:17 AM, Benjamin GAIGNARD wrote:
> 
> On 10/17/19 3:06 PM, Alexandre Torgue wrote:
>> Hi Benjamin
>>
>> On 10/17/19 2:41 PM, Benjamin Gaignard wrote:
>>> Convert the STM32 watchdog binding to DT schema format using json-schema
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>>> ---
>>>    .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 -----------
>>>    .../bindings/watchdog/st,stm32-iwdg.yaml           | 54
>>> ++++++++++++++++++++++
>>>    2 files changed, 54 insertions(+), 26 deletions(-)
>>>    delete mode 100644
>>> Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>>>    create mode 100644
>>> Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>>> b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>>> deleted file mode 100644
>>> index d8f4430b0a13..000000000000
>>> --- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -STM32 Independent WatchDoG (IWDG)
>>> ----------------------------------
>>> -
>>> -Required properties:
>>> -- compatible: Should be either:
>>> -  - "st,stm32-iwdg"
>>> -  - "st,stm32mp1-iwdg"
>>> -- reg: Physical base address and length of the registers set for the
>>> device
>>> -- clocks: Reference to the clock entry lsi. Additional pclk clock entry
>>> -  is required only for st,stm32mp1-iwdg.
>>> -- clock-names: Name of the clocks used.
>>> -  "lsi" for st,stm32-iwdg
>>> -  "lsi", "pclk" for st,stm32mp1-iwdg
>>> -
>>> -Optional Properties:
>>> -- timeout-sec: Watchdog timeout value in seconds.
>>> -
>>> -Example:
>>> -
>>> -iwdg: watchdog@40003000 {
>>> -    compatible = "st,stm32-iwdg";
>>> -    reg = <0x40003000 0x400>;
>>> -    clocks = <&clk_lsi>;
>>> -    clock-names = "lsi";
>>> -    timeout-sec = <32>;
>>> -};
>>> diff --git
>>> a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
>>> b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
>>> new file mode 100644
>>> index 000000000000..edec96d53e6b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
>>> @@ -0,0 +1,54 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
>>> +
>>> +maintainers:
>>> +  - Yannick Fertre <yannick.fertre@st.com>
>>
>> Yannick is still working on this driver ?
> 
> That is a good question.
> 
> Rob, can we use the STM32 dedicated mailing list address for this
> mainteners field ?
> 
> maintainers:
> 
> - linux STM32 <linux-stm32@st-md-mailman.stormreply.com>
> 


I'd rather wonder who is going to maintain this secondary distributed
maintainers list, but I guess that is a different question.

Guenter

> Regards,
> 
> Benjamin
> 
>>
>>> +
>>> +allOf:
>>> +  - $ref: "watchdog.yaml#"
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - st,stm32-iwdg
>>> +      - st,stm32mp1-iwdg
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Low speed clock
>>> +      - description: Optional peripheral clock
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      enums: [ lsi, pclk ]
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>>> +    watchdog@5a002000 {
>>> +      compatible = "st,stm32mp1-iwdg";
>>> +      reg = <0x5a002000 0x400>;
>>> +      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
>>> +      clock-names = "pclk", "lsi";
>>> +      timeout-sec = <32>;
>>> +    };
>>> +
>>> +...
>> >

