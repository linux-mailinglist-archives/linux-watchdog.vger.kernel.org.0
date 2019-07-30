Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B78977A005
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 06:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfG3E0l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 00:26:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33785 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfG3E0l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 00:26:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so28286459plo.0;
        Mon, 29 Jul 2019 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MOB3gCL7J1mjiBMULFGmB9wrfMKbSFWF0oKZzFpGVZY=;
        b=a04yxCvPR+BSn+kyhU8R7lbpwe7FCMTbPw9lJMf4/V6fW0qeTmISj98pTJEUkAfPTX
         FDG8QpMCyQqHWV/nCQ2KC7LmUEG+wF/Lvgto/xgwv3lFpQMB9SjM915xKi4IfFOdqn/Y
         bhw4Bm8zM5iX8AEcUBB0hup3wHk/cGhFAI46EW8L0znixeEBgB5BjVGybdhlVaSHKZJc
         XF8OJDqSLOVL/0gMTMvUPYvnmhKoj68cHRnPBtlIDYwMP01oXQaFnPiWlGM5APkLPh/Z
         CyhMHMfrAQYapCgeTfuz9IGg2SWTlNmFuyoJU9tDYbpYcVK5T5pr4PInhCFEWSsb5NxU
         BklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MOB3gCL7J1mjiBMULFGmB9wrfMKbSFWF0oKZzFpGVZY=;
        b=M8T9dsiuzeTIo7ZgGBFBYcfMVyt+wUjNYfgiVJRfhtNvUbcWef2+wP4LLOGM1LUKbc
         rd5RLFA5O4K46LN1EDW15uTICmkDvxDlSpea67eBM1vYYgUz1Fjs9u06QAo739kNF/mF
         qL9JXyM21GNF0RhEhT7N8ele3/ZF6khzhv8I+YEB3+c6tOGD+ZeJf/tCir/esGsEQHxe
         WNo4xOw5m6QOMFoJrEOGe60JDoGNDIcXDfQ9H4ThhPnn5tgXARvBtji03zQrYMF75Jky
         7padSUEUHw22tvTYyvYO1+0UesSiEVfNPUcGW+dkIoij6xHXprs7VLeW+xFmb9DHessS
         5Lmw==
X-Gm-Message-State: APjAAAWVOz/H8y/N/29uF21/HmegstOBW1JMjE3BNjYtngkrWvZtK2MP
        8jvPLubcFB7Gk41JJ4VYLBM=
X-Google-Smtp-Source: APXvYqxgwcw/7rvxrV+DCHTp/s4DLTFrlzg4tObk5zqqTpcbUbi8y3zykbkrlWdopXK5JEd4sqeFPw==
X-Received: by 2002:a17:902:968d:: with SMTP id n13mr66132883plp.257.1564460800252;
        Mon, 29 Jul 2019 21:26:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d14sm75918096pfo.154.2019.07.29.21.26.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 21:26:39 -0700 (PDT)
Subject: Re: [PATCH] Revision of pc87413_wdt driver to use watchdog subsystem
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru
References: <20190730035050.15321-1-mbalant3@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ec38530c-36eb-57d7-3d1d-e0ee2c7e54fd@roeck-us.net>
Date:   Mon, 29 Jul 2019 21:26:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730035050.15321-1-mbalant3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/19 8:50 PM, Mark Balantzyan wrote:
> This patch rewrites the pc87413_wdt driver to use the watchdog subsystem. In
> doing so, it also addresses a potential race condition owing from the
> swc_base_addr variable being used before being set.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> 

"Revision of ..." is an odd subject line. Also, please start the subject line with
"watchdog: pc87413: ".

> ---
>   drivers/watchdog/Kconfig       |   1 +
>   drivers/watchdog/pc87413_wdt.c | 294 +++++----------------------------
>   2 files changed, 39 insertions(+), 256 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9af07fd9..84a7326d 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1166,6 +1166,7 @@ config SCx200_WDT
>   
>   config PC87413_WDT
>   	tristate "NS PC87413 watchdog"
> +	select WATCHDOG_CORE
>   	depends on X86
>   	---help---
>   	  This is the driver for the hardware watchdog on the PC87413 chipset
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index 06a892e3..d1d32771 100644
> --- a/drivers/watchdog/pc87413_wdt.c
> +++ b/drivers/watchdog/pc87413_wdt.c
> @@ -22,12 +22,10 @@
>   
>   #include <linux/module.h>
>   #include <linux/types.h>
> -#include <linux/miscdevice.h>
>   #include <linux/watchdog.h>
>   #include <linux/ioport.h>
>   #include <linux/delay.h>

