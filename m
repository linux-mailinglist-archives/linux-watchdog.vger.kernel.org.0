Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A365173EC1
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2020 18:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgB1Rpo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Feb 2020 12:45:44 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:56306 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1Rpn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Feb 2020 12:45:43 -0500
Received: by mail-pj1-f68.google.com with SMTP id a18so1574898pjs.5;
        Fri, 28 Feb 2020 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u8US2yE8eWTDjqymQ6OJk5qxVw00HDOGJ6DGx3UrO5k=;
        b=eUuwGSfpy7u45Jjn/nRmGAAF96ytlknicu6h2rdh4PO/PeCy3ns91ZWH9PDzA6mB9b
         2YJLbYvOtVuyD6fnucjZPBi43ziU2q6+owA7KAMjI9vtWN9XKaIETlvKd7sgg8itVoWG
         br+Y47yzQlTPOnYX8ANd3QbIlUOYf2Z1mauq0TbczKECpdhxKM/uheuLbwT2mGl+ekRK
         sJxL9g7LivMsmZ9vlFkhBSAe8xkaw1JlbDMS5aFzWvs0Gs0f/SPtY5xb40z4uH3djeST
         lxJFSQGXs1VBWkH7/tNYcXljPfp+72pReTcIXzeBinL7fLdSeBecR+vWqQnKaL7DuySd
         Ezcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=u8US2yE8eWTDjqymQ6OJk5qxVw00HDOGJ6DGx3UrO5k=;
        b=QWECH6YU+2Pfnp0wA1vK8zsiAI9EB6oKqhlibLgHTAn0cI3fU+Bl0mu7BTP+md8A3u
         Xu2qF2wx78fmqDhxZHJtnzBSbstlZIitpKEg6jsn9Sl/mi1rF3uKFs0ac02skJ/kU3ly
         hQm9jS3nMUvEc6D/7+6IO7K4rdONOmlaw9Woe25ry2PQ2ivoxsjo5bJGeuEpLTzzzfzP
         n7eghmyyBoZtmm4QU+ozzGgNuN/o/Gfz4KkJQzQ+04mpFOxqmo5hP43lZVj7aZoC4xoZ
         NJ7LfJTRR/1M3I385IsVggaN0TQbzdgb0nmQUrW1jHzk9T66qRU8H3jNkXljVotRS+Nf
         1Prw==
X-Gm-Message-State: APjAAAUBlg+NdC4E5SQgfJyWdW5L9ITNoT1ZZsrWWvu6HNaintx29VhF
        1aGQb0og9jHzRb6UbLUd2TieaDjL
X-Google-Smtp-Source: APXvYqzQOjWZ8WOZ4GUSHLZ8shtNhoNpkgqRwHAbi8TupLcsXeUEobTXG8U9R3vpnRjrbYwkNFeE8A==
X-Received: by 2002:a17:902:9b8b:: with SMTP id y11mr5219115plp.189.1582911942564;
        Fri, 28 Feb 2020 09:45:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b10sm2911605pjo.32.2020.02.28.09.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 09:45:41 -0800 (PST)
Date:   Fri, 28 Feb 2020 09:45:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] watchdog: Add K3 RTI watchdog support
Message-ID: <20200228174540.GA3188@roeck-us.net>
References: <20200228142331.13716-1-t-kristo@ti.com>
 <20200228142331.13716-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228142331.13716-4-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 28, 2020 at 04:23:30PM +0200, Tero Kristo wrote:
> Texas Instruments K3 SoCs contain an RTI (Real Time Interrupt) module
> which can be used as a watchdog. This IP provides a support for
> windowed watchdog mode, in which the watchdog must be petted within
> a certain time window. If it is petted either too soon, or too late,
> a watchdog error will be triggered.
> 

This needs to be explained in detail in the driver itself. It doesn't
belong into the commit description.

> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/Kconfig   |   8 ++
>  drivers/watchdog/Makefile  |   1 +
>  drivers/watchdog/rti_wdt.c | 250 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 259 insertions(+)
>  create mode 100644 drivers/watchdog/rti_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index cec868f8db3f..81faf47d44a6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -583,6 +583,14 @@ config DAVINCI_WATCHDOG
>  	  NOTE: once enabled, this timer cannot be disabled.
>  	  Say N if you are unsure.
>  
> +config K3_RTI_WATCHDOG
> +	tristate "Texas Instruments K3 RTI watchdog"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here if you want to include support for the K3 watchdog
> +	  timer (RTI module) available in the K3 generation of processors.
> +
>  config ORION_WATCHDOG
>  	tristate "Orion watchdog"
>  	depends on ARCH_ORION5X || ARCH_DOVE || MACH_DOVE || ARCH_MVEBU || (COMPILE_TEST && !ARCH_EBSA110)
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352bf3372..6de2e4ceef19 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
>  obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
>  obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
>  obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
> +obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
>  obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
>  obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
>  obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> new file mode 100644
> index 000000000000..b0933b090f53
> --- /dev/null
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Watchdog driver for the K3 RTI module
> + *
> + * (c) Copyright 2019 Texas Instruments Inc.
> + * All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/watchdog.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/device.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/pm_runtime.h>

