Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703B61379DE
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jan 2020 23:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgAJWu7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jan 2020 17:50:59 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45047 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgAJWu7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jan 2020 17:50:59 -0500
Received: by mail-pf1-f196.google.com with SMTP id 195so1808095pfw.11;
        Fri, 10 Jan 2020 14:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9W1zqy5W/eC5lCA3DwolojGy8FFsW1FLy2ypDGCvfG8=;
        b=Rsa5oGe1RUUENaAd+3h0abxuOntEnJ5W3/rU9qAZDN4G5WfzV6XK+XurAiEEbQQcSh
         e1ND3BLpunyWFJTwjuzYhiSALRc3DnOJPqljqOCLSnevhNNyuIPgrYasM+oJ1bA9yv5D
         H6qy9+/JEkybW2+/HUa+JC35cRPoMqLi7v2x5pu7rGFVZej2iTNZxACoJ316X3NTkYHs
         NSRtYF621XpLqisA79lX7gK9aagtLlDctuT3xttFkrKKuTriyoQ/y2+ilkLNRBzeD4Vl
         Lk5NIB4L50at6lXyclGugBTPLz84R2LnHH5/Bb7FbUgMdcaOvjEF6BXmpGih/FxtTHrI
         ARvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9W1zqy5W/eC5lCA3DwolojGy8FFsW1FLy2ypDGCvfG8=;
        b=CFViZqQG6WKV4WalEWD7/lv/oh+nYZXcgJq8z3PuQT3fLQiJ9+VHx3iEW1cVkNxchU
         jO3k+iT1QBMV7EQVv8rLZz6c2wj/n2iChb17CIEMWyhFfymhbBAafWa9GyO9Q8rx/2C1
         NcDidJImHxuy/Bojwl/Gg02HkBKETbjFUn9ErgVs/6MKZAwMERvQ0b9JJ/g4Rf6AE0G6
         MvkEYiySZF671l1o+BfXjyLmVs5fKwjmc1uTCikn5obQEyKiR2iZ9JElSCRKawUQDpjD
         wdiiaTG7suPIijqEd7LECI7bszoYq42N+68qNvCXzLeuRFb+1zknp+P92xvb503CQ3C5
         PcZA==
X-Gm-Message-State: APjAAAUdBpFCc9smPXUOveo0jX1CfvvN2ZZMogCbP3MKADWPdYNcHide
        Bhl8t2tINZGBj5xOTRThzI4=
X-Google-Smtp-Source: APXvYqyRGK0wuZ5QQnoNFzvAgyNBSKHEP2Lx5oZtKSP+pVxhnRutA8LOxeHF7rmbgRjGYCOKJcE9iw==
X-Received: by 2002:aa7:914b:: with SMTP id 11mr6935297pfi.69.1578696657739;
        Fri, 10 Jan 2020 14:50:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q21sm4089472pff.105.2020.01.10.14.50.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 14:50:57 -0800 (PST)
Date:   Fri, 10 Jan 2020 14:50:56 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vladis Dronov <vdronov@redhat.com>
Cc:     linux-watchdog@vger.kernel.org,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, cphealy@gmail.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] watchdog: fix UAF in reboot notifier handling in
 watchdog core code
