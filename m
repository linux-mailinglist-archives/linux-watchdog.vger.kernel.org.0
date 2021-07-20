Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5C3CFE06
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Jul 2021 17:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238129AbhGTPDx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Jul 2021 11:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240347AbhGTOZh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Jul 2021 10:25:37 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A69C061762
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Jul 2021 08:04:12 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so21761170otp.8
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Jul 2021 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KRGU+KDdNLYPOl9sVwXVQ34klgolmzNku+0Kq9FZ7yE=;
        b=fOxw3cWq7PKhzH4EUcXbvATv2fe4PNXTdR3UlnlkJtyfbCLEPuDW15jK5O26CTzIU6
         9TWQwe32lW041hI4P+eyZtvVK6T1RRZNZnzXw58ri0Czr0jSC1+NCFxgJyaDoGZIxcHW
         YDlJ/zxFNvqJklrNjkjyXS3dFrTK8BLnjE+AjKgfYK3mcI38AF/RKL2uGRhRdmyBHZbb
         fc07NL3mllSFU370VBKl/HXBQzFTykh8wBOwzouxVDC4A6+7eg8P86SlV876K3felod1
         irPndxXrxoHX97SnY9v6lWc3DFs05+bcV0l9Akp4lXJoFzsU+naNJWt2PuNwHygb4U8b
         Ct5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRGU+KDdNLYPOl9sVwXVQ34klgolmzNku+0Kq9FZ7yE=;
        b=PJf/ZjJ6U/v4us0EDYATCjyGFHOppiuwec01LOXA5f5xSInhe7R8zXFOSL5gN3rvt7
         SCpU5wl9i6PELs0G67Ezv/IKgR9ZzywHA4BHuqzlP+2QU9yOPqP21O2CjC+kZ28qEC2R
         o36FqCNEIFYlSyjYA4T75D07hfgjqlE2yUZTT92fFlAdcNSPJpridvCgxgFHWUcpxPB9
         /WMQ+nl/aKEiVN8Jotn9Odx8ATGDKZ4cbgwMNSncvJn5E0xz/TXv0zLQ/KkKauIleeCY
         GHTZ1N0Wy8mg7is2J6bK7OFNa3PJLg268ZURxRnUbrML9oVkhC19FBouFw0igL28i0cm
         UqSw==
X-Gm-Message-State: AOAM5313SbcDYWwJeNyHeHq0RP9SirG0L4N6U/MLxkI5VE3d1qrrCcws
        UDl34sFIHPwqgfhpk74Sy1E=
X-Google-Smtp-Source: ABdhPJw7l/CWOlBUWhzvivVjmYw1njIsllQanWup/qPtTK68v65/mtaIwmWqLTkolZizPb+ECTeJVA==
X-Received: by 2002:a9d:ac9:: with SMTP id 67mr22872851otq.190.1626793451742;
        Tue, 20 Jul 2021 08:04:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18sm1298231ots.81.2021.07.20.08.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 08:04:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20210720141755.1523736-1-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: ixp4xx: Rewrite driver to use core
Message-ID: <a5e2ce4c-840e-9e90-246b-bcc6cae4e464@roeck-us.net>
Date:   Tue, 20 Jul 2021 08:04:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720141755.1523736-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/20/21 7:17 AM, Linus Walleij wrote:
> This rewrites the IXP4xx watchdog driver as follows:
> 
> - Spawn the watchdog driver as a platform device from the timer
>    driver. It's one device in the hardware, and the fact that
>    Linux splits the handling into two different devices is
>    a Linux pecularity, and thus it becomes a Linux pecularity
>    to spawn a separate watchdog driver.
> 
> - Spawn the watchdog driver from the timer driver at probe().
>    This is well after the timer driver as actually registered and
>    started and we know the register base is available.
> 
> - Instead of looping back callbacks to the timer drivers for all
>    watchdog calls, pass the register base to the watchdog driver
>    and manage the registers there. The two drivers aren't even
>    interested in the same register so the spinlock is totally
>    surplus, delete it.
> 
> - Replace pretty much all of the content in the watchdog driver
>    with a simple, modern watchdog driver utilizing the watchdog
>    core instead of registering its own misc device and ioctl()
>    handling.
> 
> - Drop module parameters as the same already exist in the
>    watchdog core.
> 
> What remains is a slim elegant (IMO) watchdog driver using the
> watchdog core, spawning from device tree or boardfile alike.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Unfortunately this patch is not based on v5.14-rcX, nor on linux-next.
Trying to apply it with git fails completely, and trying to apply it
using patch results in conflicts. Please rebase it on top of a v5.14
release candidate or some other published immutable branch, and let us
know what that branch is.

