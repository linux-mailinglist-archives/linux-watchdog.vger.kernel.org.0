Return-Path: <linux-watchdog+bounces-3562-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39646ABF62C
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 15:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1293A75C6
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 13:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD9827CCDF;
	Wed, 21 May 2025 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz1LfQmF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6227C17F;
	Wed, 21 May 2025 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834395; cv=none; b=Hh8H41oN7etwLbO06H8VcxI3XSbYrPkDokRYKnAIsX4xbNZN//+nkIuKkAplICsQZxc/fU0IXf1aY4AQ/mrTtIssg7QA1HBxymCT2nIyG6oIRmZcj1iV5gsfxmhYnRf/S+38f7eFyIMUR9H/Zrn95DFgVAPgi/AbTB99u6IWefQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834395; c=relaxed/simple;
	bh=C3XhlSQg/irimBSGACZo3nTwrABRi3wUjNmj/bg37js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmP7P14jdS3j3wLvKf3vsamFEBwzaqvPDXqMdjlm+EHIO5MGCWzbUM6bmdDTL286/OPGv8exSqRYo8Hv6fxa5lHYiuUhsua7jHOCKNIQM7fjtD5iHG1FNaoWJo4/QwomT8buRIhmBVvrymD7YBwlpEP31e8ZworaD6EhJ9qD+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz1LfQmF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7370a2d1981so5287362b3a.2;
        Wed, 21 May 2025 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834392; x=1748439192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mPWdoFecdc2MfMc/n7LgSs8D6os+jhSdfWxgej28200=;
        b=Sz1LfQmFd2n12sexUYvNRGGp9MgLI3lWUjNnRXtzj1Gl0kxWIDE+mGEtrpSf7zRNQL
         fdMdwbHTm60wBwNp6yU3FlsiIJJR+EeC1KcEEA2zqGucFBUOHV501VHTb/3PIJogmZ0k
         NBs0ud2rzEDc/FzQdDGAOSP6NPMqe6B6FmCX6KFbp1BGQunEZVRmh1UPhzNR/VNdnXN1
         FuXGED9Hq5S5JpXEljAQLj/FlZiiY7KF0nt71DfHbIspCEDdjEAXBu6oCKEH2B39x7/V
         bHxovRA4opCURmhxv35Bng3E2KpkomyxC31i+kkb8z6rs/TyRbLMJYJli8hr5YJGrXJi
         UuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834392; x=1748439192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPWdoFecdc2MfMc/n7LgSs8D6os+jhSdfWxgej28200=;
        b=ddGSN2DehgRJc5UAPOToDBIO5jmUFCkhrBPriosaNZ5v6yk/qQSOpGVYS+spGdPuq+
         XA5tlwW+oBDk7iuwC15yY8JQ4crcj7QJCbQ/nhWfY8NWiyYUTsDrlLM1NwzYZx/zZwUC
         qZ9aYblX/j6W+cXbFPCnw03UWt2d5jiBeltGuHsMbJivc4K9iV8FM6axMCmjULcSqCaB
         SNmf0t16PUgKJa8KwgTGbBtg7ENKEm/4pIkJcfYL1FzBukWxDazQi4/lPOYYy6CEmqu1
         XOxAM4PuOaCigV7KtwwDGcNDJ+icrnuAN5B6zkNk75mFHP8RmO0D4uuhWeNuTN4eg5xa
         59Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZxUvT7qvIx7MykB0Ba1NdAXn9sd/RPNrfQSSSe+OW3WAoutiMpfP9139msiPIxapBusT0p81/OQ6@vger.kernel.org, AJvYcCUiHlFc6YXYcaHNjAnZkNRA/1wrseVFBD76ewmBZ2IzohWB2TLWR6G/VMWpR5lw3AFkvHr8hRTFyVERiDpa@vger.kernel.org, AJvYcCUq4+nOBeLmN4jtfSeWupDMf0c5/Qp+vBr0eIFP3UqSNoxilBTDIKHlqSLRkiZ0T/cOmJ5lUQqN0Y2Iak8ziiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFdhHy6yP6Ov1h3S0E9rsAITVyrQbEn18fWRXSwbWim+cWw56
	OXL11M1lhuoOTa4oIr3VyJ4eKrr7Vhsp72BIKR8E4GSWzQ366IzDBKQT
X-Gm-Gg: ASbGncugdyHtPlVPnQHUI4Hi9P8gTJlu0KsX9StUBqjx9QCEZVX7L9rB5bwBh8jNc0u
	Hdb9AGWNndnDJkBANRjS6qa+x94sLq/EZjwX/gN9YSpR8d5cZWxFrpndGlDlFjkPAukrFy2nB0G
	4oHldWj0bqOJsUNoye6QIasDA5bMyLagMg/6MFXr4InP0rTSKW3M8q6vMa/892XOzQhZeg3gOD/
	tfFusdKopDnakyOTi8bmaZbpcdTKoMaZLDHt1VJ7/GuLAPK0WGKXysalALSoIaDqa7Fe7DTT6P5
	ibPMddlAHi4o5kpyVIvsPSkC0aVKDIsYkIYO8CtR/a/pPopSS16AsomKOogWTWeTet87v3dB9rK
	AGoUd1wPDKBVlL4dMQj141cF/
X-Google-Smtp-Source: AGHT+IGFkJiaJbqiYwggMHn731DfZj84x94VQNiW1co7LmBgrVQ+jHH2JFGp04j6FK9ukP7//F9AYg==
X-Received: by 2002:a05:6a00:a81:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-742acce29f3mr27233123b3a.13.1747834392168;
        Wed, 21 May 2025 06:33:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e2106sm9875941b3a.17.2025.05.21.06.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:33:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad056ba1-8fce-4735-b71e-f22c22eacc18@roeck-us.net>
