Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96E3D0545
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2019 03:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfJIBfd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Oct 2019 21:35:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32947 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbfJIBfc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Oct 2019 21:35:32 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so532421pfl.0
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Oct 2019 18:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BOnJ+/lH1CqLAFpA6qeISEiryp24iRHZVMVEJUZOCVI=;
        b=ma/BDVwaORKhY98pxfwlVhxpp9+VNu6gXVEpUY483Rt5u+VrfERDfDK+3BIH6eKg9x
         Cte16h05JhYt3kG7UH3yoIAXgU+usUywgJSWdZZ+nAF5sU2x5r3b1GoxPIvSSIKJjSpK
         GugzxC56SBjEjIBuU5uHyuckouJ4Dl3KiN6HyBrFVS6PLEV26pRPWMjtBxI0fmaCVqpN
         alMqjxWY06NPlyvGKJ4+nf4NuAeiK2a5M35t+BjffNwnFE5IIEeegPM6FYRBjRayqgUf
         xxxjU4UCf2SqfsxIvlztK9X7rNNJMyISYcEk+Qh6oUWcWSBDGP6kUj6oCtiHhz685AGT
         eMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BOnJ+/lH1CqLAFpA6qeISEiryp24iRHZVMVEJUZOCVI=;
        b=QNToi4cu7lwiNv6ecuAp+D0+3Oy83OGPYZuRXPpUoh3fSVi7N982Ri+s2y4atX7+/z
         TeUrYvfEmAU3/0LdvcXJOF5/qfZAyslyyWnTSNckNmfAZTRCs4Bwkte5AsDwYJ8oxJ92
         huyYoe+CzcSbodPXxwfBEJpyIuMejY06p/rQbAWWdVxIP/sCtu3CWVV8U00VchWb3B4d
         pxzITUu5Z3AapteQkeK1VBd1l11AYLmrUpcUcMjJErEINgyGBNRjxdQSZifFRm5A6ie+
         AGd/G7A6Rp8BCP7PEquzIiLlw9Lvw8nK1bYB+/K3serjQUFIyzCULba2FreUi8WTv+WV
         lM0Q==
X-Gm-Message-State: APjAAAUiyUcabRaDfWoO1FMvvsaZgO2RzP0/jlzlAwG/LBKToiygSVfO
        OfhqDsN51gs3KPa11K2cIok=
X-Google-Smtp-Source: APXvYqwMqker9RbHmdn+IaX4HHUMKP+nELKBpBitdla6Gt6ubq3g+eLaK6b/yzBmn8lZbDINfsmbVA==
X-Received: by 2002:a17:90a:8d13:: with SMTP id c19mr1000940pjo.63.1570584931639;
        Tue, 08 Oct 2019 18:35:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g35sm376764pgg.42.2019.10.08.18.35.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 18:35:30 -0700 (PDT)
Subject: Re: [PATCH] watchdog: Fix the race between the release of
 watchdog_core_data and cdev
