Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E5A4284D4
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Oct 2021 03:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbhJKBsJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 10 Oct 2021 21:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhJKBsH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 10 Oct 2021 21:48:07 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C747DC061570;
        Sun, 10 Oct 2021 18:46:08 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id k2-20020a056830168200b0054e523d242aso10219659otr.6;
        Sun, 10 Oct 2021 18:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HACLZwdhjcmKsKaL3skVTjexZS/nk6K5PaP3br5Yqbs=;
        b=OVfTwDF7oJSs5+vFxLjoprIk842DPu2vJyQfF2mWv/Esc046SL7IkOytKskHlVown0
         biHbluY748JG4nORTZoFV/tTn25PPdWPCCM8M1/p+xE9Gz7XZ5GjEW8yrVHuI8RuzjBe
         E49UOJI318SiTNEWK/VK4lQNhO18qwpmMVfamcwTc8vitgPEvjZ80KtWTXVOWNOdOzLm
         1AmQkoiylFHRxzZlMkbeNORhXUj0TtWDF5vWKvj93tXmvBNZmnJo45e2v8rS8iTvbE35
         OJkzAWZMwQCIM0/j030f0+S6P1APZraRZ8FFic/SehftB4Da6gUfU8IGuCAmsi4bCYUG
         V6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HACLZwdhjcmKsKaL3skVTjexZS/nk6K5PaP3br5Yqbs=;
        b=IXcfAe2kaaReDKJ5gFFb08mlwht3QIilwZXpmmC0lPqFK58DxWm1QXlVC0nQkT4zTJ
         259I7JuLmw9L2aOzedZ6m+6LUafWm0VCMpyh99bB8CIN8d99F355/H+P4z7S8iPgII9/
         CfKE5JGe+6AtBpJEMC6LpU2cRsDe4FwwfR/g3/y7GzUwLSfk3XorpYZvhIBB2NOWNE+q
         EX0McXDMYY1yqOblLWilTVjRYwRJrWLfIwxL/1pvCrn3XwjSRTKUe09IBjJg04vm/soP
         U0EwgCQ3wFX8OWXBYIcsLesXeH10oabkf/issRLzlT4TuLcC3FCasPVsMQnSOB+TpIDn
         QZ1A==
X-Gm-Message-State: AOAM53181uYiYX1CjXHl3/lLnte9m74xXLtBYIqnzwyLqj84OecHNO5U
        e5SqPbmXHquqRzYmUEWWKEw=
X-Google-Smtp-Source: ABdhPJxcXxYcLbVxfz8x7TBFUmJG0eDZztaKdir5GuNYpcwZOG7xULEYf9Noa57veBzCk1bMHLoYbw==
X-Received: by 2002:a05:6830:24b8:: with SMTP id v24mr19452163ots.100.1633916768101;
        Sun, 10 Oct 2021 18:46:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd24sm1456873oib.52.2021.10.10.18.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 18:46:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 10 Oct 2021 18:46:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Curtis Klein <curtis.klein@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] watchdog: Extend watchdog timeout during kernel panic
