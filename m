Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1577E20BDB6
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jun 2020 04:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgF0CS2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Jun 2020 22:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgF0CS1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Jun 2020 22:18:27 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C063C03E979
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jun 2020 19:18:27 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id k6so5808021oij.11
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jun 2020 19:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZzFEE1edGGHn7mWyJg+z5q7Gnxw7PIVQKXD8XS0Gp/I=;
        b=vbsVM0vlSeEtOi1OYs4nrIbWs4j/6UkX7MCvk2e4EK9RXyg2QabVCc1wyRdZyC1Ciu
         Z3KCQVK41+xCJ5tIkJ/m/qTRgJTDL6rUzMeOfCtHGhYWK70Y6JEAkUKEm+toVNOob7j2
         SP9VjePlfgpWw+ogqM81gQxWcg4TzQ0Iu4+9eG6tFT/R4j6DuUryt5gl2HdBSYeUDrzG
         2SZUuARNTMCuj4c5dskZUNB1L7Ft/5Klqogbc3zrd14t4+0PULkPbIxmAjGuMROeTedi
         9ATYAPOHffIWp3/wFKjcosPejmCwup8DRPuVubS+M2LbzlV8XG+b1KJwp4jv/x/66l1S
         6lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZzFEE1edGGHn7mWyJg+z5q7Gnxw7PIVQKXD8XS0Gp/I=;
        b=PSYz4dHSHNuMMyipyXwksoWgSbiLySp1Y2Zq2SfV6RDrNMTlgjeIq7LUBerFlcyXxA
         WnjaT94F76AH15Pj85WcUsuiKfUJLDNniIp8QllKxStDRabqkgz+pyggm9Y8pocwGxS7
         mU/WpEJbRDhnI8h1bAOUs37Gv5XILdJ0G1MOr2+CxvFgRMkogPqte/BBcyfSewazHN1r
         dxt9czVEuVTX83PjzK7iyHv7Y9OqvoejRgPYlRLlvNP/TaCAO1bcd7KYQAr5zKfhW6rr
         xHlZqUKXUoKnut228QShLGEGZj2aes3YjA730rsJ+WmuX/ZRzkNLpEKOSAKnqQpl/KVL
         vELA==
X-Gm-Message-State: AOAM531thWXp/xz+36R3uEozfuCZMSpwFDWWTQg9mnl/XrbRvNCSIJOL
        UDehkbVawV9QfuaGK0rX+K6O6A==
X-Google-Smtp-Source: ABdhPJzG2dxk8lsCXpls8YBH34NMfRqEs/pSFbipA+sXjJREtx7vzp5Y98LOoXgaT4daK6Es0rQHow==
X-Received: by 2002:a54:4494:: with SMTP id v20mr4777730oiv.154.1593224306524;
        Fri, 26 Jun 2020 19:18:26 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:1874:d516:9a48:b24])
        by smtp.gmail.com with ESMTPSA id f26sm2067333oop.46.2020.06.26.19.18.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 19:18:25 -0700 (PDT)
Date:   Fri, 26 Jun 2020 21:18:24 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     minyard@acm.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Gabriele Paoloni <gabriele.paoloni@intel.com>
Subject: Re: [PATCH 1/6] watchdog: Allow a driver to use milliseconds instead
 of seconds
Message-ID: <20200627021824.GU3258@minyard.net>
Reply-To: cminyard@mvista.com
References: <20200620173351.18752-1-minyard@acm.org>
 <20200620173351.18752-2-minyard@acm.org>
 <c29b1018-52ba-f118-b955-9df07f2357b9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c29b1018-52ba-f118-b955-9df07f2357b9@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 26, 2020 at 04:10:41PM -0700, Guenter Roeck wrote:
> On 6/20/20 10:33 AM, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > If the WDIOF_MSECTIMER is set, then all the timeouts in the watchdog
> > structure are expected to be in milliseconds.  Add the flag and the
> > various conversions.  This should have no effect on existing drivers.
> > 
> 
> For this to work, the entire watchdog core code has to be converted to be based
> on milliseconds, with API functions converting from s to ms on incoming calls
> and from ms to s on outgoing calls. At the same time, the existing UAPI must not
> be changed and still be based on seconds. Milli-second functionality such as
> milli-second based sysfs attributes or milli-second based ioctls can be added
> separately.
> 
> That means functions such as watchdog_need_worker() must be completely based
> on milli-seconds and not make an on-the-fly conversion on each call.
> That is just one example.
> 
> I'd give it a try myself, but unfortunately I just don't have the time.

