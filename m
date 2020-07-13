Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BAD21D667
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 14:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgGMM4r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 08:56:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51140 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729683AbgGMM4q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 08:56:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DCt7Tw084177;
        Mon, 13 Jul 2020 07:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594644907;
        bh=gquUXcLiNeoXPFXE6SRFUPAtfnoWAv417aPFshr32s4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=U9hrP4mrbp4UVRZnO5yN8lwt0JUVdJitXtKfJEKGJTVa1msPeAbSWbJo7Z5vpZ8ar
         Ph3johXHrRGYz0hxk3xA5TKXp8nnDhlU/Pp/gOadRK4QtGFXaXZeO6+GZoIVHtTH26
         AjqsYZLKFQJY2qnIeVNbOQcfHQ6w6LW0InUmfMww=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DCt659054119
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 07:55:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 07:55:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 07:55:06 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DCt4hj098291;
        Mon, 13 Jul 2020 07:55:05 -0500
Subject: Re: [PATCHv2 4/5] watchdog: rti-wdt: attach to running watchdog
 during probe
To:     Guenter Roeck <linux@roeck-us.net>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
References: <20200703120406.7092-1-t-kristo@ti.com>
 <20200703120406.7092-5-t-kristo@ti.com>
 <8eecaa6a-2e0e-14b3-473a-0674f9b2be26@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <9b3f383f-b3fe-3995-7fe6-b34121e79a71@ti.com>
Date:   Mon, 13 Jul 2020 15:55:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8eecaa6a-2e0e-14b3-473a-0674f9b2be26@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/07/2020 18:07, Guenter Roeck wrote:
> On 7/3/20 5:04 AM, Tero Kristo wrote:
>> If the RTI watchdog is running already during probe, the driver must
>> configure itself to match the HW. Window size and timeout is probed from
>> hardware, and the last keepalive ping is adjusted to match it also.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index 110bfc8d0bb3..987e5a798cb4 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -213,6 +213,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   	struct watchdog_device *wdd;
>>   	struct rti_wdt_device *wdt;
>>   	struct clk *clk;
>> +	u32 last_ping = 0;
>>   
>>   	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>>   	if (!wdt)
>> @@ -258,11 +259,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   	wdd->min_timeout = 1;
>>   	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>>   		wdt->freq * 1000;
>> -	wdd->timeout = DEFAULT_HEARTBEAT;
> 
> What if the watchdog is not running ?

Configuring wdd->timeout seems redundant, it gets set by the 
watchdog_init_timeout call done later. I just moved that post the check 
for a running watchdog so that the same call is used for both cases.

> 
>>   	wdd->parent = dev;
>>   
>> -	watchdog_init_timeout(wdd, heartbeat, dev);
>> -
>>   	watchdog_set_drvdata(wdd, wdt);
>>   	watchdog_set_nowayout(wdd, 1);
>>   	watchdog_set_restart_priority(wdd, 128);
>> @@ -274,12 +272,34 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   		goto err_iomap;
>>   	}
>>   
>> +	if (readl(wdt->base + RTIDWDCTRL) == WDENABLE_KEY) {
>> +		u32 time_left;
>> +
>> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
>> +		time_left = rti_wdt_get_timeleft(wdd);
>> +		heartbeat = readl(wdt->base + RTIDWDPRLD);
>> +		heartbeat <<= WDT_PRELOAD_SHIFT;
>> +		heartbeat /= wdt->freq;
>> +
> 
> This ignores any heartbeat configured as module parameter, which most
> people will consider unexpected. It might be worthwhile documenting that.

I'll add a dev_warn for this case.

> 
>> +		wsize = readl(wdt->base + RTIWWDSIZECTRL);
>> +		ret = rti_wdt_setup_hw_hb(wdd);
>> +		if (ret)
>> +			goto err_iomap;
>> +
>> +		last_ping = -(time_left - heartbeat) * 1000;
> 
> Why the double negation ?
> 
> 		last_ping = (heartbeat - time_left) * 1000;
> 
> seems simpler. Also, what if heartbeat - time_left is negative for whatever
> reason ?

Will fix. I'll add a dev_warn for that case and assume last ping to be zero.

> 
> I am not sure if it is a good idea to call rti_wdt_get_timeleft()
> here. It might be better to add a helper function such as
> rti_wdt_get_timeleft_ms() to return the time left in milli-seconds
> for improved accuracy.

Will add that.

-Tero

> 
>> +	}
>> +
>> +	watchdog_init_timeout(wdd, heartbeat, dev);
>> +
>>   	ret = watchdog_register_device(wdd);
>>   	if (ret) {
>>   		dev_err(dev, "cannot register watchdog device\n");
>>   		goto err_iomap;
>>   	}
>>   
>> +	if (last_ping)
>> +		watchdog_set_last_hw_keepalive(wdd, last_ping);
>> +
>>   	return 0;
>>   
>>   err_iomap:
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
