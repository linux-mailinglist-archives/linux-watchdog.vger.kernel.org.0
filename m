Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DD83A82B8
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jun 2021 16:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhFOO1b (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Jun 2021 10:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhFOO1L (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Jun 2021 10:27:11 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7D0C06115B;
        Tue, 15 Jun 2021 07:18:07 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso14391971oto.12;
        Tue, 15 Jun 2021 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sJVfISVEAo4JYp+mcOTwuzwAUOscDkKkqgdru4mktaY=;
        b=HjhRmve41RdRloXtoYvcLwqjuYzgi4Yboi50lCsiqhUQTQDjht85QI9vAXsnukJmsx
         1UOrC5gtyUS0hceJZpKkCezdgZRa8/R/uIoyAzdrYUrdsyuKywltgztqGJ5mv95NDp29
         QKnWAs6SJe3EppFAZBqBvwMTeBBV8GjDzWe9RS57/nHmN1WoFeTHOxefD+KOIeowflIa
         wgQHJMZC6mCJ54poL+zPlrk07WC6TJUXTKKerV1xDO5NXdeDax5qhWsBhy+/fWyb7Cpo
         QA87Wjx5ydjQ0TKDpZQ4LtzcjPVpiXEJSsIz+q1buJm4cumkEa4sM8Kq4RmuCjYsBqUV
         pxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sJVfISVEAo4JYp+mcOTwuzwAUOscDkKkqgdru4mktaY=;
        b=mVrE+nspil1x2DV5jZfeibrfQAhbDBR3GJzezrtXL0EIVDpGivI/aJfvYK0Q22U/DD
         /hIaAUuAdeHW3+yQN71pAj/Z9NjYwMuWgRETY64xvFK1jfcTmyEEtP4PWwNk0ZGPWZrn
         rbLBzGAOIT1QBjklump3Whu1e3JRXMjy+0xkDZPGmEmXfJcf3cEuN6JxU2dHCCg1umlY
         5k7P1XR5UF70ZDh/xXMlpiIf3qu99Xtk1YMYm/iaftqbl/zkfKUV1W9dpjibl2RadUXT
         KCW8K/PgrQAuas84T92i9hjyrQTQjtskwLukw/54FQXywt4yoPW0ZNST0UuqVx9IwpJX
         x2KQ==
X-Gm-Message-State: AOAM531fTrgzMIrVuAiGbh8MJAjd15rTjvX0N+8pUpwyce+Tht55T3ph
        zE+9QxM+Y/kkHW/kpsNLPYY=
X-Google-Smtp-Source: ABdhPJyV6/rdIISBgV1gWqBC4JaEtdD6175LeHdH2N10Ka1X3gdTMThBddSgxnWhoidVX7ln6SfktA==
X-Received: by 2002:a9d:4c0a:: with SMTP id l10mr18907559otf.363.1623766687345;
        Tue, 15 Jun 2021 07:18:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u42sm3449201oiw.50.2021.06.15.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 07:18:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 15 Jun 2021 07:18:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: introduce watchdog_dev_suspend/resume
Message-ID: <20210615141803.GA957871@roeck-us.net>
References: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
 <20210615123904.2568052-2-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615123904.2568052-2-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 15, 2021 at 02:39:03PM +0200, Grzegorz Jaszczyk wrote:
> The watchdog drivers often disable wdog clock during suspend and then
> enable it again during resume. Nevertheless the ping worker is still
> running and can issue low-level ping while the wdog clock is disabled
> causing the system hang. To prevent such condition introduce
> watchdog_dev_suspend/resume which can be used by any wdog driver and
> actually cancel ping worker during suspend and restore it back, if
> needed, during resume.
> 

I'll have to look into this further, but I don't think this is the correct
solution. Most likely the watchdog core needs to have its own independent
suspend/resule functions and suspend the high resolution timer on
suspend and restore it on resume. This may require an additional flag
to be set by drivers to indicate that the timer should be stopped on
suspend.

> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  drivers/watchdog/watchdog_dev.c | 49 +++++++++++++++++++++++++++++++++
>  include/linux/watchdog.h        |  2 ++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..3feca1567281 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1219,6 +1219,55 @@ void __exit watchdog_dev_exit(void)
>  	kthread_destroy_worker(watchdog_kworker);
>  }
>  
> +int watchdog_dev_suspend(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +	int ret;
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
> +EXPORT_SYMBOL_GPL(watchdog_dev_suspend);
> +
> +int watchdog_dev_resume(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +	int ret;
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
> +EXPORT_SYMBOL_GPL(watchdog_dev_resume);
> +
>  module_param(handle_boot_enabled, bool, 0444);
>  MODULE_PARM_DESC(handle_boot_enabled,
>  	"Watchdog core auto-updates boot enabled watchdogs before userspace takes over (default="
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 9b19e6bb68b5..febfde3b1ff6 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -209,6 +209,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
>  				  unsigned int timeout_parm, struct device *dev);
>  extern int watchdog_register_device(struct watchdog_device *);
>  extern void watchdog_unregister_device(struct watchdog_device *);
> +int watchdog_dev_suspend(struct watchdog_device *wdd);
> +int watchdog_dev_resume(struct watchdog_device *wdd);
>  
>  int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
>  
> -- 
> 2.29.0
> 
