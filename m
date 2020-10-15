Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C3828F6DF
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Oct 2020 18:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389853AbgJOQd7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Oct 2020 12:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388946AbgJOQd7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Oct 2020 12:33:59 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E345C061755;
        Thu, 15 Oct 2020 09:33:57 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id l4so3473919ota.7;
        Thu, 15 Oct 2020 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ob/UzcY/BrJGT6JVeMPR7qhCtT62XaOUUuXjEDF/Ni8=;
        b=dMYwSJiQKEVvj+FM22zV7j99m+FhiIqCGNAA9LXdY/icp4KUwC4Vdothqws0OXPHh0
         /Pe7/1MyuibiYA5sQOzYtTbQIHsFneJVFU6vJvTOBVkX4OFdFFF0evLLFWx9ix8+3EHG
         CtIYmc+kMUvSoG3kSK1Qz4IIT0BM2xaVxOlzK+SQT4qMQ56V9JkK+Qf+IcuARAwcKDMl
         5VRqFjrk/GIvzYob3UConoysjNNWXZeJ79Qw7DsqdMXsasbYFqNkpV5oV+GPJifYICB0
         W0ejndagyMgHAH+xXfaIIbnMST/Nz+gz7YfE8W/mRMTT7HG11wAn0MfbOgDD6qSjyiqJ
         Yo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ob/UzcY/BrJGT6JVeMPR7qhCtT62XaOUUuXjEDF/Ni8=;
        b=NNCflBzxkWM7g+H1+FP0nvIVITQZ08XC3QvgRO0nCDtKi0zcS7pvrM5DT/5GzmqVnP
         4zZ7QsAZL3AOP71rk5jUMncdrZDmqs8vvC5zUijb9I2xpG5xmZqvaBucfxhswQXJ3RH2
         O7KIkVtDLbprokadS4gla1KNXc+wZu0QpgIRJZL4tTkAJYJqFymPVgVWoVy/obmfqc9u
         gv1bdVrHjpjS8H0+pM5kz5RgA4ao0SnKrmDbEi84oRpOjbZpXr6vMH/flkZxaaaQf05N
         fWtmXaA5weJrUqtdbeFske4HakXlQnO1CuQUD5l03SL0m3r3wYr6QcjX8WyaY2/VEhvM
         H76Q==
X-Gm-Message-State: AOAM530xLfOafSWqgFLwOQO9GkGXdKsCN4taS3zlrY+0oV+b7ZJELsjF
        PiqOTJ6mv/6kZtp7W5FFQec=
X-Google-Smtp-Source: ABdhPJxiq8tJ+ep+WvDBwaPorogFJPm2civkJbIBLcXsKlEroag+h88FThfMHeFhXm4eEq0nZ50zsw==
X-Received: by 2002:a9d:1b06:: with SMTP id l6mr3158803otl.313.1602779636754;
        Thu, 15 Oct 2020 09:33:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b17sm1598557oog.25.2020.10.15.09.33.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 09:33:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 15 Oct 2020 09:33:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergey Yasinsky <seregajsv@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] watchdog: repair pnx833x_wdt
Message-ID: <20201015163354.GA174104@roeck-us.net>
References: <20201014145633.25680-1-seregajsv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014145633.25680-1-seregajsv@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 14, 2020 at 05:56:32PM +0300, Sergey Yasinsky wrote:
> Using watchdog core functions instead of miscdevice.
> 
This is not a repair, this is a convertion to use the
watchdog core (which also happens to fix a compile error).

The driver should also be converted to a platform device,
and be instantiated from arch/mips/pnx833x/common/platform.c
like the various other drivers in that syste,. As currently
written, the driver would be instantiated whenever it is built
into an image or loaded, which could result in a crash if
it is loaded on a system where the IO addresses it uses are
not mapped.

More comments inline.

Thanks,
Guenter

