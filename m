Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841DF30E9D1
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Feb 2021 03:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhBDCCG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 21:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhBDCCE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 21:02:04 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF8BC061573
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Feb 2021 18:01:24 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id d20so2120794oiw.10
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Feb 2021 18:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jgG+Ezz4ZGHiwAd9uot2tYfnQqc2DdNufBjLPuUfz0M=;
        b=h4EvnoFy9UaurOrFPS6o6V8ckVSFPnuGaFO95hE2TsbSo4XBDRf9OozlAdnN0oGMjP
         TSWINixHvrfWEa+JWwULZoA9EtRQu/7vE5VxBjgrcxhTMBHO/1uhctMgWIWfoW/iZZGE
         /TmCo/IbZxPCYLhLJKGvuFnn0wRLCiBOM606CKeOPFwVbwvV5RXi8itlPyMBjgMgTmCP
         phKZnzEfoZsd6vlzjezSY+3j4bV02Ec6yV5uYEARplGNTPpmYKTuaWRYCAFf59dUiD4N
         tFfp1T1Lrw0uJe/w7Tf+zuZ+xQg5wBjcqgj4kf1Ykk8MfVHcT7L4gY0uDNTH/SABmxwR
         GhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jgG+Ezz4ZGHiwAd9uot2tYfnQqc2DdNufBjLPuUfz0M=;
        b=k0Q7m+/YEmX2gzfyOdLmLNAaBD1KhNjqadf22yu64luAyyV7n7GGH1ztC2+Un9OkCB
         kXZSK8bFR4B1Z0brIIk44Hfqx6QtWHUgQVWUyHhLUGOP4Eq2SCZtXu2lq9+2yoO3LAtI
         pFboQ2mcufKXj3CORcTtirznlJgsQmhDcl5f2aEZ6VDYHb+mVuXZlyvY3TcXkO29n6Qe
         pxIYsqEtvakcTc7eanzfY2lpGy/er8eJ7XIAum2ceEVhWwFwwXorHcNvB7og4SD/2ukL
         4D9AXsYxbEWFkE7ep2XikOC638jdfYA5ABul9NPq3L+KW99stWAphGPXCriraukYBU3h
         CpqQ==
X-Gm-Message-State: AOAM530FQBd9HvmAxT4mjryZdCncfKdH5N9tzJO0h2R3tCIYgeEFa9NB
        BUZQqRSdZsndD/IQd52WPIYemuAB2d8=
X-Google-Smtp-Source: ABdhPJyNlXm2ewR3QfdsmFdevGg5lukQBmBMWrNghYBvS5Li6oUTChC6Z1nAX7uWC/olr3GVxeZN6Q==
X-Received: by 2002:aca:dd08:: with SMTP id u8mr3937692oig.55.1612404083170;
        Wed, 03 Feb 2021 18:01:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h11sm844568ooj.36.2021.02.03.18.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 18:01:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4] Extend watchdog timeout during kernel panic.
