Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E072A96B6
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 14:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgKFNKP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 08:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgKFNKO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 08:10:14 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212E4C0613CF;
        Fri,  6 Nov 2020 05:10:12 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id h62so1152265oth.9;
        Fri, 06 Nov 2020 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=exqQSD16DtK0lGVJ/OFqZbHZoCebT8W8YeYObBcXBWo=;
        b=auggjZz394zDHIfi1xOzhaVmOVY3Lt0sCmHimUsW8Q7cOeKnG9mhBQ9KLqpVvkI4BT
         z7GJSqSRiRELwRJdqvmueGM25jvmDXKnmbYG6B3nS5ihwc3oLz0b5OETdZErSat48Utx
         iYS84h5EuMhCUUXPzARthvPxUzSJth0invAPPO1SnJg1dbGV8J6kcOlxQpGMuJ/jPBOx
         vW58I0a5flJYDX9fyK50WOz2Z9Gst2RyuuyuCFBXA3UE23qUHqAWD4dut369UedVo4tK
         OeyMhkKmGV8HoyAujlU4Lv0L1EKAegfxLCT0y8b0Rz82LBM5BLHAK5chTo4QizOlDiWL
         tV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=exqQSD16DtK0lGVJ/OFqZbHZoCebT8W8YeYObBcXBWo=;
        b=BEFG4jYEDk20p/qqkSXuhE/yD1QAxE0CWlDs/9K9Z7FooyphUm2t6F1FkYeRBpgh+b
         FLP1vzR7hwYg97uYwJp5FNnryxBtAXUcPGYz7uORBK4IGnNW6KAp4wpOoRzVA53TEQZR
         ta5v/VIq3i+nXjFUB1uz212CO4tnjd+dzmgqEKiuLOh5Hy1AE3wXwAuSy6giT5SWuBHE
         1AQNFDYxfcI6OLyGI23UqJstCCj0v/QcaA0+hT9yRJowPapujhIdeve6iPIGd2w9i/WZ
         6SYf0gkvVknis45eh/UHej8d41f9TTAQNsIm55UcUexHfpEShftoGOXrqGGsthIYWZ/b
         odGw==
X-Gm-Message-State: AOAM530UIwGiTFqRn1MfK8m/66/Td09qIIrZYHtr13/ar4r7PGIhrTFA
        XPa7grixiv1izRV9E79+pjmx+/NgpAQ=
X-Google-Smtp-Source: ABdhPJxgRbOzopX/63Hud3e7GFowAR+4OFz5t4r9wSJQ+uCM4uA9OW+rW6MoughzJ0+523TAqV+ibw==
X-Received: by 2002:a9d:2902:: with SMTP id d2mr1165024otb.280.1604668211380;
        Fri, 06 Nov 2020 05:10:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7sm244082oig.42.2020.11.06.05.10.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 05:10:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 6 Nov 2020 05:10:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: remove pnx83xx driver
