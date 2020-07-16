Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C7C2224AE
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jul 2020 16:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgGPOA5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jul 2020 10:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728963AbgGPOA4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jul 2020 10:00:56 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22496C061755;
        Thu, 16 Jul 2020 07:00:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id o22so4722674pjw.2;
        Thu, 16 Jul 2020 07:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZXwipsxzhMLk2JJvPXEXMGOn+vKEGM/eqHRemYcvCrg=;
        b=IjNgN8K1TicGwm+foK+8A2I3d8vTB3uyfkdOCPkkmW0MvFVv6JDomDlTOHv98xDMnz
         OzNwiKS0C8vfhj+cWHnK0SHUZ3Ty/l+YIKLnUI5HalHIcuSHBPuLwiQ+xPb36V0o5tLD
         FjqgrVrCzfjSJtKEB2w9VRFYNMXrwz5GH1UNqNPT/IoeCQjCUJggANB10qzc6VVvJPMD
         ERepX3Idy4c7Pv+TS+ELf3AkzPlTb2xeSOBA44cBscKS6ry24rIxDy5/wMs37nmNWkoy
         /2kCOrThbI6fURVWswRR7X6rJj2h8Pq8md2hmcJHJzhAJdHme+o5Gfht5IrIlsgfab9G
         CQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZXwipsxzhMLk2JJvPXEXMGOn+vKEGM/eqHRemYcvCrg=;
        b=qscqr7M6mAdXAjMuv7EtOWWDChQ6oKyawMhQPdmYUSi7Pk10RDD+1wXO7W+AP7W7Tl
         i62mJkfQeQfzJXXeAusB+KLlZ+Qvpvu01/rm95XBnuxrsvSMwqnCdks8miykQquzEKnz
         TpitG+/6sakB1FQI3pDGONGE/zZFzn1leKlR06Yebyw38MxhriixnValLT/WuCgiVuno
         +VGo6oaJMLyxlEs3P/4Xh/H4XeQtZL6MLKdKT8qz6BRr6mEAyLuKUN+qnLx+NiUhVat0
         LNU6gpeyDfbB0G0zwnCRzoOUDXned+G+y0gEGhGhKSBg/onSnA9HJPU9fCTR74LlrlFG
         jasw==
X-Gm-Message-State: AOAM531p6aFQ8jO8eB1ziSnUWhl0SQdeIPNseOFcwKnY0WdTbKfwWOWr
        IZwMZinnYwlpPMfJ2SCzWq9pzyCG
X-Google-Smtp-Source: ABdhPJxu7WUcmeSgdm290onW6kxQX/qiQThjX0j5m9YDfH+DJyLfGowLlNqhJ5NcJCe7FwB4Ei3NrQ==
X-Received: by 2002:a17:90a:21c3:: with SMTP id q61mr5077345pjc.207.1594908055533;
        Thu, 16 Jul 2020 07:00:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n9sm234117pjo.53.2020.07.16.07.00.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 07:00:54 -0700 (PDT)
Date:   Thu, 16 Jul 2020 07:00:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexander.sverdlin@nokia.com
Subject: Re: [PATCH v3] watchdog: initialize device before misc_register
Message-ID: <20200716140053.GA258176@roeck-us.net>
References: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
 <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
 <55fa2e05-9a99-b205-2dad-b797786af22a@nokia.com>
 <1f20e45d-aba5-6226-27f2-cb6438cc224e@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f20e45d-aba5-6226-27f2-cb6438cc224e@nokia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PLEASE PLEASE PLEASE _never_ send a new version of a patch as reply
to a previous one. All this ensures it that it won't find its way
into patchwork, which I and others use to track patches.
This means such patches will likely get lost.

Guenter

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
