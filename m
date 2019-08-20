Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E7A9623C
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 16:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbfHTORf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 10:17:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42159 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbfHTORe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 10:17:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so2816838plp.9
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KysZha+tUSgwkk3BDJwqL/zxV0SR5Rdji7R3dwrMWf0=;
        b=V7O8uk1cZ9ONdOuHxwskUCssUQDmPHR2PMv1rrHBMnhW6i6onxiD6phoDmvYaxzFe9
         ym40WBMkXbS/0c9LbVZ24k1loA/YmkRmBNYng4w+yXcXh30pzKmj/shCO9egla7S3kV2
         FmmBsqE7BP3TE+AUDHeFhP6AECYHiakQrDEweydgnSjFHJwobgR1qLttM3asfP1Yd4Uh
         Ni9izhhGv0eLG3eL3oI6f8t1Vubt4KVWd22SO6cf5BCF1PKeagVLEXz89xH41tRSl71s
         eCkHgbZ0FrZpK1GTTOa90Y8EF7FEY2qrTAfixTUF7s9yT1h4iT3obPvkoT88MrT2EeGy
         kx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KysZha+tUSgwkk3BDJwqL/zxV0SR5Rdji7R3dwrMWf0=;
        b=qzmQAhESfEr4E58vsMEWkNecHUUSQpbqFfi5OqDKNouMPsDu2fdOFTN22go0dkIR+D
         XHEzD1gFdPU46oWTN0nDgdr5x8wcVALfM9WZVAZfRsa0cZ09V598ZeLm3CsA11CUm1DX
         KcE1N+BHqOGH1wZUUziDsQDdZb7JdOgx6W5v8KwkeeqocS5qhyUCMt4s1IxxIqYanebn
         WHQ/amItmQu1CRL3AJS2Oy8rOKCmW2F05vdUASL9wh7ECzvWSR25QluH092a9yQFttib
         RgwvJRzpxxsCaCi5UvKWXPf8S3d1spWtDkCHyMzGLzJNFNLPZ0VidPhKcgw8PQWO+FBa
         s3Bg==
X-Gm-Message-State: APjAAAUtBM1EN53p/9UBwoQRErEYtLMgIlA/So1NLAfIiXPct7vKITXP
        DJyv9uCuxTXUKCjoyWO5YMLi2iym
X-Google-Smtp-Source: APXvYqysf7vj9zgCeUilt7ssD9rIzFKZpxTMDByoba9jjeoYA38utTOJYgej24jm9KpVMKRvm2GPlQ==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr27784416plf.140.1566310653819;
        Tue, 20 Aug 2019 07:17:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5sm17012492pgp.59.2019.08.20.07.17.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 07:17:32 -0700 (PDT)
Subject: Re: [PATCH 08/12] watchdog: Add the ability to set the action of a
 timeout
To:     cminyard@mvista.com
Cc:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-9-minyard@acm.org> <20190819215858.GB7517@roeck-us.net>
 <20190820003928.GK445@minyard.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <40608dee-6b98-76a5-c06d-d0ab9954a56d@roeck-us.net>