Message-ID: <20211011014606.GA3781525@roeck-us.net>
References: <1628994598-30907-1-git-send-email-curtis.klein@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628994598-30907-1-git-send-email-curtis.klein@hpe.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Aug 14, 2021 at 07:29:58PM -0700, Curtis Klein wrote:
> From: JP Ertola <jp.ertola@hpe.com>
> 
> If the watchdog timeout is set such that the crash kernel does not
> have time to collect a coredump and the crash kernel is not equipped to
> ping the watchdog timer itself, then a kernel coredump will not be
> collected before the watchdog fires. This change registers a panic
> notifier and callback so the watchdog timeout can be extended if a
> kernel panic occurs. This timeout extension would give the crash kernel
> enough time to collect a coredump before the CPU resets. The watchdog
> timeout is extended if and only if a crash kernel image is loaded in
> memory, the watchdog is active at the time of the panic, and the kconfig
> setting is set.
> 
> A Kconfig option has been added to configure the timeout duration at
> compile-time. Default is zero seconds.
> 
> Signed-off-by: JP Ertola <jp.ertola@hpe.com>
> Co-developed-by: Curtis Klein <curtis.klein@hpe.com>
> Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
> ---
> v6: 
>  - Only register panic notifier if wdt_panic_timeout is set. 
>  - Exit notifier callback early if watchdog is not active and hw is not running
>  - Handle more scenarios where the wdt_panic_timeout is invalid.
>  - Unregister notifier in watchdog_dev_unregister.
>  - Rework notifier callback flow
> 
> v5: Clean up variable names and spacing. Call __watchdog_ping() instead of 
> wdd->ops->ping(). Remove notifier_from_errno() as it could cause unintended
> behavior in the future if this watchdog extension notifier has its priority
> elevated above minimum.
> v4: Remove optional callback mechanism alltogether. I agree with Guenter,
> not widely used.
> v3: Fix logic so timeout extension is not longer than wdd->max_timeout
> v2: Remove dead code and comments.
> 
>  drivers/watchdog/Kconfig        | 13 +++++++
>  drivers/watchdog/watchdog_dev.c | 84 ++++++++++++++++++++++++++++++++++-------
>  include/linux/watchdog.h        |  1 +
>  3 files changed, 84 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 546dfc1..e7c6230 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -149,6 +149,19 @@ comment "Watchdog Device Drivers"
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
> index 3bab324..68e1281 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -29,20 +29,22 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/cdev.h>		/* For character device */
> -#include <linux/errno.h>	/* For the -ENODEV/... values */
> -#include <linux/fs.h>		/* For file operations */
> -#include <linux/init.h>		/* For __init/__exit/... */
> -#include <linux/hrtimer.h>	/* For hrtimers */
> -#include <linux/kernel.h>	/* For printk/panic/... */
> -#include <linux/kthread.h>	/* For kthread_work */
> -#include <linux/miscdevice.h>	/* For handling misc devices */
> -#include <linux/module.h>	/* For module stuff/... */
> -#include <linux/mutex.h>	/* For mutexes */
> -#include <linux/slab.h>		/* For memory functions */
> -#include <linux/types.h>	/* For standard types (like size_t) */
> -#include <linux/watchdog.h>	/* For watchdog specific items */
> -#include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
> +#include <linux/cdev.h>		    /* For character device */
> +#include <linux/errno.h>	    /* For the -ENODEV/... values */
> +#include <linux/fs.h>		    /* For file operations */
> +#include <linux/init.h>		    /* For __init/__exit/... */
> +#include <linux/hrtimer.h>	    /* For hrtimers */
> +#include <linux/kernel.h>	    /* For printk/panic/... */
> +#include <linux/kexec.h>	    /* For checking if crash kernel is loaded */
> +#include <linux/kthread.h>	    /* For kthread_work */
> +#include <linux/miscdevice.h>	    /* For handling misc devices */
> +#include <linux/module.h>	    /* For module stuff/... */
> +#include <linux/mutex.h>	    /* For mutexes */
> +#include <linux/panic_notifier.h>   /* For panic_notifier_list */
> +#include <linux/slab.h>		    /* For memory functions */
> +#include <linux/types.h>	    /* For standard types (like size_t) */
> +#include <linux/watchdog.h>	    /* For watchdog specific items */
> +#include <linux/uaccess.h>	    /* For copy_to_user/put_user/... */

Please drop unrelated changes.

