Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A6010111E
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2019 03:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKSCI5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 21:08:57 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34989 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfKSCI5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 21:08:57 -0500
Received: by mail-pg1-f196.google.com with SMTP id k32so4837409pgl.2;
        Mon, 18 Nov 2019 18:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8REMzbXh3fxv2iG+QahOsmp7zlHEsluCVfb8108Xamc=;
        b=s7GDGg1QePu2ll8zllv5p9rEn7LGMzhBXJ7ZKy1kfN/uXuF+lha1vFUucoENhb3l11
         xeO/T9+9QOze0VellRxZJRRDusmGDG2QHjxrO4XZH+R1GZ0f1yYVRWmgaurVoWLnDpoi
         Tu55hgssJUj/3Z9zeCv8wWauwYzVMWyi9rTluO3Vn0qmCFZg5MCXzrytN1IvPACqZJDE
         3CqIw4eLF/pfqa49j4/T6c0qvhlMnqy8PoWgoM+KBRJ5N+gNzntrgB91BsPlKptC3d35
         gArQ5+GfNS/sRlAkDfqXScEO7HOt0ZWomb3erWoOsLr3OcsIF4dsJG3wAbFhJgIta8Lv
         bRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8REMzbXh3fxv2iG+QahOsmp7zlHEsluCVfb8108Xamc=;
        b=tPJ6yf5skcdh/3fh9iHT6UYs02YXKpJ2j46gjJONrCkjhhBRHXMI56CVXbLJTSeRJk
         FbKaiUNuYSawbbscvqcEltju1+znB1f2DVGHvXzXxjRZdDmWU1cIy4Phiz4vRR6yENTw
         CoROZAa3vAap2jL77sxjZx07McQEIVX8cgyFXmlMUB4o0lNj/YFpn5l8MkhtQi9i8pBZ
         LQQAD4tKlcKuZ/3DuLNak8npx4jKCf7DhBxwzDjMZeA2LSYe2aCfMetnzpB+JnZMxY5O
         lpboqRacvUcubyxGYWaZ/FioSDFOx/xSioxBSMLrqq2+sBHgFAms31ZuQBIgb6DCwW+h
         1Beg==
X-Gm-Message-State: APjAAAVuHoPGjU2QOSSzsc840NLZs1+Mnm31ZSgHBQOqAAbFfvcOxdo3
        wjc8N/JrTA+eGoLBdCZTil4=
X-Google-Smtp-Source: APXvYqzyGob2YWvVlZ3UbBe3STMx0MAIumm1PEfMc/KTeHafWI044oDn3I9i4/v/ozwHsUfjp8s9dw==
X-Received: by 2002:a62:7f93:: with SMTP id a141mr2723258pfd.107.1574129336241;
        Mon, 18 Nov 2019 18:08:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k5sm812799pju.14.2019.11.18.18.08.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 18:08:55 -0800 (PST)
Subject: Re: [PATCH] watchdog: Remove iop_wdt
To:     Laura Abbott <labbott@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20191118220432.1611-1-labbott@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <29e94219-22ca-c873-7209-64d1c357fe5c@roeck-us.net>
Date:   Mon, 18 Nov 2019 18:08:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118220432.1611-1-labbott@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/18/19 2:04 PM, Laura Abbott wrote:
> 
> Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> removed support for some old platforms. Given this driver depends on
> a now removed platform, just remove the driver.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> Found this while reviewing config options. Not sure if this was kept
> around for other reasons or just missed.
> ---
>   drivers/watchdog/Kconfig   |  16 ---
>   drivers/watchdog/Makefile  |   1 -
>   drivers/watchdog/iop_wdt.c | 249 -------------------------------------
>   3 files changed, 266 deletions(-)
>   delete mode 100644 drivers/watchdog/iop_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c100b6ad..fef9078a44b6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
>   
>   	  Say N if you are unsure.
>   
> -config IOP_WATCHDOG
> -	tristate "IOP Watchdog"
> -	depends on ARCH_IOP13XX
> -	select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)

This is a bit confusing, but it suggests that the watchdog may also work
with ARCH_IOP32X, which is still supported. I don't know anything about
those architectures, but I hesitate to have the driver removed unless
we have confirmation that it won't work with ARCH_IOP32X.
Maybe the dependency needs to be updated instead ?

Thanks,
Guenter

