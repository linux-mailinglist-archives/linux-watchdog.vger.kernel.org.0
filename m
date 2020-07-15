Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D5D221081
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jul 2020 17:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgGOPJ1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jul 2020 11:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgGOPJ1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jul 2020 11:09:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4918C061755;
        Wed, 15 Jul 2020 08:09:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so3210416pgc.8;
        Wed, 15 Jul 2020 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=phVaHFANxRllb9nyceTuQHsWmXiEjHE/mPMRWFZoazA=;
        b=ez2O+zbFJCW1hWsGudk3iaiKLLTY7vPMTncb2lloUoNVw/B6aiofEFOr84DKPY70KS
         a4nE9O9S5CG7dqD79+cBlB9e2GMgHOrvRTQrEd61/lq6wYBtauKXx4eXJookEMoaYyiK
         PkoMRxFb2TDB1hCLYW7xSr/VHVdcb5X9KkzPrjTu9Y2o3K0BTHmSYxPGyxernWQUrO6D
         bsPNf7KraKUAuPO8cYg1GfEtn+b1OWnzCxzZFAagIaYalK5APOMmDNqdquy9vRpk++T6
         nTxluZoM3sucpZlfq3umQTlP+AFoPbZsIvWvq+9CvfzVxYmUipLSTIrxc1yWuNebRso3
         n5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=phVaHFANxRllb9nyceTuQHsWmXiEjHE/mPMRWFZoazA=;
        b=mMD6ef9FcEBkNUh3mei2jaO5cM57YTCCTEhas4kWUCRSqRDdV6GYGaZnL5bOWUZFaL
         tkENqzB0d42R3Zvg09eGq5iEZRDCnnh4bWzeMWo1R3wceiRfo8pMNhNsnHuXocJAmza8
         AaLXxY726yEbN2HCnyKQjxqI0PF3wlpdliaZLuxIZkE7q0owRv6Ff8aRjtL02ZNZjgOY
         4/4nGbgd52caZNqJrfGQKVwRRnFQ6kwcEazn23SV8f+8kTBa1t1DKTwpiVLYDYQWkIKz
         JAIZTap3GsCzJBavB/94Wtdx3Gne6R9c7UGJ/zArt/R1S8xjnS7BY7hufRMNMeeMq04w
         8Ofg==
X-Gm-Message-State: AOAM530ov2fa6ojGDSyLQLBAJi5a7aO/s7UOcUCz8qjzDseyMFJ4Qe/k
        ljBBbOdw/Tlg7bnnp0nwUk38DF0Q
X-Google-Smtp-Source: ABdhPJzhKPl9cGPTBozn0qUnVtwTozERxZkfSPZAlqJ6Uts+VKBuMTEMI+a1JnYT45ixKqjHtedLSw==
X-Received: by 2002:a63:e114:: with SMTP id z20mr136819pgh.300.1594825766453;
        Wed, 15 Jul 2020 08:09:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o10sm2345620pjs.27.2020.07.15.08.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:09:25 -0700 (PDT)
Subject: Re: [PATCH] watchdog: initialize device before misc_register
To:     "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     alexander.sverdlin@nokia.com
References: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
Date:   Wed, 15 Jul 2020 08:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/15/20 6:57 AM, krzysztof.sobota@nokia.com wrote:
> From: Krzysztof Sobota <krzysztof.sobota@nokia.com>
> Date: Wed, 15 Jul 2020 13:13:42 +0200
> Subject: [PATCH] watchdog: initialize device before misc_register
> 
> When watchdog device is being registered, it calls misc_register that
> makes watchdog available for systemd to open. This is a data race
> scenario, because when device is open it may still have device struct
> not initialized - this in turn causes a crash. This patch moves
> device initialization before misc_register call and it solves the
> problem printed below.
> 
A cleaner fix would probably be to move misc device registration
after cdev registration, but then handling misc device registration
failures would be much more complicated. With that,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 1 at lib/kobject.c:612 kobject_get+0x50/0x54
> kobject: '(null)' ((ptrval)): is not initialized, yet kobject_get() is being called.
> Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
> CPU: 3 PID: 1 Comm: systemd Tainted: G           O 4.19.113-g2579778-fsm4_k2 #1
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
> ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
> ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
> ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
> ---[ end trace 7b16eb105513974f ]---
> 
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 1 at lib/refcount.c:153 kobject_get+0x24/0x54
> refcount_t: increment on 0; use-after-free.
> Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
> CPU: 3 PID: 1 Comm: systemd Tainted: G        W  O 4.19.113-g2579778-fsm4_k2 #1
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
> ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
> ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
> ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
> ---[ end trace 7b16eb1055139750 ]---
> 
> Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
> Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
> 
> Change-Id: I3b85f615d67ab5b8dc6c5c2dc42efd236d502d09
> ---
>  drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 10b2090f3e5e..1c322caecf7f 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -947,6 +947,15 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>         if (IS_ERR_OR_NULL(watchdog_kworker))
>                 return -ENODEV;
> 
> +       device_initialize(&wd_data->dev);
> +       wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> +       wd_data->dev.class = &watchdog_class;
> +       wd_data->dev.parent = wdd->parent;
> +       wd_data->dev.groups = wdd->groups;
> +       wd_data->dev.release = watchdog_core_data_release;
> +       dev_set_drvdata(&wd_data->dev, wdd);
> +       dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> +
>         kthread_init_work(&wd_data->work, watchdog_ping_work);
>         hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>         wd_data->timer.function = watchdog_timer_expired;
> @@ -967,15 +976,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>                 }
>         }
> 
> -       device_initialize(&wd_data->dev);
> -       wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> -       wd_data->dev.class = &watchdog_class;
> -       wd_data->dev.parent = wdd->parent;
> -       wd_data->dev.groups = wdd->groups;
> -       wd_data->dev.release = watchdog_core_data_release;
> -       dev_set_drvdata(&wd_data->dev, wdd);
> -       dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
> -
>         /* Fill in the data structures */
>         cdev_init(&wd_data->cdev, &watchdog_fops);
> 
> -- 
> 2.14.0
> 

