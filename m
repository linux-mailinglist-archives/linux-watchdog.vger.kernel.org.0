Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DA944E920
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Nov 2021 15:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhKLOsi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Nov 2021 09:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLOsi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Nov 2021 09:48:38 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB656C061766;
        Fri, 12 Nov 2021 06:45:47 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q25so12697003oiw.0;
        Fri, 12 Nov 2021 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XVVZyJjyGYSUMTGK4yBav8jpLdDWhKuf56AGqCP985o=;
        b=ZR9sfjHJgTyy/4NfMCyYnh5aSQBkpWYHz0hyrx8ebORdjLFCk42fct5t2Hv7P0NgF9
         lR+voMshmYG8fcMy2c96Qv9cv830GbV/dqecr1Zq/D9YM71j0HI65WL1i3oMe8Kk6j1F
         +PxqwKH0Eo/9eoNNqGK13RJ5v4hfvbjQrZoOOAXS3N1YvkRZvHBfrAY+AShADxs43gfZ
         Xgu79/iDZZuPlPm2iC0J7KWWkbAS5KfFhXqZHyXCZcjLdolPmj9SiVWztTxW0KHD9T0D
         xFjknIXpv81gu/MDhwv114X41w6fQ0UpEkOSSfsDV1eOoA5s7ZQMoNjWDkVYtnkG+2qH
         iDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XVVZyJjyGYSUMTGK4yBav8jpLdDWhKuf56AGqCP985o=;
        b=6vPhuLvsM8v6BJbG5lu00vXcX7IAK/riccz6XT9LS8oZ/P/+MsI+kxAo6qT6iExx+1
         nvI3BiWcheYlGbE3XqWWV1d5+hZrbUCVEOQMn1JFXV9nb1gKUADYQ+WMfkPVJ66/Fv/g
         mglg+hDU5Tb3TmxONPNvFKYzzBw0l0bvMZ3poIVSnFtncYKcF+RSnUMydw9tNCnO8e8+
         imwz0cmggB/eiCI6Hl526e2saBZSKPlv8QwWIZwQrf4XF/X6atNbYvWbSnNGlaygk97l
         yMGaqm4HkSE28IhhilWQdw9bBp7Ez8Jo5Mr8tU4f2Cp/03RTNOxCTDOzUFW9AvWCKhph
         PsOg==
X-Gm-Message-State: AOAM531ScVhxXMdVR7DlYOTo2IdqY6zENyv3Pemdo9TRPxKiNG15gTPI
        2fcJi2rqpQ7OdC28u3ImFgo302KlWFA=
