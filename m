Return-Path: <linux-watchdog+bounces-2966-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7BA3AF0B
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 02:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D763AB44E
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 01:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B041119A;
	Wed, 19 Feb 2025 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh9fb6Jf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D514F70;
	Wed, 19 Feb 2025 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739929232; cv=none; b=fnNsQVc/nVhs/cbUQadjllG9NeCzPZ53BRpUw7GoT5m2vHlQ3Cd33OVtowMTpUVQbzatCpVo1WBHNNFhtBIlnVkEmAISciT62HsWSaSiJaFsC7XcFKaBLnWHqjXXfNR6lydSM/fRQKX/yjyQCKMJ7rTkjaezwjIg7zIbfurScQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739929232; c=relaxed/simple;
	bh=/s3nFWsMkvQgMKDrmWgK6F+Ayg6ZWIKST5v4xPH8gn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGxNy4UnaF/z9/XRqdkzv6MGPHW9pizrD2VTMfMKWF0LnFaVuO/r7/1V6ZeyN26xJeWySViaw99tWMheUM+koF21Q1yb9TC24YIQwd7tiQGhZvOnt1DZLiUjZr10IaVTXpCdG6gUGC63x88PVczCJz1j/K2f+s4oFiK0Bzop7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh9fb6Jf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so9045325a91.2;
        Tue, 18 Feb 2025 17:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739929229; x=1740534029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UveaDOK1GELu+JWXk2Wn8uWWsbK7toAJuHOoB5mqWeM=;
        b=Gh9fb6JfWD00Q/De69uytv5+UaPmS8y6Nj/hvY3sgz1hqvvSd1scWTmHQO0kRTsy0t
         nt3hhZRS2TfAOogXrxf2WiYDlgOOwcJqCTdwYUb8SXpbpXu9giFOAeK7h6esdDty7mWT
         bup/wFvkIQvFhlwriRT7OD7H2QJril+bRQjyuOCjtI7EjoZnoek2Y1APXANLEVzVnGrz
         o+varpykqaDLZao2v1Mqij8b1pg1/J0RViRckAolvYYSyCcioE8SWXzQ93VbH49hpcCy
         pTDRpCaEA0vTH1GcKLdOhq2GL7SjERceoPB+/TZMQblhsSIIWZFXarxW2+GkO+6a+LsU
         snXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739929229; x=1740534029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UveaDOK1GELu+JWXk2Wn8uWWsbK7toAJuHOoB5mqWeM=;
        b=j6c519dBH32xnC5nI6doi0UwUIEcY3DIqc9g3p99dawCe94uI0i2JDOnkmvDkV471P
         l/6UdmSWUV0OzP8oWAAiSQkC5O4rE8D1QhPI8Hxj3Qsm1KjP2BNw7hfkkmsB6mQ3LTL4
         VjZT3XS57P82Pxvk8nxFsUnzzhNyWN54lAtHGtCEM2S7PpM0eeBSRKJJ6A4M6Pok8Uiq
         rHMlLCl2jiY8tdj4qdORf/tUT9ONImcTJ1TFueHA6HL9mS8vBpaq3x7JreQvI2UqADlt
         3OiMS8bOxTyENenMnwAw+zNZqBgc7koa5TvXfVoUfZk7DU5ue3ccdXF/kDQKxjGV6umB
         +Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RezOsEKkDbaNJlMIqGCog4U+rSlz2rOhZZcttIl1a5ppxmM/lBhCmczgKkuGG4oj747tcQeSku5U@vger.kernel.org, AJvYcCV+ITWWpox1UG7OlHKipGuIx5Cx9Ke2/wvkDdECX5lQ2fLWfYyqDs8QwnS0abVhgCf+vM8KQeDQ4VtSGPra@vger.kernel.org, AJvYcCVl6j7nr07Q+qbP+Ysr+ZI3nTT+JzgMGdAzFdsXZd88NYbk/l7eptDxhk7zz/CvSumjlCx2UM3769DSvSMASsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAt+hWknYquGSnah+o46LTCQH3L2FfJ6XjvC7hRtaebeAWah+E
	Ze/kSOfDIu6C0YBMDmJlnu3AA7jrKtuYT2A+u4EXwg0D84VpuBom
X-Gm-Gg: ASbGnctcYnFb4O891pWIkIOgMv3qpqoSo1aMdarxtINYACFhZJjc6KBjau25qqcvH+Q
	IB8+d+iHuPEJQMfe7b0KDQcJ0YalEhPitddS+P50CcAXUNsLprYECzEvMXBfVZxGo3ElYwoipTR
	+i7bv/aT6JAW+gauureXJ1KIEMGOAIQ0wt3JI8+NOzsZSA3j/Ize4ELboodFOhN8yrmsdf09mBh
	WslnOa05j6HqthWhSgPvHMIe7bKiqr4xCwTYZnmCha6/l02NiboVZvCb1u2ngWCDWegJYsUaW2g
	L6aHT8+hg7ZNDHvcC111e6DFmQVu9U7eY9v28PaFPSMNFk7EDIuoaaAarE05VHSg
X-Google-Smtp-Source: AGHT+IE9UaJ2QOQPOJ5Simaetziy6vDR63wBY+ghsuug1DdKfXWz5pR7HZxMGQ22Oo1JEfoCMZTqug==
X-Received: by 2002:a17:90b:3b92:b0:2ee:d024:e4e2 with SMTP id 98e67ed59e1d1-2fc40d14ddfmr26976340a91.7.1739929229359;
        Tue, 18 Feb 2025 17:40:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm13031848a91.1.2025.02.18.17.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 17:40:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4602bffc-55b0-4a0a-9c36-ac391904d974@roeck-us.net>
Date: Tue, 18 Feb 2025 17:40:23 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down
 logic
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Heyi Guo <guoheyi@linux.alibaba.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Eddie James <eajames@linux.ibm.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
 <50ab5a0a-b807-4bd7-bda8-7c6f4bfc76fc@roeck-us.net>
 <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <201b57c00043e2c3590c77a4d1aba413aa576b01.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/18/25 17:25, Andrew Jeffery wrote:
> On Mon, 2025-02-17 at 21:33 -0800, Guenter Roeck wrote:
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
>>>    drivers/watchdog/aspeed_wdt.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
>>> index b4773a6aaf8c..520d8aba12a5 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
>>>          u32 actual = pretimeout * WDT_RATE_1MHZ;
>>>          u32 s = wdt->cfg->irq_shift;
>>>          u32 m = wdt->cfg->irq_mask;
>>> +       u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
>>> +
>>
>> It is unusual to use a register value here and not the configured timeout
>> value. I would have assumed that pretimeout is compared against wdt->timout,
>> not against the register value, and that the multiplication with WDT_RATE_1MHZ
>> is done after validation. This needs an explanation.
> 
> +1
> 
>>
>>> +       if (actual >= reload)
>>> +               return -EINVAL;
>>> +
>>
>> On top of that, you'll also need to explain why watchdog_pretimeout_invalid()
>> and with it the validation in watchdog_set_pretimeout() does not work for this
>> watchdog and why this extra validation is necessary.
> 
> +1 as well.
> 
> Further, the logic looks broken regardless for the AST2400 where
> there's no pretimeout support. aspeed_wdt_set_pretimeout() should error
> out if wdt->cfg->irq_mask is 0.
> 

It should not register as supporting pretimeout in the first place.

Guenter