Couple of additional comments inline, but I'll need to be able to apply
the patch for a complete review.

Thanks,
Guenter

> ---
> Merge path: I expect this to be merged through the watchdog
> subsystem once the timer maintainers are happy with the patch,
> so Daniel or tglx: once you approve the patch please ACK this.
> ---
>   drivers/clocksource/timer-ixp4xx.c         |  69 +++---
>   drivers/watchdog/Kconfig                   |   1 +
>   drivers/watchdog/ixp4xx_wdt.c              | 249 +++++++++------------
>   include/linux/platform_data/timer-ixp4xx.h |  13 --
>   4 files changed, 131 insertions(+), 201 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-ixp4xx.c b/drivers/clocksource/timer-ixp4xx.c
> index d6d364988bdf..ddca6a22d533 100644
> --- a/drivers/clocksource/timer-ixp4xx.c
> +++ b/drivers/clocksource/timer-ixp4xx.c
> @@ -18,6 +18,7 @@
>   #include <linux/delay.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
> +#include <linux/platform_device.h>
>   /* Goes away with OF conversion */
>   #include <linux/platform_data/timer-ixp4xx.h>
>   
> @@ -29,9 +30,6 @@
>   #define IXP4XX_OSRT1_OFFSET	0x08  /* Timer 1 Reload */
>   #define IXP4XX_OST2_OFFSET	0x0C  /* Timer 2 Timestamp */
>   #define IXP4XX_OSRT2_OFFSET	0x10  /* Timer 2 Reload */
> -#define IXP4XX_OSWT_OFFSET	0x14  /* Watchdog Timer */
> -#define IXP4XX_OSWE_OFFSET	0x18  /* Watchdog Enable */
> -#define IXP4XX_OSWK_OFFSET	0x1C  /* Watchdog Key */
>   #define IXP4XX_OSST_OFFSET	0x20  /* Timer Status */
>   
>   /*
> @@ -45,13 +43,7 @@
>   #define IXP4XX_OSST_TIMER_1_PEND	0x00000001
>   #define IXP4XX_OSST_TIMER_2_PEND	0x00000002
>   #define IXP4XX_OSST_TIMER_TS_PEND	0x00000004
> -#define IXP4XX_OSST_TIMER_WDOG_PEND	0x00000008
> -#define IXP4XX_OSST_TIMER_WARM_RESET	0x00000010
> -
> -#define	IXP4XX_WDT_KEY			0x0000482E
> -#define	IXP4XX_WDT_RESET_ENABLE		0x00000001
> -#define	IXP4XX_WDT_IRQ_ENABLE		0x00000002
> -#define	IXP4XX_WDT_COUNT_ENABLE		0x00000004
> +/* Remaining registers are for the watchdog and defined in the watchdog driver */
>   
>   struct ixp4xx_timer {
>   	void __iomem *base;
> @@ -61,7 +53,6 @@ struct ixp4xx_timer {
>   #ifdef CONFIG_ARM
>   	struct delay_timer delay_timer;
>   #endif
> -	spinlock_t wdt_lock;
>   };
>   
>   /*
> @@ -183,7 +174,6 @@ static __init int ixp4xx_timer_register(void __iomem *base,
>   		return -ENOMEM;
>   	tmr->base = base;
>   	tmr->tick_rate = timer_freq;
> -	spin_lock_init(&tmr->wdt_lock);
>   
>   	/*
>   	 * The timer register doesn't allow to specify the two least
> @@ -241,37 +231,38 @@ static __init int ixp4xx_timer_register(void __iomem *base,
>   	return 0;
>   }
>   
> -#if IS_ENABLED(CONFIG_IXP4XX_WATCHDOG)
> -void ixp4xx_wdt_set(int heartbeat)
> -{
> -	void __iomem *regs;
> -
> -	regs = local_ixp4xx_timer->base;
> -
> -	spin_lock(&local_ixp4xx_timer->wdt_lock);
> -	__raw_writel(IXP4XX_WDT_KEY, regs + IXP4XX_OSWK_OFFSET);
> -	__raw_writel(0, regs + IXP4XX_OSWE_OFFSET);
> -	if (heartbeat) {
> -		__raw_writel(local_ixp4xx_timer->tick_rate * heartbeat,
> -			     regs + IXP4XX_OSWT_OFFSET);
> -		__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
> -			     regs + IXP4XX_OSWE_OFFSET);
> -	}
> -	__raw_writel(0, regs + IXP4XX_OSWK_OFFSET);
> -	spin_unlock(&local_ixp4xx_timer->wdt_lock);
> -}
> -EXPORT_SYMBOL_GPL(ixp4xx_wdt_set);
> +static struct platform_device ixp4xx_watchdog_device = {
> +	.name = "ixp4xx-watchdog",
> +	.id = -1,
> +};
>   
> -int ixp4xx_boot_status(void)
> +/*
> + * This probe gets called after the timer is already up and running. The main
> + * function on this platform is to spawn the watchdog device as a child.
> + */
> +static int ixp4xx_timer_probe(struct platform_device *pdev)
>   {
> -	if (!local_ixp4xx_timer || !local_ixp4xx_timer->base)
> -		return -ENXIO;
> +	struct device *dev = &pdev->dev;
>   
> -	return !!(__raw_readl(local_ixp4xx_timer->base + IXP4XX_OSST_OFFSET) &
> -		  IXP4XX_OSST_TIMER_WARM_RESET);
> +	/* Pass the base address as platform data and nothing else */
> +	ixp4xx_watchdog_device.dev.platform_data = local_ixp4xx_timer->base;
> +	return platform_device_register(&ixp4xx_watchdog_device);
>   }
> -EXPORT_SYMBOL_GPL(ixp4xx_boot_status);
> -#endif
> +
> +static const struct of_device_id ixp4xx_timer_dt_id[] = {
> +	{ .compatible = "intel,ixp4xx-timer", },
> +	{ /* sentinel */ },
> +};
> +
> +static struct platform_driver ixp4xx_timer_driver = {
> +	.probe  = ixp4xx_timer_probe,
> +	.driver = {
> +		.name = "ixp4xx-timer",
> +		.of_match_table = ixp4xx_timer_dt_id,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(ixp4xx_timer_driver);
>   
>   /**
>    * ixp4xx_timer_setup() - Timer setup function to be called from boardfiles
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ddc0ad16d792..33c97726144a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -487,6 +487,7 @@ config FTWDT010_WATCHDOG
>   config IXP4XX_WATCHDOG
>   	tristate "IXP4xx Watchdog"
>   	depends on ARCH_IXP4XX || COMPILE_TEST
> +	select WATCHDOG_CORE
>   	help
>   	  Say Y here if to include support for the watchdog timer
>   	  in the Intel IXP4xx network processors. This driver can
> diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
> index 56f7510ee892..ea92d6e6832b 100644
> --- a/drivers/watchdog/ixp4xx_wdt.c
> +++ b/drivers/watchdog/ixp4xx_wdt.c
> @@ -1,204 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * drivers/char/watchdog/ixp4xx_wdt.c
>    *
>    * Watchdog driver for Intel IXP4xx network processors
>    *
>    * Author: Deepak Saxena <dsaxena@plexity.net>
> + * Author: Linus Walleij <linus.walleij@linaro.org>
>    *
>    * Copyright 2004 (c) MontaVista, Software, Inc.
>    * Based on sa1100 driver, Copyright (C) 2000 Oleg Drokin <green@crimea.edu>
> - *
> - * This file is licensed under  the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
>    */
>   
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
>   #include <linux/module.h>
> -#include <linux/moduleparam.h>
>   #include <linux/types.h>
>   #include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/miscdevice.h>
> -#include <linux/of.h>
>   #include <linux/watchdog.h>
>   #include <linux/init.h>
>   #include <linux/bitops.h>
> -#include <linux/uaccess.h>
> +#include <linux/platform_device.h>
>   #include <linux/soc/ixp4xx/cpu.h>
> -#include <linux/platform_data/timer-ixp4xx.h>
>   
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -static int heartbeat = 60;	/* (secs) Default is 1 minute */
> -static unsigned long wdt_status;
> -static unsigned long boot_status;
> -
> -#define	WDT_IN_USE		0
> -#define	WDT_OK_TO_CLOSE		1
> +struct ixp4xx_wdt {
> +	struct watchdog_device wdd;
> +	void __iomem *base;
> +	struct device *dev;

Unused

> +	unsigned long boot_status;

Unused

> +	unsigned long rate;
> +};
>   
> -static void wdt_enable(void)
> +/* Registers after the timer registers */
> +#define IXP4XX_OSWT_OFFSET	0x14  /* Watchdog Timer */
> +#define IXP4XX_OSWE_OFFSET	0x18  /* Watchdog Enable */
> +#define IXP4XX_OSWK_OFFSET	0x1C  /* Watchdog Key */
> +#define IXP4XX_OSST_OFFSET	0x20  /* Timer Status */
> +
> +#define IXP4XX_OSST_TIMER_WDOG_PEND	0x00000008
> +#define IXP4XX_OSST_TIMER_WARM_RESET	0x00000010
> +#define	IXP4XX_WDT_KEY			0x0000482E
> +#define	IXP4XX_WDT_RESET_ENABLE		0x00000001
> +#define	IXP4XX_WDT_IRQ_ENABLE		0x00000002
> +#define	IXP4XX_WDT_COUNT_ENABLE		0x00000004
> +
> +static inline
> +struct ixp4xx_wdt *to_ixp4xx_wdt(struct watchdog_device *wdd)
>   {
> -	ixp4xx_wdt_set(heartbeat);
> +	return container_of(wdd, struct ixp4xx_wdt, wdd);
>   }
>   
> -static void wdt_disable(void)
> +static int ixp4xx_wdt_start(struct watchdog_device *wdd)
>   {
> -	ixp4xx_wdt_set(0);
> -}
> +	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
>   
> -static int ixp4xx_wdt_open(struct inode *inode, struct file *file)
> -{
> -	if (test_and_set_bit(WDT_IN_USE, &wdt_status))
> -		return -EBUSY;
> +	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWE_OFFSET);
> +	__raw_writel(wdd->timeout * iwdt->rate,
> +		     iwdt->base + IXP4XX_OSWT_OFFSET);
> +	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
> +		     iwdt->base + IXP4XX_OSWE_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWK_OFFSET);
>   
> -	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -	wdt_enable();
> -	return stream_open(inode, file);
> +	return 0;
>   }
>   
> -static ssize_t
> -ixp4xx_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
> +static int ixp4xx_wdt_stop(struct watchdog_device *wdd)
>   {
> -	if (len) {
> -		if (!nowayout) {
> -			size_t i;
> -
> -			clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -
> -			for (i = 0; i != len; i++) {
> -				char c;
> -
> -				if (get_user(c, data + i))
> -					return -EFAULT;
> -				if (c == 'V')
> -					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -			}
> -		}
> -		wdt_enable();
> -	}
> -	return len;
> -}
> -
> -static const struct watchdog_info ident = {
> -	.options	= WDIOF_CARDRESET | WDIOF_MAGICCLOSE |
> -			  WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
> -	.identity	= "IXP4xx Watchdog",
> -};
> +	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
>   
> +	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWE_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWK_OFFSET);
>   
> -static long ixp4xx_wdt_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> -{
> -	int ret = -ENOTTY;
> -	int time;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		ret = copy_to_user((struct watchdog_info *)arg, &ident,
> -				   sizeof(ident)) ? -EFAULT : 0;
> -		break;
> -
> -	case WDIOC_GETSTATUS:
> -		ret = put_user(0, (int *)arg);
> -		break;
> -
> -	case WDIOC_GETBOOTSTATUS:
> -		ret = put_user(boot_status, (int *)arg);
> -		break;
> -
> -	case WDIOC_KEEPALIVE:
> -		wdt_enable();
> -		ret = 0;
> -		break;
> -
> -	case WDIOC_SETTIMEOUT:
> -		ret = get_user(time, (int *)arg);
> -		if (ret)
> -			break;
> -
> -		if (time <= 0 || time > 60) {
> -			ret = -EINVAL;
> -			break;
> -		}
> -
> -		heartbeat = time;
> -		wdt_enable();
> -		fallthrough;
> -
> -	case WDIOC_GETTIMEOUT:
> -		ret = put_user(heartbeat, (int *)arg);
> -		break;
> -	}
> -	return ret;
> +	return 0;
>   }
>   
> -static int ixp4xx_wdt_release(struct inode *inode, struct file *file)
> +static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
> +				  unsigned int timeout)
>   {
> -	if (test_bit(WDT_OK_TO_CLOSE, &wdt_status))
> -		wdt_disable();
> -	else
> -		pr_crit("Device closed unexpectedly - timer will not stop\n");
> -	clear_bit(WDT_IN_USE, &wdt_status);
> -	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
> +	wdd->timeout = timeout;
> +	if (watchdog_active(wdd))
> +		ixp4xx_wdt_start(wdd);
>   
>   	return 0;
>   }
>   
> -
> -static const struct file_operations ixp4xx_wdt_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.write		= ixp4xx_wdt_write,
> -	.unlocked_ioctl	= ixp4xx_wdt_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> -	.open		= ixp4xx_wdt_open,
> -	.release	= ixp4xx_wdt_release,
> +static const struct watchdog_ops ixp4xx_wdt_ops = {
> +	.start = ixp4xx_wdt_start,
> +	.stop = ixp4xx_wdt_stop,
> +	.set_timeout = ixp4xx_wdt_set_timeout,
> +	.owner = THIS_MODULE,
>   };
>   
> -static struct miscdevice ixp4xx_wdt_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &ixp4xx_wdt_fops,
> +static const struct watchdog_info ixp4xx_wdt_info = {
> +	.options = WDIOF_KEEPALIVEPING
> +		| WDIOF_MAGICCLOSE
> +		| WDIOF_SETTIMEOUT,
> +	.identity = KBUILD_MODNAME,
>   };
>   
> -static int __init ixp4xx_wdt_init(void)
> +static int ixp4xx_wdt_probe(struct platform_device *pdev)
>   {
> +	struct device *dev = &pdev->dev;
> +	struct ixp4xx_wdt *iwdt;
>   	int ret;
>   
> -	ret = ixp4xx_boot_status();
> -	if (ret < 0)
> -		return ret;
> -
> -	boot_status = ret ?  WDIOF_CARDRESET : 0;
> -
>   	if (!(read_cpuid_id() & 0xf) && !cpu_is_ixp46x()) {
> -		pr_err("Rev. A0 IXP42x CPU detected - watchdog disabled\n");
> -
> +		dev_err(dev, "Rev. A0 IXP42x CPU detected - watchdog disabled\n");
>   		return -ENODEV;
>   	}
> -	ret = misc_register(&ixp4xx_wdt_miscdev);
> -	if (ret == 0)
> -		pr_info("timer heartbeat %d sec\n", heartbeat);
> -	return ret;
> -}
>   
> -static void __exit ixp4xx_wdt_exit(void)
> -{
> -	misc_deregister(&ixp4xx_wdt_miscdev);
> -}
> +	iwdt = devm_kzalloc(dev, sizeof(*iwdt), GFP_KERNEL);
> +	if (!iwdt)
> +		return -ENOMEM;
> +	iwdt->dev = dev;
> +	iwdt->base = dev->platform_data;
> +	/*
> +	 * TODO: retrieve from a fixed clock in the device tree from dev->parent?
> +	 * max timeout becomes ~64 seconds at this rate.
> +	 */
> +	iwdt->rate = 66666000;
> +

