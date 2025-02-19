Return-Path: <linux-watchdog+bounces-2969-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFBA3B169
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 07:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9FF1652DA
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 06:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06961ACEC2;
	Wed, 19 Feb 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWozbGTP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EC192D7E;
	Wed, 19 Feb 2025 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739945241; cv=none; b=aSqIrrWa+8q2bHA58fsDWwITwQD9+psmCUr6JjSKAQolq7jXGnVt19cJY/NcVw3XgkjMKETSTf8Zr3gOFyI0e6SMAy8msKRX6Q7KmvbxiagUK3B0MbfgzWHafbZPewcGH3TQlOBx93xzJcllrV2Z/Z4XL9oTpvofKZbqx8lQyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739945241; c=relaxed/simple;
	bh=q0h8Q3fNWvJDp86rsPqMbTmuFjuXqpZUUaXNQvigolA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOkIjHI5mOXDSfeyae3PhZp15NPeFpIKLHovIqRAE2o8v3otY5M/ZCP2X3vwIS3sw5OUpWyUEOR7IRMHK7A+3+24H5V7r8ZaczpeViE7mB+V54gpys/3qPCEv2flEpS6ZYQNbE6cgnC0IQZRvTkDcDAx41Pb+UOA7yTIQzeGsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWozbGTP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f2339dcfdso8000595ad.1;
        Tue, 18 Feb 2025 22:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739945239; x=1740550039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MMweWeNSzeI1MWtj+pEFAXNqqqyma+C3FI/z06gKBZ4=;
        b=OWozbGTPeNvt+4+kGro+vulo4TIRD13V2EJDT5T9ez7qUJ//WZyGvl6OApOAfIeo1o
         fUKosPyaVNHep7dNn1ntqyY0K/yQDIxWXylop3tNRKgmJ7vW9/l3o73f3CPV7tluS8Me
         3I7x7JqywKdITMHYq6HHz5/Nr8vTAJrDoNYSkDE+6+yhVtHswhNoMr3n6Xk8zaVgTA5g
         zvvDnDv+aYWdFdNpgdWhOLfnxXcuX0y0SNI/CVvmUKjv/bc4B5xulomM86HYogCydrQY
         qVIsFNaCwbKGdzj4xPLSjb3vsAPrTV5T4Axa8kZrbJTthlOGIGEZXrMbHAoyv1OKBUQg
         f9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739945239; x=1740550039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMweWeNSzeI1MWtj+pEFAXNqqqyma+C3FI/z06gKBZ4=;
        b=X1WHAPx0ccR21r7pUaKR2wbHY8Ws49xWHJM/lZ2xLvoqCgfE9uqebf1qyzbJ3iqHGT
         ccOjaB6OR8iLcX2df8WN16U55MI1mTWtqZaXbDglgPFcxT+aogKFmLzW6eDLD0muH1vM
         6WAE7h0rtJLqWlQQsO5OCOYluZri5pxaAbVnHGkdLxDXsN3nIJFDF+u4Y13Zlj7tils3
         GcDuKljTGXGoLpD2SzCqSeCSbxS8A3JW0RU+YOmn7o98JZUgxdVNAEN4w//+JLJe78UR
         0cT6/yN6/0BB5LkVL/2jaIRsClxnx8ghNzasyhY1insvHuUl6DCOcLs1CdgNHBKA+Wxw
         0YCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQGYjueBGkWLKZoirmifnMGKOVKhWbFYI/7EqZFEiP5Xd93eOUjVGyIwUjctBXoDWUrWCy9p6G/1tKpP6ERx4=@vger.kernel.org, AJvYcCWIcKPr28dcGMGjRfMHDPKd90Toj60syUjHN2P3tRbfQmOHx0oaFVqWVisUHT52aGNTcl+U07BtA85xZOwe@vger.kernel.org, AJvYcCXRrQFuqFP3DcDk+L8cGWRQ5dSI8zwv/6NlDUf4GUVjKSwu0rUI866aKIxVO3bJJXjjQ6sKrfoGLriu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yMaG6jO32b08wc/lTqEMmOUd6p0zSyCtnYcsjxRLcmFm42pi
	ukbwtbpqd37/4z/nKySkMKXmwXuiDCshc7JeDjiS7mcxMY2Wxs9CjMbNYg==
