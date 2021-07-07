Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118893BEBCD
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 18:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGGQOn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 12:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhGGQOn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 12:14:43 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F3CC061574
        for <linux-watchdog@vger.kernel.org>; Wed,  7 Jul 2021 09:12:02 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w74so3943004oiw.8
        for <linux-watchdog@vger.kernel.org>; Wed, 07 Jul 2021 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xlnYw1ZInqGSlieaoHdkDN82QSLSIkmHNxFbx9XWRK4=;
        b=DCt3lUBvVmLqb2hA71k3RcRohXvrFyIzXdA7p23SyDGoGQUsUiFLyUhc8DlKqsl9W8
         L8XHz7puxvwYAYEOHpNRBHJIeG9Vl3Jw1Xo+SSUr1VwvRn89WUuCmmaz/1eD8XVB+tM9
         4jbTKxq8lygHckm0tk04VmbKwAR9UDuBgEyy09VE1yoHmCDJ+2EUx3mGibOWPRewaTzW
         EBE/Wm7j2753VTCRmgvxJ9JZFeHErfcYXo8Bbs26rrI5hdM8TtNtNeSjGqLWpOcNC1+b
         wWs/BWEv414Y8mYXBvrvKHUvcfdYhKXe7kN2KGFYHdlxSJRNMJkMeiVX4g+fdBbkAtro
         grsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xlnYw1ZInqGSlieaoHdkDN82QSLSIkmHNxFbx9XWRK4=;
        b=D6cmq6uHI8VejglyZiIbH4k0eC0FounE2A5H4r+fHlCftmrfjYeUz7Pfz4fxKpHNWT
         1MtxM36SFu0Vl5WKMt7WLvN4PCLWyZ31X09Pn3MgnfcvxdaaHbXFUzpsmFK+TPqFiwSp
         9teKSTkxoLCFbwASAuw0+/gsKw0v8/ImKPC4viKSvsqAQyQ8pkmb3sI1v0HmyY7NWF7q
         8eBssRwZgMxJHaJkoeqCmnQ7RRXvEt/PY8dp+uQ4l+N9Fvz7Oz8b0umVIcZYxM690iB7
         iGT/8JyNz7xqcNb2zdyrT3EuO5IWDk/PJ8IUfP27i+nlBlNqsSqa4Yx8RC2PYN3DFlUw
         H9vA==
X-Gm-Message-State: AOAM531d3jmjtnnKgxizZ0xTTQI41emCe8Yj2zxFcaevQ1/3yoVYMyli
        pu+H93Z0B+A0nQBzRWuY7S4=
X-Google-Smtp-Source: ABdhPJyFMjPUwTRS5IM1O4aLDBUWso6NGQSchzTmWMygl8q2orBdHVfZKBxOXcTYo61Ha/bIWzNalA==
X-Received: by 2002:aca:c041:: with SMTP id q62mr303213oif.158.1625674319022;
        Wed, 07 Jul 2021 09:11:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 186sm3586264ooe.28.2021.07.07.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 09:11:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 7 Jul 2021 09:11:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     John Garry <john.garry@huawei.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Re: [report of possible bug] watchdog memory leak
Message-ID: <20210707161157.GA1454516@roeck-us.net>
References: <93808c2b-2246-767d-a2d5-cb2e8b1a99c0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93808c2b-2246-767d-a2d5-cb2e8b1a99c0@huawei.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jul 07, 2021 at 01:38:32PM +0100, John Garry wrote:
> Hi guys,
> 
> Just a heads up in case it's a real issue - I was developing based on Linus'
> tree at 79160a603bdb, and with KMEMLEAK and DEBUG_TEST_DRIVER_REMOVE configs
> enabled, I get these warns:
> 

DEBUG_TEST_DRIVER_REMOVE does odd things, which may well interfer
with reference counting. I don't think this is a spurious issue
(and I have no idea if it is a real issue), but at least for my
part I don't plan to spend any time trying to track this down.
Others, please feel free to jump in.

