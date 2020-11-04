Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A332A6F71
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Nov 2020 22:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgKDVR6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Nov 2020 16:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKDVR6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Nov 2020 16:17:58 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF81BC0613D3;
        Wed,  4 Nov 2020 13:17:56 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id x1so23685385oic.13;
        Wed, 04 Nov 2020 13:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R2exAgQmlg7z5aXOWEfGnzaijIZr89ZAsUPWmUkgp1E=;
        b=YNmbVxO1BiJltEICOkn3azIBqIOiHytTJwB/2LBXU9R2BLFkQUNS8mK/4gs/JmJX3z
         CwmsOJdBTKZ0l8NftaXtDFkoVKgkaSfXuo0d8HyVNwC9qZm2BZq+uc0loCE6hzTD5ZZF
         Dvr2E84sA4GsE+gLRyCrOUUd+7AJAgleLtYU8sUL2cMRJ7CpJMrAk7Ecm3VY2nldNNtK
         MQ9wtJAtXb0cUlnHhRWDlAw9O2CNe/VHNE6z95sJd+yY1/nBUznJ8uwx6FLNEc1oLPRJ
         8r+hYtuqrtcm+uYmreJBqeddShLzg55l2pCV71YHAYpJoDHfocOVk+qV/0v5A5yIsnCe
         deHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=R2exAgQmlg7z5aXOWEfGnzaijIZr89ZAsUPWmUkgp1E=;
        b=RHBgFknpci6u1oAykZNeIAsnJx88Rd7Prj3CLPnznLlzVfNvtBmBzgVGfSFZrJCPgn
         0/NJ9MB3xMi144zN0DoFZvq12HUI1GxFYh2NsqUNeda6LNhWOttIKOOUeD0Sk6cDiv0b
         nlKH7QtknnfbOVRxbm93EfkEwG7sBwACASTSxK5Uaw+Cpgsik+doF9fRt9LzCN/hxl5z
         oZn+8fwF1/bC/v476oHq5lb8hOvY7Sz7ZzN602OhOshWeCBf6bF0sKKwcyGBURPkMrVc
         pSBJH58Wc/FkN2mGfCyP4eTbT4NtefEB/r6VO/m3ZhSFFHwGIB8XXVBKr5AWSY1o1fSN
         NL2A==
X-Gm-Message-State: AOAM531v28BOcHRwBpgGN9aUoklut6e7iHN6RPSXLQCvJ5qqjBsy1zxG
        J4RsyBg3ELzIJV0gf7VCk54=
X-Google-Smtp-Source: ABdhPJxMn6StubnOuW8JYqPFky8KwS4HDYDR40ViRGuWHHB1j9GleWr5g/6i4T3v3ewduUhimQn73w==
X-Received: by 2002:aca:5f85:: with SMTP id t127mr3832589oib.18.1604524676226;
        Wed, 04 Nov 2020 13:17:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b185sm740829oif.5.2020.11.04.13.17.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 13:17:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 4 Nov 2020 13:17:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com
Subject: Re: [PATCH v1 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Message-ID: <20201104211754.GA56277@roeck-us.net>
References: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
 <432ae9c4ec6fb5ea745727fbf0fd121eda676db7.1604292525.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432ae9c4ec6fb5ea745727fbf0fd121eda676db7.1604292525.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 02, 2020 at 01:23:11PM +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Intel Keembay Soc requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/watchdog/Kconfig       |  13 ++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/keembay_wdt.c | 293 +++++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
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
> index 000000000000..889e43fb95ac
> --- /dev/null
> +++ b/drivers/watchdog/keembay_wdt.c
> @@ -0,0 +1,293 @@
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
> +static inline void keembay_wdt_writel(struct keembay_wdt *wdt,
> +				      u32 offset, u32 val)
> +{
> +	writel(WDT_UNLOCK, wdt->base + TIM_SAFE);
> +	writel(val, wdt->base + offset);
> +}
> +
> +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog, bool ping)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +	u32 th_val = 0;
> +
> +	if (ping)
> +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);
> +
> +	if (wdog->pretimeout)
> +		th_val = wdog->timeout - wdog->pretimeout;
> +
> +	keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt->rate);
> +
> +	if (ping)
> +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout * wdt->rate);
> +}
> +
> +static int keembay_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct keembay_wdt *wdt = watchdog_get_drvdata(wdog);
> +
> +	keembay_wdt_set_timeout_reg(wdog, 0);

The second parameter is bool, so please use true/false.
Anyway, why does starting the watchdog require setting the pretimeout
register, but not setting the timeout register ?

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
> +	keembay_wdt_set_timeout_reg(wdog, 1);

Each ping requires setting the timeout twice, plus setting the
pretimeout ? Really ?

Is this document somewhere. I think I'll want to confirm this with
the specification. The TIM_WATCHDOG register seems to need a lot
of updates, and I'd like to have some confirmation that this is
really necessary.

> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t)
> +{
> +	u32 actual = min(t, wdog->max_timeout);
> +
min() is unnecessary.

> +	wdog->timeout = actual;
> +	keembay_wdt_set_timeout_reg(wdog, 0);

Why does setting the timeout require setting the pretimeout register,
but not setting the timeout register ?

> +
> +	return 0;
> +}
> +
> +static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog, u32 t)
> +{
> +	if (t < wdog->min_timeout || t >= wdog->timeout)
> +		return -EINVAL;

Validated by watchdog core.

> +
> +	wdog->pretimeout = t;
> +	keembay_wdt_set_timeout_reg(wdog, 0);
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
> +	u32 th_val = 0;
> +
> +	if (wdt->wdd.pretimeout)
> +		th_val = wdt->wdd.timeout - wdt->wdd.pretimeout;
> +
> +	keembay_wdt_writel(wdt, TIM_WATCHDOG, th_val * wdt->rate + 1);
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
> +	ret = watchdog_register_device(&wdt->wdd);
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

No remove function ? What happens if someone unloads
the driver ?

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
> -- 
> 2.17.1
> 
