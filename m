Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917B444F7EC
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 13:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhKNMpN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 07:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhKNMpM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 07:45:12 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E249C061746;
        Sun, 14 Nov 2021 04:42:18 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so14335382otj.7;
        Sun, 14 Nov 2021 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ZhK0HObgTZE3mJcJX0GxzuTZjYyUtfwaZUw1JaK+Bc=;
        b=OMjmADhkaSHoTt+1LJrIzK1ObIjdEpOog0LWW/tFUvt5iv14OpsSfxX2R87bIZrb48
         N8aHFLLNTO5jmGBIZe8teGuIwH9iBVWLuObPuX78hmYzE7WX0S5cG9hFidSOVxAjmVzt
         R3XcRMBcGXOFwBarbJQQUonq3P7fSq/t79jN3szATaGP+/bdAMDemGnR8LemLpCHIRwe
         crTtDGkgymwfXf/uLeisC652yQZ8vvrvxUKNwS187laM+S1Hv2Hg/og6OoLsVavzHz5V
         Fakl33/lmjQnifQzD3UugvBi8VmHc2Go/YSEYk5q7aZMTxaU1vsJvXsHOrOYL6JvQNsL
         roKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ZhK0HObgTZE3mJcJX0GxzuTZjYyUtfwaZUw1JaK+Bc=;
        b=QGFu1/oBmD6HQfkrB8xEwEjVEWWS2Kdvx92kqylilyHnq6vv/qAP0y4x0i72etwAIj
         3IA+dVTHjmk7i10sMB7ads6QwPZuFOr9ZW7w//5zYlnsd1wVhc3CtMLoQs+3wr6t8blv
         unY2vt4ZUaS+YpGs6lYS35B/WxCOylVLIbSEQSKaSx2kVEivCsC3JvPkJ6ffoGGhVrXt
         SsqVSKI2fpZxFFr+wleTSAYKJ+qo7Y8Wc5+dZ4JJ0fd+W4QB/ZGw6u0mo1vSPnlQt99F
         we6NZa3CTl1nF/DhR8KlAacplYdHqg7pHDCGxvxx3rYdYoVnV7OcTzydMZaCnLdofezl
         RAWA==
X-Gm-Message-State: AOAM532rZDD3r/zVywq3QG2Ub3rQ+BklApkJoLQd7MqzefhySZtT72ZX
        Bo6HagDzyGDJhvHQ3r5IeEc=
X-Google-Smtp-Source: ABdhPJyiQ1ZEUr7kMj6Bl/7Rm5TCqseOf49x65S4eLg9xymB4Kx09Tr5C88jbxhGTPKfZrzn9FA1Jw==
X-Received: by 2002:a05:6830:1204:: with SMTP id r4mr722154otp.34.1636893736167;
        Sun, 14 Nov 2021 04:42:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f32sm2463937otf.35.2021.11.14.04.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 04:42:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Sven Peter <sven@svenpeter.dev>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Message-ID: <01ed3bdf-307d-b51d-7739-d2e5c6cb4e42@roeck-us.net>
