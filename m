Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2578C3EEE82
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Aug 2021 16:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhHQOaB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Aug 2021 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239844AbhHQO3n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Aug 2021 10:29:43 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59963C0613C1;
        Tue, 17 Aug 2021 07:29:06 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id be20so32134693oib.8;
        Tue, 17 Aug 2021 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ndrJpz0Hl8KtUy1gsyzdUrQjEaLMnHBV4TdvfVbpfQc=;
        b=Xao4XokWGO6fa2+V6AySWzt2xprivqlOJULbnf6UPFdb76E4GhQ4ePzfI77bCZsjh5
         rN6cvBpEYwr2Y2Le4Du0UKhojYDp51NzIbtpghxXEs9WJDsHrScGYW+aySeIQ1ALaPQD
         cojA2FoHUFjR+ko0UWXYdk2Gz9kCQA34n3cWLIID5H9JWhnfBdzIvb7sY46QSEK+CC/o
         3ztG+6/dkOMGtpX/9WXe6IkSjWrZ91km44lCYgq8n1w5qf2jhnaVDWvrgje2ZGj24QzU
         chVQG+IdIe6Be0zp9TyLVqb1yjW0I/JFjrg5NlJ0tib6aX8qwJ0HYxZLVESdpehXOkkJ
         z5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ndrJpz0Hl8KtUy1gsyzdUrQjEaLMnHBV4TdvfVbpfQc=;
        b=pd6jII1hZy1p/BPG0PdlGd5upocqYqR00DAPk69Yxf0GwhShVX4tG8IPbe9qFQob6k
         Bl5YUo15ny8L9WTr93SiTWcsc9fd0997GoHglUfT0e27yLoBL82P1sUdRaXXN5BUj0xa
         kG8ZStAp/e1hXwulUi5WNEXvOSPnYa2OM7R6m+aKGPKtr3fOH5fSM85KN7iul5u6TH7l
         urSxHQZVRFXwVJt/Nue79NFWPAgvqLvPK5ZONlJ6gHkj9cUnuKI7Qxn2BhxmZF3G9mBp
         1qFoEJckufeJwjoLQo9zCtQnhHesi6IXVcAmPaw6cIuvISH3gL/nc3btEx40NMEsU8bg
         cviQ==
X-Gm-Message-State: AOAM530AlrMv4DjicWdASqNTOodH+LQahyGo1BklWlnrmEeNes8OQXTb
        OSYiC5WHUKBKHZN5DU3UBUPsLam1/N8=
X-Google-Smtp-Source: ABdhPJyK+oMZ/CeAEW+BKoD1u0Z6RCXu7gVz0Ve7xPOHylso8Mtjo2PMcz5Jtdvtmz4PDg2vxBJKww==
X-Received: by 2002:a05:6808:114c:: with SMTP id u12mr2692649oiu.72.1629210545360;
        Tue, 17 Aug 2021 07:29:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg9sm499958oib.26.2021.08.17.07.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 07:29:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: remove dead iop watchdog timer driver
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210817100845.11626-1-lukas.bulwahn@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bfce87b6-72c8-7121-ae53-2894e7e6d349@roeck-us.net>
Date:   Tue, 17 Aug 2021 07:29:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817100845.11626-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/17/21 3:08 AM, Lukas Bulwahn wrote:
> Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
> removes the config ARCH_IOP13XX in ./arch/arm/Kconfig.
> 
> Hence, since then, the corresponding iop watchdog timer driver is dead
> code. Remove this dead driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig   |  16 ---
>   drivers/watchdog/Makefile  |   1 -
>   drivers/watchdog/iop_wdt.c | 250 -------------------------------------
>   3 files changed, 267 deletions(-)
>   delete mode 100644 drivers/watchdog/iop_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0bc7046ab942..bcfb94064c7d 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -573,22 +573,6 @@ config PNX4008_WATCHDOG
>   
>   	  Say N if you are unsure.
>   
> -config IOP_WATCHDOG
> -	tristate "IOP Watchdog"
> -	depends on ARCH_IOP13XX
> -	select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
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
> index abaf2ebd814e..a5ecf2287685 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -56,7 +56,6 @@ obj-$(CONFIG_SAMA5D4_WATCHDOG) += sama5d4_wdt.o
>   obj-$(CONFIG_DW_WATCHDOG) += dw_wdt.o
>   obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
>   obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
> -obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
>   obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
>   obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
>   obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
> diff --git a/drivers/watchdog/iop_wdt.c b/drivers/watchdog/iop_wdt.c
> deleted file mode 100644
> index 6bf68d4750de..000000000000
> --- a/drivers/watchdog/iop_wdt.c
> +++ /dev/null
> @@ -1,250 +0,0 @@
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
> -	.compat_ioctl = compat_ptr_ioctl,
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

