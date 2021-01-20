Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77812FDC4B
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 23:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbhATWRi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 17:17:38 -0500
Received: from mail-ed1-f46.google.com ([209.85.208.46]:35327 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbhATVSH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 16:18:07 -0500
Received: by mail-ed1-f46.google.com with SMTP id j13so31600edp.2;
        Wed, 20 Jan 2021 13:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rfPZS+QeQ97OySN6yB+WvqXIkd4qMySlsw3yCmUzIn0=;
        b=nXC7JZWh9VRNMN43bViAsXPidqT6uW7CY8X10+ki6bbPwAoZR+Pvid3LT4mkvWjs8E
         fklymveCkYMOfsnu1xN85jgh2POqcZ1/MvsrWn469y5/D9y2gULzf8u51xAKn9AGaS5h
         NelkNSoSo6d1m/3MkJ9aVg43O+kIcAChryM51j5luT7+eoBg2hzCSWR04ZP/rdehQbNb
         T8bnNJwWknRoBL9/RkJkWfyHG17jRZMoAXajeqSl+uQQy1sayQsQHGS8L0pBFZyy6Aq0
         ewcGWGAkALnLr9usSprr+xsVvMATMAeYfZzlLl0V1aaWS8wOdA5vIpvMHkhc8PdQOD2S
         Yi1A==
X-Gm-Message-State: AOAM5322SirJ7mZOY1Fy4L/ysrOSpQvSqIvK7Tkeqt+h1xx3pj5Vjfhn
        Xpt3t1Gt+3S7E9Bee3HUDN28qW+ZeP5MeICBSTI=
X-Google-Smtp-Source: ABdhPJxch6iulCnj74aXczbUuSVjxYnWRQqaSoZztFIQsQiEW9mnWjnGdTzPgkR3ue34ns5Q6vxS4Y10HnmlUMGkrTs=
X-Received: by 2002:a50:fa86:: with SMTP id w6mr5419029edr.98.1611177443062;
 Wed, 20 Jan 2021 13:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20210120162745.61268-1-arnd@kernel.org> <20210120162745.61268-3-arnd@kernel.org>
In-Reply-To: <20210120162745.61268-3-arnd@kernel.org>
From:   Barry Song <baohua@kernel.org>
Date:   Thu, 21 Jan 2021 10:17:11 +1300
Message-ID: <CAGsJ_4zMzpdN1bdw=rLFShMg83Qc8i-So-quCtB+vuuaa4+M+w@mail.gmail.com>
Subject: Re: [PATCH 2/5] watchdog: remove sirf atlas driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> 于2021年1月21日周四 上午5:27写道：
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Barry Song <baohua@kernel.org>

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
>           To compile this driver as a module, choose M here: the
>           module will be called lpc18xx_wdt.
>
> -config ATLAS7_WATCHDOG
> -       tristate "CSRatlas7 watchdog"
> -       depends on ARCH_ATLAS7 || COMPILE_TEST
> -       help
> -         Say Y here to include Watchdog timer support for the watchdog
> -         existing on the CSRatlas7 series platforms.
> -
> -         To compile this driver as a module, choose M here: the
> -         module will be called atlas7_wdt.
> -
>  config RENESAS_WDT
>         tristate "Renesas WDT Watchdog"
>         depends on ARCH_RENESAS || COMPILE_TEST
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
> -#define ATLAS7_TIMER_WDT_INDEX         5
> -#define ATLAS7_WDT_DEFAULT_TIMEOUT     20
> -
> -#define ATLAS7_WDT_CNT_CTRL    (0 + 4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT_MATCH   (0x18 + 4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT         (0x48 +  4 * ATLAS7_TIMER_WDT_INDEX)
> -#define ATLAS7_WDT_CNT_EN      (BIT(0) | BIT(1))
> -#define ATLAS7_WDT_EN          0x64
> -
> -static unsigned int timeout = ATLAS7_WDT_DEFAULT_TIMEOUT;
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -
> -module_param(timeout, uint, 0);
> -module_param(nowayout, bool, 0);
> -
> -MODULE_PARM_DESC(timeout, "Default watchdog timeout (in seconds)");
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> -                       __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -struct atlas7_wdog {
> -       struct device *dev;
> -       void __iomem *base;
> -       unsigned long tick_rate;
> -       struct clk *clk;
> -};
> -
> -static unsigned int atlas7_wdt_gettimeleft(struct watchdog_device *wdd)
> -{
> -       struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -       u32 counter, match, delta;
> -
> -       counter = readl(wdt->base + ATLAS7_WDT_CNT);
> -       match = readl(wdt->base + ATLAS7_WDT_CNT_MATCH);
> -       delta = match - counter;
> -
> -       return  delta / wdt->tick_rate;
> -}
> -
> -static int atlas7_wdt_ping(struct watchdog_device *wdd)
> -{
> -       struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -       u32 counter, match, delta;
> -
> -       counter = readl(wdt->base + ATLAS7_WDT_CNT);
> -       delta = wdd->timeout * wdt->tick_rate;
> -       match = counter + delta;
> -
> -       writel(match, wdt->base + ATLAS7_WDT_CNT_MATCH);
> -
> -       return 0;
> -}
> -
> -static int atlas7_wdt_enable(struct watchdog_device *wdd)
> -{
> -       struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -
> -       atlas7_wdt_ping(wdd);
> -
> -       writel(readl(wdt->base + ATLAS7_WDT_CNT_CTRL) | ATLAS7_WDT_CNT_EN,
> -             wdt->base + ATLAS7_WDT_CNT_CTRL);
> -       writel(1, wdt->base + ATLAS7_WDT_EN);
> -
> -       return 0;
> -}
> -
> -static int atlas7_wdt_disable(struct watchdog_device *wdd)
> -{
> -       struct atlas7_wdog *wdt = watchdog_get_drvdata(wdd);
> -
> -       writel(0, wdt->base + ATLAS7_WDT_EN);
> -       writel(readl(wdt->base + ATLAS7_WDT_CNT_CTRL) & ~ATLAS7_WDT_CNT_EN,
> -             wdt->base + ATLAS7_WDT_CNT_CTRL);
> -
> -       return 0;
> -}
> -
> -static int atlas7_wdt_settimeout(struct watchdog_device *wdd, unsigned int to)
> -{
> -       wdd->timeout = to;
> -
> -       return 0;
> -}
> -
> -#define OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
> -
> -static const struct watchdog_info atlas7_wdt_ident = {
> -       .options = OPTIONS,
> -       .firmware_version = 0,
> -       .identity = "atlas7 Watchdog",
> -};
> -
> -static const struct watchdog_ops atlas7_wdt_ops = {
> -       .owner = THIS_MODULE,
> -       .start = atlas7_wdt_enable,
> -       .stop = atlas7_wdt_disable,
> -       .get_timeleft = atlas7_wdt_gettimeleft,
> -       .ping = atlas7_wdt_ping,
> -       .set_timeout = atlas7_wdt_settimeout,
> -};
> -
> -static struct watchdog_device atlas7_wdd = {
> -       .info = &atlas7_wdt_ident,
> -       .ops = &atlas7_wdt_ops,
> -       .timeout = ATLAS7_WDT_DEFAULT_TIMEOUT,
> -};
> -
> -static const struct of_device_id atlas7_wdt_ids[] = {
> -       { .compatible = "sirf,atlas7-tick"},
> -       {}
> -};
> -
> -static void atlas7_clk_disable_unprepare(void *data)
> -{
> -       clk_disable_unprepare(data);
> -}
> -
> -static int atlas7_wdt_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       struct atlas7_wdog *wdt;
> -       struct clk *clk;
> -       int ret;
> -
> -       wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> -       if (!wdt)
> -               return -ENOMEM;
> -       wdt->base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(wdt->base))
> -               return PTR_ERR(wdt->base);
> -
> -       clk = devm_clk_get(dev, NULL);
> -       if (IS_ERR(clk))
> -               return PTR_ERR(clk);
> -       ret = clk_prepare_enable(clk);
> -       if (ret) {
> -               dev_err(dev, "clk enable failed\n");
> -               return ret;
> -       }
> -       ret = devm_add_action_or_reset(dev, atlas7_clk_disable_unprepare, clk);
> -       if (ret)
> -               return ret;
> -
> -       /* disable watchdog hardware */
> -       writel(0, wdt->base + ATLAS7_WDT_CNT_CTRL);
> -
> -       wdt->tick_rate = clk_get_rate(clk);
> -       if (!wdt->tick_rate)
> -               return -EINVAL;
> -
> -       wdt->clk = clk;
> -       atlas7_wdd.min_timeout = 1;
> -       atlas7_wdd.max_timeout = UINT_MAX / wdt->tick_rate;
> -
> -       watchdog_init_timeout(&atlas7_wdd, 0, dev);
> -       watchdog_set_nowayout(&atlas7_wdd, nowayout);
> -
> -       watchdog_set_drvdata(&atlas7_wdd, wdt);
> -       platform_set_drvdata(pdev, &atlas7_wdd);
> -
> -       watchdog_stop_on_reboot(&atlas7_wdd);
> -       watchdog_stop_on_unregister(&atlas7_wdd);
> -       return devm_watchdog_register_device(dev, &atlas7_wdd);
> -}
> -
> -static int __maybe_unused atlas7_wdt_suspend(struct device *dev)
> -{
> -       /*
> -        * NOTE:timer controller registers settings are saved
> -        * and restored back by the timer-atlas7.c
> -        */
> -       return 0;
> -}
> -
> -static int __maybe_unused atlas7_wdt_resume(struct device *dev)
> -{
> -       struct watchdog_device *wdd = dev_get_drvdata(dev);
> -
> -       /*
> -        * NOTE: Since timer controller registers settings are saved
> -        * and restored back by the timer-atlas7.c, so we need not
> -        * update WD settings except refreshing timeout.
> -        */
> -       atlas7_wdt_ping(wdd);
> -
> -       return 0;
> -}
> -
> -static SIMPLE_DEV_PM_OPS(atlas7_wdt_pm_ops,
> -               atlas7_wdt_suspend, atlas7_wdt_resume);
> -
> -MODULE_DEVICE_TABLE(of, atlas7_wdt_ids);
> -
> -static struct platform_driver atlas7_wdt_driver = {
> -       .driver = {
> -               .name = "atlas7-wdt",
> -               .pm = &atlas7_wdt_pm_ops,
> -               .of_match_table = atlas7_wdt_ids,
> -       },
> -       .probe = atlas7_wdt_probe,
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
