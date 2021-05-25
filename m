Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22953909F3
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 21:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhEYTx5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 15:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhEYTx5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 15:53:57 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4133FC061574;
        Tue, 25 May 2021 12:52:27 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v22so31427013oic.2;
        Tue, 25 May 2021 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XnGwFVYKuTF3E6gS1UhFzJdmr63qnPmbYt1Cj2BqCJ4=;
        b=coLzNzxzJumVExKt53aKijv6sLzjvB5lhh5BpP7SPGsjKr8SvzFdj1HuUQ2e7fenFz
         apNq6oua0Fsl11AZFGjHO7Zp2bNymOAFnJjjqIlPuFHHju5JFc7/4DB4sfGBtdw2lAsv
         6IgUaddQQqc2Sq5Ql0yYzkTnARrz68M7ICXzPKeD5oJ72al2qcoIhGVUv/91AdO1Z+V/
         7vDP4QlOAijSf6WF4DvzVa73AS/pQHw6ea8RUrddl48RT96o8X6tc32dh8aZtc/4E9T1
         Dsuz/4bTqoOFA5G3M/mV8Vls99VjGfrvF/eV/+fPpVj9Ln7kTT2iRqazGMw+hCvBb2Da
         MNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XnGwFVYKuTF3E6gS1UhFzJdmr63qnPmbYt1Cj2BqCJ4=;
        b=WLqGWshWlKTWZcAFJDPMv3atlBCW43N7DdO9kljSvqECaWEbNWpXEE77sLcu0eVFlY
         bE4ziH9dYbuTYCtHq6OyiUokR2Ac/aLzxd1HPXekl/Jf8uu/ZeSCywEA3VuQNwjhIliD
         Fl56i2CFaxQqqVoWYDa4YbyzsenD2vOQsq/ITqqot5U4D/e5ppO7WsYxv3VbFmApJeUB
         QJclcDaM2I032/IKXkv2fx3d8OeECqaGBYQsebUxY0RJO0pCQnJhbuoGIlqnpJrgOKB/
         z6jQMDXpJkuqFALSB3WoadzG6+XWtdtuF4tc516NdgmML/rJOpIz6hpsfAq/YgALqIxz
         AAtg==
X-Gm-Message-State: AOAM530goj7y8pCotcQpJToE++ZNIplrs3YeJ/WoYSrwR4FiIioHJZmP
        /t6wSiT4t9UtdAUhWK1CUlm78kFCC1I=
X-Google-Smtp-Source: ABdhPJyDnB5L7DGNR11O2VJhqwjsGbMueyJ0rdE6WjOIENSUJX74OSoIW7L9ovgjXIEh38SM58hBTg==
X-Received: by 2002:a54:458b:: with SMTP id z11mr14662440oib.177.1621972346269;
        Tue, 25 May 2021 12:52:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i4sm2956760oih.13.2021.05.25.12.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 12:52:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Romain Perier <romain.perier@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210525184449.57703-1-romain.perier@gmail.com>
 <20210525184449.57703-3-romain.perier@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] watchdog: Add Mstar MSC313e WDT driver
Message-ID: <5ce3b5a5-1500-0d95-623e-299e7b1eb43b@roeck-us.net>
Date:   Tue, 25 May 2021 12:52:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525184449.57703-3-romain.perier@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/25/21 11:44 AM, Romain Perier wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> It adds a driver for the IP block handling the watchdog timer found for
> Mstar MSC313e SoCs and newer.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>   MAINTAINERS                    |   1 +
>   drivers/watchdog/Kconfig       |  13 +++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/msc313e_wdt.c | 173 +++++++++++++++++++++++++++++++++
>   4 files changed, 188 insertions(+)
>   create mode 100644 drivers/watchdog/msc313e_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0f37adb9e64..fcc10c57298c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2177,6 +2177,7 @@ F:	arch/arm/mach-mstar/
>   F:	drivers/clk/mstar/
>   F:	drivers/gpio/gpio-msc313.c
>   F:	drivers/pinctrl/pinctrl-msc313.c
> +F:	drivers/watchdog/msc313e_wdt.c
>   F:	include/dt-bindings/clock/mstar-*
>   F:	include/dt-bindings/gpio/msc313-gpio.h
>   F:	include/soc/mstar/
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 355100dad60a..f53634ea0de6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -980,6 +980,19 @@ config VISCONTI_WATCHDOG
>   	  Say Y here to include support for the watchdog timer in Toshiba
>   	  Visconti SoCs.
>   
> +config MSC313E_WATCHDOG
> +	tristate "MStar MSC313e watchdog"
> +	depends on ARCH_MSTARV7 || COMPILE_TEST
> +	depends on OF
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the Watchdog timer embedded
> +	  into MStar MSC313e chips. This will reboot your system when the
> +	  timeout is reached.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called msc313e_wdt.
> +
>   # X86 (i386 + ia64 + x86_64) Architecture
>   
>   config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index a7eade8b4d45..7fa392ae3000 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>   obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>   obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
> +obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
> new file mode 100644
> index 000000000000..434259256967
> --- /dev/null
> +++ b/drivers/watchdog/msc313e_wdt.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MStar WDT driver
> + *
> + * Copyright (C) 2019 - 2021 Daniel Palmer
> + * Copyright (C) 2021 Romain Perier
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/module.h>
> +#include <linux/watchdog.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>

