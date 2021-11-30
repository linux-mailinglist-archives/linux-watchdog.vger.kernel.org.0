Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C2E463A98
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Nov 2021 16:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbhK3P4T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Nov 2021 10:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbhK3Pxu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Nov 2021 10:53:50 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99050C06175B;
        Tue, 30 Nov 2021 07:50:28 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id be32so42024049oib.11;
        Tue, 30 Nov 2021 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pjRlB+E6Gy4r8+rwmKsrTaDDhWcDa3kWIDrNAgf8150=;
        b=S+8q3WbuzpRKYcxUmGekZPnWQmH6jgiRsTiJhxghlAUDpImBj2D8Dmfm1FmOTYYICT
         442766nHIx0frbmurGn7uXP0f9wAbrgxC2cBp7Ir0stbe4qiWrYS/prQGg5HeqUP991j
         psUJ683i8iUx1vJMYoSKe7A4FXf924OlCDeQvub/t4w7Lb4OJ9Nmubsc29QO9cQr9dKW
         cKFQHXBPvXrM0fQNvNNnQRBF9/VSwUFn84xpqq7tPI8qQ6nTwfm3B1yqX9ZJOEbEC4BB
         8moEoNBWgAqNE3ZpIBQ7XynX/rA3e9wsd2+LtwtE6EpKg3qdWVBQPrgg9CzFY8cgO4mD
         YPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pjRlB+E6Gy4r8+rwmKsrTaDDhWcDa3kWIDrNAgf8150=;
        b=PhpeHzTn0AQTaTWKexesoyQ+iMgEir8kIQd20KQSR5Kil3wB7aPV3BbROeOOdIqWKE
         H9vFNgXUyHeus1tukQcshZOkp8XgaAluEdlbPw7W2Wk6cjjwu9UgvCHYKSbEXfcgn3Qh
         Yq5oWeLVAh9cTPhJFR3lJQknLFhECmOSbjzmXjJ/qYuGXd5m/7if8wmzj+zAbZivVYZZ
         4ddOrnloG0Blay5JcvYsyUx4DWZjd0NDLwQQm+snWfRKWO6YE9ae4gLc4Cqs/RoSXmY4
         tPODzuUFUryU7gGJ0MRkxxcuzGoVSE44Efg/ow2pFVp6KYNVBY28pK1q6ApGf5/XGM3P
         Uz3w==
X-Gm-Message-State: AOAM531kShe//NCuEJzR5hreHJYEYDU9KWh/vD8qJfd/HfwODlnJxZ7R
        L3UDbjqZv/wMBb/sZ9CRlGCj9ljll8A=
X-Google-Smtp-Source: ABdhPJzqwftJI5BdZ49N0Nbq/NSaV/zvRzHbH4cQRYv1L16DpZsjWnJY8GiEI7QyZZWvJ2LuINlihw==
X-Received: by 2002:a05:6808:1315:: with SMTP id y21mr179944oiv.103.1638287427622;
        Tue, 30 Nov 2021 07:50:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t18sm3174323ott.2.2021.11.30.07.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 07:50:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211130114316.16622-1-biju.das.jz@bp.renesas.com>
 <20211130114316.16622-3-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
