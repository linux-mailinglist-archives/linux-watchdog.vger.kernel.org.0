Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5693026F589
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Sep 2020 07:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIRFvR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 01:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRFvR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 01:51:17 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72E7C06174A;
        Thu, 17 Sep 2020 22:51:16 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x14so5612305oic.9;
        Thu, 17 Sep 2020 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+P82EwWYIUoSRENRstNCiFfj4PUNjpisjxEcP7lCWEU=;
        b=EqDLSXNodqUFGj9nN6XM7kO77mSVwV1uCDjsaG/1GaWq6eBrWeuxz/PC5JUXR8hlpk
         5G58yPEbKDTCcX5fJ2DithWJeMRprewJjZJqOUVqHagreb3dvsYanWOSDO+bz4No/EAB
         YRMwdbqsOeSaHU0JhuWdAKjXvb6q5gznn+iYeEjw/ZcvTRSKEs3YHOA6pNbPHzN96hSK
         LLu0kP55DRccg8V3MrXM0mgQ6A26yFORagOZ6s+tbnFtthH3rIlgxQhxsdJeK+Jnie5d
         MCZrFnn4RH33LhUsjyM47sRObCRVJMebsT+0kyyDNHVTxkQOTNmipJ8rmrEOgh6/P3GP
         VFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+P82EwWYIUoSRENRstNCiFfj4PUNjpisjxEcP7lCWEU=;
        b=BxytMOp9BCWoE+TlvvHanDhLrG8KSZJGMvSyFymIe3rwxORj5g1Hi3fxqpPGQm5SMq
         yHBVDDLtNktiuv5NiflA9jsc9bCOwDuqqIvNR/i62Mrplpe2FJK6wJcuEUwB/Ww/u1PE
         AEaG/SZSlqZWuu4/AxLLD9q+rKUtE3oT5b94SWHu9mTkzU9tzV8AB/4mpsBYx3/+rBbZ
         PF6sKiOFhpZkl5VPHLhkSyUhfyX1cwDnuOVFcEpKinpAgXccKl8DLSYe6zezgt3wyASh
         to2YJQ3mT+nf/wl3rEG6MLkCv5ligOXyVQ0SLVp7DDjNF8QNFt7ysjxIKFbauo5kKhQC
         Z/Sw==
X-Gm-Message-State: AOAM533Q2NzBar5UsDUOQYwvW/oDZcJ33kYIveogr5jHzdnHSJxBmi5c
        2CNEXnDAvwd8XOmapGaAxmdPZ2DogS0=
X-Google-Smtp-Source: ABdhPJyWJsuiTBg7AtJutn2T32mEu2Rso/bjhZSNd6EIDUfozgMSuDrxfo7kc9BdaTzuDV1GSo3suA==
X-Received: by 2002:a05:6808:686:: with SMTP id k6mr7318160oig.129.1600408276042;
        Thu, 17 Sep 2020 22:51:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d63sm1882831oig.53.2020.09.17.22.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 22:51:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: Add Toshiba Visconti watchdog driver
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
References: <20200917223924.227997-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200917223924.227997-3-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <71bd6d23-8995-c006-2a4f-a7cc039924ad@roeck-us.net>
Date:   Thu, 17 Sep 2020 22:51:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917223924.227997-3-nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/20 3:39 PM, Nobuhiro Iwamatsu wrote:
> Add the watchdog driver for Toshiba Visconti series.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/watchdog/Kconfig        |   8 ++
>  drivers/watchdog/Makefile       |   1 +
>  drivers/watchdog/visconti_wdt.c | 192 ++++++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/watchdog/visconti_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ab7aad5a1e69..0cb078ce5e9d 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1004,6 +1004,14 @@ config PM8916_WATCHDOG
>  	  Say Y here to include support watchdog timer embedded into the
>  	  pm8916 module.
>  
> +config VISCONTI_WATCHDOG
> +	tristate "Toshiba Visconti series watchdog support"
> +	depends on ARCH_VISCONTI || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the watchdog timer in Toshiba
> +	  Visconti SoCs.
> +
>  # X86 (i386 + ia64 + x86_64) Architecture
>  
>  config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 97bed1d3d97c..a7747e76fd29 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -95,6 +95,7 @@ obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
>  obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>  obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>  obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
> +obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> new file mode 100644
> index 000000000000..b82849d68c4c
> --- /dev/null
> +++ b/drivers/watchdog/visconti_wdt.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 TOSHIBA CORPORATION
> + * Copyright (c) 2020 Toshiba Electronic Devices & Storage Corporation
> + * Copyright (c) 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>

Alphabetically, please.

