Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1F1449BC1
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 19:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbhKHSl1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 13:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhKHSl1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 13:41:27 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E61C061570;
        Mon,  8 Nov 2021 10:38:42 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso6430058otj.1;
        Mon, 08 Nov 2021 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P7MovNA1VhwkEWBceNAeb/O51bCOYaBjTIqI/etM884=;
        b=qxOQA7CF+gQF9dbeU8grSlNnuMSFQGqumJ6R5XFBB4iLbLjAhhgv8Adb6JNenbhUcX
         rSa95ftNUK7QJ8ve1mi2wUwSDgwvcIlFKbDzFAQ84cB/1d7Nz8WUSRZ9GPt8BG6MHHyD
         h6T32X4UwQsRuh/C10SUXtzeQFiviF/I9l1GpihoFg0fxuDT/aAoNDAvJDGeU8I74XFf
         7OIm4r+xv4tj9357iXQ1gAGHHoNYPA0ajU8BPVxFB/STLddqkuNS3OmES4HLkLDTbZrR
         KDPaHfrhNraZo2dNRzs7JVZQDW+11aVqUKrT22c4FGAq+t7onzXcIvqcKpNTi5H6qvBj
         d7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P7MovNA1VhwkEWBceNAeb/O51bCOYaBjTIqI/etM884=;
        b=OTWyvMCJhZclyRRKqoVf1NbswcBO0gUJnvSd+xPPDuIH1LsxBGScgL7RDjUacbSiCf
         PtqoPyEOqplccSoH64Gygf0uAyGO86xDVQiPfJd+ETHoH8TCiQ2wsWwYJNws6bIv751u
         sN3wRkXd+p8stKsVYFvyZ0KLB1z4u9dWO5BMDOG2DdhswWzeIyN8Z/s/2Y1i4DYlefF7
         2VfmPOgDluiuyEUsE0qrHF2S+zb9vgEMveTbqxGiw4CriqeEGqhKkXgoEHTmZGvAyALm
         uvZLM9fXf57lkZUJ/pib5Xaufjfz5CfxvtlcJQ64SJLa13112GXJGWyAJOGeLnQgpTWG
         +6GQ==
X-Gm-Message-State: AOAM532ze+ozmgkSAxR8Q1DxBrzQ+fniEeyRw7dLH60u7TG+0qzzTLPT
        cz/QMssu0x7gShbjnx4zyAXRIxz65v0=
X-Google-Smtp-Source: ABdhPJz/xpOcdkcsUwKgdAjN2T082srFjl9Xb2ijVBO836LvL2EWCqXhvTJgUwWoVGMUqvsKb778xw==
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr933295ote.336.1636396721731;
        Mon, 08 Nov 2021 10:38:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l21sm3196575otb.65.2021.11.08.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 10:38:41 -0800 (PST)
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
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
 <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
Message-ID: <70ba0c57-aca5-4822-631b-1eb7e7b9b3a2@roeck-us.net>
Date:   Mon, 8 Nov 2021 10:38:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/4/21 9:08 AM, Biju Das wrote:
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
>   drivers/watchdog/Kconfig     |   8 +
>   drivers/watchdog/Makefile    |   1 +
>   drivers/watchdog/rzg2l_wdt.c | 281 +++++++++++++++++++++++++++++++++++
>   3 files changed, 290 insertions(+)
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
> index 000000000000..a477f7792be8
> --- /dev/null
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -0,0 +1,281 @@
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
> +	unsigned long pclk_rate;

pclk_rate is only used in the probe function and thus not needed here.

