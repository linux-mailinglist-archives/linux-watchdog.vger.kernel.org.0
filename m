Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42E95057
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 23:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbfHSV7B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 17:59:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46325 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHSV7B (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 17:59:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id c2so1602140plz.13
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UDw4RSH2uiScTNXTCVu+N4HvP1GQklcJWeqvKbLhyto=;
        b=Rfu8VrzDF51qrs62E5L3Ii6Izur3k101JLNG+26M0S/5yMWLQSIPkcM+2FUn3AfUtW
         0LuD9llr4eqHJcXj+YfJH+tD3p0tB42Nl2ze+tZeB6idLNGOvn3Q4rHIgn9FPTde1Ir5
         6F1zP3TxB4xzq6kavnP9mZnmnVPkh8h3E+QXrIpOofNO4wJQGc85Pq/OMB2iCggTZVpi
         NyG8qEFLpvotDvem4O1rWQ2pigYzRfLYhHf9gXXE6pPPGKSBS/l97aVUttPGsGESXJhU
         WxFRUzp/ZvHMIEacQRfxTBmJ/B8iwH65OPWODGwV6mADMxAcN0inpHmD1gJsZfLKK8+G
         HuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UDw4RSH2uiScTNXTCVu+N4HvP1GQklcJWeqvKbLhyto=;
        b=rH/mpB0YIYHd5Lfogt4+VRIeRLOtmUsFjd3f0bUkD59WZjePHdyqH+46NR5AbEa/kq
         euVL6fSpktqHms6JWi2kyEJsFWMHEamNhB3Cp4inpKRL9neZ43OLIm+4kM6qMlhNtsdM
         zjoiYJE113jOxmYtqoAm9pMNqSv4MeA8XuqAiXj4nIweCnpLFvr4xTo9HH9z3yNdV8BQ
         XxnT9zzKiJg+ULCQVZzYvyhVcOm7f8TW85N3X8bOo6+gGcmWUVR9pVLaqndmJ79Yg3oD
         h3L6kGFiCMdKzQ/w7EDo3u+WueGi5ziabUue7538CUzuyZ6EQKZbDmsxoktqjymF2ChC
         Xxlg==
X-Gm-Message-State: APjAAAWXshO5l+ZM1eaAn/dNyNF6FXdiVDmYx4xXWpqO3xEp9DXTv0Nx
        XBoIGQZBVe1V3GVahqDRI3OzP5Dq
X-Google-Smtp-Source: APXvYqwT7nm/IXlSFzia9/FG1XhNYoGsS4T+HclEI148hnqzKHJ+MivigRztqofPJRJaDGA6fOg10A==
X-Received: by 2002:a17:902:5a1:: with SMTP id f30mr25252372plf.64.1566251940330;
        Mon, 19 Aug 2019 14:59:00 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id g2sm14695354pfm.32.2019.08.19.14.58.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 14:58:59 -0700 (PDT)
Date:   Mon, 19 Aug 2019 14:58:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 08/12] watchdog: Add the ability to set the action of a
 timeout