Alphabetic order, please.

> +
> +#define MODULE_NAME "rti-wdt"
> +#define DEFAULT_HEARTBEAT 60
> +#define MAX_HEARTBEAT     1000
> +
> +/* Timer register set definition */
> +#define RTIDWDCTRL	0x90
> +#define RTIDWDPRLD	0x94
> +#define RTIWDSTATUS	0x98
> +#define RTIWDKEY	0x9c
> +#define RTIDWDCNTR	0xa0
> +#define RTIWWDRXCTRL	0xa4
> +#define RTIWWDSIZECTRL	0xa8
> +
> +#define RTIWWDRX_NMI	0xa
> +
> +#define RTIWWDSIZE_50P	0x50
> +
> +#define WDENABLE_KEY	0xa98559da
> +
> +#define WDKEY_SEQ0		0xe51a
> +#define WDKEY_SEQ1		0xa35c
> +
> +#define WDT_PRELOAD_SHIFT	13
> +
> +#define WDT_PRELOAD_MAX		0xfff
> +
> +#define DWDST			BIT(1)
> +
> +static int heartbeat;
> +
> +/*
> + * struct to hold data for each WDT device
> + * @base - base io address of WD device
> + * @clk - source clock of WDT
> + * @wdd - hold watchdog device as is in WDT core
> + */
> +struct rti_wdt_device {
> +	void __iomem		*base;
> +	struct clk		*clk;
> +	struct watchdog_device	wdd;
> +};
> +
> +static int rti_wdt_start(struct watchdog_device *wdd)
> +{
> +	u32 timer_margin;
> +	unsigned long freq;
> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +
> +	freq = clk_get_rate(wdt->clk);
> +
Does this change at runtime ? Otherwise it would be less costly to
get the frequency in the probe function to avoid having to read it
multiple times.

> +	/* set timeout period */
> +	timer_margin = (u64)wdd->timeout * freq;
> +	timer_margin >>= WDT_PRELOAD_SHIFT;
> +	if (timer_margin > WDT_PRELOAD_MAX)
> +		timer_margin = WDT_PRELOAD_MAX;
> +	writel_relaxed(timer_margin, wdt->base + RTIDWDPRLD);
> +
So if freq is 0 (which can happen per code in rti_wdt_get_timeleft),
the value programmed into the chip will be 0.

> +	/* Set min heartbeat to 1.1x window size */
> +	wdd->min_hw_heartbeat_ms = 11 * wdd->timeout * 1000 / 20;

wdd->timeout is in seconds. If we assume it is set to 1 second,

	11 * 1 * 1000 / 20 = 550.

With 10 seconds:
	11 * 10 * 1000 / 20 = 5500

... meaning the next ping must not be earlier than 55%
of the timeout. This is highly unusual. Most watchdog daemons
will send pings earlier.

This warrants a detailed explanation. The purpose if min_hw_heartbeat_ms
is to prevent pings to be sent too closely because the HW can not handle
it otherwise. If that is what is happening here, and if pings indeed
need to be that far apart for somew reason, it needs to be documented
in the driver.

Also, "window size" is a misleading term. This is really 55%
of the configured timeout.

> +
> +	/* Generate NMI when wdt expires */
> +	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> +

What is the expected action ? Shouldn't there be an NMI handler ?

> +	/* Window size 50% */
> +	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> +

If the minimum ping interval is configurable, it should really be
set to a _much_ lower value. If that isn't feasible for some reason,
this reason needs to be explained in detail.

> +	readl_relaxed(wdt->base + RTIWWDSIZECTRL);
> +
> +	/* enable watchdog */
> +	writel_relaxed(WDENABLE_KEY, wdt->base + RTIDWDCTRL);
> +	return 0;
> +}
> +
> +static int rti_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +
> +	/* put watchdog in service state */
> +	writel_relaxed(WDKEY_SEQ0, wdt->base + RTIWDKEY);
> +	/* put watchdog in active state */
> +	writel_relaxed(WDKEY_SEQ1, wdt->base + RTIWDKEY);
> +
> +	if (readl_relaxed(wdt->base + RTIWDSTATUS))
> +		WARN_ON_ONCE(1);

