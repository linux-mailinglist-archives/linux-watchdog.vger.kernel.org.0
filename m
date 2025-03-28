Return-Path: <linux-watchdog+bounces-3173-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED048A7510D
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 20:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F141894BFC
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 19:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2A6440C;
	Fri, 28 Mar 2025 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8pDFE/V"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654EB322B;
	Fri, 28 Mar 2025 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743191787; cv=none; b=NEBexiWRXXLLqh+mDysQc9jHDbhyCErVA/MzSnJicy6jmY4PGO1ccJDXsIYkNmVUMuTTZ77coh6mngwCyAJEHdWLZCw5OEzhTb55CkdGlbeP+aMTWN373psAmj6aqm/P7qCNDSuRX7sk9AdCQDRU0oP/8BaX2AGxZIHHKfcejUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743191787; c=relaxed/simple;
	bh=Rdxw3RYPlIhBsqk/bFePuJWHf/HD2K9ciAzkUPXudz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qf7hx7m2tHZcZjlGEkRMqKOcQIUfLg2L/x3Phu3HWsGuKwvAhL9dwYZCISlmIaivl7A8MN6QGDEQe8Uj4e9wyKd3AyY69c7WAsySh6KZxKqEXkkXuts92PVCFEtkohK0eQ1xtOrAZ8teMWFl5LiWCYtiDgV567oSKUxB9nlSN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8pDFE/V; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2239c066347so61602875ad.2;
        Fri, 28 Mar 2025 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743191784; x=1743796584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KOP/xanVPQHf6f9mp50eGkxk8c32sHp36/Z/6ayrq0I=;
        b=G8pDFE/VpECa/Nuf/JO9S+6+uBP1GWL/3ua8p7pXejBMBC0UCOm1WCpGYluzUouSJ4
         B5MYSQcpbXx733JgEJ+cyuYg37Hx+b7oBi1EREygJpaeJULOL5i1o8t8J0Khs1FOZzS5
         Dh0Pwnz5NTr9Bao5dvSvstO60+nPeSuUQKT8L6NuD84lUPlPTbHfy7nUDV2pKkTDb+9C
         Cjmb0MI77oY6WuvnkwYI6pOvvQtfGhF9BQA65WjgUa5TM3LhfrEZQp+veTdDSZ+yuaGB
         ZFuvRsPKK5NB37JF3lpuo11ts1t1LAgQtzEkY2eNEa+3E0/6nZ9NUeYYWXJhm9QLUPOu
         RjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743191784; x=1743796584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOP/xanVPQHf6f9mp50eGkxk8c32sHp36/Z/6ayrq0I=;
        b=BqtVWGhGgFJKBHyuW1O7faXSIKZiSDYu9Pz3I0IHsC064xh3pjr9CbEmtt6TXmSYAv
         UVrhbNohjwQz1R4J/BefMNzAqI+3ftZoSDO2bUJ4P7xsVF+Y7UYJuGwoGvn3aMUgBfXr
         lguphmPobBoNnBL0rKuFaSMSGgzV7YuHwqeDGqotVfkYUi3huiQyv3kAigivBWW/5wVg
         ePJk/gOLd5MENPKGc2hH3aSHOfqMQGukc3F9Uj7CWUFxkM2n+0GhJ+/EPX0c9QPSEZZW
         NXE5aa4iurfoTsuPU/Oh0h9tpx/bWppUmgTzuIWBEkLr9mH6s/bJ0QH6ruTbY/1ZJYNh
         C3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU4ybZWKz4jYatdLFH3aRpf8gkBMOXLoLhWfAQ7oM1tI5sCtCgVAsEWzTgxJB1F1tKyqNOgbk+HeNCxR9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wD8kT4+8Y196aW/DRkjGhLCqV2rPrkn85oYlMdmSeP3t9hrI
	mFRzLdShXrZ1TKylCp4iftR4JYMmQhY31mcZbV8+6IL8oIqwwGN9r6OCtg==
X-Gm-Gg: ASbGncv2b9Xs9enqXDU8o8eVzjU8mmXJdXhH6btrr4svOHb/g8dLgBbXfli1gMpz+9V
	0E3BxipUNrpndfy37ptCeL8IuSYqv3K1RtKvjamTKBVZRzKfPaYK7MX7iDaUfPbV4jbPq+eAO0w
	NvUdawnJVshUwYOicl4QBRmPAx2Ke6C8uAt3RWQ7CSVgYStg6r75ONIX285/kvOEd6IrVTV0Uv5
	WRLFB17o2DrhJgl/8/JS8Ck/EMU8pKAZcV3+8cQvFzngyd0iTQzdzZ6rYLLIEnp9VMcVzhwFF0U
	8imHUnjHYJU9Mx3ycPzkX/qEWSWx5g0qHUXtr2tV8CLMk8Yyw57NBE8k6xH6zle2LsfdM/UZden
	mbKxc08fOKz69ufjmRxEmCJZMDAu9
X-Google-Smtp-Source: AGHT+IGWafCnDGoujUx+p32Jeo3N6r4LZdabKszepx57kJXu2Gb0w8rONST/5+s12wqXzJDo9j9Yxg==
X-Received: by 2002:a17:902:ebc3:b0:21f:45d:21fb with SMTP id d9443c01a7336-2292f946db4mr7471165ad.3.1743191784324;
        Fri, 28 Mar 2025 12:56:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec73f7sm22774665ad.22.2025.03.28.12.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 12:56:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ee20c44-0846-440d-8ae8-8f7e6b8743cf@roeck-us.net>
