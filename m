Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787312FD927
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 20:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733114AbhATTHx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 14:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392509AbhATTEO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 14:04:14 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C9CC061575;
        Wed, 20 Jan 2021 11:03:33 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d1so3889697otl.13;
        Wed, 20 Jan 2021 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yodXS05JaL1ig72R6kKKKEE90PAC0RRrwwex9Cghq4s=;
        b=ROFfkVyfGBkAGvNNZjTYhEX9Ndte+ns9H6TWMgabwdd3ztk5M+Ev65bfohW6BZ9noY
         gufFeTDYBiQTVKKSD/0hJC16l4k91KcRHPFRCuKq1wR4rXJdyuqERW7YfWQqWnxsBLIq
         NnQqjVjDpK5uRlzqb1HOPRqhjmxrSAIOdQSWi+PhnCl5t3k9TpNdP312/yqlP4uEnM6M
         KCEJDhTqxePmE66XR0/SV8UP35c7fnqiH+zbrB/mJWhe7b2/+5SX9vmqaqpJLeTHndCG
         Y5adOoVpHo3dXEGl//699Ej6QKqoV1IdUBZea/GpW3zUrRgWQCy+1ZICUx0g+731YCjx
         2tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=yodXS05JaL1ig72R6kKKKEE90PAC0RRrwwex9Cghq4s=;
        b=aYQA46e9phJe+4gd/n1n5el+UNX1456qPQHyOtXP+g4dkl9/VQpEK6RXQvnAxEwpl8
         Q7/TF7C7To37NPeGE9bZFOtlH+4UhQODpA2PBJ6A4UxeP7fzTLUSfW3Ho+uI8xrIlS22
         wQQTA4PpP04i0ujVx9unt7LoIEWzJp40SGbQU6S9G6UuGcpE2BdVMCeK7g6jacg40oZ8
         e248e3DhxKgCG3RQgR4soT6mHY8ldu4Mh8vfpU7xr6AlJOjycqQlvvK5u39VtPjJg6US
         3gEgTCZoy83HLqbdXrc6/ShB5WS+SHtHSCm2ovmkccPYIObjoGVrw2ap4UNydLB7jMkb
         rf1g==
X-Gm-Message-State: AOAM530cS3N7qjNsjKHK6oSYKqIuo3o27wXyqE20Z08uVFz5kO4htxtY
        mNjkBX9ajq6GOAwrI84q/W8=
X-Google-Smtp-Source: ABdhPJzBurChML7P64dMp1Ak3EmVH3K0rNEhC6ZxP+ROXBEFUPRiw9STymQvZdA52WtySGnZPUMsaw==
X-Received: by 2002:a9d:1421:: with SMTP id h30mr5411823oth.45.1611169411743;
        Wed, 20 Jan 2021 11:03:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z9sm564599otj.67.2021.01.20.11.03.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 11:03:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 20 Jan 2021 11:03:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH 2/5] watchdog: remove sirf atlas driver
Message-ID: <20210120190329.GB162747@roeck-us.net>
References: <20210120162745.61268-1-arnd@kernel.org>
 <20210120162745.61268-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120162745.61268-3-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 05:27:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
