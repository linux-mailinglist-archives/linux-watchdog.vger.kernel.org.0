Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D125D21036F
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 07:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgGAFvI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jul 2020 01:51:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52480 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgGAFvI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jul 2020 01:51:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0615ojJs042309;
        Wed, 1 Jul 2020 00:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593582645;
        bh=YUXD9ShzQYb7VpV33VRcMcIHHXqrxjBgwEaOLpyAUWA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vOmou64nBL+UgIXvO1hdA8KW/sse0kvsw/1NxW4HWvnwDuZGoko3Jr8J4cq8dvmfd
         tjPZMHJKNgLNHICA5QcWkiBgnOcKTETauu0aSW3UckXHwDjZsVP0ad42vGrMo8zZ54
         7h24RA+F1Y9nwgpi8MoxoFGIr3VLM3p+X5+/Y8QU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0615ojUL037785
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Jul 2020 00:50:45 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 1 Jul
 2020 00:50:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 1 Jul 2020 00:50:45 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0615ohlE059541;
        Wed, 1 Jul 2020 00:50:44 -0500
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jan Kiszka <jan.kiszka@siemens.com>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
 <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
 <1d84e633-b808-d6ac-a34c-9cc4709e43f6@ti.com>
 <20200630202356.GA16412@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <4e9c2731-bf02-1b59-298b-b7f9a0e87d10@ti.com>
Date:   Wed, 1 Jul 2020 08:50:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630202356.GA16412@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 30/06/2020 23:23, Guenter Roeck wrote:
> On Thu, Jun 25, 2020 at 08:04:50PM +0300, Tero Kristo wrote:
>> On 25/06/2020 16:35, Guenter Roeck wrote:
>>> On 6/25/20 1:32 AM, Tero Kristo wrote:
>>>> On 24/06/2020 18:24, Jan Kiszka wrote:
>>>>> On 24.06.20 13:45, Tero Kristo wrote:
>>>>>> If the RTI watchdog has been started by someone (like bootloader) when
>>>>>> the driver probes, we must adjust the initial ping timeout to match the
>>>>>> currently running watchdog window to avoid generating watchdog reset.
>>>>>>
>>>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>>>> ---
>>>>>>     drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
>>>>>>     1 file changed, 25 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>>>> index d456dd72d99a..02ea2b2435f5 100644
>>>>>> --- a/drivers/watchdog/rti_wdt.c
>>>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>>>> @@ -55,11 +55,13 @@ static int heartbeat;
>>>>>>      * @base - base io address of WD device
>>>>>>      * @freq - source clock frequency of WDT
>>>>>>      * @wdd  - hold watchdog device as is in WDT core
>>>>>> + * @min_hw_heartbeat_save - save of the min hw heartbeat value
>>>>>>      */
>>>>>>     struct rti_wdt_device {
>>>>>>         void __iomem        *base;
>>>>>>         unsigned long        freq;
>>>>>>         struct watchdog_device    wdd;
>>>>>> +    unsigned int        min_hw_heartbeat_save;
>>>>>>     };
>>>>>>     static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>> @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>>>>>>         /* put watchdog in active state */
>>>>>>         writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>>>>>> +    if (wdt->min_hw_heartbeat_save) {
>>>>>> +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
>>>>>> +        wdt->min_hw_heartbeat_save = 0;
>>>>>> +    }
>>>>>> +
>>>>>>         return 0;
>>>>>>     }
>>>>>> @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>>>             goto err_iomap;
>>>>>>         }
>>>>>> +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>>>>>> +        u32 time_left;
>>>>>> +        u32 heartbeat;
>>>>>> +
>>>>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>>>>> +        time_left = rti_wdt_get_timeleft(wdd);
>>>>>> +        heartbeat = readl(wdt->base + RTIDWDPRLD);
>>>>>> +        heartbeat <<= WDT_PRELOAD_SHIFT;
>>>>>> +        heartbeat /= wdt->freq;
>>>>>> +        if (time_left < heartbeat / 2)
>>>>>> +            wdd->min_hw_heartbeat_ms = 0;
>>>>>> +        else
>>>>>> +            wdd->min_hw_heartbeat_ms =
>>>>>> +                (time_left - heartbeat / 2 + 1) * 1000;
>>>>>> +
>>>>>> +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
>>>>>> +    }
>>>>>> +
>>>>>>         ret = watchdog_register_device(wdd);
>>>>>>         if (ret) {
>>>>>>             dev_err(dev, "cannot register watchdog device\n");
>>>>>>
>>>>>
>>>>> This assumes that the bootloader also programmed a 50% window, right? The pending U-Boot patch will do that, but what if that may chance or someone uses a different setup?
>>>>
>>>> Yes, we assume 50%. I think based on the hw design, 50% is the only sane value to be used, otherwise you just shrink the open window too much and for no apparent reason.
>>>>
>>>
>>> Not sure if that is a valid assumption. Someone who designs a watchdog
>>> with such a narrow ping window might as well also use it. The question
>>> is if you want to rely on that assumption, or check and change it if needed.
>>
>> Right, if that is a blocker, I can modify the code. Should be maybe couple
>> of lines addition.
>>
>>> Also, I wonder if we should add an API function such as
>>> "set_last_hw_keepalive()" to avoid all that complexity.
>>
>> I can try adding that also if it is desirable.
>>
> 
> But wait, the code doesn't really match what the description of this
> patch claims, or at least the description is misleading. Per the
> description, this is to prevent an early timeout. However, the problem
> here is that the watchdog core does not generate a ping, even if
> requested, because it believes that it just generated one right before
> the watchdog timer was registered, and that it can not generate another
> one because min_hw_heartbeat_ms has not elapsed.

You are right. Maybe the patch description could use some more beef into it.

> 
> With that in mind, the problem is a bit more complex.
> 
> First, the driver doesn't really update the current timeout to the
> value that is currently configured and enabled. Instead, it just
> uses/assumes the default (DEFAULT_HEARTBEAT or whatever the heartbeat
> module parameter is set to). This means that it is still possible for
> an early timeout to occur if there is a mismatch between the bootloader
> timeout and the timeout assumed by the driver. Worse, the timeout
> is only updated in the start function - and the start function isn't
> called if the watchdog is already running. Actually, the driver does
> not support updating the timeout at all. This means that a mismatch
> between the bootloader timeout and the timeout assumed by the driver
> is not handled well.
> 
> To solve this, the driver would have to update the actual timeout to
> whatever is programmed into the chip and ignore any module parameter
> and default settings if the watchdog is already running. Alternatively,
> it would have to support updating the timeout (if the hardware supports
> that) after the watchdog was started.

Hardware supports changing the timeout value, however it only updates 
this during the next window (preload values are picked once user pings 
the watchdog.)

> Second, handling min_hw_heartbeat_ms properly should really be implemented
> in the watchdog core. Instead of assuming that the most recent keepalive
> happened "just before now", as it currently does, it should call the
> timeleft function (if available and if the watchdog is running) and
> calculate the most recent keepalive (and thus the earliest acceptable
> next keepalive) from its return value.
Yes, it all becomes bit complex if we let the bootloader configure the 
values freely. Current bootloader implementation does not do this, as it 
is mostly a copy of the kernel driver.

However, I can modify the kernel driver to take all this into account, 
even if the code becomes a bit more complex due to this.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
