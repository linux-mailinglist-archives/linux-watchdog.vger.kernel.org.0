Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AACA21022D
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 04:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgGACrA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 22:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGACq7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 22:46:59 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B249AC061755
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:46:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so5748576pfi.2
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YVvwO039QTflBzfhSdDiDbdlEw0UOIjmUUedyZ8gvtI=;
        b=L3RpbBu7CHCy5IRvCFzyZA+zTKEV7P6wVfPGzSp1AUtLR+Y1LlN7wDvTpQYeyOxI0p
         XmhKj3LM2ji0fnV0J5zwjKZlNNseFNU4gsY77g22riXLCVSYUh794pmGdrHq1rM49by3
         ObaHUYykSKJCKHZulstlJqM8/Wl5G7ol1YK+N+b/zgdc3ybdgLPEteVBzFt8PY1gmB2U
         iNTswvtEqItM9QfQ0C/pa1hwvwf/lp1acdgxTkPYNl3Kg6XCFNz3bPNI48mrzE62NPd2
         090HNuEghFMlU9k3pdnRPPlswMM02haw9uXHEdw8218/XAH1l8X7CfpvB9FUVY4Q3fIg
         SwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YVvwO039QTflBzfhSdDiDbdlEw0UOIjmUUedyZ8gvtI=;
        b=LPSeG70vyVwkSKtCL/4C8ILtyHIGsQTXI2Dg7fd8KOHSvQOylFmSYseXjGYpyaqxP4
         Pq7+g+rywWFgYCKayjj8ZQubVFfJ6xD3CC5jLRlSdorsY1iVK7xKjkIXuqPzNybp7pjg
         2MIcjv8etzJZ8iex/nLtg1cxqAQL33AbWLjmtBTWbzmye840xnAhYZwOzwEfB00ZCqbz
         OikVS3BzFktswBJ7Acrk+jMzuURAlfH7ycv0Xmad++qWeJCEPMGsIUq7WpaN9iiBwxx7
         HO9TL7F4eG+OgcOK5nG6EGrlpd5GCxaEQwif6frNagbUZtZCe5372+1VpGF/HeNA8JjM
         8ijA==
X-Gm-Message-State: AOAM533WscLKmhWG21kpXRLZkSpQ5MplpklaNvVe0pAmeEIw+yA3+lqq
        JIuQxNcmEeGAdV0DJHZVXxE=
X-Google-Smtp-Source: ABdhPJwmLksA0758vpd2d/nx1n7R+rT1wKFSafa8C/Z2t2/BN9hXDSebA2R3sQQSxiBbyN9kB0lr7Q==
X-Received: by 2002:a62:1d81:: with SMTP id d123mr21606873pfd.38.1593571619293;
        Tue, 30 Jun 2020 19:46:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g26sm1350127pfq.205.2020.06.30.19.46.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 19:46:58 -0700 (PDT)
Date:   Tue, 30 Jun 2020 19:46:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 05/10] watchdog: Export an interface to start the watchdog
Message-ID: <20200701024658.GB84420@roeck-us.net>
References: <20200620174907.20229-1-minyard@acm.org>
 <20200620174907.20229-6-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620174907.20229-6-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:49:02PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> This way a watchdog driver can start itself.

The watchdog driver can start itself prior to registration if
it wants to, like many other watchdog drivers already do. All the
driver needs to do is to call its own start function.
I do not see the need for this API.

Guenter

> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_dev.c | 30 ++++++++++++++++++++++++++----
>  include/linux/watchdog.h        |  3 +++
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 6c423aed3f3c..752358df1606 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -253,7 +253,7 @@ static enum hrtimer_restart watchdog_timer_expired(struct hrtimer *timer)
>  }
>  
>  /*
> - *	watchdog_start: wrapper to start the watchdog.
> + *	_watchdog_start: wrapper to start the watchdog.
>   *	@wdd: the watchdog device to start
>   *
>   *	The caller must hold wd_data->lock.
> @@ -263,7 +263,7 @@ static enum hrtimer_restart watchdog_timer_expired(struct hrtimer *timer)
>   *	failure.
>   */
>  
> -static int watchdog_start(struct watchdog_device *wdd)
> +static int _watchdog_start(struct watchdog_device *wdd)
>  {
>  	struct watchdog_core_data *wd_data = wdd->wd_data;
>  	ktime_t started_at;
> @@ -289,6 +289,28 @@ static int watchdog_start(struct watchdog_device *wdd)
>  	return err;
>  }
>  
> +/*
> + *	watchdog_start: External interface to start the watchdog.
> + *	@wdd: the watchdog device to start
> + *
> + *	Start the watchdog if it is not active and mark it active.
> + *	This function returns zero on success or a negative errno code for
> + *	failure.
> + */
> +
> +int watchdog_start(struct watchdog_device *wdd)
> +{
> +	struct watchdog_core_data *wd_data = wdd->wd_data;
> +	int err;
> +
> +	mutex_lock(&wd_data->lock);
> +	err = _watchdog_start(wdd);
> +	mutex_unlock(&wd_data->lock);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(watchdog_start);
> +
>  /*
>   *	watchdog_stop: wrapper to stop the watchdog.
>   *	@wdd: the watchdog device to stop
> @@ -837,7 +859,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  				break;
>  		}
>  		if (val & WDIOS_ENABLECARD)
> -			err = watchdog_start(wdd);
> +			err = _watchdog_start(wdd);
>  		break;
>  	case WDIOC_KEEPALIVE:
>  		if (!(wdd->info->options & WDIOF_KEEPALIVEPING)) {
> @@ -935,7 +957,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
>  		goto out_clear;
>  	}
>  
> -	err = watchdog_start(wdd);
> +	err = _watchdog_start(wdd);
>  	if (err < 0)
>  		goto out_mod;
>  
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 95396b644a9b..1eefae61215d 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -205,6 +205,9 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
>  int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout);
>  int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout);
>  
> +/* Allow the driver to start the watchdog. */
> +int watchdog_start(struct watchdog_device *wdd);
> +
>  /* Use the following functions to report watchdog pretimeout event */
>  #if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)
>  void watchdog_notify_pretimeout(struct watchdog_device *wdd);
> -- 
> 2.17.1
> 
