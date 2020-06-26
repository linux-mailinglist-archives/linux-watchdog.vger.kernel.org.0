Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6624220BD0C
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jun 2020 01:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgFZXKo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Jun 2020 19:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFZXKo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Jun 2020 19:10:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135FEC03E979
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jun 2020 16:10:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h22so5566344pjf.1
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jun 2020 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rAQMTx3d6niuGiG4GX4ZQGE100RlPgWCiz8tnOuJNPw=;
        b=RsvQcpyz+AXP+UQ+AXPkt7mo2z+euaM7LjJB0Q1KMIsS4sFBCfotv7v0F03Fh7qHdF
         lTw4JxTlqHOyqn/dh/iKthidQBQdinXFMAIkETUPZAoeOg79WmiMiP7WM5qzkYOr9ov0
         ijT5a+xXidoSn9ywM/cHRWPLnbpjk4YuLPJSISBKxcC5W6w+Pex3OKgqg1E20k7uzMse
         aZsWPIH5muRMXKHZdNKK3+odei6mHllrtvttSFN+oVK1PcUzK6jjJVNY/h924oafttct
         XDX5FJmQKEXRNV+CAhbOqM1+24kmLrHuow2VspJGk+hmVWuxAyqqhP9cO8tQKc4tJAv6
         fEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rAQMTx3d6niuGiG4GX4ZQGE100RlPgWCiz8tnOuJNPw=;
        b=nj+No20UekP6YX5VVpmHNAAchZjhRCYsYtOYErccCvnyxJGJccqF4nOcytDOFGhYxA
         AjAtOIIAc412QfuMr4FvD2HZ3paYI46QOU/pdAeM5gc66FC90HDrNzwkos4fp72OqNYe
         WYF3YuTIvuNC2QA9PQPB07MrGyUTvbaVjn6UysHix+5WT2OFLluzJX897Acf0YDBtrXz
         kik6ObrxlUuetRZOB7t6eEni8Q4hXw9Kv4VxpCbaPNVKtNUbYY8RccDsjY9UC5UhsOYt
         Jwq3Pds+yWzCpENsXqu2dC0jTtFn3zXSw1dUrwXh0s12kZcjPe6I+y7bi3O50lXisx4q
         C/nA==
X-Gm-Message-State: AOAM531Otc8KdI+jvSnSLNFfn3bZF1KSJJJEZ0xRlbP3OqrDfGxOLI9p
        h17xbG3zsR/oy4wEBEKTMsoE2to6
X-Google-Smtp-Source: ABdhPJywcGiK15htyBgKHKCWacsMeums5+RvMXoVLKAoh/clYG9Lz3xrn+ID1iXXGJGLpPJcaNsNhQ==
X-Received: by 2002:a17:90a:1748:: with SMTP id 8mr1536732pjm.131.1593213043454;
        Fri, 26 Jun 2020 16:10:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4sm10134361pfn.28.2020.06.26.16.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 16:10:42 -0700 (PDT)
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
To:     minyard@acm.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Corey Minyard <cminyard@mvista.com>
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c29b1018-52ba-f118-b955-9df07f2357b9@roeck-us.net>
Date:   Fri, 26 Jun 2020 16:10:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620173351.18752-2-minyard@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/20/20 10:33 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
> structure are expected to be in milliseconds.  Add the flag and the
> various conversions.  This should have no effect on existing drivers.
> 

For this to work, the entire watchdog core code has to be converted to be based
on milliseconds, with API functions converting from s to ms on incoming calls
and from ms to s on outgoing calls. At the same time, the existing UAPI must not
be changed and still be based on seconds. Milli-second functionality such as
milli-second based sysfs attributes or milli-second based ioctls can be added
separately.

That means functions such as watchdog_need_worker() must be completely based
on milli-seconds and not make an on-the-fly conversion on each call.
That is just one example.

I'd give it a try myself, but unfortunately I just don't have the time.

Guenter

> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_core.c | 30 +++++++++++++-------
>  drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++------
>  include/linux/watchdog.h         | 29 +++++++++++++++-----
>  include/uapi/linux/watchdog.h    |  1 +
>  4 files changed, 82 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..b54451a9a336 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -116,17 +116,17 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  {
>  	const char *dev_str = wdd->parent ? dev_name(wdd->parent) :
>  			      (const char *)wdd->info->identity;
> -	unsigned int t = 0;
>  	int ret = 0;
>  
>  	watchdog_check_min_max_timeout(wdd);
>  
>  	/* check the driver supplied value (likely a module parameter) first */
>  	if (timeout_parm) {
> -		if (!watchdog_timeout_invalid(wdd, timeout_parm)) {
> -			wdd->timeout = timeout_parm;
> -			return 0;
> -		}
> +		if (wdd->info->options & WDIOF_MSECTIMER) {
> +			if (!_watchdog_timeout_invalid(wdd, timeout_parm))
> +				goto set_timeout;
> +		} else if (!watchdog_timeout_invalid(wdd, timeout_parm))
> +			goto set_timeout;
>  		pr_err("%s: driver supplied timeout (%u) out of range\n",
>  			dev_str, timeout_parm);
>  		ret = -EINVAL;
> @@ -134,12 +134,18 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  
>  	/* try to get the timeout_sec property */
>  	if (dev && dev->of_node &&
> -	    of_property_read_u32(dev->of_node, "timeout-sec", &t) == 0) {
> -		if (t && !watchdog_timeout_invalid(wdd, t)) {
> -			wdd->timeout = t;
> -			return 0;
> +	    of_property_read_u32(dev->of_node, "timeout-sec",
> +				 &timeout_parm) == 0) {
> +		if (timeout_parm &&
> +		    !watchdog_timeout_invalid(wdd, timeout_parm)) {
> +			if (!(wdd->info->options & WDIOF_MSECTIMER))
> +				/* Convert to msecs if not already so. */
> +				timeout_parm *= 1000;
> +			goto set_timeout;
>  		}
> -		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str, t);
> +
> +		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str,
> +		       timeout_parm);
>  		ret = -EINVAL;
>  	}
>  
> @@ -148,6 +154,10 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  			wdd->timeout);
>  
>  	return ret;
> +
> +set_timeout:
> +	wdd->timeout = timeout_parm;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(watchdog_init_timeout);
>  
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 7e4cd34a8c20..480460b89c16 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -99,7 +99,11 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
>  {
>  	/* All variables in milli-seconds */
>  	unsigned int hm = wdd->max_hw_heartbeat_ms;
> -	unsigned int t = wdd->timeout * 1000;
> +	unsigned int t = wdd->timeout;
> +
> +	if (!(wdd->info->options & WDIOF_MSECTIMER))
> +		/* Convert to msecs if not already so. */
> +		t *= 1000;
>  
>  	/*
>  	 * A worker to generate heartbeat requests is needed if all of the
> @@ -121,12 +125,16 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
>  static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
>  {
>  	struct watchdog_core_data *wd_data = wdd->wd_data;
> -	unsigned int timeout_ms = wdd->timeout * 1000;
> +	unsigned int timeout_ms = wdd->timeout;
>  	ktime_t keepalive_interval;
>  	ktime_t last_heartbeat, latest_heartbeat;
>  	ktime_t virt_timeout;
>  	unsigned int hw_heartbeat_ms;
>  
> +	if (!(wdd->info->options & WDIOF_MSECTIMER))
> +		/* Convert to msecs if not already so. */
> +		timeout_ms *= 1000;
> +
>  	if (watchdog_active(wdd))
>  		virt_timeout = ktime_add(wd_data->last_keepalive,
>  					 ms_to_ktime(timeout_ms));
> @@ -137,7 +145,7 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
>  	keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);
>  
>  	/*
> -	 * To ensure that the watchdog times out wdd->timeout seconds
> +	 * To ensure that the watchdog times out wdd->timeout seconds/msecs
>  	 * after the most recent ping from userspace, the last
>  	 * worker ping has to come in hw_heartbeat_ms before this timeout.
>  	 */
> @@ -382,6 +390,8 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
>  	if (watchdog_timeout_invalid(wdd, timeout))
>  		return -EINVAL;
>  
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		timeout *= 1000;
>  	if (wdd->ops->set_timeout) {
>  		err = wdd->ops->set_timeout(wdd, timeout);
>  	} else {
> @@ -413,6 +423,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>  	if (watchdog_pretimeout_invalid(wdd, timeout))
>  		return -EINVAL;
>  
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		timeout *= 1000;
>  	if (wdd->ops->set_pretimeout)
>  		err = wdd->ops->set_pretimeout(wdd, timeout);
>  	else
> @@ -440,6 +452,8 @@ static int watchdog_get_timeleft(struct watchdog_device *wdd,
>  		return -EOPNOTSUPP;
>  
>  	*timeleft = wdd->ops->get_timeleft(wdd);
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		*timeleft /= 1000;
>  
>  	return 0;
>  }
> @@ -508,8 +522,11 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
>  	mutex_lock(&wd_data->lock);
>  	status = watchdog_get_timeleft(wdd, &val);
>  	mutex_unlock(&wd_data->lock);
> -	if (!status)
> +	if (!status) {
> +		if (wdd->info->options & WDIOF_MSECTIMER)
> +			val /= 1000;
>  		status = sprintf(buf, "%u\n", val);
> +	}
>  
>  	return status;
>  }
> @@ -519,8 +536,12 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>  				char *buf)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	unsigned int t = wdd->timeout;
> +
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		t /= 1000;
>  
> -	return sprintf(buf, "%u\n", wdd->timeout);
> +	return sprintf(buf, "%u\n", t);
>  }
>  static DEVICE_ATTR_RO(timeout);
>  
> @@ -528,8 +549,12 @@ static ssize_t pretimeout_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
>  {
>  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	unsigned int t = wdd->pretimeout;
>  
> -	return sprintf(buf, "%u\n", wdd->pretimeout);
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		t /= 1000;
> +
> +	return sprintf(buf, "%u\n", t);
>  }
>  static DEVICE_ATTR_RO(pretimeout);
>  
> @@ -783,7 +808,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  			err = -EOPNOTSUPP;
>  			break;
>  		}
> -		err = put_user(wdd->timeout, p);
> +		val = wdd->timeout;
> +		if (wdd->info->options & WDIOF_MSECTIMER)
> +			val /= 1000;
> +		err = put_user(val, p);
>  		break;
>  	case WDIOC_GETTIMELEFT:
>  		err = watchdog_get_timeleft(wdd, &val);
> @@ -799,7 +827,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  		err = watchdog_set_pretimeout(wdd, val);
>  		break;
>  	case WDIOC_GETPRETIMEOUT:
> -		err = put_user(wdd->pretimeout, p);
> +		val = wdd->pretimeout;
> +		if (wdd->info->options & WDIOF_MSECTIMER)
> +			val /= 1000;
> +		err = put_user(val, p);
>  		break;
>  	default:
>  		err = -ENOTTY;
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 1464ce6ffa31..49bfaf986b37 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -55,7 +55,9 @@ struct watchdog_ops {
>  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
>  };
>  
> -/** struct watchdog_device - The structure that defines a watchdog device
> +/** struct watchdog_device - The structure that defines a watchdog device.
> + * Unless otherwise specified, all timeouts are in seconds unless
> + * WDIOF_MSECTIMER is set, then they are in milliseconds.
>   *
>   * @id:		The watchdog's ID. (Allocated by watchdog_register_device)
>   * @parent:	The parent bus device
> @@ -65,10 +67,10 @@ struct watchdog_ops {
>   * @ops:	Pointer to the list of watchdog operations.
>   * @gov:	Pointer to watchdog pretimeout governor.
>   * @bootstatus:	Status of the watchdog device at boot.
> - * @timeout:	The watchdog devices timeout value (in seconds).
> + * @timeout:	The watchdog devices timeout value.
>   * @pretimeout: The watchdog devices pre_timeout value.
> - * @min_timeout:The watchdog devices minimum timeout value (in seconds).
> - * @max_timeout:The watchdog devices maximum timeout value (in seconds)
> + * @min_timeout:The watchdog devices minimum timeout value.
> + * @max_timeout:The watchdog devices maximum timeout value
>   *		as configurable from user space. Only relevant if
>   *		max_hw_heartbeat_ms is not provided.
>   * @min_hw_heartbeat_ms:
> @@ -156,6 +158,17 @@ static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
>  	set_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status);
>  }
>  
> +/*
> + * Use the following function to check if a timeout value is
> + * internally consistent with the range parameters.  t is in milliseconds.
> + */
> +static inline bool _watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
> +{
> +	return  t < wdd->min_timeout ||
> +		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
> +		 t > wdd->max_timeout);
> +}
> +
>  /* Use the following function to check if a timeout value is invalid */
>  static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
>  {
> @@ -170,9 +183,11 @@ static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigne
>  	 *   is configured, and the requested value is larger than the
>  	 *   configured maximum timeout.
>  	 */
> -	return t > UINT_MAX / 1000 || t < wdd->min_timeout ||
> -		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
> -		 t > wdd->max_timeout);
> +	if (t > UINT_MAX / 1000)
> +		return true;
> +	if (wdd->info->options & WDIOF_MSECTIMER)
> +		t *= 1000;
> +	return _watchdog_timeout_invalid(wdd, t);
>  }
>  
>  /* Use the following function to check if a pretimeout value is invalid */
> diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
> index b15cde5c9054..feb3bcc46993 100644
> --- a/include/uapi/linux/watchdog.h
> +++ b/include/uapi/linux/watchdog.h
> @@ -48,6 +48,7 @@ struct watchdog_info {
>  #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
>  #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
>  					   other external alarm not a reboot */
> +#define	WDIOF_MSECTIMER		0x0800	/* Driver can use milliseconds for timeouts */
>  #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
>  
>  #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
> 