>  
>  #include "watchdog_core.h"
>  #include "watchdog_pretimeout.h"
> @@ -57,6 +59,9 @@ static struct kthread_worker *watchdog_kworker;
>  static bool handle_boot_enabled =
>  	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
>  
> +static unsigned int wdt_panic_timeout =
> +	CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT;
> +
>  static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
>  
>  static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
> @@ -818,6 +823,43 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  	return err;
>  }
>  
> +static int watchdog_panic_notifier(struct notifier_block *nb,
> +	unsigned long code, void *data)
> +{
> +	struct watchdog_device *wdd = container_of(nb, struct watchdog_device, panic_nb);
> +	unsigned int timeout = wdt_panic_timeout;
> +	int set_timeout_ret, ping_ret;
> +
> +	if (wdd == NULL || wdt_panic_timeout == 0 || kexec_crash_image == NULL ||

wdd can not be NULL here.

> +	    !(watchdog_active(wdd) || watchdog_hw_running(wdd)))

!(a || b) --> !a && !b

Please use (!watchdog_active(wdd) && !watchdog_hw_running(wdd))
which is much easier to understand.

> +		return NOTIFY_DONE;
> +
> +	if (wdd->max_hw_heartbeat_ms && wdd->max_hw_heartbeat_ms < wdt_panic_timeout * 1000)
> +		timeout = wdd->max_hw_heartbeat_ms / 1000;

FWIW, this won't help much if max_hw_heartbeat_ms is really low.
It might make sense to list that limitation in the Kconfig
description (the watchdog timeout will never be higher than
the maximum hardware watchdog timeout).

> +	else if (watchdog_timeout_invalid(wdd, wdt_panic_timeout))
> +		timeout = wdd->max_timeout;
> +
> +	if (timeout != wdt_panic_timeout)
> +		pr_err("watchdog%d: Cannot set specified panic timeout, using %ds.\n",
> +			wdd->id, timeout);
> +
> +	set_timeout_ret = watchdog_set_timeout(wdd, timeout);
> +	if (set_timeout_ret)
> +		pr_err("watchdog%d: Failed to extend watchdog timeout (%d)\n",
> +			wdd->id, set_timeout_ret);
> +
> +	ping_ret = watchdog_ping(wdd);
> +	if (ping_ret)
> +		pr_warn("watchdog%d: Failed to ping watchdog (%d)\n",
> +			wdd->id, ping_ret);
> +
> +	if (set_timeout_ret == 0 && ping_ret == 0)

	if (!set_timeout_ret && !ping_ret)

> +		pr_info("watchdog%d: Extended watchdog timeout to %d seconds\n",
> +			wdd->id, timeout);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  /*
>   *	watchdog_open: open the /dev/watchdog* devices.
>   *	@inode: inode of device
> @@ -1129,6 +1171,17 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>  	if (ret)
>  		watchdog_cdev_unregister(wdd);
>  
> +	if (wdt_panic_timeout) {
> +		wdd->panic_nb.priority = INT_MIN; /* Run last */
> +		wdd->panic_nb.notifier_call = watchdog_panic_notifier;
> +
> +		ret = atomic_notifier_chain_register(&panic_notifier_list,
> +						     &wdd->panic_nb);
> +		if (ret)
> +			pr_warn("watchdog%d: Cannot register panic notifier (%d)\n",
> +				wdd->id, ret);

ret is returned to the caller, and thus the calling code will fail
and assume that watchdog registration failed. That happens without cleanup.
Specifically, the watchdog character device will still exist after the error.
If this is considered fatal, please make it pr_error and handle cleanup
as necessary. I am not convinced that it is fatal, though, so please
also provide justification.

> +	}
> +
>  	return ret;
>  }
>  
> @@ -1142,6 +1195,9 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>  
>  void watchdog_dev_unregister(struct watchdog_device *wdd)
>  {
> +	if (wdt_panic_timeout)
> +		atomic_notifier_chain_unregister(&panic_notifier_list, &wdd->panic_nb);
> +
>  	watchdog_unregister_pretimeout(wdd);
>  	watchdog_cdev_unregister(wdd);
>  }
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6b..bc7e6e8 100644
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