> 
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig      |  10 --
>  drivers/watchdog/Makefile     |   1 -
>  drivers/watchdog/atlas7_wdt.c | 221 ----------------------------------
>  3 files changed, 232 deletions(-)
>  delete mode 100644 drivers/watchdog/atlas7_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 88f4827849e4..5559e4325f6a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -890,16 +890,6 @@ config LPC18XX_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called lpc18xx_wdt.
>  
> -config ATLAS7_WATCHDOG
> -	tristate "CSRatlas7 watchdog"
> -	depends on ARCH_ATLAS7 || COMPILE_TEST
> -	help
> -	  Say Y here to include Watchdog timer support for the watchdog
> -	  existing on the CSRatlas7 series platforms.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called atlas7_wdt.
> -
>  config RENESAS_WDT
>  	tristate "Renesas WDT Watchdog"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1741ed3c6ce6..40b94403c487 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -83,7 +83,6 @@ obj-$(CONFIG_MEDIATEK_WATCHDOG) += mtk_wdt.o
>  obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
>  obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
>  obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
> -obj-$(CONFIG_ATLAS7_WATCHDOG) += atlas7_wdt.o
>  obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
>  obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
>  obj-$(CONFIG_ASPEED_WATCHDOG) += aspeed_wdt.o
> diff --git a/drivers/watchdog/atlas7_wdt.c b/drivers/watchdog/atlas7_wdt.c
> deleted file mode 100644
> index 9bfe650d802f..000000000000
> --- a/drivers/watchdog/atlas7_wdt.c
> +++ /dev/null
> @@ -1,221 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Watchdog driver for CSR Atlas7
> - *
> - * Copyright (c) 2015 Cambridge Silicon Radio Limited, a CSR plc group company.
> - */
> -
> -#include <linux/clk.h>
> -#include <linux/io.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/of.h>
> -#include <linux/platform_device.h>
> -#include <linux/watchdog.h>
> -
> -#define ATLAS7_TIMER_WDT_INDEX		5
> -#define ATLAS7_WDT_DEFAULT_TIMEOUT	20
> -
> -#define ATLAS7_WDT_CNT_CTRL	(0 + 4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT_MATCH	(0x18 + 4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT		(0x48 +  4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT_EN	(BIT(0) | BIT(1))
> -#define ATLAS7_WDT_EN		0x64
> -
> -static unsigned int timeout = ATLAS7_WDT_DEFAULT_TIMEOUT;
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -
> -module_param(timeout, uint, 0);
> -module_param(nowayout, bool, 0);
> -
> -MODULE_PARM_DESC(timeout, "Default watchdog timeout (in seconds)");
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> -			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -struct atlas7_wdog {
> -	struct device *dev;
> -	void __iomem *base;
> -	unsigned long tick_rate;
> -	struct clk *clk;
> -};
> -
> -static unsigned int atlas7_wdt_gettimeleft(struct watchdog_device *wdd)
> -{
> -	struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -	u32 counter, match, delta;
> -
> -	counter = readl(wdt->base + ATLAS7_WDT_CNT);
> -	match = readl(wdt->base + ATLAS7_WDT_CNT_MATCH);
> -	delta = match - counter;
> -
> -	return  delta / wdt->tick_rate;
> -}
> -
> -static int atlas7_wdt_ping(struct watchdog_device *wdd)
> -{
> -	struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -	u32 counter, match, delta;
> -
> -	counter = readl(wdt->base + ATLAS7_WDT_CNT);
> -	delta = wdd->timeout * wdt->tick_rate;
> -	match = counter + delta;
> -
> -	writel(match, wdt->base + ATLAS7_WDT_CNT_MATCH);
> -
> -	return 0;
> -}
> -
> -static int atlas7_wdt_enable(struct watchdog_device *wdd)
> -{
> -	struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -
> -	atlas7_wdt_ping(wdd);
> -
> -	writel(readl(wdt->base + ATLAS7_WDT_CNT_CTRL) | ATLAS7_WDT_CNT_EN,
> -	      wdt->base + ATLAS7_WDT_CNT_CTRL);
> -	writel(1, wdt->base + ATLAS7_WDT_EN);
> -
> -	return 0;
> -}
> -
> -static int atlas7_wdt_disable(struct watchdog_device *wdd)
> -{
> -	struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -
> -	writel(0, wdt->base + ATLAS7_WDT_EN);
> -	writel(readl(wdt->base + ATLAS7_WDT_CNT_CTRL) & ~ATLAS7_WDT_CNT_EN,
> -	      wdt->base + ATLAS7_WDT_CNT_CTRL);
> -
> -	return 0;
> -}
> -
> -static int atlas7_wdt_settimeout(struct watchdog_device *wdd, unsigned int to)
> -{
> -	wdd->timeout = to;
> -
> -	return 0;
> -}
> -
> -#define OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
> -
> -static const struct watchdog_info atlas7_wdt_ident = {
> -	.options = OPTIONS,
> -	.firmware_version = 0,
> -	.identity = "atlas7 Watchdog",
> -};
> -
> -static const struct watchdog_ops atlas7_wdt_ops = {
> -	.owner = THIS_MODULE,
> -	.start = atlas7_wdt_enable,
> -	.stop = atlas7_wdt_disable,
> -	.get_timeleft = atlas7_wdt_gettimeleft,
> -	.ping = atlas7_wdt_ping,
> -	.set_timeout = atlas7_wdt_settimeout,
> -};
> -
> -static struct watchdog_device atlas7_wdd = {
> -	.info = &atlas7_wdt_ident,
> -	.ops = &atlas7_wdt_ops,
> -	.timeout = ATLAS7_WDT_DEFAULT_TIMEOUT,
> -};
> -
> -static const struct of_device_id atlas7_wdt_ids[] = {
> -	{ .compatible = "sirf,atlas7-tick"},
> -	{}
> -};
> -
> -static void atlas7_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
> -static int atlas7_wdt_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct atlas7_wdog *wdt;
> -	struct clk *clk;
> -	int ret;
> -
> -	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> -	if (!wdt)
> -		return -ENOMEM;
> -	wdt->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(wdt->base))
> -		return PTR_ERR(wdt->base);
> -
> -	clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "clk enable failed\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, atlas7_clk_disable_unprepare, clk);
> -	if (ret)
> -		return ret;
> -
> -	/* disable watchdog hardware */
> -	writel(0, wdt->base + ATLAS7_WDT_CNT_CTRL);
> -
> -	wdt->tick_rate = clk_get_rate(clk);
> -	if (!wdt->tick_rate)
> -		return -EINVAL;
> -
> -	wdt->clk = clk;
> -	atlas7_wdd.min_timeout = 1;
> -	atlas7_wdd.max_timeout = UINT_MAX / wdt->tick_rate;
> -
> -	watchdog_init_timeout(&atlas7_wdd, 0, dev);
> -	watchdog_set_nowayout(&atlas7_wdd, nowayout);
> -
> -	watchdog_set_drvdata(&atlas7_wdd, wdt);
> -	platform_set_drvdata(pdev, &atlas7_wdd);
> -
> -	watchdog_stop_on_reboot(&atlas7_wdd);
> -	watchdog_stop_on_unregister(&atlas7_wdd);
> -	return devm_watchdog_register_device(dev, &atlas7_wdd);
> -}
> -
> -static int __maybe_unused atlas7_wdt_suspend(struct device *dev)
> -{
> -	/*
> -	 * NOTE:timer controller registers settings are saved
> -	 * and restored back by the timer-atlas7.c
> -	 */
> -	return 0;
> -}
> -
> -static int __maybe_unused atlas7_wdt_resume(struct device *dev)
> -{
> -	struct watchdog_device *wdd = dev_get_drvdata(dev);
> -
> -	/*
> -	 * NOTE: Since timer controller registers settings are saved
> -	 * and restored back by the timer-atlas7.c, so we need not
> -	 * update WD settings except refreshing timeout.
> -	 */
> -	atlas7_wdt_ping(wdd);
> -
> -	return 0;
> -}
> -
> -static SIMPLE_DEV_PM_OPS(atlas7_wdt_pm_ops,
> -		atlas7_wdt_suspend, atlas7_wdt_resume);
> -
> -MODULE_DEVICE_TABLE(of, atlas7_wdt_ids);
> -
> -static struct platform_driver atlas7_wdt_driver = {
> -	.driver = {
> -		.name = "atlas7-wdt",
> -		.pm = &atlas7_wdt_pm_ops,
> -		.of_match_table	= atlas7_wdt_ids,
> -	},
> -	.probe = atlas7_wdt_probe,
> -};
> -module_platform_driver(atlas7_wdt_driver);
> -
> -MODULE_DESCRIPTION("CSRatlas7 watchdog driver");
> -MODULE_AUTHOR("Guo Zeng <Guo.Zeng@csr.com>");
> -MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:atlas7-wdt");
> -- 
> 2.29.2
> 