Date:   Sun, 14 Nov 2021 04:42:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211113094732.73889-2-sven@svenpeter.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/13/21 1:47 AM, Sven Peter wrote:
> Add support for the watchdog timer found in Apple SoCs. This driver is
> also required to reboot these machines.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>   MAINTAINERS                  |   1 +
>   drivers/watchdog/Kconfig     |  12 ++
>   drivers/watchdog/Makefile    |   1 +
>   drivers/watchdog/apple_wdt.c | 223 +++++++++++++++++++++++++++++++++++
>   4 files changed, 237 insertions(+)
>   create mode 100644 drivers/watchdog/apple_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba480837724d..30a1444297a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1756,6 +1756,7 @@ F:	drivers/i2c/busses/i2c-pasemi-platform.c
>   F:	drivers/irqchip/irq-apple-aic.c
>   F:	drivers/mailbox/apple-mailbox.c
>   F:	drivers/pinctrl/pinctrl-apple-gpio.c
> +F:	drivers/watchdog/apple_wdt.c
>   F:	include/dt-bindings/interrupt-controller/apple-aic.h
>   F:	include/dt-bindings/pinctrl/apple.h
>   F:	include/linux/apple-mailbox.h
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9d222ba17ec6..170dec880c8f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -976,6 +976,18 @@ config MSC313E_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called msc313e_wdt.
>   
> +config APPLE_WATCHDOG
> +	tristate "Apple SoC watchdog"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the Watchdog found in Apple
> +	  SoCs such as the M1. Next to the common watchdog features this
> +	  driver is also required in order to reboot these SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called apple_wdt.
> +
>   # X86 (i386 + ia64 + x86_64) Architecture
>   
>   config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee97064145b..270a518bd8f3 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>   obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
>   obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
> +obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> new file mode 100644
> index 000000000000..ff6d98aadffc
> --- /dev/null
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SoC Watchdog driver
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +/*
> + * Apple Watchdog MMIO registers
> + *
> + * This HW block has three separate watchdogs. WD0 resets the machine
> + * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
> + * machine reset. WD0 additionally supports a configurable interrupt.
> + *
> + * APPLE_WDT_WDx_CUR_TIME is a simple counter incremented for each tick of the
> + * reference clock. It can also be overwritten to any value.
> + * Whenever APPLE_WDT_CTRL_RESET_EN is set in APPLE_WDT_WDx_CTRL and
> + * APPLE_WDTx_WD1_CUR_TIME >= APPLE_WDTx_WD1_BITE_TIME the entire machine is
> + * reset.
> + * Whenever APPLE_WDT_CTRL_IRQ_EN is set and APPLE_WDTx_WD1_CUR_TIME >=
> + * APPLE_WDTx_WD1_BARK_TIME an interrupt is triggered and
> + * APPLE_WDT_CTRL_IRQ_STATUS is set. The interrupt can be cleared by writing
> + * 1 to APPLE_WDT_CTRL_IRQ_STATUS.

This information is useless since it is not used. It might make sense to add a note
along the line of "This information can be used to implement pretimeout support
at a later time".

> + */
> +#define APPLE_WDT_WD0_CUR_TIME		0x00
> +#define APPLE_WDT_WD0_BITE_TIME		0x04
> +#define APPLE_WDT_WD0_BARK_TIME		0x08
> +#define APPLE_WDT_WD0_CTRL		0x0c
> +
> +#define APPLE_WDT_WD1_CUR_TIME		0x10
> +#define APPLE_WDT_WD1_BITE_TIME		0x14
> +#define APPLE_WDT_WD1_CTRL		0x1c
> +
> +#define APPLE_WDT_WD2_CUR_TIME		0x20
> +#define APPLE_WDT_WD2_BITE_TIME		0x24
> +#define APPLE_WDT_WD2_CTRL		0x2c
> +
> +#define APPLE_WDT_CTRL_IRQ_EN		BIT(0)
> +#define APPLE_WDT_CTRL_IRQ_STATUS	BIT(1)
> +#define APPLE_WDT_CTRL_RESET_EN		BIT(2)

Include linux/bits.h

> +
> +struct apple_wdt {
> +	struct watchdog_device wdd;
> +	void __iomem *regs;
> +	struct clk *clk;
> +	u32 clk_rate;

clk_get_rate returns unsigned long. Any reason to use u32 ?

> +};
> +
> +static struct apple_wdt *to_apple_wdt(struct watchdog_device *wdd)
> +{
> +	return container_of(wdd, struct apple_wdt, wdd);
> +}
> +
> +static int apple_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
> +
> +	return 0;
> +}
> +
> +static int apple_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
> +
> +	return 0;
> +}
> +
> +static int apple_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +
> +	return 0;
> +}
> +
> +static int apple_wdt_set_timeout(struct watchdog_device *wdd, unsigned int s)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +	u64 timeout;
> +
> +	timeout = mul_u32_u32(wdt->clk_rate, s);
> +	if (timeout > U32_MAX)
> +		return -EINVAL;
> +

