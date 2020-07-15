Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AD2220E90
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jul 2020 15:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgGON5l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jul 2020 09:57:41 -0400
Received: from mail-eopbgr00113.outbound.protection.outlook.com ([40.107.0.113]:14926
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727822AbgGON5k (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jul 2020 09:57:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LO1U8T4GvzdgJ9kesGD5aNrqasT1YhCRn6BsSy/zwcexFQc9jK+GQ9DiiS9oWWp1u2GBCOEqFVoWeI4wM/KIqpxTg2zjCNhBqBcQGQFqzR2/NEdURZRpDupQ7cWPRJqJDHad21j8HXi1FSoUQxgf8S1s+/VOOdt1vHSh2MASqfK9CrD8kvIv7GAEqZPcrSwAl9R2rnq2W8snfmpWWduCJkv6YYBOW4Ls6pt++Gcic9IojYpDLu4UUkjaOdyv+8hi4ObOe7nh2WxMDUSq6PT6m+PnFP2IEuuEyxY3Y31p0q9RkUZ9Ihj3gthpWe+741kSv5F/TycRcMdbCpF8MtrwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4iG4ZUkoFzI8nCmDk78j/12ZBjMal55xx+Eu/S9sHY=;
 b=HkdXUKXeqTbV5JOBFxnBZB/uuExpASEnbN4+xdpqpefO8L49Vs3KgqhnevPzeexbfCJRP1kZzTiYJi4IWjZwK5E27MoSHXO4qKrR3i2keqTNDxzMIfytSQZHZ/uFopkb95s3v+BQ7f2BvtuoCkCCxRQpTNg1B5zoUCoIkEaqWJwjMqMsDwNV0UyVJgUAgVeMiyrSF134MtvcyAWp3MEYkBbuJstuPiIoHiCcQKV1K+ppi3cx1SwwF5r3ITI6HOJpBLm0RoCk9VZT4hrunKi+nwC/K24OS3KC8KS67PLRwIo/3bG8Ud5ZdaX4QxGXDGbQ88I1WwN/G3yUuAB25Aw6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4iG4ZUkoFzI8nCmDk78j/12ZBjMal55xx+Eu/S9sHY=;
 b=BNVGojB6Onar4O8qkJOteVVj4KRKOuqtoBndFAopxXyrKvHg2q7uh1GiU7W41Jt6l9IyVKWmv2miQbfcpJtPUSstf/9SA1mzX5bX4lmGoSu7o8rSj1dx4cJw8b6QnJRwJSLIFLOebvsk09exO5VoieoZ6S47u9q/XF3PlqFsEXg=
Authentication-Results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=nokia.com;
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com (2603:10a6:10:70::33)
 by DB6PR0701MB2455.eurprd07.prod.outlook.com (2603:10a6:4:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.10; Wed, 15 Jul
 2020 13:57:37 +0000
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9]) by DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9%6]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 13:57:37 +0000
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     krzysztof.sobota@nokia.com, alexander.sverdlin@nokia.com
From:   "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>
Subject: [PATCH] watchdog: initialize device before misc_register
Message-ID: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
Date:   Wed, 15 Jul 2020 15:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::32) To DB7PR07MB5356.eurprd07.prod.outlook.com
 (2603:10a6:10:70::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.144.127.89] (131.228.2.3) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Wed, 15 Jul 2020 13:57:33 +0000