> +	unsigned long delay;
> +};
> +
> +static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
> +{
> +	/* delay timer when change the setting register */
> +	ndelay(priv->delay);
> +}
> +
> +static int rzg2l_wdt_write(struct rzg2l_wdt_priv *priv, u32 val, unsigned int reg)
> +{
> +	int i;
> +
> +	if (reg == WDTSET)
> +		val &= WDTSET_COUNTER_MASK;
> +
> +	writel_relaxed(val, priv->base + reg);
> +
> +	for (i = 0; i < 1000; i++) {
> +		if (readl_relaxed(priv->base + reg) == val)
> +			return 0;
> +		rzg2l_wdt_wait_delay(priv);
> +	}

This needs some explanation. Under which circumstances does the chip refuse
to update the register ?

> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 time_out;
> +
> +	/* Clear Lapsed Time Register and clear Interrupt */
> +	rzg2l_wdt_write(priv, WDTINT_INTDISP, WDTINT);
> +	/* Delay timer before setting watchdog counter*/
> +	rzg2l_wdt_wait_delay(priv);
> +	/* 2 consecutive overflow cycle needed to trigger reset */
> +	time_out = (wdev->timeout / 2 * 1000000) / WDT_CYCLE_MSEC(priv->osc_clk_rate, 0);
> +	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(time_out), WDTSET);
> +
> +	return 0;

rzg2l_wdt_write() returns an error which is ignored. This functions always
returns 0, ignoring any errors, but then the calling code ignores the return
value anyway. This doesn't make sense, or at least it is very inconsistent.
Either check for errors and handle them, or if errors are ignored anyway
there is no point of checking.

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
> +	rzg2l_wdt_wait_delay(priv);
> +	/* Initialize watchdog counter register */
> +	rzg2l_wdt_write(priv, 0, WDTTIM);
> +
> +	/* Enable watchdog timer*/
> +	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +
> +	set_bit(WDOG_HW_RUNNING, &wdev->status);

This is only needed if the watchdog can not be stopped, which does not
appear to be the case here.

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
> +	rzg2l_wdt_wait_delay(priv);
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
> +static void rzg2l_wdt_reset_assert_clock_disable(void *data)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(data);
> +
> +	reset_control_assert(priv->rstc);
> +}
> +
> +static int rzg2l_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg2l_wdt_priv *priv;
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
> +	/* Get Peripheral clock */
> +	wdt_clk = devm_clk_get(&pdev->dev, "pclk");
> +	if (IS_ERR(wdt_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(wdt_clk), "no pclk");
> +
> +	priv->pclk_rate = clk_get_rate(wdt_clk);
> +	if (!priv->pclk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "pclk rate is 0");
> +
> +	priv->delay = F2CYCLE_NSEC(priv->osc_clk_rate) * 6 + F2CYCLE_NSEC(priv->pclk_rate) * 9;
> +
> +	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
> +			"failed to get cpg reset");
> +
> +	reset_control_deassert(priv->rstc);
> +	ret = devm_add_action_or_reset(&pdev->dev,
> +				       rzg2l_wdt_reset_assert_clock_disable,
> +				       &priv->wdev);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "failed to get reset");
> +
> +	pm_runtime_enable(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed");
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
> +	platform_set_drvdata(pdev, priv);

Is this used anywhere ?

> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_set_restart_priority(&priv->wdev, 0);

0 is the default restart priority (ie this is a reset of last resort).
It does not have to be set explicitly.

> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout invalid, using default");
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> +	if (ret < 0)
> +		goto out_pm_disable;
> +
> +	return 0;
> +
> +out_pm_disable:
> +	pm_runtime_put(dev);
> +out_pm_get:
> +	pm_runtime_disable(dev);
> +
> +	return ret;
> +}
> +
> +static int rzg2l_wdt_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +

This is the wrong order. The watchdog device has to be removed first,
meaning you can not use devm_watchdog_register_device(), or you would
have to use devm_add_action_or_reset() to call the runtime pm put/disable
functions.

> +	return 0;
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
> +	.remove = rzg2l_wdt_remove,
> +};
> +module_platform_driver(rzg2l_wdt_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G2L WDT Watchdog Driver");
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_LICENSE("GPL v2");
> 