Is this used anywhere ?

>   #include <linux/notifier.h>
> -#include <linux/fs.h>
>   #include <linux/reboot.h>

notifier.h and reboot.h should not be needed if the code is changed
to use watchdog_stop_on_reboot().

>   #include <linux/init.h>
>   #include <linux/spinlock.h>

No longer needed.

> @@ -65,7 +63,6 @@ static char expect_close;		/* is the close expected? */
>   
>   static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */
>   
No longer needed.

> -static bool nowayout = WATCHDOG_NOWAYOUT;
>   
>   /* -- Low level function ----------------------------------------*/
>   
> @@ -216,41 +213,32 @@ static inline void pc87413_disable_sw_wd_trg(void)
>   
>   /* -- Higher level functions ------------------------------------*/
>   
> -/* Enable the watchdog */
> +/* Enable/start the watchdog */
>   
> -static void pc87413_enable(void)
> +static void pc87413_start(void)

I am quite sure you still see a warning here, or rather where the function is referenced.

>   {
> -	spin_lock(&io_lock);
> -
>   	pc87413_swc_bank3();
>   	pc87413_programm_wdto(timeout);
>   	pc87413_enable_wden();
>   	pc87413_enable_sw_wd_tren();
>   	pc87413_enable_sw_wd_trg();
>   
> -	spin_unlock(&io_lock);
>   }
>   
> -/* Disable the watchdog */
> +/* Disable/stop the watchdog */
>   
> -static void pc87413_disable(void)
> +static void pc87413_stop(void)

Same here.

