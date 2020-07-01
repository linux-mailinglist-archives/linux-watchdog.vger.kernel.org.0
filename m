Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49EA210D35
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 16:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731410AbgGAOKj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Jul 2020 10:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731331AbgGAOKh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Jul 2020 10:10:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EC3C08C5C1
        for <linux-watchdog@vger.kernel.org>; Wed,  1 Jul 2020 07:10:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 67so6989600pfg.5
        for <linux-watchdog@vger.kernel.org>; Wed, 01 Jul 2020 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bCMRjck66x9jUK9kbbHBC8u615rQ7Q4nviFY68ZE3NA=;
        b=lDI1l238EOGHgUiZ8vKvbRyUWFEpus8XroS/wvzDuGcuauFORH/7pcsFKKzakclXBc
         Q9jO+gG/e8BV0bZEusVUvPqFQ/NtpGqve7n7LHIa5H+y+TifNuBcYNIHOwl+aPcI3X3Y
         yzyhUbiG0GyXue8Q9EkTb6u7PC6HMVnKLGYtHRrRoW3wbFaFETSZ9dCpMn/V1q6eV9xs
         ofvIeosI90RKSI31JRk0DG8uk3y+nvyPqqg36nkLWLwyPyEXn0s2DA8jeSLpYi8sZY72
         KW16jEQwMDZcni0c6MfGfXIkwiisMvWf6wZZCT2xbYA/J4TdEc+D0U7aVVH7LyPaiFbQ
         C4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bCMRjck66x9jUK9kbbHBC8u615rQ7Q4nviFY68ZE3NA=;
        b=ig1D80MQVp6qBOnWw8lRjRXohucqRBhP2gyeYPwFi4iUTGVe/oOcKVdBP5NEXiRV3p
         4oZ+sAy+ceUPExt0mOeYiChH9fIQTeiLAFZYzorMZXnNJK2vmBZk6VACicCl4IvxHDss
         bvxHe+HH7s5ZptLA7HICj9IrOFQRAkjw+ZDZmcdTs4oW+egzqOKzPJbLPZkw1ndkq/Pl
         hl1y7e/e3Iqq2ZVXWauvRivkdjuCZjI8lgUNOvllFPYAtQqon3i/0+vOoh67HLh0AYO8
         04D29FPOXBP8ffjrcnjP+xw1ocTXYNpOmZ4iC5VX5asv8SdlGVPf2t5l9AJk9ZCtaQpK
         IfJw==
X-Gm-Message-State: AOAM530b+B3n1D+85vPezdE0q7QjnIH/Nu7FLr+0gkLFpXJc8QD8Wmpd
        8edmXnxOUsIG7cFL56asQe4pZ2P4
X-Google-Smtp-Source: ABdhPJxlJOm3WAw70TSWl7Y/5QatMp4+fx1mcMU7+FBjoxNBgM+PgEcfDJhOyfL6SLv4vFQVflFCJw==
X-Received: by 2002:a63:8f18:: with SMTP id n24mr19373145pgd.432.1593612636814;
        Wed, 01 Jul 2020 07:10:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y27sm6216974pgc.56.2020.07.01.07.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 07:10:36 -0700 (PDT)
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and
 'soft_active_on_boot'
To:     Woody Lin <woodylin@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <20200701110339.2833449-1-woodylin@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d2ea870d-a9d0-fe8f-c11b-aa54750f1d0d@roeck-us.net>
Date:   Wed, 1 Jul 2020 07:10:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701110339.2833449-1-woodylin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/1/20 4:03 AM, Woody Lin wrote:
> Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> customizing softdog configuration; config reboot command by assigning
> soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> timer at module initialization stage.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>

Sigh. Now I'll have to look up old versions and compare to figure out
changes from v2. Why do people always believe that kernel maintainers
have endless amounts of time available ?

[ Sorry, yes, I know, we are supposed to remain friendly all the time.
  It is just _so_ frustrating to have to deal with this all the time. ]

Guenter

> ---
>  drivers/watchdog/softdog.c | 56 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
> index 3e4885c1545e..8c8d214b6aa7 100644
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
> @@ -49,11 +51,33 @@ module_param(soft_panic, int, 0);
>  MODULE_PARM_DESC(soft_panic,
>  	"Softdog action, set to 1 to panic, 0 to reboot (default=0)");
>  
> +static char *soft_reboot_cmd;
> +module_param(soft_reboot_cmd, charp, 0000);
> +MODULE_PARM_DESC(soft_reboot_cmd,
> +	"Set reboot command. Emergency reboot takes place if unset");
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
> +	kernel_restart(soft_reboot_cmd);
> +	return -EPERM; /* Should not reach here */
> +}
> +
> +static void reboot_work_fn(struct work_struct *unused)
> +{
> +	kthread_run(reboot_kthread_fn, NULL, "softdog_reboot");
> +}
> +
>  static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>  {
> +	static bool soft_reboot_fired;
>  	module_put(THIS_MODULE);
>  	if (soft_noboot) {
>  		pr_crit("Triggered - Reboot ignored\n");
> @@ -62,6 +86,33 @@ static enum hrtimer_restart softdog_fire(struct hrtimer *timer)
>  		panic("Software Watchdog Timer expired");
>  	} else {
>  		pr_crit("Initiating system reboot\n");
> +		if (!soft_reboot_fired && soft_reboot_cmd != NULL) {
> +			static DECLARE_WORK(reboot_work, reboot_work_fn);
> +			/*
> +			 * The 'kernel_restart' is a 'might-sleep' operation.
> +			 * Also, executing it in system-wide workqueues blocks
> +			 * any driver from using the same workqueue in its
> +			 * shutdown callback function. Thus, we should execute
> +			 * the 'kernel_restart' in a standalone kernel thread.
> +			 * But since starting a kernel thread is also a
> +			 * 'might-sleep' operation, so the 'reboot_work' is
> +			 * required as a launcher of the kernel thread.
> +			 *
> +			 * After request the reboot, restart the timer to
> +			 * schedule an 'emergency_restart' reboot after
> +			 * 'TIMER_MARGIN' seconds. It's because if the softdog
> +			 * hangs, it might be because of scheduling issues. And
> +			 * if that is the case, both 'schedule_work' and
> +			 * 'kernel_restart' may possibly be malfunctional at the
> +			 * same time.
> +			 */
> +			soft_reboot_fired = true;
> +			schedule_work(&reboot_work);
> +			hrtimer_add_expires_ns(timer,
> +					(u64)TIMER_MARGIN * NSEC_PER_SEC);
> +
> +			return HRTIMER_RESTART;
> +		}
>  		emergency_restart();
>  		pr_crit("Reboot didn't ?????\n");
>  	}
> @@ -145,12 +196,17 @@ static int __init softdog_init(void)
>  		softdog_preticktock.function = softdog_pretimeout;
>  	}
>  
> +	if (soft_active_on_boot)
> +		softdog_ping(&softdog_dev);
> +
>  	ret = watchdog_register_device(&softdog_dev);
>  	if (ret)
>  		return ret;
>  
>  	pr_info("initialized. soft_noboot=%d soft_margin=%d sec soft_panic=%d (nowayout=%d)\n",
>  		soft_noboot, softdog_dev.timeout, soft_panic, nowayout);
> +	pr_info("             soft_reboot_cmd=%s soft_active_on_boot=%d\n",
> +		soft_reboot_cmd, soft_active_on_boot);
>  
>  	return 0;
>  }
> 

