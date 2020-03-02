Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E38E175B2B
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 14:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgCBNIM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 08:08:12 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39584 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgCBNIM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 08:08:12 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022D7lwE082763;
        Mon, 2 Mar 2020 07:07:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583154467;
        bh=XdvNWnxA8SrKQANRtLTCePYeA0ge6sf6XJQLJPtUnjY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i4IVnb2PEfhtxec0Y8C4qg7TkmIe0WBTLRDdZtuQjMV+TxUhXbkmsKgEveklcOvWm
         PITvG4wmD/8RmprgWASLo4zh19OyHNxnEn7gBgVaFrefcGPhQ0p0OmyTLMnzkVMeG+
         DGnxp25Cu+1nwjv4sUxtVXdDx3GfA/WH3owHCzck=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022D7l7B048835
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Mar 2020 07:07:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 07:07:47 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 07:07:47 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 022D7jft047445;
        Mon, 2 Mar 2020 07:07:46 -0600
Subject: Re: [PATCH 3/4] watchdog: Add K3 RTI watchdog support
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200228142331.13716-1-t-kristo@ti.com>
 <20200228142331.13716-4-t-kristo@ti.com> <20200228174540.GA3188@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <8e90609e-7edd-031f-90f9-a52e1b79aee1@ti.com>
Date:   Mon, 2 Mar 2020 15:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228174540.GA3188@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/02/2020 19:45, Guenter Roeck wrote:
> On Fri, Feb 28, 2020 at 04:23:30PM +0200, Tero Kristo wrote:
>> Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
>> which can be used as a watchdog. This IP provides a support for
>> windowed watchdog mode, in which the watchdog must be petted within
>> a certain time window. If it is petted either too soon, or too late,
>> a watchdog error will be triggered.
>>
> 
> This needs to be explained in detail in the driver itself. It doesn't
> belong into the commit description.

Ok, I can move that under the calculation logic function of the time window.

> 
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/watchdog/Kconfig   |   8 ++
>>   drivers/watchdog/Makefile  |   1 +
>>   drivers/watchdog/rti_wdt.c | 250 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 259 insertions(+)
>>   create mode 100644 drivers/watchdog/rti_wdt.c
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index cec868f8db3f..81faf47d44a6 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -583,6 +583,14 @@ config DAVINCI_WATCHDOG
>>   	  NOTE: once enabled, this timer cannot be disabled.
>>   	  Say N if you are unsure.
>>   
>> +config K3_RTI_WATCHDOG
>> +	tristate "Texas Instruments K3 RTI watchdog"
>> +	depends on ARCH_K3 || COMPILE_TEST
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here if you want to include support for the K3 watchdog
>> +	  timer (RTI module) available in the K3 generation of processors.
>> +
>>   config ORION_WATCHDOG
>>   	tristate "Orion watchdog"
>>   	depends on ARCH_ORION5X || ARCH_DOVE || MACH_DOVE || ARCH_MVEBU || (COMPILE_TEST && !ARCH_EBSA110)
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index 2ee352bf3372..6de2e4ceef19 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -57,6 +57,7 @@ obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
>>   obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
>>   obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
>>   obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
>> +obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
>>   obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
>>   obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
>>   obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> new file mode 100644
>> index 000000000000..b0933b090f53
>> --- /dev/null
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -0,0 +1,250 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Watchdog driver for the K3 RTI module
>> + *
>> + * (c) Copyright 2019 Texas Instruments Inc.
>> + * All rights reserved.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/types.h>
>> +#include <linux/kernel.h>
>> +#include <linux/watchdog.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/device.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/pm_runtime.h>
> 
> Alphabetic order, please.

Ok.

> 
>> +
>> +#define MODULE_NAME "rti-wdt"
>> +#define DEFAULT_HEARTBEAT 60
>> +#define MAX_HEARTBEAT     1000
>> +
>> +/* Timer register set definition */
>> +#define RTIDWDCTRL	0x90
>> +#define RTIDWDPRLD	0x94
>> +#define RTIWDSTATUS	0x98
>> +#define RTIWDKEY	0x9c
>> +#define RTIDWDCNTR	0xa0
>> +#define RTIWWDRXCTRL	0xa4
>> +#define RTIWWDSIZECTRL	0xa8
>> +
>> +#define RTIWWDRX_NMI	0xa
>> +
>> +#define RTIWWDSIZE_50P	0x50
>> +
>> +#define WDENABLE_KEY	0xa98559da
>> +
>> +#define WDKEY_SEQ0		0xe51a
>> +#define WDKEY_SEQ1		0xa35c
>> +
>> +#define WDT_PRELOAD_SHIFT	13
>> +
>> +#define WDT_PRELOAD_MAX		0xfff
>> +
>> +#define DWDST			BIT(1)
>> +
>> +static int heartbeat;
>> +
>> +/*
>> + * struct to hold data for each WDT device
>> + * @base - base io address of WD device
>> + * @clk - source clock of WDT
>> + * @wdd - hold watchdog device as is in WDT core
>> + */
>> +struct rti_wdt_device {
>> +	void __iomem		*base;
>> +	struct clk		*clk;
>> +	struct watchdog_device	wdd;
>> +};
>> +
>> +static int rti_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	u32 timer_margin;
>> +	unsigned long freq;
>> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +
>> +	freq = clk_get_rate(wdt->clk);
>> +
> Does this change at runtime ? Otherwise it would be less costly to
> get the frequency in the probe function to avoid having to read it
> multiple times.

