Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D82B30B4CF
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Feb 2021 02:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhBBBqq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Feb 2021 20:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhBBBqq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Feb 2021 20:46:46 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C14C061573
        for <linux-watchdog@vger.kernel.org>; Mon,  1 Feb 2021 17:46:05 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id x71so21075628oia.9
        for <linux-watchdog@vger.kernel.org>; Mon, 01 Feb 2021 17:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AXDdvy3VUjhMJ4SyZfOisvztVa/PUaW4xZEdQpSXCVY=;
        b=kOP/VniXwO3hV0XNBuTpGSyV72YqGR70yOxgvcG0ECrMV8k+T5vY/0QuuGJGcxhKcG
         EEYMAAi0T1CcfxG+fMdfoVJeT9ffq2CMzP5Nri8Vks7oYZNXt83kqsbkAfTtKxkjfUQA
         qsY0WUmH/yvA5qmJ8mbgSyPB0ZE3ZvG4dhAH0eiIkp+fhF1uIPsGIANChTi6uC+yyS1H
         yAThDuMvZCi1ZRzkG/lRNtcr1X5w/hwFgyfI9bPiKeTj3kQ/hDEfDPoT/e0Fo6FZndSp
         ANLSqS4ZWzWu3rgBSI5tehiAoa4OeOqma90G9BpihzxbqEx9ai7pgVXIauVddHjUOOfr
         Z9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AXDdvy3VUjhMJ4SyZfOisvztVa/PUaW4xZEdQpSXCVY=;
        b=L3cMvnwwlcWNXUw+WHjTO4LMZ9WAtsw+aZZgeDECIX8mc4rK8BWpyCNScbH9ym0xtt
         MjWVkUik91wntesCZizYFdCGHY37Q5go74roakENczvzDb31suAyJR37LfE0odzG4iq2
         4ocwZq9NLasIY2QQqB+bnzlJRVW2VAYkS3wDRtr175kekq1npwEiyccYGThF1PGGe8T1
         YNaBHagcxlT6luhF2zFc6awKIRRz9QBFKluYQ0gUtTkO/uKjHQU3TyO5ELNFHGtQmEcD
         tV6xVpu1sA4QDUNL67j0tb0doodMnc6knTiqiVf6nRwNSeMHDZt+aUarjgVOAohgecCe
         3m0Q==
X-Gm-Message-State: AOAM531GJLI02ANTDwNNpQvKUaD7RL957BoIjcsle/if2/4IV2wDc9EG
        ZFV1adEcMsRpw+3twJDXegH9eRnloOc=
X-Google-Smtp-Source: ABdhPJyApHA7oCQWw4X+pBrEVO7g1YqkG+j4N0eoGKO+y7CQlYq6L8m+mK0zFgV2ueAjFqTSqnFBFg==
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr1134557oib.153.1612230364647;
        Mon, 01 Feb 2021 17:46:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f7sm4669928oop.9.2021.02.01.17.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 17:46:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: Add hrtimer-based pretimeout feature