To:     Kevin Hao <haokexin@gmail.com>, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20191008112934.29669-1-haokexin@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <372988b1-f016-53a2-45ec-01a408a7ec86@roeck-us.net>
Date:   Tue, 8 Oct 2019 18:35:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008112934.29669-1-haokexin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/8/19 4:29 AM, Kevin Hao wrote:
> The struct cdev is embedded in the struct watchdog_core_data. In the
> current code, we manage the watchdog_core_data with a kref, but the
> cdev is manged by a kobject. There is no any relationship between
> this kref and kobject. So it is possible that the watchdog_core_data is
> freed before the cdev is entirely released. We can easily get the
> following call trace with CONFIG_DEBUG_KOBJECT_RELEASE and
> CONFIG_DEBUG_OBJECTS_TIMERS enabled.
>    ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x38
>    WARNING: CPU: 23 PID: 1028 at lib/debugobjects.c:481 debug_print_object+0xb0/0xf0
>    Modules linked in: softdog(-) deflate ctr twofish_generic twofish_common camellia_generic serpent_generic blowfish_generic blowfish_common cast5_generic cast_common cmac xcbc af_key sch_fq_codel openvswitch nsh nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
>    CPU: 23 PID: 1028 Comm: modprobe Not tainted 5.3.0-next-20190924-yoctodev-standard+ #180
>    Hardware name: Marvell OcteonTX CN96XX board (DT)
>    pstate: 00400009 (nzcv daif +PAN -UAO)
>    pc : debug_print_object+0xb0/0xf0
>    lr : debug_print_object+0xb0/0xf0
>    sp : ffff80001cbcfc70
>    x29: ffff80001cbcfc70 x28: ffff800010ea2128
>    x27: ffff800010bad000 x26: 0000000000000000
>    x25: ffff80001103c640 x24: ffff80001107b268
>    x23: ffff800010bad9e8 x22: ffff800010ea2128
>    x21: ffff000bc2c62af8 x20: ffff80001103c600
>    x19: ffff800010e867d8 x18: 0000000000000060
>    x17: 0000000000000000 x16: 0000000000000000
>    x15: ffff000bd7240470 x14: 6e6968207473696c
>    x13: 5f72656d6974203a x12: 6570797420746365
>    x11: 6a626f2029302065 x10: 7461747320657669
>    x9 : 7463612820657669 x8 : 3378302f3078302b
>    x7 : 0000000000001d7a x6 : ffff800010fd5889
>    x5 : 0000000000000000 x4 : 0000000000000000
>    x3 : 0000000000000000 x2 : ffff000bff948548
>    x1 : 276a1c9e1edc2300 x0 : 0000000000000000
>    Call trace:
>     debug_print_object+0xb0/0xf0
>     debug_check_no_obj_freed+0x1e8/0x210
>     kfree+0x1b8/0x368
>     watchdog_cdev_unregister+0x88/0xc8
>     watchdog_dev_unregister+0x38/0x48
>     watchdog_unregister_device+0xa8/0x100
>     softdog_exit+0x18/0xfec4 [softdog]
>     __arm64_sys_delete_module+0x174/0x200
>     el0_svc_handler+0xd0/0x1c8
>     el0_svc+0x8/0xc
> 
> This is a common issue when using cdev embedded in a struct.
> Fortunately, we already have a mechanism to solve this kind of issue.
> Please see commit 233ed09d7fda ("chardev: add helper function to
> register char devs with a struct device") for more detail.
> 
> In this patch, we choose to embed the struct device into the
> watchdog_core_data, and use the API provided by the commit 233ed09d7fda
> to make sure that the release of watchdog_core_data and cdev are
> in sequence.
> 
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Nice job. Looks good to me.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Wim, any chance you can add this patch to your -next branch sometime soon ?
It should get some bake time before being pushed upstream.

Thanks,
Guenter

> ---
>   drivers/watchdog/watchdog_dev.c | 70 +++++++++++++++++++----------------------
>   1 file changed, 32 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index dbd2ad4c9294..55db4c95f0e8 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -34,7 +34,6 @@
>   #include <linux/init.h>		/* For __init/__exit/... */
>   #include <linux/hrtimer.h>	/* For hrtimers */
>   #include <linux/kernel.h>	/* For printk/panic/... */
> -#include <linux/kref.h>		/* For data references */
>   #include <linux/kthread.h>	/* For kthread_work */
>   #include <linux/miscdevice.h>	/* For handling misc devices */
>   #include <linux/module.h>	/* For module stuff/... */
> @@ -52,14 +51,14 @@
>   
>   /*
>    * struct watchdog_core_data - watchdog core internal data
> - * @kref:	Reference count.
> + * @dev:	The watchdog's internal device
>    * @cdev:	The watchdog's Character device.
>    * @wdd:	Pointer to watchdog device.
>    * @lock:	Lock for watchdog core.
>    * @status:	Watchdog core internal status bits.
>    */
>   struct watchdog_core_data {
> -	struct kref kref;
> +	struct device dev;
>   	struct cdev cdev;
>   	struct watchdog_device *wdd;
>   	struct mutex lock;
> @@ -839,7 +838,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
>   	file->private_data = wd_data;
>   
>   	if (!hw_running)
> -		kref_get(&wd_data->kref);
> +		get_device(&wd_data->dev);
>   
>   	/*
>   	 * open_timeout only applies for the first open from
> @@ -860,11 +859,11 @@ static int watchdog_open(struct inode *inode, struct file *file)
>   	return err;
>   }
>   
> -static void watchdog_core_data_release(struct kref *kref)
> +static void watchdog_core_data_release(struct device *dev)
>   {
>   	struct watchdog_core_data *wd_data;
>   
> -	wd_data = container_of(kref, struct watchdog_core_data, kref);
> +	wd_data = container_of(dev, struct watchdog_core_data, dev);
>   
>   	kfree(wd_data);
>   }
> @@ -924,7 +923,7 @@ static int watchdog_release(struct inode *inode, struct file *file)
>   	 */
>   	if (!running) {
>   		module_put(wd_data->cdev.owner);
> -		kref_put(&wd_data->kref, watchdog_core_data_release);
> +		put_device(&wd_data->dev);
>   	}
>   	return 0;
>   }
> @@ -943,17 +942,22 @@ static struct miscdevice watchdog_miscdev = {
>   	.fops		= &watchdog_fops,
>   };
>   
> +static struct class watchdog_class = {
> +	.name =		"watchdog",
> +	.owner =	THIS_MODULE,
> +	.dev_groups =	wdt_groups,
> +};
> +
>   /*
>    *	watchdog_cdev_register: register watchdog character device
>    *	@wdd: watchdog device
> - *	@devno: character device number
>    *
>    *	Register a watchdog character device including handling the legacy
>    *	/dev/watchdog node. /dev/watchdog is actually a miscdevice and
>    *	thus we set it up like that.
>    */
>   
> -static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
> +static int watchdog_cdev_register(struct watchdog_device *wdd)
>   {
>   	struct watchdog_core_data *wd_data;
>   	int err;
> @@ -961,7 +965,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>   	wd_data = kzalloc(sizeof(struct watchdog_core_data), GFP_KERNEL);
>   	if (!wd_data)
>   		return -ENOMEM;
> -	kref_init(&wd_data->kref);
>   	mutex_init(&wd_data->lock);
>   
>   	wd_data->wdd = wdd;
> @@ -990,23 +993,33 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>   		}
>   	}
>   
> +	device_initialize(&wd_data->dev);
> +	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> +	wd_data->dev.class = &watchdog_class;
> +	wd_data->dev.parent = wdd->parent;
> +	wd_data->dev.groups = wdd->groups;
> +	wd_data->dev.release = watchdog_core_data_release;
> +	dev_set_drvdata(&wd_data->dev, wdd);
> +	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> +
>   	/* Fill in the data structures */
>   	cdev_init(&wd_data->cdev, &watchdog_fops);
> -	wd_data->cdev.owner = wdd->ops->owner;
>   
>   	/* Add the device */
> -	err = cdev_add(&wd_data->cdev, devno, 1);
> +	err = cdev_device_add(&wd_data->cdev, &wd_data->dev);
>   	if (err) {
>   		pr_err("watchdog%d unable to add device %d:%d\n",
>   			wdd->id,  MAJOR(watchdog_devt), wdd->id);
>   		if (wdd->id == 0) {
>   			misc_deregister(&watchdog_miscdev);
>   			old_wd_data = NULL;
> -			kref_put(&wd_data->kref, watchdog_core_data_release);
> +			put_device(&wd_data->dev);
>   		}
>   		return err;
>   	}
>   
> +	wd_data->cdev.owner = wdd->ops->owner;
> +
>   	/* Record time of most recent heartbeat as 'just before now'. */
>   	wd_data->last_hw_keepalive = ktime_sub(ktime_get(), 1);
>   	watchdog_set_open_deadline(wd_data);
> @@ -1017,7 +1030,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd, dev_t devno)
>   	 */
>   	if (watchdog_hw_running(wdd)) {
>   		__module_get(wdd->ops->owner);
> -		kref_get(&wd_data->kref);
> +		get_device(&wd_data->dev);
>   		if (handle_boot_enabled)
>   			hrtimer_start(&wd_data->timer, 0, HRTIMER_MODE_REL);
>   		else
> @@ -1040,7 +1053,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>   {
>   	struct watchdog_core_data *wd_data = wdd->wd_data;
>   
> -	cdev_del(&wd_data->cdev);
> +	cdev_device_del(&wd_data->cdev, &wd_data->dev);
>   	if (wdd->id == 0) {
>   		misc_deregister(&watchdog_miscdev);
>   		old_wd_data = NULL;
> @@ -1059,15 +1072,9 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>   	hrtimer_cancel(&wd_data->timer);
>   	kthread_cancel_work_sync(&wd_data->work);
>   
> -	kref_put(&wd_data->kref, watchdog_core_data_release);
> +	put_device(&wd_data->dev);
>   }
>   
> -static struct class watchdog_class = {
> -	.name =		"watchdog",
> -	.owner =	THIS_MODULE,
> -	.dev_groups =	wdt_groups,
> -};
> -
>   static int watchdog_reboot_notifier(struct notifier_block *nb,
>   				    unsigned long code, void *data)
>   {
> @@ -1098,27 +1105,14 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
>   
>   int watchdog_dev_register(struct watchdog_device *wdd)
>   {
> -	struct device *dev;
> -	dev_t devno;
>   	int ret;
>   
> -	devno = MKDEV(MAJOR(watchdog_devt), wdd->id);
> -
> -	ret = watchdog_cdev_register(wdd, devno);
> +	ret = watchdog_cdev_register(wdd);
>   	if (ret)
>   		return ret;
>   
> -	dev = device_create_with_groups(&watchdog_class, wdd->parent,
> -					devno, wdd, wdd->groups,
> -					"watchdog%d", wdd->id);
> -	if (IS_ERR(dev)) {
> -		watchdog_cdev_unregister(wdd);
> -		return PTR_ERR(dev);
> -	}
> -
>   	ret = watchdog_register_pretimeout(wdd);
>   	if (ret) {
> -		device_destroy(&watchdog_class, devno);
>   		watchdog_cdev_unregister(wdd);
>   		return ret;
>   	}
> @@ -1126,7 +1120,8 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>   	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>   		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>   
> -		ret = devm_register_reboot_notifier(dev, &wdd->reboot_nb);
> +		ret = devm_register_reboot_notifier(&wdd->wd_data->dev,
> +						    &wdd->reboot_nb);
>   		if (ret) {
>   			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
>   			       wdd->id, ret);
> @@ -1148,7 +1143,6 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>   void watchdog_dev_unregister(struct watchdog_device *wdd)
>   {
>   	watchdog_unregister_pretimeout(wdd);
> -	device_destroy(&watchdog_class, wdd->wd_data->cdev.dev);
>   	watchdog_cdev_unregister(wdd);
>   }
>   
> 