> -	help
> -	  Say Y here if to include support for the watchdog timer
> -	  in the Intel IOP3XX & IOP13XX I/O Processors.  This driver can
> -	  be built as a module by choosing M. The module will
> -	  be called iop_wdt.
> -
> -	  Note: The IOP13XX watchdog does an Internal Bus Reset which will
> -	  affect both cores and the peripherals of the IOP.  The ATU-X
> -	  and/or ATUe configuration registers will remain intact, but if
> -	  operating as an Root Complex and/or Central Resource, the PCI-X
> -	  and/or PCIe busses will also be reset.  THIS IS A VERY BIG HAMMER.
> -
>   config DAVINCI_WATCHDOG
>   	tristate "DaVinci watchdog"
>   	depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352bf3372..9de21f5ce909 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -55,7 +55,6 @@ obj-$(CONFIG_SAMA5D4_WATCHDOG) += sama5d4_wdt.o
>   obj-$(CONFIG_DW_WATCHDOG) += dw_wdt.o
>   obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
>   obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
> -obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
>   obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
>   obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
>   obj-$(CONFIG_SUNXI_WATCHDOG) += sunxi_wdt.o
> diff --git a/drivers/watchdog/iop_wdt.c b/drivers/watchdog/iop_wdt.c
> deleted file mode 100644
> index a9ccdb9a9159..000000000000
> --- a/drivers/watchdog/iop_wdt.c
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * drivers/char/watchdog/iop_wdt.c
> - *
> - * WDT driver for Intel I/O Processors
> - * Copyright (C) 2005, Intel Corporation.
> - *
> - * Based on ixp4xx driver, Copyright 2004 (c) MontaVista, Software, Inc.
> - *
> - *	Curt E Bruns <curt.e.bruns@intel.com>
> - *	Peter Milne <peter.milne@d-tacq.com>
> - *	Dan Williams <dan.j.williams@intel.com>
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/init.h>
> -#include <linux/device.h>
> -#include <linux/miscdevice.h>
> -#include <linux/watchdog.h>
> -#include <linux/uaccess.h>
> -#include <mach/hardware.h>
> -
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -static unsigned long wdt_status;
> -static unsigned long boot_status;
> -static DEFINE_SPINLOCK(wdt_lock);
> -
> -#define WDT_IN_USE		0
> -#define WDT_OK_TO_CLOSE		1
> -#define WDT_ENABLED		2
> -
> -static unsigned long iop_watchdog_timeout(void)
> -{
> -	return (0xffffffffUL / get_iop_tick_rate());
> -}
> -
> -/**
> - * wdt_supports_disable - determine if we are accessing a iop13xx watchdog
> - * or iop3xx by whether it has a disable command
> - */
> -static int wdt_supports_disable(void)
> -{
> -	int can_disable;
> -
> -	if (IOP_WDTCR_EN_ARM != IOP_WDTCR_DIS_ARM)
> -		can_disable = 1;
> -	else
> -		can_disable = 0;
> -
> -	return can_disable;
> -}
> -
> -static void wdt_enable(void)
> -{
> -	/* Arm and enable the Timer to starting counting down from 0xFFFF.FFFF
> -	 * Takes approx. 10.7s to timeout
> -	 */
> -	spin_lock(&wdt_lock);
> -	write_wdtcr(IOP_WDTCR_EN_ARM);
> -	write_wdtcr(IOP_WDTCR_EN);
> -	spin_unlock(&wdt_lock);
> -}
> -
> -/* returns 0 if the timer was successfully disabled */
> -static int wdt_disable(void)
> -{
> -	/* Stop Counting */
> -	if (wdt_supports_disable()) {
> -		spin_lock(&wdt_lock);
> -		write_wdtcr(IOP_WDTCR_DIS_ARM);
> -		write_wdtcr(IOP_WDTCR_DIS);
> -		clear_bit(WDT_ENABLED, &wdt_status);
> -		spin_unlock(&wdt_lock);
> -		pr_info("Disabled\n");
> -		return 0;
> -	} else
> -		return 1;
> -}
> -
> -static int iop_wdt_open(struct inode *inode, struct file *file)
> -{
> -	if (test_and_set_bit(WDT_IN_USE, &wdt_status))
> -		return -EBUSY;
> -
> -	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -	wdt_enable();
> -	set_bit(WDT_ENABLED, &wdt_status);
> -	return stream_open(inode, file);
> -}
> -
> -static ssize_t iop_wdt_write(struct file *file, const char *data, size_t len,
> -		  loff_t *ppos)
> -{
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
> -	.options = WDIOF_CARDRESET | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
> -	.identity = "iop watchdog",
> -};
> -
> -static long iop_wdt_ioctl(struct file *file,
> -				unsigned int cmd, unsigned long arg)
> -{
> -	int options;
> -	int ret = -ENOTTY;
> -	int __user *argp = (int __user *)arg;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		if (copy_to_user(argp, &ident, sizeof(ident)))
> -			ret = -EFAULT;
> -		else
> -			ret = 0;
> -		break;
> -
> -	case WDIOC_GETSTATUS:
> -		ret = put_user(0, argp);
> -		break;
> -
> -	case WDIOC_GETBOOTSTATUS:
> -		ret = put_user(boot_status, argp);
> -		break;
> -
> -	case WDIOC_SETOPTIONS:
> -		if (get_user(options, (int *)arg))
> -			return -EFAULT;
> -
> -		if (options & WDIOS_DISABLECARD) {
> -			if (!nowayout) {
> -				if (wdt_disable() == 0) {
> -					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -					ret = 0;
> -				} else
> -					ret = -ENXIO;
> -			} else
> -				ret = 0;
> -		}
> -		if (options & WDIOS_ENABLECARD) {
> -			wdt_enable();
> -			ret = 0;
> -		}
> -		break;
> -
> -	case WDIOC_KEEPALIVE:
> -		wdt_enable();
> -		ret = 0;
> -		break;
> -
> -	case WDIOC_GETTIMEOUT:
> -		ret = put_user(iop_watchdog_timeout(), argp);
> -		break;
> -	}
> -	return ret;
> -}
> -
> -static int iop_wdt_release(struct inode *inode, struct file *file)
> -{
> -	int state = 1;
> -	if (test_bit(WDT_OK_TO_CLOSE, &wdt_status))
> -		if (test_bit(WDT_ENABLED, &wdt_status))
> -			state = wdt_disable();
> -
> -	/* if the timer is not disabled reload and notify that we are still
> -	 * going down
> -	 */
> -	if (state != 0) {
> -		wdt_enable();
> -		pr_crit("Device closed unexpectedly - reset in %lu seconds\n",
> -			iop_watchdog_timeout());
> -	}
> -
> -	clear_bit(WDT_IN_USE, &wdt_status);
> -	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
> -
> -	return 0;
> -}
> -
> -static const struct file_operations iop_wdt_fops = {
> -	.owner = THIS_MODULE,
> -	.llseek = no_llseek,
> -	.write = iop_wdt_write,
> -	.unlocked_ioctl = iop_wdt_ioctl,
> -	.open = iop_wdt_open,
> -	.release = iop_wdt_release,
> -};
> -
> -static struct miscdevice iop_wdt_miscdev = {
> -	.minor = WATCHDOG_MINOR,
> -	.name = "watchdog",
> -	.fops = &iop_wdt_fops,
> -};
> -
> -static int __init iop_wdt_init(void)
> -{
> -	int ret;
> -
> -	/* check if the reset was caused by the watchdog timer */
> -	boot_status = (read_rcsr() & IOP_RCSR_WDT) ? WDIOF_CARDRESET : 0;
> -
> -	/* Configure Watchdog Timeout to cause an Internal Bus (IB) Reset
> -	 * NOTE: An IB Reset will Reset both cores in the IOP342
> -	 */
> -	write_wdtsr(IOP13XX_WDTCR_IB_RESET);
> -
> -	/* Register after we have the device set up so we cannot race
> -	   with an open */
> -	ret = misc_register(&iop_wdt_miscdev);
> -	if (ret == 0)
> -		pr_info("timeout %lu sec\n", iop_watchdog_timeout());
> -
> -	return ret;
> -}
> -
> -static void __exit iop_wdt_exit(void)
> -{
> -	misc_deregister(&iop_wdt_miscdev);
> -}
> -
> -module_init(iop_wdt_init);
> -module_exit(iop_wdt_exit);
> -
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started");
> -
> -MODULE_AUTHOR("Curt E Bruns <curt.e.bruns@intel.com>");
> -MODULE_DESCRIPTION("iop watchdog timer driver");
> -MODULE_LICENSE("GPL");
> 