To:     Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1612226364-30951-1-git-send-email-curtis.klein@hpe.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <918a83f4-fe08-e32c-6e97-26ca2dfa38cb@roeck-us.net>
Date:   Mon, 1 Feb 2021 17:46:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612226364-30951-1-git-send-email-curtis.klein@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/1/21 4:39 PM, Curtis Klein wrote:
> This adds the option to use a hrtimer to generate a watchdog pretimeout
> event for hardware watchdogs that do not natively support watchdog
> pretimeouts.
> 
> With this enabled, all watchdogs will appear to have pretimeout support
> in userspace. If no pretimeout value is set, there will be no change in
> the watchdog's behavior. If a pretimeout value is set for a specific
> watchdog that does not have built-in pretimeout support, a timer will be
> started that should fire at the specified time before the watchdog
> timeout would occur. When the watchdog is successfully pinged, the timer
> will be restarted. If the timer is allowed to fire it will generate a
> pretimeout event. However because a software timer is used, it may not
> be able to fire in every circumstance.
> 
> If the watchdog does support a pretimeout natively, that functionality
> will be used instead of the hrtimer.
> 
> The general design of this feaure was inspired by the software watchdog,
> specifically its own pretimeout implementation. However the software
> watchdog and this feature are completely independent. They can be used
> together; with or without CONFIG_SOFT_WATCHDOG_PRETIMEOUT enabled.
> 
> The main advantage of using the hrtimer pretimeout with a hardware
> watchdog, compared to running the software watchdog with a hardware
> watchdog, is that if the hardware watchdog driver is unable to ping the
> watchdog (e.g. due to a bus or communication error), then the hrtimer
> pretimeout would still fire whereas the software watchdog would not.
> 
> Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
> ---
> Changes from v1 (watchdog: Add software pretimeout support)
>  - Changed subject for clarity
>  - Renamed KCONFIG to WATCHDOG_HRTIMER_PRETIMEOUT also for clarity
>  - Moved init/start/stop logic to watchdog_hrtimer_pretimeout.c
>  - Moved watchdog_core_data struct to watchdog_core.h so it can be
>     used in watchdog_hrtimer_pretimeout.c and watchdog_core.c
> 
>  drivers/watchdog/Kconfig                       |  8 ++++
>  drivers/watchdog/Makefile                      |  1 +
>  drivers/watchdog/watchdog_core.c               |  2 +
>  drivers/watchdog/watchdog_core.h               | 27 ++++++++++++++
>  drivers/watchdog/watchdog_dev.c                | 51 +++++++++++---------------
>  drivers/watchdog/watchdog_hrtimer_pretimeout.c | 45 +++++++++++++++++++++++
>  drivers/watchdog/watchdog_hrtimer_pretimeout.h | 19 ++++++++++
>  drivers/watchdog/watchdog_pretimeout.c         |  6 ++-
>  8 files changed, 128 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.c
>  create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.h
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ff941e..a5f0ca8 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -73,6 +73,14 @@ config WATCHDOG_SYSFS
>  	  Say Y here if you want to enable watchdog device status read through
>  	  sysfs attributes.
>  
> +config WATCHDOG_HRTIMER_PRETIMEOUT
> +	bool "Enable watchdog hrtimer-based pretimeouts"
> +	help
> +	  Enable this if you want to use a hrtimer timer based pretimeout for
> +	  watchdogs that do not natively support pretimeout support. Be aware
> +	  that because this pretimeout functionality uses hrtimers, it may not
> +	  be able to fire before the actual watchdog fires in some situations.
> +
>  comment "Watchdog Pretimeout Governors"
>  
>  config WATCHDOG_PRETIMEOUT_GOV
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 5c74ee1..6fecaab 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_WATCHDOG_CORE)	+= watchdog.o
>  watchdog-objs	+= watchdog_core.o watchdog_dev.o
>  
>  watchdog-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV)	+= watchdog_pretimeout.o
> +watchdog-$(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)	+= watchdog_hrtimer_pretimeout.o
>  
>  obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP)	+= pretimeout_noop.o
>  obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC)	+= pretimeout_panic.o
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 0e9a995..1449bf124 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -27,7 +27,9 @@
>  #include <linux/module.h>	/* For EXPORT_SYMBOL/module stuff/... */
>  #include <linux/types.h>	/* For standard types */
>  #include <linux/errno.h>	/* For the -ENODEV/... values */
> +#include <linux/hrtimer.h>	/* For hrtimers */
>  #include <linux/kernel.h>	/* For printk/panic/... */
> +#include <linux/kthread.h>	/* For kthread_work */

The additional include files should be included where needed, in watchdog_core.h
and/or in watchdog_hrtimer_pretimeout.c. I don't think they are needed here.