X-Originating-IP: [131.228.2.3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 888c0f7a-582a-4883-2ed2-08d828c707e6
X-MS-TrafficTypeDiagnostic: DB6PR0701MB2455:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0701MB24551E60D758DCD79BB8851E937E0@DB6PR0701MB2455.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwUL5uLUYPtiGpWLDOGh7hbgwiO6EflqjKMvXXR/yFyTCQb0h42TwxJ5m+6A6Nce83L3c+Nbo++H88cIQeJAvCvEkvr7zPtQ0q4Oy7xZBF5rv7RFX97Bidr5i5hCq/GgewC2qZA0paHMUUUSZ1aDOD6GEwfHPw5j2Dre1/d2YFoUxEvE89l5BQBjw+whFNyDBV2e66iRX7Vbw0FbDPyLIu0gdB+g8UK2OWPMDqWWmBytXE3yxNMcu4pv1ke57xr4JKknOUQLHiCyDkbPNQMqqT+t8YPBesTnX/+APgytaZ2EkYmc1GPcaRQPTUCZVQ5GkklycEGnAjS8w0BsdFKguOGP5zJ9iVUN0oYCSaaJsyyEWYwk7OvcWMlYqkCwVW6p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB5356.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(86362001)(36756003)(316002)(66556008)(16576012)(31696002)(6666004)(66476007)(52116002)(26005)(5660300002)(6486002)(2616005)(956004)(107886003)(45080400002)(8936002)(53546011)(8676002)(66946007)(478600001)(16526019)(2906002)(83380400001)(4326008)(31686004)(186003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 811kuf/2TkPx4z2SpWKMPFj8GpFU00OduxpLG4vRZNoRV8GZJQ0udSknVJzTe63TKDs0GiY9cxdTn9KlZqXInkFWedVqU5l2jrt5Z/1ce+qzv/vYyTr9KgxEUrV85iQq8yTZYEQDacxKzuErX/513RrCGL5cuZkHN3YoFnmvkM6tkMm7gIDn0BjFRPhvdfwJvG6Q3ClwYmOnaE6vEIAmp+bcFC2Ot2IXcp8ySBUlX31ujoGpAW3pbr2HfJSyiMWVW/8rdTOOHSixGgEKLAaYCjZCdvbIfOgAW5CtLm8ljD90v5gnk+NerLs2JVAH5roxDG9wupzTB4+3hxDUsxj2OVLIK97tYty1BGaN7mkH5heujTJv9lFwHigp3WGVz+JCWCeWwnYSIsxGQOD28aWrU7rJeKtl+T38cF9quqIFfUdu3AzRrleb3753AUpn32h9LwIuXU04ojp2gNA8fwOeqKHqYv/SR256Za0KtZeAaUA=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888c0f7a-582a-4883-2ed2-08d828c707e6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB5356.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 13:57:37.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkLy8T4VPTBR5rtiBsmRiQObp01lPT1+DK0hILIn9YtLZr0CgVKukVjK/GownEY+kbNiWe5n2u6D/CX5frGTNOHj9SQL8+R52e/ksqSuNSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2455
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Krzysztof Sobota <krzysztof.sobota@nokia.com>
Date: Wed, 15 Jul 2020 13:13:42 +0200
Subject: [PATCH] watchdog: initialize device before misc_register

When watchdog device is being registered, it calls misc_register that
makes watchdog available for systemd to open. This is a data race
scenario, because when device is open it may still have device struct
not initialized - this in turn causes a crash. This patch moves
device initialization before misc_register call and it solves the
problem printed below.

------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at lib/kobject.c:612 kobject_get+0x50/0x54
kobject: '(null)' ((ptrval)): is not initialized, yet kobject_get() is 
being called.
Modules linked in: k2_reset_status(O) davinci_wdt(+) 
sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) 
fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) 
evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge 
stp llc nvrd_checksum(O) ipv6
CPU: 3 PID: 1 Comm: systemd Tainted: G           O 
4.19.113-g2579778-fsm4_k2 #1
Hardware name: Keystone
[<c02126c4>] (unwind_backtrace) from [<c020da94>] (show_stack+0x18/0x1c)
[<c020da94>] (show_stack) from [<c07f87d8>] (dump_stack+0xb4/0xe8)
[<c07f87d8>] (dump_stack) from [<c0221f70>] (__warn+0xfc/0x114)
[<c0221f70>] (__warn) from [<c0221fd8>] (warn_slowpath_fmt+0x50/0x74)
[<c0221fd8>] (warn_slowpath_fmt) from [<c07fd394>] (kobject_get+0x50/0x54)
[<c07fd394>] (kobject_get) from [<c0602ce8>] (get_device+0x1c/0x24)
[<c0602ce8>] (get_device) from [<c06961e0>] (watchdog_open+0x90/0xf0)
[<c06961e0>] (watchdog_open) from [<c06001dc>] (misc_open+0x130/0x17c)
[<c06001dc>] (misc_open) from [<c0388228>] (chrdev_open+0xec/0x1a8)
[<c0388228>] (chrdev_open) from [<c037fa98>] (do_dentry_open+0x204/0x3cc)
[<c037fa98>] (do_dentry_open) from [<c0391e2c>] (path_openat+0x330/0x1148)
[<c0391e2c>] (path_openat) from [<c0394518>] (do_filp_open+0x78/0xec)
[<c0394518>] (do_filp_open) from [<c0381100>] (do_sys_open+0x130/0x1f4)
[<c0381100>] (do_sys_open) from [<c0201000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xd2ceffa8 to 0xd2cefff0)
ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 
00000000
ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 
bed7bb78
ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
---[ end trace 7b16eb105513974f ]---