It should not change, at least I can't see why someone would want to 
change it runtime. It should be a single time configuration only via DT 
property of assigned-clocks. So yeah, I think I can safely move it to probe.

> 
>> +	/* set timeout period */
>> +	timer_margin = (u64)wdd->timeout * freq;
>> +	timer_margin >>= WDT_PRELOAD_SHIFT;
>> +	if (timer_margin > WDT_PRELOAD_MAX)
>> +		timer_margin = WDT_PRELOAD_MAX;
>> +	writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
>> +
> So if freq is 0 (which can happen per code in rti_wdt_get_timeleft),
> the value programmed into the chip will be 0.

Freq should never be 0. I think I should return some error value in case 
it is zero in rti_wdt_get_timeleft.

> 
>> +	/* Set min heartbeat to 1.1x window size */
>> +	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;
> 
> wdd->timeout is in seconds. If we assume it is set to 1 second,
> 
> 	11 * 1 * 1000 / 20 = 550.
> 
> With 10 seconds:
> 	11 * 10 * 1000 / 20 = 5500
> 
> ... meaning the next ping must not be earlier than 55%
> of the timeout. This is highly unusual. Most watchdog daemons
> will send pings earlier.

Hmm so, the comment in code is actually wrong, but the calculations are 
right and they are configured at 55% min timeout. The HW only allows 
configuring the window size down from 50% -> 25% -> 12.5%, etc. but I 
obviously selected the least strict option here which is 50%. The window 
size means the time window during which the watchdog can be serviced. 
Next step above is 100% which would result into a standard watchdog 
functionality, but is not supported by HW. >.<

> This warrants a detailed explanation. The purpose if min_hw_heartbeat_ms
> is to prevent pings to be sent too closely because the HW can not handle
> it otherwise. If that is what is happening here, and if pings indeed
> need to be that far apart for somew reason, it needs to be documented
> in the driver.

Yeah, they need to be that far apart because of HW. Let me try to 
clarify this a bit in the embedded comments for next revision.

> 
> Also, "window size" is a misleading term. This is really 55%
> of the configured timeout.

Yeah, the comment is kinda wrong.

> 
>> +
>> +	/* Generate NMI when wdt expires */
>> +	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>> +
> 
> What is the expected action ? Shouldn't there be an NMI handler ?

The NMI in handled by the safety firmware, typical solution being system 
reboot. Generally, the behavior of the NMI here is not for Linux to 
configure.

> 
>> +	/* Window size 50% */
>> +	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
>> +
> 
> If the minimum ping interval is configurable, it should really be
> set to a _much_ lower value. If that isn't feasible for some reason,
> this reason needs to be explained in detail.

Right, but unfortunately the window can't be configured to anything 
larger as described before.

