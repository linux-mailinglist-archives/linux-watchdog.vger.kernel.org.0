Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9F306ACB
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Jan 2021 02:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhA1Bzv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Jan 2021 20:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhA1Bzf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Jan 2021 20:55:35 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54894C061574
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Jan 2021 17:54:37 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id k8so3736126otr.8
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Jan 2021 17:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BO5lce6vJ5rfT5YdrGEk6fgIyMZwwKP4Vg0EHSClBg4=;
        b=FCIsV0/s0m8qyZhTh7oqZEHwoP/3WneXiCpCOHh8Zz+ChnxcnyimH1I2l1g4bExkjT
         4HTl0OhA6Suv3xAw8y+cuyM0C9Dc0oqjNA9WnbjwjK4UYLlp6DklXOoqzT4SMcmkx/U3
         B5XNgUJGTNmXplhwt3bYygyYmmbhyp2mLJg+7oEqXhqdnS3Ckb1gHk9fTStCIv4nWM/p
         ifg64IB6vpVgXjtUwkt+5XL5X44oGColmq6Fgmo9JjoXMbvFjwD8PhaHnNT90dEHzfNq
         qiplGt8pgcPcSc87SLLBzQrep6r9AlZMdW9EgAaHVHjILXisbz88PF/Y+SxVDOTyaNLq
         BtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BO5lce6vJ5rfT5YdrGEk6fgIyMZwwKP4Vg0EHSClBg4=;
        b=FSnyPQLvt+G9qtasqHdoUsCii9kSezRXh408ZxjT3lHwjaYdX7EDW8likqbpejb+Ac
         aP1xlXHx1661SabkBgCgJzBBW9Y6ykNM3L2D0zMQsB9QVGElmjCtsbnGodv48J2fBelU
         IQp267AmT0DmXjpAKRmhGbsXRaMYHa8cMn1SK3z08Fmb8S4+avIXyY8y2dqdw5yCw7CA
         VrnFD3ORYYSZQsGZgrgsJ3a0VoYO2RVkPkk8OuNnerhw8kZA0EdJ4nZCKevpIMmc9FYi
         ihJv1FneDWrwHlpyowoxJV84OCW1JMf5ru8NDdtPKulCXnPceghTD+xhfY+WYTF7VmUG
         iNxw==
X-Gm-Message-State: AOAM53002Nml9493T8nHViUCuABNbccYVgWy7OF5Gr4aAWidx43oVUdB
        gu7u2Kula0yVQr9etC1Ce0Obf2ozgIc=
X-Google-Smtp-Source: ABdhPJw0SkS/hSWk0E9CgBSdEHNOf71xALvjbIF8fkLCrj/mVvl7rrSqE6t+KuyO4QmLWKwy0qGk0Q==
X-Received: by 2002:a9d:1d04:: with SMTP id m4mr9380223otm.142.1611798876259;
        Wed, 27 Jan 2021 17:54:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d17sm726770otk.3.2021.01.27.17.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 17:54:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] Extend watchdog timeout during kernel panic.
To:     JP Ertola <jp.ertola@hpe.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
References: <20210128011425.8933-1-jp.ertola@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <76758c28-430d-7062-6ef8-73fc446ca6ca@roeck-us.net>
Date:   Wed, 27 Jan 2021 17:54:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128011425.8933-1-jp.ertola@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/27/21 5:14 PM, JP Ertola wrote:
> If the watchdog timeout is set such that the crash kernel does not
> have time to collect a coredump and the crash kernel is not equipped to
> ping the watchdog timer itself, then a kernel coredump will not be collected
> before the watchdog fires. This change registers a panic notifier and
> callback so the watchdog timeout can be extended if a kernel panic occurs.
> This timeout extension would give the crash kernel enough time to collect
> a coredump before the CPU resets. The watchdog timeout is extended if and only
> if a crash kernel image is loaded in memory and the watchdog is active at the
> time of the panic.
> 
> Drivers have the option of implementing their own platform-dependent (PD)
> callback at the same time they register their watchdog device (wdd) with the
> Linux kernel. By registering their own PD callback, the watchdog device
> can extend the watchdog timeout and perform other tasks in a panic context.
> 
> This may be desireable when uncommon hardware platforms are used. For
> example, a power management subsystem controlled by an FPGA attached to
> the CPU.

This is only acceptable if there is an actual user for this callback.
I won't accept adding such a callback without a user. If you have one
in mind, please submit the patch adding it as part of a series.
That will let us evaluate if the callback is really needed and
what it is used for. Otherwise, please drop the callback.

> 
> A Kconfig option has been added to configure the timeout duration at
> compile-time. Default is zero seconds.
> 
> Signed-off-by: JP Ertola <jp.ertola@hpe.com>
> ---

Change log goes here, and I am not going back to v2 and v1 to try to figure
out what changed.

Guenter

