Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FB079ECA
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 04:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731098AbfG3Ciu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 22:38:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45769 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731086AbfG3Ciu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 22:38:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so28994810pfq.12;
        Mon, 29 Jul 2019 19:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MOMsLHE8iWAjlGudjSrvQv7InlDVUX3OBBtsX1hEoBk=;
        b=cSZtLwp/w0+67k9HSr8kN3NGqtm1mzGDU8lJMFb2rLGx1zl4vaGs9ht1UxB8qWd1pr
         yxIEE98VlCv7cQp6ppWeAnEdzYWYK4+N155MDO8UA1u28eh5sOFce1p2yOjIxmVCBiMv
         p0Q3L2bTRm6Y+yDRWztz0PTHv0wHZlvJHqQUrymWnpXhG9QLOoIEaV9a4xX1y6blCu1o
         mZmSTM2RV1bS3YqnCLiWRT+CWQxKvZPrUtYD6Idx2gxrmCqmJK5El0k0xKQGh86ciwFK
         UBStGcO6k5zWa0SYcRYMIi4/uScAuYmByuQcvnpkhnlVPzc+ETfGEMpBZaU8VBsggUT2
         2rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MOMsLHE8iWAjlGudjSrvQv7InlDVUX3OBBtsX1hEoBk=;
        b=GfwPA56ceFo4lfQLx+76i7NnZM9aVwixikDP6M05bPnREs4I0x7M+hQa6VKTcz1D5P
         gAyjsJxgXCB/4kXuTInAiUMg3Yuvmw8F2ybj084guRL9DrzbmzXVAJy34tfD1Pnj87+2
         StFvj63L2HOAB+yegwYSfCzFOkdJRu2qOIngyLexDLjCk0bQNGXAi9QWYFAhuXna9Igg
         VDaq1rWLabGoPrJialErzWf9v2eXVIUBq/uJ7gXY6ZdUcsEa3pxj8GdU6V8rO/fuvkp1
         XXlWxLowYujJQig4ITHF305zLGmrmIlT+Dw/mr9BEPq6Z6KiIc9o22cDGZk6Upz9mDVd
         YN0A==
X-Gm-Message-State: APjAAAXoWFSmSHNpCtDVxvOL/DDYbw4YxRO/nKpI1Gozvj3QmbavKgKs
        JNf5t0oaLOopGO/t6DrtMsRSIQRu
X-Google-Smtp-Source: APXvYqziEoE5WJIQJ2q4YDz4QLSVymECTV2umuPtkhUVwdrLuHHNv2UeqL3z3PIY+BJEH4d4qrcfZA==
X-Received: by 2002:a17:90a:20a2:: with SMTP id f31mr113743475pjg.90.1564454329391;
        Mon, 29 Jul 2019 19:38:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s67sm64537372pjb.8.2019.07.29.19.38.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 19:38:48 -0700 (PDT)
Subject: Re: [PATCH 1/4] watchdog device drivers:pc87413_wdt:Rewriting of
 pc87413_wdt driver to utilize common watchdog interface
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru
References: <20190730021540.66579-1-mbalant3@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <792afc6c-f705-a048-4e6d-81d00754c0ea@roeck-us.net>
Date:   Mon, 29 Jul 2019 19:38:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730021540.66579-1-mbalant3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/19 7:15 PM, Mark Balantzyan wrote:
> There is a potential for the variable swc_base_addr in the call chain of the
> driver initialization function (init) to be used before initialization. This
> brought up the need for, by rewriting the driver to use the common watchdog
> interface, ensuring to have all resources in place. This patch addresses this
> need by rewriting into common watchdog interface utilization for the driver.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> ---
>   drivers/media/pci/tw686x/Kconfig |  1 +
>   drivers/watchdog/pc87413_wdt.c   | 92 +++++++++++++++-----------------
>   2 files changed, 45 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/Kconfig b/drivers/media/pci/tw686x/Kconfig
> index da8bfee7..079d7464 100644
> --- a/drivers/media/pci/tw686x/Kconfig
> +++ b/drivers/media/pci/tw686x/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_TW686X
>   	select VIDEOBUF2_DMA_CONTIG
>   	select VIDEOBUF2_DMA_SG
>   	select SND_PCM
> +	select WATCHDOG_CORE
>   	help
>   	  Support for Intersil/Techwell TW686x-based frame grabber cards.
>   
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index 06a892e3..4c330ee5 100644
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
>   #include <linux/notifier.h>
> -#include <linux/fs.h>
>   #include <linux/reboot.h>
>   #include <linux/init.h>
>   #include <linux/spinlock.h>
> @@ -65,7 +63,6 @@ static char expect_close;		/* is the close expected? */
>   
>   static DEFINE_SPINLOCK(io_lock);	/* to guard us from io races */
>   
> -static bool nowayout = WATCHDOG_NOWAYOUT;
>   
>   /* -- Low level function ----------------------------------------*/
>   
> @@ -216,9 +213,9 @@ static inline void pc87413_disable_sw_wd_trg(void)
>   
>   /* -- Higher level functions ------------------------------------*/
>   
> -/* Enable the watchdog */
> +/* Enable/start the watchdog */
>   
> -static void pc87413_enable(void)
> +static void pc87413_start(void)

