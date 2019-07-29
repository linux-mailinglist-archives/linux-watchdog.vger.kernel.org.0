Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BB979BE1
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 00:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbfG2V7m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 17:59:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45853 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbfG2V7m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 17:59:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so28688046pfq.12;
        Mon, 29 Jul 2019 14:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=NcwrNg7j+HRd7MjLCT3rvayxG213ODRbG4I++1syays=;
        b=mBiVo6Bs1K3usthxtuR7bVeV4Uh9AcyTyHCY55paZiwp06TMSGR/HB4sCpviCSLmVV
         V8Lp1+o5ylo6xvmjDA6YW4gkCVyMhBc0cr3qFKomjy4ryaUN7KksGbDm7TrMscpYYmBQ
         5+iZrSEpmMuQzfiuoG00EY8EpoBdlnBgV6OHtVo/GcuGq6baqrv7ZWHwwCigJJUD+GYh
         qpKQ5wMrkpTsD3PgM6e7KoxleGpcRh/h4PepjQY58SA6v4mUHYTG1WuzvP1xWkU3ikoU
         taTebHmv0mqUj5SxWtRu4X4bdLGA8JDWqbvT+KKxltfN8OLFjzqUGXY4a+aDm3G7BRXk
         wt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=NcwrNg7j+HRd7MjLCT3rvayxG213ODRbG4I++1syays=;
        b=adUZIEk/qEVIpuAjzaPlnhp7ujj4t73CR0UFLnpRC4JiH4QwgD4sguJO6gx0v8d6tA
         kVUkjmgI82KXaIDEItOxrTZeWkFHP98vpe3b8vVB6YJFLygHg9BVopeiqpha1OkBPh2p
         ebBHaTW6//ghnlu99KVf2Rkgm9sNm7Ne7g7ETx3Cyr7gAtuwbrmXA6Sz/kTgL6VFVxG5
         4q8SlQ2OOkkHhYmYYHkqXwvicXCyjhvDVVGv8pFU/q8Pn3W6S10jNtfzMnAl75KFHZt2
         MoSpDeKcaXx1ftqB/+muDe0CB7NraFHS1eEyaeSpqSU0L70KdkzUIbAyumvaBzPZRWaE
         L6Gg==
X-Gm-Message-State: APjAAAWIje9olj8jF0ZxUpTueFVoA9uQ03CAmrv7XU+oR5Pl8dGnf7Cd
        4thYuhXzZY/B0KeqX0GXSOI=
X-Google-Smtp-Source: APXvYqyQUJUtM0DHntVFZzr1PMFYOgAjZDLwN2PGMlWHawifZJQjZtW9XEYCkikUxYBfalrMMO7rqA==
X-Received: by 2002:aa7:82da:: with SMTP id f26mr38908871pfn.82.1564437581260;
        Mon, 29 Jul 2019 14:59:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x65sm62307416pfd.139.2019.07.29.14.59.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 14:59:40 -0700 (PDT)
Date:   Mon, 29 Jul 2019 14:59:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog device drivers:pc87413_wdt: Rewriting of
 pc87413_wdt driver to utilize common watchdog interface
Message-ID: <20190729215938.GA5712@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 29, 2019 at 02:20:16PM -0700, Mark Balantzyan wrote:
> There is a potential for the variable swc_base_addr in the call chain of the
> driver initialization function (init) to be used before initialization. This
> brought up the need for, by rewriting the driver to use the common watchdog
> interface, ensuring to have all resources in place. This patch addresses this
> need by rewriting into common watchdog interface utilization for the driver.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> 

This patch shows up as corrupted if I try to apply it.

> ---
>  drivers/media/pci/tw686x/Kconfig |  1 +
>  drivers/watchdog/pc87413_wdt.c   | 92 +++++++++++++++-----------------
>  2 files changed, 45 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/Kconfig
> b/drivers/media/pci/tw686x/Kconfig
> index da8bfee7..079d7464 100644
> --- a/drivers/media/pci/tw686x/Kconfig
> +++ b/drivers/media/pci/tw686x/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_TW686X
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_DMA_SG
>  	select SND_PCM
> +	select WATCHDOG_CORE
>  	help
>  	  Support for Intersil/Techwell TW686x-based frame grabber cards.
> 
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index 06a892e3..4c330ee5 100644
> --- a/drivers/watchdog/pc87413_wdt.c
> +++ b/drivers/watchdog/pc87413_wdt.c
> @@ -22,12 +22,10 @@
> 
>  #include <linux/module.h>
>  #include <linux/types.h>
> -#include <linux/miscdevice.h>
>  #include <linux/watchdog.h>
>  #include <linux/ioport.h>
>  #include <linux/delay.h>
>  #include <linux/notifier.h>
> -#include <linux/fs.h>
>  #include <linux/reboot.h>
>  #include <linux/init.h>
>  #include <linux/spinlock.h>
> @@ -65,7 +63,6 @@ static char expect_close;		/* is the close expected? */
> 
>  static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */
> 
> -static bool nowayout = WATCHDOG_NOWAYOUT;
> 
>  /* -- Low level function ----------------------------------------*/
> 
> @@ -216,9 +213,9 @@ static inline void pc87413_disable_sw_wd_trg(void)
> 
>  /* -- Higher level functions ------------------------------------*/
> 
> -/* Enable the watchdog */
> +/* Enable/start the watchdog */
> 
> -static void pc87413_enable(void)
> +static void pc87413_start(void)
>  {
>  	spin_lock(&io_lock);
> 
> @@ -231,9 +228,9 @@ static void pc87413_enable(void)
>  	spin_unlock(&io_lock);
>  }
> 
> -/* Disable the watchdog */
> +/* Disable/stop the watchdog */
> 
> -static void pc87413_disable(void)
> +static void pc87413_stop(void)
>  {
>  	spin_lock(&io_lock);

Locking is handled by the watchdog core. Local locking is no
longer needed.

> 
> @@ -245,9 +242,9 @@ static void pc87413_disable(void)
>  	spin_unlock(&io_lock);
>  }
> 
> -/* Refresh the watchdog */
> +/* Refresh/keepalive the watchdog */
> 
> -static void pc87413_refresh(void)
> +static void pc87413_keepalive(struct watchdog_device *wdd)
>  {
>  	spin_lock(&io_lock);
> 
> @@ -260,6 +257,8 @@ static void pc87413_refresh(void)
>  	pc87413_enable_sw_wd_trg();
> 
>  	spin_unlock(&io_lock);
> +
> +	return 0;
>  }
> 
>  /* -- File operations -------------------------------------------*/
> @@ -278,9 +277,6 @@ static int pc87413_open(struct inode *inode, struct file
> *file)

