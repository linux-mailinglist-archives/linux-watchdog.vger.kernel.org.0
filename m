Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB6721D653
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 14:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgGMMw6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 08:52:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60232 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbgGMMw6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 08:52:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DCpIP9100103;
        Mon, 13 Jul 2020 07:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594644678;
        bh=pd+R6KmS/qM1zqpB1nAlCXtN4VDcpEEFwticpNfTsP8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=De4YkgWBRBxc2R/8Mz2tabyHfgugAYuR1qaAXwFKHD0eh371/fD7htKQofoTQbYov
         2qmSLvypXpLzO6x2sDOGgZCAS/IlifrDO3fZZZ/sPbX7eM8+qqIURNIMG51NrtrwHs
         +wFsAoHrPDdA+8f9wIbZjsNhJEpFlZ3526b+6ZgM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DCpI5a049578
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 07:51:18 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 07:51:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 07:51:18 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DCpGSK095607;
        Mon, 13 Jul 2020 07:51:16 -0500
Subject: Re: [PATCHv2 3/5] watchdog: rti-wdt: add support for window size
 configuration
To:     Guenter Roeck <linux@roeck-us.net>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
References: <20200703120406.7092-1-t-kristo@ti.com>
 <20200703120406.7092-4-t-kristo@ti.com>
 <74679c9b-eb33-1a95-60f4-49575ee71a34@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7f1fb132-989f-1851-58dd-6daa10341d02@ti.com>
Date:   Mon, 13 Jul 2020 15:51:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <74679c9b-eb33-1a95-60f4-49575ee71a34@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/07/2020 17:49, Guenter Roeck wrote:
> On 7/3/20 5:04 AM, Tero Kristo wrote:
>> RTI watchdog can support different open window sizes. Add support for
>> these and add a new module parameter to configure it. The default open
>> window size for the driver still remains at 50%.
>>
>> Also, modify the margin calculation logic a bit for 32k source clock,
>> instead of adding a margin to every window config, assume the 32k source
>> clock is running slower.

I'll drop this patch mostly in next rev to get rid of the dynamic config 
for window size and always use 50%. I will just read the window size in 
case someone has started the watchdog beforehand.