I really don't think that this code compiles without warning.

Guenter

>   {
>   	spin_lock(&io_lock);
>   
> @@ -231,9 +228,9 @@ static void pc87413_enable(void)
>   	spin_unlock(&io_lock);
>   }
>   
> -/* Disable the watchdog */
> +/* Disable/stop the watchdog */
>   
> -static void pc87413_disable(void)
> +static void pc87413_stop(void)
>   {
>   	spin_lock(&io_lock);
>   
> @@ -245,9 +242,9 @@ static void pc87413_disable(void)
>   	spin_unlock(&io_lock);
>   }
>   
> -/* Refresh the watchdog */
> +/* Refresh/keepalive the watchdog */
>   
> -static void pc87413_refresh(void)
> +static void pc87413_keepalive(struct watchdog_device *wdd)
>   {
>   	spin_lock(&io_lock);
>   
> @@ -260,6 +257,8 @@ static void pc87413_refresh(void)
>   	pc87413_enable_sw_wd_trg();
>   
>   	spin_unlock(&io_lock);
> +
> +	return 0;
>   }
>   
>   /* -- File operations -------------------------------------------*/
> @@ -278,9 +277,6 @@ static int pc87413_open(struct inode *inode, struct file *file)
>   	if (test_and_set_bit(0, &timer_enabled))
>   		return -EBUSY;
>   
> -	if (nowayout)
> -		__module_get(THIS_MODULE);
> -
>   	/* Reload and activate timer */
>   	pc87413_refresh();
>   
> @@ -331,7 +327,6 @@ static int pc87413_status(void)
>   
>   /**
>    *	pc87413_write:
> - *	@file: file handle to the watchdog
>    *	@data: data buffer to write
>    *	@len: length in bytes
>    *	@ppos: pointer to the position to write. No seeks allowed
> @@ -345,26 +340,25 @@ static ssize_t pc87413_write(struct file *file, const char __user *data,
>   {
>   	/* See if we got the magic character 'V' and reload the timer */
>   	if (len) {
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
>   		}
> +	}
>   
>   		/* someone wrote to us, we should reload the timer */
> -		pc87413_refresh();
> -	}
> +	pc87413_refresh();
> +	
>   	return len;
>   }
>   
> @@ -417,7 +411,7 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
>   			retval = 0;
>   		}
>   		if (options & WDIOS_ENABLECARD) {
> -			pc87413_enable();
> +			pc87413_start();
>   			retval = 0;
>   		}
>   		return retval;
> @@ -466,31 +460,32 @@ static int pc87413_notify_sys(struct notifier_block *this,
>   {
>   	if (code == SYS_DOWN || code == SYS_HALT)
>   		/* Turn the card off */
> -		pc87413_disable();
> +		pc87413_stop();
>   	return NOTIFY_DONE;
>   }
>   
>   /* -- Module's structures ---------------------------------------*/
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
>   	.notifier_call  = pc87413_notify_sys,
>   };
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
>   };
>   
> +
>   /* -- Module init functions -------------------------------------*/
>   
>   /**
> @@ -515,7 +510,7 @@ static int __init pc87413_init(void)
>   	if (ret != 0)
>   		pr_err("cannot register reboot notifier (err=%d)\n", ret);
>   
> -	ret = misc_register(&pc87413_miscdev);
> +	ret = watchdog_register_device(&pc87413wdt_wdd);
>   	if (ret != 0) {
>   		pr_err("cannot register miscdev on minor=%d (err=%d)\n",
>   		       WATCHDOG_MINOR, ret);
> @@ -533,13 +528,14 @@ static int __init pc87413_init(void)
>   		goto misc_unreg;
>   	}
>   
> -	pc87413_enable();
> +	pc87413_start();
>   
>   	release_region(io, 2);
> +	pc87413_keepalive(&pc87413wdt_wdd);
>   	return 0;
>   
>   misc_unreg:
> -	misc_deregister(&pc87413_miscdev);
> +	watchdog_unregister_device(&pc87413wdt_wdd)
>   reboot_unreg:
>   	unregister_reboot_notifier(&pc87413_notifier);
>   	release_region(io, 2);
> 