X-Google-Smtp-Source: ABdhPJwCwpBVBQ2iaBk6Yd1HjeaqvsQpoL88LzYqSmz+2BtZgfPD8Yb18PkGDrugi+bTkcCk8E3rRw==
X-Received: by 2002:a05:6808:f15:: with SMTP id m21mr12049832oiw.68.1636728346926;
        Fri, 12 Nov 2021 06:45:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bh12sm1573922oib.25.2021.11.12.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:45:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Xiantao Hu <xt.hu@cqplus1.com>, wim@linux-watchdog.org,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     wells.lu@sunplus.com, qinjian@cqplus1.com
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211112105952.216280-2-xt.hu@cqplus1.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Message-ID: <1f2c5cf0-808d-92d5-487e-a3134f5d130a@roeck-us.net>
Date:   Fri, 12 Nov 2021 06:45:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105952.216280-2-xt.hu@cqplus1.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/12/21 2:59 AM, Xiantao Hu wrote:
> Sunplus SP7021 requires watchdog timer support.
> Add watchdog driver to enable this.
> 
> Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
> ---
>   MAINTAINERS                    |   6 +
>   drivers/watchdog/Kconfig       |  11 ++
>   drivers/watchdog/Makefile      |   1 +
>   drivers/watchdog/sunplus_wdt.c | 297 +++++++++++++++++++++++++++++++++
>   4 files changed, 315 insertions(+)
>   create mode 100644 drivers/watchdog/sunplus_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0bca0de0..f6a328772 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17933,6 +17933,12 @@ L:	netdev@vger.kernel.org
>   S:	Maintained
>   F:	drivers/net/ethernet/dlink/sundance.c
>   
> +SUNPLUS WATCHDOG DRIVER
> +M:	Xiantao Hu <xt.hu@cqplus1.com>
> +L:	linux-watchdog@vger.kernel.org
> +S:	Maintained
> +F:	drivers/watchdog/sunplus_wdt.c
> +
>   SUPERH
>   M:	Yoshinori Sato <ysato@users.sourceforge.jp>
>   M:	Rich Felker <dalias@libc.org>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3..1a95df8ed 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -990,6 +990,17 @@ config MSC313E_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called msc313e_wdt.
>   
> +config SUNPLUS_WATCHDOG
> +	tristate "Sunplus watchdog support"
> +	depends on ARCH_SUNPLUS || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the watchdog timer
> +	  in Sunplus SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sunplus_wdt.
> +
>   # X86 (i386 + ia64 + x86_64) Architecture
>   
>   config ACQUIRE_WDT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1bd2d6f37..d6a9e4d0e 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
>   obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
>   obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
>   obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
> +obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>   
>   # X86 (i386 + ia64 + x86_64) Architecture
>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
> new file mode 100644
> index 000000000..27f22c518
> --- /dev/null
> +++ b/drivers/watchdog/sunplus_wdt.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * sunplus Watchdog Driver
> + *
> + * Copyright (C) 2021 Sunplus Technology Co., Ltd.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/watchdog.h>
> +
> +#define WDT_CTRL                0x00
> +#define WDT_CNT                 0x04
> +
> +#define WDT_STOP				0x3877
> +#define WDT_RESUME				0x4A4B
> +#define WDT_CLRIRQ				0x7482
> +#define WDT_UNLOCK				0xAB00
> +#define WDT_LOCK				0xAB01
> +#define WDT_CONMAX				0xDEAF
> +
> +#define RBUS_WDT_RST        BIT(1)
> +#define STC_WDT_RST         BIT(4)
> +
> +#define MASK_SET(mask)		((mask) | (mask << 16))
> +
> +#define SP_WDT_MAX_TIMEOUT		11
> +#define SP_WDT_MIN_TIMEOUT		1
> +
> +#define STC_CLK				90000
> +
> +#define DEVICE_NAME		"sunplus-wdt"
> +
> +static unsigned int timeout;
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct sp_wdt_priv {
> +	struct watchdog_device wdev;
> +	void __iomem *base;
> +	void __iomem *miscellaneous;

Please find a better name for this variable. Also, unless I am
missing something, it is only used in the init function. That means
it can be passed to that function as parameter and doesn't need
to be stored in sp_wdt_priv.

> +	struct clk *clk;
> +	struct reset_control *rstc;
> +};
> +
> +static int sp_wdt_restart(struct watchdog_device *wdev,
> +			       unsigned long action, void *data)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base;
> +
> +	base = priv->base;
> +	writel(WDT_STOP, base + WDT_CTRL);
> +	writel(WDT_UNLOCK, base + WDT_CTRL);
> +	writel(0x0001, base + WDT_CNT);
> +	writel(WDT_RESUME, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +/* TIMEOUT_MAX = ffff0/90kHz =11.65,so longer than 11 seconds will time out */
> +static int sp_wdt_ping(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +	u32 count;
> +
> +	writel(WDT_STOP, base + WDT_CTRL);
> +	writel(WDT_UNLOCK, base + WDT_CTRL);
> +	/* tiemrw_cnt[3:0]cant be write,only [19:4] can be write. */
> +	count = (wdev->timeout * STC_CLK) >> 4;
> +	writel(count, base + WDT_CNT);
> +	writel(WDT_RESUME, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +static int sp_wdt_set_timeout(struct watchdog_device *wdev,
> +				   unsigned int timeout)
> +{
> +	wdev->timeout = timeout;
> +

I would assume this also needs to set the new timeout in HW if
the watchdog is running, or the watchdog could time out before
userspace sends another ping.

> +	return 0;
> +}
> +
> +static int sp_wdt_stop(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +
> +	writel(WDT_STOP, base + WDT_CTRL);
> +
> +	return 0;
> +}
> +
> +static int sp_wdt_start(struct watchdog_device *wdev)
> +{
> +	int ret;
> +
> +	ret = sp_wdt_set_timeout(wdev, wdev->timeout);

That function never returns an error, so checking for it is
pointless here.

> +	if (ret < 0)
> +		return ret;
> +
> +	sp_wdt_ping(wdev);
> +
> +	return 0;
> +}
> +
> +static unsigned int sp_wdt_get_timeleft(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +	u32 val;
> +
> +	val = readl(base + WDT_CNT);
> +	val &= 0xffff;
> +	val = val << 4;
> +
> +	return val;
> +}
> +
> +/*
> + * 1.We need to reset watchdog flag(clear watchdog interrupt) here
> + * because watchdog timer driver does not have an interrupt handler,
> + * and before enalbe STC and RBUS watchdog timeout. Otherwise,

enable

> + * the intr is always in the triggered state.
> + * 2.enable STC and RBUS watchdog timeout trigger.
> + * 3.watchdog conuter is running, need to be stopped.

counter

> + */
> +static int sp_wdt_hw_init(struct watchdog_device *wdev)
> +{
> +	struct sp_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +	void __iomem *base = priv->base;
> +	void __iomem *miscellaneous = priv->miscellaneous;
> +	u32 val;
> +
> +	writel(WDT_CLRIRQ, base + WDT_CTRL);
> +	val = readl(miscellaneous);
> +	val |= MASK_SET(STC_WDT_RST);
> +	val |= MASK_SET(RBUS_WDT_RST);
> +	writel(val, miscellaneous);
> +
> +	sp_wdt_stop(wdev);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info sp_wdt_info = {
> +	.identity = DEVICE_NAME,
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops sp_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = sp_wdt_start,
> +	.stop = sp_wdt_stop,
> +	.ping = sp_wdt_ping,
> +	.set_timeout = sp_wdt_set_timeout,
> +	.get_timeleft = sp_wdt_get_timeleft,
> +	.restart = sp_wdt_restart,
> +};
> +
> +static int sp_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sp_wdt_priv *priv;
> +	struct resource *wdt_res;
> +	struct clk *clk;
> +	int err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "Can't find clock source\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	err = clk_prepare_enable(clk);
> +	if (err) {
> +		dev_err(dev, "Clock can't be enabled correctly\n");
> +		return err;
> +	}
> +
> +	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (!IS_ERR(priv->rstc))
> +		reset_control_deassert(priv->rstc);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	wdt_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	priv->miscellaneous =
> +	    devm_ioremap(dev, wdt_res->start, resource_size(wdt_res));

Why not use devm_ioremap_resource() ? Or, for that matter,
devm_platform_ioremap_resource() like above ?

> +	if (IS_ERR(priv->miscellaneous))
> +		return PTR_ERR(priv->miscellaneous);
> +
> +	priv->wdev.info = &sp_wdt_info;
> +	priv->wdev.ops = &sp_wdt_ops;
> +	priv->wdev.timeout = SP_WDT_MAX_TIMEOUT;
> +	priv->wdev.max_timeout = SP_WDT_MAX_TIMEOUT;
> +	priv->wdev.min_timeout = SP_WDT_MIN_TIMEOUT;

THis should really use max_hw_heartbeat_ms to let the core
ping the watchdog if larger timeouts are desired.

> +	priv->wdev.parent = dev;
> +
> +	watchdog_set_drvdata(&priv->wdev, priv);
> +	sp_wdt_hw_init(&priv->wdev);
> +
> +	watchdog_init_timeout(&priv->wdev, timeout, dev);
> +	watchdog_set_nowayout(&priv->wdev, nowayout);
> +	watchdog_stop_on_reboot(&priv->wdev);
> +
> +	err = devm_watchdog_register_device(dev, &priv->wdev);

Since you call watchdog_unregister_device() below you can not use
the devm_ function here.

> +	if (unlikely(err))

This is not time critical. Drop the unlikely.

> +		return err;
> +
> +	dev_info(dev, "Watchdog enabled (timeout=%d sec%s.)\n",
> +		 priv->wdev.timeout, nowayout ? ", nowayout" : "");
> +
> +	return 0;
> +}
> +
> +static int sp_wdt_remove(struct platform_device *pdev)
> +{
> +	struct sp_wdt_priv *priv = platform_get_drvdata(pdev);
> +
> +	watchdog_unregister_device(&priv->wdev);
> +
> +	reset_control_assert(priv->rstc);
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sp_wdt_of_match[] = {
> +	{.compatible = "sunplus,sp7021-wdt", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sp_wdt_of_match);
> +
> +static int __maybe_unused sp_wdt_suspend(struct device *dev)
> +{
> +	struct sp_wdt_priv *priv = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&priv->wdev))
> +		sp_wdt_stop(&priv->wdev);
> +
> +	reset_control_assert(priv->rstc);
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sp_wdt_resume(struct device *dev)
> +{
> +	struct sp_wdt_priv *priv = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&priv->wdev))
> +		sp_wdt_start(&priv->wdev);
> +
Shouldn't the order be the opposite of the order in the suspend function ?

> +	reset_control_deassert(priv->rstc);
> +	clk_prepare_enable(priv->clk);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(sp_wdt_pm_ops, sp_wdt_suspend, sp_wdt_resume);
> +
> +static struct platform_driver sp_wdt_driver = {
> +	.probe = sp_wdt_probe,
> +	.remove = sp_wdt_remove,
> +	.driver = {
> +		   .name = DEVICE_NAME,
> +		   .of_match_table = sp_wdt_of_match,
> +		   .pm = &sp_wdt_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(sp_wdt_driver);
> +
> +MODULE_AUTHOR("Xiantao Hu <xt.hu@cqplus1.com>");
> +MODULE_DESCRIPTION("Sunplus Watchdog Timer Driver");
> +MODULE_LICENSE("GPL v2");
> 