>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 112 +++++++++++++++++++++++++++++++------
>>   1 file changed, 95 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index d456dd72d99a..110bfc8d0bb3 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -19,7 +19,8 @@
>>   #include <linux/types.h>
>>   #include <linux/watchdog.h>
>>   
>> -#define DEFAULT_HEARTBEAT 60
>> +#define DEFAULT_HEARTBEAT	60
>> +#define DEFAULT_WINDOWSIZE	50
>>   
>>   /* Max heartbeat is calculated at 32kHz source clock */
>>   #define MAX_HEARTBEAT	1000
>> @@ -35,9 +36,13 @@
>>   
>>   #define RTIWWDRX_NMI	0xa
>>   
>> -#define RTIWWDSIZE_50P	0x50
>> +#define RTIWWDSIZE_50P		0x50
>> +#define RTIWWDSIZE_25P		0x500
>> +#define RTIWWDSIZE_12P5		0x5000
>> +#define RTIWWDSIZE_6P25		0x50000
>> +#define RTIWWDSIZE_3P125	0x500000
>>   
>> -#define WDENABLE_KEY	0xa98559da
>> +#define WDENABLE_KEY		0xa98559da
>>   
>>   #define WDKEY_SEQ0		0xe51a
>>   #define WDKEY_SEQ1		0xa35c
>> @@ -48,7 +53,8 @@
>>   
>>   #define DWDST			BIT(1)
>>   
>> -static int heartbeat;
>> +static int heartbeat =		DEFAULT_HEARTBEAT;
>> +static u32 wsize =		DEFAULT_WINDOWSIZE;
>>   
>>   /*
>>    * struct to hold data for each WDT device
>> @@ -62,34 +68,93 @@ struct rti_wdt_device {
>>   	struct watchdog_device	wdd;
>>   };
>>   
>> +static int rti_wdt_convert_wsize(void)
>> +{
>> +	if (wsize >= 50) {
>> +		wsize = RTIWWDSIZE_50P;
>> +	} else if (wsize >= 25) {
>> +		wsize = RTIWWDSIZE_25P;
>> +	} else if (wsize > 12) {
>> +		wsize = RTIWWDSIZE_12P5;
>> +	} else if (wsize > 6) {
>> +		wsize = RTIWWDSIZE_6P25;
>> +	} else if (wsize > 3) {
>> +		wsize = RTIWWDSIZE_3P125;
>> +	} else {
>> +		pr_err("%s: bad windowsize: %d\n", __func__, wsize);
> 
> Please do not use pr_ functions. Pass the watchdog device as argument
> and use dev_err().
> 
> Also, this function modifies the wsize parameter. When called
> again, that parameter will have a  totally different meaning, and
> the second call to this function will always set the window size
> to 50.
> 
> On top of all that, window sizes larger than 50 are set to 50,
> window sizes between 4 and 49 are adjusted, and window sizes <= 3
> are rejected. That is not exactly consistent.
> 
> Does this module parameter really add value / make sense ?
> What is the use case ? We should not add such complexity without
> use case.

I'll ditch the support for this. Just thought that it would be neat 
feature to have this in place because I ended up implementing most of 
this for the attach feature anyways.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rti_wdt_setup_hw_hb(struct watchdog_device *wdd)
>> +{
>> +	/*
>> +	 * RTI only supports a windowed mode, where the watchdog can only
>> +	 * be petted during the open window; not too early or not too late.
>> +	 * The HW configuration options only allow for the open window size
>> +	 * to be 50% or less than that.
>> +	 */
>> +	switch (wsize) {
>> +	case RTIWWDSIZE_50P:
>> +		/* 50% open window => 50% min heartbeat */
>> +		wdd->min_hw_heartbeat_ms = 500 * heartbeat;
>> +		break;
>> +
>> +	case RTIWWDSIZE_25P:
>> +		/* 25% open window => 75% min heartbeat */
>> +		wdd->min_hw_heartbeat_ms = 750 * heartbeat;
>> +		break;
>> +
>> +	case RTIWWDSIZE_12P5:
>> +		/* 12.5% open window => 87.5% min heartbeat */
>> +		wdd->min_hw_heartbeat_ms = 875 * heartbeat;
>> +		break;
>> +
>> +	case RTIWWDSIZE_6P25:
>> +		/* 6.5% open window => 93.5% min heartbeat */
>> +		wdd->min_hw_heartbeat_ms = 935 * heartbeat;
>> +		break;
>> +
>> +	case RTIWWDSIZE_3P125:
>> +		/* 3.125% open window => 96.9% min heartbeat */
>> +		wdd->min_hw_heartbeat_ms = 969 * heartbeat;
>> +		break;
>> +
>> +	default:
>> +		pr_err("%s: Bad watchdog window size!\n", __func__);
> 
> Same here.
> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int rti_wdt_start(struct watchdog_device *wdd)
>>   {
>>   	u32 timer_margin;
>>   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +	int ret;
>>   
>>   	/* set timeout period */
>> -	timer_margin = (u64)wdd->timeout * wdt->freq;
>> +	timer_margin = (u64)heartbeat * wdt->freq;
>>   	timer_margin >>= WDT_PRELOAD_SHIFT;
>>   	if (timer_margin > WDT_PRELOAD_MAX)
>>   		timer_margin = WDT_PRELOAD_MAX;
>>   	writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
>>   
>> -	/*
>> -	 * RTI only supports a windowed mode, where the watchdog can only
>> -	 * be petted during the open window; not too early or not too late.
>> -	 * The HW configuration options only allow for the open window size
>> -	 * to be 50% or less than that; we obviouly want to configure the open
>> -	 * window as large as possible so we select the 50% option. To avoid
>> -	 * any glitches, we accommodate 5% safety margin also, so we setup
>> -	 * the min_hw_hearbeat at 55% of the timeout period.
>> -	 */
>> -	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
>> +	ret = rti_wdt_convert_wsize();
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = rti_wdt_setup_hw_hb(wdd);
>> +	if (ret)
>> +		return ret;
>>   
> 
> This is the wrong place to validate the window size. It should be done
> only once, in the probe function. The start function should not fail
> because of a bad window size.
> 
> With such parameters, the wsize written into the chip should be kept
> in struct rti_wdt_device if it needs to be set more than once.
> The module parameter should not be changed, and it should not be used
> to store the register value. min_hw_heartbeat_ms needs to be set in the
> probe function, not in the start function. Sorry that I didn't notice
> that before.

Yeah, this will be gone.

> 
>>   	/* Generate NMI when wdt expires */
>>   	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>   
>> -	/* Open window size 50%; this is the largest window size available */
>> -	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
>> +	writel_relaxed(wsize, wdt->base + RTIWWDSIZECTRL);
>>   
>>   	readl_relaxed(wdt->base + RTIWWDSIZECTRL);
>>   
>> @@ -169,6 +234,14 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   		return -EINVAL;
>>   	}
>>   
>> +	/*
>> +	 * If watchdog is running at 32k clock, it is not accurate.
>> +	 * Adjust frequency down in this case so that we don't pet
>> +	 * the watchdog too often.
>> +	 */
>> +	if (wdt->freq > 30000 && wdt->freq < 32768)
>> +		wdt->freq = 30000;
>> +
> 
> Combining that with a window size of 96.9% min heartbeat is asking
> for trouble. It will be all but impossible to catch the window with
> such constraints if the frequency is really that inaccurate.

Yeah, I don't think anything else than 50% window size makes any sense. 
Anyways, will drop the support for configuring this runtime.

> 
>>   	pm_runtime_enable(dev);
>>   	ret = pm_runtime_get_sync(dev);
>>   	if (ret) {
>> @@ -251,5 +324,10 @@ MODULE_PARM_DESC(heartbeat,
>>   		 __MODULE_STRING(MAX_HEARTBEAT) ", default "
>>   		 __MODULE_STRING(DEFAULT_HEARTBEAT));
>>   
>> +module_param(wsize, uint, 0);
>> +MODULE_PARM_DESC(wsize,
>> +		 "Watchdog open window size in percentage from 3 to 50, "
>> +		 "default " __MODULE_STRING(DEFAULT_WINDOW_SIZE));
>> +
>>   MODULE_LICENSE("GPL");
>>   MODULE_ALIAS("platform:rti-wdt");
>>
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