Message-ID: <5ada41f6-68cf-08e8-a773-cfd174bf82a5@roeck-us.net>
Date:   Tue, 30 Nov 2021 07:50:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130114316.16622-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/30/21 3:43 AM, Biju Das wrote:
> Add Watchdog Timer driver for RZ/G2L SoC.
> 
> WDT IP block supports normal watchdog timer function and reset
> request function due to CPU parity error.
> 
> This driver currently supports normal watchdog timer function
> and later will add support for reset request function due to
> CPU parity error.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
> V3->V4:
>   * Fixed the build issue reported by kernel test robot by Replacing the
>     macro WDT_CYCLE_MSEC with div64_ul for 64-bit division to fix 32-bit
>     kernels.
> V2->V3:
>   * Added Rb tag from Guenter Roeck
> V1->V2:
>   * started using clk_get/put instead of devm_clk_get/put
>   * Moved devm_add_action_or_reset after set_drvdata() and
>   * removed redundant action on devm_add_action_or_reset() failure.
> RFC->V1
>   * Removed pclk_rate from priv.
>   * rzg2l_wdt_write() returns void and Removed tiemout related to register update
>   * rzg2l_wdt_init_timeout() returns void and removed delays.
>   * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>   * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>   * started using devm_reset_control_get_exclusive()
>   * removed platform_set_drvdata(pdev, priv) as there is no user
>   * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the default.
>   * removed remove callback as it is empty.
> ---
>   drivers/watchdog/Kconfig     |   8 ++
>   drivers/watchdog/Makefile    |   1 +
>   drivers/watchdog/rzg2l_wdt.c | 260 +++++++++++++++++++++++++++++++++++
>   3 files changed, 269 insertions(+)
>   create mode 100644 drivers/watchdog/rzg2l_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9d222ba17ec6..4760ee981263 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -881,6 +881,14 @@ config RENESAS_RZAWDT
>   	  This driver adds watchdog support for the integrated watchdogs in the
>   	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>   
> +config RENESAS_RZG2LWDT
> +	tristate "Renesas RZ/G2L WDT Watchdog"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for the integrated watchdogs in the
> +	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
> +
>   config ASPEED_WATCHDOG
>   	tristate "Aspeed BMC watchdog support"
>   	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee97064145b..9a3dc0bd271b 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>   obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
>   obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>   obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
> +obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
>   obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
>   obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>   obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> new file mode 100644
> index 000000000000..69530b92fff9
> --- /dev/null
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L WDT Watchdog Driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation
> + */
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/watchdog.h>
> +
> +#define WDTCNT		0x00
> +#define WDTSET		0x04
> +#define WDTTIM		0x08
> +#define WDTINT		0x0C
> +#define WDTCNT_WDTEN	BIT(0)
> +#define WDTINT_INTDISP	BIT(0)
> +
> +#define WDT_DEFAULT_TIMEOUT		60U
> +
> +/* Setting period time register only 12 bit set in WDTSET[31:20] */
> +#define WDTSET_COUNTER_MASK		(0xFFF00000)
> +#define WDTSET_COUNTER_VAL(f)		((f) << 20)
> +
> +#define F2CYCLE_NSEC(f)			(1000000000 / (f))
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct rzg2l_wdt_priv {
> +	void __iomem *base;
> +	struct watchdog_device wdev;
> +	struct reset_control *rstc;
> +	unsigned long osc_clk_rate;
> +	unsigned long delay;
> +};
> +
> +static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
> +{
> +	/* delay timer when change the setting register */
> +	ndelay(priv->delay);
> +}
> +
> +static u32 rzg2l_wdt_get_cycle_msec(unsigned long cycle, u32 wdttime)
> +{
> +	u64 timer_cycle_ms = 1024 * 1024 * 1000000ULL * (wdttime + 1);
> +
> +	return div64_ul(timer_cycle_ms, cycle);
> +}

A description might be warranted here. The return value appears to be a timeout
in seconds, based on
	priv->wdev.max_timeout = rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0xfff);
but that is not what the function name suggests.

Also, the maximum timeouts seem to be excessive. Feeding the above function into test code,
I get

clk: 10000000 max timeout: 429496729
clk: 20000000 max timeout: 214748364
clk: 40000000 max timeout: 107374182
clk: 80000000 max timeout: 53687091
clk: 160000000 max timeout: 26843545
clk: 320000000 max timeout: 13421772
clk: 640000000 max timeout: 6710886
clk: 1280000000 max timeout: 3355443

That really doesn't look correct. Even in milli-seconds, a maximum
timeout of 429496729 ms or 429496.729 seconds at 10 MHz clock rate
seems high.

> +
> +static void rzg2l_wdt_write(struct rzg2l_wdt_priv *priv, u32 val, unsigned int reg)
> +{
> +	if (reg == WDTSET)
> +		val &= WDTSET_COUNTER_MASK;
> +
> +	writel_relaxed(val, priv->base + reg);
> +	/* Registers other than the WDTINT is always synchronized with WDT_CLK */
> +	if (reg != WDTINT)
> +		rzg2l_wdt_wait_delay(priv);
> +}
> +
> +static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 time_out;
> +
> +	/* Clear Lapsed Time Register and clear Interrupt */
> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
> +	/* 2 consecutive overflow cycle needed to trigger reset */
> +	time_out = (wdev->timeout / 2 * 1000000) / rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0);

This code effectively reduces timer granularity to 2 seconds. Is that on purpose ?
Why not something like
	time_out = (wdev->timeout * (1000000 / 2)) / rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0);
instead ?

Also, feeding the maximum timeout as calculated by
rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0xfff)
into this expression yields really large numbers. Making things worse,
those long timeouts cause
	wdev->timeout / 2 * 1000000
to overflow easily. This calculation alone suggests that the maximum timeout
value can not be larger than ~8589 to avoid that overflow.

More test code gives me:

clk: 10000000 max timeout: 429496729
   timeout: 1s reg: 0x0
   timeout: 2s reg: 0x9
   timeout: 859s reg: 0xffb
     Overflow: t=214748364 treg: 0x3d0916df
   timeout: 214748364s reg: 0xffffffff
     Overflow: t=429496729 treg: 0x7a122dbf
   timeout: 429496729s reg: 0xffffffff

clk: 320000000 max timeout: 13421772
   timeout: 1s reg: 0x0
   timeout: 2s reg: 0x131
   timeout: 27s reg: 0xf80
     Overflow: t=6710886 treg: 0x3d0cd090
   timeout: 6710886s reg: 0xffffffff
     Overflow: t=13421772 treg: 0x7a19a120
   timeout: 13421772s reg: 0xffffffff

and similar for other clock rates. This shows both the impact of the
artificial 2s granularity and the value overflows.

Something in the calculation of max_timeout or in the calculation
of the register value or both is wrong. Whatever it is, it needs
to get fixed.

Guenter

> +	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(time_out), WDTSET);
> +}
> +
> +static int rzg2l_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	reset_control_deassert(priv->rstc);
> +	pm_runtime_get_sync(wdev->parent);
> +
> +	/* Initialize time out */
> +	rzg2l_wdt_init_timeout(wdev);
> +
> +	/* Initialize watchdog counter register */
> +	rzg2l_wdt_write(priv, 0, WDTTIM);
> +
> +	/* Enable watchdog timer*/
> +	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	pm_runtime_put(wdev->parent);
> +	reset_control_assert(priv->rstc);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_wdt_restart(struct watchdog_device *wdev,
> +			     unsigned long action, void *data)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	/* Reset the module before we modify any register */
> +	reset_control_reset(priv->rstc);
> +	pm_runtime_get_sync(wdev->parent);
> +
> +	/* smallest counter value to reboot soon */
> +	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> +
> +	/* Enable watchdog timer*/
> +	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info rzg2l_wdt_ident = {
> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +	.identity = "Renesas RZ/G2L WDT Watchdog",
> +};
> +
> +static int rzg2l_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_ops rzg2l_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = rzg2l_wdt_start,
> +	.stop = rzg2l_wdt_stop,
> +	.ping = rzg2l_wdt_ping,
> +	.restart = rzg2l_wdt_restart,
> +};
> +
> +static void rzg2l_wdt_reset_assert_pm_disable_put(void *data)
> +{
> +	struct watchdog_device *wdev = data;
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	pm_runtime_put(wdev->parent);
> +	pm_runtime_disable(wdev->parent);
> +	reset_control_assert(priv->rstc);
> +}
> +
> +static int rzg2l_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg2l_wdt_priv *priv;
> +	unsigned long pclk_rate;
> +	struct clk *wdt_clk;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	/* Get watchdog main clock */
> +	wdt_clk = clk_get(&pdev->dev, "oscclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no oscclk");
> +
> +	priv->osc_clk_rate = clk_get_rate(wdt_clk);
> +	clk_put(wdt_clk);
> +	if (!priv->osc_clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	/* Get Peripheral clock */
> +	wdt_clk = clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> +
> +	pclk_rate = clk_get_rate(wdt_clk);
> +	clk_put(wdt_clk);
> +	if (!pclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");
> +
> +	priv->delay = F2CYCLE_NSEC(priv->osc_clk_rate) * 6 + F2CYCLE_NSEC(pclk_rate) * 9;
> +
> +	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +				     "failed to get cpg reset");
> +
> +	reset_control_deassert(priv->rstc);
> +	pm_runtime_enable(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed ret=%pe", ERR_PTR(ret));
> +		goto out_pm_get;
> +	}
> +
> +	priv->wdev.info = &rzg2l_wdt_ident;
> +	priv->wdev.ops = &rzg2l_wdt_ops;
> +	priv->wdev.parent = dev;
> +	priv->wdev.min_timeout = 1;
> +	priv->wdev.max_timeout = rzg2l_wdt_get_cycle_msec(priv->osc_clk_rate, 0xfff);
> +	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	ret = devm_add_action_or_reset(&pdev->dev,
> +				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       &priv->wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +
> +out_pm_get:
> +	pm_runtime_disable(dev);
> +	reset_control_assert(priv->rstc);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rzg2l_wdt_ids[] = {
> +	{ .compatible = "renesas,rzg2l-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
> +
> +static struct platform_driver rzg2l_wdt_driver = {
> +	.driver = {
> +		.name = "rzg2l_wdt",
> +		.of_match_table = rzg2l_wdt_ids,
> +	},
> +	.probe = rzg2l_wdt_probe,
> +};
> +module_platform_driver(rzg2l_wdt_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G2L WDT Watchdog Driver");
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_LICENSE("GPL v2");
> 