Date: Fri, 28 Mar 2025 12:56:22 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
 <a7c9715f-b912-49dd-a664-7b5e6017d0fa@roeck-us.net>
 <03f65f72-4727-44c7-90cb-6d251f360c85@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <03f65f72-4727-44c7-90cb-6d251f360c85@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/28/25 12:42, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> thanks for your review
> 
> On 28/03/2025 19:10, Guenter Roeck wrote:
>> On 3/28/25 08:15, Daniel Lezcano wrote:
>>> The S32 platform has several Software Watchdog Timer available and
>>
>> Why "Software" ? This is a hardware watchdog, or am I missing something ?
> 
> I have no idea why it is called 'Software' because it is indeed a hardware watchdog. It is how NXP called it in their technical reference manual.
> 

I guess it is because it resets the software. Please drop the term;
it is misleading.

>>> tied with a CPU. The SWT0 is the only one which directly asserts the
>>> reset line, other SWT require an external setup to configure the reset
>>> behavior which is not part of this change.
>>>
>>> The maximum watchdog value depends on the clock feeding the SWT
>>> counter which is 32bits wide. On the s32g274-rb2, the clock has a rate
>>> of 51MHz which lead to 83 seconds maximum timeout.
>>>
>>> The timeout can be specified via the device tree with the usual
>>> existing bindings 'timeout-sec' or via the module param timeout.
>>>
>>> The watchdog can be loaded with the 'nowayout' option, preventing the
>>> watchdog to be stopped.
>>>
>>> The watchdog can be started at boot time with the 'early-enable'
>>> option, thus letting the watchdog framework to service the watchdog
>>> counter.
>>>
>>> the watchdog support the magic character to stop when the userspace
>>> releases the device.
>>>
>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> ---
> 
> [ ... ]
> 
>>> --- /dev/null
>>> +++ b/drivers/watchdog/s32g_wdt.c
>>> @@ -0,0 +1,362 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Watchdog driver for S32G SoC
>>> + *
>>> + * Copyright (C) 2014 Freescale Semiconductor, Inc.
>>> + * Copyright 2017-2019, 2021-2025 NXP.
>>
>> Does this originate from out-of-tree code ?
>> If so, a reference would be helpful.
> 
> Well, I kept the copyright but this implementation is mostly from scratch.
> 
I am not a copyright expert, but if this isn't derived from some other driver
it should not include old copyrights.

>>> +#include <linux/debugfs.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/moduleparam.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/watchdog.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/io.h>
>>> +#include <linux/of.h>
>>
>> Alphabetic include file order, please.
>>
>>> +
>>> +#define DRIVER_NAME "s32g-wdt"
>>> +
>>> +#define S32G_SWT_CR(__base)    (__base + 0x00)        /* Control Register offset    */
>>
>> checkpatch:
>>      CHECK: Macro argument '__base' may be better as '(__base)' to avoid precedence issues
> 
> I'm not sure to get this one.
> 

#define S32G_SWT_CR(__base)    ((__base) + 0x00)

>>> +#define S32G_SWT_CR_SM        BIT(9) | BIT(10)    /* -> Service Mode        */
>>
>> checkpatch:
>>      ERROR: Macros with complex values should be enclosed in parentheses
>>
>> I am not going to comment on the other issues reported by checkpatch,
>> but I expect them to be fixed in the next version. I would strongly suggest
>> to run "checkpatch o--strict" on the patch and fix what it reports.
> 
> Sure, I will do that, thanks
> 
> [ ... ]
> 
>>> +static void s32g_wdt_debugfs_init(struct device *dev, struct s32g_wdt_device *wdev)
>>> +{
>>> +    struct debugfs_regset32 *regset;
>>> +    static struct dentry *dentry = NULL;
>>> +
>>> +    if (!dentry)
>>> +        dentry = debugfs_create_dir("watchdog", NULL);
>>
>> That is a terribly generic debugfs directory name. That is unacceptable.
>> Pick a name that is driver specific.
> 
> Why is it terrible ? We end up with:
> 
> watchdog/40100000.watchdog
> 
> There are 7 watchdogs on the platform, the directory is there to group them all. It seems to me it is self-explanatory, no ?
> 

It should be something like "s32g/40100000.watchdog". Someone could have some other watchdog
(say, a real software watchdog) in the system and decide to use the top level directory name
for whatever reason. The top level should be something driver specific, not a generic name.

>>> +
>>> +    dentry = debugfs_create_dir(dev_name(dev), dentry);
>>> +
>>
>> Where is this removed if the driver is unloaded ?
> 
> Oh right, I missed it. Thanks for pointing this out.
> 
>> Also, if the driver is built into the kernel, it seems to me that a second
>> instance will create a nested directory. That seems odd.
> 
> No, because there is the test above if (!dentry) which is a static variable.
> 

Yes, and then the second watchdog will create "watchdog/40100000.watchdog/40200000.watchdog"
or similar because dentry is overwritten with the reference to "40100000.watchdog"

Thanks,
Guenter