X-Gm-Gg: ASbGncu50wdxFCfq1PHC7TJc2xLF2u1FoDPNPabOa8mfLLAY22gwJ0GQvaz0uAcpB4J
	2Eacy+MZi20VSLxyjgr/IAzu1GPJVNErsKo5+T37zDtg0tQaqoIy0vAS76Et5NeAsBOqdp8Di0r
	sORJ5Qu3g/4Wi2VY0Lomf1xMLEH6Kj/2hka7l+nMkbde7kB1w8LXM+62lEJGxoo0kOEcYPySib/
	b9FFurNA4cTTgfnbrHLrh2n0Ar4KomWi/aNhHy13Fy9Fnpdggs2IgCvioMbGJxVYeCg11ENVDqR
	4YjOpigUJGiXW8LuYpy4HUeM9v3HEeQ8IjBvMXhwJWAME92P76D9XirQzIrLTl3N
X-Google-Smtp-Source: AGHT+IFDDkfL+/p8rzt9E4xU1vtBKwXwGcdJQ1cGVlgttlla+I+hR4jexAvPi61qQULzGxFmQbFgbg==
X-Received: by 2002:a17:902:fc8f:b0:221:751f:cfbe with SMTP id d9443c01a7336-221751fd1f5mr30886355ad.19.1739945239041;
        Tue, 18 Feb 2025 22:07:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349226sm98602605ad.24.2025.02.18.22.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 22:07:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e692263e-a390-4611-b629-2b9feca1883a@roeck-us.net>
Date: Tue, 18 Feb 2025 22:07:16 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <5a33f86d-d82c-4685-8da7-5e623487a40c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/18/25 19:41, Heyi Guo wrote:
> Hi Guenter,
> 
> Thanks for your comments.
> 
> On 2025/2/18 13:33, Guenter Roeck wrote:
>> On 2/17/25 19:16, Heyi Guo wrote:
>>> Aspeed watchdog uses counting down logic, so the value set to register
>>> should be the value of subtracting pretimeout from total timeout.
>>>
>>> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
>>>
>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Joel Stanley <joel@jms.id.au>
>>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>>> Cc: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..520d8aba12a5 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>>>       u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>       u32 s = wdt->cfg->irq_shift;
>>>       u32 m = wdt->cfg->irq_mask;
>>> +    u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>> +
>>
>> It is unusual to use a register value here and not the configured timeout
>> value. I would have assumed that pretimeout is compared against wdt->timout,
>> not against the register value, and that the multiplication with WDT_RATE_1MHZ
>> is done after validation. This needs an explanation.
> It was supposed to be a straight-forward way to check if the pretimeout value is supported by the hardware. I can change to wdt->timeout if it is better.
> 
> Further, in the case of wdt->timeout > max_hw_heartbeat_ms, shall we restrict the pretimeout to be larger than wdt->timeout - max_hw_heartbeat_ms  / 2? For the watchdog_kworker works in max_hw_heartbeat_ms  / 2 interval, pretimeout event may be triggered unexpected when watchdog is not pinged in (max_hw_heartbeat_ms - (timeout - pretimeout)).
> 

The kernel internal logic should handle that. If not, it needs to be modified/fixed.

>>
>>> +    if (actual >= reload)
>>> +        return -EINVAL;
>>> +
>>
>> On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
>> and with it the validation in watchdog_set_pretimeout() does not work for this
>> watchdog and why this extra validation is necessary.
> 
> watchdog_pretimeout_invalid() will return false if wdt->timeout == 0, but we can't determine the hardware pretimeout value if timeout == 0 here.
> 

Sorry, I don't understand what you mean. If watchdog_pretimeout_invalid()
returns false if timeout == 0, aspeed_wdt_set_pretimeout() won't be called.
Why does that preclude depending on it ?

On a side note, I do wonder why the driver accepts a timeout value of 0 seconds.

Guenter


