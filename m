Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39CA952B6
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 02:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfHTAXS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 20:23:18 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33747 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728580AbfHTAXS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 20:23:18 -0400
Received: by mail-oi1-f195.google.com with SMTP id q10so2770112oij.0
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BGg/6i7zvXuSaYX2rWa6P4G/l4iIgFO7le1TewELpy0=;
        b=WlV0CDrTD2fVfVqE0Zx6XVe1IdPzyB6NaF2YdOgp5ZmGikgdNdbihJZRZdgGwUQLWw
         wfheFze/+xkhiELHN4xccNllBdstTAuAk+uTZy2lg8YJCz2HFIpnWmbKeWHJrRZGezx6
         7VC4KJUEipxwp4AAd1b32UIbs3CXNWyyJxLe+c+gi4wCIoTrEmPNVnsC39Af9BJwX75b
         ptm3+jp77eTGDPeRR7OiARgPTlhxCwoKDOnXvVtPgCexaMwxKvPOAwQnWzCq8EELcenx
         0VvUhUVG0V5Q3iA8EeQDMtC30YNHo2ee6g5/RCyyvn2Ex15BGukt2/lFuhaPTJGxWGaJ
         aw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=BGg/6i7zvXuSaYX2rWa6P4G/l4iIgFO7le1TewELpy0=;
        b=scWZ1lUdvFEL3JefY2vRX/es7Epv+zE1m9fEWU4bwvbJk6P7Ka1WvOyRcdr96dHw7a
         H/NI066tMrZniIU7hjH6USUFi5MxlC8oP9Rfx9r95Qz5aE3ge6OJmjkeNATMtu/2LH76
         +2teoUSeuZdEyLCrrkLDlHfXCdWA0UAQg81VMW3XdiDa3ARZ8E3p6l2SwTl1vcMSzkCI
         DlBkpcN/cmM2VkHgaGK6AosAjmtF21bcM1YTW4Wf2MzHjcXhGZvPMEANd+SHMnqdA/6p
         WSi+xw2A3UHIdbNwzMWbvdk9wDmjj5UCF0n0b8XhR3KVUfK/5vW2C4ixzIX+aXIe7Xg/
         h/pA==
X-Gm-Message-State: APjAAAWQ43Ub4YhDAUU0ak4I0eWA685y4LiV24tUO3Zzp2ZBscMcTkWI
        89UpmCjux+qbkGX3XGzxMzu7SQ==
X-Google-Smtp-Source: APXvYqx5z4DXn84O0AD1tRUjcxfMQv49JYs2N5+DULJh+4npvqOhyTBhyYzJszVXNh5z97GEjdqrkA==
X-Received: by 2002:a05:6808:34c:: with SMTP id j12mr15835672oie.142.1566260592473;
        Mon, 19 Aug 2019 17:23:12 -0700 (PDT)
Received: from minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id v17sm4805659oif.1.2019.08.19.17.23.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 17:23:11 -0700 (PDT)
Date:   Mon, 19 Aug 2019 19:23:09 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190820002309.GI445@minyard.net>
Reply-To: cminyard@mvista.com
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
 <20190819224345.GB8869@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819224345.GB8869@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
> On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > This is for the read data pretimeout governor.
> > 
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> 
> On further thought, I think it would be a bad idea to add this
> functionality: It changes the userspace ABI for accessing the watchdog
> device. Today, when a watchdog device is opened, it does not provide
> read data, it does not hang, and returns immediately. A "cat" from it
> is an easy and quick means to test if a watchdog works.

Umm, why would a "cat" from a watchdog tell you if a watchdog works?
If you want to know if the device exists, I would think that
"if [ -c /dev/watchdog ]..." would be a lot more clear and wouldn't
print a useless error and wouldn't start the watchdog.

That said, this is useful if a userland program wants to know if a
pretimeout occurred.  I'm not sure if anyone is using this with the
IPMI watchdog, but to preserve the IPMI interface function, this
will be needed.

It might be better to set it to immediately return an error if the
pretimeout governer is not one that reads data.  I didn't think of
that before and it will be better to do that.

-corey

