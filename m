Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27050209B55
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 10:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390600AbgFYIcc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 04:32:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36748 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389860AbgFYIcc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 04:32:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05P8WA8c010941;
        Thu, 25 Jun 2020 03:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593073930;
        bh=x+T5cXwZuLi7FDAawNLtBY9/NjQ27gAAnT6luVRlzaE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bwbItrfx66uwIQ5NEVXn/4q16hblTMS4NhuYkCXknoDuCChKfOzTSc0o50+vKhLCI
         ARLemxLG8RqnvEwLYPxMUzVQxT544jusLeEFbsMExfQ/OMg2sfMd+PiydxtdJVw2p8
         StjZFTZtGC7uLoMEYFva4mCcIUc3Jkku9CwIWbFs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05P8WAAR050561
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jun 2020 03:32:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 25
 Jun 2020 03:32:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 25 Jun 2020 03:32:10 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05P8W8c4045658;
        Thu, 25 Jun 2020 03:32:08 -0500
Subject: Re: [PATCH 2/2] watchdog: rti: tweak min_hw_heartbeat_ms to match
 initial allowed window
To:     Jan Kiszka <jan.kiszka@siemens.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-3-t-kristo@ti.com>
 <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <b3849bea-2a4d-079e-e9df-8a1d6c13c0c7@ti.com>
Date:   Thu, 25 Jun 2020 11:32:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <289c6104-a885-d3c1-c670-a081ebaaf782@siemens.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 24/06/2020 18:24, Jan Kiszka wrote:
> On 24.06.20 13:45, Tero Kristo wrote:
>> If the RTI watchdog has been started by someone (like bootloader) when
>> the driver probes, we must adjust the initial ping timeout to match the
>> currently running watchdog window to avoid generating watchdog reset.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index d456dd72d99a..02ea2b2435f5 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -55,11 +55,13 @@ static int heartbeat;
>>    * @base - base io address of WD device
>>    * @freq - source clock frequency of WDT
>>    * @wdd  - hold watchdog device as is in WDT core
>> + * @min_hw_heartbeat_save - save of the min hw heartbeat value
>>    */
>>   struct rti_wdt_device {
>>       void __iomem        *base;
>>       unsigned long        freq;
>>       struct watchdog_device    wdd;
>> +    unsigned int        min_hw_heartbeat_save;
>>   };
>>   static int rti_wdt_start(struct watchdog_device *wdd)
>> @@ -107,6 +109,11 @@ static int rti_wdt_ping(struct watchdog_device *wdd)
>>       /* put watchdog in active state */
>>       writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>> +    if (wdt->min_hw_heartbeat_save) {
>> +        wdd->min_hw_heartbeat_ms = wdt->min_hw_heartbeat_save;
>> +        wdt->min_hw_heartbeat_save = 0;
>> +    }
>> +
>>       return 0;
>>   }
>> @@ -201,6 +208,24 @@ static int rti_wdt_probe(struct platform_device 
>> *pdev)
>>           goto err_iomap;
>>       }
>> +    if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>> +        u32 time_left;
>> +        u32 heartbeat;
>> +
>> +        set_bit(WDOG_HW_RUNNING, &wdd->status);
>> +        time_left = rti_wdt_get_timeleft(wdd);
>> +        heartbeat = readl(wdt->base + RTIDWDPRLD);
>> +        heartbeat <<= WDT_PRELOAD_SHIFT;
>> +        heartbeat /= wdt->freq;
>> +        if (time_left < heartbeat / 2)
>> +            wdd->min_hw_heartbeat_ms = 0;
>> +        else
>> +            wdd->min_hw_heartbeat_ms =
>> +                (time_left - heartbeat / 2 + 1) * 1000;
>> +
>> +        wdt->min_hw_heartbeat_save = 11 * heartbeat * 1000 / 20;
>> +    }
>> +
>>       ret = watchdog_register_device(wdd);
>>       if (ret) {
>>           dev_err(dev, "cannot register watchdog device\n");
>>
> 
> This assumes that the bootloader also programmed a 50% window, right? 
> The pending U-Boot patch will do that, but what if that may chance or 
> someone uses a different setup?

Yes, we assume 50%. I think based on the hw design, 50% is the only sane 
value to be used, otherwise you just shrink the open window too much and 
for no apparent reason.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
