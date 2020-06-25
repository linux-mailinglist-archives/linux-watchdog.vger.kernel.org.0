Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E40209C64
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 12:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390816AbgFYKAn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 06:00:43 -0400
Received: from goliath.siemens.de ([192.35.17.28]:35223 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390356AbgFYKAn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 06:00:43 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 05PA0Jeu009001
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Jun 2020 12:00:20 +0200
Received: from [167.87.244.238] ([167.87.244.238])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05PA0IvT000636;
        Thu, 25 Jun 2020 12:00:18 +0200
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2cf3df87-5f0b-f8ff-a977-21625badb2c5@siemens.com>
Date:   Thu, 25 Jun 2020 12:00:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 25.06.20 10:32, Tero Kristo wrote:
> On 24/06/2020 18:24, Jan Kiszka wrote:
>> On 24.06.20 13:45, Tero Kristo wrote:
>>> If the RTI watchdog has been started by someone (like bootloader) when
>>> the driver probes, we must adjust the initial ping timeout to match the
>>> currently running watchdog window to avoid generating watchdog reset.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>> index d456dd72d99a..02ea2b2435f5 100644
>>> --- a/drivers/watchdog/rti_wdt.c
>>> +++ b/drivers/watchdog/rti_wdt.c
>>> @@ -55,11 +55,13 @@ static int heartbeat;
>>>    * @base - base io address of WD device
>>>    * @freq - source clock frequency of WDT
>>>    * @wdd  - hold watchdog device as is in WDT core
>>> + * @min_hw_heartbeat_save - save of the min hw heartbeat value
>>>    */
>>>   struct rti_wdt_device {
>>>       void __iomem        *base;
>>>       unsigned long        freq;
>>>       struct watchdog_device    wdd;
>>> +    unsigned int        min_hw_heartbeat_save;
>>>   };
>>>   static int rti_wdt_start(struct watchdog_device *wdd)
>>> @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device 
>>> *wdd)
>>>       /* put watchdog in active state */
>>>       writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>>> +    if (wdt->min_hw_heartbeat_save) {
>>> +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
>>> +        wdt->min_hw_heartbeat_save = 0;
>>> +    }
>>> +
>>>       return 0;
>>>   }
>>> @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device 
>>> *pdev)
>>>           goto err_iomap;
>>>       }
>>> +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>>> +        u32 time_left;
>>> +        u32 heartbeat;
>>> +
>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>> +        time_left = rti_wdt_get_timeleft(wdd);
>>> +        heartbeat = readl(wdt->base + RTIDWDPRLD);
>>> +        heartbeat <<= WDT_PRELOAD_SHIFT;
>>> +        heartbeat /= wdt->freq;
>>> +        if (time_left < heartbeat / 2)
>>> +            wdd->min_hw_heartbeat_ms = 0;
>>> +        else
>>> +            wdd->min_hw_heartbeat_ms =
>>> +                (time_left - heartbeat / 2 + 1) * 1000;
>>> +
>>> +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
>>> +    }
>>> +
>>>       ret = watchdog_register_device(wdd);
>>>       if (ret) {
>>>           dev_err(dev, "cannot register watchdog device\n");
>>>
>>
>> This assumes that the bootloader also programmed a 50% window, right? 
>> The pending U-Boot patch will do that, but what if that may chance or 
>> someone uses a different setup?
> 
> Yes, we assume 50%. I think based on the hw design, 50% is the only sane 
> value to be used, otherwise you just shrink the open window too much and 
> for no apparent reason.

Fine with me, but should we check that assumption when adopting the 
watchdog?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
