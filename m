Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A22730E982
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Feb 2021 02:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhBDBfv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 20:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhBDBfu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 20:35:50 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FCAC061573
        for <linux-watchdog@vger.kernel.org>; Wed,  3 Feb 2021 17:35:10 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id k25so2047867oik.13
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Feb 2021 17:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9cIqVg3zyDnxwlVTijePB9S7iCINNMB2xvPYD2P8haM=;
        b=cv77Nhjut3WUb//UFRvCg++qyCdjoHQeBFpfwnoOUTxIxMvTHMlG0ZynJ2NqWWn/Vk
         S5azzO52S0E4LhW8mdM+MSDzlkBs1O7AFViv01P+iK4k22fw2JTVuVrwsRtEKulnKarX
         koGAq0HAxIo7M3SDo3nJ0h+x9RLaD8aXkQU2OyTXEjdaiEIXu172aQeF2b4+muLBfT1O
         S2IYKCZ0IxKwiwKLqvLim0Meo3Lq3xjE8/ywp65QWlv391pwm2KGqs/CHiEnkW5E9Qhd
         Mhoihag4w3V0HHZMvvuL3gnCRBX1FSktaQsx1tz0rWOJX9Tm+a2vLjpRdsEeRYqT4nsc
         Q+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9cIqVg3zyDnxwlVTijePB9S7iCINNMB2xvPYD2P8haM=;
        b=qPpRXHxRgGQlyv52w8FdHaRcCzsBMarVH5EfJl72zYMCHRHSib7mBCQGXD9Rj+1IPm
         kEbM0OB65VIkQJOcKfFO+zNPSR8bWaMbYOxDFrW0O0SnxOlRp1E5oBT1uDIaIqmophkl
         2y+poJKICiYnnxLicBRngo5uhGMy2x5iaU9PzX6NMmuYLyfuDSeXz7brQp20ofWg09Oj
         E85a1vidZaGXsMrSg3ya9M6+rGakx7/V84irigkbYt7riV6MHbq1GFXRYaG2O2yE1otV
         kF/s26zggemFOtG3xkFRIeu0CopcsRTCuzStbUJAKZMd2GgvW1mUcTrQyj7F/mqjU+Y6
         QoZQ==
X-Gm-Message-State: AOAM530axPUIdyZgWIBl2OF+AUdZy5ex0FvYvzHwpgvdDSCwND+KntZC
        wpfynnQI0RRhTHDxDwIP5iW9zHSW0AQ=
X-Google-Smtp-Source: ABdhPJxAInMcl793FhZFHdJkYdwHOVi01IVhsNePp7+8Km+sDiRwfsaD3SEXNhGHGHMYRP6QOrpAUw==
X-Received: by 2002:a54:478a:: with SMTP id o10mr3839233oic.100.1612402509281;
        Wed, 03 Feb 2021 17:35:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10sm807619otk.8.2021.02.03.17.35.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 17:35:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 3 Feb 2021 17:35:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Curtis Klein <curtis.klein@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout feature
