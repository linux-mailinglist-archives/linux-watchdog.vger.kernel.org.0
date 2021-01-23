Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC3530171F
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbhAWRS4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWRSz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:18:55 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AD6C0613D6;
        Sat, 23 Jan 2021 09:18:15 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id r199so2235885oor.2;
        Sat, 23 Jan 2021 09:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xPBB4gwRyETHBhO9iPeJ9dXXrrAfzVjkqXp6mpd3sfw=;
        b=EjJNvcR/N8pgOR7Pz5ZuDX3iGY4RKFAHWE3sRjPEVqnDZ1+722MLn3v8ENXjXP7CdX
         SrAM04qZI8xiED2i4iLF/NLkbVuvOIV2q6ni22V3MUd+micTa1bgGJ1JkUyaqFDVhF0U
         opmAvrAy1BGCpBZzem0omsIOWmqAABafn+zHI0sk0HBe7TSktqT5DymPmp7qj6tDRVC6
         zFo4QmbNYkcKKs1LstwE4gwLC5HnUzMm8UJlInbHPDWQC09EfEFU4UpSG0hUCnlkmfwA
         9WVVJkQSq/syIiebmtVnnNflS3/yyG2r8g+F4I+9WUbPROuAeDMaq37lsg4hQnotsCJc
         +OQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xPBB4gwRyETHBhO9iPeJ9dXXrrAfzVjkqXp6mpd3sfw=;
        b=PjrwUwQeeLV9pe5ZkGUk+UYwuXCf5ykXBBwmrehbUnqddwVk06Lj/dahME3C2gqUfi
         1Qbx9nPWlc8qL5iLU3fOT58LcYBeqqVi50Lm/Bex8UVL8uUZYilHmbcwi15gIGdzBLp3
         wv6P4S6lmwRBjLp8WpuTbLJWYHGPXwoi1wqYBwREt052Zqqsor+5ySsLNlUNHgYv61T6
         8iXq2+wwJ+ynv0QuuUVU1UolseIxTCDY0p8opnkTdyrVqsEbF0rWcJfzKBT3Co7HTlvs
         A47HWJRxoTDTwZ9qcAlDWZHb4w6rr7s9ts0tm7z/zI/JUhI4NBvdTWx+ul62KN2r4Byk
         rZwQ==
X-Gm-Message-State: AOAM532hxztYrbvoOt19+eyr1Vp364z897yhz4/Q3fh8XGx8go5+KRwL
        xSCTqWWS26WeAwNKPTNmujylyKkCGhY=
X-Google-Smtp-Source: ABdhPJzTWjglXqnuFfMbiqbIjs7UfWO52zMGXI3AsleZhvgSlqOxiHwgdeBu8f0upulnRBghNAbtVw==
X-Received: by 2002:a4a:1d82:: with SMTP id 124mr7495839oog.12.1611422294886;
        Sat, 23 Jan 2021 09:18:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a188sm171953oif.11.2021.01.23.09.18.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:18:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:18:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com, chen.yong.seow@intel.com
