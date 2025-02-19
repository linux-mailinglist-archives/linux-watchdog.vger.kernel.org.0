Return-Path: <linux-watchdog+bounces-2967-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85ABA3B022
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 04:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6158F189840E
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 03:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665481AA1C9;
	Wed, 19 Feb 2025 03:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e6AGfs0e"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663A1AA1FE;
	Wed, 19 Feb 2025 03:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739936493; cv=none; b=m/Ox0moqtGcUvg0zdM7pE0OIxqxUShXRaWdmm2c803o8+91CjA+onOaewLlMkHcyc0kvcZGj8Cy2WEEz1700f9bLaRCXJbVBYj+xzbIo8wiX83leG20CT2F0io6Yo4gGqWJZwB0MBmxb3qP5KH7uPwC01RZuhgtfkg7ZWPc5VWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739936493; c=relaxed/simple;
	bh=K5Wk5zWfhuZpxBxJbPYOUUEVd9Twy5U2kBxJZXTy+nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoxgxpYEsB44PE4U9hUTqHhIQnpF+8GfrdPb85Lgm1t7KogEptUuW54iPlLYPpLU0J45o1BuDh0nDmTp0vzl57YKJCU0JXOJEOihQTOCmACoUF9/0Y0NPBOLS72J1CKQk/acth4cZKerc+zxYlmOOQ2FjwoewqPeI49pwYSbP3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e6AGfs0e; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739936485; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hIaBkE8+UmoWwYLNXAVzpAMzNdqrJST2j8vQ4BHyKd0=;
	b=e6AGfs0emG8DaqVOAikp9/wZUpEXuZ0Ms4cIiUaL8D88z8WJde1r6DfjqwrAScFyh4JwWGkAIZ5WLTYD8TQ+tqe80vTHP8NU73suzG1vjzNMSjLwWITEZIbZX4eAbXrI+9fmOh1VihLIXZQXoeRbch8cm7REvTF4sW29+o6q8Ag=
Received: from 30.221.144.226(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPnjerv_1739936484 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 11:41:24 +0800
Message-ID: <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Date: Wed, 19 Feb 2025 11:41:23 +0800
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
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guenter,

Thanks for your comments.

On 2025/2/18 13:33, Guenter Roeck wrote:
> On 2/17/25 19:16, Heyi Guo wrote:
>> Aspeed watchdog uses counting down logic, so the value set to register
>> should be the value of subtracting pretimeout from total timeout.
>>
>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>
>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>> Cc: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/aspeed_wdt.c 
>> b/drivers/watchdog/aspeed_wdt.c
>> index b4773a6aaf8c..520d8aba12a5 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct 
>> watchdog_device *wdd,
>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>       u32 s = wdt->cfg->irq_shift;
>>       u32 m = wdt->cfg->irq_mask;
>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>> +
>
> It is unusual to use a register value here and not the configured timeout
> value. I would have assumed that pretimeout is compared against 
> wdt->timout,
> not against the register value, and that the multiplication with 
> WDT_RATE_1MHZ
> is done after validation. This needs an explanation.
It was supposed to be a straight-forward way to check if the pretimeout 
value is supported by the hardware. I can change to wdt->timeout if it 
is better.

Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we 
restrict the pretimeout to be larger than wdt->timeout - 
max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in 
max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered 
unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - 
(timeout - pretimeout)).

>
>> +    if (actual >= reload)
>> +        return -EINVAL;
>> +
>
> On top of that, you'll also need to explain why 
> watchdog_pretimeout_invalid()
> and with it the validation in watchdog_set_pretimeout() does not work 
> for this
> watchdog and why this extra validation is necessary.

watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, 
but we can't determine the hardware pretimeout value if timeout == 0 here.

Thanks,

Heyi

>
> Guenter
>
>> +    /* watchdog timer is counting down */
>> +    actual = reload - actual;
>>         wdd->pretimeout = pretimeout;
>>       wdt->ctrl &= ~m;