Message-ID: <20200110225056.GA9703@roeck-us.net>
References: <20200108125347.6067-1-vdronov@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108125347.6067-1-vdronov@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 08, 2020 at 01:53:47PM +0100, Vladis Dronov wrote:
> After the commit 44ea39420fc9 ("drivers/watchdog: make use of
> devm_register_reboot_notifier()") the struct notifier_block reboot_nb in
> the struct watchdog_device is removed from the reboot notifiers chain at
> the time watchdog's chardev is closed. But at least in i6300esb.c case
> reboot_nb is embedded in the struct esb_dev which can be freed on its
> device removal and before the chardev is closed, thus UAF at reboot:
> 
> [    7.728581] esb_probe: esb_dev.watchdog_device ffff91316f91ab28
> ts# uname -r                            note the address ^^^
> 5.5.0-rc5-ae6088-wdog
> ts# ./openwdog0 &
> [1] 696
> ts# opened /dev/watchdog0, sleeping 10s...
> ts# echo 1 > /sys/devices/pci0000\:00/0000\:00\:09.0/remove
> [  178.086079] devres:rel_nodes: dev ffff91317668a0b0 data ffff91316f91ab28
>            esb_dev.watchdog_device.reboot_nb memory is freed here ^^^
> ts# ...woken up
> [  181.459010] devres:rel_nodes: dev ffff913171781000 data ffff913174a1dae8
> [  181.460195] devm_unreg_reboot_notifier: res ffff913174a1dae8 nb ffff91316f91ab78
>                                      attempt to use memory already freed ^^^
> [  181.461063] devm_unreg_reboot_notifier: nb->call 6b6b6b6b6b6b6b6b
> [  181.461243] devm_unreg_reboot_notifier: nb->next 6b6b6b6b6b6b6b6b
>                 freed memory is filled with a slub poison ^^^
> [1]+  Done                    ./openwdog0
> ts# reboot
> [  229.921862] systemd-shutdown[1]: Rebooting.
> [  229.939265] notifier_call_chain: nb ffffffff9c6c2f20 nb->next ffffffff9c6d50c0
> [  229.943080] notifier_call_chain: nb ffffffff9c6d50c0 nb->next 6b6b6b6b6b6b6b6b
> [  229.946054] notifier_call_chain: nb 6b6b6b6b6b6b6b6b INVAL
> [  229.957584] general protection fault: 0000 [#1] SMP
> [  229.958770] CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.5.0-rc5-ae6088-wdog
> [  229.960224] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), ...
> [  229.963288] RIP: 0010:notifier_call_chain+0x66/0xd0
> [  229.969082] RSP: 0018:ffffb20dc0013d88 EFLAGS: 00010246
> [  229.970812] RAX: 000000000000002e RBX: 6b6b6b6b6b6b6b6b RCX: 00000000000008b3
> [  229.972929] RDX: 0000000000000000 RSI: 0000000000000096 RDI: ffffffff9ccc46ac
> [  229.975028] RBP: 0000000000000001 R08: 0000000000000000 R09: 00000000000008b3
> [  229.977039] R10: 0000000000000001 R11: ffffffff9c26c740 R12: 0000000000000000
> [  229.979155] R13: 6b6b6b6b6b6b6b6b R14: 0000000000000000 R15: 00000000fffffffa
> ...   slub_debug=FZP poison ^^^
> [  229.989089] Call Trace:
> [  229.990157]  blocking_notifier_call_chain+0x43/0x59
> [  229.991401]  kernel_restart_prepare+0x14/0x30
> [  229.992607]  kernel_restart+0x9/0x30
> [  229.993800]  __do_sys_reboot+0x1d2/0x210
> [  230.000149]  do_syscall_64+0x3d/0x130
> [  230.001277]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  230.002639] RIP: 0033:0x7f5461bdd177
> [  230.016402] Modules linked in: i6300esb
> [  230.050261] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Fix the crash by reverting 44ea39420fc9 so unregister_reboot_notifier()
> is called when watchdog device is removed. This also makes handling of
> the reboot notifier unified with the handling of the restart handler,
> which is freed with unregister_restart_handler() in the same place.
> 
> Fixes: 44ea39420fc9 ("drivers/watchdog: make use of devm_register_reboot_notifier()")
> Cc: stable@vger.kernel.org # v4.15+
> Signed-off-by: Vladis Dronov <vdronov@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_core.c | 35 +++++++++++++++++++++++++++++++
>  drivers/watchdog/watchdog_dev.c  | 36 +-------------------------------
>  2 files changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 21e8085b848b..861daf4f37b2 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -147,6 +147,25 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>  }
>  EXPORT_SYMBOL_GPL(watchdog_init_timeout);
>  
> +static int watchdog_reboot_notifier(struct notifier_block *nb,
> +				    unsigned long code, void *data)
> +{
> +	struct watchdog_device *wdd;
> +
> +	wdd = container_of(nb, struct watchdog_device, reboot_nb);
> +	if (code == SYS_DOWN || code == SYS_HALT) {
> +		if (watchdog_active(wdd)) {
> +			int ret;
> +
> +			ret = wdd->ops->stop(wdd);
> +			if (ret)
> +				return NOTIFY_BAD;
> +		}
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int watchdog_restart_notifier(struct notifier_block *nb,
>  				     unsigned long action, void *data)
>  {
> @@ -235,6 +254,19 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  		}
>  	}
>  
> +	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> +		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> +
> +		ret = register_reboot_notifier(&wdd->reboot_nb);
> +		if (ret) {
> +			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> +			       wdd->id, ret);
> +			watchdog_dev_unregister(wdd);
> +			ida_simple_remove(&watchdog_ida, id);
> +			return ret;
> +		}
> +	}
> +
>  	if (wdd->ops->restart) {
>  		wdd->restart_nb.notifier_call = watchdog_restart_notifier;
>  
> @@ -289,6 +321,9 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
>  	if (wdd->ops->restart)
>  		unregister_restart_handler(&wdd->restart_nb);
>  
> +	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
> +		unregister_reboot_notifier(&wdd->reboot_nb);
> +
>  	watchdog_dev_unregister(wdd);
>  	ida_simple_remove(&watchdog_ida, wdd->id);
>  }
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 4b2a85438478..8b5c742f24e8 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -38,7 +38,6 @@
>  #include <linux/miscdevice.h>	/* For handling misc devices */
>  #include <linux/module.h>	/* For module stuff/... */
>  #include <linux/mutex.h>	/* For mutexes */
> -#include <linux/reboot.h>	/* For reboot notifier */
>  #include <linux/slab.h>		/* For memory functions */
>  #include <linux/types.h>	/* For standard types (like size_t) */
>  #include <linux/watchdog.h>	/* For watchdog specific items */
> @@ -1097,25 +1096,6 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>  	put_device(&wd_data->dev);
>  }
>  
> -static int watchdog_reboot_notifier(struct notifier_block *nb,
> -				    unsigned long code, void *data)
> -{
> -	struct watchdog_device *wdd;
> -
> -	wdd = container_of(nb, struct watchdog_device, reboot_nb);
> -	if (code == SYS_DOWN || code == SYS_HALT) {
> -		if (watchdog_active(wdd)) {
> -			int ret;
> -
> -			ret = wdd->ops->stop(wdd);
> -			if (ret)
> -				return NOTIFY_BAD;
> -		}
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
>  /*
>   *	watchdog_dev_register: register a watchdog device
>   *	@wdd: watchdog device
> @@ -1134,22 +1114,8 @@ int watchdog_dev_register(struct watchdog_device *wdd)
>  		return ret;
>  
>  	ret = watchdog_register_pretimeout(wdd);
> -	if (ret) {
> +	if (ret)
>  		watchdog_cdev_unregister(wdd);
> -		return ret;
> -	}
> -
> -	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> -
> -		ret = devm_register_reboot_notifier(&wdd->wd_data->dev,
> -						    &wdd->reboot_nb);
> -		if (ret) {
> -			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> -			       wdd->id, ret);
> -			watchdog_dev_unregister(wdd);
> -		}
> -	}
>  
>  	return ret;
>  }
> -- 
> 2.20.1
> 
