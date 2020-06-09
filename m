Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CBC1F368B
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 10:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgFII5q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 04:57:46 -0400
Received: from mga11.intel.com ([192.55.52.93]:32395 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgFII5p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 04:57:45 -0400
IronPort-SDR: oM/EaYzZwNaNuVI5WUQ6ChzyzQGTJXen0nOGs36QFgmslaKjgUQcY+VycSLOUbksuuWIf8aTVD
 uZiT9L7jJA0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 01:57:43 -0700
IronPort-SDR: GIRaMrOrpXlCj1nB5MRcGlNFFZoOD5ymxT4t0908X5luyn6OQQIuqUi76fvu4DmlM+m0Rum7lN
 dpgmJ98uBVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; 
   d="scan'208";a="306199982"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 09 Jun 2020 01:57:43 -0700
Received: from [10.215.166.141] (ekotax-mobl.gar.corp.intel.com [10.215.166.141])
        by linux.intel.com (Postfix) with ESMTP id 874C15805B5;
        Tue,  9 Jun 2020 01:57:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: intel: Add YAML Schemas for
 Watchdog timer
To:     Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com, yixin.zhu@intel.com
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
 <ac89e289b79fec0a82d1dd060e17eeca024885d5.1591584255.git.eswara.kota@linux.intel.com>
 <235d301b-3b25-bb00-bd1b-c4392fa23c63@roeck-us.net>
From:   Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <4a336f1d-68da-3356-a73a-95747ba4af4c@linux.intel.com>
Date:   Tue, 9 Jun 2020 16:57:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <235d301b-3b25-bb00-bd1b-c4392fa23c63@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 6/8/2020 9:37 PM, Guenter Roeck wrote:
> On 6/7/20 10:49 PM, Dilip Kota wrote:
>> Add YAML schemas for the watchdog timer on Intel Lightning
>> Mountain SoC.
>>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>>   .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      | 75 ++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>> new file mode 100644
>> index 0000000000000..83dc39a5090c1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/intel,lgm-gptc-wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel Lightning Mountain Watchdog timer.
>> +
>> +maintainers:
>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>> +
>> +description: |
>> +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
>> +  be configured as Clocksource, real time clock and Watchdog timer.
>> +  Each General Purpose Timer Counter has three timers. And total four General
>> +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
>> +  to 12 timers.
>> +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
>> +  timer as watchdog timer. Total four timers are configured as watchdog timers
>> +  on Lightning Mountain SoC.
>> +
> Why not just one ? The watchdog subsystem does not monitor individual CPUs,
> it monitors the system.

Intel Atom based Lightning Mountain SoC, system has four CPUs. On 
Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers 
and reset controller unit. On Lightning Mountain SoC, each CPU is 
configured with one GPTC timer, so that if any of the CPU hangs or 
freezes, the watchdog daemon running on respective CPU cannot reset/ping 
or pet the watchdog timer. This causes the watchdog timeout. On watchdog 
timeout, reset controller triggers the reset to respective CPU.


____________________
----------------------------->|                |
                                                    |         
------------>| Reset controller unit    |
|                     |                 |___________________|
|                     |
|                     |
   ______________________|__________|______
   |                                  GPTC   | |            |
   | ___________   ________|_       ______|____   |
   | |      timer 1 |   | timer 2      |    | timer 3      |    |
   | |_________|   |_________|    |_________|    |
   |______________________________________|

Regards,
-Dilip


> Guenter
>
>