Message-ID: <20190819215858.GB7517@roeck-us.net>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-9-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819203711.32599-9-minyard@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 03:37:07PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Add a way to tell the watchdog what to do on a timeout and on
> a pretimeout.  This is to support the IPMI watchdog's ability
> to do this.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  Documentation/watchdog/watchdog-api.rst | 40 ++++++++++++
>  drivers/watchdog/watchdog_dev.c         | 82 +++++++++++++++++++++++++
>  include/linux/watchdog.h                |  4 ++
>  include/uapi/linux/watchdog.h           | 14 +++++
>  4 files changed, 140 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index c6c1e9fa9f73..927be9e56b5d 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -112,6 +112,24 @@ current timeout using the GETTIMEOUT ioctl::
>      ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
>      printf("The timeout was is %d seconds\n", timeout);
>  
> +Actions
> +=======
> +
> +Some watchdog timers can perform different actions when they time out.
> +Most will only reset.  The values are::
> +
> +    WDIOA_RESET - Reset the system
> +    WDIOA_POWER_OFF - Power off the system
> +    WDIOA_POWER_CYCLE - Power off the system then power it back on
> +
> +The value can be set::
> +
> +    ioctl(fd, WDIOC_SETACTION, &action);
> +
> +and queried::
> +
> +    ioctl(fd, WDIOC_GETACTION, &action);
> +
>  Pretimeouts
>  ===========
>  
> @@ -137,6 +155,28 @@ There is also a get function for getting the pretimeout::
>  
>  Not all watchdog drivers will support a pretimeout.
>  
> +Preactions
> +==========
> +
> +Like actions some watchdog timers can perform different actions when
> +they pretimeout.  The values are::
> +
> +    WDIOP_NONE - Don't do anything on a pretimeout
> +    WDIOP_NMI - Issue an NMI
> +    WDIOP_SMI - Issue a system management interrupt
> +    WDIOP_INTERRUPT - Issue a normal interrupt
> +
> +The value can be set::
> +
> +    ioctl(fd, WDIOC_SETPREACTION, &preaction);
> +
> +and queried::
> +
> +    ioctl(fd, WDIOC_GETPREACTION, &preaction);
> +
> +Note that the pretimeout governor that reads data is not compatible with
> +the NMI preaction.  The NMI preaction can only do nothing or panic.
> +

I find this quite confusing. We would now have this ioctl, and then we
have the pretimeout sysfs attributes which are also supposed to set
pretimeout actions. This will require a bit more discussion for a
more concise and less confusing interface/API/ABI.

Guenter