With
	max_timeout = U32_MAX / wdt->clk_rate;

the result of the above multiply operation is never larger than U32_MAX,
and both the error check and the use of mul_u32_u32() are unnecessary.

Just use
	u32 timeout = s * wdt->clk_rate;


> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +	writel_relaxed(timeout, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
> +
> +	wdd->timeout = s;
> +
> +	return 0;
> +}
> +
> +static unsigned int apple_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +	u32 cur_time, reset_time;
> +
> +	cur_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +	reset_time = readl_relaxed(wdt->regs + APPLE_WDT_WD1_BITE_TIME);
> +
> +	return (reset_time - cur_time) / wdt->clk_rate;
> +}
> +
> +static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
> +			     void *cmd)
> +{
> +	struct apple_wdt *wdt = to_apple_wdt(wdd);
> +
> +	writel_relaxed(APPLE_WDT_CTRL_RESET_EN, wdt->regs + APPLE_WDT_WD1_CTRL);
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +
> +	/* flush writes and wait for the reset to be triggered */
> +	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> +	mdelay(150);

Can this magic number be explained ?

> +
> +	return 0;
> +}
> +
> +static struct watchdog_ops apple_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = apple_wdt_start,
> +	.stop = apple_wdt_stop,
> +	.ping = apple_wdt_ping,
> +	.set_timeout = apple_wdt_set_timeout,
> +	.get_timeleft = apple_wdt_get_timeleft,
> +	.restart = apple_wdt_restart,
> +};
> +
> +static struct watchdog_info apple_wdt_info = {
> +	.identity = "Apple SoC Watchdog",
> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +};
> +
> +static int apple_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct apple_wdt *wdt;
> +	int ret;
> +
> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, wdt);
> +
> +	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(wdt->regs))
> +		return PTR_ERR(wdt->regs);
> +
> +	/* reset watchdog to safe defaults */
> +	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CTRL);
> +	writel_relaxed(U32_MAX, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
> +
> +	wdt->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(wdt->clk))
> +		return PTR_ERR(wdt->clk);
> +
> +	ret = clk_prepare_enable(wdt->clk);
> +	if (ret)
> +		return ret;
> +
> +	wdt->clk_rate = clk_get_rate(wdt->clk);

clk_get_rate() can, at least in theory, return 0.

> +	wdt->wdd.ops = &apple_wdt_ops;
> +	wdt->wdd.info = &apple_wdt_info;
> +	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
> +	wdt->wdd.timeout = wdt->wdd.max_timeout;

It is is quite unusual to set the default timeout to the maximum.
Normally drivers configure 30 or 60 seconds. Are you sure
this is what you want ?

> +
> +	watchdog_stop_on_unregister(&wdt->wdd);
> +	watchdog_set_restart_priority(&wdt->wdd, 128);
> +
> +	ret = devm_watchdog_register_device(dev, &wdt->wdd); > +	if (ret < 0) {
> +		clk_disable_unprepare(wdt->clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int apple_wdt_remove(struct platform_device *pdev)
> +{
> +	struct apple_wdt *wdt = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(wdt->clk);

clk_disable_unprepare() must be called after unregistering the watchdog.
Please use devm_add_action_or_reset() in the probe function to handle
clk_disable_unprepare() - see many other watchdog drivers for examples.

> +	return 0;
> +}
> +
> +static const struct of_device_id apple_wdt_of_match[] = {
> +	{ .compatible = "apple,wdt" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_wdt_of_match);
> +
> +static struct platform_driver apple_wdt_driver = {
> +	.driver = {
> +		.name = "apple-watchdog",
> +		.of_match_table = apple_wdt_of_match,
> +	},
> +	.probe = apple_wdt_probe,
> +	.remove = apple_wdt_remove,
> +};
> +module_platform_driver(apple_wdt_driver);
> +
> +MODULE_DESCRIPTION("Apple SoC watchdog driver");
> +MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
> +MODULE_LICENSE("Dual MIT/GPL");
> 

