Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC2E7EAB5
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 05:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfHBDgn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Aug 2019 23:36:43 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37015 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfHBDgn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Aug 2019 23:36:43 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so35250862pfa.4;
        Thu, 01 Aug 2019 20:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EyRDBP1X9FsqCOeN4NcfZNCd0Vys+839WfeRsnWh20g=;
        b=O0hIvj0kI2DpC9xbCMfI5ReNaKaOnAUdTLuRVYUuU6xF6l3inTE2GhgsSCnnf5YaxH
         KZf95q16u7JCRCJRAEWkRZy7yOVmR81l0R2QCVo9RZ8klMwRSZecMMnemdEI3QORBHcQ
         109UrMA1tjk9tdPyTYiCUgMT/G/WyhVTqiG2cTYo1+AhiIGxVTQuOH2QaSc+ecUbwJxw
         RAFpVrkMHJD14SDyIYSiqZ04uEN+U+phnjZtkRzoK3a2NF4OK/vshb1DjsF9aE322YQ7
         DAeN3StzKDuxEuMkRqcyWs6qHJJCyotEFTgCdaEWpEAoIEbu7MrUp0wSlQirNeJp0hkw
         CmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EyRDBP1X9FsqCOeN4NcfZNCd0Vys+839WfeRsnWh20g=;
        b=bDhPzaUVDoMoqyiz25O886ktxmHezW8ZvMNghuVCDvC+jFvtEOh4uofrv8aYUFpuW7
         aFj5KlKM3VQDNYnQAIMKZ1YU5gtv0LgXg5tKIx8+2DAhWs1HTZ+l9OiA55n1htg3M319
         i4TAqw799FDmOybKzAjDZSyHmtazsPvZxUBxuyOWMrN8eBOJiTuj8Axz1hgrOnR4fC8m
         ygOgkL9kA0CRJW0I1BQJJ0nggRXGNksUgNabSSuDSow39rKiKvFMCInBmg8aaq+gZf4S
         XpezWjn0B1ikzuoUsu7Ey4isrtlmcJdLV9XsyC0uWnvjLSas6Jt05BxNokdaKfuqWi7D
         Gmug==
X-Gm-Message-State: APjAAAXWs5joOSR9iGWOkxDc5GRDgGk/m3vseQ5k0VqvmBCapI7rnnJC
        KqwaOi9h08gd/w/RxFZX9T46mt5g
X-Google-Smtp-Source: APXvYqyIBvaEa0YCbV4M8w1tbVq6sBzuZWYpQ4S4pIyR5rD8rtyLYMLnInePXTu0hNFqNdBkWjTZMA==
X-Received: by 2002:a17:90a:7787:: with SMTP id v7mr2126503pjk.143.1564717001961;
        Thu, 01 Aug 2019 20:36:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r15sm79670978pfh.121.2019.08.01.20.36.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 20:36:41 -0700 (PDT)
Subject: Re: [PATCH v4] watchdog: alim1535: Rewriting of alim1535 to use
 watchdog subsystem
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190802032655.54758-1-mbalant3@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7e17ddd7-e304-67f0-836c-8ba71c5a6778@roeck-us.net>
Date:   Thu, 1 Aug 2019 20:36:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802032655.54758-1-mbalant3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/1/19 8:26 PM, Mark Balantzyan wrote:
> This patch rewrites the alim1535_wdt driver to use the watchdog subsystem.
> By virtue of this, it also fixes a (theoretical) race condition between the
> formerly arranged ali_timeout_bits and ali_settimer() interoperation.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>


This is v4. A minute ago I received v1. Earlier today I got v2, which I
commented on. I didn't see v3 of this patch. I don't see a change log.
At first glance, I don't see a difference to v2.

Sorry, this is a waste of my time. I won't review or comment further.

Guenter