Date:   Tue, 20 Aug 2019 07:17:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820003928.GK445@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/19/19 5:39 PM, Corey Minyard wrote:
> On Mon, Aug 19, 2019 at 02:58:58PM -0700, Guenter Roeck wrote:
>> On Mon, Aug 19, 2019 at 03:37:07PM -0500, minyard@acm.org wrote:
>>> From: Corey Minyard <cminyard@mvista.com>
>>>
>>> Add a way to tell the watchdog what to do on a timeout and on
>>> a pretimeout.  This is to support the IPMI watchdog's ability
>>> to do this.
>>>
>>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>>> ---
>>>   Documentation/watchdog/watchdog-api.rst | 40 ++++++++++++
>>>   drivers/watchdog/watchdog_dev.c         | 82 +++++++++++++++++++++++++
>>>   include/linux/watchdog.h                |  4 ++
>>>   include/uapi/linux/watchdog.h           | 14 +++++
>>>   4 files changed, 140 insertions(+)
>>>
>>> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
>>> index c6c1e9fa9f73..927be9e56b5d 100644
>>> --- a/Documentation/watchdog/watchdog-api.rst
>>> +++ b/Documentation/watchdog/watchdog-api.rst
>>> @@ -112,6 +112,24 @@ current timeout using the GETTIMEOUT ioctl::
>>>       ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
>>>       printf("The timeout was is %d seconds\n", timeout);
>>>   
>>> +Actions
>>> +=======
>>> +
>>> +Some watchdog timers can perform different actions when they time out.
>>> +Most will only reset.  The values are::
>>> +
>>> +    WDIOA_RESET - Reset the system
>>> +    WDIOA_POWER_OFF - Power off the system
>>> +    WDIOA_POWER_CYCLE - Power off the system then power it back on
>>> +
>>> +The value can be set::
>>> +
>>> +    ioctl(fd, WDIOC_SETACTION, &action);
>>> +
>>> +and queried::
>>> +
>>> +    ioctl(fd, WDIOC_GETACTION, &action);
>>> +
>>>   Pretimeouts
>>>   ===========
>>>   
>>> @@ -137,6 +155,28 @@ There is also a get function for getting the pretimeout::
>>>   
>>>   Not all watchdog drivers will support a pretimeout.
>>>   
>>> +Preactions
>>> +==========
>>> +
>>> +Like actions some watchdog timers can perform different actions when
>>> +they pretimeout.  The values are::
>>> +
>>> +    WDIOP_NONE - Don't do anything on a pretimeout
>>> +    WDIOP_NMI - Issue an NMI
>>> +    WDIOP_SMI - Issue a system management interrupt
>>> +    WDIOP_INTERRUPT - Issue a normal interrupt
>>> +
>>> +The value can be set::
>>> +
>>> +    ioctl(fd, WDIOC_SETPREACTION, &preaction);
>>> +
>>> +and queried::
>>> +
>>> +    ioctl(fd, WDIOC_GETPREACTION, &preaction);
>>> +
>>> +Note that the pretimeout governor that reads data is not compatible with
>>> +the NMI preaction.  The NMI preaction can only do nothing or panic.
>>> +
>>
>> I find this quite confusing. We would now have this ioctl, and then we
>> have the pretimeout sysfs attributes which are also supposed to set
>> pretimeout actions. This will require a bit more discussion for a
>> more concise and less confusing interface/API/ABI.
> 
> I'm a little confused.  The sysfs interfaces I added are read-only,

> and I added them for consistency since everything else there is also
> readable/settable by the ioctl (except the governor, which seemed odd).

The ioctl to set the pretimeout governor is questionable; the reason
for using sysfs to set it was that governor presence is controlled by
configuration options and module loads. An ioctl would fail unpredictably,
and the associated program would have no means to determine the means
why a request to set a specific governor failed.

> What do you find confusing about this?  The action is just what the
> watchdog does when it times out.  Is there a better way I could

With your proposal, there are two sets of actions for pretimeouts:
The actions determined by the pretimeout governor, and the actions
determined by the hardware/driver. Those actions are overlapping,
especially in the case of WDIOP_NONE. What if the governor is set
to panic, and the ioctl configured WDIOP_NONE ?

> explain this in the documentation?
> 
> I could leave the action/preaction handling in the IPMI watchdog
> through the current interfaces, but that seems unnatural.  It seems
> handy to be able to know what the timeout and pretimeout is going
> to do.
> 
> This whole series is in general what I think it would take to
> preserve current functionality in the IPMI watchdog and convert
> it to the standard interface.  It seems like the goal is to
> convert all the watchdogs over to the standard interface, which

It is, but any changes to the core API / ABI need to make sense and
have to be discussed on their own merits. We can not change the core
API to accommodate the private API/ABI used by each individual driver
that isn't following the standard. A better approach here would be to
determine if there is a valid need for an API/ABI extension which would
enhance support for more than one driver, and to find a means to ensure
that the needs of all drivers are met. That is not the case here.