Alphabetic order, please. Also, pelase drop unneeded include files.
The driver doesn't support interrupts, so any interrupt related
include file is unnecessary. I also don't see any devicetree specific
code except for of_device_id, and that is declared in mod_devicetable.h,
not in an of_xxx.h include file.

> +
> +#define REG_WDT_CLR			0x0
> +#define REG_WDT_MAX_PRD_L		0x10
> +#define REG_WDT_MAX_PRD_H		0x14
> +
> +#define MSC313E_WDT_DEFAULT_TIMEOUT	30
> +/* Supports 1 - 350 sec */

Doesn't that depend on the clock freqneucy ?
More on that see below.

> +#define MSC313E_WDT_MIN_TIMEOUT		1
> +#define MSC313E_WDT_MAX_TIMEOUT		350
> +
> +static unsigned int timeout;
> +
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +struct msc313e_wdt_priv {
> +	void __iomem *base;
> +	struct device *dev;

I don't immediately see where 'dev' is used.

> +	struct watchdog_device wdev;
> +	struct clk *clk;
> +};
> +
> +static int msc313e_wdt_start(struct watchdog_device *wdev)
> +{
> +	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	u32 timeout;
> +	int err;
> +
> +	err = clk_prepare_enable(priv->clk);
> +	if (err) {
> +		dev_err(priv->dev, "failed to enable clock\n");

Ah, here. I am not sure if I like that error message - it is going to be
persistent and may create a lot of noise if it is ever seen, and pretty much
useless otherwise. Either case, if you insist on the message, I'd suggest
to use wdev->parent.

> +		return err;
> +	}
> +	timeout = wdev->timeout * clk_get_rate(priv->clk);

How is it guaranteed that this won't overflow ? The maximum timeout is not
tied to the clock frequency. This will overflow if the clock frequency is
above 0xffffffff / 350 = 12271335 Hz and the timeout is sufficiently large.

> +	writew(timeout & 0xffff, priv->base + REG_WDT_MAX_PRD_L);
> +	writew((timeout >> 16) & 0xffff, priv->base + REG_WDT_MAX_PRD_H);
> +	writew(1, priv->base + REG_WDT_CLR);
> +	return 0;
> +}
> +
> +static int msc313e_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	writew(1, priv->base + REG_WDT_CLR);
> +	return 0;
> +}
> +
> +static int msc313e_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	writew(0, priv->base + REG_WDT_MAX_PRD_L);
> +	writew(0, priv->base + REG_WDT_MAX_PRD_H);
> +	writew(0, priv->base + REG_WDT_CLR);
> +	clk_disable_unprepare(priv->clk);
> +	return 0;
> +}
> +
> +static int msc313e_wdt_settimeout(struct watchdog_device *wdev, unsigned int new_time)
> +{
> +	wdev->timeout = new_time;
> +
> +	return msc313e_wdt_start(wdev);
> +}
> +
> +static const struct watchdog_info msc313e_wdt_ident = {
> +	.identity = "MSC313e watchdog",
> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +};
> +
> +static const struct watchdog_ops msc313e_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = msc313e_wdt_start,
> +	.stop = msc313e_wdt_stop,
> +	.ping = msc313e_wdt_ping,
> +	.set_timeout = msc313e_wdt_settimeout,
> +};
> +
> +static const struct of_device_id msc313e_wdt_of_match[] = {
> +	{ .compatible = "mstar,msc313e-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, msc313e_wdt_of_match);
> +
> +static int msc313e_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct msc313e_wdt_priv *priv;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "No input clock\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	priv->dev = dev;
> +	priv->wdev.info = &msc313e_wdt_ident,
> +	priv->wdev.ops = &msc313e_wdt_ops,
> +	priv->wdev.parent = dev;
> +	priv->wdev.min_timeout = MSC313E_WDT_MIN_TIMEOUT;
> +	priv->wdev.max_timeout = MSC313E_WDT_MAX_TIMEOUT;
> +	priv->wdev.timeout = MSC313E_WDT_DEFAULT_TIMEOUT;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +
> +	watchdog_init_timeout(&priv->wdev, timeout, dev);
> +	watchdog_stop_on_reboot(&priv->wdev);
> +	watchdog_stop_on_unregister(&priv->wdev);
> +
> +	return devm_watchdog_register_device(dev, &priv->wdev);
> +}
> +
> +static int __maybe_unused msc313e_wdt_suspend(struct device *dev)
> +{
> +	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&priv->wdev))
> +		msc313e_wdt_stop(&priv->wdev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused msc313e_wdt_resume(struct device *dev)
> +{
> +	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&priv->wdev))
> +		msc313e_wdt_start(&priv->wdev);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(msc313e_wdt_pm_ops, msc313e_wdt_suspend, msc313e_wdt_resume);
> +
> +static struct platform_driver msc313e_wdt_driver = {
> +	.driver = {
> +		.name = "msc313e-wdt",
> +		.of_match_table = msc313e_wdt_of_match,
> +		.pm = &msc313e_wdt_pm_ops,
> +	},
> +	.probe = msc313e_wdt_probe,
> +};
> +module_platform_driver(msc313e_wdt_driver);
> +
> +MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
> +MODULE_DESCRIPTION("Watchdog driver for MStar MSC313e");
> +MODULE_LICENSE("GPL v2");
> 

