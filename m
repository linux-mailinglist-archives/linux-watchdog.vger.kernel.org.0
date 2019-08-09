Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9477588438
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfHIUmu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 16:42:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46585 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHIUmu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 16:42:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id c3so23500219pfa.13;
        Fri, 09 Aug 2019 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9vkbN0k3d6UiehpV8zG17YaBWJvxWazjviyK1pGeCOA=;
        b=JVJ5jVmblcqdkFVKd7cmn0PxBcbHHZxCOJ69TFkG14VC+W2NHBMbRP5noW/gq+5H4c
         NceBbywE9BXbHvmqS77IygPNVkWsBXXVXXA31Jfw6prjt3z1WP8tnEZPpovwMt201GlE
         wzYtrO/M0RW/qJ2MtnlG4DzrgjKP9VYMjqXloO6OQbHb/o8+G9wcq5/ITAhRUSehQ07J
         kY9e34VvhX5aecqJvNgfzwZm927rK2N5myEvYWBbbpgfjSuEgmdomazSvSQWbBc6xGdZ
         7iyrxFiDmspCz+9kAzo/oDM7n9PgphptI8dz1rQxUo07OpStZV5ZWs70wItInLmWRpp5
         2ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9vkbN0k3d6UiehpV8zG17YaBWJvxWazjviyK1pGeCOA=;
        b=nKE2eVQh/sb/v+eC2ngKUVOCNBznDti4OKnOc1sMs4mV++vRI8T/SwemGBBwfz6rTX
         RC2rMauFMx+omQW6UNKfuLe4LDsA6MArqhs1aOD88f3GrUkOFtFkUjhRDhBd6eBOJuxl
         kBMBDdS3ZcC+Lt4sDgYuHMr1TU7JBWo9mi+ZN2qZh+aRzhLQwFUn1uKXjII3Xe1uWelP
         E4+MHUSL181NXQxFDYiyuw92uZ4qJkYLTgav2uI5PmE+heqfzBtuDsENuHY2O1hBrJ6V
         O4XWPaWP1e5BXm5GRXrjQDtCMnjjLbBYNZPaUY38u6pq362zpVLekGMaN/A7gVMYLxbm
         B2Wg==
X-Gm-Message-State: APjAAAXd0MUhf9FqbQgTl58SFMZ7fjo+B4lPDGJTpg1jT5Zz5t1CY2NK
        kzQ3BOnmA6wnactBdDNfuoM=
X-Google-Smtp-Source: APXvYqyz3XGCAbKPf9xyyL9mY78eaXmZJShSw7frplHDy6YpR5Lc+xeXbOwKoI7id4R+R5Rb+wdqvQ==
X-Received: by 2002:a62:2582:: with SMTP id l124mr23251600pfl.43.1565383369277;
        Fri, 09 Aug 2019 13:42:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm97231017pfe.163.2019.08.09.13.42.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 13:42:48 -0700 (PDT)