> 
>> +	readl_relaxed(wdt->base + RTIWWDSIZECTRL);
>> +
>> +	/* enable watchdog */
>> +	writel_relaxed(WDENABLE_KEY, wdt->base + RTIDWDCTRL);
>> +	return 0;
>> +}
>> +
>> +static int rti_wdt_ping(struct watchdog_device *wdd)
>> +{
>> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +
>> +	/* put watchdog in service state */
>> +	writel_relaxed(WDKEY_SEQ0, wdt->base + RTIWDKEY);
>> +	/* put watchdog in active state */
>> +	writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
>> +
>> +	if (readl_relaxed(wdt->base + RTIWDSTATUS))
>> +		WARN_ON_ONCE(1);
> 
> What is the purpose of this warning/traceback, and what is the expected
> reaction ? Some systems are set to reboot on warnings, so this may result
> in a reboot. Unless such a reboot is warranted, I don't see the point of
> forcing that. Have you considered dev_warn_once() instead ?

Actually, if RTIWDSTATUS is nonzero, it will typically reboot the system 
by itself, so we should never see this. Let me ditch this check as it 
doesn't really serve any purpose.

-Tero

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	u64 timer_counter;
>> +	unsigned long freq;
>> +	u32 val;
>> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>> +
>> +	/* if timeout has occurred then return 0 */
>> +	val = readl_relaxed(wdt->base + RTIWDSTATUS);
>> +	if (val & DWDST)
>> +		return 0;
>> +
>> +	freq = clk_get_rate(wdt->clk);
>> +	if (!freq)
>> +		return 0;
>> +
>> +	timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
>> +
>> +	do_div(timer_counter, freq);
>> +
>> +	return timer_counter;
>> +}
>> +
>> +static const struct watchdog_info rti_wdt_info = {
>> +	.options = WDIOF_KEEPALIVEPING,
>> +	.identity = "K3 RTI Watchdog",
>> +};
>> +
>> +static const struct watchdog_ops rti_wdt_ops = {
>> +	.owner		= THIS_MODULE,
>> +	.start		= rti_wdt_start,
>> +	.ping		= rti_wdt_ping,
>> +	.get_timeleft	= rti_wdt_get_timeleft,
>> +};
>> +
>> +static int rti_wdt_probe(struct platform_device *pdev)
>> +{
>> +	int ret = 0;
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *wdt_mem;
>> +	struct watchdog_device *wdd;
>> +	struct rti_wdt_device *wdt;
>> +
>> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>> +	if (!wdt)
>> +		return -ENOMEM;
>> +
>> +	wdt->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(wdt->clk)) {
>> +		if (PTR_ERR(wdt->clk) != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to get clock\n");
>> +		return PTR_ERR(wdt->clk);
>> +	}
>> +
>> +	pm_runtime_enable(dev);
>> +	ret = pm_runtime_get_sync(dev);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "runtime pm failed\n");
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, wdt);
>> +
>> +	wdd = &wdt->wdd;
>> +	wdd->info = &rti_wdt_info;
>> +	wdd->ops = &rti_wdt_ops;
>> +	wdd->min_timeout = 1;
>> +	/* Set min heartbeat to 1.1x window size */
>> +	wdd->min_hw_heartbeat_ms = 11 * DEFAULT_HEARTBEAT * 1000 / 20;
>> +	wdd->max_hw_heartbeat_ms = MAX_HEARTBEAT * 1000;
>> +	wdd->timeout = DEFAULT_HEARTBEAT;
>> +	wdd->parent = dev;
>> +
>> +	set_bit(WDOG_RESET_KEEPALIVE, &wdd->status);
>> +
>> +	watchdog_init_timeout(wdd, heartbeat, dev);
>> +
>> +	watchdog_set_drvdata(wdd, wdt);
>> +	watchdog_set_nowayout(wdd, 1);
>> +	watchdog_set_restart_priority(wdd, 128);
>> +
>> +	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	wdt->base = devm_ioremap_resource(dev, wdt_mem);
>> +	if (IS_ERR(wdt->base)) {
>> +		ret = PTR_ERR(wdt->base);
>> +		goto err_iomap;
>> +	}
>> +
>> +	ret = watchdog_register_device(wdd);
>> +	if (ret) {
>> +		dev_err(dev, "cannot register watchdog device\n");
>> +		goto err_iomap;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_iomap:
>> +	pm_runtime_put_sync(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rti_wdt_remove(struct platform_device *pdev)
>> +{
>> +	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
>> +
>> +	watchdog_unregister_device(&wdt->wdd);
>> +	pm_runtime_put(&pdev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id rti_wdt_of_match[] = {
>> +	{ .compatible = "ti,rti-wdt", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
>> +
>> +static struct platform_driver rti_wdt_driver = {
>> +	.driver = {
>> +		.name = "rti-wdt",
>> +		.of_match_table = rti_wdt_of_match,
>> +	},
>> +	.probe = rti_wdt_probe,
>> +	.remove = rti_wdt_remove,
>> +};
>> +
>> +module_platform_driver(rti_wdt_driver);
>> +
>> +MODULE_AUTHOR("Tero Kristo <t-kristo@ti.com>");
>> +MODULE_DESCRIPTION("K3 RTI Watchdog Driver");
>> +
>> +module_param(heartbeat, int, 0);
>> +MODULE_PARM_DESC(heartbeat,
>> +		 "Watchdog heartbeat period in seconds from 1 to "
>> +		 __MODULE_STRING(MAX_HEARTBEAT) ", default "
>> +		 __MODULE_STRING(DEFAULT_HEARTBEAT));
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:rti-wdt");
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