>  Get the number of seconds before reboot
>  =======================================
>  
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 8e8304607a8c..0e70f510a491 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -423,6 +423,48 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>  	return err;
>  }
>  
> +/*
> + *	watchdog_set_action: set the action the watchdog performs.
> + *	@wdd: the watchdog device to set the timeout for
> + *	@action: The action, one of WDIOA_xxx
> + *
> + *	The caller must hold wd_data->lock.
> + */
> +
> +static int watchdog_set_action(struct watchdog_device *wdd,
> +			       unsigned int action)
> +{
> +	int err = 0;
> +
> +	if (wdd->ops->set_action)
> +		err = wdd->ops->set_action(wdd, action);
> +	else if (action != WDIOA_RESET)
> +		err = -EINVAL;
> +
> +	return err;
> +}
> +
> +/*
> + *	watchdog_set_preaction: set the action the watchdog pretimeout performs.
> + *	@wdd: the watchdog device to set the timeout for
> + *	@action: The action, one of WDIOP_xxx
> + *
> + *	The caller must hold wd_data->lock.
> + */
> +
> +static int watchdog_set_preaction(struct watchdog_device *wdd,
> +				  unsigned int action)
> +{
> +	int err;
> +
> +	if (wdd->ops->set_preaction)
> +		err = wdd->ops->set_preaction(wdd, action);
> +	else
> +		err = -EOPNOTSUPP;
> +
> +	return err;
> +}
> +
>  /*
>   *	watchdog_get_timeleft: wrapper to get the time left before a reboot
>   *	@wdd: the watchdog device to get the remaining time from
> @@ -516,6 +558,24 @@ static ssize_t pretimeout_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(pretimeout);
>  
> +static ssize_t action_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", wdd->action);
> +}
> +static DEVICE_ATTR_RO(action);
> +
> +static ssize_t preaction_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", wdd->preaction);
> +}
> +static DEVICE_ATTR_RO(preaction);
> +
>  static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>  				char *buf)
>  {
> @@ -592,6 +652,8 @@ static struct attribute *wdt_attrs[] = {
>  	&dev_attr_identity.attr,
>  	&dev_attr_timeout.attr,
>  	&dev_attr_pretimeout.attr,
> +	&dev_attr_action.attr,
> +	&dev_attr_preaction.attr,
>  	&dev_attr_timeleft.attr,
>  	&dev_attr_bootstatus.attr,
>  	&dev_attr_status.attr,
> @@ -784,6 +846,26 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  	case WDIOC_GETPRETIMEOUT:
>  		err = put_user(wdd->pretimeout, p);
>  		break;
> +	case WDIOC_SETACTION:
> +		if (get_user(val, p)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		err = watchdog_set_action(wdd, val);
> +		break;
> +	case WDIOC_GETACTION:
> +		err = put_user(wdd->action, p);
> +		break;
> +	case WDIOC_SETPREACTION:
> +		if (get_user(val, p)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		err = watchdog_set_preaction(wdd, val);
> +		break;
> +	case WDIOC_GETPREACTION:
> +		err = put_user(wdd->preaction, p);
> +		break;
>  	default:
>  		err = -ENOTTY;
>  		break;
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index e34501a822f0..d4644994106e 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -53,6 +53,8 @@ struct watchdog_ops {
>  	unsigned int (*get_timeleft)(struct watchdog_device *);
>  	int (*restart)(struct watchdog_device *, unsigned long, void *);
>  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
> +	int (*set_action)(struct watchdog_device *wdd, unsigned int val);
> +	int (*set_preaction)(struct watchdog_device *wdd, unsigned int val);
>  };
>  
>  /** struct watchdog_device - The structure that defines a watchdog device
> @@ -101,6 +103,8 @@ struct watchdog_device {
>  	unsigned int bootstatus;
>  	unsigned int timeout;
>  	unsigned int pretimeout;
> +	unsigned int action;
> +	unsigned int preaction;
>  	unsigned int min_timeout;
>  	unsigned int max_timeout;
>  	unsigned int min_hw_heartbeat_ms;
> diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
> index b15cde5c9054..bf13cf25f9e0 100644
> --- a/include/uapi/linux/watchdog.h
> +++ b/include/uapi/linux/watchdog.h
> @@ -32,6 +32,10 @@ struct watchdog_info {
>  #define	WDIOC_SETPRETIMEOUT	_IOWR(WATCHDOG_IOCTL_BASE, 8, int)
>  #define	WDIOC_GETPRETIMEOUT	_IOR(WATCHDOG_IOCTL_BASE, 9, int)
>  #define	WDIOC_GETTIMELEFT	_IOR(WATCHDOG_IOCTL_BASE, 10, int)
> +#define	WDIOC_SETACTION		_IOWR(WATCHDOG_IOCTL_BASE, 11, int)
> +#define	WDIOC_GETACTION		_IOR(WATCHDOG_IOCTL_BASE, 12, int)
> +#define	WDIOC_SETPREACTION	_IOWR(WATCHDOG_IOCTL_BASE, 13, int)
> +#define	WDIOC_GETPREACTION	_IOR(WATCHDOG_IOCTL_BASE, 14, int)
>  
>  #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
>  #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
> @@ -54,5 +58,15 @@ struct watchdog_info {
>  #define	WDIOS_ENABLECARD	0x0002	/* Turn on the watchdog timer */
>  #define	WDIOS_TEMPPANIC		0x0004	/* Kernel panic on temperature trip */
>  
> +/* Actions for WDIOC_xxxACTION ioctls. */
> +#define WDIOA_RESET		0	/* Reset the system. */
> +#define WDIOA_POWER_OFF		1	/* Power off the system. */
> +#define WDIOA_POWER_CYCLE	2	/* Power cycle the system. */
> +
> +/* Actions for WDIOC_xxxPREACTION ioctls. */
> +#define WDIOP_NONE		0	/* Do nothing. */
> +#define WDIOP_NMI		1	/* Issue an NMI. */
> +#define WDIOP_SMI		2	/* Issue a system management irq. */
> +#define WDIOP_INTERRUPT		3	/* Issue a normal irq. */
>  
>  #endif /* _UAPI_LINUX_WATCHDOG_H */
> -- 
> 2.17.1
> 
