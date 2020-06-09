Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74081F420A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jun 2020 19:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgFIRSf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jun 2020 13:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728772AbgFIRSe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jun 2020 13:18:34 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA15EC05BD1E
        for <linux-watchdog@vger.kernel.org>; Tue,  9 Jun 2020 10:18:33 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g12so8286015pll.10
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Jun 2020 10:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+SyB1ZujvFPK8vInQGfzVO9nQFcQz05YdLxszlyy2rA=;
        b=mnL7rFrEL3mhTGqMygAaBGs/Cy8Z5YzSd7wxuUJgU0MJNlpikgKpjBku8DLo6SRNdk
         Si8pibiPfR/RrxBkjrdwrPVRIs8AyGTGATgv4MBrxHvpBPez+qhhhqT/Qa+qa3taYrOX
         NpFoU2XL5e9eVqZh0lsO56zhSQ2Fhu5JocpW4lf40jZv9RUuhPIoiDlNEOlOV30mQVAX
         VCIKC0cnn2hunbd8QDvorJGn7dLXps7IELAEG/A+LP6ZfU0WuQ+vxJ7CLOgxk2WnyPTg
         jGh7M8hLxtC0b1vgZsHsBr6G2DsFXJCLDv0TBYIS5yJ8oNY9uVmT3nQ+ugalRGSy199m
         Koxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+SyB1ZujvFPK8vInQGfzVO9nQFcQz05YdLxszlyy2rA=;
        b=ugjissp/t03XCT7bcnRrxDrTXigPondoO2s79lrb371PydJpLAosDEwNu1BKJLnrPo
         Y00sy4qI5hgw0PXS+sgVAMbQQ5kK9ov3MNdBLFrD7keLv5s5luEpb/qfk2zquMz3uEeE
         uDMHwijQaj+ibHp9hY0SdIQwYsdNALVH3E8jomYKORSSVhr23+u928PMSXKd6/+/UiHT
         yoqSytaP0HUP2sNiD3Ntw2Sfqn8RvZoV7EMQJs08Iz43YSjXAmtK8Nk+iodkRPSWLEoh
         UxUqhTKpn5mP4Nn3CySmQjicnYOVDI4P821IaRVKxaOjnX9ShVESSOBnUWze8zLRzhGi
         3ang==
X-Gm-Message-State: AOAM533yAkIJcJHKyx21nbaCXnLdLiAt9W43h3RjzgVClmGhI7s9B8rl
        vMiCfjmKZmN6XGerEDULFupkTw7q
X-Google-Smtp-Source: ABdhPJzBWeiDbgvtEYx1HTy6uWa0yVzj4dku2EPZSOJAMrbVziKIF6taEnirR4IYq7YZkJ5pA/sDew==
X-Received: by 2002:a17:902:8a95:: with SMTP id p21mr3996867plo.230.1591723112839;
        Tue, 09 Jun 2020 10:18:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k126sm10663475pfd.129.2020.06.09.10.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 10:18:31 -0700 (PDT)
Subject: Re: [PATCH] softdog: Add options 'soft_reboot_target' and
 'soft_active_on_boot'
To:     Woody Lin <woodylin@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <20200603103923.116113-1-woodylin@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <938e6176-aa35-8613-231e-31fb37fd09b1@roeck-us.net>
Date:   Tue, 9 Jun 2020 10:18:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200603103923.116113-1-woodylin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/3/20 3:39 AM, Woody Lin wrote:
> Add module parameters 'soft_reboot_target' and 'soft_active_on_boot' for
> customizing softdog configuration; config reboot target by assigning
> soft_reboot_target, and set soft_active_on_boot to start up softdog
> timer at module initialization stage.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>
> ---
>  drivers/watchdog/softdog.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index 3e4885c1545e..f5027acddbbb 100644
> --- a/drivers/watchdog/softdog.c
> +++ b/drivers/watchdog/softdog.c
> @@ -20,11 +20,13 @@
>  #include <linux/hrtimer.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/kthread.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/reboot.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/workqueue.h>
>  
>  #define TIMER_MARGIN	60		/* Default is 60 seconds */
>  static unsigned int soft_margin = TIMER_MARGIN;	/* in seconds */
> @@ -49,9 +51,32 @@ module_param(soft_panic, int, 0);
>  MODULE_PARM_DESC(soft_panic,
>  	"Softdog action, set to 1 to panic, 0 to reboot (default=0)");
>  
> +static char *soft_reboot_target;
> +module_param(soft_reboot_target, charp, 0000);
> +MODULE_PARM_DESC(soft_reboot_target,
> +	"Softdog action, set reboot target (default=emergency)");
> +
> +static bool soft_active_on_boot;
> +module_param(soft_active_on_boot, bool, 0000);
> +MODULE_PARM_DESC(soft_active_on_boot,
> +	"Set to true to active Softdog on boot (default=false)");
> +
>  static struct hrtimer softdog_ticktock;
>  static struct hrtimer softdog_preticktock;
>  
> +static int reboot_kthread_fn(void *data)
> +{
> +	kernel_restart(soft_reboot_target);
> +	emergency_restart(); /* Should not reach here */
> +	return -EPERM;       /* Should not reach here */
> +}
> +
> +static void reboot_work_fn(struct work_struct *unused)
> +{
> +	if (IS_ERR(kthread_run(reboot_kthread_fn, NULL, "softdog_reboot")))
> +		emergency_restart();
> +}
> +
>  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>  {
>  	module_put(THIS_MODULE);
> @@ -62,6 +87,12 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>  		panic("Software Watchdog Timer expired");
>  	} else {
>  		pr_crit("Initiating system reboot\n");
> +		if (soft_reboot_target != NULL) {
> +			static DECLARE_WORK(reboot_work, reboot_work_fn);
> +
> +			schedule_work(&reboot_work);
> +			return HRTIMER_NORESTART;
> +		}

So this adds a double indirection: It first schedules a worker,
then the worker creates a kernel thread, which finally calls
kernel_restart(). If the softdog hangs, it may well be because
of scheduling issues. If so, both the worker and the kernel thread
may never execute, and the system would not reboot even though
the softdog did fire.

Is this double indirection really necessary ?

Thanks,
Guenter

>  		emergency_restart();
>  		pr_crit("Reboot didn't ?????\n");
>  	}
> @@ -145,12 +176,19 @@ static int __init softdog_init(void)
>  		softdog_preticktock.function = softdog_pretimeout;
>  	}
>  
> +	if (soft_active_on_boot) {
> +		set_bit(WDOG_HW_RUNNING, &softdog_dev.status);
> +		set_bit(WDOG_ACTIVE, &softdog_dev.status);
> +	}
> +
>  	ret = watchdog_register_device(&softdog_dev);
>  	if (ret)
>  		return ret;
>  
>  	pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
>  		soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> +	pr_info("             soft_reboot_target=%s soft_active_on_boot=%d\n",
> +		soft_reboot_target, soft_active_on_boot);
>  
>  	return 0;
>  }
> 

