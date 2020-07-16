Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3E2224D2
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jul 2020 16:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgGPOGP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jul 2020 10:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbgGPOGO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jul 2020 10:06:14 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8204EC061755;
        Thu, 16 Jul 2020 07:06:14 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e8so4910767pgc.5;
        Thu, 16 Jul 2020 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qp5LmKixJbTZrd7dvLLYaQtddHIpTsfAo6ECopZweXQ=;
        b=S/y331CQGpGTRoxMTS0W9OaxMezWmiauIc7qwm2Kk6e5FoHlxNUbnIG+jjxsPjKJ+o
         H9Icw1n2MsYTZL4Wx518YJHKh8qPkSosLXgYA3N1BNEdJW584p5o1EaGb1p78YCDEk+2
         lUOX6xwBKTKXkTiUkB04uUQzRisvnEdLR2zpKNr16GoKkE/JPH/FBayOtvUXt8WI7uG0
         EHxdQIqAYrUwpVeSye55o0QYL+ddKQqnYmC95e7/2NfCAJ0ngfw2S5Fe8Q358RVbWEbX
         eA+qMfL/YmT9ieF2GNxzN9rmfn0elmCg2TUQQ0yHToV+yZCt3h84CYKLH01ddM/t31s+
         BF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=qp5LmKixJbTZrd7dvLLYaQtddHIpTsfAo6ECopZweXQ=;
        b=d1MgJiexh7Ncz6xeavlCfiji46WbQf5uW5bUsAGSEZ9QqCU9mWFhR3qY2RzeNXuRXT
         U+HcgjwHyguzgEB6twfJ74tdDMisxq7yLm5lvk/RW0oxMyRTn7lT6nn8oO/T0r7xycBv
         wh5lqxBHZfAgF/17AR1fuZnnb6XJLbTxAojF2oOXVyTo0PVejnr7hNvBZ2p6wDIoWSn3
         BAfnVBlbgzqHEPT+XWr54azpLoWul2ftOm9KdgNS3Yo8bEuWJ7czWsPruaJsGXAu1uLd
         HobYcWz48OCTrWHP5V4hT/6uD1ovgCHi1mnJv8OexwmzDVvPczS64xOSaswsUirdk/8R
         KSug==
X-Gm-Message-State: AOAM531BlJM0600wgyDQNvuRn8UznasEggpb9/UBPhneRLiCM3SOIiM6
        +NKPX9XKguZ1wY5p4RQSqpElXofx
X-Google-Smtp-Source: ABdhPJyvfbpnG8f0g45i/nGY1bR9SBkQBNKXhxsxLK0J2RCTSfbUZAqAHAu5J4ZilTH23h/IOBvGsw==
X-Received: by 2002:a63:5412:: with SMTP id i18mr4520670pgb.63.1594908373956;
        Thu, 16 Jul 2020 07:06:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g5sm286732pjl.31.2020.07.16.07.06.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 07:06:13 -0700 (PDT)
