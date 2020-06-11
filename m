Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFA41F64D8
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 11:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgFKJiW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 05:38:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:43984 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgFKJiW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 05:38:22 -0400
IronPort-SDR: OYXV0qGQklU/eQYx0kAdBvudOFPZJ/t81oQviSFTiC5cbHWXWD7qMwPgM4a49UMBI/DIKKy6RA
 tjBDSBzKSMxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 02:38:21 -0700
IronPort-SDR: 7nAZag4CYbYEQrc1XyoWtk0pYw4I0ykWZm3bH7JzVwbEoQUSw3RYtfpKUH/vFdGVbQs9C0U8Rt
 wCoXP3vLlxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="275277564"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2020 02:38:19 -0700
Received: from [10.213.137.212] (ekotax-mobl.gar.corp.intel.com [10.213.137.212])
        by linux.intel.com (Postfix) with ESMTP id 10672580458;
        Thu, 11 Jun 2020 02:38:15 -0700 (PDT)
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
 <4a336f1d-68da-3356-a73a-95747ba4af4c@linux.intel.com>
 <83812b78-41e3-299d-36a0-6ce1576e7e78@roeck-us.net>
 <aabceb6f-265d-fd11-eee1-6bccf2160512@linux.intel.com>
 <c294ced9-a37b-6a90-511e-187bacdec80c@roeck-us.net>
From:   Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <4feae044-1956-fb70-7786-19c7c48cc391@linux.intel.com>
Date:   Thu, 11 Jun 2020 17:38:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c294ced9-a37b-6a90-511e-187bacdec80c@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 6/10/2020 9:05 PM, Guenter Roeck wrote:
> On 6/10/20 12:54 AM, Dilip Kota wrote:
>> On 6/9/2020 9:46 PM, Guenter Roeck wrote:
>>> On 6/9/20 1:57 AM, Dilip Kota wrote:
>>>> On 6/8/2020 9:37 PM, Guenter Roeck wrote:
>>>>> On 6/7/20 10:49 PM, Dilip Kota wrote:
[...]
>>>>>> +
>>>>>> +description: |
>>>>>> +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
>>>>>> +  be configured as Clocksource, real time clock and Watchdog timer.
>>>>>> +  Each General Purpose Timer Counter has three timers. And total four General
>>>>>> +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
>>>>>> +  to 12 timers.
>>>>>> +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
>>>>>> +  timer as watchdog timer. Total four timers are configured as watchdog timers
>>>>>> +  on Lightning Mountain SoC.
>>>>>> +
>>>>> Why not just one ? The watchdog subsystem does not monitor individual CPUs,
>>>>> it monitors the system.
>>>> Intel Atom based Lightning Mountain SoC, system has four CPUs. On Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers and reset controller unit. On Lightning Mountain SoC, each CPU is configured with one GPTC timer, so that if any of the CPU hangs or freezes, the watchdog daemon running on respective CPU cannot reset/ping or pet the watchdog timer. This causes the watchdog timeout. On watchdog timeout, reset controller triggers the reset to respective CPU.
>>>>
>>> A system watchdog driver should not duplicate functionality
>>> from kernel/watchdog.c, which monitors individual CPUs.
>>> If the SoC does nto provide a system watchdog timer (which
>>> I think is unlikely), it should stick with that. A watchdog
>>> resetting an individual CPU instead of the entire system
>>> isn't something I would want to see in the watchdog subsystem.
>> My bad here, complete hardware reset happens on watchdog timeout not a single CPU or core.
>> Could you please clarify: The complete system means, you mean, "a watchdog susbsystem should monitor all the cores/cpus in the SoC. Not like each core/cpu in SoC having a wdt".
>>
> No, the watchdog subsystem does not monitor "all cores".
> Again, that is the responsibility of kernel/watchdog.c.
I am a bit confused here.
I have gone through the kernel/watchdog.c code and i see hrtimers are 
used and panic is triggered for lockup on CPU/core.
It looks similar to the watchdog subsystem which uses wdt and triggers 
hardware reset on timeout, whereas kernel/watchdog.c using hrtimers and 
triggers panic on timeout.
To my understanding Watchdog timer recovers the hardware from software 
hangs or freeze states on the CPU / cores.
Also, what does system mean in your statement " watchdog subsystem 
monitors the system"? What all comes under the system other than the 
cores/cpus.
And also i see there is no other watchdog subsystem in Lightning 
Mountain architecture.

Regards,
Dilip
>
> Guenter
>
>> Regards,
>> Dilip
>>> Guenter
>>>
