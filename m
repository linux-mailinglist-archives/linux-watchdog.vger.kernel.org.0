Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7961F5552
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jun 2020 15:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgFJNF7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jun 2020 09:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgFJNF6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jun 2020 09:05:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7C1C03E96B;
        Wed, 10 Jun 2020 06:05:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bh7so932012plb.11;
        Wed, 10 Jun 2020 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=16YOCV36mLfl0KV2D+ICdawAtjIHU4yPMq6agfLrJUY=;
        b=cEiTaDsLxzppaaRD5HR76sFM90ryVl1MeKAGbMwYsgjKIWThS6nLAxBF4gOFY0p4dH
         VltowO08wDZ6HEnYgi/VLyJzc7/2+kmDgzgW/2+VVEQzS15w91OUr1eIZfNn+ElhXVrw
         kaPGmrBrrsIQrrEX/e79+l3yItQmO2YoKJlpIEJAKykfryd6fppnmeG+AqM5m3N4L4GL
         qisvrn5vzTjwAi0R8fBTz/R7GMo+ANzovyRRD7HAiZ//i0NI17aZkFFIaPbD76xRXtIQ
         RFQLhHQcTLfZm42dnwvWnAaNEWYOHpbmnMiASZDmeT6fOi12j5CtP1HXCHgF/z4X0v6P
         dHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=16YOCV36mLfl0KV2D+ICdawAtjIHU4yPMq6agfLrJUY=;
        b=tIsRYim0o2SbEmgh3bUbznR+w2voU1vI2YGyGmH+xmNxflsskQxtDiFqax51/2mxp+
         VCmGA5Y+RjDKhQO8bSdYw7R8PgUs6+fHwXWq/dZArBkzSXjUMI7BCsUJuucDd6mRkTVP
         LQoIvaEUdxaPOuO8cJjt/n5F8eqiAkfHuQ4V6iTBcK1fB24ADG9srHM6p3SYswd4NprN
         KQtpD5/qp9gQ9JAqWHwNa5E8wfwoqAf6foOz1HdBIWbJJ7zF5bXslZ4cshQzToYDhAK7
         hdZvox8gA9FfDOLrOJeVCpLf2ypEFJd061ZMcEPT5cUse/xDzke4rz+ydsW6zHbhBvoW
         CjTw==
X-Gm-Message-State: AOAM530QkGHiiMsuso48yYz8HFS3zzCmN5YSBi2jn8nb5u/sqW3kSM08
        ocww6M9T8qwLp6PcBGycB8o=
X-Google-Smtp-Source: ABdhPJzvX5qLfzBVnhO1MtchGO9CqcHp0e2CJAyO3QD6VFqohUXJFd1RoFHkfRl9Z2VT+HuQDWLB9A==
X-Received: by 2002:a17:90a:22cc:: with SMTP id s70mr3140096pjc.2.1591794357490;
        Wed, 10 Jun 2020 06:05:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9sm11287016pgo.22.2020.06.10.06.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:05:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: intel: Add YAML Schemas for
 Watchdog timer
To:     Dilip Kota <eswara.kota@linux.intel.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <ac89e289b79fec0a82d1dd060e17eeca024885d5.1591584255.git.eswara.kota@linux.intel.com>
 <235d301b-3b25-bb00-bd1b-c4392fa23c63@roeck-us.net>
 <4a336f1d-68da-3356-a73a-95747ba4af4c@linux.intel.com>
 <83812b78-41e3-299d-36a0-6ce1576e7e78@roeck-us.net>
 <aabceb6f-265d-fd11-eee1-6bccf2160512@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c294ced9-a37b-6a90-511e-187bacdec80c@roeck-us.net>
Date:   Wed, 10 Jun 2020 06:05:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aabceb6f-265d-fd11-eee1-6bccf2160512@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/10/20 12:54 AM, Dilip Kota wrote:
> 
> On 6/9/2020 9:46 PM, Guenter Roeck wrote:
>> On 6/9/20 1:57 AM, Dilip Kota wrote:
>>> On 6/8/2020 9:37 PM, Guenter Roeck wrote:
>>>> On 6/7/20 10:49 PM, Dilip Kota wrote:
>>>>> Add YAML schemas for the watchdog timer on Intel Lightning
>>>>> Mountain SoC.
>>>>>
>>>>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>>>>> ---
>>>>>    .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      | 75 ++++++++++++++++++++++
>>>>>    1 file changed, 75 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..83dc39a5090c1
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>>> @@ -0,0 +1,75 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/watchdog/intel,lgm-gptc-wdt.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Intel Lightning Mountain Watchdog timer.
>>>>> +
>>>>> +maintainers:
>>>>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>>>>> +
>>>>> +description: |
>>>>> +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
>>>>> +  be configured as Clocksource, real time clock and Watchdog timer.
>>>>> +  Each General Purpose Timer Counter has three timers. And total four General
>>>>> +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
>>>>> +  to 12 timers.
>>>>> +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
>>>>> +  timer as watchdog timer. Total four timers are configured as watchdog timers
>>>>> +  on Lightning Mountain SoC.
>>>>> +
>>>> Why not just one ? The watchdog subsystem does not monitor individual CPUs,
>>>> it monitors the system.
>>> Intel Atom based Lightning Mountain SoC, system has four CPUs. On Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers and reset controller unit. On Lightning Mountain SoC, each CPU is configured with one GPTC timer, so that if any of the CPU hangs or freezes, the watchdog daemon running on respective CPU cannot reset/ping or pet the watchdog timer. This causes the watchdog timeout. On watchdog timeout, reset controller triggers the reset to respective CPU.
>>>
>> A system watchdog driver should not duplicate functionality
>> from kernel/watchdog.c, which monitors individual CPUs.
>> If the SoC does nto provide a system watchdog timer (which
>> I think is unlikely), it should stick with that. A watchdog
>> resetting an individual CPU instead of the entire system
>> isn't something I would want to see in the watchdog subsystem.
> My bad here, complete hardware reset happens on watchdog timeout not a single CPU or core.
> Could you please clarify: The complete system means, you mean, "a watchdog susbsystem should monitor all the cores/cpus in the SoC. Not like each core/cpu in SoC having a wdt".
> 

No, the watchdog subsystem does not monitor "all cores".
Again, that is the responsibility of kernel/watchdog.c.

Guenter

> Regards,
> Dilip
>>
>> Guenter
>>