Date:   Fri, 9 Aug 2019 13:42:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] watchdog: remove w90x900 driver
Message-ID: <20190809204247.GB19839@roeck-us.net>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-7-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-7-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 10:27:34PM +0200, Arnd Bergmann wrote:
> The ARM w90x900 platform is getting removed, so this driver is obsolete
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/watchdog-parameters.rst          |  10 -
>  drivers/watchdog/Kconfig                      |   9 -
>  drivers/watchdog/Makefile                     |   1 -
>  drivers/watchdog/nuc900_wdt.c                 | 302 ------------------
>  4 files changed, 322 deletions(-)
>  delete mode 100644 drivers/watchdog/nuc900_wdt.c
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index 226aba56f704..223c99361a30 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -366,16 +366,6 @@ nic7018_wdt:
>  
>  -------------------------------------------------
>  
> -nuc900_wdt:
> -    heartbeat:
> -	Watchdog heartbeats in seconds.
> -	(default = 15)
> -    nowayout:
> -	Watchdog cannot be stopped once started
> -	(default=kernel config parameter)
> -
> --------------------------------------------------
> -
>  omap_wdt:
>      timer_margin:
>  	initial watchdog timeout (in seconds)
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index e631f1ae303a..0e64f501ef30 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -655,15 +655,6 @@ config STMP3XXX_RTC_WATCHDOG
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called stmp3xxx_rtc_wdt.
>  
> -config NUC900_WATCHDOG
> -	tristate "Nuvoton NUC900 watchdog"
> -	depends on ARCH_W90X900 || COMPILE_TEST
> -	help
> -	  Say Y here if to include support for the watchdog timer
> -	  for the Nuvoton NUC900 series SoCs.
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called nuc900_wdt.
> -
>  config TS4800_WATCHDOG
>  	tristate "TS-4800 Watchdog"
>  	depends on HAS_IOMEM && OF
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 85f55ec76f8d..b5a0aed537af 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -63,7 +63,6 @@ obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
>  obj-$(CONFIG_COH901327_WATCHDOG) += coh901327_wdt.o
>  obj-$(CONFIG_NPCM7XX_WATCHDOG) += npcm_wdt.o
>  obj-$(CONFIG_STMP3XXX_RTC_WATCHDOG) += stmp3xxx_rtc_wdt.o
> -obj-$(CONFIG_NUC900_WATCHDOG) += nuc900_wdt.o
>  obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
>  obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>  obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
> diff --git a/drivers/watchdog/nuc900_wdt.c b/drivers/watchdog/nuc900_wdt.c
> deleted file mode 100644
> index db124cebe838..000000000000
> --- a/drivers/watchdog/nuc900_wdt.c
> +++ /dev/null
> @@ -1,302 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2009 Nuvoton technology corporation.
> - *
> - * Wan ZongShun <mcuos.com@gmail.com>
> - */
> -
> -#include <linux/bitops.h>
> -#include <linux/errno.h>
> -#include <linux/fs.h>
> -#include <linux/io.h>
> -#include <linux/clk.h>
> -#include <linux/kernel.h>
> -#include <linux/miscdevice.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/interrupt.h>
> -#include <linux/types.h>
> -#include <linux/watchdog.h>
> -#include <linux/uaccess.h>
> -
> -#define REG_WTCR		0x1c
> -#define WTCLK			(0x01 << 10)
> -#define WTE			(0x01 << 7)	/*wdt enable*/
> -#define WTIS			(0x03 << 4)
> -#define WTIF			(0x01 << 3)
> -#define WTRF			(0x01 << 2)
> -#define WTRE			(0x01 << 1)
> -#define WTR			(0x01 << 0)
> -/*
> - * The watchdog time interval can be calculated via following formula:
> - * WTIS		real time interval (formula)
> - * 0x00		((2^ 14 ) * ((external crystal freq) / 256))seconds
> - * 0x01		((2^ 16 ) * ((external crystal freq) / 256))seconds
> - * 0x02		((2^ 18 ) * ((external crystal freq) / 256))seconds
> - * 0x03		((2^ 20 ) * ((external crystal freq) / 256))seconds
> - *
> - * The external crystal freq is 15Mhz in the nuc900 evaluation board.
> - * So 0x00 = +-0.28 seconds, 0x01 = +-1.12 seconds, 0x02 = +-4.48 seconds,
> - * 0x03 = +- 16.92 seconds..
> - */
> -#define WDT_HW_TIMEOUT		0x02
> -#define WDT_TIMEOUT		(HZ/2)
> -#define WDT_HEARTBEAT		15
> -
> -static int heartbeat = WDT_HEARTBEAT;
> -module_param(heartbeat, int, 0);
> -MODULE_PARM_DESC(heartbeat, "Watchdog heartbeats in seconds. "
> -	"(default = " __MODULE_STRING(WDT_HEARTBEAT) ")");
> -
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
> -	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> -struct nuc900_wdt {
> -	struct clk	 *wdt_clock;
> -	struct platform_device *pdev;
> -	void __iomem	 *wdt_base;
> -	char		 expect_close;
> -	struct timer_list timer;
> -	spinlock_t       wdt_lock;
> -	unsigned long next_heartbeat;
> -};
> -
> -static unsigned long nuc900wdt_busy;
> -static struct nuc900_wdt *nuc900_wdt;
> -
> -static inline void nuc900_wdt_keepalive(void)
> -{
> -	unsigned int val;
> -
> -	spin_lock(&nuc900_wdt->wdt_lock);
> -
> -	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
> -	val |= (WTR | WTIF);
> -	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
> -
> -	spin_unlock(&nuc900_wdt->wdt_lock);
> -}
> -
> -static inline void nuc900_wdt_start(void)
> -{
> -	unsigned int val;
> -
> -	spin_lock(&nuc900_wdt->wdt_lock);
> -
> -	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
> -	val |= (WTRE | WTE | WTR | WTCLK | WTIF);
> -	val &= ~WTIS;
> -	val |= (WDT_HW_TIMEOUT << 0x04);
> -	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
> -
> -	spin_unlock(&nuc900_wdt->wdt_lock);
> -
> -	nuc900_wdt->next_heartbeat = jiffies + heartbeat * HZ;
> -	mod_timer(&nuc900_wdt->timer, jiffies + WDT_TIMEOUT);
> -}
> -
> -static inline void nuc900_wdt_stop(void)
> -{
> -	unsigned int val;
> -
> -	del_timer(&nuc900_wdt->timer);
> -
> -	spin_lock(&nuc900_wdt->wdt_lock);
> -
> -	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
> -	val &= ~WTE;
> -	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
> -
> -	spin_unlock(&nuc900_wdt->wdt_lock);
> -}
> -
> -static inline void nuc900_wdt_ping(void)
> -{
> -	nuc900_wdt->next_heartbeat = jiffies + heartbeat * HZ;
> -}
> -
> -static int nuc900_wdt_open(struct inode *inode, struct file *file)
> -{
> -
> -	if (test_and_set_bit(0, &nuc900wdt_busy))
> -		return -EBUSY;
> -
> -	nuc900_wdt_start();
> -
> -	return stream_open(inode, file);
> -}
> -
> -static int nuc900_wdt_close(struct inode *inode, struct file *file)
> -{
> -	if (nuc900_wdt->expect_close == 42)
> -		nuc900_wdt_stop();
> -	else {
> -		dev_crit(&nuc900_wdt->pdev->dev,
> -			"Unexpected close, not stopping watchdog!\n");
> -		nuc900_wdt_ping();
> -	}
> -
> -	nuc900_wdt->expect_close = 0;
> -	clear_bit(0, &nuc900wdt_busy);
> -	return 0;
> -}
> -
> -static const struct watchdog_info nuc900_wdt_info = {
> -	.identity	= "nuc900 watchdog",
> -	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> -						WDIOF_MAGICCLOSE,
> -};
> -
> -static long nuc900_wdt_ioctl(struct file *file,
> -					unsigned int cmd, unsigned long arg)
> -{
> -	void __user *argp = (void __user *)arg;
> -	int __user *p = argp;
> -	int new_value;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(argp, &nuc900_wdt_info,
> -				sizeof(nuc900_wdt_info)) ? -EFAULT : 0;
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, p);
> -
> -	case WDIOC_KEEPALIVE:
> -		nuc900_wdt_ping();
> -		return 0;
> -
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_value, p))
> -			return -EFAULT;
> -
> -		heartbeat = new_value;
> -		nuc900_wdt_ping();
> -
> -		return put_user(new_value, p);
> -	case WDIOC_GETTIMEOUT:
> -		return put_user(heartbeat, p);
> -	default:
> -		return -ENOTTY;
> -	}
> -}
> -
> -static ssize_t nuc900_wdt_write(struct file *file, const char __user *data,
> -						size_t len, loff_t *ppos)
> -{
> -	if (!len)
> -		return 0;
> -
> -	/* Scan for magic character */
> -	if (!nowayout) {
> -		size_t i;
> -
> -		nuc900_wdt->expect_close = 0;
> -
> -		for (i = 0; i < len; i++) {
> -			char c;
> -			if (get_user(c, data + i))
> -				return -EFAULT;
> -			if (c == 'V') {
> -				nuc900_wdt->expect_close = 42;
> -				break;
> -			}
> -		}
> -	}
> -
> -	nuc900_wdt_ping();
> -	return len;
> -}
> -
> -static void nuc900_wdt_timer_ping(struct timer_list *unused)
> -{
> -	if (time_before(jiffies, nuc900_wdt->next_heartbeat)) {
> -		nuc900_wdt_keepalive();
> -		mod_timer(&nuc900_wdt->timer, jiffies + WDT_TIMEOUT);
> -	} else
> -		dev_warn(&nuc900_wdt->pdev->dev, "Will reset the machine !\n");
> -}
> -
> -static const struct file_operations nuc900wdt_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.unlocked_ioctl	= nuc900_wdt_ioctl,
> -	.open		= nuc900_wdt_open,
> -	.release	= nuc900_wdt_close,
> -	.write		= nuc900_wdt_write,
> -};
> -
> -static struct miscdevice nuc900wdt_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &nuc900wdt_fops,
> -};
> -
> -static int nuc900wdt_probe(struct platform_device *pdev)
> -{
> -	int ret = 0;
> -
> -	nuc900_wdt = devm_kzalloc(&pdev->dev, sizeof(*nuc900_wdt),
> -				GFP_KERNEL);
> -	if (!nuc900_wdt)
> -		return -ENOMEM;
> -
> -	nuc900_wdt->pdev = pdev;
> -
> -	spin_lock_init(&nuc900_wdt->wdt_lock);
> -
> -	nuc900_wdt->wdt_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(nuc900_wdt->wdt_base))
> -		return PTR_ERR(nuc900_wdt->wdt_base);
> -
> -	nuc900_wdt->wdt_clock = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(nuc900_wdt->wdt_clock)) {
> -		dev_err(&pdev->dev, "failed to find watchdog clock source\n");
> -		return PTR_ERR(nuc900_wdt->wdt_clock);
> -	}
> -
> -	clk_enable(nuc900_wdt->wdt_clock);
> -
> -	timer_setup(&nuc900_wdt->timer, nuc900_wdt_timer_ping, 0);
> -
> -	ret = misc_register(&nuc900wdt_miscdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "err register miscdev on minor=%d (%d)\n",
> -			WATCHDOG_MINOR, ret);
> -		goto err_clk;
> -	}
> -
> -	return 0;
> -
> -err_clk:
> -	clk_disable(nuc900_wdt->wdt_clock);
> -	return ret;
> -}
> -
> -static int nuc900wdt_remove(struct platform_device *pdev)
> -{
> -	misc_deregister(&nuc900wdt_miscdev);
> -
> -	clk_disable(nuc900_wdt->wdt_clock);
> -
> -	return 0;
> -}
> -
> -static struct platform_driver nuc900wdt_driver = {
> -	.probe		= nuc900wdt_probe,
> -	.remove		= nuc900wdt_remove,
> -	.driver		= {
> -		.name	= "nuc900-wdt",
> -	},
> -};
> -
> -module_platform_driver(nuc900wdt_driver);
> -
> -MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
> -MODULE_DESCRIPTION("Watchdog driver for NUC900");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:nuc900-wdt");
> -- 
> 2.20.0
> 
