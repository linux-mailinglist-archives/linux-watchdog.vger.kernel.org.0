Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420AA462A61
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Nov 2021 03:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhK3C2E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Nov 2021 21:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhK3C2E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Nov 2021 21:28:04 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E365C061574;
        Mon, 29 Nov 2021 18:24:45 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso28244093ota.5;
        Mon, 29 Nov 2021 18:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LKuitfPBzl3W5gG9ygHjKZANi7HbtgTms5KZ4viVdsY=;
        b=O1//axtdLceXNX5e4JmG6ufDfUBY1shgVqo/IXZdUlZk7tT32CbvfX31GlJA71Tgxl
         huwbJ5ceEYM2sRbJo4WPfEpn12gP6BScBQSQdOBdykTcxdrX9EeWhvfp43oOb/yBO8oB
         trJwQSGwJQbZ/4MGkAEbQ6RuitwvIVuEj5xB7zQjZ8bRZLRmUmScOa6JVdogT0wPDKmC
         qiSjF4KZyiB1KqAfEveXdySoa67RAvFzU3N2qiELQ4ratjIRlarDt3nVJ1gVwHL9HSO3
         OiPU8EVTO8krAWyXf1gn5Gsk2h8V3b512WZTxvmALq/+n6VzyweKGsvDRy/ztmFDYQI3
         lGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LKuitfPBzl3W5gG9ygHjKZANi7HbtgTms5KZ4viVdsY=;
        b=P7vUhA1Koyl2ypavlx9ea4WRWleU8F9s5m9AEthrsyiOIt8kZ9p3pUAh4LkGUMtiWC
         QTTJ7UQbed2Cn4AASYcc6LQHIxuzOg781Rw+1yz7Y8viaykVEFzF1YtmQtU9nm6t09vo
         OJRVsRVmAFZWSWCW1/q1jXrmVZERgJfqstuZ0hzpPL/hR883yd7U/4rtmYCDBlKp9xRd
         WPFH68vIfpVrMTBQAeqGLjNeVbI+b7i2aaUre12HK+bWr4+E+9RnbKj6Z3Fd++/iiTS6
         JV0aP2YAvpwIRWTWHC5H+slqxTFIRwh9wA1n6TljqewRahw7I6HTxhgY3XcJm+1wAZhR
         qO0Q==
X-Gm-Message-State: AOAM53280fWbmeHHVTJLa3HTcOB9z/ya+Jb5Vb0IBUSQDw3RpCX2RHuM
        vBE7CMFKImDptFHWCzCYTggbuUECAZM=
X-Google-Smtp-Source: ABdhPJydxeXA3Zq+UfPam73BJEi22KcSabjvI2O9xaP7CULsfWx6fWoR727/StcgZ/X21veRHoGocw==
X-Received: by 2002:a9d:2002:: with SMTP id n2mr47534153ota.95.1638239084716;
        Mon, 29 Nov 2021 18:24:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb8sm3467527oib.9.2021.11.29.18.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 18:24:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
 <20211122113554.15990-3-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1c369614-0a8d-dfea-d9b6-2d299b2b60c8@roeck-us.net>
Date:   Mon, 29 Nov 2021 18:24:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122113554.15990-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/22/21 3:35 AM, Biju Das wrote:
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
>   drivers/watchdog/rzg2l_wdt.c | 255 +++++++++++++++++++++++++++++++++++
>   3 files changed, 264 insertions(+)
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
> index 000000000000..77f1cfc5ecf6
> --- /dev/null
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -0,0 +1,255 @@
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

This macro generates a 64 bit divide operation - as noticed by 0-day -
and will have to be rewritten.

Guenter

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
> +	priv->wdev.max_timeout = WDT_CYCLE_MSEC(priv->osc_clk_rate, 0xfff);
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