In the old driver this seems to be tick_rate. That variable still exists
but doesn't seem to be used in the timer driver anymore and should be removed
there.

I understand that in practice the frequency is fixed to that value. Cleaner
code would either get it from devicetree, or it would be passed in platform
data. If you don't want to do that, please add a comment that it isn't passed
through platform data because it is constant anyway.

That leads to the question why a variable is used in the first place.
Using a variable suggests that this code may change in the future.
It seems to me that this is a bit unlikely. Why not just use a constant,
such as IXP4XX_TIMER_FREQ ?

> +	iwdt->wdd.info = &ixp4xx_wdt_info;
> +	iwdt->wdd.ops = &ixp4xx_wdt_ops;
> +	iwdt->wdd.min_timeout = 1;
> +	iwdt->wdd.max_timeout = U32_MAX / iwdt->rate;
> +	iwdt->wdd.parent = dev;
> +	/* Default to 60 seconds */
> +	iwdt->wdd.timeout = 60U;
> +	watchdog_init_timeout(&iwdt->wdd, 0, dev);
> +
> +	if (__raw_readl(iwdt->base + IXP4XX_OSST_OFFSET) &
> +	    IXP4XX_OSST_TIMER_WARM_RESET)
> +		iwdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	ret = devm_watchdog_register_device(dev, &iwdt->wdd);
> +	if (ret)
> +		return ret;
>   
> +	platform_set_drvdata(pdev, iwdt);

