Return-Path: <linux-watchdog+bounces-3673-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D3AE0650
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 14:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FD03A539F
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C5E229B29;
	Thu, 19 Jun 2025 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ub4VKt9G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B3241CB2;
	Thu, 19 Jun 2025 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337726; cv=none; b=pee0umvQwZzwRdxZBJs6mT1V0m47HEq9ERkSEsocCbWjb2a21LgJ1DdxU/IGZKYxmcQZcZioQd4s8kI/5M1O2zNpYK/ko503RcB5zWWHFV1Z2aYnb1eLWIMLeHNafYDFEXCxStrW2atkubGDZkzEewL6nNkmqsAaIlUvK/xp4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337726; c=relaxed/simple;
	bh=HBlepKyUXPPwlVC3Ip/XKpNLsfOE0/KgQHYTejUr2hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clmQeUnbb2OjQesf2f1VL5r0lJp3WeKdRz0e+2NfZiMq7oHWMEW4wUuE+IY54d0DZDsZ5O3Ol8gNPB36R6COwJXVD7T4ywNyhFiM1dJ2EIKv/yx0Qhxb/cr7SYK7pU8Kt/4jpDsYjBa/qqhNnBBt72p8Eu64dH4HiF5lkN74XKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ub4VKt9G; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350fc2591dso6074125ad.1;
        Thu, 19 Jun 2025 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750337723; x=1750942523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ6DEd/6ZU3UMccztnocbqjbretatxjikVd6cpt+iJo=;
        b=Ub4VKt9Gn98OWTvW0hTI8v7wtczCmYd39vmxNt3blNiEwLW0wGHAbwoW0f2iIojRXA
         2OfcrGDXQkgzZkvxnlZCoIk+YtzRGq2cmxZiqrKgWC+1F1YzDokkaD/xAYcNHZjjkhd1
         y0XN37v2PTK5/I8HXjXdXQtNmf2mh1uUMEM00KrWTkTxChIhzkxDZQ/s4fTU+6X95Fpl
         8yOzwz+4fmopT7cj9CcIEcSQXQ83iXGalbffPg86F6zkGBhtqBdXMlFbjtkPDBvYsKmk
         Pz/dy+Bc2EASf/naRsD7FEU2zTFC9YHkgm9d7PuZDIM6B1nu1nwX48Z8PRrN27IlvGXe
         WJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750337723; x=1750942523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ6DEd/6ZU3UMccztnocbqjbretatxjikVd6cpt+iJo=;
        b=RHscPUedDqXXTNT9HQTpgqhnwFPfLgiW9kNJP44s6UWmQ9DEhbsMIfqBf3//mfYt0v
         bLyC3hkLuxIe6+jDEX9LVqMIbpuqWGY7LNA4mZNA7990WREbIfsMWlQCv+U05QopY0Gz
         M99RS+dTP2JDm+dOizLJFZ24cfThV+W7dicWt0XBewZzZAtVSvuCBMLVjFAb8dmFUbz/
         fcq/NZQF9zXHxqTIk6TgWJvK4eLCQu2xmmaVIrLm5EuWQnFv0/f6zFwLE0Rtn7lPbTDB
         0Gieaw96Jk14N7pN1I0eIWPRNhbGrpqxCt5iaxUdQMlTUy13icrpyMc2jnYuBBTVGcBC
         GZow==
X-Forwarded-Encrypted: i=1; AJvYcCWsQ064ona9Py1LgKUzd8kKs1/2g2TJPcL75bLJHROVjbyRc7Pz2SDYtHEZCbK7dDJyhcNm9V/vo8G12iQ58NA=@vger.kernel.org, AJvYcCXKfArThll7fnu35SbXcYS+rsOFJSoibqZpXisDmScuV/eass7yaFxXYx3BiA1qe1u1slpHvekC0kajqsg=@vger.kernel.org, AJvYcCXcJCZDPu2oBjkOt7ViUroHlr10V1pTm2z7eNzIzl1jdA5i8F9efpn8x08PCXNEmIyFchS0Sb80Cwc2P14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhhHC96YHv7UA74fMiCCsfeu0c+l2VPkiKZOe7h34GXNJg0FQ6
	NxH6wgHxuWkT9xYo+T37VnHRxuyivFqkDr7GrL461yIICZu1fa/Pb6Ud
X-Gm-Gg: ASbGncv/U1h8AJCl4PaKxfXoB/yuXG7OiuqYFiQ9nKOiPkEV/sukQsoJOw9MQEeFwzq
	YmnS9dViSAnGeXVv1DAeBBSkjENa8TRSSGylc8D+E0EBsVuQOBr04QthLe0j+/OM2/pJBSDKeNn
	ljHT2RdSmk0tUzlvpnm/uf51gcQ6F3+4wRSvnTnZCF0B9L3OS/xMMNkixVgmR27oa1f4i4VkG5p
	fUxBzGPuzhXfOvY38Jn4AD+NXG+y5nHxWAHG05vBlKyV/ItnNgVKkRWk6EmUyFnrElmI/1BJFBJ
	LUEd2JlErlJUlz4cB09fGHfI6/1VbeLCMDdAXe+ODd3xdMXzxTBWZyCTdABPMITkXDcBOaMivyK
	EMIpMBsM2sLusnXJFkjZS1lvU5RW55UK4IEY=
