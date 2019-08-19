Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E0E95023
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 23:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbfHSVuc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 17:50:32 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36090 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfHSVuc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 17:50:32 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so1972468pfi.3
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 14:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cP/ac5cZ4K+/t/B6GlVwoLyef5ZlBax8BXgk/iev8EI=;
        b=mO5qqnl5sw2Y9Tks5UQaeNYgz7RNWuDjGPr7iSoZmVF12ZQXHQ4gxLDB7oxitcklYH
         24oSYlQWhgmad1BWVYr+x4c723zXSYF32eXh6Wz4vtc7j8lBpCVHsaMkqBha6pdQ9C7+
         QnWH/x8oNBEfc3yYHWEcw1aJMJf9D/jatLFspRNsbHUSygU4fFX0XH6pOSWsTwl2lyHE
         dpU0+6BX3eskgFZRaTPAtJMU37F57/p/3D7ufWcpmoF3brBZhWznLHVjHABqDiSy0RDI
         X/+eHQ3hvT31HkS7ICa1KZnVl2zWMPszUnCSnUlFY6fx2vItVqJyNvqVqwnOpLC1FkwU
         VIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cP/ac5cZ4K+/t/B6GlVwoLyef5ZlBax8BXgk/iev8EI=;
        b=sk/C8QEipWFKBe7cltp5bZAh6ou0NJ/zfm9vWLHT/nN8k43G5q1pGufov/FBR4os2O
         EyZD69dtr9g08TSOjqoB2pMeeGWMjzCcGwC/gIZ/5vOP9SPmuuiv8tzAJM1fdV4SxciE
         RX5lbHjiqc1QDsbNujydlsrDQ1HPtxpcmZSefqtVVfVlG8JZ/Qwni464v309NWfqXm9s
         SE3qJMKdld1c50B4hbUzOkijqYW/1duy53Io/yyFrWDtlLatqdFV12sEMFv8829p54VV
         470aZhgh90ZZNZV2ABjV3jZyHh3Ms+Xq2t3GWKonbKxK6esu1NzAA16tYUyufgxchgt8
         0WPg==
X-Gm-Message-State: APjAAAUuXZY1OMSkpPZGTjiKob/RfGpF9fntjroNuq8vE6ai7v8CnSkc
        Ud5vbs6bfMl4Bas7hHjRh/8=
X-Google-Smtp-Source: APXvYqzUJmMBTyfe65RTCoiKxvhNghc/MVJ6A9oRJgL/KZxXbGGWCnnRWEykFoN/UcxLaH6G7lBkZw==
X-Received: by 2002:a17:90a:240e:: with SMTP id h14mr24044782pje.9.1566251431592;
        Mon, 19 Aug 2019 14:50:31 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id s7sm12855356pjn.28.2019.08.19.14.50.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 14:50:31 -0700 (PDT)
Date:   Mon, 19 Aug 2019 14:50:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
Message-ID: <20190819215029.GA7092@roeck-us.net>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819203711.32599-3-minyard@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> This is for the read data pretimeout governor.
> 

I am missing an explanation how this is useful and necessary,
and what problem it solves that can not be solved differently.
For my part I don't immediately see the benefits.

Guenter

> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_core.c |   3 +
>  drivers/watchdog/watchdog_dev.c  | 113 +++++++++++++++++++++++++++++++
>  include/linux/watchdog.h         |   5 ++
>  3 files changed, 121 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 21e8085b848b..80149ac229fc 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -216,6 +216,9 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  		return id;
>  	wdd->id = id;
>  
> +	spin_lock_init(&wdd->readlock);
> +	init_waitqueue_head(&wdd->read_q);
> +
>  	ret = watchdog_dev_register(wdd);
>  	if (ret) {
>  		ida_simple_remove(&watchdog_ida, id);
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index dbd2ad4c9294..8e8304607a8c 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -44,6 +44,8 @@
>  #include <linux/types.h>	/* For standard types (like size_t) */
>  #include <linux/watchdog.h>	/* For watchdog specific items */
>  #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
> +#include <linux/poll.h>		/* For poll_table/... */
> +#include <linux/sched/signal.h>	/* For signal_pending */
>  
>  #include <uapi/linux/sched/types.h>	/* For struct sched_param */
>  
> @@ -929,12 +931,120 @@ static int watchdog_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static ssize_t watchdog_read(struct file *file,
> +			     char        __user *buf,
> +			     size_t      count,
> +			     loff_t      *ppos)
> +{
> +	struct watchdog_core_data *wd_data = file->private_data;
> +	struct watchdog_device *wdd;
> +	int err = 0;
> +	wait_queue_entry_t wait;
> +	char dummy = 1;
> +
> +	if (count <= 0)
> +		return 0;
> +
> +	mutex_lock(&wd_data->lock);
> +
> +	wdd = wd_data->wdd;
> +	if (!wdd)
> +		goto done;
> +
> +	/*
> +	 * Reading returns if the pretimeout has gone off, and it only does
> +	 * it once per pretimeout.
> +	 */
> +	spin_lock_irq(&wdd->readlock);
> +	while (!wdd->data_to_read) {
> +		if (file->f_flags & O_NONBLOCK) {
> +			err = -EAGAIN;
> +			goto out;
> +		}
> +
> +		init_waitqueue_entry(&wait, current);
> +		add_wait_queue(&wdd->read_q, &wait);
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		spin_unlock_irq(&wdd->readlock);
> +		schedule();
> +		spin_lock_irq(&wdd->readlock);
> +		remove_wait_queue(&wdd->read_q, &wait);
> +
> +		if (signal_pending(current)) {
> +			err = -ERESTARTSYS;
> +			goto out;
> +		}
> +	}
> +	dummy = wdd->data_to_read;
> +	wdd->data_to_read = 0;
> +
> + out:
> +	spin_unlock_irq(&wdd->readlock);
> +
> +	if (err == 0) {
> +		if (copy_to_user(buf, &dummy, 1))
> +			err = -EFAULT;
> +		else
> +			err = 1;
> +	}
> +
> + done:
> +	mutex_unlock(&wd_data->lock);
> +
> +	return err;
> +}
> +
> +static __poll_t watchdog_poll(struct file *file, poll_table *wait)
> +{
> +	struct watchdog_core_data *wd_data = file->private_data;
> +	struct watchdog_device *wdd;
> +	__poll_t mask = 0;
> +
> +	mutex_lock(&wd_data->lock);
> +
> +	wdd = wd_data->wdd;
> +	if (!wdd)
> +		goto done;
> +
> +	poll_wait(file, &wdd->read_q, wait);
> +
> +	spin_lock_irq(&wdd->readlock);
> +	if (wdd->data_to_read)
> +		mask |= (EPOLLIN | EPOLLRDNORM);
> +	spin_unlock_irq(&wdd->readlock);
> +
> +done:
> +	mutex_unlock(&wd_data->lock);
> +	return mask;
> +}
> +
> +static int watchdog_fasync(int fd, struct file *file, int on)
> +{
> +	struct watchdog_core_data *wd_data = file->private_data;
> +	struct watchdog_device *wdd;
> +	int err = -ENODEV;
> +
> +	mutex_lock(&wd_data->lock);
> +
> +	wdd = wd_data->wdd;
> +	if (!wdd)
> +		goto done;
> +
> +	err = fasync_helper(fd, file, on, &wdd->fasync_q);
> +done:
> +	mutex_unlock(&wd_data->lock);
> +	return err;
> +}
> +
>  static const struct file_operations watchdog_fops = {
>  	.owner		= THIS_MODULE,
>  	.write		= watchdog_write,
>  	.unlocked_ioctl	= watchdog_ioctl,
>  	.open		= watchdog_open,
>  	.release	= watchdog_release,
> +	.read		= watchdog_read,
> +	.poll		= watchdog_poll,
> +	.fasync		= watchdog_fasync,
>  };
>  
>  static struct miscdevice watchdog_miscdev = {
> @@ -970,6 +1080,9 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>  	if (IS_ERR_OR_NULL(watchdog_kworker))
>  		return -ENODEV;
>  
> +	spin_lock_init(&wdd->readlock);
> +	init_waitqueue_head(&wdd->read_q);
> +
>  	kthread_init_work(&wd_data->work, watchdog_ping_work);
>  	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	wd_data->timer.function = watchdog_timer_expired;
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 417d9f37077a..e34501a822f0 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -117,6 +117,11 @@ struct watchdog_device {
>  #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
>  #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
>  	struct list_head deferred;
> +
> +	spinlock_t readlock;
> +	bool data_to_read;
> +	struct wait_queue_head read_q;
> +	struct fasync_struct *fasync_q;
>  };
>  
>  #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)
> -- 
> 2.17.1
> 
