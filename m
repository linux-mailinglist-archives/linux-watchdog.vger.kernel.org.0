Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8996B21022B
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 04:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgGACpk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 22:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGACpj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 22:45:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1A5C061755
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:45:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b92so10382074pjc.4
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uaNB8BadDa7bgygloH39Ri3DP2LAKZWwjKamX6Lz3I4=;
        b=OM0MoIxeWK6WtZ8QU+GjO5oEhQ1G9umhEM0ohKYJoE2pEdjkwvuSmt9xNskSqFW0U5
         1DvNaCksKWu/AC70FXgiFA2jTd8TOMdJ5eSuBk9PxxJi0OAsCmAsmsM+oLiOMmrcph//
         qVhBZyiFJmnZ9rIRTX+d3QuYw1AqnJZ4B4e0Sn163prM+Uta2Vfk4wpxKjg1uQCugCyz
         JLj1b+8H1vz9qUYjhBY4sz78xgIcp3+gcK2DGm3Ir/KfcznnkcIVsKRf18GlWceJdcp7
         xXNzarkFZYzdumkIIKGT6q+2pFj+avXbk2sRZSD+LkzFOXG1F4WfgTKIiNynQKYP0W0C
         PUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=uaNB8BadDa7bgygloH39Ri3DP2LAKZWwjKamX6Lz3I4=;
        b=P5dD7aFDo4QGLGesgMD7drIfPE9av85YVIoHH3OHTQboo8YyLx7qdY/6QTlUgyI9WQ
         4wu/c0s4TUvqYe223Erbi3+UisW85NZuUjtqaWQApyT2SpS8OIzAGPuMPoToR/r+g9Lg
         9z+fFtzNgdeYhy6/9nKasc/4G8llhcIK7YFS7yO4WQsaQxzEhXA39rEG59GpiGwQOPwL
         gX9DAMKOrDQvjw80DBXWiHGiW8p4JW/Q+VuskXtLtmz3QJ5mTkqr+Sej5vL+u9p2IXhJ
         GiGVL/g5to3ahMw+bFdtfzluPCPqEEpRVX5j9FnCkdS9u0lMpcxixAPfmgGVlsaOMYK+
         5Z8Q==
X-Gm-Message-State: AOAM533FcP0nyHM158sColMB6YCb8gAAC29Kxsl5zWvWOUTALWLi0aiI
        /abOqEskjZG+qCNl/qfMTMSMlFGO
X-Google-Smtp-Source: ABdhPJyMlEwHNNUZ40zQA0nd3VlKG8BEwb6u1Q/Y9p8WA6DSQiikqZxyAAoyJaJWpFFIWQk+8zavVg==
X-Received: by 2002:a17:90a:de0c:: with SMTP id m12mr12047942pjv.228.1593571537931;
        Tue, 30 Jun 2020 19:45:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y27sm4053552pgc.56.2020.06.30.19.45.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 19:45:37 -0700 (PDT)
Date:   Tue, 30 Jun 2020 19:45:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 04/10] watchdog: Add functions to set the timeout and
 pretimeout
Message-ID: <20200701024535.GA84420@roeck-us.net>
References: <20200620174907.20229-1-minyard@acm.org>
 <20200620174907.20229-5-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620174907.20229-5-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:49:01PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> If the watchdog device wants to set it's pretimeout (say from module
> parameters), this lets them do that.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_dev.c | 54 +++++++++++++++++++++++++++++----
>  include/linux/watchdog.h        |  4 +++
>  2 files changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 45a0a4fe731d..6c423aed3f3c 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -364,14 +364,14 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
>  }
>  
>  /*
> - *	watchdog_set_timeout: set the watchdog timer timeout
> + *	_watchdog_set_timeout: set the watchdog timer timeout
>   *	@wdd: the watchdog device to set the timeout for
>   *	@timeout: timeout to set in seconds
>   *
>   *	The caller must hold wd_data->lock.
>   */
>  
> -static int watchdog_set_timeout(struct watchdog_device *wdd,
> +static int _watchdog_set_timeout(struct watchdog_device *wdd,
>  							unsigned int timeout)
>  {
>  	int err = 0;
> @@ -396,14 +396,35 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
>  	return err;
>  }
>  
> +/*
> + *	watchdog_set_timeout: set the watchdog timer timeout
> + *	@wdd: the watchdog device to set the timeout for
> + *	@timeout: timeout to set in seconds
> + */
> +
> +int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	int err = 0;
> +
> +	if (!wdd->wd_data)
> +		return -ENODEV;
> +
> +	mutex_lock(&wdd->wd_data->lock);
> +	err = _watchdog_set_timeout(wdd, timeout);
> +	mutex_unlock(&wdd->wd_data->lock);

These functions are expected to be called prior to registration. wd_data isn't
set at that time, and even if it was using the mutex would be unnecessary
since there is nothing to synchronize against.

Besides being unnecessary, this change isn't mentioned in the patch description.

Guenter

> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(watchdog_set_timeout);
> +
>  /*
>   *	watchdog_set_pretimeout: set the watchdog timer pretimeout
>   *	@wdd: the watchdog device to set the timeout for
>   *	@timeout: pretimeout to set in seconds
>   */
>  
> -static int watchdog_set_pretimeout(struct watchdog_device *wdd,
> -				   unsigned int timeout)
> +static int _watchdog_set_pretimeout(struct watchdog_device *wdd,
> +				    unsigned int timeout)
>  {
>  	int err = 0;
>  
> @@ -421,6 +442,27 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>  	return err;
>  }
>  
> +/*
> + *	watchdog_set_pretimeout: set the watchdog timer pretimeout
> + *	@wdd: the watchdog device to set the timeout for
> + *	@timeout: pretimeout to set in seconds
> + */
> +
> +int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	int err = 0;
> +
> +	if (!wdd->wd_data)
> +		return -ENODEV;
> +
> +	mutex_lock(&wdd->wd_data->lock);
> +	err = _watchdog_set_pretimeout(wdd, timeout);
> +	mutex_unlock(&wdd->wd_data->lock);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(watchdog_set_pretimeout);
> +
>  /*
>   *	watchdog_get_timeleft: wrapper to get the time left before a reboot
>   *	@wdd: the watchdog device to get the remaining time from
> @@ -809,7 +851,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  			err = -EFAULT;
>  			break;
>  		}
> -		err = watchdog_set_timeout(wdd, val);
> +		err = _watchdog_set_timeout(wdd, val);
>  		if (err < 0)
>  			break;
>  		/* If the watchdog is active then we send a keepalive ping
> @@ -838,7 +880,7 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  			err = -EFAULT;
>  			break;
>  		}
> -		err = watchdog_set_pretimeout(wdd, val);
> +		err = _watchdog_set_pretimeout(wdd, val);
>  		break;
>  	case WDIOC_GETPRETIMEOUT:
>  		err = put_user(wdd->pretimeout, p);
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 36f99c8c973e..95396b644a9b 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -201,6 +201,10 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
>  	return wdd->driver_data;
>  }
>  
> +/* Allow the driver to set the timeout and pretimeout. */
> +int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int timeout);
> +int watchdog_set_pretimeout(struct watchdog_device *wdd, unsigned int timeout);
> +
>  /* Use the following functions to report watchdog pretimeout event */
>  #if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)
>  void watchdog_notify_pretimeout(struct watchdog_device *wdd);
> -- 
> 2.17.1
> 
