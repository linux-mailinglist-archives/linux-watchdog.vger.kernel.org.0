Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA287E7B4
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 04:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfHBCDy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Aug 2019 22:03:54 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40796 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfHBCDy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Aug 2019 22:03:54 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so32940668pla.7;
        Thu, 01 Aug 2019 19:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3mHIj0ndAu462QujvXZpV6F4k2xQz+yJ0yvFpV/6BF8=;
        b=pIs9H5mMz5K7v5FK8yxKNhV7OX35zpVU9kdwtfHJKG0qLRDULwxAVKu39m155iy6zE
         QmXjTR54Suu1mvAxHdaMlos6JbmDi7gWoYvHJ/jgYUSM2PKIonz7prKPwXPnUW/0WiXj
         2sWwwMEYdELlHtS3jU7PoaQB6hpDSSuqdPdysThpCNTDxM6BHprfkMnde3YKP8SqkIAT
         fsjUgDjM3Mjk6XGQ0dgAFp2Wd+GQX47qbugRoQVVmnWqMcl3cfgbor51MvZkLFQ2NSv7
         /ENUgwNj8hDBWrodEnfrwl+krF3s8fAFogl8htDRL8e8UfoVG4hKUexAB2h+hYaVrB2s
         tt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3mHIj0ndAu462QujvXZpV6F4k2xQz+yJ0yvFpV/6BF8=;
        b=Aaj2uqk0gZGlE3NlhT3/JOmR6ZvzxttWeNO1pJ8FA2P2BkbTq0vTdMs1bTbotQ24qC
         vDCIZHroYAivaUAaU4i/Hr8naWdpDDvETrBCVHv+8t3kx+3vndkL9UNW543R8BbwPL3+
         csNWkz6IZassNf/RfiBIKA8BKfPcT4pCM92nx4rVhtyp3KjdOj5ssEnBJfajSRCEH8J1
         hii3g/Sn+XXAinWo1SHIvs0Mdtw4XvRg2EWkTkjN34IgRzEVmLrfKq7hcXCnZVIlrvtM
         pz26OI6jvqP/l08lAP3q7QajZpk2TxrEB9GQ1wPAeMTORD08PYWRtlFiWGutAe8O0lZ5
         ZHuw==
X-Gm-Message-State: APjAAAUAFpsC4ipdrJFemM+HdYRWk9GDJLah7OyrNlbU9QvDKaGY/f08
        3U7p/hVoL0G0jKXCuF+i5nE=
X-Google-Smtp-Source: APXvYqzrakzNkb2L5VcFwrNpiIrTw6vT598uvwHPBABZOsBeOag8OeHauB09BPyWwybf6e1bItM4ow==
X-Received: by 2002:a17:902:7283:: with SMTP id d3mr38955359pll.93.1564711432769;
        Thu, 01 Aug 2019 19:03:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 30sm9195567pjk.17.2019.08.01.19.03.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 19:03:51 -0700 (PDT)
Date:   Thu, 1 Aug 2019 19:03:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: alim1535: Rewriting of alim1535 to use
 watchdog subsystem
Message-ID: <20190802020349.GA17198@roeck-us.net>
References: <20190801205834.20956-1-mbalant3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801205834.20956-1-mbalant3@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Aug 01, 2019 at 01:58:34PM -0700, Mark Balantzyan wrote:
> This patch rewrites the alim1535_wdt driver to use the watchdog subsystem. By virtue of this, it also fixes a potential race condition between ali_timeout_bits and ali_settimer().
> 
There is no such race condition, as I explained (or tried
to explain) before. Your tool does not take into account
that the device can only be opened exactly once.

Your description exceeds 75 columns.

> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> ---
>  drivers/watchdog/Kconfig        |   1 +
>  drivers/watchdog/alim1535_wdt.c | 275 +++++---------------------------
>  2 files changed, 37 insertions(+), 239 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9af07fd9..980b0c90 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -853,6 +853,7 @@ config ADVANTECH_WDT
>  
>  config ALIM1535_WDT
>  	tristate "ALi M1535 PMU Watchdog Timer"
> +	select WATCHDOG_CORE
>  	depends on X86 && PCI
>  	---help---
>  	  This is the driver for the hardware watchdog on the ALi M1535 PMU.
> diff --git a/drivers/watchdog/alim1535_wdt.c b/drivers/watchdog/alim1535_wdt.c
> index 60f0c2eb..55648ba8 100644
> --- a/drivers/watchdog/alim1535_wdt.c
> +++ b/drivers/watchdog/alim1535_wdt.c
> @@ -12,26 +12,18 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> -#include <linux/miscdevice.h>
>  #include <linux/watchdog.h>
>  #include <linux/ioport.h>

Not needed.

> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/init.h>
> -#include <linux/fs.h>
> -#include <linux/pci.h>
>  #include <linux/uaccess.h>

No longer needed.

>  #include <linux/io.h>

Not needed.

> +#include <linux/pci.h>

Why did you move this include file ?

>  
>  #define WATCHDOG_NAME "ALi_M1535"
>  #define WATCHDOG_TIMEOUT 60	/* 60 sec default timeout */
>  
>  /* internal variables */
> -static unsigned long ali_is_open;
> -static char ali_expect_release;
>  static struct pci_dev *ali_pci;
>  static u32 ali_timeout_bits;		/* stores the computed timeout */
> -static DEFINE_SPINLOCK(ali_lock);	/* Guards the hardware */
>  
>  /* module parameters */
>  static int timeout = WATCHDOG_TIMEOUT;

