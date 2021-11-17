Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192FA453FFC
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 06:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhKQF1F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 00:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhKQF1E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 00:27:04 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCA8C061570;
        Tue, 16 Nov 2021 21:24:06 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id r26so3827099oiw.5;
        Tue, 16 Nov 2021 21:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q3TrBI96Vc01VQX7u+AAwaZlrQN8WLnrpPHzPDz/QaM=;
        b=UgJoILtebbQwOXTf91zAnarao1cPxUSmkKFHxuJIs4ty67tg+6LVvD/x6pVIS6hd5T
         AxL1KwiGuI3ePEVSViSWqgFFTJE1FWw+iY4eu7lbE6cECHaxo/FYcMaEs5/n8GUgAL9n
         lfIItaI/ZmF1Wv2d2748HAU3Wul1CTqdDzLTnnl5KJZ9PxXW3AXDVQ56v8sRKelShTdV
         wui3hAdn5RJ5pdIMt1Xp6aGYRpi6uaAHAqP6wnmim7EZT12714VtiYmyC5uFU6CWSvvq
         k9nNQbLJBPkpSFYmeccCh0qqGwG7SrflhL7zLn/wvhZrnuJrN5Slv9s7ZJSsaOMBTOdm
         VA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Q3TrBI96Vc01VQX7u+AAwaZlrQN8WLnrpPHzPDz/QaM=;
        b=nfl/S2dipqO9JZ1D+NkrTU3qBr/XZToTxfDQBbSIHQ4RAjYewkae8Xh4tPu09o/Bfz
         OSY0oSJl1BgDyBiuV/G0zNUVPVbl7kAnBTDB+iGqfTOltIFyPobrCyuSvn4GJv+hw6W2
         zx+pT6yaBGdrIPaY8zi5Py5OJ6jauC/3SWCfzcYi4GQD6K5iA4NwyCf7QGkuOJB/AK0s
         sIuHOQnyqOuMDbUb/tZglBDmAEhu84TpBKf/H5S++K1jRtO5nCL4yI83/yQjNi6wur4t
         X5MQpMmw9uAmfp0Ci9LuFn6buLrBDJZiFYIPEZNxdxUHu9xOsGzI8ih3Q7Q+4enkZg9o
         Se6w==
X-Gm-Message-State: AOAM530QIBKv9uassFAVBLV4WVGtskXx+WWhKME5O5g5gIrI28Uus6aN
        ZEgSK17kn290w/qlWUfZTpo=
X-Google-Smtp-Source: ABdhPJzMLXJlS8KDeFAPyYOrAZxrVv5VPbfn9e9c4OSLK5ZbKaSQhcBSeSt6mMvjbkG1sIlYexzwtg==
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr11580671oih.162.1637126646036;
        Tue, 16 Nov 2021 21:24:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u40sm2555491oiw.56.2021.11.16.21.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 21:24:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 16 Nov 2021 21:24:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Message-ID: <20211117052404.GD215087@roeck-us.net>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111115427.8228-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 11, 2021 at 11:54:27AM +0000, Biju Das wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V1->V2:
>  * started using clk_get/put instead of devm_clk_get/put
>  * Moved devm_add_action_or_reset after set_drvdata() and 
>  * removed redundant action on devm_add_action_or_reset() failure.
> RFC->V1
>  * Removed pclk_rate from priv.
>  * rzg2l_wdt_write() returns void and Removed tiemout related to register update 
>  * rzg2l_wdt_init_timeout() returns void and removed delays.
>  * removed set_bit(WDOG_HW_RUNNING,..) as we can stop watchdog
>  * renamed reset_assert_clock_disable->reset_assert_pm_disable_put
>  * started using devm_reset_control_get_exclusive()
>  * removed platform_set_drvdata(pdev, priv) as there is no user
>  * removed watchdog_set_restart_priority(&priv->wdev, 0) as 0 is the default.
>  * removed remove callback as it is empty.
> ---
>  drivers/watchdog/Kconfig     |   8 ++
>  drivers/watchdog/Makefile    |   1 +
>  drivers/watchdog/rzg2l_wdt.c | 255 +++++++++++++++++++++++++++++++++++
>  3 files changed, 264 insertions(+)
>  create mode 100644 drivers/watchdog/rzg2l_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..34da309a7afd 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -895,6 +895,14 @@ config RENESAS_RZAWDT
>  	  This driver adds watchdog support for the integrated watchdogs in the
>  	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
>  
> +config RENESAS_RZG2LWDT
> +	tristate "Renesas RZ/G2L WDT Watchdog"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  This driver adds watchdog support for the integrated watchdogs in the
> +	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
> +
>  config ASPEED_WATCHDOG
>  	tristate "Aspeed BMC watchdog support"
>  	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1bd2d6f37c53..e7e8ce546814 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>  obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
>  obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>  obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
> +obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
>  obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
>  obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
>  obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
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
> -- 
> 2.17.1
> 