> 
> ---
>   drivers/watchdog/Kconfig        |   1 +
>   drivers/watchdog/alim1535_wdt.c | 275 +++++---------------------------
>   2 files changed, 37 insertions(+), 239 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9af07fd9..980b0c90 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -853,6 +853,7 @@ config ADVANTECH_WDT
>   
>   config ALIM1535_WDT
>   	tristate "ALi M1535 PMU Watchdog Timer"
> +	select WATCHDOG_CORE
>   	depends on X86 && PCI
>   	---help---
>   	  This is the driver for the hardware watchdog on the ALi M1535 PMU.
> diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
> index 60f0c2eb..55648ba8 100644
> --- a/drivers/watchdog/alim1535_wdt.c
> +++ b/drivers/watchdog/alim1535_wdt.c
> @@ -12,26 +12,18 @@
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/types.h>
> -#include <linux/miscdevice.h>
>   #include <linux/watchdog.h>
>   #include <linux/ioport.h>
> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/init.h>
> -#include <linux/fs.h>
> -#include <linux/pci.h>
>   #include <linux/uaccess.h>
>   #include <linux/io.h>
> +#include <linux/pci.h>
>   
>   #define WATCHDOG_NAME "ALi_M1535"
>   #define WATCHDOG_TIMEOUT 60	/* 60 sec default timeout */
>   
>   /* internal variables */
> -static unsigned long ali_is_open;
> -static char ali_expect_release;
>   static struct pci_dev *ali_pci;
>   static u32 ali_timeout_bits;		/* stores the computed timeout */
> -static DEFINE_SPINLOCK(ali_lock);	/* Guards the hardware */
>   
>   /* module parameters */
>   static int timeout = WATCHDOG_TIMEOUT;
> @@ -53,18 +45,15 @@ MODULE_PARM_DESC(nowayout,
>    *	configuration set.
>    */
>   
> -static void ali_start(void)
> +static int ali_start(struct watchdog_device *wdd)
>   {
>   	u32 val;
>   
> -	spin_lock(&ali_lock);
> -
>   	pci_read_config_dword(ali_pci, 0xCC, &val);
>   	val &= ~0x3F;	/* Mask count */
>   	val |= (1 << 25) | ali_timeout_bits;
>   	pci_write_config_dword(ali_pci, 0xCC, val);
> -
> -	spin_unlock(&ali_lock);
> +	return 0;
>   }
>   
>   /*
> @@ -73,18 +62,15 @@ static void ali_start(void)
>    *	Stop the ALi watchdog countdown
>    */
>   
> -static void ali_stop(void)
> +static int ali_stop(struct watchdog_device *wdd)
>   {
>   	u32 val;
>   
> -	spin_lock(&ali_lock);
> -
>   	pci_read_config_dword(ali_pci, 0xCC, &val);
>   	val &= ~0x3F;		/* Mask count to zero (disabled) */
>   	val &= ~(1 << 25);	/* and for safety mask the reset enable */
>   	pci_write_config_dword(ali_pci, 0xCC, val);
> -
> -	spin_unlock(&ali_lock);
> +	return 0;
>   }
>   
>   /*
> @@ -93,32 +79,24 @@ static void ali_stop(void)
>    *	Send a keepalive to the timer (actually we restart the timer).
>    */
>   
> -static void ali_keepalive(void)
> +static int ali_keepalive(struct watchdog_device *wdd)
>   {
> -	ali_start();
> +	ali_start(wdd);
> +	return 0;
>   }
>   
>   /*
> - *	ali_settimer	-	compute the timer reload value
> + *	ali_set_timeout	-	compute the timer reload value
>    *	@t: time in seconds
>    *
>    *	Computes the timeout values needed
>    */
>   
> -static int ali_settimer(int t)
> +static int ali_set_timeout(struct watchdog_device *wdd, unsigned int t)
>   {
> -	if (t < 0)
> -		return -EINVAL;
> -	else if (t < 60)
> -		ali_timeout_bits = t|(1 << 6);
> -	else if (t < 3600)
> -		ali_timeout_bits = (t / 60)|(1 << 7);
> -	else if (t < 18000)
> -		ali_timeout_bits = (t / 300)|(1 << 6)|(1 << 7);
> -	else
> -		return -EINVAL;
> -
> -	timeout = t;
> +	wdd->max_timeout = 60;
> +	wdd->min_timeout = 1;
> +	wdd->timeout = t;
>   	return 0;
>   }
>   
> @@ -126,172 +104,6 @@ static int ali_settimer(int t)
>    *	/dev/watchdog handling
>    */
>   
> -/*
> - *	ali_write	-	writes to ALi watchdog
> - *	@file: file from VFS
> - *	@data: user address of data
> - *	@len: length of data
> - *	@ppos: pointer to the file offset
> - *
> - *	Handle a write to the ALi watchdog. Writing to the file pings
> - *	the watchdog and resets it. Writing the magic 'V' sequence allows
> - *	the next close to turn off the watchdog.
> - */
> -
> -static ssize_t ali_write(struct file *file, const char __user *data,
> -						size_t len, loff_t *ppos)
> -{
> -	/* See if we got the magic character 'V' and reload the timer */
> -	if (len) {
> -		if (!nowayout) {
> -			size_t i;
> -
> -			/* note: just in case someone wrote the
> -			   magic character five months ago... */
> -			ali_expect_release = 0;
> -
> -			/* scan to see whether or not we got
> -			   the magic character */
> -			for (i = 0; i != len; i++) {
> -				char c;
> -				if (get_user(c, data + i))
> -					return -EFAULT;
> -				if (c == 'V')
> -					ali_expect_release = 42;
> -			}
> -		}
> -
> -		/* someone wrote to us, we should reload the timer */
> -		ali_start();
> -	}
> -	return len;
> -}
> -
> -/*
> - *	ali_ioctl	-	handle watchdog ioctls
> - *	@file: VFS file pointer
> - *	@cmd: ioctl number
> - *	@arg: arguments to the ioctl
> - *
> - *	Handle the watchdog ioctls supported by the ALi driver. Really
> - *	we want an extension to enable irq ack monitoring and the like
> - */
> -
> -static long ali_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> -{
> -	void __user *argp = (void __user *)arg;
> -	int __user *p = argp;
> -	static const struct watchdog_info ident = {
> -		.options =		WDIOF_KEEPALIVEPING |
> -					WDIOF_SETTIMEOUT |
> -					WDIOF_MAGICCLOSE,
> -		.firmware_version =	0,
> -		.identity =		"ALi M1535 WatchDog Timer",
> -	};
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(argp, &ident, sizeof(ident)) ? -EFAULT : 0;
> -
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, p);
> -	case WDIOC_SETOPTIONS:
> -	{
> -		int new_options, retval = -EINVAL;
> -
> -		if (get_user(new_options, p))
> -			return -EFAULT;
> -		if (new_options & WDIOS_DISABLECARD) {
> -			ali_stop();
> -			retval = 0;
> -		}
> -		if (new_options & WDIOS_ENABLECARD) {
> -			ali_start();
> -			retval = 0;
> -		}
> -		return retval;
> -	}
> -	case WDIOC_KEEPALIVE:
> -		ali_keepalive();
> -		return 0;
> -	case WDIOC_SETTIMEOUT:
> -	{
> -		int new_timeout;
> -		if (get_user(new_timeout, p))
> -			return -EFAULT;
> -		if (ali_settimer(new_timeout))
> -			return -EINVAL;
> -		ali_keepalive();
> -	}
> -		/* fall through */
> -	case WDIOC_GETTIMEOUT:
> -		return put_user(timeout, p);
> -	default:
> -		return -ENOTTY;
> -	}
> -}
> -
> -/*
> - *	ali_open	-	handle open of ali watchdog
> - *	@inode: inode from VFS
> - *	@file: file from VFS
> - *
> - *	Open the ALi watchdog device. Ensure only one person opens it
> - *	at a time. Also start the watchdog running.
> - */
> -
> -static int ali_open(struct inode *inode, struct file *file)
> -{
> -	/* /dev/watchdog can only be opened once */
> -	if (test_and_set_bit(0, &ali_is_open))
> -		return -EBUSY;
> -
> -	/* Activate */
> -	ali_start();
> -	return nonseekable_open(inode, file);
> -}
> -
> -/*
> - *	ali_release	-	close an ALi watchdog
> - *	@inode: inode from VFS
> - *	@file: file from VFS
> - *
> - *	Close the ALi watchdog device. Actual shutdown of the timer
> - *	only occurs if the magic sequence has been set.
> - */
> -
> -static int ali_release(struct inode *inode, struct file *file)
> -{
> -	/*
> -	 *      Shut off the timer.
> -	 */
> -	if (ali_expect_release == 42)
> -		ali_stop();
> -	else {
> -		pr_crit("Unexpected close, not stopping watchdog!\n");
> -		ali_keepalive();
> -	}
> -	clear_bit(0, &ali_is_open);
> -	ali_expect_release = 0;
> -	return 0;
> -}
> -
> -/*
> - *	ali_notify_sys	-	System down notifier
> - *
> - *	Notifier for system down
> - */
> -
> -
> -static int ali_notify_sys(struct notifier_block *this,
> -					unsigned long code, void *unused)
> -{
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		ali_stop();		/* Turn the WDT off */
> -	return NOTIFY_DONE;
> -}
> -
>   /*
>    *	Data for PCI driver interface
>    *
> @@ -361,23 +173,17 @@ static int __init ali_find_watchdog(void)
>    *	Kernel Interfaces
>    */
>   
> -static const struct file_operations ali_fops = {
> -	.owner		=	THIS_MODULE,
> -	.llseek		=	no_llseek,
> -	.write		=	ali_write,
> -	.unlocked_ioctl =	ali_ioctl,
> -	.open		=	ali_open,
> -	.release	=	ali_release,
> +static struct watchdog_ops alim1535wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = ali_start,
> +	.stop = ali_stop,
> +	.ping = ali_keepalive,
> +	.set_timeout = ali_set_timeout,
>   };
>   
> -static struct miscdevice ali_miscdev = {
> -	.minor =	WATCHDOG_MINOR,
> -	.name =		"watchdog",
> -	.fops =		&ali_fops,
> -};
> -
> -static struct notifier_block ali_notifier = {
> -	.notifier_call =	ali_notify_sys,
> +static struct watchdog_device alim1535wdt_wdd = {
> +	.ops = &alim1535wdt_ops,
> +	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
>   };
>   
>   /*
> @@ -403,30 +209,25 @@ static int __init watchdog_init(void)
>   			timeout);
>   	}
>   
> -	/* Calculate the watchdog's timeout */
> -	ali_settimer(timeout);
> +	watchdog_stop_on_reboot(&alim1535wdt_wdd);
> +
> +	watchdog_init_timeout(&alim1535wdt_wdd, timeout, NULL);
> +
> +	watchdog_set_nowayout(&alim1535wdt_wdd, nowayout);
>   
> -	ret = register_reboot_notifier(&ali_notifier);
> -	if (ret != 0) {
> -		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> -		goto out;
> -	}
> +	ret = watchdog_register_device(&alim1535wdt_wdd);
>   
> -	ret = misc_register(&ali_miscdev);
>   	if (ret != 0) {
> -		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> -		       WATCHDOG_MINOR, ret);
> -		goto unreg_reboot;
> +		goto reboot_unreg;
>   	}
>   
> -	pr_info("initialized. timeout=%d sec (nowayout=%d)\n",
> -		timeout, nowayout);
> +	/* Calculate the watchdog's timeout */
> +	ali_set_timeout(&alim1535wdt_wdd, timeout);
> +
> +	return 0;
>   
> -out:
> +reboot_unreg:
>   	return ret;
> -unreg_reboot:
> -	unregister_reboot_notifier(&ali_notifier);
> -	goto out;
>   }
>   
>   /*
> @@ -437,12 +238,8 @@ unreg_reboot:
>   
>   static void __exit watchdog_exit(void)
>   {
> -	/* Stop the timer before we leave */
> -	ali_stop();
> -
>   	/* Deregister */
> -	misc_deregister(&ali_miscdev);
> -	unregister_reboot_notifier(&ali_notifier);
> +	watchdog_unregister_device(&alim1535wdt_wdd);
>   	pci_dev_put(ali_pci);
>   }
>   
> @@ -451,4 +248,4 @@ module_exit(watchdog_exit);
>   
>   MODULE_AUTHOR("Alan Cox");
>   MODULE_DESCRIPTION("ALi M1535 PMU Watchdog Timer driver");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL");
> 