WHy is this function still there ?

>  	if (test_and_set_bit(0, &timer_enabled))
>  		return -EBUSY;
> 
> -	if (nowayout)
> -		__module_get(THIS_MODULE);
> -
>  	/* Reload and activate timer */
>  	pc87413_refresh();
> 
> @@ -331,7 +327,6 @@ static int pc87413_status(void)
> 
>  /**
>   *	pc87413_write:
> - *	@file: file handle to the watchdog
>   *	@data: data buffer to write
>   *	@len: length in bytes
>   *	@ppos: pointer to the position to write. No seeks allowed
> @@ -345,26 +340,25 @@ static ssize_t pc87413_write(struct file *file, const
> char __user *data,
>  {

This function is no longer needed or used.

>  	/* See if we got the magic character 'V' and reload the timer */
>  	if (len) {
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
> +		size_t i;
> +
> +		/* reset expect flag */
> +		expect_close = 0;
> +
> +		/* scan to see whether or not we got the
> +		   magic character */
> +		for (i = 0; i != len; i++) {
> +			char c;
> +			if (get_user(c, data + i))
> +				return -EFAULT;
> +			if (c == 'V')
> +				expect_close = 42;
>  		}
> +	}
> 
>  		/* someone wrote to us, we should reload the timer */
> -		pc87413_refresh();
> -	}
> +	pc87413_refresh();
> +
>  	return len;
>  }
> 
> @@ -417,7 +411,7 @@ static long pc87413_ioctl(struct file *file, unsigned int
> cmd,

Another function that is no longer needed. And the above looks corrupted.

>  			retval = 0;
>  		}
>  		if (options & WDIOS_ENABLECARD) {
> -			pc87413_enable();
> +			pc87413_start();
>  			retval = 0;
>  		}
>  		return retval;
> @@ -466,31 +460,32 @@ static int pc87413_notify_sys(struct notifier_block
> *this,

Drivers using the watchdog core should use the watchdog core's
restart notifier.

>  {
>  	if (code == SYS_DOWN || code == SYS_HALT)
>  		/* Turn the card off */
> -		pc87413_disable();
> +		pc87413_stop();
>  	return NOTIFY_DONE;
>  }
> 
>  /* -- Module's structures ---------------------------------------*/
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
> +static struct notifier_block pc87413wdt_notifier = {
>  	.notifier_call  = pc87413_notify_sys,
>  };
> 
> -static struct miscdevice pc87413_miscdev = {
> -	.minor          = WATCHDOG_MINOR,
> -	.name           = "watchdog",
> -	.fops           = &pc87413_fops,
> +static struct watchdog_ops pc87413wdt_ops = {
> +       .owner = THIS_MODULE,
> +       .start = pc87413wdt_start,
> +       .stop = pc87413wdt_stop,
> +       .ping = pc87413wdt_keepalive,
> +       .set_timeout = pc87413wdt_set_heartbeat,
> +};
> +
> +static struct watchdog_device pc87413wdt_wdd = {
> +       	.info = &pc87413wdt_ident,
> +       	.ops = &pc87413wdt_ops,
> +	.status = WATCHDOG_NOWAYOUT_INIT_STATUS
>  };
> 
> +
>  /* -- Module init functions -------------------------------------*/
> 
>  /**
> @@ -515,7 +510,7 @@ static int __init pc87413_init(void)
>  	if (ret != 0)
>  		pr_err("cannot register reboot notifier (err=%d)\n", ret);
> 
> -	ret = misc_register(&pc87413_miscdev);
> +	ret = watchdog_register_device(&pc87413wdt_wdd);
>  	if (ret != 0) {
>  		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
>  		       WATCHDOG_MINOR, ret);
> @@ -533,13 +528,14 @@ static int __init pc87413_init(void)
>  		goto misc_unreg;
>  	}
> 
> -	pc87413_enable();
> +	pc87413_start();
> 
Hmm ... I don't think starting the watchdog in the probe function is a good
idea. One reason to believe that no one is actually using it.

>  	release_region(io, 2);
> +	pc87413_keepalive(&pc87413wdt_wdd);
>  	return 0;
> 
>  misc_unreg:
> -	misc_deregister(&pc87413_miscdev);
> +	watchdog_unregister_device(&pc87413wdt_wdd)
>  reboot_unreg:
>  	unregister_reboot_notifier(&pc87413_notifier);
>  	release_region(io, 2);

Are you sure you even compiled this file ? It still calls
misc_deregister() in the exit function, but miscdevice.h is
no longer included. And the now unnecessary but still present
functions should at the very least trigger a build warning.

Overall, I don't think you have this hardware. If you do, please provide
logs showing that the new driver is working. Otherwise, I really think it
would be better to leave it alone.

Thanks,
Guenter
