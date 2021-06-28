Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631763B5F8C
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Jun 2021 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhF1OGh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Jun 2021 10:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbhF1OGh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Jun 2021 10:06:37 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F34C061574;
        Mon, 28 Jun 2021 07:04:11 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 11so13953054oid.3;
        Mon, 28 Jun 2021 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1hFi8OyA9X6vxnevIV+mFoM6lcxDIwqUcWVyNr9kXMA=;
        b=K10vuTFWpaPCpNh4EKJxeRBfj+k3DF/3R87d3SI/nIPdwgN0MnTLBsAsCqw3E1V/cc
         f2M8gZiQCqle3VNiGio7GUMfiIewX+CnNbxC3ctjrs/4TEqD7nJYN5Qro/FwSrbmn2d1
         mXwmdhvjF9+ycJZ3YyMKiZUOZawWgxsonHRcn6ELlC7vIyKFnLfnU/2hiQff3yIdrEH8
         +yFGWdTOiK0isYvbARaXNVVzpLQlMPE+/OiGRjBK1ymralhSLlodlflpBgUCGv9vX+JQ
         fd6pciHmt76oSPpDcQGnOdUGne1rtHf3WhzbiUWyiKE6RqnT7Y/JYINaZRqQK+e/PLqq
         GvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1hFi8OyA9X6vxnevIV+mFoM6lcxDIwqUcWVyNr9kXMA=;
        b=AxrBoIfGwBCTxqWXpr92ClK5f4YjLu847Q59Tf569jVcY4btNPFH5G7b4SjMctoTOI
         DWTmfpK547ucSl0RxZ7kjHTG+8EJaHga5qOnbiqfwSbfRfDTOjfHYjPlu0ITgXy00pin
         SiXKYSJQzHA/ED4GEBKzaC5rFAbztPs6JBVIdRL8npAA9UvznnzBYBAq4ttZwe+FzAMG
         HchzqyGSIjRMAfe2/BeYlqyghZqFRGAbZ2bn1wGC7Q+KymrqQOAIbZ8lVhkkJVS8gMSF
         X2KYwhTRtN9l7K21mTLLIxmlynQgqPD4uaC3TVRi7nwzzBoK8tzv8eBqRaCox+zPshFQ
         Jogw==
X-Gm-Message-State: AOAM531zBpJ3FQM9EzNFzJrb6Ca6oGM3iaBH+UtHssJEI0sFwwpVprTS
        muAvpjowR8R5BPksDSLLINA=
X-Google-Smtp-Source: ABdhPJzyzCYyZUeAIeITUFRqizgvHVNyTbh0aleC4B/oJ46g9lEqHPSTuUBg9jqY/GwbIXAlRe7OgQ==
X-Received: by 2002:aca:6741:: with SMTP id b1mr2354377oiy.112.1624889049065;
        Mon, 28 Jun 2021 07:04:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r14sm3128926oie.43.2021.06.28.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 07:04:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 07:04:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] watchdog: introduce watchdog_dev_suspend/resume
Message-ID: <20210628140407.GA426602@roeck-us.net>
References: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
 <20210618195033.3209598-2-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195033.3209598-2-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 18, 2021 at 09:50:32PM +0200, Grzegorz Jaszczyk wrote:
> The watchdog drivers often disable wdog clock during suspend and then
> enable it again during resume. Nevertheless the ping worker is still
> running and can issue low-level ping while the wdog clock is disabled
> causing the system hang. To prevent such condition register pm notifier
> in the watchdog core which will call watchdog_dev_suspend/resume and
> actually cancel ping worker during suspend and restore it back, if
> needed, during resume.
> 
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1->v2:
> - Instead of using watchdog_dev_suspend/resume directly in wdog drivers
> suspend/resume callbacks, register pm notifier in the watchdog core when
> new WDOG_NO_PING_ON_SUSPEND status flag is set by the driver. Suggested
> by Guenter Roeck <linux@roeck-us.net>.
> - Initialize ret variable in watchdog_dev_suspend/resume.
> - Drop EXPORT_SYMBOL_GPL for watchdog_dev_suspend/resume since from now
> one they are used only by the watchdog core and not by the drivers.
> - Commit log was updated accordingly.
> ---
>  drivers/watchdog/watchdog_core.c | 37 +++++++++++++++++++++++++
>  drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++++++++
>  include/linux/watchdog.h         | 10 +++++++
>  3 files changed, 94 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 5df0a22e2cb4..3fe8a7edc252 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -34,6 +34,7 @@
>  #include <linux/idr.h>		/* For ida_* macros */
>  #include <linux/err.h>		/* For IS_ERR macros */
>  #include <linux/of.h>		/* For of_get_timeout_sec */
> +#include <linux/suspend.h>
>  
>  #include "watchdog_core.h"	/* For watchdog_dev_register/... */
>  
> @@ -185,6 +186,33 @@ static int watchdog_restart_notifier(struct notifier_block *nb,
>  	return NOTIFY_DONE;
>  }
>  
> +static int watchdog_pm_notifier(struct notifier_block *nb, unsigned long mode,
> +				void *data)
> +{
> +	struct watchdog_device *wdd;
> +	int ret = 0;
> +
> +	wdd = container_of(nb, struct watchdog_device, pm_nb);
> +
> +	switch (mode) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +		ret = watchdog_dev_suspend(wdd);
> +		break;
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +	case PM_POST_SUSPEND:
> +		ret = watchdog_dev_resume(wdd);
> +		break;
> +	}
> +
> +	if (ret)
> +		return NOTIFY_BAD;
> +
> +	return NOTIFY_DONE;
> +}
> +
>  /**
>   * watchdog_set_restart_priority - Change priority of restart handler
>   * @wdd: watchdog device
> @@ -292,6 +320,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  				wdd->id, ret);
>  	}
>  
> +	if (test_bit(WDOG_NO_PING_ON_SUSPEND, &wdd->status)) {
> +		wdd->pm_nb.notifier_call = watchdog_pm_notifier;
> +
> +		ret = register_pm_notifier(&wdd->pm_nb);
> +		if (ret)
> +			pr_warn("watchdog%d: Cannot register pm handler (%d)\n",
> +				wdd->id, ret);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..9d1c340a3024 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1219,6 +1219,53 @@ void __exit watchdog_dev_exit(void)
>  	kthread_destroy_worker(watchdog_kworker);
>  }
>  
> +int watchdog_dev_suspend(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +	int ret = 0;
> +
> +	if (!wdd->wd_data)
> +		return -ENODEV;
> +
> +	/* ping for the last time before suspend */
> +	mutex_lock(&wd_data->lock);
> +	if (watchdog_worker_should_ping(wd_data))
> +		ret = __watchdog_ping(wd_data->wdd);
> +	mutex_unlock(&wd_data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * make sure that watchdog worker will not kick in when the wdog is
> +	 * suspended
> +	 */
> +	hrtimer_cancel(&wd_data->timer);
> +	kthread_cancel_work_sync(&wd_data->work);
> +
> +	return 0;
> +}
> +
> +int watchdog_dev_resume(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +	int ret = 0;
> +
> +	if (!wdd->wd_data)
> +		return -ENODEV;
> +
> +	/*
> +	 * __watchdog_ping will also retrigger hrtimer and therefore restore the
> +	 * ping worker if needed.
> +	 */
> +	mutex_lock(&wd_data->lock);
> +	if (watchdog_worker_should_ping(wd_data))
> +		ret = __watchdog_ping(wd_data->wdd);
> +	mutex_unlock(&wd_data->lock);
> +
> +	return ret;
> +}
> +
>  module_param(handle_boot_enabled, bool, 0444);
>  MODULE_PARM_DESC(handle_boot_enabled,
>  	"Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6bb68b5..99660197a36c 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -107,6 +107,7 @@ struct watchdog_device {
>  	unsigned int max_hw_heartbeat_ms;
>  	struct notifier_block reboot_nb;
>  	struct notifier_block restart_nb;
> +	struct notifier_block pm_nb;
>  	void *driver_data;
>  	struct watchdog_core_data *wd_data;
>  	unsigned long status;
> @@ -116,6 +117,7 @@ struct watchdog_device {
>  #define WDOG_STOP_ON_REBOOT	2	/* Should be stopped on reboot */
>  #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
>  #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
> +#define WDOG_NO_PING_ON_SUSPEND	5	/* Ping worker should be stopped on suspend */
>  	struct list_head deferred;
>  };
>  
> @@ -156,6 +158,12 @@ static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
>  	set_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status);
>  }
>  
> +/* Use the following function to stop the wdog ping worker when suspending */
> +static inline void watchdog_stop_ping_on_suspend(struct watchdog_device *wdd)
> +{
> +	set_bit(WDOG_NO_PING_ON_SUSPEND, &wdd->status);
> +}
> +
>  /* Use the following function to check if a timeout value is invalid */
>  static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
>  {
> @@ -209,6 +217,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
>  				  unsigned int timeout_parm, struct device *dev);
>  extern int watchdog_register_device(struct watchdog_device *);
>  extern void watchdog_unregister_device(struct watchdog_device *);
> +int watchdog_dev_suspend(struct watchdog_device *wdd);
> +int watchdog_dev_resume(struct watchdog_device *wdd);
>  
>  int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
>  
