Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196FF20A3A8
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 19:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404326AbgFYRGa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 13:06:30 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41856 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404376AbgFYRGa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 13:06:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05PH4s1j015335;
        Thu, 25 Jun 2020 12:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593104694;
        bh=ONVcVn3bey9yl+Y9AA3TJVO17GyEvycrQ6oGUr5xABk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VeX/+nmR89jbqhMaGIjQZcXyTRkVf8XN2TGdHgOPTjeN+6tIIcJUj2UJZ2qNOwjzN
         k2wDLNwWtVI5hmoI0mW8Rn/Z9fB47/08j5fiB+xrAUcD2YZgUZLH4gU2dGvq9IA3Zv
         rSoDjm1EjYdkCj77mB9ShAKbSWmADriglQu3FODw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05PH4sqM075398
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jun 2020 12:04:54 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 25
 Jun 2020 12:04:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 25 Jun 2020 12:04:53 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05PH4pWG025571;
        Thu, 25 Jun 2020 12:04:52 -0500
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Guenter Roeck <linux@roeck-us.net>,
        Jan Kiszka <jan.kiszka@siemens.com>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
 <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
 <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <1d84e633-b808-d6ac-a34c-9cc4709e43f6@ti.com>
Date:   Thu, 25 Jun 2020 20:04:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <25bf3ed1-5434-9b45-20ae-e1b2cfc5e5c0@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 25/06/2020 16:35, Guenter Roeck wrote:
> On 6/25/20 1:32 AM, Tero Kristo wrote:
>> On 24/06/2020 18:24, Jan Kiszka wrote:
>>> On 24.06.20 13:45, Tero Kristo wrote:
>>>> If the RTI watchdog has been started by someone (like bootloader) when
>>>> the driver probes, we must adjust the initial ping timeout to match the
>>>> currently running watchdog window to avoid generating watchdog reset.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>> ---
>>>>    drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>> index d456dd72d99a..02ea2b2435f5 100644
>>>> --- a/drivers/watchdog/rti_wdt.c
>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>> @@ -55,11 +55,13 @@ static int heartbeat;
>>>>     * @base - base io address of WD device
>>>>     * @freq - source clock frequency of WDT
>>>>     * @wdd  - hold watchdog device as is in WDT core
>>>> + * @min_hw_heartbeat_save - save of the min hw heartbeat value
>>>>     */
>>>>    struct rti_wdt_device {
>>>>        void __iomem        *base;
>>>>        unsigned long        freq;
>>>>        struct watchdog_device    wdd;
>>>> +    unsigned int        min_hw_heartbeat_save;
>>>>    };
>>>>    static int rti_wdt_start(struct watchdog_device *wdd)
>>>> @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>>>>        /* put watchdog in active state */
>>>>        writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>>>> +    if (wdt->min_hw_heartbeat_save) {
>>>> +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
>>>> +        wdt->min_hw_heartbeat_save = 0;
>>>> +    }
>>>> +
>>>>        return 0;
>>>>    }
>>>> @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>>>            goto err_iomap;
>>>>        }
>>>> +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>>>> +        u32 time_left;
>>>> +        u32 heartbeat;
>>>> +
>>>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>>>> +        time_left = rti_wdt_get_timeleft(wdd);
>>>> +        heartbeat = readl(wdt->base + RTIDWDPRLD);
>>>> +        heartbeat <<= WDT_PRELOAD_SHIFT;
>>>> +        heartbeat /= wdt->freq;
>>>> +        if (time_left < heartbeat / 2)
>>>> +            wdd->min_hw_heartbeat_ms = 0;
>>>> +        else
>>>> +            wdd->min_hw_heartbeat_ms =
>>>> +                (time_left - heartbeat / 2 + 1) * 1000;
>>>> +
>>>> +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
>>>> +    }
>>>> +
>>>>        ret = watchdog_register_device(wdd);
>>>>        if (ret) {
>>>>            dev_err(dev, "cannot register watchdog device\n");
>>>>
>>>
>>> This assumes that the bootloader also programmed a 50% window, right? The pending U-Boot patch will do that, but what if that may chance or someone uses a different setup?
>>
>> Yes, we assume 50%. I think based on the hw design, 50% is the only sane value to be used, otherwise you just shrink the open window too much and for no apparent reason.
>>
> 
> Not sure if that is a valid assumption. Someone who designs a watchdog
> with such a narrow ping window might as well also use it. The question
> is if you want to rely on that assumption, or check and change it if needed.

Right, if that is a blocker, I can modify the code. Should be maybe 
couple of lines addition.

> Also, I wonder if we should add an API function such as
> "set_last_hw_keepalive()" to avoid all that complexity.

I can try adding that also if it is desirable.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
