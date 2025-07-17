Return-Path: <linux-watchdog+bounces-3883-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38DB0957F
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 22:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD72174071
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 20:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F24E224892;
	Thu, 17 Jul 2025 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C2NLJF2g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352D1DE4E1;
	Thu, 17 Jul 2025 20:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752783043; cv=none; b=Ko5LwT8UqHmSi8Lmmnl0Qg32xGYEJKPU92/iDQ5dTwKtSw5DoF/D3nlsnPGPN/lfCVRIXlms72wz0EmHpMI924jtIp/CAHLbzKy3H5N3ovjyg9Vw57WRTmA6ZiVI4I6Dvq9eJwsai6S5MtTBAQkkW0//dLEpgHRlPk6pyarwjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752783043; c=relaxed/simple;
	bh=yxbEKm3kaDuHVnicyiV1PpDl4IEnn1IFYSQCTLLBIZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JpoZvzU8XoBEgSHqW0YMVaTXD7oq+BHWxWrqEPoAHwrURFLYG93amD4DRw7CoQLAmckMnKancS2lFWktU9/I+9S9Lx4Fy/4u0QmIcIgsu0E/M8kOFRVNX3WF+PsfBeGW5PrP2mHzfwerx5g9TgrFE2r6i9SmbJSu+b4I4tqumXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C2NLJF2g; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HKAF18554130;
	Thu, 17 Jul 2025 15:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752783015;
	bh=Xl5CvRJMkvPrwF5sIZsDzwi9Q/UTJFP/8yg3QmmeaV8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=C2NLJF2gd4XPOSz4EEWQvPqzCNCP2vvKSBASO8gh9t//qVg11bdHglpyuJ6dbHnlR
	 mARXC0FFfD652EbrTlThi2Ztbk1I9w1s2ckMz8HXshdJzkn9d3IbjTzLRZnjJynAEu
	 +kmJmckZOFpYJm9dlP4vVSNWBI7xzlxR0tbs084s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HKAFDx3008894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 15:10:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 15:10:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 15:10:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HKAEHR2718676;
	Thu, 17 Jul 2025 15:10:14 -0500
Message-ID: <c89718cd-63b8-459b-a543-204b175f2108@ti.com>
Date: Thu, 17 Jul 2025 15:10:14 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
To: Judith Mendez <jm@ti.com>, Guenter Roeck <linux@roeck-us.net>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250707180002.3918865-1-jm@ti.com>
 <20250707180002.3918865-3-jm@ti.com>
 <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
 <d96541bc-644d-4c90-b9f7-1e4afd16aeb6@ti.com>
 <953f78a8-3928-479d-8700-dfe1cea15454@roeck-us.net>
 <299c363a-23c7-4522-b58c-100f49c4eece@ti.com>
 <7d2bb793-14d0-45d8-b8bd-b770cdb4ca70@roeck-us.net>
 <fc095373-1171-4718-b492-8a74d03f99ba@ti.com>
 <92be34eb-2408-4273-9e37-bec0b0d68f10@ti.com>
 <4826def7-5dcb-4453-ab3b-0d14880dab93@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4826def7-5dcb-4453-ab3b-0d14880dab93@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/17/25 12:51 PM, Judith Mendez wrote:
> Hi Andrew,
> 
> On 7/17/25 11:44 AM, Andrew Davis wrote:
>> On 7/17/25 10:24 AM, Judith Mendez wrote:
>>> Hi Guenter,
>>>
>>> On 7/16/25 1:50 PM, Guenter Roeck wrote:
>>>> On 7/10/25 07:08, Judith Mendez wrote:
>>>>> Hi Guenter, Andrew,
>>>>>
>>>>> On 7/7/25 5:55 PM, Guenter Roeck wrote:
>>>>>> On Mon, Jul 07, 2025 at 04:49:31PM -0500, Andrew Davis wrote:
>>>>>>> On 7/7/25 3:58 PM, Guenter Roeck wrote:
>>>>>>>> On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
>>>>>>>>> This allows to configure reaction between NMI and reset for WWD.
>>>>>>>>>
>>>>>>>>> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
>>>>>>>>> to the ESM module which can subsequently route the signal to safety
>>>>>>>>> master or SoC reset. On AM62L, the watchdog reset output is routed
>>>>>>>>> to the SoC HW reset block. So, add a new compatible for AM62l to add
>>>>>>>>> SoC data and configure reaction to reset instead of NMI.
>>>>>>>>>
>>>>>>>>> [0] https://www.ti.com/product/AM62L
>>>>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>>>>>>>>>    1 file changed, 28 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>>>>>>> index d1f9ce4100a8..c9ee443c70af 100644
>>>>>>>>> --- a/drivers/watchdog/rti_wdt.c
>>>>>>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>>>>>>> @@ -35,7 +35,8 @@
>>>>>>>>>    #define RTIWWDRXCTRL    0xa4
>>>>>>>>>    #define RTIWWDSIZECTRL    0xa8
>>>>>>>>> -#define RTIWWDRX_NMI    0xa
>>>>>>>>> +#define RTIWWDRXN_RST    0x5
>>>>>>>>> +#define RTIWWDRXN_NMI    0xa
>>>>>>>>>    #define RTIWWDSIZE_50P        0x50
>>>>>>>>>    #define RTIWWDSIZE_25P        0x500
>>>>>>>>> @@ -63,22 +64,29 @@
>>>>>>>>>    static int heartbeat;
>>>>>>>>> +struct rti_wdt_data {
>>>>>>>>> +    bool reset;
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>>    /*
>>>>>>>>>     * struct to hold data for each WDT device
>>>>>>>>>     * @base - base io address of WD device
>>>>>>>>>     * @freq - source clock frequency of WDT
>>>>>>>>>     * @wdd  - hold watchdog device as is in WDT core
>>>>>>>>> + * @data - hold configuration data
>>>>>>>>>     */
>>>>>>>>>    struct rti_wdt_device {
>>>>>>>>>        void __iomem        *base;
>>>>>>>>>        unsigned long        freq;
>>>>>>>>>        struct watchdog_device    wdd;
>>>>>>>>> +    const struct rti_wdt_data *data;
>>>>>>>>>    };
>>>>>>>>>    static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>>>>>    {
>>>>>>>>>        u32 timer_margin;
>>>>>>>>>        struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>>>>>>>> +    u8 reaction;
>>>>>>>>>        int ret;
>>>>>>>>>        ret = pm_runtime_resume_and_get(wdd->parent);
>>>>>>>>> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>>>>>         */
>>>>>>>>>        wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>>>>>>>>> -    /* Generate NMI when wdt expires */
>>>>>>>>> -    writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>>>>>>>> +    /* Reset device if wdt serviced outside of window or generate NMI if available */
>>>>>>>>
>>>>>>>> Shouldn't that be "or generate NMI if _not_ available" ?
>>>>>>>>
>>>>>>>
>>>>>>> For almost all the K3 devices, the WDT has two selectable outputs, one resets
>>>>>>> the device directly, the other is this "NMI" which is wired to an ESM module
>>>>>>> which can take other actions (but usually it just also resets the device).
>>>>>>> For AM62L that second NMI output is not wired (no ESM module), so our only
>>>>>>> choice is to set the WDT to direct reset mode.
>>>>>>>
>>>>>>> The wording is a little strange, but the "or generate NMI if available" meaning
>>>>>>> if NMI is available, then do that. Reset being the fallback when _not_ available.
>>>>>>>
>>>>>>> Maybe this would work better:
>>>>>>>
>>>>>>> /* If WDT is serviced outside of window, generate NMI if available, or reset device */
>>>>>>>
>>>>>>
>>>>>> The problem is that the code doesn't match the comment. The code checks the
>>>>>> "reset" flag and requests a reset if available. If doesn't check an "nmi"
>>>>>> flag.
>>>>>>
>>>>>> If the preference is NMI, as your comment suggests, the flag should be named
>>>>>> "nmi" and be set if NMI is available. That would align the code and the
>>>>>> comment. Right now both code and comment are misleading, since the presence
>>>>>> of a reset flag (and setting it to false) suggests that a direct reset is
>>>>>> not available, and that reset is preferred if available. A reset is the
>>>>>> normally expected behavior for a watchdog, so the fact that this is _not_
>>>>>> the case for this watchdog should be made more visible.
>>>>>
>>>>>
>>>>> How about:
>>>>>
>>>>>
>>>>> /* If WWDT serviced outside of window, generate NMI or reset the device
>>>>> if NMI not available */
>>>>>
>>>>> if (wdt->data->reset)
>>>>>      reaction = RTIWWDRXN_RST;
>>>>> else
>>>>>      reaction = RTIWWDRXN_NMI;
>>>>>
>>>>
>>>> As I have said before, the problem is the "reset" flag. Its name suggests that
>>>> it means "reset is available". That is not what it actually means. It means
>>>> "NMI is not available". So I suggested to rename it to "nmi" or maybe "no_nmi".
>>>> Please educate me - why is that such a problem to name the flag to match its
>>>> meaning ?
>>>
>>> wdt->data->reset makes more sense because it shows there is a
>>> physical line routed to the MAIN RESET HW LOGIC:
>>>
>>>  >> if (wdt->data->reset)
>>>  >>      reaction = RTIWWDRXN_RST;
>>>  >> else
>>>  >>      reaction = RTIWWDRXN_NMI;
>>>
>>> If there is a direct reset line to MAIN RESET HW logic, then the
>>> reaction should be reset, if there is no reset line, then generate
>>> and NMI to ESM.
>>>
>>
>> There is a reset line on all K3 devices, if you did it this way then
>> all devices would have wdt->data->reset set to true and you wouldn't
>> need this logic at all. The thing that changes is if NMI/ESM is
>> available or not, so as Guenter suggests the flag should be called
>> "nmi" or similar and you switch on that.
> 
> Looking at the integration spec, I do not see a direct reset line for
> any device besides am62l, could you confirm that what I am reading
> is correct please?
> 

I'm not even finding the direct reset line for AM62L, some of these
datasheets are lacking the reset routing.

Anyway, one thing I did notice in these datasheets is that the
default value for the RTIWWDRXCTRL register is 0x5 (send reset).
So even if these other devices do not wire the reset we are still
changing the default by setting the register to 0xa (NMI), so the
point would still stand. Setting the value to NMI is a change from
the default and so should be codded that way: have a NMI flag, set
to true for all devices that have it, leave false for AM62L.

Andrew