> Signed-off-by: Sergey Yasinsky <seregajsv@gmail.com>
> ---
>  drivers/watchdog/Kconfig       |   2 +-
>  drivers/watchdog/pnx833x_wdt.c | 219 ++++++++-------------------------
>  2 files changed, 53 insertions(+), 168 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ab7aad5a1e69..e9b86dbbb8fa 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1686,7 +1686,7 @@ config WDT_MTX1
>  config PNX833X_WDT
>  	tristate "PNX833x Hardware Watchdog"
>  	depends on SOC_PNX8335
> -	depends on BROKEN
> +	select WATCHDOG_CORE
>  	help
>  	  Hardware driver for the PNX833x's watchdog. This is a
>  	  watchdog timer that will reboot the machine after a programmable
> diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
> index 4097d076aab8..4ec852c423da 100644
> --- a/drivers/watchdog/pnx833x_wdt.c
> +++ b/drivers/watchdog/pnx833x_wdt.c
> @@ -17,21 +17,11 @@
>  
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> -#include <linux/types.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/mm.h>
> -#include <linux/miscdevice.h>
>  #include <linux/watchdog.h>
> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/init.h>
>  #include <asm/mach-pnx833x/pnx833x.h>
>  
> -#define WATCHDOG_TIMEOUT 30		/* 30 sec Maximum timeout */
> +#define WATCHDOG_DEFAULT_TIMEOUT 30
>  #define WATCHDOG_COUNT_FREQUENCY 68000000U /* Watchdog counts at 68MHZ. */
> -#define	PNX_WATCHDOG_TIMEOUT	(WATCHDOG_TIMEOUT * WATCHDOG_COUNT_FREQUENCY)
> -#define PNX_TIMEOUT_VALUE	2040000000U
>  
>  /** CONFIG block */
>  #define PNX833X_CONFIG                      (0x07000U)
> @@ -43,40 +33,37 @@
>  #define PNX833X_RESET                       (0x08000U)
>  #define PNX833X_RESET_CONFIG                (0x08)
>  
> -static int pnx833x_wdt_alive;
> +struct pnx833x_wdt {
> +	struct watchdog_device wdd;
> +};

This structure is unnecessary. You can use struct
watchdog_device directly.

>  
> -/* Set default timeout in MHZ.*/
> -static int pnx833x_wdt_timeout = PNX_WATCHDOG_TIMEOUT;
> +/* Set default timeout */
> +static int pnx833x_wdt_timeout = WATCHDOG_DEFAULT_TIMEOUT;

The default should be set in struct watchdog_device.timeout,
and the module parameter should (only) be used to override it,
and be initialized with 0. More on that see below.

>  module_param(pnx833x_wdt_timeout, int, 0);
> -MODULE_PARM_DESC(timeout, "Watchdog timeout in Mhz. (68Mhz clock), default="
> -			__MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
> +		__MODULE_STRING(WATCHDOG_DEFAULT_TIMEOUT) ")");
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  					__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> -#define START_DEFAULT	1
> -static int start_enabled = START_DEFAULT;
> -module_param(start_enabled, int, 0);
> -MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
> -				"(default=" __MODULE_STRING(START_DEFAULT) ")");

Why drop this ? Someone may use it, and the watchdog core
supports it.

> -
> -static void pnx833x_wdt_start(void)
> +static int pnx833x_wdt_start(struct watchdog_device *wdd)
>  {
>  	/* Enable watchdog causing reset. */
>  	PNX833X_REG(PNX833X_RESET + PNX833X_RESET_CONFIG) |= 0x1;
>  	/* Set timeout.*/
> -	PNX833X_REG(PNX833X_CONFIG +
> -		PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) = pnx833x_wdt_timeout;
> +	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
> +		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
>  	/* Enable watchdog. */
>  	PNX833X_REG(PNX833X_CONFIG +
>  				PNX833X_CONFIG_CPU_COUNTERS_CONTROL) |= 0x1;
>  
>  	pr_info("Started watchdog timer\n");

Please drop this message.

> +	return 0;
>  }
>  
> -static void pnx833x_wdt_stop(void)
> +static int pnx833x_wdt_stop(struct watchdog_device *wdd)
>  {
>  	/* Disable watchdog causing reset. */
>  	PNX833X_REG(PNX833X_RESET + PNX833X_CONFIG) &= 0xFFFFFFFE;
> @@ -85,149 +72,54 @@ static void pnx833x_wdt_stop(void)
>  			PNX833X_CONFIG_CPU_COUNTERS_CONTROL) &= 0xFFFFFFFE;
>  
>  	pr_info("Stopped watchdog timer\n");

