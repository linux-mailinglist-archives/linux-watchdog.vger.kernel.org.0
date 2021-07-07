Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B578A3BE82D
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 14:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhGGMsa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 08:48:30 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3372 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhGGMsa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 08:48:30 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GKf5K0DChz6M4PB;
        Wed,  7 Jul 2021 20:35:01 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 14:45:47 +0200
Received: from [10.47.24.69] (10.47.24.69) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 7 Jul 2021
 13:45:45 +0100
To:     <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
From:   John Garry <john.garry@huawei.com>
Subject: [report of possible bug] watchdog memory leak
Message-ID: <93808c2b-2246-767d-a2d5-cb2e8b1a99c0@huawei.com>
Date:   Wed, 7 Jul 2021 13:38:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.24.69]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi guys,

Just a heads up in case it's a real issue - I was developing based on 
Linus' tree at 79160a603bdb, and with KMEMLEAK and 
DEBUG_TEST_DRIVER_REMOVE configs enabled, I get these warns:

root@(none)$ [  859.608780] kmemleak: 3 new suspected memory leaks (see 
/sys/kernel/debug/kmemleak)
[  859.608780] kmemleak: 3 new suspected memory leaks (see 
/sys/kernel/debug/kmemleak)

root@(none)$ more /sys/kernel/debug/kmemleak
unreferenced object 0xffff0020f9810800 (size 1024):
   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
   hex dump (first 32 bytes):
  80 89 48 f8 20 00 ff ff 08 08 81 f9 20 00 ff ff  ..H. ....... ...
  08 08 81 f9 20 00 ff ff 00 00 00 00 00 00 00 00  .... ...........
   backtrace:
  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
  [<(____ptrval____)>] kmem_cache_alloc+0x198/0x2e0
  [<(____ptrval____)>] watchdog_dev_register+0x38/0x428
  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
  [<(____ptrval____)>] platform_probe+0x8c/0x108
  [<(____ptrval____)>] really_probe+0x130/0x558
  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
  [<(____ptrval____)>] driver_probe_device+0x60/0x150
  [<(____ptrval____)>] __driver_attach+0xa0/0x160
  [<(____ptrval____)>] bus_for_each_dev+0xec/0x160
  [<(____ptrval____)>] driver_attach+0x34/0x48
  [<(____ptrval____)>] bus_add_driver+0x1b8/0x2c0
  [<(____ptrval____)>] driver_register+0xc0/0x1e0
unreferenced object 0xffff0020f8488980 (size 64):
   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
   hex dump (first 32 bytes):
  77 61 74 63 68 64 6f 67 30 00 00 00 00 00 00 00  watchdog0.......
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
  [<(____ptrval____)>] __kmalloc_track_caller+0x190/0x2d0
  [<(____ptrval____)>] kvasprintf+0xe4/0x1a0
  [<(____ptrval____)>] kvasprintf_const+0xcc/0x178
  [<(____ptrval____)>] kobject_set_name_vargs+0x54/0xf0
  [<(____ptrval____)>] dev_set_name+0xa8/0xd8
  [<(____ptrval____)>] watchdog_dev_register+0x154/0x428
  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
  [<(____ptrval____)>] platform_probe+0x8c/0x108
  [<(____ptrval____)>] really_probe+0x130/0x558
  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
  [<(____ptrval____)>] driver_probe_device+0x60/0x150
  [<(____ptrval____)>] __driver_attach+0xa0/0x160
unreferenced object 0xffff00208f9b6000 (size 256):
   comm "swapper/0", pid 1, jiffies 4294929730 (age 1071.904s)
   hex dump (first 32 bytes):
  00 00 00 00 00 00 00 00 08 60 9b 8f 20 00 ff ff  .........`.. ...
  08 60 9b 8f 20 00 ff ff f8 47 b2 10 00 80 ff ff  .`.. ....G......
   backtrace:
  [<(____ptrval____)>] slab_post_alloc_hook+0x9c/0x270
  [<(____ptrval____)>] kmem_cache_alloc+0x198/0x2e0
  [<(____ptrval____)>] device_add+0x354/0xcf0
  [<(____ptrval____)>] cdev_device_add+0x74/0xc0
  [<(____ptrval____)>] watchdog_dev_register+0x1e0/0x428
  [<(____ptrval____)>] __watchdog_register_device+0x13c/0x400
  [<(____ptrval____)>] watchdog_register_device+0x9c/0x108
  [<(____ptrval____)>] devm_watchdog_register_device+0x50/0xe0
  [<(____ptrval____)>] sbsa_gwdt_probe+0x278/0x488
  [<(____ptrval____)>] platform_probe+0x8c/0x108
  [<(____ptrval____)>] really_probe+0x130/0x558
  [<(____ptrval____)>] __driver_probe_device+0xb8/0x130
  [<(____ptrval____)>] driver_probe_device+0x60/0x150
  [<(____ptrval____)>] __driver_attach+0xa0/0x160
  [<(____ptrval____)>] bus_for_each_dev+0xec/0x160
  [<(____ptrval____)>] driver_attach+0x34/0x48
root@(none)$
root@(none)$
root@(none)$

I didn't see a report elsewhere. Maybe just a transient issue on Linus' 
tree.

Thanks,
John
