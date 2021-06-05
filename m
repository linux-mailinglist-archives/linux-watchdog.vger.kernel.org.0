Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7040439CAE4
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Jun 2021 22:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFEU2l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Jun 2021 16:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEU2l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Jun 2021 16:28:41 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CF9C061766;
        Sat,  5 Jun 2021 13:26:52 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id c138so53363qkg.5;
        Sat, 05 Jun 2021 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ldodqlLy3y/eVNpvcefs++kCs2YxneBb4vypES+LLME=;
        b=hQCtQqpE3BvPhmGYKLzdikim3q1I2sBwL9kZEgQSq2p2at/babJgpIRDRXtnRzR71+
         8IVOgjHkzrpRhbVxU+Iajk0fqKYe6MIGQ/lfdXDF9L6OT0YQhrNjSF0nED773RZJRCR9
         O4hlfU2e75d86UjxZd2UHeuQxC/YyFvvKphyqqx0wRjKK6kg0yF9DukqlvGAqB/Id+a5
         bYKrAEcNydyMbUh8xTc9stkp7bCvya6BB2gJlpmMqAR7REVl3U3iop0aeGCMEIgv/kgN
         c/r+sM4o8dKiPJ5d3AB+STOWvGxKWWdeiDQYQEpKeuZ3E6/LBzoQI3CVlU3PvNAdqiQz
         T14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ldodqlLy3y/eVNpvcefs++kCs2YxneBb4vypES+LLME=;
        b=plyYSUxkOUuca32a/8LzCUomx0LoOddG3w0YhvuJoovB3X3wY9boHCcn+mHtEaB6A2
         yRmhNYGxn/oIKNKF8WUSVkAqJV4pRd6/xI9prRJN8EmXKgrXocOnEpiE11SYmciTP5Bi
         dgTW/SFyCMEfHDQODg77qfpmp4iQQcdkz/BpHo/ZftNOR2MpXKIYUyKuIdDFi1b7o5mX
         OGrR++pqMZPR7PFrtraOZZJ0K7mYv2T1XJ9eLWSme8n8h7hx6Nxh0inNQZGnyz/h3SlH
         bIIWCVKMUPnCkdlKegTdp0Dhe3fLpWCihWw/q8PLStfTJD/ElhFXpPUth8Tyx0lM4a3R
         HzXA==
X-Gm-Message-State: AOAM531qPaZ06KdCVuxz5LjB4tD5ZsTmBMzrgnrcFpdF0KrTWYPa2LIg
        bkFm0E+nPsOVL1XcVx70BTQ=
X-Google-Smtp-Source: ABdhPJwEcqZ23RiEBteMw+44CRX54QqzX63Me51qo7K4/fdFpn99F+6I1UrsqxP/e2zUKranThDQHA==
X-Received: by 2002:a37:8645:: with SMTP id i66mr3284107qkd.27.1622924811930;
        Sat, 05 Jun 2021 13:26:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b189sm6513925qkc.91.2021.06.05.13.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 13:26:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 5 Jun 2021 13:26:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] watchdog: Add Mstar MSC313e WDT driver
Message-ID: <20210605202649.GA286016@roeck-us.net>
References: <20210605170441.33667-1-romain.perier@gmail.com>
 <20210605170441.33667-3-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605170441.33667-3-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 05, 2021 at 07:04:40PM +0200, Romain Perier wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> It adds a driver for the IP block handling the watchdog timer found for
> Mstar MSC313e SoCs and newer.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  MAINTAINERS                    |   1 +
>  drivers/watchdog/Kconfig       |  12 +++
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/msc313e_wdt.c | 166 +++++++++++++++++++++++++++++++++
>  4 files changed, 180 insertions(+)
>  create mode 100644 drivers/watchdog/msc313e_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0f37adb9e64..fcc10c57298c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2177,6 +2177,7 @@ F:	arch/arm/mach-mstar/
>  F:	drivers/clk/mstar/
>  F:	drivers/gpio/gpio-msc313.c
>  F:	drivers/pinctrl/pinctrl-msc313.c
> +F:	drivers/watchdog/msc313e_wdt.c
>  F:	include/dt-bindings/clock/mstar-*
>  F:	include/dt-bindings/gpio/msc313-gpio.h
>  F:	include/soc/mstar/
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 355100dad60a..4af84df1ce22 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -980,6 +980,18 @@ config VISCONTI_WATCHDOG
>  	  Say Y here to include support for the watchdog timer in Toshiba
>  	  Visconti SoCs.
>  
> +config MSC313E_WATCHDOG
> +	tristate "MStar MSC313e watchdog"
> +	depends on ARCH_MSTARV7 || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the Watchdog timer embedded
> +	  into MStar MSC313e chips. This will reboot your system when the
> +	  timeout is reached.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called msc313e_wdt.
> +
>  # X86 (i386 + ia64 + x86_64) Architecture
>  
>  config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index a7eade8b4d45..7fa392ae3000 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
>  obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>  obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>  obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
> +obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>  
>  # X86 (i386 + ia64 + x86_64) Architecture
>  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
> new file mode 100644
> index 000000000000..0d497aa0fb7d
> --- /dev/null
> +++ b/drivers/watchdog/msc313e_wdt.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MStar WDT driver
> + *
> + * Copyright (C) 2019 - 2021 Daniel Palmer
> + * Copyright (C) 2021 Romain Perier
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define REG_WDT_CLR			0x0
> +#define REG_WDT_MAX_PRD_L		0x10
> +#define REG_WDT_MAX_PRD_H		0x14
> +
> +#define MSC313E_WDT_MIN_TIMEOUT		1
> +#define MSC313E_WDT_DEFAULT_TIMEOUT	30
> +
> +static unsigned int timeout;
> +
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +struct msc313e_wdt_priv {
> +	void __iomem *base;
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
> +	if (err)
> +		return err;
> +
> +	timeout = wdev->timeout * clk_get_rate(priv->clk);
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
> +	priv->wdev.info = &msc313e_wdt_ident,
> +	priv->wdev.ops = &msc313e_wdt_ops,
> +	priv->wdev.parent = dev;
> +	priv->wdev.min_timeout = MSC313E_WDT_MIN_TIMEOUT;
> +	priv->wdev.max_timeout = U32_MAX / clk_get_rate(priv->clk);
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
> -- 
> 2.30.2
> 