X-Google-Smtp-Source: AGHT+IGS0+VHZ/EcR2HF/jQA27iie/Bh7kT/Uo2py+YkqBJyPAwtsYzokhLPMzDN8BL0gj2YF9KQ1Q==
X-Received: by 2002:a17:902:c944:b0:231:9817:6ec1 with SMTP id d9443c01a7336-237cbf509c6mr51905115ad.17.1750337723482;
        Thu, 19 Jun 2025 05:55:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a190esm118866495ad.69.2025.06.19.05.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:55:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9a575225-f51a-41c3-b886-fb8b220edf22@roeck-us.net>
Date: Thu, 19 Jun 2025 05:55:20 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Robert Lin <robelin@nvidia.com>, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, tglx@linutronix.de, pohsuns@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sumitg@nvidia.com, linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
References: <20250507044311.3751033-1-robelin@nvidia.com>
 <20250507044311.3751033-2-robelin@nvidia.com>
 <5c5ba239-f8e4-43b5-ab58-b3850c57d74b@roeck-us.net>
 <nzuhltjezafyjekctgdazcfayxa2jyk3k2qhfssxfqtmce2nor@sd2s7hvjdpqr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <nzuhltjezafyjekctgdazcfayxa2jyk3k2qhfssxfqtmce2nor@sd2s7hvjdpqr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 03:03, Thierry Reding wrote:
> On Fri, Jun 13, 2025 at 06:24:40AM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Wed, May 07, 2025 at 12:43:09PM +0800, Robert Lin wrote:
>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>
>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>> programs can get the number of seconds before system reset by
>>> the watchdog timer via ioctl.
>>>
>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>> ---
>>>   drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
>>>   1 file changed, 63 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
>>> index ea742889ee06..e3ea6110e6f5 100644
>>> --- a/drivers/clocksource/timer-tegra186.c
>>> +++ b/drivers/clocksource/timer-tegra186.c
>>> @@ -1,8 +1,9 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>>    */
>>>   
>>> +#include <linux/bitfield.h>
>>>   #include <linux/clocksource.h>
>>>   #include <linux/module.h>
>>>   #include <linux/interrupt.h>
>>> @@ -30,6 +31,7 @@
>>>   
>>>   #define TMRSR 0x004
>>>   #define  TMRSR_INTR_CLR BIT(30)
>>> +#define  TMRSR_PCV GENMASK(28, 0)
>>>   
>>>   #define TMRCSSR 0x008
>>>   #define  TMRCSSR_SRC_USEC (0 << 0)
>>> @@ -46,6 +48,9 @@
>>>   #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>>   #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>>   
>>> +#define WDTSR 0x004
>>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>>> +
>>>   #define WDTCMDR 0x008
>>>   #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>>   #define  WDTCMDR_START_COUNTER BIT(0)
>>> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>>>   	return 0;
>>>   }
>>>   
>>> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>>> +{
>>> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>>> +	u32 expiration, val;
>>> +	u64 timeleft;
>>> +
>>> +	if (!watchdog_active(&wdt->base)) {
>>> +		/* return zero if the watchdog timer is not activated. */
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Reset occurs on the fifth expiration of the
>>> +	 * watchdog timer and so when the watchdog timer is configured,
>>> +	 * the actual value programmed into the counter is 1/5 of the
>>> +	 * timeout value. Once the counter reaches 0, expiration count
>>> +	 * will be increased by 1 and the down counter restarts.
>>> +	 * Hence to get the time left before system reset we must
>>> +	 * combine 2 parts:
>>> +	 * 1. value of the current down counter
>>> +	 * 2. (number of counter expirations remaining) * (timeout/5)
>>> +	 */
>>> +
>>> +	/* Get the current number of counter expirations. Should be a
>>> +	 * value between 0 and 4
>>> +	 */
>>> +	val = readl_relaxed(wdt->regs + WDTSR);
>>> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>>> +	if (WARN_ON_ONCE(expiration > 4))
>>> +		return 0;
>>> +
>>> +	/* Get the current counter value in microsecond. */
>>> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
>>> +	timeleft = FIELD_GET(TMRSR_PCV, val);
>>> +
>>> +	/*
>>> +	 * Calculate the time remaining by adding the time for the
>>> +	 * counter value to the time of the counter expirations that
>>> +	 * remain.
>>> +	 */
>>> +	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
>>
>> This results in
>>
>> xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_remove':
>> timer-tegra186.c:(.text+0x350): undefined reference to `__udivdi3'
>> xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
>> timer-tegra186.c:(.text+0x52c): undefined reference to `__udivdi3'
> 
> I'm unable to reproduce this. I wonder if maybe I have a different
> toolchain that doesn't have this issue? Do you have a link so I can try
> to get closer to the setup you have?
> 

I found that the problem is only seen with certain versions of gcc,
and only with certain architectures. I noticed it with gcc 13.3 and
13.4 when building xtensa:allmodconfig images. gcc 14.3 does not have
the problem. I did not try with other versions of gcc or clang.

Guenter


