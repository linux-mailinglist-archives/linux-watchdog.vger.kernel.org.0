Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FEE2FD924
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 20:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392309AbhATTHp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 14:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392520AbhATTE2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 14:04:28 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C02C0613D6;
        Wed, 20 Jan 2021 11:03:48 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 63so1937642oty.0;
        Wed, 20 Jan 2021 11:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EL19vrBZEfjkKDNzr30gd4SAfdcULRu5rKALXpQ+hvQ=;
        b=TXe63yNKsDS+1PWQiybqHj/8n1U7jTwAO6DGQ3KHdACF71IfnwKMJ8BUzq2TAMKqJM
         FoqwtHxHOs6QlviYuW1aoyTXZeHvWer9Hy5CiQTPk4Zd/kiJFJc/bqRCVQKZS8S01bgx
         J1zwcymuTu6/iwr9vhO+CVh7FWhQozmEMGfS91M9xAa7ReCIfqmryp9jLVDum9Vnm2Mh
         5tpMayHsfsPA7s7ILzqWMTUZ0LODN7SzzBXQuZUjDE4zN1dTQbY04hvukNuTX3GcO0ux
         35rLALPpQa7PpMbPFZKgOaPI9A3rjZn1SRuakY982U1gbEKLiGAkd6Tnf5AfwFR4pukl
         PlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EL19vrBZEfjkKDNzr30gd4SAfdcULRu5rKALXpQ+hvQ=;
        b=cq2AzeNKDCc+DhIdWCgqxxMBY7HwEJG4Ib29zrnzq5xO0jb+rebuJ5bMujebh3CH46
         7ansNJfC1BJ0DPNJzQR/uHtReoA43iJJFESFq3WWTaxsdTOcwQVONzVXRbeeC/6H8URS
         WjFyAhc/q7DU7de9YZ4AweqHzxhis8thGRIWl35zhtbX3/XDqYpRMA+vM8DZEg94be6a
         9MgVQtcGCoNDo1xjGvApSHMpwpYvtK2OTlskkvHxc2Bc2Eli3OTWkDeji3qD9N/gfE8V
         LWRbDOG8zdhMfFdbeh8VeeAXrTWbUs1rsYhpq2ppTbS6eQv2vCLtAkEJDYkDC3MJk2CP
         Ddmw==
X-Gm-Message-State: AOAM533bLUVXPk6O1i5U6Mp9sOYRsKneVKj9Idrtl12GLWtHv+XpSNAV
        haXg+/hHkZCZ1SNrkB8w/JE=
X-Google-Smtp-Source: ABdhPJy1LQwul9rzb3qgkwsqXrRi7DOqe2GfijpewV75SCcjC5cvkYMeTGM4licow9l6WSpcoLwwLQ==
X-Received: by 2002:a9d:7a48:: with SMTP id z8mr8056207otm.146.1611169427653;
        Wed, 20 Jan 2021 11:03:47 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t16sm169453otc.30.2021.01.20.11.03.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 11:03:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 20 Jan 2021 11:03:45 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH 4/5] watchdog: remove tango driver
Message-ID: <20210120190345.GD162747@roeck-us.net>
References: <20210120162745.61268-1-arnd@kernel.org>
 <20210120162745.61268-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120162745.61268-5-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 05:27:44PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The tango platform is getting removed, so the driver is no