The patches in this series should do all this.  For instance:

@@ -99,7 +99,11 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
 {
        /* All variables in milli-seconds */
        unsigned int hm = wdd->max_hw_heartbeat_ms;
-       unsigned int t = wdd->timeout * 1000;
+       unsigned int t = wdd->timeout;
+
+       if (!(wdd->info->options & WDIOF_MSECTIMER))
+               /* Convert to msecs if not already so. */
+               t *= 1000;

        /*
         * A worker to generate heartbeat requests is needed if all of the

Basically, the changes keep the timeout in milliseconds if the lower
level driver uses milliseconds, and seconds if the lower level driver
uses seconds.  The watchdog cores do the conversions as necessary.
All the UAPIs do conversion, they work unchanged.

That's really the only way you can do this without changing all the low
level drivers, since they often reference the timeout field.

-corey

> 
> Guenter
> 
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > ---
> >  drivers/watchdog/watchdog_core.c | 30 +++++++++++++-------
> >  drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++------
> >  include/linux/watchdog.h         | 29 +++++++++++++++-----
> >  include/uapi/linux/watchdog.h    |  1 +
> >  4 files changed, 82 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> > index 423844757812..b54451a9a336 100644
> > --- a/drivers/watchdog/watchdog_core.c
> > +++ b/drivers/watchdog/watchdog_core.c
> > @@ -116,17 +116,17 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
> >  {
> >  	const char *dev_str = wdd->parent ? dev_name(wdd->parent) :
> >  			      (const char *)wdd->info->identity;
> > -	unsigned int t = 0;
> >  	int ret = 0;
> >  
> >  	watchdog_check_min_max_timeout(wdd);
> >  
> >  	/* check the driver supplied value (likely a module parameter) first */
> >  	if (timeout_parm) {
> > -		if (!watchdog_timeout_invalid(wdd, timeout_parm)) {
> > -			wdd->timeout = timeout_parm;
> > -			return 0;
> > -		}
> > +		if (wdd->info->options & WDIOF_MSECTIMER) {
> > +			if (!_watchdog_timeout_invalid(wdd, timeout_parm))
> > +				goto set_timeout;
> > +		} else if (!watchdog_timeout_invalid(wdd, timeout_parm))
> > +			goto set_timeout;
> >  		pr_err("%s: driver supplied timeout (%u) out of range\n",
> >  			dev_str, timeout_parm);
> >  		ret = -EINVAL;
> > @@ -134,12 +134,18 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
> >  
> >  	/* try to get the timeout_sec property */
> >  	if (dev && dev->of_node &&
> > -	    of_property_read_u32(dev->of_node, "timeout-sec", &t) == 0) {
> > -		if (t && !watchdog_timeout_invalid(wdd, t)) {
> > -			wdd->timeout = t;
> > -			return 0;
> > +	    of_property_read_u32(dev->of_node, "timeout-sec",
> > +				 &timeout_parm) == 0) {
> > +		if (timeout_parm &&
> > +		    !watchdog_timeout_invalid(wdd, timeout_parm)) {
> > +			if (!(wdd->info->options & WDIOF_MSECTIMER))
> > +				/* Convert to msecs if not already so. */
> > +				timeout_parm *= 1000;
> > +			goto set_timeout;
> >  		}
> > -		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str, t);
> > +
> > +		pr_err("%s: DT supplied timeout (%u) out of range\n", dev_str,
> > +		       timeout_parm);
> >  		ret = -EINVAL;
> >  	}
> >  
> > @@ -148,6 +154,10 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
> >  			wdd->timeout);
> >  
> >  	return ret;
> > +
> > +set_timeout:
> > +	wdd->timeout = timeout_parm;
> > +	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(watchdog_init_timeout);
> >  
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> > index 7e4cd34a8c20..480460b89c16 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -99,7 +99,11 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
> >  {
> >  	/* All variables in milli-seconds */
> >  	unsigned int hm = wdd->max_hw_heartbeat_ms;
> > -	unsigned int t = wdd->timeout * 1000;
> > +	unsigned int t = wdd->timeout;
> > +
> > +	if (!(wdd->info->options & WDIOF_MSECTIMER))
> > +		/* Convert to msecs if not already so. */
> > +		t *= 1000;
> >  
> >  	/*
> >  	 * A worker to generate heartbeat requests is needed if all of the
> > @@ -121,12 +125,16 @@ static inline bool watchdog_need_worker(struct watchdog_device *wdd)
> >  static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
> >  {
> >  	struct watchdog_core_data *wd_data = wdd->wd_data;
> > -	unsigned int timeout_ms = wdd->timeout * 1000;
> > +	unsigned int timeout_ms = wdd->timeout;
> >  	ktime_t keepalive_interval;
> >  	ktime_t last_heartbeat, latest_heartbeat;
> >  	ktime_t virt_timeout;
> >  	unsigned int hw_heartbeat_ms;
> >  
> > +	if (!(wdd->info->options & WDIOF_MSECTIMER))
> > +		/* Convert to msecs if not already so. */
> > +		timeout_ms *= 1000;
> > +
> >  	if (watchdog_active(wdd))
> >  		virt_timeout = ktime_add(wd_data->last_keepalive,
> >  					 ms_to_ktime(timeout_ms));
> > @@ -137,7 +145,7 @@ static ktime_t watchdog_next_keepalive(struct watchdog_device *wdd)
> >  	keepalive_interval = ms_to_ktime(hw_heartbeat_ms / 2);
> >  
> >  	/*
> > -	 * To ensure that the watchdog times out wdd->timeout seconds
> > +	 * To ensure that the watchdog times out wdd->timeout seconds/msecs
> >  	 * after the most recent ping from userspace, the last
> >  	 * worker ping has to come in hw_heartbeat_ms before this timeout.
> >  	 */
> > @@ -382,6 +390,8 @@ static int watchdog_set_timeout(struct watchdog_device *wdd,
> >  	if (watchdog_timeout_invalid(wdd, timeout))
> >  		return -EINVAL;
> >  
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		timeout *= 1000;
> >  	if (wdd->ops->set_timeout) {
> >  		err = wdd->ops->set_timeout(wdd, timeout);
> >  	} else {
> > @@ -413,6 +423,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
> >  	if (watchdog_pretimeout_invalid(wdd, timeout))
> >  		return -EINVAL;
> >  
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		timeout *= 1000;
> >  	if (wdd->ops->set_pretimeout)
> >  		err = wdd->ops->set_pretimeout(wdd, timeout);
> >  	else
> > @@ -440,6 +452,8 @@ static int watchdog_get_timeleft(struct watchdog_device *wdd,
> >  		return -EOPNOTSUPP;
> >  
> >  	*timeleft = wdd->ops->get_timeleft(wdd);
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		*timeleft /= 1000;
> >  
> >  	return 0;
> >  }
> > @@ -508,8 +522,11 @@ static ssize_t timeleft_show(struct device *dev, struct device_attribute *attr,
> >  	mutex_lock(&wd_data->lock);
> >  	status = watchdog_get_timeleft(wdd, &val);
> >  	mutex_unlock(&wd_data->lock);
> > -	if (!status)
> > +	if (!status) {
> > +		if (wdd->info->options & WDIOF_MSECTIMER)
> > +			val /= 1000;
> >  		status = sprintf(buf, "%u\n", val);
> > +	}
> >  
> >  	return status;
> >  }
> > @@ -519,8 +536,12 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
> >  				char *buf)
> >  {
> >  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > +	unsigned int t = wdd->timeout;
> > +
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		t /= 1000;
> >  
> > -	return sprintf(buf, "%u\n", wdd->timeout);
> > +	return sprintf(buf, "%u\n", t);
> >  }
> >  static DEVICE_ATTR_RO(timeout);
> >  
> > @@ -528,8 +549,12 @@ static ssize_t pretimeout_show(struct device *dev,
> >  			       struct device_attribute *attr, char *buf)
> >  {
> >  	struct watchdog_device *wdd = dev_get_drvdata(dev);
> > +	unsigned int t = wdd->pretimeout;
> >  
> > -	return sprintf(buf, "%u\n", wdd->pretimeout);
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		t /= 1000;
> > +
> > +	return sprintf(buf, "%u\n", t);
> >  }
> >  static DEVICE_ATTR_RO(pretimeout);
> >  
> > @@ -783,7 +808,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
> >  			err = -EOPNOTSUPP;
> >  			break;
> >  		}
> > -		err = put_user(wdd->timeout, p);
> > +		val = wdd->timeout;
> > +		if (wdd->info->options & WDIOF_MSECTIMER)
> > +			val /= 1000;
> > +		err = put_user(val, p);
> >  		break;
> >  	case WDIOC_GETTIMELEFT:
> >  		err = watchdog_get_timeleft(wdd, &val);
> > @@ -799,7 +827,10 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
> >  		err = watchdog_set_pretimeout(wdd, val);
> >  		break;
> >  	case WDIOC_GETPRETIMEOUT:
> > -		err = put_user(wdd->pretimeout, p);
> > +		val = wdd->pretimeout;
> > +		if (wdd->info->options & WDIOF_MSECTIMER)
> > +			val /= 1000;
> > +		err = put_user(val, p);
> >  		break;
> >  	default:
> >  		err = -ENOTTY;
> > diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> > index 1464ce6ffa31..49bfaf986b37 100644
> > --- a/include/linux/watchdog.h
> > +++ b/include/linux/watchdog.h
> > @@ -55,7 +55,9 @@ struct watchdog_ops {
> >  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
> >  };
> >  
> > -/** struct watchdog_device - The structure that defines a watchdog device
> > +/** struct watchdog_device - The structure that defines a watchdog device.
> > + * Unless otherwise specified, all timeouts are in seconds unless
> > + * WDIOF_MSECTIMER is set, then they are in milliseconds.
> >   *
> >   * @id:		The watchdog's ID. (Allocated by watchdog_register_device)
> >   * @parent:	The parent bus device
> > @@ -65,10 +67,10 @@ struct watchdog_ops {
> >   * @ops:	Pointer to the list of watchdog operations.
> >   * @gov:	Pointer to watchdog pretimeout governor.
> >   * @bootstatus:	Status of the watchdog device at boot.
> > - * @timeout:	The watchdog devices timeout value (in seconds).
> > + * @timeout:	The watchdog devices timeout value.
> >   * @pretimeout: The watchdog devices pre_timeout value.
> > - * @min_timeout:The watchdog devices minimum timeout value (in seconds).
> > - * @max_timeout:The watchdog devices maximum timeout value (in seconds)
> > + * @min_timeout:The watchdog devices minimum timeout value.
> > + * @max_timeout:The watchdog devices maximum timeout value
> >   *		as configurable from user space. Only relevant if
> >   *		max_hw_heartbeat_ms is not provided.
> >   * @min_hw_heartbeat_ms:
> > @@ -156,6 +158,17 @@ static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
> >  	set_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status);
> >  }
> >  
> > +/*
> > + * Use the following function to check if a timeout value is
> > + * internally consistent with the range parameters.  t is in milliseconds.
> > + */
> > +static inline bool _watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
> > +{
> > +	return  t < wdd->min_timeout ||
> > +		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
> > +		 t > wdd->max_timeout);
> > +}
> > +
> >  /* Use the following function to check if a timeout value is invalid */
> >  static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
> >  {
> > @@ -170,9 +183,11 @@ static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigne
> >  	 *   is configured, and the requested value is larger than the
> >  	 *   configured maximum timeout.
> >  	 */
> > -	return t > UINT_MAX / 1000 || t < wdd->min_timeout ||
> > -		(!wdd->max_hw_heartbeat_ms && wdd->max_timeout &&
> > -		 t > wdd->max_timeout);
> > +	if (t > UINT_MAX / 1000)
> > +		return true;
> > +	if (wdd->info->options & WDIOF_MSECTIMER)
> > +		t *= 1000;
> > +	return _watchdog_timeout_invalid(wdd, t);
> >  }
> >  
> >  /* Use the following function to check if a pretimeout value is invalid */
> > diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
> > index b15cde5c9054..feb3bcc46993 100644
> > --- a/include/uapi/linux/watchdog.h
> > +++ b/include/uapi/linux/watchdog.h
> > @@ -48,6 +48,7 @@ struct watchdog_info {
> >  #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
> >  #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
> >  					   other external alarm not a reboot */
> > +#define	WDIOF_MSECTIMER		0x0800	/* Driver can use milliseconds for timeouts */
> >  #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
> >  
> >  #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
> > 
> 
