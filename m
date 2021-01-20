Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661912FDC49
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 23:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbhATWQu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 17:16:50 -0500
Received: from mail-ed1-f54.google.com ([209.85.208.54]:39682 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388468AbhATVQQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 16:16:16 -0500
Received: by mail-ed1-f54.google.com with SMTP id b21so1696edy.6;
        Wed, 20 Jan 2021 13:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5oYC75PmO4R043rd4aC6SKBywNaXBiqKKe3Uoo/WWB4=;
        b=rJ+FYwbpQnCp3y1xZp/4ettKDmaCvz1qdJB//f6nFQ1oWYFq/4AQe2evVDlJMslkLW
         W9Ktynnzvq/Sh+94Wz68vbx/loplV4FKCjlnaxloYk5rSCeb5qRcddiG7psDzMY8dUNq
         mAb6AbHTAklw7Vo1vgmbtp9QyVjrAVZS62+yUnwVZl9cjTLuukqpvXiYlZMbtDqhglPk
         3ttdoNkLXUlj2NmeSRjzMVXtg3Ad4a7CL4oqJPsDufgLaAB4emH++VhRyZEXDS0QBIih
         g9uM7RqDiCBKMpaCv1vG5SCjRCDDeVZZrYplHx+SrhozsF6jRRe8iz++9dHx4r8pMs/U
         RIaA==
X-Gm-Message-State: AOAM5330HkQBSiDwFvfTo/mYKfc45h8gUt44sJsgySXkrqY+oh7791xy
        p0mw8g0IHJoIUaJgykB8gaTBUDgGZHanlE+L1Jg=
X-Google-Smtp-Source: ABdhPJzdAzvVX6KsSRj/oSYEDygtfov7p/fHo+3Wk15lTIsFpPzWfJz+kHeGXjjj50B19twsBGQQEsKBB7kz+kkqsCI=
X-Received: by 2002:a05:6402:510f:: with SMTP id m15mr8809347edd.267.1611177333656;
 Wed, 20 Jan 2021 13:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20210120162745.61268-1-arnd@kernel.org> <20210120162745.61268-2-arnd@kernel.org>
In-Reply-To: <20210120162745.61268-2-arnd@kernel.org>
From:   Barry Song <baohua@kernel.org>
Date:   Thu, 21 Jan 2021 10:15:22 +1300
Message-ID: <CAGsJ_4xsDG_FJO-QDehziM61mYrAawyKvZeDpTkctxWpt82L8A@mail.gmail.com>
Subject: Re: [PATCH 1/5] watchdog: remove sirf prima driver
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
>  .../bindings/watchdog/sirfsoc_wdt.txt         |  18 --
>  drivers/watchdog/Kconfig                      |  10 -
>  drivers/watchdog/Makefile                     |   1 -
>  drivers/watchdog/sirfsoc_wdt.c                | 216 ------------------
>  4 files changed, 245 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
>  delete mode 100644 drivers/watchdog/sirfsoc_wdt.c
>
> diff --git a/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt b/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
> deleted file mode 100644
> index 0dce5e3100b4..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SiRFSoC Timer and Watchdog Timer(WDT) Controller
> -
> -Required properties:
> -- compatible: "sirf,prima2-tick"
> -- reg: Address range of tick timer/WDT register set
> -- interrupts: interrupt number to the cpu
> -
> -Optional properties:
> -- timeout-sec : Contains the watchdog timeout in seconds
> -
> -Example:
> -
> -timer@b0020000 {
> -       compatible = "sirf,prima2-tick";
> -       reg = <0xb0020000 0x1000>;
> -       interrupts = <0>;
> -       timeout-sec = <30>;
> -};
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ff941e71b79..88f4827849e4 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -788,16 +788,6 @@ config MOXART_WDT
>           To compile this driver as a module, choose M here: the
>           module will be called moxart_wdt.
>
> -config SIRFSOC_WATCHDOG
> -       tristate "SiRFSOC watchdog"
> -       depends on HAS_IOMEM
> -       depends on ARCH_SIRF || COMPILE_TEST
> -       select WATCHDOG_CORE
> -       default y
> -       help
> -         Support for CSR SiRFprimaII and SiRFatlasVI watchdog. When
> -         the watchdog triggers the system will be reset.
> -
>  config ST_LPC_WATCHDOG
>         tristate "STMicroelectronics LPC Watchdog"
>         depends on ARCH_STI || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 5c74ee19d441..1741ed3c6ce6 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -73,7 +73,6 @@ obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
>  obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>  obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
>  obj-$(CONFIG_MOXART_WDT) += moxart_wdt.o
> -obj-$(CONFIG_SIRFSOC_WATCHDOG) += sirfsoc_wdt.o
>  obj-$(CONFIG_ST_LPC_WATCHDOG) += st_lpc_wdt.o
>  obj-$(CONFIG_QCOM_WDT) += qcom-wdt.o
>  obj-$(CONFIG_BCM_KONA_WDT) += bcm_kona_wdt.o
> diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_wdt.c
> deleted file mode 100644
> index 734cf2966ecb..000000000000
> --- a/drivers/watchdog/sirfsoc_wdt.c
> +++ /dev/null
> @@ -1,216 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Watchdog driver for CSR SiRFprimaII and SiRFatlasVI
> - *
> - * Copyright (c) 2013 Cambridge Silicon Radio Limited, a CSR plc group company.
> - */
> -
> -#include <linux/module.h>
> -#include <linux/watchdog.h>
> -#include <linux/platform_device.h>
> -#include <linux/moduleparam.h>
> -#include <linux/of.h>
> -#include <linux/io.h>
> -#include <linux/uaccess.h>
> -
> -#define CLOCK_FREQ     1000000
> -
> -#define SIRFSOC_TIMER_COUNTER_LO       0x0000
> -#define SIRFSOC_TIMER_MATCH_0          0x0008
> -#define SIRFSOC_TIMER_INT_EN           0x0024
> -#define SIRFSOC_TIMER_WATCHDOG_EN      0x0028
> -#define SIRFSOC_TIMER_LATCH            0x0030
> -#define SIRFSOC_TIMER_LATCHED_LO       0x0034
> -
> -#define SIRFSOC_TIMER_WDT_INDEX                5
> -
> -#define SIRFSOC_WDT_MIN_TIMEOUT                30              /* 30 secs */
> -#define SIRFSOC_WDT_MAX_TIMEOUT                (10 * 60)       /* 10 mins */
> -#define SIRFSOC_WDT_DEFAULT_TIMEOUT    30              /* 30 secs */
> -
> -static unsigned int timeout;
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -
> -module_param(timeout, uint, 0);
> -module_param(nowayout, bool, 0);
> -
> -MODULE_PARM_DESC(timeout, "Default watchdog timeout (in seconds)");
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> -                       __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -static void __iomem *sirfsoc_wdt_base(struct watchdog_device *wdd)
> -{
> -       return (void __iomem __force *)watchdog_get_drvdata(wdd);
> -}
> -
> -static unsigned int sirfsoc_wdt_gettimeleft(struct watchdog_device *wdd)
> -{
> -       u32 counter, match;
> -       void __iomem *wdt_base;
> -       int time_left;
> -
> -       wdt_base = sirfsoc_wdt_base(wdd);
> -       counter = readl(wdt_base + SIRFSOC_TIMER_COUNTER_LO);
> -       match = readl(wdt_base +
> -               SIRFSOC_TIMER_MATCH_0 + (SIRFSOC_TIMER_WDT_INDEX << 2));
> -
> -       time_left = match - counter;
> -
> -       return time_left / CLOCK_FREQ;
> -}
> -
> -static int sirfsoc_wdt_updatetimeout(struct watchdog_device *wdd)
> -{
> -       u32 counter, timeout_ticks;
> -       void __iomem *wdt_base;
> -
> -       timeout_ticks = wdd->timeout * CLOCK_FREQ;
> -       wdt_base = sirfsoc_wdt_base(wdd);
> -
> -       /* Enable the latch before reading the LATCH_LO register */
> -       writel(1, wdt_base + SIRFSOC_TIMER_LATCH);
> -
> -       /* Set the TO value */
> -       counter = readl(wdt_base + SIRFSOC_TIMER_LATCHED_LO);
> -
> -       counter += timeout_ticks;
> -
> -       writel(counter, wdt_base +
> -               SIRFSOC_TIMER_MATCH_0 + (SIRFSOC_TIMER_WDT_INDEX << 2));
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_wdt_enable(struct watchdog_device *wdd)
> -{
> -       void __iomem *wdt_base = sirfsoc_wdt_base(wdd);
> -       sirfsoc_wdt_updatetimeout(wdd);
> -
> -       /*
> -        * NOTE: If interrupt is not enabled
> -        * then WD-Reset doesn't get generated at all.
> -        */
> -       writel(readl(wdt_base + SIRFSOC_TIMER_INT_EN)
> -               | (1 << SIRFSOC_TIMER_WDT_INDEX),
> -               wdt_base + SIRFSOC_TIMER_INT_EN);
> -       writel(1, wdt_base + SIRFSOC_TIMER_WATCHDOG_EN);
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_wdt_disable(struct watchdog_device *wdd)
> -{
> -       void __iomem *wdt_base = sirfsoc_wdt_base(wdd);
> -
> -       writel(0, wdt_base + SIRFSOC_TIMER_WATCHDOG_EN);
> -       writel(readl(wdt_base + SIRFSOC_TIMER_INT_EN)
> -               & (~(1 << SIRFSOC_TIMER_WDT_INDEX)),
> -               wdt_base + SIRFSOC_TIMER_INT_EN);
> -
> -       return 0;
> -}
> -
> -static int sirfsoc_wdt_settimeout(struct watchdog_device *wdd, unsigned int to)
> -{
> -       wdd->timeout = to;
> -       sirfsoc_wdt_updatetimeout(wdd);
> -
> -       return 0;
> -}
> -
> -#define OPTIONS (WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE)
> -
> -static const struct watchdog_info sirfsoc_wdt_ident = {
> -       .options          =     OPTIONS,
> -       .firmware_version =     0,
> -       .identity         =     "SiRFSOC Watchdog",
> -};
> -
> -static const struct watchdog_ops sirfsoc_wdt_ops = {
> -       .owner = THIS_MODULE,
> -       .start = sirfsoc_wdt_enable,
> -       .stop = sirfsoc_wdt_disable,
> -       .get_timeleft = sirfsoc_wdt_gettimeleft,
> -       .ping = sirfsoc_wdt_updatetimeout,
> -       .set_timeout = sirfsoc_wdt_settimeout,
> -};
> -
> -static struct watchdog_device sirfsoc_wdd = {
> -       .info = &sirfsoc_wdt_ident,
> -       .ops = &sirfsoc_wdt_ops,
> -       .timeout = SIRFSOC_WDT_DEFAULT_TIMEOUT,
> -       .min_timeout = SIRFSOC_WDT_MIN_TIMEOUT,
> -       .max_timeout = SIRFSOC_WDT_MAX_TIMEOUT,
> -};
> -
> -static int sirfsoc_wdt_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       int ret;
> -       void __iomem *base;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       watchdog_set_drvdata(&sirfsoc_wdd, (__force void *)base);
> -
> -       watchdog_init_timeout(&sirfsoc_wdd, timeout, dev);
> -       watchdog_set_nowayout(&sirfsoc_wdd, nowayout);
> -       sirfsoc_wdd.parent = dev;
> -
> -       watchdog_stop_on_reboot(&sirfsoc_wdd);
> -       watchdog_stop_on_unregister(&sirfsoc_wdd);
> -       ret = devm_watchdog_register_device(dev, &sirfsoc_wdd);
> -       if (ret)
> -               return ret;
> -
> -       platform_set_drvdata(pdev, &sirfsoc_wdd);
> -
> -       return 0;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int sirfsoc_wdt_suspend(struct device *dev)
> -{
> -       return 0;
> -}
> -
> -static int sirfsoc_wdt_resume(struct device *dev)
> -{
> -       struct watchdog_device *wdd = dev_get_drvdata(dev);
> -
> -       /*
> -        * NOTE: Since timer controller registers settings are saved
> -        * and restored back by the timer-prima2.c, so we need not
> -        * update WD settings except refreshing timeout.
> -        */
> -       sirfsoc_wdt_updatetimeout(wdd);
> -
> -       return 0;
> -}
> -#endif
> -
> -static SIMPLE_DEV_PM_OPS(sirfsoc_wdt_pm_ops,
> -               sirfsoc_wdt_suspend, sirfsoc_wdt_resume);
> -
> -static const struct of_device_id sirfsoc_wdt_of_match[] = {
> -       { .compatible = "sirf,prima2-tick"},
> -       {},
> -};
> -MODULE_DEVICE_TABLE(of, sirfsoc_wdt_of_match);
> -
> -static struct platform_driver sirfsoc_wdt_driver = {
> -       .driver = {
> -               .name = "sirfsoc-wdt",
> -               .pm = &sirfsoc_wdt_pm_ops,
> -               .of_match_table = sirfsoc_wdt_of_match,
> -       },
> -       .probe = sirfsoc_wdt_probe,
> -};
> -module_platform_driver(sirfsoc_wdt_driver);
> -
> -MODULE_DESCRIPTION("SiRF SoC watchdog driver");
> -MODULE_AUTHOR("Xianglong Du <Xianglong.Du@csr.com>");
> -MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:sirfsoc-wdt");
> --
> 2.29.2
>