>  drivers/watchdog/Kconfig        | 13 +++++
>  drivers/watchdog/watchdog_dev.c | 84 ++++++++++++++++++++++++++++++++-
>  include/linux/watchdog.h        |  3 ++
>  3 files changed, 99 insertions(+), 1 deletion(-)
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
> index 2946f3a63110..e2d056c70ca7 100644
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
> @@ -658,6 +661,61 @@ static int watchdog_ioctl_op(struct watchdog_device *wdd, unsigned int cmd,
>   *	off the watchdog (if 'nowayout' is not set).
>   */
>  
> +static int watchdog_panic_notifier(struct notifier_block *nb,
> +	unsigned long code, void *data)
> +{
> +	struct watchdog_device *wdd;
> +	int ret = 0;
> +	unsigned int time_out = 0; // seconds
> +
> +	if (wdt_panic_timeout == 0)
> +		return NOTIFY_DONE;
> +
> +	if (watchdog_timeout_invalid(wdt_panic_timeout)) {
> +		time_out = min(wdt_panic_timeout, wdd->max_timeout);
> +		pr_err("watchdog%d: timeout extension value "
> +			" invalid. Falling back to %d seconds\n", time_out);
> +	} else {
> +		time_out = wdt_panic_timeout;
> +	}
> +
> +	wdd = container_of(nb, struct watchdog_device, panic_nb);
> +
> +	if (kexec_crash_image && watchdog_active(wdd)) {
> +		if (wdd->ops->panic_cb) {
> +			ret = wdd->ops->panic_cb(wdd, time_out);
> +		} else {
> +			int ping_ret;
> +
> +			pr_info("watchdog%d: Extending watchdog timeout to "
> +				"%d seconds\n", wdd->id, time_out);
> +
> +			ret = watchdog_set_timeout(wdd, time_out);
> +
> +			/* Many watchdog implementations will reset the timer
> +			 * when the timeout is changed, but ping again to be
> +			 * safe.
> +			 */
> +			if (wdd->ops->ping) {
> +				ping_ret = wdd->ops->ping(wdd);
> +				if (ping_ret) {
> +					pr_warn("watchdog%d: Unable to ping "
> +						"watchdog before starting "
> +						"crash kernel (%d)\n",
> +						wdd->id, ping_ret);
> +				}
> +			}
> +		}
> +		if (ret) {
> +			pr_err("watchdog%d: Unable to extend watchdog timeout "
> +				"before starting crash kernel (%d)",
> +				wdd->id, ret);
> +		}
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
>  static ssize_t watchdog_write(struct file *file, const char __user *data,
>  						size_t len, loff_t *ppos)
>  {
> @@ -1118,8 +1176,27 @@ int watchdog_dev_register(struct watchdog_device *wdd)
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
> +	 * This way, the watchdog device will fire in the event another
> +	 * panic callback hangs.
> +	 */
> +	if (wdd->ops->panic_cb) {
> +		wdd->panic_nb.priority = INT_MIN;
> +		wdd->panic_nb.notifier_call = watchdog_panic_notifier;
> +
> +		ret = atomic_notifier_chain_register(&panic_notifier_list,
> +						&wdd->panic_nb);
> +		if (ret)
> +			pr_err("watchdog%d: Cannot register panic notifier (%d)\n",
> +				wdd->id, ret);
> +	}
>  
>  	return ret;
>  }
> @@ -1228,3 +1305,8 @@ module_param(open_timeout, uint, 0644);
>  MODULE_PARM_DESC(open_timeout,
>  	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default="
>  	__MODULE_STRING(CONFIG_WATCHDOG_OPEN_TIMEOUT) ")");
> +
> +module_param(wdt_panic_timeout, uint, 0444);
> +MODULE_PARM_DESC(wdt_panic_timeout,
> +	"Watchdog timeout extension duration upon kernel panic. (default="
> +	__MODULE_STRING(CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT) " seconds)");
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6bb68b5..f79f41cca156 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -34,6 +34,7 @@ struct watchdog_governor;
>   * @get_timeleft:The routine that gets the time left before a reset (in seconds).
>   * @restart:	The routine for restarting the machine.
>   * @ioctl:	The routines that handles extra ioctl calls.
> + * @panic_cb:	The routine that extends the watchdog timeout before the crash kernel starts.
>   *
>   * The watchdog_ops structure contains a list of low-level operations
>   * that control a watchdog device. It also contains the module that owns
> @@ -53,6 +54,7 @@ struct watchdog_ops {
>  	unsigned int (*get_timeleft)(struct watchdog_device *);
>  	int (*restart)(struct watchdog_device *, unsigned long, void *);
>  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
> +	int (*panic_cb)(struct watchdog_device *, unsigned int);
>  };
>  
>  /** struct watchdog_device - The structure that defines a watchdog device
> @@ -107,6 +109,7 @@ struct watchdog_device {
>  	unsigned int max_hw_heartbeat_ms;
>  	struct notifier_block reboot_nb;
>  	struct notifier_block restart_nb;
> +	struct notifier_block panic_nb;
>  	void *driver_data;
>  	struct watchdog_core_data *wd_data;
>  	unsigned long status;
> 

