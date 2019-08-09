Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922D788433
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 22:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfHIUmb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 16:42:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33808 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfHIUmb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 16:42:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so46635469pfo.1;
        Fri, 09 Aug 2019 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D/ZBnMmyvKTjL8M+ZZPM7TA/D/QoaoFKXZgmMvT+2ng=;
        b=K4GBGaP8orn8dc9p0AvtXl7R4BpDM8AtprkFdyCs+lxAqTi4Plz8JtAuuyR7+tPr+i
         a5aZ00dyZyxbWqlmPoLAtr1OL5upFx0u7gk6JLzmvKuhNPx4E0Ykus1//WlVQfVoKW7m
         TJIP+iuJw5jHv1ScjRTT8YpI5lC5mmt0g38Bg0jcbxGjMJAksPnMq53p00GZ9mbZd5Ar
         ZTjJgCElUkMKz3eFqvtgPIStOv+Yx6Vv23aPLgU0VjlySd5gkmE36uRq4jlqilytQMbr
         eeIhZsqu9BtcLPEtggGN4LJyS7tLvl5EAI9KLsh03oiOzxzhyEnMeRBKU/keuM0Ue3dV
         Wl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=D/ZBnMmyvKTjL8M+ZZPM7TA/D/QoaoFKXZgmMvT+2ng=;
        b=BtsW8lJNYPCr5ktO3DUoHSWAnde7bqVY+RTv1mL4If5OFuzbCSOrR12y7HXA4seNH4
         tcEFjDe3RrpOucC+xhIlAP+HEIbS7jTmZL3gGlD4/VdTqhs3c/t84Y7xiUbqttXWwtGl
         +vy8+GmSBraGGQ0oc0nFB0CJtDnkLYBKYRiJc07D8gK+P4w8fFtBNoLFX/uyAOsciukj
         +v1nsXzWa/GYdY4Vg64RCxiMAYosXgQiKyy5Dt9RtiQjYI9KyQWX4CiYexyxfutQgPjS
         syA01F+jtuGO3AY3h5E9gE8JFvnp4iEXoAbZMJ7k4IrWIXQhGgCVa2/WUaztFPfUV73p
         URAA==
X-Gm-Message-State: APjAAAV4h/LuRW78THMDmIvfEe614dK2ndu+qYY5LvVw5JwJPs6Cn7Qm
        NoF3x88g5LGAS7RvKq2M4Fw=
X-Google-Smtp-Source: APXvYqxcCLBMZIy0vfPqwRT2cShrb5WWMQF8sLd0yDUksEv4yJWRMZNA8pblYqji0pfFZ/WKnF7dVg==
X-Received: by 2002:a62:1b0c:: with SMTP id b12mr23078866pfb.17.1565383350346;
        Fri, 09 Aug 2019 13:42:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm68952095pfn.188.2019.08.09.13.42.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 13:42:29 -0700 (PDT)
Date:   Fri, 9 Aug 2019 13:42:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] watchdog: remove ks8695 driver
Message-ID: <20190809204227.GA19839@roeck-us.net>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-5-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 10:27:32PM +0200, Arnd Bergmann wrote:
> The platform is getting removed, so there are no remaining
> users of this driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

Please let me know if this should be applied through the watchdog tree.
For now I'll assume it will be applied together with the rest of the
series.

