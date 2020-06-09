Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4601F3D03
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 15:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgFINqU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 09:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgFINqT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 09:46:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77900C05BD1E;
        Tue,  9 Jun 2020 06:46:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so4052613pgk.11;
        Tue, 09 Jun 2020 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/k4EmHOAERaREN8qWtWBob3gQXAhxOW13M9Yk4j9DWk=;
        b=VDrlLBWev6iIEzXHhUoNI4IybHiCQHESLtVnw+LyJynyWlugmQDKaeF6CC+P5jp/mt
         AZ/1aU88aJoFBGLY5EjklJ9GEqYyz/WcKcIXY9+GH+xWYhW281fY7XoWAfwsqK1uEFxk
         KGkbEG00F0ocdlqdq8yzr+Y2P25C7yeH7L3HiZ0Mahf7ClIflBgtuXZ7Cn+gdfDb1QxF
         Hzw89nAdaGmKM9lGEw8kec06jzqm+tBDLx+Lb4mNlxONlXFnKzKIKR6/+f7c94h/M/Uk
         19GgDbpZzHD63DPAjoGmf+sFIJnLpwq6yX8vqrkFEH1t3k7cSaXZPXC5+2741XPhD+g8
         rbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/k4EmHOAERaREN8qWtWBob3gQXAhxOW13M9Yk4j9DWk=;
        b=mZghWohhP5YArcRahWFw0Vh/BhUH32yEMryGzhL5QSRdIXEHL9WUNZa/3bG3niqq8Q
         SC44xDWmPuJnFvm5syEJvC8UfnCb3BJZu9zt1/ZW2Z0bZUjPcXPlKlchy8lJhBbgxnbj
         em3TT0u489LkvF8o29h1ZeTvjFvuoVfXo8XwAVi9QbzNs5wqtxXasdohazFPP27cid8I
         vZSIQ+0KAIWKBkNYxc1v7JevhfqhSG/AeP8/t8nwWUkJ6Uq1ROqvzlFKlEt3uEECf1q5
         qatplgxeeAz8bKGNtPERy/PTeTHZPqaoU2ZxvShynw4HIRfhkCl8sd4S9uQ9VxovmNF0
         JKWw==
X-Gm-Message-State: AOAM531Q+jslpDc3al9NiWNTzyHPwl1qBuXdqeuAM13df+u7LQKS/ZCy
        YKC3kdM0XEIGq8sJY/yHBx4=
X-Google-Smtp-Source: ABdhPJxrS819fvVw2qNU3AZPLSyn8wqMiP7zLeoTRVCfKpLdmwvNkMGjNppIdi/Cmtuey+iTtAhArQ==
X-Received: by 2002:a63:c004:: with SMTP id h4mr24498663pgg.385.1591710377918;
        Tue, 09 Jun 2020 06:46:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 84sm10022131pfu.167.2020.06.09.06.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:46:17 -0700 (PDT)
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
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <83812b78-41e3-299d-36a0-6ce1576e7e78@roeck-us.net>
Date:   Tue, 9 Jun 2020 06:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4a336f1d-68da-3356-a73a-95747ba4af4c@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/9/20 1:57 AM, Dilip Kota wrote:
> 
> On 6/8/2020 9:37 PM, Guenter Roeck wrote:
>> On 6/7/20 10:49 PM, Dilip Kota wrote:
>>> Add YAML schemas for the watchdog timer on Intel Lightning
>>> Mountain SoC.
>>>
>>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>>> ---
>>>   .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      | 75 ++++++++++++++++++++++
>>>   1 file changed, 75 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>> new file mode 100644
>>> index 0000000000000..83dc39a5090c1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/watchdog/intel,lgm-gptc-wdt.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Intel Lightning Mountain Watchdog timer.
>>> +
>>> +maintainers:
>>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>>> +
>>> +description: |
>>> +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
>>> +  be configured as Clocksource, real time clock and Watchdog timer.
>>> +  Each General Purpose Timer Counter has three timers. And total four General
>>> +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
>>> +  to 12 timers.
>>> +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
>>> +  timer as watchdog timer. Total four timers are configured as watchdog timers
>>> +  on Lightning Mountain SoC.
>>> +
>> Why not just one ? The watchdog subsystem does not monitor individual CPUs,
>> it monitors the system.
> 
> Intel Atom based Lightning Mountain SoC, system has four CPUs. On Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers and reset controller unit. On Lightning Mountain SoC, each CPU is configured with one GPTC timer, so that if any of the CPU hangs or freezes, the watchdog daemon running on respective CPU cannot reset/ping or pet the watchdog timer. This causes the watchdog timeout. On watchdog timeout, reset controller triggers the reset to respective CPU.
> 
A system watchdog driver should not duplicate functionality
from kernel/watchdog.c, which monitors individual CPUs.
If the SoC does nto provide a system watchdog timer (which
I think is unlikely), it should stick with that. A watchdog
resetting an individual CPU instead of the entire system
isn't something I would want to see in the watchdog subsystem.

Guenter

> 
> ____________________
> ----------------------------->|                |
>                                                    |         ------------>| Reset controller unit    |
> |                     |                 |___________________|
> |                     |
> |                     |
>   ______________________|__________|______
>   |                                  GPTC   | |            |
>   | ___________   ________|_       ______|____   |
>   | |      timer 1 |   | timer 2      |    | timer 3      |    |
>   | |_________|   |_________|    |_________|    |
>   |______________________________________|
> 
> Regards,
> -Dilip
> 
> 
>> Guenter
>>
>>

