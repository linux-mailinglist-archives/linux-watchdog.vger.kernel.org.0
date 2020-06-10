Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE05E1F4FAD
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jun 2020 09:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgFJHyQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jun 2020 03:54:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:21007 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgFJHyP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jun 2020 03:54:15 -0400
IronPort-SDR: d5e1sdQbCd/XP/MHwQTfKjIFMat4BfJlDH/Q5Njesgbpspa0LEu5+DpubHJfCl2IXQTq1/PoxV
 E933IgMzqInA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 00:54:14 -0700
IronPort-SDR: 469ckEW6oq1EUpOvOxSjG+uRSyu78YUaFUohwmFifokapxW+O28HdKzPrWZ8zYJiKRgNqFba/Z
 nHTbGEgibEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; 
   d="scan'208";a="260066021"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP; 10 Jun 2020 00:54:14 -0700
Received: from [10.249.66.120] (ekotax-MOBL.gar.corp.intel.com [10.249.66.120])
        by linux.intel.com (Postfix) with ESMTP id 082595805B5;
        Wed, 10 Jun 2020 00:54:11 -0700 (PDT)
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
From:   Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <aabceb6f-265d-fd11-eee1-6bccf2160512@linux.intel.com>
Date:   Wed, 10 Jun 2020 15:54:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <83812b78-41e3-299d-36a0-6ce1576e7e78@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 6/9/2020 9:46 PM, Guenter Roeck wrote:
> On 6/9/20 1:57 AM, Dilip Kota wrote:
>> On 6/8/2020 9:37 PM, Guenter Roeck wrote:
>>> On 6/7/20 10:49 PM, Dilip Kota wrote:
>>>> Add YAML schemas for the watchdog timer on Intel Lightning
>>>> Mountain SoC.
>>>>
>>>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>>>> ---
>>>>    .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      | 75 ++++++++++++++++++++++
>>>>    1 file changed, 75 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>> new file mode 100644
>>>> index 0000000000000..83dc39a5090c1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
>>>> @@ -0,0 +1,75 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/watchdog/intel,lgm-gptc-wdt.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Intel Lightning Mountain Watchdog timer.
>>>> +
>>>> +maintainers:
>>>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>>>> +
>>>> +description: |
>>>> +  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
>>>> +  be configured as Clocksource, real time clock and Watchdog timer.
>>>> +  Each General Purpose Timer Counter has three timers. And total four General
>>>> +  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
>>>> +  to 12 timers.
>>>> +  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
>>>> +  timer as watchdog timer. Total four timers are configured as watchdog timers
>>>> +  on Lightning Mountain SoC.
>>>> +
>>> Why not just one ? The watchdog subsystem does not monitor individual CPUs,
>>> it monitors the system.
>> Intel Atom based Lightning Mountain SoC, system has four CPUs. On Lightning Mountain SoC ,Watchdog subsystem is combination of GPTC timers and reset controller unit. On Lightning Mountain SoC, each CPU is configured with one GPTC timer, so that if any of the CPU hangs or freezes, the watchdog daemon running on respective CPU cannot reset/ping or pet the watchdog timer. This causes the watchdog timeout. On watchdog timeout, reset controller triggers the reset to respective CPU.
>>
> A system watchdog driver should not duplicate functionality
> from kernel/watchdog.c, which monitors individual CPUs.
> If the SoC does nto provide a system watchdog timer (which
> I think is unlikely), it should stick with that. A watchdog
> resetting an individual CPU instead of the entire system
> isn't something I would want to see in the watchdog subsystem.
My bad here, complete hardware reset happens on watchdog timeout not a 
single CPU or core.
Could you please clarify: The complete system means, you mean, "a 
watchdog susbsystem should monitor all the cores/cpus in the SoC. Not 
like each core/cpu in SoC having a wdt".

Regards,
Dilip
>
> Guenter
>
