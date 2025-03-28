Return-Path: <linux-watchdog+bounces-3172-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E2A750F5
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 20:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B608A171973
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 19:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEDC440C;
	Fri, 28 Mar 2025 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGQyvVIY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C91E2821
	for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190979; cv=none; b=HmcSXMkDrs1wvGFesFVWl9p0lMD80D6MJsqMlUgwsh1cvmJ4M7cpRIjpcrTJ94SshQ6SBYudvI2EE8ei0nFKQl/BXeTMTUrp6HyZLvZYko6aI/ARf3pAY68B5pcxeeodrickiygg9JO8PgnpfhJ+2bHlCGzK2C0euUsiQhJKgis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190979; c=relaxed/simple;
	bh=7Nstma/QyJOTLkQP6CMCqb15xpuG2APAgK/ZzZOCFz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKepSs9Id7pkD5JmjYxVNR+Y9EvufnZrMaYY0pDfUJ+Y7FSJwauYww9tCdw17vlUMaK/+rZVkG8jikKF4f2Q2hUvq5r54OuJRdknGqsaN32xsWSRddXaJEZmsUXSiZl0oQrv3H7wMVTB9AViAQJp2PYIOt3ArsICL7Qpa44V8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGQyvVIY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399744f74e9so1757258f8f.1
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Mar 2025 12:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743190975; x=1743795775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGPZIH+SORfb56w3DneXQkNE6QvEHzvRmk0/Th5mBUE=;
        b=TGQyvVIYryLNWFGZQBNpw0nu7amyvQfPqpCmbPfdl8WeI6AbOLhRK2+3v9xeoiqPC9
         iHeZn7MyJ1aSLG936pbLfUl5+JP2xbIY0ivLwcwsiUknnk70sUqc3+AusCtnUqOVPrhj
         OBX8KdvZtx4O7DDSNQo3w/2r9BvF5/QNY9XwbNF5VYiSDUBnoxGdiOTAnlE+oQX5aFak
         b55f1AIgUPEt89eRN48JyXw21NfjrKdZTjsBX2LN04k+dHzUNIclCwUF/3MBKto2zPRT
         c45pxbG+NWBLw1kqLd0bZ7A3WZ8zk9N7DfxUBg/xh6GyJc34v2hFb5tr+MYnlq8DMjx1
         Tl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190975; x=1743795775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGPZIH+SORfb56w3DneXQkNE6QvEHzvRmk0/Th5mBUE=;
        b=p2XNCFZnDiEtRMRWG1Rr5QBolww9nQg80hmMESKUSmu3Nu8cqQEmEgDEX9UQqGk6Cx
         UEtUvsafGjm56ADNazKlXGB0VfZv1Dk5BWEpAbe6q9JWboilM6vAV5+qVALzvtWbGCd+
         JQijXH33VIpcKjy8XM/VhXWzIsDZAzq6qdFTofDjJ6zyV8KIzCWmdH17ORm+yjSLpwLf
         OeC7VoECmeS6kKUVmyNdGQm8Z6AV94ttt3B73jPD6RMeuZIb38OIHV5xLRUpNl5txNXQ
         oAU3t1QloEYru6XRqCKgFDMAPNC0TbcQPWLtpu9sILsnGbOCYlsjeS0/nFro2HdKgU1N
         psNA==
X-Gm-Message-State: AOJu0Yw8PQByjRtEgwU/tRWnpGrUDBgUTASzOCZCAFjeZvMm3hRH4720
	ALSsygNGJf58YaqXVEWOObFGWleFmjbdLwvOY6Hy8pUq3G8IdaEpTXZhWRyeL/o=
X-Gm-Gg: ASbGncudmG7KatmhCFgPMoP0mjyOXSwb3EcjhozbK2TQKCG30dIxqXLBfzr4rg/GpF2
	fTAQbp6LASmEdO6hYpv2qlasTa7xzOW4wjkSRdXQDQ+vnQcnfgAGiSjyW5iS9Sut6VFuWuafoLS
	5WZvXrHAKaJBeLNSA0HRCMMdLX/DrkKLhSioP3wchrlsC2NlwbkjJ8pLQkppiY/WtuvpUOiLVzI
	BYfMOpotJfKmMaeN7oONaE561ZiK6GvRIfVs4aRd/ASVTq/tI+GbVGw9zioRwtKHxyPzdRLvR0h
	6twHNkSklERbvRIr5d5DwIFMTFdf8ollOfpZ7z+uxp6UwMy4r4sxuZbr7LgHIQn9DSc0sp7tIl9
	gg+wssTLv
