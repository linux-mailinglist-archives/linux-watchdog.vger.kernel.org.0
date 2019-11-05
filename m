Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4D8F021B
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 17:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389934AbfKEQCy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 11:02:54 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44100 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389571AbfKEQCy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 11:02:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id q16so9671207pll.11
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Nov 2019 08:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=id1RTlb1EKv4e9bSuX6XeBgXR0A1kyAQ8psYKr6O+d0=;
        b=SeaMWomuV5iTONDRNoz7JfX0RDiueJ5hOCbKCBMO6sZgXS2qJrGJLiZkEQ+kXXJxjF
         4LJH0lo6Y1j3V/0nm54QrQGCoUFCAGwzJCSBsExSQSo+N4AqSYJEiKDogv4oS1Xf9+pz
         4Nxbz5bNmzchLPQGPmWQSM6//+ghtRAC+ivw9oKMipgQPqjxFN5HkPGVzkOUpKSvnBPG
         B7O+da/BA9ipOK5fW/z5ewfZa0MEhzReK/cB9fAzZ2UBLOYp7ZxtQTB4MGS5FpZaxezp
         of0lpVmLwm+Ng1UE3V+EaFVBb9FtBoY8N1tyZkX+bNPLonah60Sk7OAhm682OGkIMvhK
         g12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=id1RTlb1EKv4e9bSuX6XeBgXR0A1kyAQ8psYKr6O+d0=;
        b=ARB4WqLL/X8C3PHEr7ZyR8kvGlLf+dhilpTD1UvnpgbzH4UiRVUnqTU92ixj+hhT5Z
         cLWW3HoZFVoI8EPEhG+qWj4MWxDrOx8YroU+For/YhVPyASC0osCMvtMnz5wk3lNZ55V
         5ARNvjp7Np+ON4cpgjy8bJSOzfi8TRQiHnYLYvEpTdxuQHrmt1VtAxapmm76be/trZhb
         ReTeLhxMv7u0vqSjOlctzepd6DEnCVK9RqT5+76VJicutMl7X5/NWpELot7aS4Bh5faQ
         nEMDbrhs5G8MNH5wEoKuCoN0MayNXpUIE1jWAjRLJNPd18DUmOQo9cxEgEMkVbvb1llE
         dCog==
X-Gm-Message-State: APjAAAV78c2W7KAs0Akvy3YxK7u0ubkN26i3AZsb7VbAu4MT9bEvY/Qf
        nx0i9PX+X3n51b4RC3HUUgJ0xDKQ
X-Google-Smtp-Source: APXvYqyYxcndzg7wPpGKcvNmJtlk4dmfgoHEpjK82Z6lT0/N7Cu2FX0zp0S+XcZs1I6VlgZrrdyU0Q==
X-Received: by 2002:a17:902:d693:: with SMTP id v19mr11109158ply.220.1572969773816;
        Tue, 05 Nov 2019 08:02:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s69sm9223552pgs.65.2019.11.05.08.02.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 08:02:52 -0800 (PST)
Date:   Tue, 5 Nov 2019 08:02:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Tim Sander <tim@krieglstein.org>,
        Julia Cartwright <julia@ni.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] watchdog: prevent deferral of watchdogd wakeup on RT
Message-ID: <20191105160250.GA16663@roeck-us.net>
References: <20191105144506.clyadjbvnn7b7b2m@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105144506.clyadjbvnn7b7b2m@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 05, 2019 at 03:45:06PM +0100, Sebastian Andrzej Siewior wrote:
> From: Julia Cartwright <julia@ni.com>
> 
> When PREEMPT_RT is enabled, all hrtimer expiry functions are
> deferred for execution into the context of ksoftirqd unless otherwise
> annotated.
> 
> Deferring the expiry of the hrtimer used by the watchdog core, however,
> is a waste, as the callback does nothing but queue a kthread work item
> and wakeup watchdogd.
> 
> It's worst then that, too: the deferral through ksoftirqd also means
> that for correct behavior a user must adjust the scheduling parameters
> of both watchdogd _and_ ksoftirqd, which is unnecessary and has other
> side effects (like causing unrelated expiry functions to execute at
> potentially elevated priority).
> 
> Instead, mark the hrtimer used by the watchdog core as being _HARD to
> allow it's execution directly from hardirq context.  The work done in
> this expiry function is well-bounded and minimal.
> 
> A user still must adjust the scheduling parameters of the watchdogd
> to be correct w.r.t. their application needs.
> 
> Link: https://lkml.kernel.org/r/0e02d8327aeca344096c246713033887bc490dd7.1538089180.git.julia@ni.com
> Cc: Guenter Roeck <linux@roeck-us.net>
> Reported-and-tested-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reported-by: Tim Sander <tim@krieglstein.org>
> Signed-off-by: Julia Cartwright <julia@ni.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> [bigeasy: use only HRTIMER_MODE_REL_HARD]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Looks ok for mainline.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_dev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index dbd2ad4c92948..d3acc0a7256ca 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -158,7 +158,8 @@ static inline void watchdog_update_worker(struct watchdog_device *wdd)
>  		ktime_t t = watchdog_next_keepalive(wdd);
>  
>  		if (t > 0)
> -			hrtimer_start(&wd_data->timer, t, HRTIMER_MODE_REL);
> +			hrtimer_start(&wd_data->timer, t,
> +				      HRTIMER_MODE_REL_HARD);
>  	} else {
>  		hrtimer_cancel(&wd_data->timer);
>  	}
> @@ -177,7 +178,7 @@ static int __watchdog_ping(struct watchdog_device *wdd)
>  	if (ktime_after(earliest_keepalive, now)) {
>  		hrtimer_start(&wd_data->timer,
>  			      ktime_sub(earliest_keepalive, now),
> -			      HRTIMER_MODE_REL);
> +			      HRTIMER_MODE_REL_HARD);
>  		return 0;
>  	}
>  
> @@ -971,7 +972,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>  		return -ENODEV;
>  
>  	kthread_init_work(&wd_data->work, watchdog_ping_work);
> -	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
>  	wd_data->timer.function = watchdog_timer_expired;
>  
>  	if (wdd->id == 0) {
> @@ -1019,7 +1020,8 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>  		__module_get(wdd->ops->owner);
>  		kref_get(&wd_data->kref);
>  		if (handle_boot_enabled)
> -			hrtimer_start(&wd_data->timer, 0, HRTIMER_MODE_REL);
> +			hrtimer_start(&wd_data->timer, 0,
> +				      HRTIMER_MODE_REL_HARD);
>  		else
>  			pr_info("watchdog%d running and kernel based pre-userspace handler disabled\n",
>  				wdd->id);
> -- 
> 2.24.0
> 