To:     JP Ertola <jp.ertola@hpe.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
References: <20210203153602.82063-1-jp.ertola@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9ffe5103-d5c5-e823-71b0-f976c00fccb2@roeck-us.net>
Date:   Wed, 3 Feb 2021 18:01:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203153602.82063-1-jp.ertola@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/3/21 7:36 AM, JP Ertola wrote:
> If the watchdog timeout is set such that the crash kernel does not
> have time to collect a coredump and the crash kernel is not equipped to
> ping the watchdog timer itself, then a kernel coredump will not be collected
> before the watchdog fires. This change registers a panic notifier and
> callback so the watchdog timeout can be extended if a kernel panic occurs.
> This timeout extension would give the crash kernel enough time to collect
> a coredump before the CPU resets. The watchdog timeout is extended if and only
> if a crash kernel image is loaded in memory, the watchdog is active at the
> time of the panic, and the kconfig setting is set.
> 
> A Kconfig option has been added to configure the timeout duration at
> compile-time. Default is zero seconds.
> 
> Signed-off-by: JP Ertola <jp.ertola@hpe.com>
> ---
> v4: Remove optional callback mechanism alltogether. I agree with Guenter, 
> not widely used.
> v3: Fix logic so timeout extension is not longer than wdd->max_timeout
> v2: Remove dead code and comments.
>  drivers/watchdog/Kconfig        | 13 ++++++
>  drivers/watchdog/watchdog_dev.c | 80 ++++++++++++++++++++++++++++++++-
>  include/linux/watchdog.h        |  1 +
>  3 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..f1055985e100 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -141,6 +141,19 @@ comment "Watchdog Device Drivers"
>  
>  # Architecture Independent
>  
> +config DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT
> +	int "Default timeout for watchdog timer before crash kernel starts (seconds)"
> +	default 0
> +	help
> +	  This option allows an extended timeout to be used for the watchdog when
> +	  the kernel panics and a crash kernel is about to start. This is helpful
> +	  when the existing WDT timeout value is less than the time required for
> +	  crash kernel to run and the crash kernel is unable to handle the
> +	  the watchdog itself. The timeout extension happens last in chain of
> +	  kernel panic handler callbacks just in case another panic handler
> +	  hangs unexpectedly. When this value is set to 0, the watchdog timeout
> +	  will not be changed.
> +
>  config SOFT_WATCHDOG
>  	tristate "Software watchdog"
>  	select WATCHDOG_CORE
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..cf91c08b0606 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -34,6 +34,7 @@
>  #include <linux/init.h>		/* For __init/__exit/... */
>  #include <linux/hrtimer.h>	/* For hrtimers */
>  #include <linux/kernel.h>	/* For printk/panic/... */
> +#include <linux/kexec.h>	/* For checking if crash kernel is loaded */
>  #include <linux/kthread.h>	/* For kthread_work */
>  #include <linux/miscdevice.h>	/* For handling misc devices */
>  #include <linux/module.h>	/* For module stuff/... */
> @@ -82,6 +83,8 @@ static bool handle_boot_enabled =
>  
>  static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
>  
> +static unsigned int wdt_panic_timeout = CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT;
> +
>  static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
>  {
>  	return ktime_after(ktime_get(), data->open_deadline);
> @@ -658,6 +661,59 @@ static int watchdog_ioctl_op(struct watchdog_device *wdd, unsigned int cmd,
>   *	off the watchdog (if 'nowayout' is not set).
>   */
>  
> +static int watchdog_panic_notifier(struct notifier_block *nb,
> +	unsigned long code, void *data)
> +{
> +	struct watchdog_device *wdd;
> +	int ret = 0;
> +	unsigned int time_out = wdt_panic_timeout;

Please use timeout as variable name.

> +
> +	if (wdt_panic_timeout == 0)
> +		return NOTIFY_DONE;
> +
> +	wdd = container_of(nb, struct watchdog_device, panic_nb);
> +
> +	if (watchdog_timeout_invalid(wdd, wdt_panic_timeout)) {
> +		time_out = min(wdt_panic_timeout, wdd->max_timeout);
> +		pr_err("watchdog%d: timeout extension value "
> +			" invalid. Falling back to %d seconds\n", wdd->id,

String in single line, please.

> +			time_out);
> +	}
> +
> +	if (kexec_crash_image && watchdog_active(wdd)) {
> +		int ping_ret = 0;

Unnecessary assignment.

> +
> +		pr_info("watchdog%d: Extending watchdog timeout to "
> +			"%d seconds\n", wdd->id, time_out);
> +
> +		ret = watchdog_set_timeout(wdd, time_out);
> +
Unnecessary empty line

> +		if (ret) {
> +			pr_err("watchdog%d: Unable to extend watchdog timeout "
> +				"before starting crash kernel (%d)",
> +				wdd->id, ret);
> +		}
> +
> +		/* Many watchdog implementations will reset the timer
> +		* when the timeout is changed, but ping again to be
> +		* safe.
> +		*/

This needs to call __watchdog_ping(). Some watchdog ping functions have
a minimum time between calls of the ping function, and others may not
have a ping function but use the start function instead.

> +		if (wdd->ops->ping) {
> +			ping_ret = wdd->ops->ping(wdd);
> +			if (ping_ret) {
> +				pr_warn("watchdog%d: Unable to ping "
> +					"watchdog before starting "
> +					"crash kernel (%d)\n",
> +					wdd->id, ping_ret);
> +			}
> +		}
> +
> +
Please drop those unnecessary empty lines.

> +	}
> +
> +	return notifier_from_errno(ret);

Are you sure about that ? I don't know the implication when NOTIFY_BAD is returned.

> +}
> +
>  static ssize_t watchdog_write(struct file *file, const char __user *data,
>  						size_t len, loff_t *ppos)
>  {
> @@ -1118,8 +1174,25 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>  		return ret;
>  
>  	ret = watchdog_register_pretimeout(wdd);
> -	if (ret)
> +	if (ret) {
>  		watchdog_cdev_unregister(wdd);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Setting panic_nb priority to minimum ensures the watchdog device
> +	 * panic callback runs last in the chain of kernel panic callbacks.
> +	 * This way, the watchdog device will still fire in the event another
> +	 * panic callback hangs.
> +	 */
> +	wdd->panic_nb.priority = INT_MIN;
> +	wdd->panic_nb.notifier_call = watchdog_panic_notifier;
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list,
> +					&wdd->panic_nb);
> +	if (ret)
> +		pr_err("watchdog%d: Cannot register panic notifier (%d)\n",
> +			wdd->id, ret);

Either make this a warning and ignore the error (return 0),
or this needs a proper cleanup.

>  
>  	return ret;>  }
> @@ -1228,3 +1301,8 @@ module_param(open_timeout, uint, 0644);
>  MODULE_PARM_DESC(open_timeout,
>  	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default="
>  	__MODULE_STRING(CONFIG_WATCHDOG_OPEN_TIMEOUT) ")");
> +
> +module_param(wdt_panic_timeout, uint, 0444);
> +MODULE_PARM_DESC(wdt_panic_timeout,
> +	"Watchdog timeout extension duration upon kernel panic. (default="
> +	__MODULE_STRING(CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT) " seconds)");
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6bb68b5..bc7e6e8aa7ab 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -107,6 +107,7 @@ struct watchdog_device {
>  	unsigned int max_hw_heartbeat_ms;
>  	struct notifier_block reboot_nb;
>  	struct notifier_block restart_nb;
> +	struct notifier_block panic_nb;
>  	void *driver_data;
>  	struct watchdog_core_data *wd_data;
>  	unsigned long status;
> 