> longer needed.
> 
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig      |  11 --
>  drivers/watchdog/Makefile     |   1 -
>  drivers/watchdog/tangox_wdt.c | 209 ----------------------------------
>  3 files changed, 221 deletions(-)
>  delete mode 100644 drivers/watchdog/tangox_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c36f8233f60b..10efbb351f14 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -254,17 +254,6 @@ config MENZ069_WATCHDOG
>  	  This driver can also be built as a module. If so the module
>  	  will be called menz069_wdt.
>  
> -config TANGOX_WATCHDOG
> -	tristate "Sigma Designs SMP86xx/SMP87xx watchdog"
> -	select WATCHDOG_CORE
> -	depends on ARCH_TANGO || COMPILE_TEST
> -	depends on HAS_IOMEM
> -	help
> -	  Support for the watchdog in Sigma Designs SMP86xx (tango3)
> -	  and SMP87xx (tango4) family chips.
> -
> -	  This driver can be built as a module. The module name is tangox_wdt.
> -
>  config WDAT_WDT
>  	tristate "ACPI Watchdog Action Table (WDAT)"
>  	depends on ACPI
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 7a95b280cd9f..1ff40d6a027f 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -210,7 +210,6 @@ obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
>  obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
>  obj-$(CONFIG_DA9063_WATCHDOG) += da9063_wdt.o
>  obj-$(CONFIG_GPIO_WATCHDOG)	+= gpio_wdt.o
> -obj-$(CONFIG_TANGOX_WATCHDOG) += tangox_wdt.o
>  obj-$(CONFIG_WDAT_WDT) += wdat_wdt.o
>  obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>  obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
> diff --git a/drivers/watchdog/tangox_wdt.c b/drivers/watchdog/tangox_wdt.c
> deleted file mode 100644
> index 1afb0e9d808c..000000000000
> --- a/drivers/watchdog/tangox_wdt.c
> +++ /dev/null
> @@ -1,209 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - *  Copyright (C) 2015 Mans Rullgard <mans@mansr.com>
> - *  SMP86xx/SMP87xx Watchdog driver
> - */
> -
> -#include <linux/bitops.h>
> -#include <linux/clk.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/mod_devicetable.h>
> -#include <linux/platform_device.h>
> -#include <linux/watchdog.h>
> -
> -#define DEFAULT_TIMEOUT 30
> -
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout,
> -		 "Watchdog cannot be stopped once started (default="
> -		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -static unsigned int timeout;
> -module_param(timeout, int, 0);
> -MODULE_PARM_DESC(timeout, "Watchdog timeout");
> -
> -/*
> - * Counter counts down from programmed value.  Reset asserts when
> - * the counter reaches 1.
> - */
> -#define WD_COUNTER		0
> -
> -#define WD_CONFIG		4
> -#define WD_CONFIG_XTAL_IN	BIT(0)
> -#define WD_CONFIG_DISABLE	BIT(31)
> -
> -struct tangox_wdt_device {
> -	struct watchdog_device wdt;
> -	void __iomem *base;
> -	unsigned long clk_rate;
> -	struct clk *clk;
> -};
> -
> -static int tangox_wdt_set_timeout(struct watchdog_device *wdt,
> -				  unsigned int new_timeout)
> -{
> -	wdt->timeout = new_timeout;
> -
> -	return 0;
> -}
> -
> -static int tangox_wdt_start(struct watchdog_device *wdt)
> -{
> -	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
> -	u32 ticks;
> -
> -	ticks = 1 + wdt->timeout * dev->clk_rate;
> -	writel(ticks, dev->base + WD_COUNTER);
> -
> -	return 0;
> -}
> -
> -static int tangox_wdt_stop(struct watchdog_device *wdt)
> -{
> -	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
> -
> -	writel(0, dev->base + WD_COUNTER);
> -
> -	return 0;
> -}
> -
> -static unsigned int tangox_wdt_get_timeleft(struct watchdog_device *wdt)
> -{
> -	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
> -	u32 count;
> -
> -	count = readl(dev->base + WD_COUNTER);
> -
> -	if (!count)
> -		return 0;
> -
> -	return (count - 1) / dev->clk_rate;
> -}
> -
> -static const struct watchdog_info tangox_wdt_info = {
> -	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> -	.identity = "tangox watchdog",
> -};
> -
> -static int tangox_wdt_restart(struct watchdog_device *wdt,
> -			      unsigned long action, void *data)
> -{
> -	struct tangox_wdt_device *dev = watchdog_get_drvdata(wdt);
> -
> -	writel(1, dev->base + WD_COUNTER);
> -
> -	return 0;
> -}
> -
> -static const struct watchdog_ops tangox_wdt_ops = {
> -	.start		= tangox_wdt_start,
> -	.stop		= tangox_wdt_stop,
> -	.set_timeout	= tangox_wdt_set_timeout,
> -	.get_timeleft	= tangox_wdt_get_timeleft,
> -	.restart	= tangox_wdt_restart,
> -};
> -
> -static void tangox_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
> -static int tangox_wdt_probe(struct platform_device *pdev)
> -{
> -	struct tangox_wdt_device *dev;
> -	u32 config;
> -	int err;
> -
> -	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> -	if (!dev)
> -		return -ENOMEM;
> -
> -	dev->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(dev->base))
> -		return PTR_ERR(dev->base);
> -
> -	dev->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(dev->clk))
> -		return PTR_ERR(dev->clk);
> -
> -	err = clk_prepare_enable(dev->clk);
> -	if (err)
> -		return err;
> -	err = devm_add_action_or_reset(&pdev->dev,
> -				       tangox_clk_disable_unprepare, dev->clk);
> -	if (err)
> -		return err;
> -
> -	dev->clk_rate = clk_get_rate(dev->clk);
> -	if (!dev->clk_rate)
> -		return -EINVAL;
> -
> -	dev->wdt.parent = &pdev->dev;
> -	dev->wdt.info = &tangox_wdt_info;
> -	dev->wdt.ops = &tangox_wdt_ops;
> -	dev->wdt.timeout = DEFAULT_TIMEOUT;
> -	dev->wdt.min_timeout = 1;
> -	dev->wdt.max_hw_heartbeat_ms = (U32_MAX - 1) / dev->clk_rate;
> -
> -	watchdog_init_timeout(&dev->wdt, timeout, &pdev->dev);
> -	watchdog_set_nowayout(&dev->wdt, nowayout);
> -	watchdog_set_drvdata(&dev->wdt, dev);
> -
> -	/*
> -	 * Deactivate counter if disable bit is set to avoid
> -	 * accidental reset.
> -	 */
> -	config = readl(dev->base + WD_CONFIG);
> -	if (config & WD_CONFIG_DISABLE)
> -		writel(0, dev->base + WD_COUNTER);
> -
> -	writel(WD_CONFIG_XTAL_IN, dev->base + WD_CONFIG);
> -
> -	/*
> -	 * Mark as active and restart with configured timeout if
> -	 * already running.
> -	 */
> -	if (readl(dev->base + WD_COUNTER)) {
> -		set_bit(WDOG_HW_RUNNING, &dev->wdt.status);
> -		tangox_wdt_start(&dev->wdt);
> -	}
> -
> -	watchdog_set_restart_priority(&dev->wdt, 128);
> -
> -	watchdog_stop_on_unregister(&dev->wdt);
> -	err = devm_watchdog_register_device(&pdev->dev, &dev->wdt);
> -	if (err)
> -		return err;
> -
> -	platform_set_drvdata(pdev, dev);
> -
> -	dev_info(&pdev->dev, "SMP86xx/SMP87xx watchdog registered\n");
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id tangox_wdt_dt_ids[] = {
> -	{ .compatible = "sigma,smp8642-wdt" },
> -	{ .compatible = "sigma,smp8759-wdt" },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, tangox_wdt_dt_ids);
> -
> -static struct platform_driver tangox_wdt_driver = {
> -	.probe	= tangox_wdt_probe,
> -	.driver	= {
> -		.name		= "tangox-wdt",
> -		.of_match_table	= tangox_wdt_dt_ids,
> -	},
> -};
> -
> -module_platform_driver(tangox_wdt_driver);
> -
> -MODULE_AUTHOR("Mans Rullgard <mans@mansr.com>");
> -MODULE_DESCRIPTION("SMP86xx/SMP87xx Watchdog driver");
> -MODULE_LICENSE("GPL");
> -- 
> 2.29.2
> 