Should be set to 0.

> @@ -53,18 +45,15 @@ MODULE_PARM_DESC(nowayout,
>   *	configuration set.
>   */
>  
> -static void ali_start(void)
> +static int ali_start(struct watchdog_device *wdd)
>  {
>  	u32 val;
>  
> -	spin_lock(&ali_lock);
> -

Side note: Presumably this lock was supposed to guard
accesses to the PCI configuration register by other
drivers, but it never did that. The lock was useless
from the beginning.

>  	pci_read_config_dword(ali_pci, 0xCC, &val);
>  	val &= ~0x3F;	/* Mask count */
>  	val |= (1 << 25) | ali_timeout_bits;
>  	pci_write_config_dword(ali_pci, 0xCC, val);
> -
> -	spin_unlock(&ali_lock);
> +	return 0;
>  }
>  
>  /*
> @@ -73,18 +62,15 @@ static void ali_start(void)
>   *	Stop the ALi watchdog countdown
>   */
>  
> -static void ali_stop(void)
> +static int ali_stop(struct watchdog_device *wdd)
>  {
>  	u32 val;
>  
> -	spin_lock(&ali_lock);
> -
>  	pci_read_config_dword(ali_pci, 0xCC, &val);
>  	val &= ~0x3F;		/* Mask count to zero (disabled) */
>  	val &= ~(1 << 25);	/* and for safety mask the reset enable */
>  	pci_write_config_dword(ali_pci, 0xCC, val);
> -
> -	spin_unlock(&ali_lock);
> +	return 0;
>  }
>  
>  /*
> @@ -93,32 +79,24 @@ static void ali_stop(void)
>   *	Send a keepalive to the timer (actually we restart the timer).
>   */
>  
> -static void ali_keepalive(void)
> +static int ali_keepalive(struct watchdog_device *wdd)
>  {
> -	ali_start();
> +	ali_start(wdd);
> +	return 0;
>  }

If the keepalive function does nothing but call the start function,
it can be omitted.

>  
>  /*
> - *	ali_settimer	-	compute the timer reload value
> + *	ali_set_timeout	-	compute the timer reload value
>   *	@t: time in seconds
>   *
>   *	Computes the timeout values needed
>   */
>  
> -static int ali_settimer(int t)
> +static int ali_set_timeout(struct watchdog_device *wdd, unsigned int t)
>  {
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

This is wrong. max_timeout and min_timeout must be set in the
static declaration of struct watchdog_device. Similar,
wdd.timeout should be initialized there with WATCHDOG_TIMEOUT.

Also, a maximum of 60 seconds does not make sense. The (old)
code above clearly accepts timeouts up to 17999 seconds.

Where is ali_timeout_bits now initialized ?

> +	wdd->timeout = t;

wdd->timeout needs to be set to the actual timeout. Per
the above (old) code, this is either a multiple of seconds,
minutes, or five minutes, depending on the requested timeout
value. For example, if t=310 is requested, the actual timeout
is set to 300 seconds. wdd->timeout must then be set to 300.

>  	return 0;
>  }
>  
> @@ -126,172 +104,6 @@ static int ali_settimer(int t)
>   *	/dev/watchdog handling
>   */
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
>  /*
>   *	Data for PCI driver interface
>   *
> @@ -361,23 +173,17 @@ static int __init ali_find_watchdog(void)
>   *	Kernel Interfaces
>   */
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
>  };
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

Also set:
	.info
	.timeout
	.min_timeout
	.max_timeout

> +	.ops = &alim1535wdt_ops,
> +	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
>  };
>  
>  /*
> @@ -403,30 +209,25 @@ static int __init watchdog_init(void)
>  			timeout);
>  	}
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
>  	if (ret != 0) {
> -		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
> -		       WATCHDOG_MINOR, ret);
> -		goto unreg_reboot;
> +		goto reboot_unreg;

A goto to a return statement does not add value.

>  	}
>  
> -	pr_info("initialized. timeout=%d sec (nowayout=%d)\n",
> -		timeout, nowayout);
> +	/* Calculate the watchdog's timeout */
> +	ali_set_timeout(&alim1535wdt_wdd, timeout);
> +
This is unnecessary. The values can and should be initialized in
static struct watchdog_device alim1535wdt_wdd.

> +	return 0;
>  
> -out:
> +reboot_unreg:
>  	return ret;
> -unreg_reboot:
> -	unregister_reboot_notifier(&ali_notifier);
> -	goto out;
>  }
>  
>  /*
> @@ -437,12 +238,8 @@ unreg_reboot:
>  
>  static void __exit watchdog_exit(void)
>  {
> -	/* Stop the timer before we leave */
> -	ali_stop();
> -
>  	/* Deregister */
> -	misc_deregister(&ali_miscdev);
> -	unregister_reboot_notifier(&ali_notifier);
> +	watchdog_unregister_device(&alim1535wdt_wdd);
>  	pci_dev_put(ali_pci);
>  }
>  
> @@ -451,4 +248,4 @@ module_exit(watchdog_exit);
>  
>  MODULE_AUTHOR("Alan Cox");
>  MODULE_DESCRIPTION("ALi M1535 PMU Watchdog Timer driver");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL");

I am at loss what is different here.