Sure, we can discuss an API extension to be able to set the action to
be taken when a watchdog fires. But does it accommodate more than
the IPMI driver ? Are the actions complete, or may we need to support
some other actions (whatever those might be) ? Is it ever appropriate
to power off a system as result of a watchdog firing ? This needs to
be discussed separately, and this discussion should not be bundled
with a driver conversion to the watchdog subsystem. Until it is
discussed, it would be more appropriate to implement such ioctls
as driver-private ioctls (which the watchdog subsystem _does_ support).

Guenter

> I am fine with, but I am fine with leaving things the way they
> are, too.
> 
> -corey
> 
>>
>> Guenter
>>
>>>   Get the number of seconds before reboot
>>>   =======================================
>>>   
>>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>>> index 8e8304607a8c..0e70f510a491 100644
>>> --- a/drivers/watchdog/watchdog_dev.c
>>> +++ b/drivers/watchdog/watchdog_dev.c
>>> @@ -423,6 +423,48 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
>>>   	return err;
>>>   }
>>>   
>>> +/*
>>> + *	watchdog_set_action: set the action the watchdog performs.
>>> + *	@wdd: the watchdog device to set the timeout for
>>> + *	@action: The action, one of WDIOA_xxx
>>> + *
>>> + *	The caller must hold wd_data->lock.
>>> + */
>>> +
>>> +static int watchdog_set_action(struct watchdog_device *wdd,
>>> +			       unsigned int action)
>>> +{
>>> +	int err = 0;
>>> +
>>> +	if (wdd->ops->set_action)
>>> +		err = wdd->ops->set_action(wdd, action);
>>> +	else if (action != WDIOA_RESET)
>>> +		err = -EINVAL;
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +/*
>>> + *	watchdog_set_preaction: set the action the watchdog pretimeout performs.
>>> + *	@wdd: the watchdog device to set the timeout for
>>> + *	@action: The action, one of WDIOP_xxx
>>> + *
>>> + *	The caller must hold wd_data->lock.
>>> + */
>>> +
>>> +static int watchdog_set_preaction(struct watchdog_device *wdd,
>>> +				  unsigned int action)
>>> +{
>>> +	int err;
>>> +
>>> +	if (wdd->ops->set_preaction)
>>> +		err = wdd->ops->set_preaction(wdd, action);
>>> +	else
>>> +		err = -EOPNOTSUPP;
>>> +
>>> +	return err;
>>> +}
>>> +
>>>   /*
>>>    *	watchdog_get_timeleft: wrapper to get the time left before a reboot
>>>    *	@wdd: the watchdog device to get the remaining time from
>>> @@ -516,6 +558,24 @@ static ssize_t pretimeout_show(struct device *dev,
>>>   }
>>>   static DEVICE_ATTR_RO(pretimeout);
>>>   
>>> +static ssize_t action_show(struct device *dev,
>>> +			   struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +
>>> +	return sprintf(buf, "%u\n", wdd->action);
>>> +}
>>> +static DEVICE_ATTR_RO(action);
>>> +
>>> +static ssize_t preaction_show(struct device *dev,
>>> +			      struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +
>>> +	return sprintf(buf, "%u\n", wdd->preaction);
>>> +}
>>> +static DEVICE_ATTR_RO(preaction);
>>> +
>>>   static ssize_t identity_show(struct device *dev, struct device_attribute *attr,
>>>   				char *buf)
>>>   {
>>> @@ -592,6 +652,8 @@ static struct attribute *wdt_attrs[] = {
>>>   	&dev_attr_identity.attr,
>>>   	&dev_attr_timeout.attr,
>>>   	&dev_attr_pretimeout.attr,
>>> +	&dev_attr_action.attr,
>>> +	&dev_attr_preaction.attr,
>>>   	&dev_attr_timeleft.attr,
>>>   	&dev_attr_bootstatus.attr,
>>>   	&dev_attr_status.attr,
>>> @@ -784,6 +846,26 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>>>   	case WDIOC_GETPRETIMEOUT:
>>>   		err = put_user(wdd->pretimeout, p);
>>>   		break;
>>> +	case WDIOC_SETACTION:
>>> +		if (get_user(val, p)) {
>>> +			err = -EFAULT;
>>> +			break;
>>> +		}
>>> +		err = watchdog_set_action(wdd, val);
>>> +		break;
>>> +	case WDIOC_GETACTION:
>>> +		err = put_user(wdd->action, p);
>>> +		break;
>>> +	case WDIOC_SETPREACTION:
>>> +		if (get_user(val, p)) {
>>> +			err = -EFAULT;
>>> +			break;
>>> +		}
>>> +		err = watchdog_set_preaction(wdd, val);
>>> +		break;
>>> +	case WDIOC_GETPREACTION:
>>> +		err = put_user(wdd->preaction, p);
>>> +		break;
>>>   	default:
>>>   		err = -ENOTTY;
>>>   		break;
>>> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
>>> index e34501a822f0..d4644994106e 100644
>>> --- a/include/linux/watchdog.h
>>> +++ b/include/linux/watchdog.h
>>> @@ -53,6 +53,8 @@ struct watchdog_ops {
>>>   	unsigned int (*get_timeleft)(struct watchdog_device *);
>>>   	int (*restart)(struct watchdog_device *, unsigned long, void *);
>>>   	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
>>> +	int (*set_action)(struct watchdog_device *wdd, unsigned int val);
>>> +	int (*set_preaction)(struct watchdog_device *wdd, unsigned int val);
>>>   };
>>>   
>>>   /** struct watchdog_device - The structure that defines a watchdog device
>>> @@ -101,6 +103,8 @@ struct watchdog_device {
>>>   	unsigned int bootstatus;
>>>   	unsigned int timeout;
>>>   	unsigned int pretimeout;
>>> +	unsigned int action;
>>> +	unsigned int preaction;
>>>   	unsigned int min_timeout;
>>>   	unsigned int max_timeout;
>>>   	unsigned int min_hw_heartbeat_ms;
>>> diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
>>> index b15cde5c9054..bf13cf25f9e0 100644
>>> --- a/include/uapi/linux/watchdog.h
>>> +++ b/include/uapi/linux/watchdog.h
>>> @@ -32,6 +32,10 @@ struct watchdog_info {
>>>   #define	WDIOC_SETPRETIMEOUT	_IOWR(WATCHDOG_IOCTL_BASE, 8, int)
>>>   #define	WDIOC_GETPRETIMEOUT	_IOR(WATCHDOG_IOCTL_BASE, 9, int)
>>>   #define	WDIOC_GETTIMELEFT	_IOR(WATCHDOG_IOCTL_BASE, 10, int)
>>> +#define	WDIOC_SETACTION		_IOWR(WATCHDOG_IOCTL_BASE, 11, int)
>>> +#define	WDIOC_GETACTION		_IOR(WATCHDOG_IOCTL_BASE, 12, int)
>>> +#define	WDIOC_SETPREACTION	_IOWR(WATCHDOG_IOCTL_BASE, 13, int)
>>> +#define	WDIOC_GETPREACTION	_IOR(WATCHDOG_IOCTL_BASE, 14, int)
>>>   
>>>   #define	WDIOF_UNKNOWN		-1	/* Unknown flag error */
>>>   #define	WDIOS_UNKNOWN		-1	/* Unknown status error */
>>> @@ -54,5 +58,15 @@ struct watchdog_info {
>>>   #define	WDIOS_ENABLECARD	0x0002	/* Turn on the watchdog timer */
>>>   #define	WDIOS_TEMPPANIC		0x0004	/* Kernel panic on temperature trip */
>>>   
>>> +/* Actions for WDIOC_xxxACTION ioctls. */
>>> +#define WDIOA_RESET		0	/* Reset the system. */
>>> +#define WDIOA_POWER_OFF		1	/* Power off the system. */
>>> +#define WDIOA_POWER_CYCLE	2	/* Power cycle the system. */
>>> +
>>> +/* Actions for WDIOC_xxxPREACTION ioctls. */
>>> +#define WDIOP_NONE		0	/* Do nothing. */
>>> +#define WDIOP_NMI		1	/* Issue an NMI. */
>>> +#define WDIOP_SMI		2	/* Issue a system management irq. */
>>> +#define WDIOP_INTERRUPT		3	/* Issue a normal irq. */
>>>   
>>>   #endif /* _UAPI_LINUX_WATCHDOG_H */
>>> -- 
>>> 2.17.1
>>>
> 

