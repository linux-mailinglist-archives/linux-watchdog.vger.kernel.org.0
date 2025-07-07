Return-Path: <linux-watchdog+bounces-3838-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC584AFBDD8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 23:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA6763BCCFA
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 21:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91B826AA83;
	Mon,  7 Jul 2025 21:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xY6sMe1g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FC1BF37;
	Mon,  7 Jul 2025 21:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924993; cv=none; b=DGF/8OHrjE/QeS5SbSpIoN+OeIV305nGJrRxfbf0xLeKjS01iveXF3qgck15BRvIZigbGMoeGaaIc53vw2ZOt2ZUur5gZjlvQfXpPiANHRf29mQZbZHnzbaXN1yhHsF0sRPojnt+pGILmcDwFJWMytcP06PKzGnrlcToawVfpyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924993; c=relaxed/simple;
	bh=r+6EUeEEM/s8iop2K6aqbJ8hvw9uqmA/aoIE7Z8P7ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uLwnW4qGaSkvsttfUwMFy0uj+8pu/clYR28JJ9iPMFrVWIJP9pM2myu8SbvwRiJLy+JSFWVqIRjH44UWVD1qrvtJa9UwgaawsaG/I1k6dXocMkqFf55KS0Ud6NaVzJwOBSO+PuakhCcTrIKBJCZI6KobcqW2XaasNdSBP4CDBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xY6sMe1g; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567LnWqT336148;
	Mon, 7 Jul 2025 16:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751924972;
	bh=E0hv/a6j5Sw4rDSIJ3jS5BUea7b4HlsuY8H4vac5zms=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xY6sMe1gsQCZ2IARMYyelUB39bjO8oep/elubYioaflZ/Ux75KkKnnm3rRX6wmwGh
	 87rd7Sg52Le6TqtmJHTyM8/zwGckJ6woPM+iyljmo+6z3lhuWDNbJXD2nkpN6r6L+2
	 xSPP5Ra8PIrvMfB52iSy6S/KlrW/tcY9YDNZCX0s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567LnWGW1769944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 16:49:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 16:49:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 16:49:32 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567LnVmI924814;
	Mon, 7 Jul 2025 16:49:31 -0500
Message-ID: <d96541bc-644d-4c90-b9f7-1e4afd16aeb6@ti.com>
Date: Mon, 7 Jul 2025 16:49:31 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
To: Guenter Roeck <linux@roeck-us.net>, Judith Mendez <jm@ti.com>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250707180002.3918865-1-jm@ti.com>
 <20250707180002.3918865-3-jm@ti.com>
 <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/7/25 3:58 PM, Guenter Roeck wrote:
> On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
>> This allows to configure reaction between NMI and reset for WWD.
>>
>> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
>> to the ESM module which can subsequently route the signal to safety
>> master or SoC reset. On AM62L, the watchdog reset output is routed
>> to the SoC HW reset block. So, add a new compatible for AM62l to add
>> SoC data and configure reaction to reset instead of NMI.
>>
>> [0] https://www.ti.com/product/AM62L
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>>   1 file changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index d1f9ce4100a8..c9ee443c70af 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -35,7 +35,8 @@
>>   #define RTIWWDRXCTRL	0xa4
>>   #define RTIWWDSIZECTRL	0xa8
>>   
>> -#define RTIWWDRX_NMI	0xa
>> +#define RTIWWDRXN_RST	0x5
>> +#define RTIWWDRXN_NMI	0xa
>>   
>>   #define RTIWWDSIZE_50P		0x50
>>   #define RTIWWDSIZE_25P		0x500
>> @@ -63,22 +64,29 @@
>>   
>>   static int heartbeat;
>>   
>> +struct rti_wdt_data {
>> +	bool reset;
>> +};
>> +
>>   /*
>>    * struct to hold data for each WDT device
>>    * @base - base io address of WD device
>>    * @freq - source clock frequency of WDT
>>    * @wdd  - hold watchdog device as is in WDT core
>> + * @data - hold configuration data
>>    */
>>   struct rti_wdt_device {
>>   	void __iomem		*base;
>>   	unsigned long		freq;
>>   	struct watchdog_device	wdd;
>> +	const struct rti_wdt_data *data;
>>   };
>>   
>>   static int rti_wdt_start(struct watchdog_device *wdd)
>>   {
>>   	u32 timer_margin;
>>   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +	u8 reaction;
>>   	int ret;
>>   
>>   	ret = pm_runtime_resume_and_get(wdd->parent);
>> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>>   	 */
>>   	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>>   
>> -	/* Generate NMI when wdt expires */
>> -	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>> +	/* Reset device if wdt serviced outside of window or generate NMI if available */
> 
> Shouldn't that be "or generate NMI if _not_ available" ?
> 

For almost all the K3 devices, the WDT has two selectable outputs, one resets
the device directly, the other is this "NMI" which is wired to an ESM module
which can take other actions (but usually it just also resets the device).
For AM62L that second NMI output is not wired (no ESM module), so our only
choice is to set the WDT to direct reset mode.

The wording is a little strange, but the "or generate NMI if available" meaning
if NMI is available, then do that. Reset being the fallback when _not_ available.

Maybe this would work better:

/* If WDT is serviced outside of window, generate NMI if available, or reset device */

Andrew

> Guenter
> 
>> +	if (wdt->data->reset)
>> +		reaction = RTIWWDRXN_RST;
>> +	else
>> +		reaction = RTIWWDRXN_NMI;
>> +
>> +	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
>>   
>>   	/* Open window size 50%; this is the largest window size available */
>>   	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
>> @@ -255,6 +268,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   	wdd->timeout = DEFAULT_HEARTBEAT;
>>   	wdd->parent = dev;
>>   
>> +	wdt->data = device_get_match_data(dev);
>> +
>>   	watchdog_set_drvdata(wdd, wdt);
>>   	watchdog_set_nowayout(wdd, 1);
>>   	watchdog_set_restart_priority(wdd, 128);
>> @@ -369,8 +384,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
>>   	pm_runtime_disable(&pdev->dev);
>>   }
>>   
>> +static struct rti_wdt_data j7_wdt = {
>> +	.reset = false,
>> +};
>> +
>> +static struct rti_wdt_data am62l_wdt = {
>> +	.reset = true,
>> +};
>> +
>>   static const struct of_device_id rti_wdt_of_match[] = {
>> -	{ .compatible = "ti,j7-rti-wdt", },
>> +	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
>> +	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
>> -- 
>> 2.49.0
>>