------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at lib/refcount.c:153 kobject_get+0x24/0x54
refcount_t: increment on 0; use-after-free.
Modules linked in: k2_reset_status(O) davinci_wdt(+) 
sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) 
fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) 
evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge 
stp llc nvrd_checksum(O) ipv6
CPU: 3 PID: 1 Comm: systemd Tainted: G        W  O 
4.19.113-g2579778-fsm4_k2 #1
Hardware name: Keystone
[<c02126c4>] (unwind_backtrace) from [<c020da94>] (show_stack+0x18/0x1c)
[<c020da94>] (show_stack) from [<c07f87d8>] (dump_stack+0xb4/0xe8)
[<c07f87d8>] (dump_stack) from [<c0221f70>] (__warn+0xfc/0x114)
[<c0221f70>] (__warn) from [<c0221fd8>] (warn_slowpath_fmt+0x50/0x74)
[<c0221fd8>] (warn_slowpath_fmt) from [<c07fd368>] (kobject_get+0x24/0x54)
[<c07fd368>] (kobject_get) from [<c0602ce8>] (get_device+0x1c/0x24)
[<c0602ce8>] (get_device) from [<c06961e0>] (watchdog_open+0x90/0xf0)
[<c06961e0>] (watchdog_open) from [<c06001dc>] (misc_open+0x130/0x17c)
[<c06001dc>] (misc_open) from [<c0388228>] (chrdev_open+0xec/0x1a8)
[<c0388228>] (chrdev_open) from [<c037fa98>] (do_dentry_open+0x204/0x3cc)
[<c037fa98>] (do_dentry_open) from [<c0391e2c>] (path_openat+0x330/0x1148)
[<c0391e2c>] (path_openat) from [<c0394518>] (do_filp_open+0x78/0xec)
[<c0394518>] (do_filp_open) from [<c0381100>] (do_sys_open+0x130/0x1f4)
[<c0381100>] (do_sys_open) from [<c0201000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xd2ceffa8 to 0xd2cefff0)
ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 
00000000
ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 
bed7bb78
ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
---[ end trace 7b16eb1055139750 ]---

Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of 
watchdog_core_data and cdev")
Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>

Change-Id: I3b85f615d67ab5b8dc6c5c2dc42efd236d502d09
---
  drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c 
b/drivers/watchdog/watchdog_dev.c
index 10b2090f3e5e..1c322caecf7f 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -947,6 +947,15 @@ static int watchdog_cdev_register(struct 
watchdog_device *wdd)
         if (IS_ERR_OR_NULL(watchdog_kworker))
                 return -ENODEV;

+       device_initialize(&wd_data->dev);
+       wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
+       wd_data->dev.class = &watchdog_class;
+       wd_data->dev.parent = wdd->parent;
+       wd_data->dev.groups = wdd->groups;
+       wd_data->dev.release = watchdog_core_data_release;
+       dev_set_drvdata(&wd_data->dev, wdd);
+       dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
+
         kthread_init_work(&wd_data->work, watchdog_ping_work);
         hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
         wd_data->timer.function = watchdog_timer_expired;
@@ -967,15 +976,6 @@ static int watchdog_cdev_register(struct 
watchdog_device *wdd)
                 }
         }

-       device_initialize(&wd_data->dev);
-       wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
-       wd_data->dev.class = &watchdog_class;
-       wd_data->dev.parent = wdd->parent;
-       wd_data->dev.groups = wdd->groups;
-       wd_data->dev.release = watchdog_core_data_release;
-       dev_set_drvdata(&wd_data->dev, wdd);
-       dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
-
         /* Fill in the data structures */
         cdev_init(&wd_data->cdev, &watchdog_fops);

--
2.14.0

