Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B66344D4F5
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 11:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhKKKYS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 05:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhKKKYR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 05:24:17 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5EFC061766;
        Thu, 11 Nov 2021 02:21:29 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso8219170otj.1;
        Thu, 11 Nov 2021 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TL720rXSnf5d2Shfld2D2y28GE1JOIxtiWFnj+LxCoo=;
        b=n22rPHZwibKrpKKqbxXvqjok0+q/mihRvyN/YCOYJHuv7Wrd0P7hmnijVAQTzsqGlI
         VdOoVg5okH/r3KX3lR1VmxiPWtxj6B0QUeEWv186NjBi/93G11fF0g5NPl4kF/24D4sL
         RpdHFw+ttRDCRkZHX5irEXbFSBgc3nxjLKFAz+P0TtunHFplR3e/wBioPRt70f4+XrW5
         soFPCvhRBcbCMGx8jslCQ6cGDZDnDy4JoLVsYcbXrWj2KXumaP4xlidDCoqSvQvXO6Rr
         ZkfFDtPb+9oFtio5dAX9ICaTVk/GxniCvNpHvsIbs1FJvmi0ZRM6KS8GrNvYVuhXV6Pq
         AXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TL720rXSnf5d2Shfld2D2y28GE1JOIxtiWFnj+LxCoo=;
        b=tBnbk0apssu1SMkrkafp6lZG6zBXzBqxU1XpW8+QJX0wTPtCyKWXl+LFGg8t0m8ct0
         7KaL4p9sZ3qqAofU0+QU8vc9JAlGVzkKwY+JskmvP/b/6gUDN9Srd3449WF4Y9nzcLvw
         LAtXum9qkaMgjIzXn84c1jPNfgtZIIkk8/l/ovHDm2nAibSe+F8NcwEMq4afH5qadIdx
         KxNgH/AswqBaPybR55frh0sTXirlB+HEJjeTH8o+twohLbHvK3UIrR+o9jcxo3pFl0Bu
         xTGVZh88nQrd1awwMZTY5hwJm1IJXGQrH2E9amMDeMZizsVcq5kanTvVHqJocDqlNE2f
         OkJQ==
X-Gm-Message-State: AOAM531aq8UMtKT2JhqOW9mn4gQanFZQLtxT+SSWKtz+6j5XVeaoYUxL
        /DurpYT1wMfGsLyaD3ZQrsYj1BFfNZQ=
X-Google-Smtp-Source: ABdhPJziYuWmM8L1AHANBbzbS5+S7N2ejWPt8tpf82wb4nhfZprIrl4gmocq0Yp+pYNqhYa5n2cZMQ==
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr5075114oto.312.1636626088111;
        Thu, 11 Nov 2021 02:21:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2sm574746oic.35.2021.11.11.02.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:21:27 -0800 (PST)
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
References: <20211111085225.7090-1-biju.das.jz@bp.renesas.com>
 <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Message-ID: <7fd9b931-32f1-73a7-7750-a4224cf89500@roeck-us.net>
Date:   Thu, 11 Nov 2021 02:21:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/21 12:52 AM, Biju Das wrote:
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
> ---
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
>   drivers/watchdog/rzg2l_wdt.c | 262 +++++++++++++++++++++++++++++++++++
>   3 files changed, 271 insertions(+)
>   create mode 100644 drivers/watchdog/rzg2l_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..34da309a7afd 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -895,6 +895,14 @@ config RENESAS_RZAWDT
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
> index 1bd2d6f37c53..e7e8ce546814 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>   obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
>   obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>   obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
> +obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
>   obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
>   obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>   obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> new file mode 100644
> index 000000000000..75102310796d
> --- /dev/null
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -0,0 +1,262 @@
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
> +#define WDT_CYCLE_MSEC(f, wdttime)	((1024 * 1024 * (((u64)wdttime) + 1)) / \
> +					 ((f) / 1000000))
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
> +	time_out = (wdev->timeout / 2 * 1000000) / WDT_CYCLE_MSEC(priv->osc_clk_rate, 0);
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
> +	wdt_clk = devm_clk_get(&pdev->dev, "oscclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no oscclk");
> +
> +	priv->osc_clk_rate = clk_get_rate(wdt_clk);
> +	if (!priv->osc_clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "oscclk rate is 0");
> +
> +	devm_clk_put(&pdev->dev, wdt_clk);
> +

If the clocks are not needed anymore at this time, you should not use
devm_ functions to get them. The intent for devm_ functions is automatic
release in the remove function. If that isn't used, clk_get/clk_put
is good enough, and the overhead of devm_ functions is not worth the
complexity.

Guenter

> +	/* Get Peripheral clock */
> +	wdt_clk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> +
> +	pclk_rate = clk_get_rate(wdt_clk);
> +	if (!pclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");
> +
> +	devm_clk_put(&pdev->dev, wdt_clk);
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
> +	ret = devm_add_action_or_reset(&pdev->dev,
> +				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       &priv->wdev);
> +	if (ret < 0)
> +		goto out_reset;

_or_reset implies that the action is taken on failure, so there is not need
to do it again.

> +
> +	priv->wdev.info = &rzg2l_wdt_ident;
> +	priv->wdev.ops = &rzg2l_wdt_ops;
> +	priv->wdev.parent = dev;
> +	priv->wdev.min_timeout = 1;
> +	priv->wdev.max_timeout = WDT_CYCLE_MSEC(priv->osc_clk_rate, 0xfff);
> +	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

	return ret;

is good enough, or even
	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);

> +
> +out_reset:
> +	pm_runtime_put(dev);
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