> +
> +#define WDT_CNT			0x00
> +#define WDT_MIN			0x04
> +#define WDT_MAX			0x08
> +#define WDT_CTL			0x0c
> +#define WDT_CMD			0x10
> +#define WDT_CMD_CLEAR		0x4352
> +#define WDT_CMD_START_STOP	0x5354
> +#define WDT_DIV			0x30
> +
> +#define VISCONTI_WDT_FREQ	2000000 /* 2MHz */
> +#define WDT_DEFAULT_TIMEOUT	10U /* in seconds */
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(
> +	nowayout,
> +	"Watchdog cannot be stopped once started (default=" __MODULE_STRING(
> +		WATCHDOG_NOWAYOUT) ")");
> +
> +struct visconti_wdt_priv {
> +	struct watchdog_device wdev;
> +	void __iomem *base;
> +	u32 div;
> +};
> +
> +static int visconti_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> +
> +	writel(priv->div, priv->base + WDT_DIV);
> +	writel(0, priv->base + WDT_MIN);
> +	writel(timeout, priv->base + WDT_MAX);
> +	writel(0, priv->base + WDT_CTL);
> +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static int visconti_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	writel(1, priv->base + WDT_CTL);
> +	writel(WDT_CMD_START_STOP, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static int visconti_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdd);
> +
> +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> +
> +	return 0;
> +}
> +
> +static unsigned int visconti_wdt_get_timeleft(struct watchdog_device *wdev)
> +{
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 timeout = wdev->timeout * VISCONTI_WDT_FREQ;
> +
> +	timeout -= readl(priv->base + WDT_CNT);
> +

What happens if this is negative for whatever reason ?

> +	return timeout / VISCONTI_WDT_FREQ;
> +}
> +
> +static int visconti_wdt_set_timeout(struct watchdog_device *wdev,
> +				    unsigned int timeout)
> +{
> +	u32 val;
> +	struct visconti_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	wdev->timeout = timeout;
> +	val = wdev->timeout * VISCONTI_WDT_FREQ;
> +
> +	/* Clear counter before setting timeout because WDT expires */
> +	writel(WDT_CMD_CLEAR, priv->base + WDT_CMD);
> +	writel(val, priv->base + WDT_MAX);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info visconti_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
> +	.identity = "Visconti Watchdog",
> +};
> +
> +static const struct watchdog_ops visconti_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= visconti_wdt_start,
> +	.stop		= visconti_wdt_stop,
> +	.ping		= visconti_wdt_ping,
> +	.get_timeleft	= visconti_wdt_get_timeleft,
> +	.set_timeout	= visconti_wdt_set_timeout,
> +};
> +
> +static int visconti_wdt_probe(struct platform_device *pdev)
> +{
> +	struct watchdog_device *wdev;
> +	struct visconti_wdt_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +	int ret;
> +	unsigned long clk_freq;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Could not get clock\n");

devm_clk_get() can return -EPROBE_DEFER. In that case we don't
want to see an error message. Consider using dev_err_probe().

> +		return PTR_ERR(clk);
> +	}
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(dev, "Could not enable clock\n");
> +		return ret;
> +	}
> +
> +	clk_freq = clk_get_rate(clk);
> +	if (!clk_freq) {
> +		clk_disable_unprepare(clk);
> +		dev_err(dev, "Could not get clock rate\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->div = clk_freq / VISCONTI_WDT_FREQ;
> +
> +	/* Initialize struct watchdog_device. */
> +	wdev = &priv->wdev;
> +	wdev->info = &visconti_wdt_info;
> +	wdev->ops = &visconti_wdt_ops;
> +	wdev->parent = dev;
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 0xffffffff / VISCONTI_WDT_FREQ;
> +	wdev->timeout = min(wdev->max_timeout, WDT_DEFAULT_TIMEOUT);
> +
> +	watchdog_set_drvdata(wdev, priv);
> +	watchdog_set_nowayout(wdev, nowayout);
> +	watchdog_stop_on_unregister(wdev);
> +
> +	/* This overrides the default timeout only if DT configuration was found */
> +	ret = watchdog_init_timeout(wdev, 0, dev);
> +	if (ret)
> +		dev_warn(dev, "Specified timeout value invalid, using default\n");
> +
> +	return devm_watchdog_register_device(dev, wdev);
> +}
> +
> +static const struct of_device_id visconti_wdt_of_match[] = {
> +	{ .compatible = "toshiba,visconti-wdt", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, visconti_wdt_of_match);
> +
> +static struct platform_driver visconti_wdt_driver = {
> +	.driver = {
> +			.name = "visconti_wdt",
> +			.of_match_table = visconti_wdt_of_match,
> +		},
> +	.probe = visconti_wdt_probe,
> +};
> +module_platform_driver(visconti_wdt_driver);
> +
> +MODULE_DESCRIPTION("TOSHIBA Visconti Watchdog Driver");
> +MODULE_AUTHOR("TOSHIBA ELECTRONIC DEVICES & STORAGE CORPORATION");
> +MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp");
> +MODULE_LICENSE("GPL v2");
> 