> ---
>  .../watchdog/watchdog-parameters.rst          |   9 -
>  drivers/watchdog/Kconfig                      |   7 -
>  drivers/watchdog/Makefile                     |   1 -
>  drivers/watchdog/ks8695_wdt.c                 | 319 ------------------
>  4 files changed, 336 deletions(-)
>  delete mode 100644 drivers/watchdog/ks8695_wdt.c
> 
> diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
> index a3985cc5aeda..226aba56f704 100644
> --- a/Documentation/watchdog/watchdog-parameters.rst
> +++ b/Documentation/watchdog/watchdog-parameters.rst
> @@ -301,15 +301,6 @@ ixp4xx_wdt:
>  
>  -------------------------------------------------
>  
> -ks8695_wdt:
> -    wdt_time:
> -	Watchdog time in seconds. (default=5)
> -    nowayout:
> -	Watchdog cannot be stopped once started
> -	(default=kernel config parameter)
> -
> --------------------------------------------------
> -
>  machzwd:
>      nowayout:
>  	Watchdog cannot be stopped once started
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 8188963a405b..e631f1ae303a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -477,13 +477,6 @@ config IXP4XX_WATCHDOG
>  
>  	  Say N if you are unsure.
>  
> -config KS8695_WATCHDOG
> -	tristate "KS8695 watchdog"
> -	depends on ARCH_KS8695
> -	help
> -	  Watchdog timer embedded into KS8695 processor. This will reboot your
> -	  system when the timeout is reached.
> -
>  config HAVE_S3C2410_WATCHDOG
>  	bool
>  	help
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 7caa920e7e60..85f55ec76f8d 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -49,7 +49,6 @@ obj-$(CONFIG_21285_WATCHDOG) += wdt285.o
>  obj-$(CONFIG_977_WATCHDOG) += wdt977.o
>  obj-$(CONFIG_FTWDT010_WATCHDOG) += ftwdt010_wdt.o
>  obj-$(CONFIG_IXP4XX_WATCHDOG) += ixp4xx_wdt.o
> -obj-$(CONFIG_KS8695_WATCHDOG) += ks8695_wdt.o
>  obj-$(CONFIG_S3C2410_WATCHDOG) += s3c2410_wdt.o
>  obj-$(CONFIG_SA1100_WATCHDOG) += sa1100_wdt.o
>  obj-$(CONFIG_SAMA5D4_WATCHDOG) += sama5d4_wdt.o
> diff --git a/drivers/watchdog/ks8695_wdt.c b/drivers/watchdog/ks8695_wdt.c
> deleted file mode 100644
> index 1550ce3c5702..000000000000
> --- a/drivers/watchdog/ks8695_wdt.c
> +++ /dev/null
> @@ -1,319 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Watchdog driver for Kendin/Micrel KS8695.
> - *
> - * (C) 2007 Andrew Victor
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/bitops.h>
> -#include <linux/errno.h>
> -#include <linux/fs.h>
> -#include <linux/init.h>
> -#include <linux/kernel.h>
> -#include <linux/miscdevice.h>
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/platform_device.h>
> -#include <linux/types.h>
> -#include <linux/watchdog.h>
> -#include <linux/io.h>
> -#include <linux/uaccess.h>
> -#include <mach/hardware.h>
> -
> -#define KS8695_TMR_OFFSET	(0xF0000 + 0xE400)
> -#define KS8695_TMR_VA		(KS8695_IO_VA + KS8695_TMR_OFFSET)
> -
> -/*
> - * Timer registers
> - */
> -#define KS8695_TMCON		(0x00)		/* Timer Control Register */
> -#define KS8695_T0TC		(0x08)		/* Timer 0 Timeout Count Register */
> -#define TMCON_T0EN		(1 << 0)	/* Timer 0 Enable */
> -
> -/* Timer0 Timeout Counter Register */
> -#define T0TC_WATCHDOG		(0xff)		/* Enable watchdog mode */
> -
> -#define WDT_DEFAULT_TIME	5	/* seconds */
> -#define WDT_MAX_TIME		171	/* seconds */
> -
> -static int wdt_time = WDT_DEFAULT_TIME;
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> -
> -module_param(wdt_time, int, 0);
> -MODULE_PARM_DESC(wdt_time, "Watchdog time in seconds. (default="
> -					__MODULE_STRING(WDT_DEFAULT_TIME) ")");
> -
> -#ifdef CONFIG_WATCHDOG_NOWAYOUT
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> -				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -#endif
> -
> -
> -static unsigned long ks8695wdt_busy;
> -static DEFINE_SPINLOCK(ks8695_lock);
> -
> -/* ......................................................................... */
> -
> -/*
> - * Disable the watchdog.
> - */
> -static inline void ks8695_wdt_stop(void)
> -{
> -	unsigned long tmcon;
> -
> -	spin_lock(&ks8695_lock);
> -	/* disable timer0 */
> -	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
> -	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
> -	spin_unlock(&ks8695_lock);
> -}
> -
> -/*
> - * Enable and reset the watchdog.
> - */
> -static inline void ks8695_wdt_start(void)
> -{
> -	unsigned long tmcon;
> -	unsigned long tval = wdt_time * KS8695_CLOCK_RATE;
> -
> -	spin_lock(&ks8695_lock);
> -	/* disable timer0 */
> -	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
> -	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
> -
> -	/* program timer0 */
> -	__raw_writel(tval | T0TC_WATCHDOG, KS8695_TMR_VA + KS8695_T0TC);
> -
> -	/* re-enable timer0 */
> -	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
> -	__raw_writel(tmcon | TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
> -	spin_unlock(&ks8695_lock);
> -}
> -
> -/*
> - * Reload the watchdog timer.  (ie, pat the watchdog)
> - */
> -static inline void ks8695_wdt_reload(void)
> -{
> -	unsigned long tmcon;
> -
> -	spin_lock(&ks8695_lock);
> -	/* disable, then re-enable timer0 */
> -	tmcon = __raw_readl(KS8695_TMR_VA + KS8695_TMCON);
> -	__raw_writel(tmcon & ~TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
> -	__raw_writel(tmcon | TMCON_T0EN, KS8695_TMR_VA + KS8695_TMCON);
> -	spin_unlock(&ks8695_lock);
> -}
> -
> -/*
> - * Change the watchdog time interval.
> - */
> -static int ks8695_wdt_settimeout(int new_time)
> -{
> -	/*
> -	 * All counting occurs at KS8695_CLOCK_RATE / 128 = 0.256 Hz
> -	 *
> -	 * Since WDV is a 16-bit counter, the maximum period is
> -	 * 65536 / 0.256 = 256 seconds.
> -	 */
> -	if ((new_time <= 0) || (new_time > WDT_MAX_TIME))
> -		return -EINVAL;
> -
> -	/* Set new watchdog time. It will be used when
> -	   ks8695_wdt_start() is called. */
> -	wdt_time = new_time;
> -	return 0;
> -}
> -
> -/* ......................................................................... */
> -
> -/*
> - * Watchdog device is opened, and watchdog starts running.
> - */
> -static int ks8695_wdt_open(struct inode *inode, struct file *file)
> -{
> -	if (test_and_set_bit(0, &ks8695wdt_busy))
> -		return -EBUSY;
> -
> -	ks8695_wdt_start();
> -	return stream_open(inode, file);
> -}
> -
> -/*
> - * Close the watchdog device.
> - * If CONFIG_WATCHDOG_NOWAYOUT is NOT defined then the watchdog is also
> - *  disabled.
> - */
> -static int ks8695_wdt_close(struct inode *inode, struct file *file)
> -{
> -	/* Disable the watchdog when file is closed */
> -	if (!nowayout)
> -		ks8695_wdt_stop();
> -	clear_bit(0, &ks8695wdt_busy);
> -	return 0;
> -}
> -
> -static const struct watchdog_info ks8695_wdt_info = {
> -	.identity	= "ks8695 watchdog",
> -	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
> -};
> -
> -/*
> - * Handle commands from user-space.
> - */
> -static long ks8695_wdt_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> -{
> -	void __user *argp = (void __user *)arg;
> -	int __user *p = argp;
> -	int new_value;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(argp, &ks8695_wdt_info,
> -					sizeof(ks8695_wdt_info)) ? -EFAULT : 0;
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, p);
> -	case WDIOC_SETOPTIONS:
> -		if (get_user(new_value, p))
> -			return -EFAULT;
> -		if (new_value & WDIOS_DISABLECARD)
> -			ks8695_wdt_stop();
> -		if (new_value & WDIOS_ENABLECARD)
> -			ks8695_wdt_start();
> -		return 0;
> -	case WDIOC_KEEPALIVE:
> -		ks8695_wdt_reload();	/* pat the watchdog */
> -		return 0;
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_value, p))
> -			return -EFAULT;
> -		if (ks8695_wdt_settimeout(new_value))
> -			return -EINVAL;
> -		/* Enable new time value */
> -		ks8695_wdt_start();
> -		/* Return current value */
> -		return put_user(wdt_time, p);
> -	case WDIOC_GETTIMEOUT:
> -		return put_user(wdt_time, p);
> -	default:
> -		return -ENOTTY;
> -	}
> -}
> -
> -/*
> - * Pat the watchdog whenever device is written to.
> - */
> -static ssize_t ks8695_wdt_write(struct file *file, const char *data,
> -						size_t len, loff_t *ppos)
> -{
> -	ks8695_wdt_reload();		/* pat the watchdog */
> -	return len;
> -}
> -
> -/* ......................................................................... */
> -
> -static const struct file_operations ks8695wdt_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.unlocked_ioctl	= ks8695_wdt_ioctl,
> -	.open		= ks8695_wdt_open,
> -	.release	= ks8695_wdt_close,
> -	.write		= ks8695_wdt_write,
> -};
> -
> -static struct miscdevice ks8695wdt_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &ks8695wdt_fops,
> -};
> -
> -static int ks8695wdt_probe(struct platform_device *pdev)
> -{
> -	int res;
> -
> -	if (ks8695wdt_miscdev.parent)
> -		return -EBUSY;
> -	ks8695wdt_miscdev.parent = &pdev->dev;
> -
> -	res = misc_register(&ks8695wdt_miscdev);
> -	if (res)
> -		return res;
> -
> -	pr_info("KS8695 Watchdog Timer enabled (%d seconds%s)\n",
> -		wdt_time, nowayout ? ", nowayout" : "");
> -	return 0;
> -}
> -
> -static int ks8695wdt_remove(struct platform_device *pdev)
> -{
> -	misc_deregister(&ks8695wdt_miscdev);
> -	ks8695wdt_miscdev.parent = NULL;
> -
> -	return 0;
> -}
> -
> -static void ks8695wdt_shutdown(struct platform_device *pdev)
> -{
> -	ks8695_wdt_stop();
> -}
> -
> -#ifdef CONFIG_PM
> -
> -static int ks8695wdt_suspend(struct platform_device *pdev, pm_message_t message)
> -{
> -	ks8695_wdt_stop();
> -	return 0;
> -}
> -
> -static int ks8695wdt_resume(struct platform_device *pdev)
> -{
> -	if (ks8695wdt_busy)
> -		ks8695_wdt_start();
> -	return 0;
> -}
> -
> -#else
> -#define ks8695wdt_suspend NULL
> -#define ks8695wdt_resume	NULL
> -#endif
> -
> -static struct platform_driver ks8695wdt_driver = {
> -	.probe		= ks8695wdt_probe,
> -	.remove		= ks8695wdt_remove,
> -	.shutdown	= ks8695wdt_shutdown,
> -	.suspend	= ks8695wdt_suspend,
> -	.resume		= ks8695wdt_resume,
> -	.driver		= {
> -		.name	= "ks8695_wdt",
> -	},
> -};
> -
> -static int __init ks8695_wdt_init(void)
> -{
> -	/* Check that the heartbeat value is within range;
> -	   if not reset to the default */
> -	if (ks8695_wdt_settimeout(wdt_time)) {
> -		ks8695_wdt_settimeout(WDT_DEFAULT_TIME);
> -		pr_info("ks8695_wdt: wdt_time value must be 1 <= wdt_time <= %i"
> -					", using %d\n", wdt_time, WDT_MAX_TIME);
> -	}
> -	return platform_driver_register(&ks8695wdt_driver);
> -}
> -
> -static void __exit ks8695_wdt_exit(void)
> -{
> -	platform_driver_unregister(&ks8695wdt_driver);
> -}
> -
> -module_init(ks8695_wdt_init);
> -module_exit(ks8695_wdt_exit);
> -
> -MODULE_AUTHOR("Andrew Victor");
> -MODULE_DESCRIPTION("Watchdog driver for KS8695");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:ks8695_wdt");
> -- 
> 2.20.0
> 