>   {
> -	spin_lock(&io_lock);
> -
>   	pc87413_swc_bank3();
>   	pc87413_disable_sw_wd_tren();
>   	pc87413_disable_sw_wd_trg();
>   	pc87413_programm_wdto(0);
> -
> -	spin_unlock(&io_lock);
>   }
>   
> -/* Refresh the watchdog */
> +/* Refresh/keepalive the watchdog */
>   
> -static void pc87413_refresh(void)
> +static void pc87413_keepalive(struct watchdog_device *wdd)
>   {
> -	spin_lock(&io_lock);
> -
>   	pc87413_swc_bank3();
>   	pc87413_disable_sw_wd_tren();
>   	pc87413_disable_sw_wd_trg();
> @@ -258,195 +246,11 @@ static void pc87413_refresh(void)
>   	pc87413_enable_wden();
>   	pc87413_enable_sw_wd_tren();
>   	pc87413_enable_sw_wd_trg();
> -
> -	spin_unlock(&io_lock);
> -}
> -
> -/* -- File operations -------------------------------------------*/
> -
> -/**
> - *	pc87413_open:
> - *	@inode: inode of device
> - *	@file: file handle to device
> - *
> - */
> -
> -static int pc87413_open(struct inode *inode, struct file *file)
> -{
> -	/* /dev/watchdog can only be opened once */
> -
> -	if (test_and_set_bit(0, &timer_enabled))
> -		return -EBUSY;
> -
> -	if (nowayout)
> -		__module_get(THIS_MODULE);
> -
> -	/* Reload and activate timer */
> -	pc87413_refresh();
> -
> -	pr_info("Watchdog enabled. Timeout set to %d minute(s).\n", timeout);
> -
> -	return nonseekable_open(inode, file);
> -}
> -
> -/**
> - *	pc87413_release:
> - *	@inode: inode to board
> - *	@file: file handle to board
> - *
> - *	The watchdog has a configurable API. There is a religious dispute
> - *	between people who want their watchdog to be able to shut down and
> - *	those who want to be sure if the watchdog manager dies the machine
> - *	reboots. In the former case we disable the counters, in the latter
> - *	case you have to open it again very soon.
> - */
> -
> -static int pc87413_release(struct inode *inode, struct file *file)
> -{
> -	/* Shut off the timer. */
> -
> -	if (expect_close == 42) {
> -		pc87413_disable();
> -		pr_info("Watchdog disabled, sleeping again...\n");
> -	} else {
> -		pr_crit("Unexpected close, not stopping watchdog!\n");
> -		pc87413_refresh();
> -	}
> -	clear_bit(0, &timer_enabled);
> -	expect_close = 0;
>   	return 0;
>   }
>   
> -/**
> - *	pc87413_status:
> - *
> - *      return, if the watchdog is enabled (timeout is set...)
> - */
> -
> -
> -static int pc87413_status(void)
> -{
> -	  return 0; /* currently not supported */
> -}
> -
> -/**
> - *	pc87413_write:
> - *	@file: file handle to the watchdog
> - *	@data: data buffer to write
> - *	@len: length in bytes
> - *	@ppos: pointer to the position to write. No seeks allowed
> - *
> - *	A write to a watchdog device is defined as a keepalive signal. Any
> - *	write of data will do, as we we don't define content meaning.
> - */
> -
> -static ssize_t pc87413_write(struct file *file, const char __user *data,
> -			     size_t len, loff_t *ppos)
> -{
> -	/* See if we got the magic character 'V' and reload the timer */
> -	if (len) {
> -		if (!nowayout) {
> -			size_t i;
> -
> -			/* reset expect flag */
> -			expect_close = 0;
> -
> -			/* scan to see whether or not we got the
> -			   magic character */
> -			for (i = 0; i != len; i++) {
> -				char c;
> -				if (get_user(c, data + i))
> -					return -EFAULT;
> -				if (c == 'V')
> -					expect_close = 42;
> -			}
> -		}
> -
> -		/* someone wrote to us, we should reload the timer */
> -		pc87413_refresh();
> -	}
> -	return len;
> -}
> -
> -/**
> - *	pc87413_ioctl:
> - *	@file: file handle to the device
> - *	@cmd: watchdog command
> - *	@arg: argument pointer
> - *
> - *	The watchdog API defines a common set of functions for all watchdogs
> - *	according to their available features. We only actually usefully support
> - *	querying capabilities and current status.
> - */
> -
> -static long pc87413_ioctl(struct file *file, unsigned int cmd,
> -						unsigned long arg)
> -{
> -	int new_timeout;
> -
> -	union {
> -		struct watchdog_info __user *ident;
> -		int __user *i;
> -	} uarg;
> -
> -	static const struct watchdog_info ident = {
> -		.options          = WDIOF_KEEPALIVEPING |
> -				    WDIOF_SETTIMEOUT |
> -				    WDIOF_MAGICCLOSE,
> -		.firmware_version = 1,
> -		.identity         = "PC87413(HF/F) watchdog",
> -	};
> -
> -	uarg.i = (int __user *)arg;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(uarg.ident, &ident,
> -					sizeof(ident)) ? -EFAULT : 0;
> -	case WDIOC_GETSTATUS:
> -		return put_user(pc87413_status(), uarg.i);
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, uarg.i);
> -	case WDIOC_SETOPTIONS:
> -	{
> -		int options, retval = -EINVAL;
> -		if (get_user(options, uarg.i))
> -			return -EFAULT;
> -		if (options & WDIOS_DISABLECARD) {
> -			pc87413_disable();
> -			retval = 0;
> -		}
> -		if (options & WDIOS_ENABLECARD) {
> -			pc87413_enable();
> -			retval = 0;
> -		}
> -		return retval;
> -	}
> -	case WDIOC_KEEPALIVE:
> -		pc87413_refresh();
> -#ifdef DEBUG
> -		pr_info(DPFX "keepalive\n");
> -#endif
> -		return 0;
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_timeout, uarg.i))
> -			return -EFAULT;
> -		/* the API states this is given in secs */
> -		new_timeout /= 60;
> -		if (new_timeout < 0 || new_timeout > MAX_TIMEOUT)
> -			return -EINVAL;
> -		timeout = new_timeout;
> -		pc87413_refresh();
> -		/* fall through and return the new timeout... */
> -	case WDIOC_GETTIMEOUT:
> -		new_timeout = timeout * 60;
> -		return put_user(new_timeout, uarg.i);
> -	default:
> -		return -ENOTTY;
> -	}
> -}
>   
> -/* -- Notifier funtions -----------------------------------------*/
> +/* -- Notifier functions -----------------------------------------*/
>   
>   /**
>    *	notify_sys:
> @@ -460,37 +264,43 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
>    *	trust me - if it happens it does suck.
>    */
>   
> -static int pc87413_notify_sys(struct notifier_block *this,
> -			      unsigned long code,
> -			      void *unused)
> +
> +/* -- Module's structures ---------------------------------------*/
> +
> +
> +static int watchdog_restart_notifier(struct notifier_block *nb,
> +				    unsigned long code, void *data)
>   {
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		/* Turn the card off */
> -		pc87413_disable();
> +	struct watchdog_device *wdd = container_of(nb, struct watchdog_device,
> +						   reboot_nb);
> +
> +	if (code == SYS_DOWN || code == SYS_HALT) {
> +		int ret;
> +
> +		ret = wdd->ops->stop(wdd);
> +		if (ret)
> +			return NOTIFY_BAD;
> +	}
> +
>   	return NOTIFY_DONE;
>   }
>   