>  #include <linux/reboot.h>	/* For restart handler */
>  #include <linux/watchdog.h>	/* For watchdog specific items */
>  #include <linux/init.h>		/* For __init/__exit/... */
> diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
> index a5062e8..323600a 100644
> --- a/drivers/watchdog/watchdog_core.h
> +++ b/drivers/watchdog/watchdog_core.h
> @@ -25,6 +25,33 @@
>  #define MAX_DOGS	32	/* Maximum number of watchdog devices */
>  
>  /*
> + * struct watchdog_core_data - watchdog core internal data
> + * @dev:	The watchdog's internal device
> + * @cdev:	The watchdog's Character device.
> + * @wdd:	Pointer to watchdog device.
> + * @lock:	Lock for watchdog core.
> + * @status:	Watchdog core internal status bits.
> + */
> +struct watchdog_core_data {
> +	struct device dev;
> +	struct cdev cdev;
> +	struct watchdog_device *wdd;
> +	struct mutex lock;
> +	ktime_t last_keepalive;
> +	ktime_t last_hw_keepalive;
> +	ktime_t open_deadline;
> +	struct hrtimer timer;
> +	struct kthread_work work;
> +#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
> +	struct hrtimer pretimeout_timer;
> +#endif
> +	unsigned long status;		/* Internal status bits */
> +#define _WDOG_DEV_OPEN		0	/* Opened ? */
> +#define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
> +#define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
> +};
> +
> +/*
>   *	Functions/procedures to be called by the core
>   */
>  extern int watchdog_dev_register(struct watchdog_device *);
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a..2a2e8d8 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -7,6 +7,7 @@
>   *
>   *	(c) Copyright 2008-2011 Wim Van Sebroeck <wim@iguana.be>.
>   *
> + *	(c) Copyright 2021 Hewlett Packard Enterprise Development LP.
>   *
>   *	This source code is part of the generic code that can be used
>   *	by all the watchdog timer drivers.
> @@ -45,30 +46,7 @@
>  
>  #include "watchdog_core.h"
>  #include "watchdog_pretimeout.h"
> -
> -/*
> - * struct watchdog_core_data - watchdog core internal data
> - * @dev:	The watchdog's internal device
> - * @cdev:	The watchdog's Character device.
> - * @wdd:	Pointer to watchdog device.
> - * @lock:	Lock for watchdog core.
> - * @status:	Watchdog core internal status bits.
> - */
> -struct watchdog_core_data {
> -	struct device dev;
> -	struct cdev cdev;
> -	struct watchdog_device *wdd;
> -	struct mutex lock;
> -	ktime_t last_keepalive;
> -	ktime_t last_hw_keepalive;
> -	ktime_t open_deadline;
> -	struct hrtimer timer;
> -	struct kthread_work work;
> -	unsigned long status;		/* Internal status bits */
> -#define _WDOG_DEV_OPEN		0	/* Opened ? */
> -#define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
> -#define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
> -};
> +#include "watchdog_hrtimer_pretimeout.h"
>  
>  /* the dev_t structure to store the dynamically allocated watchdog devices */
>  static dev_t watchdog_devt;
> @@ -185,6 +163,9 @@ static int __watchdog_ping(struct watchdog_device *wdd)
>  	else
>  		err = wdd->ops->start(wdd); /* restart watchdog */
>  
> +	if (err == 0)
> +		watchdog_hrtimer_pretimeout_start(wdd);
> +
>  	watchdog_update_worker(wdd);
>  
>  	return err;
> @@ -275,8 +256,10 @@ static int watchdog_start(struct watchdog_device *wdd)
>  	started_at = ktime_get();
>  	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
>  		err = __watchdog_ping(wdd);
> -		if (err == 0)
> +		if (err == 0) {
>  			set_bit(WDOG_ACTIVE, &wdd->status);
> +			watchdog_hrtimer_pretimeout_start(wdd);
> +		}
>  	} else {
>  		err = wdd->ops->start(wdd);
>  		if (err == 0) {
> @@ -284,6 +267,7 @@ static int watchdog_start(struct watchdog_device *wdd)
>  			wd_data->last_keepalive = started_at;
>  			wd_data->last_hw_keepalive = started_at;
>  			watchdog_update_worker(wdd);
> +			watchdog_hrtimer_pretimeout_start(wdd);
>  		}
>  	}
>  
> @@ -325,6 +309,7 @@ static int watchdog_stop(struct watchdog_device *wdd)
>  	if (err == 0) {
>  		clear_bit(WDOG_ACTIVE, &wdd->status);
>  		watchdog_update_worker(wdd);
> +		watchdog_hrtimer_pretimeout_stop(wdd);
>  	}
>  
>  	return err;
> @@ -361,6 +346,9 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
>  	if (test_and_clear_bit(_WDOG_KEEPALIVE, &wd_data->status))
>  		status |= WDIOF_KEEPALIVEPING;
>  
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
> +		status |= WDIOF_PRETIMEOUT;
> +
>  	return status;
>  }
>  
> @@ -408,7 +396,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>  {
>  	int err = 0;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))

