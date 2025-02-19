Return-Path: <linux-watchdog+bounces-2970-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B26A3B1CB
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 07:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D50B1893433
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 06:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E681B87F8;
	Wed, 19 Feb 2025 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wZT3wI7v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C12AE95;
	Wed, 19 Feb 2025 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739947743; cv=none; b=gbGKVcLtMF27pDcj0+Xbxvth0bP/zooAdt7++2kOfzZ/HxSAcIV1rgI3MA5DNXZgicB04VeFbEz4EjtNigDGKU9XEQbJfenragzNNbSt7EopQQkSxN/aQ54O+9sGf1pWjloAp0sNvkNHqPghQByM5mBIIgbtXIcZMYKEzN0TT3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739947743; c=relaxed/simple;
	bh=XOiJb4SWQIvkOleohe95oWNnBc/qdNGIte6mJHCoDgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/cxRWhWtiKoccOUX/daZBiU7J/Wt8Y7fDdSMO8hTANsPNrtzeZxT9uSL6w5Jxdp5BpcatBF2Q+Gk4mMo7BXOJ7J9ZyA9brMijr+YmFBMKQ16C7+/oGdPNVISnF1IFCqoObcNXGYRnzKWaEjrZ0T0aqBl/jH13nG8e/6XQU5ENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wZT3wI7v; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739947735; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6/jQax5rnvlh2BbJC5kEw9SnvVj7TrlZC5/fP2OvErs=;
	b=wZT3wI7vsFiJhj5v4Ky/1ITBT8n/gjhnuTAmnP+4KAPlMVyyk50iiMKw3xqFbHEFNaBvhI1UFZAVePjsMCEnTRn42+D1jt2M0uqVhIQPgGtdKpcUJzzsdP22/h5+GA8IRjyDls1lV3iLA2N+PNUFQYOpQBw9lSTPXJuezui5Vtc=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPoEUPx_1739947734 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 14:48:54 +0800
Message-ID: <0c5e1e72-f1c9-4ffc-853f-f094a6d7799c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 14:48:53 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
 <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025/2/19 14:07, Guenter Roeck wrote:
> On 2/18/25 19:41, Heyi Guo wrote:
>> Hi Guenter,
>>
>> Thanks for your comments.
>>
>> On 2025/2/18 13:33, Guenter Roeck wrote:
>>> On 2/17/25 19:16, Heyi Guo wrote:
>>>> Aspeed watchdog uses counting down logic, so the value set to register
>>>> should be the value of subtracting pretimeout from total timeout.
>>>>
>>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>>
>>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>>
>>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>>> Cc: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>>>> b/drivers/watchdog/aspeed_wdt.c
>>>> index b4773a6aaf8c..520d8aba12a5 100644
>>>> --- a/drivers/watchdog/aspeed_wdt.c
>>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>>>> watchdog_device *wdd,
>>>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>>       u32 s = wdt->cfg->irq_shift;
>>>>       u32 m = wdt->cfg->irq_mask;
>>>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>>> +
>>>
>>> It is unusual to use a register value here and not the configured 
>>> timeout
>>> value. I would have assumed that pretimeout is compared against 
>>> wdt->timout,
>>> not against the register value, and that the multiplication with 
>>> WDT_RATE_1MHZ
>>> is done after validation. This needs an explanation.
>> It was supposed to be a straight-forward way to check if the 
>> pretimeout value is supported by the hardware. I can change to 
>> wdt->timeout if it is better.
>>
>> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
>> restrict the pretimeout to be larger than wdt->timeout - 
>> max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
>> max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
>> unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
>> (timeout - pretimeout)).
>>
>
> The kernel internal logic should handle that. If not, it needs to be 
> modified/fixed.
Do you mean the watchdog core should also handle the case in which 
pretimeout < wdt->timeout - max_hw_heartbeat_ms  / 2?
>
>>>
>>>> +    if (actual >= reload)
>>>> +        return -EINVAL;
>>>> +
>>>
>>> On top of that, you'll also need to explain why 
>>> watchdog_pretimeout_invalid()
>>> and with it the validation in watchdog_set_pretimeout() does not 
>>> work for this
>>> watchdog and why this extra validation is necessary.
>>
>> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
>> but we can't determine the hardware pretimeout value if timeout == 0 
>> here.
>>
>
> Sorry, I don't understand what you mean. If watchdog_pretimeout_invalid()
> returns false if timeout == 0, aspeed_wdt_set_pretimeout() won't be 
> called.
> Why does that preclude depending on it ?

if timeout == 0, watchdog_pretimeout_invalid() returns false, so the 
code will go on to call wdd->ops->set_pretimeout().

static int watchdog_set_pretimeout(struct watchdog_device *wdd,
                    unsigned int timeout)
{
     int err = 0;

     if (!watchdog_have_pretimeout(wdd))
         return -EOPNOTSUPP;

     if (watchdog_pretimeout_invalid(wdd, timeout))
         return -EINVAL;

     if (wdd->ops->set_pretimeout && (wdd->info->options & 
WDIOF_PRETIMEOUT))
         err = wdd->ops->set_pretimeout(wdd, timeout);

>
> On a side note, I do wonder why the driver accepts a timeout value of 
> 0 seconds.

 From the code, it seems timeout == 0 / pretimeout == 0 will be 
considered as a turn off switch.

Thanks,

Heyi

>
> Guenter

