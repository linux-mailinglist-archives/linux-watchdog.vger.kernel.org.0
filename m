Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9D9216505
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 06:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGGED6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jul 2020 00:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGGED6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jul 2020 00:03:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF73C061755
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Jul 2020 21:03:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d194so16009641pga.13
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Jul 2020 21:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ah//HnOYLoZFN7/uULhXFjFH7DgnDlki26XRvTAwcaw=;
        b=GzmYpXjHlMi3mEAm+IPwZFYSn8brHletHTHZ+AqSzv4TNKqHH0TnA80Qdt9auqtk7+
         TMmKmeocnb2rPaGXnZhLLiV+uoz3GOw6grlkonf/maX2CIXQJxB6q0WLE1srCMHlbDIQ
         vLpptsLAZcqnDyifGGJx9gf54SQv1GD81IR2GpmbL/vsH7ORZ8NNcsdZeJvtu0SBu/48
         bW3loJYC7/uFVOcPjf3tP+jC9tsh/6ZN7+ZP21Mx5eUULXw3GXSWaVucCXjIFLXDYM0f
         nqSu9yptnIWXtJRTBhxqRW9y7FS+YGKiZnQc4nBXNaodgo22RUoW/28D55CHWd/pRPbQ
         bhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ah//HnOYLoZFN7/uULhXFjFH7DgnDlki26XRvTAwcaw=;
        b=GTNary7cmF4jJSA7VhuK65fqJ17nt9dbUvbeeROIhFwhaevYL5yFs9W8kp5tT2EUXt
         KK2ZV/ePy5gtRiLLVG4rfaEg48BlkludB0xLrWe/BdC6AyHo5yX9O6wZhOdS4Dr4dm22
         +gyMs+oyAi0SdELAOXypE2ZzXHE0jiotjI/Ar5fcx0UHvr3gMUEbfzDq4+3bjq+p5hJX
         XsYCMoBRz9RxJa/zIDnKVfPo7QTa3LzN4227M/U2lDfiVR7xeqp6gD0WmgWxotGSd8Fz
         brKxHlQgpB/zu0hBdCDCzR2lWJ7TlpzmJl9tScL8Z8cuuQXC68PKJWPuSNveD5Ys/3Yt
         0ASA==
X-Gm-Message-State: AOAM5320RP56p+D7ylR8xlNYCx8Y1F0eQtubB0GXTfFer5h2QuIrpf5N
        qVmIygFZx7afiS7E/UfUsvw=
X-Google-Smtp-Source: ABdhPJx4x0TPtRYWQQyZ31Km0f2EJ/kButStmMtDaa3I+t3hZ0+GrMobQS9I79eWMKb3OPNwR1fMeQ==
X-Received: by 2002:a05:6a00:2292:: with SMTP id f18mr46887845pfe.192.1594094638057;
        Mon, 06 Jul 2020 21:03:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m140sm21232429pfd.195.2020.07.06.21.03.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 21:03:57 -0700 (PDT)
Date:   Mon, 6 Jul 2020 21:03:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Woody Lin <woodylin@google.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] softdog: Add options 'soft_reboot_cmd' and
 'soft_active_on_boot'
Message-ID: <20200707040356.GA213018@roeck-us.net>
References: <20200701110339.2833449-1-woodylin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701110339.2833449-1-woodylin@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 01, 2020 at 07:03:40PM +0800, Woody Lin wrote:
> Add module parameters 'soft_reboot_cmd' and 'soft_active_on_boot' for
> customizing softdog configuration; config reboot command by assigning
> soft_reboot_cmd, and set soft_active_on_boot to start up softdog
> timer at module initialization stage.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>
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

Per coding style there should be an empty line here.

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

soft_reboot_cmd can be NULL, which makes the output a bit awkward.

>  
>  	return 0;
>  }