What is the purpose of this warning/traceback, and what is the expected
reaction ? Some systems are set to reboot on warnings, so this may result
in a reboot. Unless such a reboot is warranted, I don't see the point of
forcing that. Have you considered dev_warn_once() instead ?

> +
> +	return 0;
> +}
> +
> +static unsigned int rti_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	u64 timer_counter;
> +	unsigned long freq;
> +	u32 val;
> +	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +
> +	/* if timeout has occurred then return 0 */
> +	val = readl_relaxed(wdt->base + RTIWDSTATUS);
> +	if (val & DWDST)
> +		return 0;
> +
> +	freq = clk_get_rate(wdt->clk);
> +	if (!freq)
> +		return 0;
> +
> +	timer_counter = readl_relaxed(wdt->base + RTIDWDCNTR);
> +
> +	do_div(timer_counter, freq);
> +
> +	return timer_counter;
> +}
> +
> +static const struct watchdog_info rti_wdt_info = {
> +	.options = WDIOF_KEEPALIVEPING,
> +	.identity = "K3 RTI Watchdog",
> +};
> +
> +static const struct watchdog_ops rti_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= rti_wdt_start,
> +	.ping		= rti_wdt_ping,
> +	.get_timeleft	= rti_wdt_get_timeleft,
> +};
> +
> +static int rti_wdt_probe(struct platform_device *pdev)
> +{
> +	int ret = 0;
> +	struct device *dev = &pdev->dev;
> +	struct resource *wdt_mem;
> +	struct watchdog_device *wdd;
> +	struct rti_wdt_device *wdt;
> +
> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(wdt->clk)) {
> +		if (PTR_ERR(wdt->clk) != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get clock\n");
> +		return PTR_ERR(wdt->clk);
> +	}
> +
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "runtime pm failed\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, wdt);
> +
> +	wdd = &wdt->wdd;
> +	wdd->info = &rti_wdt_info;
> +	wdd->ops = &rti_wdt_ops;
> +	wdd->min_timeout = 1;
> +	/* Set min heartbeat to 1.1x window size */
> +	wdd->min_hw_heartbeat_ms = 11 * DEFAULT_HEARTBEAT * 1000 / 20;
> +	wdd->max_hw_heartbeat_ms = MAX_HEARTBEAT * 1000;
> +	wdd->timeout = DEFAULT_HEARTBEAT;
> +	wdd->parent = dev;
> +
> +	set_bit(WDOG_RESET_KEEPALIVE, &wdd->status);
> +
> +	watchdog_init_timeout(wdd, heartbeat, dev);
> +
> +	watchdog_set_drvdata(wdd, wdt);
> +	watchdog_set_nowayout(wdd, 1);
> +	watchdog_set_restart_priority(wdd, 128);
> +
> +	wdt_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	wdt->base = devm_ioremap_resource(dev, wdt_mem);
> +	if (IS_ERR(wdt->base)) {
> +		ret = PTR_ERR(wdt->base);
> +		goto err_iomap;
> +	}
> +
> +	ret = watchdog_register_device(wdd);
> +	if (ret) {
> +		dev_err(dev, "cannot register watchdog device\n");
> +		goto err_iomap;
> +	}
> +
> +	return 0;
> +
> +err_iomap:
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int rti_wdt_remove(struct platform_device *pdev)
> +{
> +	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
> +
> +	watchdog_unregister_device(&wdt->wdd);
> +	pm_runtime_put(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rti_wdt_of_match[] = {
> +	{ .compatible = "ti,rti-wdt", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
> +
> +static struct platform_driver rti_wdt_driver = {
> +	.driver = {
> +		.name = "rti-wdt",
> +		.of_match_table = rti_wdt_of_match,
> +	},
> +	.probe = rti_wdt_probe,
> +	.remove = rti_wdt_remove,
> +};
> +
> +module_platform_driver(rti_wdt_driver);
> +
> +MODULE_AUTHOR("Tero Kristo <t-kristo@ti.com>");
> +MODULE_DESCRIPTION("K3 RTI Watchdog Driver");
> +
> +module_param(heartbeat, int, 0);
> +MODULE_PARM_DESC(heartbeat,
> +		 "Watchdog heartbeat period in seconds from 1 to "
> +		 __MODULE_STRING(MAX_HEARTBEAT) ", default "
> +		 __MODULE_STRING(DEFAULT_HEARTBEAT));
> +
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:rti-wdt");
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