> 
> Guenter
> 
> > ---
> >  drivers/watchdog/watchdog_core.c |   3 +
> >  drivers/watchdog/watchdog_dev.c  | 113 +++++++++++++++++++++++++++++++
> >  include/linux/watchdog.h         |   5 ++
> >  3 files changed, 121 insertions(+)
> > 
> > diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> > index 21e8085b848b..80149ac229fc 100644
> > --- a/drivers/watchdog/watchdog_core.c
> > +++ b/drivers/watchdog/watchdog_core.c
> > @@ -216,6 +216,9 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
> >  		return id;
> >  	wdd->id = id;
> >  
> > +	spin_lock_init(&wdd->readlock);
> > +	init_waitqueue_head(&wdd->read_q);
> > +
> >  	ret = watchdog_dev_register(wdd);
> >  	if (ret) {
> >  		ida_simple_remove(&watchdog_ida, id);
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> > index dbd2ad4c9294..8e8304607a8c 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -44,6 +44,8 @@
> >  #include <linux/types.h>	/* For standard types (like size_t) */
> >  #include <linux/watchdog.h>	/* For watchdog specific items */
> >  #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
> > +#include <linux/poll.h>		/* For poll_table/... */
> > +#include <linux/sched/signal.h>	/* For signal_pending */
> >  
> >  #include <uapi/linux/sched/types.h>	/* For struct sched_param */
> >  
> > @@ -929,12 +931,120 @@ static int watchdog_release(struct inode *inode, struct file *file)
> >  	return 0;
> >  }
> >  
> > +static ssize_t watchdog_read(struct file *file,
> > +			     char        __user *buf,
> > +			     size_t      count,
> > +			     loff_t      *ppos)
> > +{
> > +	struct watchdog_core_data *wd_data = file->private_data;
> > +	struct watchdog_device *wdd;
> > +	int err = 0;
> > +	wait_queue_entry_t wait;
> > +	char dummy = 1;
> > +
> > +	if (count <= 0)
> > +		return 0;
> > +
> > +	mutex_lock(&wd_data->lock);
> > +
> > +	wdd = wd_data->wdd;
> > +	if (!wdd)
> > +		goto done;
> > +
> > +	/*
> > +	 * Reading returns if the pretimeout has gone off, and it only does
> > +	 * it once per pretimeout.
> > +	 */
> > +	spin_lock_irq(&wdd->readlock);
> > +	while (!wdd->data_to_read) {
> > +		if (file->f_flags & O_NONBLOCK) {
> > +			err = -EAGAIN;
> > +			goto out;
> > +		}
> > +
> > +		init_waitqueue_entry(&wait, current);
> > +		add_wait_queue(&wdd->read_q, &wait);
> > +		set_current_state(TASK_INTERRUPTIBLE);
> > +		spin_unlock_irq(&wdd->readlock);
> > +		schedule();
> > +		spin_lock_irq(&wdd->readlock);
> > +		remove_wait_queue(&wdd->read_q, &wait);
> > +
> > +		if (signal_pending(current)) {
> > +			err = -ERESTARTSYS;
> > +			goto out;
> > +		}
> > +	}
> > +	dummy = wdd->data_to_read;
> > +	wdd->data_to_read = 0;
> > +
> > + out:
> > +	spin_unlock_irq(&wdd->readlock);
> > +
> > +	if (err == 0) {
> > +		if (copy_to_user(buf, &dummy, 1))
> > +			err = -EFAULT;
> > +		else
> > +			err = 1;
> > +	}
> > +
> > + done:
> > +	mutex_unlock(&wd_data->lock);
> > +
> > +	return err;
> > +}
> > +
> > +static __poll_t watchdog_poll(struct file *file, poll_table *wait)
> > +{
> > +	struct watchdog_core_data *wd_data = file->private_data;
> > +	struct watchdog_device *wdd;
> > +	__poll_t mask = 0;
> > +
> > +	mutex_lock(&wd_data->lock);
> > +
> > +	wdd = wd_data->wdd;
> > +	if (!wdd)
> > +		goto done;
> > +
> > +	poll_wait(file, &wdd->read_q, wait);
> > +
> > +	spin_lock_irq(&wdd->readlock);
> > +	if (wdd->data_to_read)
> > +		mask |= (EPOLLIN | EPOLLRDNORM);
> > +	spin_unlock_irq(&wdd->readlock);
> > +
> > +done:
> > +	mutex_unlock(&wd_data->lock);
> > +	return mask;
> > +}
> > +
> > +static int watchdog_fasync(int fd, struct file *file, int on)
> > +{
> > +	struct watchdog_core_data *wd_data = file->private_data;
> > +	struct watchdog_device *wdd;
> > +	int err = -ENODEV;
> > +
> > +	mutex_lock(&wd_data->lock);
> > +
> > +	wdd = wd_data->wdd;
> > +	if (!wdd)
> > +		goto done;
> > +
> > +	err = fasync_helper(fd, file, on, &wdd->fasync_q);
> > +done:
> > +	mutex_unlock(&wd_data->lock);
> > +	return err;
> > +}
> > +
> >  static const struct file_operations watchdog_fops = {
> >  	.owner		= THIS_MODULE,
> >  	.write		= watchdog_write,
> >  	.unlocked_ioctl	= watchdog_ioctl,
> >  	.open		= watchdog_open,
> >  	.release	= watchdog_release,
> > +	.read		= watchdog_read,
> > +	.poll		= watchdog_poll,
> > +	.fasync		= watchdog_fasync,
> >  };
> >  
> >  static struct miscdevice watchdog_miscdev = {
> > @@ -970,6 +1080,9 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
> >  	if (IS_ERR_OR_NULL(watchdog_kworker))
> >  		return -ENODEV;
> >  
> > +	spin_lock_init(&wdd->readlock);
> > +	init_waitqueue_head(&wdd->read_q);
> > +
> >  	kthread_init_work(&wd_data->work, watchdog_ping_work);
> >  	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	wd_data->timer.function = watchdog_timer_expired;
> > diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> > index 417d9f37077a..e34501a822f0 100644
> > --- a/include/linux/watchdog.h
> > +++ b/include/linux/watchdog.h
> > @@ -117,6 +117,11 @@ struct watchdog_device {
> >  #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
> >  #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
> >  	struct list_head deferred;
> > +
> > +	spinlock_t readlock;
> > +	bool data_to_read;
> > +	struct wait_queue_head read_q;
> > +	struct fasync_struct *fasync_q;
> >  };
> >  
> >  #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)
> > -- 
> > 2.17.1
> > 