Please drop this message (if you think it is useful for some reason,
make it a debug message).

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
>  	return 0;
>  }
>  
> -static ssize_t pnx833x_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
> +static int pnx833x_wdt_ping(struct watchdog_device *wdd)
>  {
> -	/* Refresh the timer. */
> -	if (len)
> -		pnx833x_wdt_ping();
> +	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
> +		wdd->timeout * WATCHDOG_COUNT_FREQUENCY;
>  
> -	return len;
> +	return 0;
>  }
>  
> -static long pnx833x_wdt_ioctl(struct file *file, unsigned int cmd,
> -							unsigned long arg)
> +static int pnx833x_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
>  {
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
> +	PNX833X_REG(PNX833X_CONFIG + PNX833X_CONFIG_CPU_WATCHDOG_COMPARE) =
> +		t * WATCHDOG_COUNT_FREQUENCY;
> +	wdd->timeout = t;
> +	return 0;
>  }
>  
> -static int pnx833x_wdt_notify_sys(struct notifier_block *this,
> -					unsigned long code, void *unused)
> +static unsigned int pnx833x_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		pnx833x_wdt_stop(); /* Turn the WDT off */
> +	unsigned int timeout = PNX833X_REG(PNX833X_CONFIG +
> +		 PNX833X_CONFIG_CPU_WATCHDOG_COMPARE);
> +	unsigned int curval = PNX833X_REG(PNX833X_CONFIG +
> +		PNX833X_CONFIG_CPU_WATCHDOG);
>  
> -	return NOTIFY_DONE;
> +	return (timeout - curval) / WATCHDOG_COUNT_FREQUENCY;
>  }
>  
> -static const struct file_operations pnx833x_wdt_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.write		= pnx833x_wdt_write,
> -	.unlocked_ioctl	= pnx833x_wdt_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> -	.open		= pnx833x_wdt_open,
> -	.release	= pnx833x_wdt_release,
> +static const struct watchdog_info pnx833x_wdt_ident = {
> +	.identity = "PNX833x Watchdog Timer",
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE
>  };
>  
> -static struct miscdevice pnx833x_wdt_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &pnx833x_wdt_fops,
> +static struct watchdog_ops pnx833x_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pnx833x_wdt_start,
> +	.stop = pnx833x_wdt_stop,
> +	.ping = pnx833x_wdt_ping,
> +	.set_timeout = pnx833x_wdt_set_timeout,
> +	.get_timeleft = pnx833x_wdt_get_timeleft,
>  };
>  
> -static struct notifier_block pnx833x_wdt_notifier = {
> -	.notifier_call = pnx833x_wdt_notify_sys,
> +struct pnx833x_wdt pnx833x_wdd = {

This should be static. Actually, it should be dynamically
allocated, which is easy if/when the driver is converted
to a platform driver.

> +	.wdd = {
> +		.info = &pnx833x_wdt_ident,
> +		.ops = &pnx833x_wdt_ops,
> +	},
>  };
>  
>  static int __init watchdog_init(void)
> @@ -237,36 +129,29 @@ static int __init watchdog_init(void)
>  	/* Lets check the reason for the reset.*/
>  	cause = PNX833X_REG(PNX833X_RESET);
>  	/*If bit 31 is set then watchdog was cause of reset.*/
> -	if (cause & 0x80000000) {
> +	if (cause & 0x80000000)
>  		pr_info("The system was previously reset due to the watchdog firing - please investigate...\n");
> -	}

This should set WDIOF_CARDRESET, and I would suggest to drop the message
(no one is going to read it anyway).

>  
> -	ret = register_reboot_notifier(&pnx833x_wdt_notifier);
> -	if (ret) {
> -		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> -		return ret;
> -	}

The above can be handled in the watchdog core if needed.

> +	pnx833x_wdd.wdd.max_timeout = U32_MAX / WATCHDOG_COUNT_FREQUENCY;

Also set min_timeout to 1.

> +	pnx833x_wdd.wdd.timeout = pnx833x_wdt_timeout;
> +	if (pnx833x_wdd.wdd.timeout > pnx833x_wdd.wdd.max_timeout)
> +		pnx833x_wdd.wdd.timeout = pnx833x_wdd.wdd.max_timeout;
>  
pnx833x_wdd.wdd.timeout should be initialized with the
default, and the new value should be set with
	watchdog_init_timeout(&wdd, pnx833x_wdt_timeout, NULL);

This also takes care of error handling.

> -	ret = misc_register(&pnx833x_wdt_miscdev);
> +	watchdog_set_nowayout(&pnx833x_wdd.wdd, nowayout);
> +	ret = watchdog_register_device(&pnx833x_wdd.wdd);
>  	if (ret) {
> -		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> -		       WATCHDOG_MINOR, ret);
> -		unregister_reboot_notifier(&pnx833x_wdt_notifier);
> +		pr_err("Failed to register watchdog device");
>  		return ret;
>  	}
>  
>  	pr_info("Hardware Watchdog Timer for PNX833x: Version 0.1\n");

Sure this is not anymore version 0.1. I'd suggest to drop
the version information since it is useless.
>  
> -	if (start_enabled)
> -		pnx833x_wdt_start();
> -

As mentioned above, I don't see a reason for dropping this.
The driver can call it prior to watchdog registration, and
set WDOG_HW_RUNNING in wdd->status.

>  	return 0;
>  }
>  
>  static void __exit watchdog_exit(void)
>  {
> -	misc_deregister(&pnx833x_wdt_miscdev);
> -	unregister_reboot_notifier(&pnx833x_wdt_notifier);
> +	watchdog_unregister_device(&pnx833x_wdd.wdd);
>  }
>  
>  module_init(watchdog_init);
> -- 
> 2.26.2
> 