Date: Wed, 21 May 2025 06:33:10 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
 <20250521-vt8500-timer-updates-v4-4-2d4306a16ae4@gmail.com>
 <38df2f02-efc4-465b-aa64-4c9e2c1919d8@roeck-us.net>
 <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CABjd4YxZVQSuavEYojc8U4AqwUN3GkweiNNHqn=NDTE70xZm8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/25 23:20, Alexey Charkov wrote:
> On Wed, May 21, 2025 at 3:15 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/20/25 13:01, Alexey Charkov wrote:
>>> VIA/WonderMedia SoCs can use their system timer's first channel as a
>>> watchdog device which will reset the system if the clocksource counter
>>> matches the value given in its match register 0 and if the watchdog
>>> function is enabled.
>>>
>>> Since the watchdog function is tightly coupled to the timer itself, it
>>> is implemented as an auxiliary device of the timer device
>>>
>>> Signed-off-by: Alexey Charkov <alchark@gmail.com>
>>> ---
>>>    MAINTAINERS                   |  1 +
>>>    drivers/watchdog/Kconfig      | 15 ++++++++
>>>    drivers/watchdog/Makefile     |  1 +
>>>    drivers/watchdog/vt8500-wdt.c | 80 +++++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 97 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5362095240627f613638197fda275db6edc16cf7..97d1842625dbdf7fdca3556260662dab469ed091 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3447,6 +3447,7 @@ F:      drivers/tty/serial/vt8500_serial.c
>>>    F:  drivers/video/fbdev/vt8500lcdfb.*
>>>    F:  drivers/video/fbdev/wm8505fb*
>>>    F:  drivers/video/fbdev/wmt_ge_rops.*
>>> +F:   drivers/watchdog/vt8500-wdt.c
>>>    F:  include/linux/vt8500-timer.h
>>>
>>>    ARM/ZYNQ ARCHITECTURE
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 0d8d37f712e8cfb4bf8156853baa13c23a57d6d9..8049ae630301a98123f97f6e3ee868bd3bf1534a 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -2003,6 +2003,21 @@ config PIC32_DMT
>>>          To compile this driver as a loadable module, choose M here.
>>>          The module will be called pic32-dmt.
>>>
>>> +config VT8500_WATCHDOG
>>> +     tristate "VIA/WonderMedia VT8500 watchdog support"
>>> +     depends on ARCH_VT8500 || COMPILE_TEST
>>> +     select WATCHDOG_CORE
>>> +     select AUXILIARY_BUS
>>> +     help
>>> +       VIA/WonderMedia SoCs can use their system timer as a hardware
>>> +       watchdog, as long as the first timer channel is free from other
>>> +       uses and respective function is enabled in its registers. To
>>> +       make use of it, say Y here and ensure that the device tree
>>> +       lists at least two interrupts for the VT8500 timer device.
>>> +
>>> +       To compile this driver as a module, choose M here.
>>> +       The module will be called vt8500-wdt.
>>> +
>>>    # PARISC Architecture
>>>
>>>    # POWERPC Architecture
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index c9482904bf870a085c7fce2a439ac5089b6e6fee..3072786bf226c357102be3734fe6e701f753d45b 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -101,6 +101,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>>>    obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>>>    obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>>>    obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
>>> +obj-$(CONFIG_VT8500_WATCHDOG) += vt8500-wdt.o
>>>
>>>    # X86 (i386 + ia64 + x86_64) Architecture
>>>    obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>>> diff --git a/drivers/watchdog/vt8500-wdt.c b/drivers/watchdog/vt8500-wdt.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..54fe5ad7695de36f6b3c1d28e955f00bef00e9db
>>> --- /dev/null
>>> +++ b/drivers/watchdog/vt8500-wdt.c
>>> @@ -0,0 +1,80 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/* Copyright (C) 2025 Alexey Charkov <alchark@gmail.com */
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/io.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/module.h>
>>> +#include <linux/types.h>
>>> +#include <linux/watchdog.h>
>>> +#include <linux/vt8500-timer.h>
>>> +
>>> +static int vt8500_watchdog_start(struct watchdog_device *wdd)
>>> +{
>>> +     struct vt8500_wdt_info *info = watchdog_get_drvdata(wdd);
>>> +     u64 deadline = info->timer_next(wdd->timeout * VT8500_TIMER_HZ);
>>> +
>>
>> wdd->timeout is the soft timeout, which may be larger
>> than the maximum hardware timeout. That means you'll need
>> to use something like "min(wdd->timeout, U32_MAX / VT8500_TIMER_HZ)
>> * VT8500_TIMER_HZ" as parameter to the timer_next call.
> 
> Indeed. For some reason I thought the core splits up large user
> requested timeout values into at most max_hw_heartbeat_ms long chunks
> and feeds those to the driver via the timeout field, but now I see it
> doesn't.
> 
> Do I get it right that the core worker will try and do its last ping
> of the hardware at exactly max_hw_heartbeat_ms before the user
> specified deadline?
> 

Where do you see that ? In the watchdog core:

         hw_heartbeat_ms = min_not_zero(timeout_ms, wdd->max_hw_heartbeat_ms);
         keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);

>>> +     writel((u32)deadline, info->wdt_match);
>>
>> Can deadline overflow ?
> 
> Yes. The underlying hardware counter is a u32 value incrementing at
> VT8500_TIMER_HZ and continuing past wraparound. This register sets the
> next match value: once the hardware counter reaches the value of
> (u32)deadline (which might be after the counter wrapping around iff
> deadline > U32_MAX) the system resets. Perhaps it warrants a comment
> in code.
> 

Ok. Yes, a comment would help.

Thanks,
Guenter

> Thanks for your review, Guenter!
> 
> Best regards,
> Alexey