X-Google-Smtp-Source: AGHT+IGwYxowMvQi3jrYDALsf5EWTbXVqrgowY/8/qcxb5RTVXlsrii2XQKX3Yk2A2/4M4G1bKtxwQ==
X-Received: by 2002:a5d:5f85:0:b0:391:39fc:6664 with SMTP id ffacd0b85a97d-39c120c7cb6mr335396f8f.6.1743190974607;
        Fri, 28 Mar 2025 12:42:54 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b663623sm3551473f8f.35.2025.03.28.12.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 12:42:53 -0700 (PDT)
Message-ID: <03f65f72-4727-44c7-90cb-6d251f360c85@linaro.org>
Date: Fri, 28 Mar 2025 20:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Add the Software Watchdog Timer for the NXP
 S32 platform
To: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 S32@nxp.com, Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <20250328151516.2219971-2-daniel.lezcano@linaro.org>
 <a7c9715f-b912-49dd-a664-7b5e6017d0fa@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a7c9715f-b912-49dd-a664-7b5e6017d0fa@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Guenter,

thanks for your review

On 28/03/2025 19:10, Guenter Roeck wrote:
> On 3/28/25 08:15, Daniel Lezcano wrote:
>> The S32 platform has several Software Watchdog Timer available and
> 
> Why "Software" ? This is a hardware watchdog, or am I missing something ?

I have no idea why it is called 'Software' because it is indeed a 
hardware watchdog. It is how NXP called it in their technical reference 
manual.

>> tied with a CPU. The SWT0 is the only one which directly asserts the
>> reset line, other SWT require an external setup to configure the reset
>> behavior which is not part of this change.
>>
>> The maximum watchdog value depends on the clock feeding the SWT
>> counter which is 32bits wide. On the s32g274-rb2, the clock has a rate
>> of 51MHz which lead to 83 seconds maximum timeout.
>>
>> The timeout can be specified via the device tree with the usual
>> existing bindings 'timeout-sec' or via the module param timeout.
>>
>> The watchdog can be loaded with the 'nowayout' option, preventing the
>> watchdog to be stopped.
>>
>> The watchdog can be started at boot time with the 'early-enable'
>> option, thus letting the watchdog framework to service the watchdog
>> counter.
>>
>> the watchdog support the magic character to stop when the userspace
>> releases the device.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---

[ ... ]

>> --- /dev/null
>> +++ b/drivers/watchdog/s32g_wdt.c
>> @@ -0,0 +1,362 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Watchdog driver for S32G SoC
>> + *
>> + * Copyright (C) 2014 Freescale Semiconductor, Inc.
>> + * Copyright 2017-2019, 2021-2025 NXP.
> 
> Does this originate from out-of-tree code ?
> If so, a reference would be helpful.

Well, I kept the copyright but this implementation is mostly from scratch.

>> +#include <linux/debugfs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/watchdog.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
> 
> Alphabetic include file order, please.
> 
>> +
>> +#define DRIVER_NAME "s32g-wdt"
>> +
>> +#define S32G_SWT_CR(__base)    (__base + 0x00)        /* Control 
>> Register offset    */
> 
> checkpatch:
>      CHECK: Macro argument '__base' may be better as '(__base)' to avoid 
> precedence issues

I'm not sure to get this one.

>> +#define S32G_SWT_CR_SM        BIT(9) | BIT(10)    /* -> Service 
>> Mode        */
> 
> checkpatch:
>      ERROR: Macros with complex values should be enclosed in parentheses
> 
> I am not going to comment on the other issues reported by checkpatch,
> but I expect them to be fixed in the next version. I would strongly suggest
> to run "checkpatch o--strict" on the patch and fix what it reports.

Sure, I will do that, thanks

[ ... ]