Is that used anywhere ?

> +	dev_info(dev, "IXP4xx watchdog driver enabled\n");

It isn't really enabled, though, just instantiated.

>   
> -module_init(ixp4xx_wdt_init);
> -module_exit(ixp4xx_wdt_exit);
> +	return 0;
> +}
> +
> +static struct platform_driver ixp4xx_wdt_driver = {
> +	.probe = ixp4xx_wdt_probe,
> +	.driver = {
> +		.name   = "ixp4xx-watchdog",
> +	},
> +};
> +module_platform_driver(ixp4xx_wdt_driver);
>   
>   MODULE_AUTHOR("Deepak Saxena <dsaxena@plexity.net>");
>   MODULE_DESCRIPTION("IXP4xx Network Processor Watchdog");
> -
> -module_param(heartbeat, int, 0);
> -MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds (default 60s)");
> -
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started");
> -
>   MODULE_LICENSE("GPL");
> diff --git a/include/linux/platform_data/timer-ixp4xx.h b/include/linux/platform_data/timer-ixp4xx.h
> index 39bdecda1057..ee92ae7edaed 100644
> --- a/include/linux/platform_data/timer-ixp4xx.h
> +++ b/include/linux/platform_data/timer-ixp4xx.h
> @@ -8,17 +8,4 @@ void __init ixp4xx_timer_setup(resource_size_t timerbase,
>   			       int timer_irq,
>   			       unsigned int timer_freq);
>   
> -#ifdef CONFIG_IXP4XX_TIMER
> -void ixp4xx_wdt_set(int heartbeat);
> -int ixp4xx_boot_status(void);
> -#else
> -static inline void ixp4xx_wdt_set(int heartbeat)
> -{
> -}
> -static inline int ixp4xx_boot_status(void)
> -{
> -	return -ENXIO;
> -}
> -#endif
> -
>   #endif
> 

