Return-Path: <linux-watchdog+bounces-3874-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BFB07D20
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jul 2025 20:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34B487A572E
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jul 2025 18:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F2B21D5B8;
	Wed, 16 Jul 2025 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H6DkAmrb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A17A84A3E;
	Wed, 16 Jul 2025 18:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691692; cv=none; b=dcCfcpBbH0lee1WsNifTJLOVMH7dWJ+JS2MIZo7n/hmxMNatvXFVrpT2eyQxZGGaA3Rzn+0BUj/9PZo+2MD3vYh9CKyICHCkTy6hHLt7dOj6x/7I035Dik5KMw6EaXD28nwMER3OE7jBZC3Ka+O/hnyFSCuah+lYZW+R99LAaus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691692; c=relaxed/simple;
	bh=8n3WqsdGagN8W0DhZryy0a4hrWcsi0O0hz8Trf27+yI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=WJySMKSX5rKog7RqCVGimOUNeJg4jPdPKX8a/FeSACehyHmw1xuttpinG1TQxazPRtZaJrEExlAYYPjRAyTzoDNDlKFzsqh/cbIcPAbzDEc0hR7MWQUZs1vhKKs/rKcuBKCD2VgBbmMR3OYMG+uxoSjwDKpuocgPcSFnybet/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H6DkAmrb; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GIlX0E305357;
	Wed, 16 Jul 2025 13:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752691653;
	bh=qTEuwqLVvtb64mUYPFpiLTtsuvwj0j87WEm1+Xxkd+I=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=H6DkAmrbZImWtMmL0l7ALuZmwb995zdh4lcoJMgHxQ4X6lH7uGXiFW8Y+xBoE5HZV
	 jSThy56gsvKPiTexmMsfnsBP51twch0KBWdvO9wIhxaN7aJXjBCBr7EK/W7B3Ri4d/
	 j4ALKJ6ckJ8c7OexHKHczYYMHL75JzwgLZnvyB90=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GIlXvV3817913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 13:47:33 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 13:47:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 13:47:33 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GIlXkW919838;
	Wed, 16 Jul 2025 13:47:33 -0500
Message-ID: <fb2cc029-796e-4bc7-a1fa-b43256a86c39@ti.com>
Date: Wed, 16 Jul 2025 13:47:33 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
From: Judith Mendez <jm@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Andrew Davis <afd@ti.com>
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
Content-Language: en-US
In-Reply-To: <299c363a-23c7-4522-b58c-100f49c4eece@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi all,

On 7/10/25 9:08 AM, Judith Mendez wrote:
> Hi Guenter, Andrew,
> 
> On 7/7/25 5:55 PM, Guenter Roeck wrote:
>> On Mon, Jul 07, 2025 at 04:49:31PM -0500, Andrew Davis wrote:
>>> On 7/7/25 3:58 PM, Guenter Roeck wrote:
>>>> On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
>>>>> This allows to configure reaction between NMI and reset for WWD.
>>>>>
>>>>> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
>>>>> to the ESM module which can subsequently route the signal to safety
>>>>> master or SoC reset. On AM62L, the watchdog reset output is routed
>>>>> to the SoC HW reset block. So, add a new compatible for AM62l to add
>>>>> SoC data and configure reaction to reset instead of NMI.
>>>>>
>>>>> [0] https://www.ti.com/product/AM62L
>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>> ---
>>>>>    drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>>>>>    1 file changed, 28 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>>> index d1f9ce4100a8..c9ee443c70af 100644
>>>>> --- a/drivers/watchdog/rti_wdt.c
>>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>>> @@ -35,7 +35,8 @@
>>>>>    #define RTIWWDRXCTRL    0xa4
>>>>>    #define RTIWWDSIZECTRL    0xa8
>>>>> -#define RTIWWDRX_NMI    0xa
>>>>> +#define RTIWWDRXN_RST    0x5
>>>>> +#define RTIWWDRXN_NMI    0xa
>>>>>    #define RTIWWDSIZE_50P        0x50
>>>>>    #define RTIWWDSIZE_25P        0x500
>>>>> @@ -63,22 +64,29 @@
>>>>>    static int heartbeat;
>>>>> +struct rti_wdt_data {
>>>>> +    bool reset;
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * struct to hold data for each WDT device
>>>>>     * @base - base io address of WD device
>>>>>     * @freq - source clock frequency of WDT
>>>>>     * @wdd  - hold watchdog device as is in WDT core
>>>>> + * @data - hold configuration data
>>>>>     */
>>>>>    struct rti_wdt_device {
>>>>>        void __iomem        *base;
>>>>>        unsigned long        freq;
>>>>>        struct watchdog_device    wdd;
>>>>> +    const struct rti_wdt_data *data;
>>>>>    };
>>>>>    static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>    {
>>>>>        u32 timer_margin;
>>>>>        struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>>>> +    u8 reaction;
>>>>>        int ret;
>>>>>        ret = pm_runtime_resume_and_get(wdd->parent);
>>>>> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct 
>>>>> watchdog_device *wdd)
>>>>>         */
>>>>>        wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>>>>> -    /* Generate NMI when wdt expires */
>>>>> -    writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>>>> +    /* Reset device if wdt serviced outside of window or generate 
>>>>> NMI if available */
>>>>
>>>> Shouldn't that be "or generate NMI if _not_ available" ?
>>>>
>>>
>>> For almost all the K3 devices, the WDT has two selectable outputs, 
>>> one resets
>>> the device directly, the other is this "NMI" which is wired to an ESM 
>>> module
>>> which can take other actions (but usually it just also resets the 
>>> device).
>>> For AM62L that second NMI output is not wired (no ESM module), so our 
>>> only
>>> choice is to set the WDT to direct reset mode.
>>>
>>> The wording is a little strange, but the "or generate NMI if 
>>> available" meaning
>>> if NMI is available, then do that. Reset being the fallback when 
>>> _not_ available.
>>>
>>> Maybe this would work better:
>>>
>>> /* If WDT is serviced outside of window, generate NMI if available, 
>>> or reset device */
>>>
>>
>> The problem is that the code doesn't match the comment. The code 
>> checks the
>> "reset" flag and requests a reset if available. If doesn't check an "nmi"
>> flag.
>>
>> If the preference is NMI, as your comment suggests, the flag should be 
>> named
>> "nmi" and be set if NMI is available. That would align the code and the
>> comment. Right now both code and comment are misleading, since the 
>> presence
>> of a reset flag (and setting it to false) suggests that a direct reset is
>> not available, and that reset is preferred if available. A reset is the
>> normally expected behavior for a watchdog, so the fact that this is _not_
>> the case for this watchdog should be made more visible.
> 
> 
> How about:
> 
> 
> /* If WWDT serviced outside of window, generate NMI or reset the device
> if NMI not available */
> 
> if (wdt->data->reset)
>      reaction = RTIWWDRXN_RST;
> else
>      reaction = RTIWWDRXN_NMI;

Since there is no response, I assume no one has an issue with the above
comment, so will respin the series with that change.

~ Judith