Subject: Re: [PATCH v4 2/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Message-ID: <20210123171812.GA55759@roeck-us.net>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <26d74f46ce74488424371dd3e16aa38508fa6c2e.1608141131.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d74f46ce74488424371dd3e16aa38508fa6c2e.1608141131.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Dec 17, 2020 at 02:32:48AM +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Intel Keembay Soc requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig       |  13 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/keembay_wdt.c | 286 +++++++++++++++++++++++++++++++++
>  3 files changed, 300 insertions(+)
>  create mode 100644 drivers/watchdog/keembay_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..f412cf2d0f1a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2163,4 +2163,17 @@ config USBPCWATCHDOG
>  
>  	  Most people will say N.
>  
> +config KEEMBAY_WATCHDOG
> +	tristate "Intel Keem Bay SoC non-secure watchdog"
> +	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
> +	select WATCHDOG_CORE
> +	help
> +	 This option enable support for an In-secure watchdog timer driver for
> +	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
> +	 count unit. An interrupt will be triggered, when the count crosses
> +	 the thershold configured in the register.
> +
> +	 To compile this driver as a module, choose M here: the
> +	 module will be called keembay_wdt.
> +
>  endif # WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 071a2e50be98..f6f9f434f407 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
>  obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
> +obj-$(CONFIG_KEEMBAY_WATCHDOG) += keembay_wdt.o
>  
>  # M68K Architecture
>  obj-$(CONFIG_M54xx_WATCHDOG) += m54xx_wdt.o
> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
> new file mode 100644
> index 000000000000..547d3fea33ff
> --- /dev/null
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Watchdog driver for Intel Keem Bay non-secure watchdog.
> + *
> + * Copyright (C) 2020 Intel Corporation
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/watchdog.h>
> +
> +/* Non-secure watchdog register offsets */
> +#define TIM_WATCHDOG		0x0
> +#define TIM_WATCHDOG_INT_THRES	0x4
> +#define TIM_WDOG_EN		0x8
> +#define TIM_SAFE		0xc
> +
> +#define WDT_ISR_MASK		GENMASK(9, 8)
> +#define WDT_ISR_CLEAR		0x8200ff18
> +#define WDT_UNLOCK		0xf1d0dead
> +#define WDT_LOAD_MAX		U32_MAX
> +#define WDT_LOAD_MIN		1
> +#define WDT_TIMEOUT		5
> +
> +static unsigned int timeout = WDT_TIMEOUT;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout period in seconds (default = "
> +		 __MODULE_STRING(WDT_TIMEOUT) ")");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default = "
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct keembay_wdt {
> +	struct watchdog_device	wdd;
> +	struct clk		*clk;
> +	unsigned int		rate;
> +	int			to_irq;
> +	int			th_irq;
> +	void __iomem		*base;
> +};
> +
> +static inline u32 keembay_wdt_readl(struct keembay_wdt *wdt, u32 offset)
> +{
> +	return readl(wdt->base + offset);
> +}
> +
> +static inline void keembay_wdt_writel(struct keembay_wdt *wdt, u32 offset, u32 val)
> +{
> +	writel(WDT_UNLOCK, wdt->base + TIM_SAFE);
> +	writel(val, wdt->base + offset);
> +}
> +
> +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +
> +	keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);
> +}
> +
> +static void keembay_wdt_set_pretimeout_reg(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +	u32 th_val = 0;
> +
> +	if (wdog->pretimeout)
> +		th_val = wdog->timeout - wdog->pretimeout;
> +
> +	keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt->rate);
> +}
> +
> +static int keembay_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +
> +	keembay_wdt_set_timeout_reg(wdog);
> +	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +
> +	keembay_wdt_writel(wdt, TIM_WDOG_EN, 0);
> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_ping(struct watchdog_device *wdog)
> +{
> +	keembay_wdt_set_timeout_reg(wdog);
> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t)
> +{
> +	wdog->timeout = t;
> +	keembay_wdt_set_timeout_reg(wdog);
> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32 t)
> +{
> +	if (t > wdog->timeout)
> +		return -EINVAL;
> +
> +	wdog->pretimeout = t;
> +	keembay_wdt_set_pretimeout_reg(wdog);
> +
> +	return 0;
> +}
> +
> +static unsigned int keembay_wdt_get_timeleft(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +
> +	return keembay_wdt_readl(wdt, TIM_WATCHDOG) / wdt->rate;
> +}
> +
> +/*
> + * SMC call is used to clear the interrupt bits, because the TIM_GEN_CONFIG
> + * register is in the secure bank.
> + */
> +static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
> +{
> +	struct keembay_wdt *wdt = dev_id;
> +	struct arm_smccc_res res;
> +
> +	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
> +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
> +	emergency_restart();
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
> +{
> +	struct keembay_wdt *wdt = dev_id;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0, &res);
> +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-timeout.\n");
> +	watchdog_notify_pretimeout(&wdt->wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct watchdog_info keembay_wdt_info = {
> +	.identity	= "Intel Keem Bay Watchdog Timer",
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_PRETIMEOUT |
> +			  WDIOF_MAGICCLOSE |
> +			  WDIOF_KEEPALIVEPING,
> +};
> +
> +static const struct watchdog_ops keembay_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= keembay_wdt_start,
> +	.stop		= keembay_wdt_stop,
> +	.ping		= keembay_wdt_ping,
> +	.set_timeout	= keembay_wdt_set_timeout,
> +	.set_pretimeout	= keembay_wdt_set_pretimeout,
> +	.get_timeleft	= keembay_wdt_get_timeleft,
> +};
> +
> +static int keembay_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct keembay_wdt *wdt;
> +	int ret;
> +
> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(wdt->base))
> +		return PTR_ERR(wdt->base);
> +
> +	/* we do not need to enable the clock as it is enabled by default */
> +	wdt->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(wdt->clk))
> +		return dev_err_probe(dev, PTR_ERR(wdt->clk), "Failed to get clock\n");
> +
> +	wdt->rate = clk_get_rate(wdt->clk);
> +	if (!wdt->rate)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
> +
> +	wdt->th_irq = platform_get_irq_byname(pdev, "threshold");
> +	if (wdt->th_irq < 0)
> +		return dev_err_probe(dev, wdt->th_irq, "Failed to get IRQ for threshold\n");
> +
> +	ret = devm_request_irq(dev, wdt->th_irq, keembay_wdt_th_isr, 0,
> +			       "keembay-wdt", wdt);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ for threshold\n");
> +
> +	wdt->to_irq = platform_get_irq_byname(pdev, "timeout");
> +	if (wdt->to_irq < 0)
> +		return dev_err_probe(dev, wdt->to_irq, "Failed to get IRQ for timeout\n");
> +
> +	ret = devm_request_irq(dev, wdt->to_irq, keembay_wdt_to_isr, 0,
> +			       "keembay-wdt", wdt);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ for timeout\n");
> +
> +	wdt->wdd.parent		= dev;
> +	wdt->wdd.info		= &keembay_wdt_info;
> +	wdt->wdd.ops		= &keembay_wdt_ops;
> +	wdt->wdd.min_timeout	= WDT_LOAD_MIN;
> +	wdt->wdd.max_timeout	= WDT_LOAD_MAX / wdt->rate;
> +	wdt->wdd.timeout	= WDT_TIMEOUT;
> +
> +	watchdog_set_drvdata(&wdt->wdd, wdt);
> +	watchdog_set_nowayout(&wdt->wdd, nowayout);
> +	watchdog_init_timeout(&wdt->wdd, timeout, dev);
> +	keembay_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
> +
> +	ret = devm_watchdog_register_device(dev, &wdt->wdd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register watchdog device.\n");
> +
> +	platform_set_drvdata(pdev, wdt);
> +	dev_info(dev, "Initial timeout %d sec%s.\n",
> +		 wdt->wdd.timeout, nowayout ? ", nowayout" : "");
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused keembay_wdt_suspend(struct device *dev)
> +{
> +	struct keembay_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		return keembay_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused keembay_wdt_resume(struct device *dev)
> +{
> +	struct keembay_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd))
> +		return keembay_wdt_start(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(keembay_wdt_pm_ops, keembay_wdt_suspend,
> +			 keembay_wdt_resume);
> +
> +static const struct of_device_id keembay_wdt_match[] = {
> +	{ .compatible = "intel,keembay-wdt" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, keembay_wdt_match);
> +
> +static struct platform_driver keembay_wdt_driver = {
> +	.probe		= keembay_wdt_probe,
> +	.driver		= {
> +		.name		= "keembay_wdt",
> +		.of_match_table	= keembay_wdt_match,
> +		.pm		= &keembay_wdt_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(keembay_wdt_driver);
> +
> +MODULE_DESCRIPTION("Intel Keem Bay SoC watchdog driver");
> +MODULE_AUTHOR("Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com");
> +MODULE_LICENSE("GPL v2");