Thanks,
Guenter

> root@(none)$ [  859.608780] kmemleak: 3 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)
> [  859.608780] kmemleak: 3 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)
> 
> root@(none)$ more /sys/kernel/debug/kmemleak
> unreferenced object 0xffff0020f9810800 (size 1024):
>   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
>   hex dump (first 32 bytes):
>  80 89 48 f8 20 00 ff ff 08 08 81 f9 20 00 ff ff  ..H. ....... ...
>  08 08 81 f9 20 00 ff ff 00 00 00 00 00 00 00 00  .... ...........
>   backtrace:
>  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
>  [<(____ptrval____)>] kmem_cache_alloc+0x198/0x2e0
>  [<(____ptrval____)>] watchdog_dev_register+0x38/0x428
>  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
>  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
>  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
>  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
>  [<(____ptrval____)>] platform_probe+0x8c/0x108
>  [<(____ptrval____)>] really_probe+0x130/0x558
>  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
>  [<(____ptrval____)>] driver_probe_device+0x60/0x150
>  [<(____ptrval____)>] __driver_attach+0xa0/0x160
>  [<(____ptrval____)>] bus_for_each_dev+0xec/0x160
>  [<(____ptrval____)>] driver_attach+0x34/0x48
>  [<(____ptrval____)>] bus_add_driver+0x1b8/0x2c0
>  [<(____ptrval____)>] driver_register+0xc0/0x1e0
> unreferenced object 0xffff0020f8488980 (size 64):
>   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
>   hex dump (first 32 bytes):
>  77 61 74 63 68 64 6f 67 30 00 00 00 00 00 00 00  watchdog0.......
>  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
>  [<(____ptrval____)>] __kmalloc_track_caller+0x190/0x2d0
>  [<(____ptrval____)>] kvasprintf+0xe4/0x1a0
>  [<(____ptrval____)>] kvasprintf_const+0xcc/0x178
>  [<(____ptrval____)>] kobject_set_name_vargs+0x54/0xf0
>  [<(____ptrval____)>] dev_set_name+0xa8/0xd8
>  [<(____ptrval____)>] watchdog_dev_register+0x154/0x428
>  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
>  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
>  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
>  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
>  [<(____ptrval____)>] platform_probe+0x8c/0x108
>  [<(____ptrval____)>] really_probe+0x130/0x558
>  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
>  [<(____ptrval____)>] driver_probe_device+0x60/0x150
>  [<(____ptrval____)>] __driver_attach+0xa0/0x160
> unreferenced object 0xffff00208f9b6000 (size 256):
>   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
>   hex dump (first 32 bytes):
>  00 00 00 00 00 00 00 00 08 60 9b 8f 20 00 ff ff  .........`.. ...
>  08 60 9b 8f 20 00 ff ff f8 47 b2 10 00 80 ff ff  .`.. ....G......
>   backtrace:
>  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
>  [<(____ptrval____)>] kmem_cache_alloc+0x198/0x2e0
>  [<(____ptrval____)>] device_add+0x354/0xcf0
>  [<(____ptrval____)>] cdev_device_add+0x74/0xc0
>  [<(____ptrval____)>] watchdog_dev_register+0x1e0/0x428
>  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
>  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
>  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
>  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
>  [<(____ptrval____)>] platform_probe+0x8c/0x108
>  [<(____ptrval____)>] really_probe+0x130/0x558
>  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
>  [<(____ptrval____)>] driver_probe_device+0x60/0x150
>  [<(____ptrval____)>] __driver_attach+0xa0/0x160
>  [<(____ptrval____)>] bus_for_each_dev+0xec/0x160
>  [<(____ptrval____)>] driver_attach+0x34/0x48
> root@(none)$
> root@(none)$
> root@(none)$
> 
> I didn't see a report elsewhere. Maybe just a transient issue on Linus'
> tree.
> 
> Thanks,
> John