Message-ID: <20201106131009.GB14837@roeck-us.net>
References: <20201106130508.103598-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106130508.103598-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 06, 2020 at 02:05:07PM +0100, Thomas Bogendoerfer wrote:
> Commit 625326ea9c84 ("MIPS: Remove PNX833x alias NXP_STB22x") removed
> support for PNX833x, so it's time to remove watchdog driver, too.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig       |  10 --
>  drivers/watchdog/Makefile      |   1 -
>  drivers/watchdog/pnx833x_wdt.c | 277 -----------------------------------------
>  3 files changed, 288 deletions(-)
>  delete mode 100644 drivers/watchdog/pnx833x_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..f045203f7ebf 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1696,16 +1696,6 @@ config WDT_MTX1
>  	  Hardware driver for the MTX-1 boards. This is a watchdog timer that
>  	  will reboot the machine after a 100 seconds timer expired.
>  
> -config PNX833X_WDT
> -	tristate "PNX833x Hardware Watchdog"
> -	depends on SOC_PNX8335
> -	depends on BROKEN
> -	help
> -	  Hardware driver for the PNX833x's watchdog. This is a
> -	  watchdog timer that will reboot the machine after a programmable
> -	  timer has expired and no process has written to /dev/watchdog during
> -	  that time.
> -
>  config SIBYTE_WDOG
>  	tristate "Sibyte SoC hardware watchdog"
>  	depends on CPU_SB1 || (MIPS && COMPILE_TEST)
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 071a2e50be98..5c74ee19d441 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -161,7 +161,6 @@ obj-$(CONFIG_RC32434_WDT) += rc32434_wdt.o
>  obj-$(CONFIG_INDYDOG) += indydog.o
>  obj-$(CONFIG_JZ4740_WDT) += jz4740_wdt.o
>  obj-$(CONFIG_WDT_MTX1) += mtx-1_wdt.o
> -obj-$(CONFIG_PNX833X_WDT) += pnx833x_wdt.o
>  obj-$(CONFIG_SIBYTE_WDOG) += sb_wdog.o
>  obj-$(CONFIG_AR7_WDT) += ar7_wdt.o
>  obj-$(CONFIG_TXX9_WDT) += txx9wdt.o
> diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
> deleted file mode 100644
> index 4097d076aab8..000000000000
> --- a/drivers/watchdog/pnx833x_wdt.c
> +++ /dev/null
> @@ -1,277 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *  PNX833x Hardware Watchdog Driver
> - *  Copyright 2008 NXP Semiconductors
> - *  Daniel Laird <daniel.j.laird@nxp.com>
> - *  Andre McCurdy <andre.mccurdy@nxp.com>
> - *
> - *  Heavily based upon - IndyDog	0.3
> - *  A Hardware Watchdog Device for SGI IP22
> - *
> - * (c) Copyright 2002 Guido Guenther <agx@sigxcpu.org>, All Rights Reserved.
> - *
> - * based on softdog.c by Alan Cox <alan@redhat.com>
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/types.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/mm.h>
> -#include <linux/miscdevice.h>
> -#include <linux/watchdog.h>
> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/init.h>
> -#include <asm/mach-pnx833x/pnx833x.h>
> -
> -#define WATCHDOG_TIMEOUT 30		/* 30 sec Maximum timeout */
> -#define WATCHDOG_COUNT_FREQUENCY 68000000U /* Watchdog counts at 68MHZ. */
> -#define	PNX_WATCHDOG_TIMEOUT	(WATCHDOG_TIMEOUT * WATCHDOG_COUNT_FREQUENCY)
> -#define PNX_TIMEOUT_VALUE	2040000000U
> -
> -/** CONFIG block */
> -#define PNX833X_CONFIG                      (0x07000U)
> -#define PNX833X_CONFIG_CPU_WATCHDOG         (0x54)
> -#define PNX833X_CONFIG_CPU_WATCHDOG_COMPARE (0x58)
> -#define PNX833X_CONFIG_CPU_COUNTERS_CONTROL (0x1c)
> -
> -/** RESET block */
> -#define PNX833X_RESET                       (0x08000U)
> -#define PNX833X_RESET_CONFIG                (0x08)
> -
> -static int pnx833x_wdt_alive;
> -
> -/* Set default timeout in MHZ.*/
> -static int pnx833x_wdt_timeout = PNX_WATCHDOG_TIMEOUT;
> -module_param(pnx833x_wdt_timeout, int, 0);
> -MODULE_PARM_DESC(timeout, "Watchdog timeout in Mhz. (68Mhz clock), default="
> -			__MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");
> -
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> -					__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -#define START_DEFAULT	1
> -static int start_enabled = START_DEFAULT;
> -module_param(start_enabled, int, 0);
> -MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
> -				"(default=" __MODULE_STRING(START_DEFAULT) ")");
> -
> -static void pnx833x_wdt_start(void)
> -{
> -	/* Enable watchdog causing reset. */
> -	PNX833X_REG(PNX833X_RESET + PNX833X_RESET_CONFIG) |= 0x1;
> -	/* Set timeout.*/
> -	PNX833X_REG(PNX833X_CONFIG +
> -		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
> -	/* Enable watchdog. */
> -	PNX833X_REG(PNX833X_CONFIG +
> -				PNX833X_CONFIG_CPU_COUNTERS_CONTROL) |= 0x1;
> -
> -	pr_info("Started watchdog timer\n");
> -}
> -
> -static void pnx833x_wdt_stop(void)
> -{
> -	/* Disable watchdog causing reset. */
> -	PNX833X_REG(PNX833X_RESET + PNX833X_CONFIG) &= 0xFFFFFFFE;
> -	/* Disable watchdog.*/
> -	PNX833X_REG(PNX833X_CONFIG +
> -			PNX833X_CONFIG_CPU_COUNTERS_CONTROL) &= 0xFFFFFFFE;
> -
> -	pr_info("Stopped watchdog timer\n");
> -}
> -
> -static void pnx833x_wdt_ping(void)
> -{
> -	PNX833X_REG(PNX833X_CONFIG +
> -		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
> -}
> -
> -/*
> - *	Allow only one person to hold it open
> - */
> -static int pnx833x_wdt_open(struct inode *inode, struct file *file)
> -{
> -	if (test_and_set_bit(0, &pnx833x_wdt_alive))
> -		return -EBUSY;
> -
> -	if (nowayout)
> -		__module_get(THIS_MODULE);
> -
> -	/* Activate timer */
> -	if (!start_enabled)
> -		pnx833x_wdt_start();
> -
> -	pnx833x_wdt_ping();
> -
> -	pr_info("Started watchdog timer\n");
> -
> -	return stream_open(inode, file);
> -}
> -
> -static int pnx833x_wdt_release(struct inode *inode, struct file *file)
> -{
> -	/* Shut off the timer.
> -	 * Lock it in if it's a module and we defined ...NOWAYOUT */
> -	if (!nowayout)
> -		pnx833x_wdt_stop(); /* Turn the WDT off */
> -
> -	clear_bit(0, &pnx833x_wdt_alive);
> -	return 0;
> -}
> -
> -static ssize_t pnx833x_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
> -{
> -	/* Refresh the timer. */
> -	if (len)
> -		pnx833x_wdt_ping();
> -
> -	return len;
> -}
> -
> -static long pnx833x_wdt_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> -{
> -	int options, new_timeout = 0;
> -	uint32_t timeout, timeout_left = 0;
> -
> -	static const struct watchdog_info ident = {
> -		.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> -		.firmware_version = 0,
> -		.identity = "Hardware Watchdog for PNX833x",
> -	};
> -
> -	switch (cmd) {
> -	default:
> -		return -ENOTTY;
> -
> -	case WDIOC_GETSUPPORT:
> -		if (copy_to_user((struct watchdog_info *)arg,
> -				 &ident, sizeof(ident)))
> -			return -EFAULT;
> -		return 0;
> -
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, (int *)arg);
> -
> -	case WDIOC_SETOPTIONS:
> -		if (get_user(options, (int *)arg))
> -			return -EFAULT;
> -
> -		if (options & WDIOS_DISABLECARD)
> -			pnx833x_wdt_stop();
> -
> -		if (options & WDIOS_ENABLECARD)
> -			pnx833x_wdt_start();
> -
> -		return 0;
> -
> -	case WDIOC_KEEPALIVE:
> -		pnx833x_wdt_ping();
> -		return 0;
> -
> -	case WDIOC_SETTIMEOUT:
> -	{
> -		if (get_user(new_timeout, (int *)arg))
> -			return -EFAULT;
> -
> -		pnx833x_wdt_timeout = new_timeout;
> -		PNX833X_REG(PNX833X_CONFIG +
> -			PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = new_timeout;
> -		return put_user(new_timeout, (int *)arg);
> -	}
> -
> -	case WDIOC_GETTIMEOUT:
> -		timeout = PNX833X_REG(PNX833X_CONFIG +
> -					PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
> -		return put_user(timeout, (int *)arg);
> -
> -	case WDIOC_GETTIMELEFT:
> -		timeout_left = PNX833X_REG(PNX833X_CONFIG +
> -						PNX833X_CONFIG_CPU_WATCHDOG);
> -		return put_user(timeout_left, (int *)arg);
> -
> -	}
> -}
> -
> -static int pnx833x_wdt_notify_sys(struct notifier_block *this,
> -					unsigned long code, void *unused)
> -{
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		pnx833x_wdt_stop(); /* Turn the WDT off */
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static const struct file_operations pnx833x_wdt_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.write		= pnx833x_wdt_write,
> -	.unlocked_ioctl	= pnx833x_wdt_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> -	.open		= pnx833x_wdt_open,
> -	.release	= pnx833x_wdt_release,
> -};
> -
> -static struct miscdevice pnx833x_wdt_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &pnx833x_wdt_fops,
> -};
> -
> -static struct notifier_block pnx833x_wdt_notifier = {
> -	.notifier_call = pnx833x_wdt_notify_sys,
> -};
> -
> -static int __init watchdog_init(void)
> -{
> -	int ret, cause;
> -
> -	/* Lets check the reason for the reset.*/
> -	cause = PNX833X_REG(PNX833X_RESET);
> -	/*If bit 31 is set then watchdog was cause of reset.*/
> -	if (cause & 0x80000000) {
> -		pr_info("The system was previously reset due to the watchdog firing - please investigate...\n");
> -	}
> -
> -	ret = register_reboot_notifier(&pnx833x_wdt_notifier);
> -	if (ret) {
> -		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> -		return ret;
> -	}
> -
> -	ret = misc_register(&pnx833x_wdt_miscdev);
> -	if (ret) {
> -		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> -		       WATCHDOG_MINOR, ret);
> -		unregister_reboot_notifier(&pnx833x_wdt_notifier);
> -		return ret;
> -	}
> -
> -	pr_info("Hardware Watchdog Timer for PNX833x: Version 0.1\n");
> -
> -	if (start_enabled)
> -		pnx833x_wdt_start();
> -
> -	return 0;
> -}
> -
> -static void __exit watchdog_exit(void)
> -{
> -	misc_deregister(&pnx833x_wdt_miscdev);
> -	unregister_reboot_notifier(&pnx833x_wdt_notifier);
> -}
> -
> -module_init(watchdog_init);
> -module_exit(watchdog_exit);
> -
> -MODULE_AUTHOR("Daniel Laird/Andre McCurdy");
> -MODULE_DESCRIPTION("Hardware Watchdog Device for PNX833x");
> -MODULE_LICENSE("GPL");
> -- 
> 2.16.4
> 
