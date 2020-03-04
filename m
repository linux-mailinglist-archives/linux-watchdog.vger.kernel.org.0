Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F4A178D55
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2020 10:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387396AbgCDJXs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Mar 2020 04:23:48 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42582 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgCDJXs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Mar 2020 04:23:48 -0500
Received: by mail-pg1-f194.google.com with SMTP id h8so700903pgs.9;
        Wed, 04 Mar 2020 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kCFxJfUYhWSlHScD0b8Ytgms54iq7TrDb4qmTym5rpc=;
        b=EKlgyIPG5qe+6Tj4H3NPk5ThNDqYti3OdkgbMrHt6IGu7+KThw6C2Fo3SfCNSJPD9h
         RQeWDetI75ViPiSw7x38051k9y/+ci7YhyOfiwXJS4083oxHa9+1eyfhw+bnFxhpoPxf
         rpyR808meomZ1bp8YYMI9XpM3lg87WMPyxqcXQ2yp84SbxPNFCIXxT8jtRiUVq/94peF
         FD0gZmIL86lC4ERWKzGkQVVYyjBsX2J9xM31xm9ZDetR85MDxtfAnAXi3cpPWXm3GHg+
         VR3fbhuxeBjs1n4t/75qAmrOUxdT3cPDROeSfRExt7vzJah5lN/FJ8U2iL1oUeYYRRXs
         7XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kCFxJfUYhWSlHScD0b8Ytgms54iq7TrDb4qmTym5rpc=;
        b=FvDBfBXeqRAaBerTDw3oxKyORr2ewmIFpEApEyxijU1ccRj+Qvy/KtqMFW5S6ZsSAT
         5QKo3udklhcNsE1t/VaMugxZ5wwo4xzA1cNp1z9tHFAyM+bAxaF+4wKGtNLe7Q/79EZO
         2slRTJAzaDDa+2tnihHkEmPaBsXeXbyljxrQpHPeznSdnesBF1QoUJIZsIZNyjUpxbZd
         1578JIhlCaKKKTIYuj/Pv0R8hIJhpTuaSRFfCX9LEJx5SOqTzvoZ7RFCEyaGHEr4g0py
         HL0bE24vv4z50OxBd5qHEYCoDO8STPuGgaFgvIW4XmblZUkD+BHp+29eF3OOq4Oseju3
         MnKQ==
X-Gm-Message-State: ANhLgQ28aEFUupdEZQ5QlUVG2xkJkxcLHpFfPQhGGoW+sqnWo5GOzaBi
        78b+tSupwB9/9gOLwAJJgX1LxKma
X-Google-Smtp-Source: ADFU+vscRcAyMwnqSxpJsCi0zWNio4ifacpUPS/zRw2Vjth2TCUjKPpj+ZOwp4PXAN4dJtSOV4WvEw==
X-Received: by 2002:a63:7e49:: with SMTP id o9mr1843354pgn.80.1583313826216;
        Wed, 04 Mar 2020 01:23:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21sm28778153pfp.0.2020.03.04.01.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 01:23:45 -0800 (PST)
Subject: Re: [PATCHv2 3/4] watchdog: Add K3 RTI watchdog support
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200302200426.6492-1-t-kristo@ti.com>
 <20200302200426.6492-4-t-kristo@ti.com> <20200303211822.GB28733@roeck-us.net>
 <f167de86-6c76-0e4e-6c61-6e7ca989101d@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <aed89814-a78b-4a59-7673-bce5de34022d@roeck-us.net>