>> +static void s32g_wdt_debugfs_init(struct device *dev, struct 
>> s32g_wdt_device *wdev)
>> +{
>> +    struct debugfs_regset32 *regset;
>> +    static struct dentry *dentry = NULL;
>> +
>> +    if (!dentry)
>> +        dentry = debugfs_create_dir("watchdog", NULL);
> 
> That is a terribly generic debugfs directory name. That is unacceptable.
> Pick a name that is driver specific.

Why is it terrible ? We end up with:

watchdog/40100000.watchdog

There are 7 watchdogs on the platform, the directory is there to group 
them all. It seems to me it is self-explanatory, no ?

>> +
>> +    dentry = debugfs_create_dir(dev_name(dev), dentry);
>> +
> 
> Where is this removed if the driver is unloaded ?

Oh right, I missed it. Thanks for pointing this out.

> Also, if the driver is built into the kernel, it seems to me that a second
> instance will create a nested directory. That seems odd.

No, because there is the test above if (!dentry) which is a static variable.

[ ... ]

>> +static int s32g_wdt_set_timeout(struct watchdog_device *wdog, 
>> unsigned int timeout)
>> +{
>> +    struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
>> +
>> +    __raw_writel(wdog_sec_to_count(wdev, timeout), S32G_SWT_TO(wdev- 
>> >base));
>> +
>> +    /*
>> +     * Conforming to the documentation, the timeout counter is
>> +     * loaded when servicing is operated or when the counter is
>> +     * enabled. In case the watchdog is already started it must be
>> +     * stopped and started again to update the timeout
>> +     * register. Here we choose to service the watchdog for
>> +     * simpler code.
>> +     */
>> +    return s32g_wdt_ping(wdog);
> 
> Either check if the watchdog is running, or add a note explaining that a 
> ping
> on a stopped watchdog does not have adverse effect.

Ok, I think the comment is unclear. I'll provide a clarified version 
based on the documentation.

>> +}
>> +
>> +static unsigned int s32g_wdt_get_timeleft(struct watchdog_device *wdog)
>> +{
>> +    struct s32g_wdt_device *wdev = wdd_to_s32g_wdt(wdog);
>> +    unsigned long val, counter;
>> +
>> +    /*
>> +     * The counter output can be read only if the SWT is
>> +     * disabled. Given the latency between the internal counter
>> +     * and the counter output update, there can be very small
>> +     * difference. However, we can accept this matter of fact
>> +     * given the resolution is a second based unit for the output.
>> +     */
>> +    val = __raw_readl(S32G_SWT_CR(wdev->base));
>> +
>> +    if (test_bit(S32G_SWT_CR_WEN, &val))
>> +        s32g_wdt_stop(wdog);
> 
> The watchdog core provides wdt_is_running() which would avoid the
> extra i/o access.

Ok, thanks for the suggestion

>> +
>> +    counter = __raw_readl(S32G_SWT_CO(wdev->base));
>> +
>> +    if (test_bit(S32G_SWT_CR_WEN, &val))
>> +        s32g_wdt_start(wdog);
>> +
>> +    return counter / wdev->rate;
>> +}
>> +
>> +static const struct watchdog_ops s32g_wdt_ops = {
>> +    .owner        = THIS_MODULE,
>> +    .start        = s32g_wdt_start,
>> +    .stop        = s32g_wdt_stop,
>> +    .ping        = s32g_wdt_ping,
>> +    .set_timeout    = s32g_wdt_set_timeout,
>> +    .get_timeleft    = s32g_wdt_get_timeleft,
>> +};
>> +
>> +static void s32g_wdt_init(struct s32g_wdt_device *wdev)
>> +{
>> +    unsigned long val;
>> +
>> +    /* Set the watchdog's Time-Out value */
>> +    val = wdog_sec_to_count(wdev, wdev->wdog.timeout);
>> +
>> +    __raw_writel(val, S32G_SWT_TO(wdev->base));
>> +
>> +    /*
>> +     * Get the control register content. We are at init time, the
>> +     * watchdog should not be started.
>> +     */
>> +    val = __raw_readl(S32G_SWT_CR(wdev->base));
>> +
>> +    /*
>> +     * We want to allow the watchdog timer to be stopped when
>> +     * device enters debug mode.
>> +     */
>> +    val |= S32G_SWT_CR_FRZ;
>> +
>> +    /*
>> +     * However, when the CPU is in WFI or suspend mode, the
>> +     * watchdog must continue. The documentation refers it as the
>> +     * stopped mode.
>> +     */
>> +    val &= ~S32G_SWT_CR_STP;
>> +
>> +    /*
>> +     * Use Fixed Service Sequence to ping the watchdog which is
>> +     * 0x00 configuration value for the service mode. It should be
>> +     * already set because it is the default value but we reset it
>> +     * in case.
>> +     */
>> +    val &= ~S32G_SWT_CR_SM;
>> +
>> +    __raw_writel(val, S32G_SWT_CR(wdev->base));
>> +
>> +    /*
>> +     * The watchdog must be started when the module is loaded,
>> +     * leading to getting ride of the userspace control. The
> 
> ride ? And why does it _have_ to be started when the module is loaded ?

The comment is misleading. I meant when the 'early_enable' option is 
set, then the watchdog must be started.

>> +     * watchdog framework will handle the pings. It is especially
>> +     * handy for kernel development.
>> +     */
>> +    if (early_enable) {
>> +        s32g_wdt_start(&wdev->wdog);
>> +        set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
>> +    }
>> +}
>> +

[ ... ]

Thanks

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