Please add something like

static inline bool watchdog_have_pretimeout(struct watchdog_device *wdd)
{
	return wdd->info->options & WDIOF_PRETIMEOUT || IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT);
}

to watchdog_core.h and use it where appropriate.

>  		return -EOPNOTSUPP;
>  
>  	if (watchdog_pretimeout_invalid(wdd, timeout))
> @@ -595,12 +584,14 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
>  	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
>  		mode = 0;
>  	else if (attr == &dev_attr_pretimeout.attr &&
> -		 !(wdd->info->options & WDIOF_PRETIMEOUT))
> +		 !(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +		 !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
>  		mode = 0;
>  	else if ((attr == &dev_attr_pretimeout_governor.attr ||
>  		  attr == &dev_attr_pretimeout_available_governors.attr) &&
> -		 (!(wdd->info->options & WDIOF_PRETIMEOUT) ||
> -		  !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
> +		 ((!(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +		   !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)) ||
> +		   !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
>  		mode = 0;
>  
>  	return mode;
> @@ -1009,6 +1000,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  	kthread_init_work(&wd_data->work, watchdog_ping_work);
>  	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
>  	wd_data->timer.function = watchdog_timer_expired;
> +	watchdog_hrtimer_pretimeout_init(wdd);
>  
>  	if (wdd->id == 0) {
>  		old_wd_data = wd_data;
> @@ -1096,6 +1088,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>  
>  	hrtimer_cancel(&wd_data->timer);
>  	kthread_cancel_work_sync(&wd_data->work);
> +	watchdog_hrtimer_pretimeout_stop(wdd);
>  
>  	put_device(&wd_data->dev);
>  }
> diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> new file mode 100644
> index 00000000..a26a18c
> --- /dev/null
> +++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
> + */
> +
> +#include <linux/hrtimer.h>
> +#include <linux/kthread.h>
> +#include <linux/watchdog.h>
> +
> +#include "watchdog_core.h"
> +#include "watchdog_pretimeout.h"
> +
> +static enum hrtimer_restart watchdog_hrtimer_pretimeout(struct hrtimer *timer)
> +{
> +	struct watchdog_core_data *wd_data;
> +
> +	wd_data = container_of(timer, struct watchdog_core_data, pretimeout_timer);
> +
> +	watchdog_notify_pretimeout(wd_data->wdd);
> +	return HRTIMER_NORESTART;
> +}
> +
> +void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +
> +	hrtimer_init(&wd_data->pretimeout_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	wd_data->pretimeout_timer.function = watchdog_hrtimer_pretimeout;
> +}
> +
> +void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd)
> +{
> +	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +	    !watchdog_pretimeout_invalid(wdd, wdd->pretimeout))
> +		hrtimer_start(&wdd->wd_data->pretimeout_timer,
> +			      ktime_set(wdd->timeout - wdd->pretimeout, 0),
> +			      HRTIMER_MODE_REL);
> +	else
> +		hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
> +}
> +
> +void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd)
> +{
> +	hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
> +}
> diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.h b/drivers/watchdog/watchdog_hrtimer_pretimeout.h
> new file mode 100644
> index 00000000..ad136b2
> --- /dev/null
> +++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
> + */
> +
> +#ifndef __WATCHDOG_HRTIMER_PRETIMEOUT_H
> +#define __WATCHDOG_HRTIMER_PRETIMEOUT_H
> +
> +#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
> +void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd);
> +void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd);
> +void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd);
> +#else
> +static void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd) {}
> +static void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd) {}
> +static void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd) {}
> +#endif
> +

I don't think a separate include file is warranted here. Just add the above
function declarations to watchdog_core.h. CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT
is already used there anyway.

Thanks,
Guenter

> +#endif
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 01ca84b..5629198 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -177,7 +177,8 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
>  {
>  	struct watchdog_pretimeout *p;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
>  		return 0;
>  
>  	p = kzalloc(sizeof(*p), GFP_KERNEL);
> @@ -197,7 +198,8 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
>  {
>  	struct watchdog_pretimeout *p, *t;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
> +	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
>  		return;
>  
>  	spin_lock_irq(&pretimeout_lock);
> 