Date:   Wed, 4 Mar 2020 01:23:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f167de86-6c76-0e4e-6c61-6e7ca989101d@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/3/20 10:57 PM, Tero Kristo wrote:
> On 03/03/2020 23:18, Guenter Roeck wrote:
>> On Mon, Mar 02, 2020 at 10:04:25PM +0200, Tero Kristo wrote:
>>> Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
>>> which can be used as a watchdog. This IP provides a support for
>>> windowed watchdog mode, in which the watchdog must be petted within
>>> a certain time window. If it is petted either too soon, or too late,
>>> a watchdog error will be triggered.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>> v2:
>>>    * Added better documentation within the driver code
>>>    * Dropped fck handle, instead get the fck rate during probe only
>>>    * Modified the max_hw_heartbeat calculation logic a bit
>>>
>>>   drivers/watchdog/Kconfig   |   8 ++
>>>   drivers/watchdog/Makefile  |   1 +
>>>   drivers/watchdog/rti_wdt.c | 254 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 261 insertions(+)
>>>   create mode 100644 drivers/watchdog/rti_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index cec868f8db3f..81faf47d44a6 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -583,6 +583,14 @@ config DAVINCI_WATCHDOG
>>>         NOTE: once enabled, this timer cannot be disabled.
>>>         Say N if you are unsure.
>>>   +config K3_RTI_WATCHDOG
>>> +    tristate "Texas Instruments K3 RTI watchdog"
>>> +    depends on ARCH_K3 || COMPILE_TEST
>>> +    select WATCHDOG_CORE
>>> +    help
>>> +      Say Y here if you want to include support for the K3 watchdog
>>> +      timer (RTI module) available in the K3 generation of processors.
>>> +
>>>   config ORION_WATCHDOG
>>>       tristate "Orion watchdog"
>>>       depends on ARCH_ORION5X || ARCH_DOVE || MACH_DOVE || ARCH_MVEBU || (COMPILE_TEST && !ARCH_EBSA110)
>>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>>> index 2ee352bf3372..6de2e4ceef19 100644
>>> --- a/drivers/watchdog/Makefile
>>> +++ b/drivers/watchdog/Makefile
>>> @@ -57,6 +57,7 @@ obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
>>>   obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
>>>   obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
>>>   obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
>>> +obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
>>>   obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
>>>   obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
>>>   obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>> new file mode 100644
>>> index 000000000000..7a46c40891e2
>>> --- /dev/null
>>> +++ b/drivers/watchdog/rti_wdt.c
>>> @@ -0,0 +1,254 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Watchdog driver for the K3 RTI module
>>> + *
>>> + * (c) Copyright 2019-2020 Texas Instruments Inc.
>>> + * All rights reserved.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/moduleparam.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/types.h>
>>> +#include <linux/watchdog.h>
>>> +
>>> +#define DEFAULT_HEARTBEAT 60
>>> +
>>> +/* Max heartbeat is calculated at 32kHz source clock */
>>> +#define MAX_HEARTBEAT    1000
>>> +
>>> +/* Timer register set definition */
>>> +#define RTIDWDCTRL    0x90
>>> +#define RTIDWDPRLD    0x94
>>> +#define RTIWDSTATUS    0x98
>>> +#define RTIWDKEY    0x9c
>>> +#define RTIDWDCNTR    0xa0
>>> +#define RTIWWDRXCTRL    0xa4
>>> +#define RTIWWDSIZECTRL    0xa8
>>> +
>>> +#define RTIWWDRX_NMI    0xa
>>> +
>>> +#define RTIWWDSIZE_50P    0x50
>>> +
>>> +#define WDENABLE_KEY    0xa98559da
>>> +
>>> +#define WDKEY_SEQ0        0xe51a
>>> +#define WDKEY_SEQ1        0xa35c
>>> +
>>> +#define WDT_PRELOAD_SHIFT    13
>>> +
>>> +#define WDT_PRELOAD_MAX        0xfff
>>> +
>>> +#define DWDST            BIT(1)
>>> +
>>> +static int heartbeat;
>>> +
>>> +/*
>>> + * struct to hold data for each WDT device
>>> + * @base - base io address of WD device
>>> + * @freq - source clock frequency of WDT
>>> + * @wdd  - hold watchdog device as is in WDT core
>>> + */
>>> +struct rti_wdt_device {
>>> +    void __iomem        *base;
>>> +    unsigned long        freq;
>>> +    struct watchdog_device    wdd;
>>> +};
>>> +
>>> +static int rti_wdt_start(struct watchdog_device *wdd)
>>> +{
>>> +    u32 timer_margin;
>>> +    struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +    /* set timeout period */
>>> +    timer_margin = (u64)wdd->timeout * wdt->freq;
>>> +    timer_margin >>= WDT_PRELOAD_SHIFT;
>>> +    if (timer_margin > WDT_PRELOAD_MAX)
>>> +        timer_margin = WDT_PRELOAD_MAX;
>>> +    writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
>>> +
>>> +    /*
>>> +     * RTI only supports a windowed mode, where the watchdog can only
>>> +     * be petted during the open window; not too early or not too late.
>>> +     * The HW configuration options only allow for the open window size
>>> +     * to be 50% or less than that; we obviouly want to configure the open
>>> +     * window as large as possible so we select the 50% option. To avoid
>>> +     * any glitches, we accommodate 5% safety margin also, so we setup
>>> +     * the min_hw_hearbeat at 55% of the timeout period.
>>> +     */
>>> +    wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
>>> +
>>> +    /* Generate NMI when wdt expires */
>>> +    writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>> +
>>> +    /* Open window size 50%; this is the largest window size available */
>>> +    writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
>>> +
>>> +    readl_relaxed(wdt->base + RTIWWDSIZECTRL);
>>> +
>>> +    /* enable watchdog */
>>> +    writel_relaxed(WDENABLE_KEY, wdt->base + RTIDWDCTRL);
>>> +    return 0;
>>> +}
>>> +
>>> +static int rti_wdt_ping(struct watchdog_device *wdd)
>>> +{
>>> +    struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +    /* put watchdog in service state */
>>> +    writel_relaxed(WDKEY_SEQ0, wdt->base + RTIWDKEY);
>>> +    /* put watchdog in active state */
>>> +    writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>>> +{
>>> +    u64 timer_counter;
>>> +    u32 val;
>>> +    struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +    /* if timeout has occurred then return 0 */
>>> +    val = readl_relaxed(wdt->base + RTIWDSTATUS);
>>> +    if (val & DWDST)
>>> +        return 0;
>>> +
>>> +    timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
>>> +
>>> +    do_div(timer_counter, wdt->freq);
>>> +
>>> +    return timer_counter;
>>> +}
>>> +
>>> +static const struct watchdog_info rti_wdt_info = {
>>> +    .options = WDIOF_KEEPALIVEPING,
>>> +    .identity = "K3 RTI Watchdog",
>>> +};
>>> +
>>> +static const struct watchdog_ops rti_wdt_ops = {
>>> +    .owner        = THIS_MODULE,
>>> +    .start        = rti_wdt_start,
>>> +    .ping        = rti_wdt_ping,
>>> +    .get_timeleft    = rti_wdt_get_timeleft,
>>> +};
>>> +
>>> +static int rti_wdt_probe(struct platform_device *pdev)
>>> +{
>>> +    int ret = 0;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct resource *wdt_mem;
>>> +    struct watchdog_device *wdd;
>>> +    struct rti_wdt_device *wdt;
>>> +    struct clk *clk;
>>> +
>>> +    wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>>> +    if (!wdt)
>>> +        return -ENOMEM;
>>> +
>>> +    clk = devm_clk_get(dev, NULL);
>>> +    if (IS_ERR(clk)) {
>>> +        if (PTR_ERR(clk) != -EPROBE_DEFER)
>>> +            dev_err(dev, "failed to get clock\n");
>>> +        return PTR_ERR(clk);
>>> +    }
>>> +
>>> +    wdt->freq = clk_get_rate(clk);
>>> +    if (!wdt->freq) {
>>> +        dev_err(dev, "Failed to get fck rate.\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    devm_clk_put(dev, clk);
>>> +
>> Are you sure about this ? Doesn't this mean that the clock may be stopped ?
>> Normally the reason for using devm_ functions during probe is that release
>> functions are called automatically when the device is removed. Calling
>> the release function dorectly is unusual and most of the time wrong.
> 
> clk_get / clk_put does not enable / disable a clock by itself, this is just used to fetch a clock handle. But you are right, we are never calling clk_enable on it either, because at least the 32kHz clock we are interested in is of type always-on and can never be disabled.
> 
> I can keep the clock handle and call enable/disable on it in the probe/remove if you think that would be neater.
> 

If it isn't needed to be held, you should use clk_get / clk_put,
and not the devm_ functions.

Guenter