Date:   Thu, 16 Jul 2020 07:06:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexander.sverdlin@nokia.com
Subject: Re: [PATCH v3] watchdog: initialize device before misc_register
Message-ID: <20200716140612.GA130965@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 16, 2020 at 01:32:12PM +0200, krzysztof.sobota@nokia.com wrote:
> When watchdog device is being registered, it calls misc_register that
> makes watchdog available for systemd to open. This is a data race
> scenario, because when device is open it may still have device struct
> not initialized - this in turn causes a crash. This patch moves
> device initialization before misc_register call and it solves the
> problem printed below.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 1 at lib/kobject.c:612 kobject_get+0x50/0x54
> kobject: '(null)' ((ptrval)): is not initialized, yet kobject_get() is being called.
> Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
> CPU: 3 PID: 1 Comm: systemd Tainted: G           O      4.19.113-g2579778-fsm4_k2 #1
> Hardware name: Keystone
> [<c02126c4>] (unwind_backtrace) from [<c020da94>] (show_stack+0x18/0x1c)
> [<c020da94>] (show_stack) from [<c07f87d8>] (dump_stack+0xb4/0xe8)
> [<c07f87d8>] (dump_stack) from [<c0221f70>] (__warn+0xfc/0x114)
> [<c0221f70>] (__warn) from [<c0221fd8>] (warn_slowpath_fmt+0x50/0x74)
> [<c0221fd8>] (warn_slowpath_fmt) from [<c07fd394>] (kobject_get+0x50/0x54)
> [<c07fd394>] (kobject_get) from [<c0602ce8>] (get_device+0x1c/0x24)
> [<c0602ce8>] (get_device) from [<c06961e0>] (watchdog_open+0x90/0xf0)
> [<c06961e0>] (watchdog_open) from [<c06001dc>] (misc_open+0x130/0x17c)
> [<c06001dc>] (misc_open) from [<c0388228>] (chrdev_open+0xec/0x1a8)
> [<c0388228>] (chrdev_open) from [<c037fa98>] (do_dentry_open+0x204/0x3cc)
> [<c037fa98>] (do_dentry_open) from [<c0391e2c>] (path_openat+0x330/0x1148)
> [<c0391e2c>] (path_openat) from [<c0394518>] (do_filp_open+0x78/0xec)
> [<c0394518>] (do_filp_open) from [<c0381100>] (do_sys_open+0x130/0x1f4)
> [<c0381100>] (do_sys_open) from [<c0201000>] (ret_fast_syscall+0x0/0x28)
> Exception stack(0xd2ceffa8 to 0xd2cefff0)
> ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
> ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
> ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
> ---[ end trace 7b16eb105513974f ]---
> 
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 1 at lib/refcount.c:153 kobject_get+0x24/0x54
> refcount_t: increment on 0; use-after-free.
> Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
> CPU: 3 PID: 1 Comm: systemd Tainted: G        W  O      4.19.113-g2579778-fsm4_k2 #1
> Hardware name: Keystone
> [<c02126c4>] (unwind_backtrace) from [<c020da94>] (show_stack+0x18/0x1c)
> [<c020da94>] (show_stack) from [<c07f87d8>] (dump_stack+0xb4/0xe8)
> [<c07f87d8>] (dump_stack) from [<c0221f70>] (__warn+0xfc/0x114)
> [<c0221f70>] (__warn) from [<c0221fd8>] (warn_slowpath_fmt+0x50/0x74)
> [<c0221fd8>] (warn_slowpath_fmt) from [<c07fd368>] (kobject_get+0x24/0x54)
> [<c07fd368>] (kobject_get) from [<c0602ce8>] (get_device+0x1c/0x24)
> [<c0602ce8>] (get_device) from [<c06961e0>] (watchdog_open+0x90/0xf0)
> [<c06961e0>] (watchdog_open) from [<c06001dc>] (misc_open+0x130/0x17c)
> [<c06001dc>] (misc_open) from [<c0388228>] (chrdev_open+0xec/0x1a8)
> [<c0388228>] (chrdev_open) from [<c037fa98>] (do_dentry_open+0x204/0x3cc)
> [<c037fa98>] (do_dentry_open) from [<c0391e2c>] (path_openat+0x330/0x1148)
> [<c0391e2c>] (path_openat) from [<c0394518>] (do_filp_open+0x78/0xec)
> [<c0394518>] (do_filp_open) from [<c0381100>] (do_sys_open+0x130/0x1f4)
> [<c0381100>] (do_sys_open) from [<c0201000>] (ret_fast_syscall+0x0/0x28)
> Exception stack(0xd2ceffa8 to 0xd2cefff0)
> ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
> ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
> ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
> ---[ end trace 7b16eb1055139750 ]---
> 
> Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
> ---
> v1 -> v2:
> * removed Change-Id tag
> * added Review-by tag
> v2 -> v3
> * convert spaces to tabs
> * convert (hopefully) mail to plaintext

Doesn't look like it.

Applying: watchdog: initialize device before misc_register
error: corrupt patch at line 17
Patch failed at 0001 watchdog: initialize device before misc_register
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Guenter

> ---
>  drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 10b2090f3e5e..1c322caecf7f 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -947,6 +947,15 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
> 	if (IS_ERR_OR_NULL(watchdog_kworker))
> 		return -ENODEV;
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
> 	kthread_init_work(&wd_data->work, watchdog_ping_work);
> 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> 	wd_data->timer.function = watchdog_timer_expired;
> @@ -967,15 +976,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
> 		}
> 	}
> 
> -	device_initialize(&wd_data->dev);
> -	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> -	wd_data->dev.class = &watchdog_class;
> -	wd_data->dev.parent = wdd->parent;
> -	wd_data->dev.groups = wdd->groups;
> -	wd_data->dev.release = watchdog_core_data_release;
> -	dev_set_drvdata(&wd_data->dev, wdd);
> -	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> -
> 	/* Fill in the data structures */
> 	cdev_init(&wd_data->cdev, &watchdog_fops);
> 
> --
> 2.14.0
> 