Message-ID: <20210204013506.GA87215@roeck-us.net>
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Feb 03, 2021 at 12:11:30PM -0800, Curtis Klein wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes from v2
>  - Added required includes to watchdog_core.h
>  - Added watchdog_have_pretimeout function and use throughout
>  - Moved function declarations to watchdog_core.h and made stubs static
> 
> Changes from v1 (watchdog: Add software pretimeout support)
>  - Changed subject for clarity
>  - Renamed KCONFIG to WATCHDOG_HRTIMER_PRETIMEOUT also for clarity
>  - Moved init/start/stop logic to watchdog_hrtimer_pretimeout.c
>  - Moved watchdog_core_data struct to watchdog_core.h so it can be
>     used in watchdog_hrtimer_pretimeout.c and watchdog_core.c
> 
>  drivers/watchdog/Kconfig                       |  8 +++++
>  drivers/watchdog/Makefile                      |  1 +
>  drivers/watchdog/watchdog_core.h               | 48 ++++++++++++++++++++++++++
>  drivers/watchdog/watchdog_dev.c                | 47 +++++++++----------------
>  drivers/watchdog/watchdog_hrtimer_pretimeout.c | 44 +++++++++++++++++++++++
>  drivers/watchdog/watchdog_pretimeout.c         |  5 +--
>  6 files changed, 121 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.c
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
> diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
> index a5062e8..5b35a84 100644
> --- a/drivers/watchdog/watchdog_core.h
> +++ b/drivers/watchdog/watchdog_core.h
> @@ -7,6 +7,8 @@
>   *
>   *	(c) Copyright 2008-2011 Wim Van Sebroeck <wim@iguana.be>.
>   *
> + *	(c) Copyright 2021 Hewlett Packard Enterprise Development LP.
> + *
>   *	This source code is part of the generic code that can be used
>   *	by all the watchdog timer drivers.
>   *
> @@ -22,12 +24,58 @@
>   *	This material is provided "AS-IS" and at no charge.
>   */
>  
> +#include <linux/hrtimer.h>
> +#include <linux/kthread.h>
> +
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
>  extern void watchdog_dev_unregister(struct watchdog_device *);
>  extern int __init watchdog_dev_init(void);
>  extern void __exit watchdog_dev_exit(void);
> +
> +static inline bool watchdog_have_pretimeout(struct watchdog_device *wdd)
> +{
> +	return wdd->info->options & WDIOF_PRETIMEOUT ||
> +	       IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT);
> +}
> +
> +#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
> +void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd);
> +void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd);
> +void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd);
> +#else
> +static inline void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd) {}
> +static inline void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd) {}
> +static inline void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd) {}
> +#endif
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a..3eb3814 100644
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
> @@ -46,30 +47,6 @@
>  #include "watchdog_core.h"
>  #include "watchdog_pretimeout.h"
>  
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
> -
>  /* the dev_t structure to store the dynamically allocated watchdog devices */
>  static dev_t watchdog_devt;
>  /* Reference to watchdog device behind /dev/watchdog */
> @@ -185,6 +162,9 @@ static int __watchdog_ping(struct watchdog_device *wdd)
>  	else
>  		err = wdd->ops->start(wdd); /* restart watchdog */
>  
> +	if (err == 0)
> +		watchdog_hrtimer_pretimeout_start(wdd);
> +
>  	watchdog_update_worker(wdd);
>  
>  	return err;
> @@ -275,8 +255,10 @@ static int watchdog_start(struct watchdog_device *wdd)
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
> @@ -284,6 +266,7 @@ static int watchdog_start(struct watchdog_device *wdd)
>  			wd_data->last_keepalive = started_at;
>  			wd_data->last_hw_keepalive = started_at;
>  			watchdog_update_worker(wdd);
> +			watchdog_hrtimer_pretimeout_start(wdd);
>  		}
>  	}
>  
> @@ -325,6 +308,7 @@ static int watchdog_stop(struct watchdog_device *wdd)
>  	if (err == 0) {
>  		clear_bit(WDOG_ACTIVE, &wdd->status);
>  		watchdog_update_worker(wdd);
> +		watchdog_hrtimer_pretimeout_stop(wdd);
>  	}
>  
>  	return err;
> @@ -361,6 +345,9 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
>  	if (test_and_clear_bit(_WDOG_KEEPALIVE, &wd_data->status))
>  		status |= WDIOF_KEEPALIVEPING;
>  
> +	if (IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
> +		status |= WDIOF_PRETIMEOUT;
> +
>  	return status;
>  }
>  
> @@ -408,7 +395,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>  {
>  	int err = 0;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!watchdog_have_pretimeout(wdd))
>  		return -EOPNOTSUPP;
>  
>  	if (watchdog_pretimeout_invalid(wdd, timeout))
> @@ -594,13 +581,11 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
>  
>  	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
>  		mode = 0;
> -	else if (attr == &dev_attr_pretimeout.attr &&
> -		 !(wdd->info->options & WDIOF_PRETIMEOUT))
> +	else if (attr == &dev_attr_pretimeout.attr && !watchdog_have_pretimeout(wdd))
>  		mode = 0;
>  	else if ((attr == &dev_attr_pretimeout_governor.attr ||
>  		  attr == &dev_attr_pretimeout_available_governors.attr) &&
> -		 (!(wdd->info->options & WDIOF_PRETIMEOUT) ||
> -		  !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
> +		 (!watchdog_have_pretimeout(wdd) || !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
>  		mode = 0;
>  
>  	return mode;
> @@ -1009,6 +994,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  	kthread_init_work(&wd_data->work, watchdog_ping_work);
>  	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
>  	wd_data->timer.function = watchdog_timer_expired;
> +	watchdog_hrtimer_pretimeout_init(wdd);
>  
>  	if (wdd->id == 0) {
>  		old_wd_data = wd_data;
> @@ -1096,6 +1082,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>  
>  	hrtimer_cancel(&wd_data->timer);
>  	kthread_cancel_work_sync(&wd_data->work);
> +	watchdog_hrtimer_pretimeout_stop(wdd);
>  
>  	put_device(&wd_data->dev);
>  }
> diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> new file mode 100644
> index 00000000..940b537
> --- /dev/null
> +++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
> + */
> +
> +#include <linux/hrtimer.h>
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
> diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
> index 01ca84b..4d1c223 100644
> --- a/drivers/watchdog/watchdog_pretimeout.c
> +++ b/drivers/watchdog/watchdog_pretimeout.c
> @@ -9,6 +9,7 @@
>  #include <linux/string.h>
>  #include <linux/watchdog.h>
>  
> +#include "watchdog_core.h"
>  #include "watchdog_pretimeout.h"
>  
>  /* Default watchdog pretimeout governor */
> @@ -177,7 +178,7 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
>  {
>  	struct watchdog_pretimeout *p;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!watchdog_have_pretimeout(wdd))
>  		return 0;
>  
>  	p = kzalloc(sizeof(*p), GFP_KERNEL);
> @@ -197,7 +198,7 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
>  {
>  	struct watchdog_pretimeout *p, *t;
>  
> -	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
> +	if (!watchdog_have_pretimeout(wdd))
>  		return;
>  
>  	spin_lock_irq(&pretimeout_lock);
> -- 
> 2.7.4
> 