As mentioned, please drop the notifier function and call watchdog_stop_on_reboot()
prior to registering the watchdog.

> -/* -- Module's structures ---------------------------------------*/
>   
> -static const struct file_operations pc87413_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.write		= pc87413_write,
> -	.unlocked_ioctl	= pc87413_ioctl,
> -	.open		= pc87413_open,
> -	.release	= pc87413_release,
> -};
>   
> -static struct notifier_block pc87413_notifier = {
> -	.notifier_call  = pc87413_notify_sys,
> +static struct watchdog_ops pc87413wdt_ops = {
> +       	.owner = THIS_MODULE,
> +       	.start = pc87413_start,
> +       	.stop = pc87413_stop,
> +       	.ping = pc87413_keepalive,

I don't immediately see how timeouts are now handled, and I am not sure
if they are handled correctly, especially with the removed
		/* the API states this is given in secs */
		new_timeout /= 60;
above, and the datasheet says that timeouts are in multiples of minutes.
This means that a set_)timeout function will be needed to calculate and
set the correct timeout values.

> +	.restart = watchdog_restart_notifier,

Bad alignment

>   };
>   
> -static struct miscdevice pc87413_miscdev = {
> -	.minor          = WATCHDOG_MINOR,
> -	.name           = "watchdog",
> -	.fops           = &pc87413_fops,
> +static struct watchdog_device pc87413wdt_wdd = {
> +       	.ops = &pc87413wdt_ops,
> +	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
>   };
>   
> +
>   /* -- Module init functions -------------------------------------*/
>   
>   /**
> @@ -498,7 +308,6 @@ static struct miscdevice pc87413_miscdev = {
>    *
>    *	Set up the WDT watchdog board. All we have to do is grab the
>    *	resources we require and bitch if anyone beat us to them.
> - *	The open() function will actually kick the board off.
>    */
>   
>   static int __init pc87413_init(void)
> @@ -511,16 +320,7 @@ static int __init pc87413_init(void)
>   	if (!request_muxed_region(io, 2, MODNAME))
>   		return -EBUSY;
>   
> -	ret = register_reboot_notifier(&pc87413_notifier);
> -	if (ret != 0)
> -		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> -
> -	ret = misc_register(&pc87413_miscdev);
> -	if (ret != 0) {
> -		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> -		       WATCHDOG_MINOR, ret);
> -		goto reboot_unreg;
> -	}
> +	ret = watchdog_register_device(&pc87413wdt_wdd);
>   	pr_info("initialized. timeout=%d min\n", timeout);
>   
>   	pc87413_select_wdt_out();
> @@ -533,17 +333,12 @@ static int __init pc87413_init(void)
>   		goto misc_unreg;
>   	}
>   
> -	pc87413_enable();
> -
>   	release_region(io, 2);
> +	pc87413_keepalive(&pc87413wdt_wdd);

Not needed: The watchdog is not (or should not be) running.

>   	return 0;
>   
>   misc_unreg:

Wrong label name.

> -	misc_deregister(&pc87413_miscdev);
> -reboot_unreg:
> -	unregister_reboot_notifier(&pc87413_notifier);
> -	release_region(io, 2);
> -	return ret;
> +	watchdog_unregister_device(&pc87413wdt_wdd);

I am getting a bit lost here, but it seems to me this is called if
watchdog registration failed. The cleanup is wrong. You still need
to call release_region(), you don't need to unregister the watchdog,
and you still need to return ret.

>   }
>   
>   /**
> @@ -558,14 +353,7 @@ reboot_unreg:
>   
>   static void __exit pc87413_exit(void)
>   {
> -	/* Stop the timer before we leave */
> -	if (!nowayout) {
> -		pc87413_disable();
> -		pr_info("Watchdog disabled\n");
> -	}
> -
> -	misc_deregister(&pc87413_miscdev);
> -	unregister_reboot_notifier(&pc87413_notifier);
> +	watchdog_unregister_device(&pc87413wdt_wdd);
>   	release_region(swc_base_addr, 0x20);
>   
>   	pr_info("watchdog component driver removed\n");
> @@ -587,9 +375,3 @@ module_param(timeout, int, 0);
>   MODULE_PARM_DESC(timeout,
>   		"Watchdog timeout in minutes (default="
>   				__MODULE_STRING(DEFAULT_TIMEOUT) ").");
> -
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout,
> -		"Watchdog cannot be stopped once started (default="
> -				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
Again, why drop this module parameter ?

> 

