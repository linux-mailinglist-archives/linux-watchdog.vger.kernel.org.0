Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FC7221E6A
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jul 2020 10:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgGPIbY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jul 2020 04:31:24 -0400
Received: from mail-eopbgr40130.outbound.protection.outlook.com ([40.107.4.130]:55553
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727870AbgGPIbU (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jul 2020 04:31:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZyUKX54OcaO8js2Tulirr2OgWMDWmTYvLu0XodiC6gTQh74Dh34tgHH7aQ5emDfwsVHfxfo3f43p6t48YO5sRgHbeJV3hL/j1C5AB9qto5qXdVjINgSzu54Sb42gFfJQ/qe/ST7Vkgi7WfnJLxomX1yQD8QSS1YYabrYtLnmkROfK0pkELkOE8lzGmXZUxc5/LkF06Da3CA6b2alv4GJmrl2XiuibwSXR/h7uGLBSOwP2SMI05aocvehxp87BDmiToniL+1J6SiFzTU3viJQPI0gl0GfOGTeeCqWu4Nj7LU7I8dRX9Ic5anNhFLdMBZ9o4M2ReMOB3OH3bF5IqMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkRRNpih0npcoGRw2pUawuHCbLJRaJnkIDPn+w3E/eQ=;
 b=J2FxMIE914HEw6dMA3Cg2OVATwD5f/cI483uRTX5zKm2JXR11a8aMaO2gU9zyn3DGrWLvoOf4tqkzmz+M+a5tcTFJ98Q8A2k/VaiHwvJjd70zWS+XO/zJfGkpYXZ3MJhyYs61XFGung2peaC/+Ktkp1IWPHv3xVcNvFqzjwE/Q7gfYfv9dlIKtR768HsFP45cY0DMzY40dV5KfOkS8DtjpM4pVBQkz8sAaSckEpptkf6Y8KUUJg8xmstOaZAvge6CF7APwEr8NM0hwWuK4kAczbMpwudguuvS9kVqeG6yGvH/CUNvd9Gjb6P6QJ2sIoD/4aebEmW6sCxAhJeDTSrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkRRNpih0npcoGRw2pUawuHCbLJRaJnkIDPn+w3E/eQ=;
 b=ju7ijHN7cAoTk176WBWniDxFvBDHx6oYe4jjgROxxlkKmAGTdrBfBgms6VeKftavesPhEWL1dXCyGZTNRF+t4oeEqx1Q66fifSVRYe2G8ScBLU9KETWjCx+OyjYnU3JQv+IZxQt+b3n10hpY+e6gnTSrfrk98YPK64CT2ZpqcYQ=
Authentication-Results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=nokia.com;
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com (2603:10a6:10:70::33)
 by DB7PR07MB5029.eurprd07.prod.outlook.com (2603:10a6:10:59::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Thu, 16 Jul
 2020 08:31:15 +0000
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9]) by DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9%6]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 08:31:15 +0000
Subject: [PATCH v2] watchdog: initialize device before misc_register
To:     Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     alexander.sverdlin@nokia.com
References: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
 <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
From:   "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>
Message-ID: <55fa2e05-9a99-b205-2dad-b797786af22a@nokia.com>
Date:   Thu, 16 Jul 2020 10:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR14CA0032.namprd14.prod.outlook.com
 (2603:10b6:610:56::12) To DB7PR07MB5356.eurprd07.prod.outlook.com
 (2603:10a6:10:70::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.154.35.67] (131.228.32.163) by CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 08:31:13 +0000
X-Originating-IP: [131.228.32.163]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04eb95a1-59ef-4216-ad0b-08d829629aa5
X-MS-TrafficTypeDiagnostic: DB7PR07MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR07MB5029A547F89DB01268F056CF937F0@DB7PR07MB5029.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1W9iD03J4UAWcCxqcmNXm6J4h7wajszVyp9JbRZcmP6Tv5sCSehU51JHb5/RGVhfsiKDYbYSHRv/J213U+8SuzJQRqx4mv4FpwAbureTQjePfg2a60paS86PVAqwHoC0z9jDr1RZJa1RJaVloNFPRR3fekR5aPrF3Lo4kIuaNsmRGfafSx5BUpf2qL4zP310hBG9Mk73gFPFv1WiamgR/Pbd7Bt5+I5+7CPqf+RrwAmsnicDE0jLbClpkn+FV8qDpQnQfAbj32TVIa4AF4zrY54c5G32//iHNSjfVKu/T/+4PW8xMRIkQ3eP/mmXh7w10I9IQ16AYZ/5H4MujMbuGGlX48PJHv91cbrenExM4NgeT+ia7xhUKUSGley3Gtb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB5356.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(186003)(2906002)(478600001)(52116002)(8676002)(16526019)(31696002)(6486002)(5660300002)(36756003)(83380400001)(107886003)(86362001)(31686004)(316002)(8936002)(4326008)(16576012)(45080400002)(66556008)(2616005)(956004)(26005)(66946007)(6666004)(66476007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: xsrrAJ6gIbVWtW+pe+drLb+ZHXCVCGu99gHbMaZLLlVueUJLW9CZzFL+PU1nupafqKaVTcWu/hmykCxI8zoLn+HIThWH77TpZbxb+Mr7C5Q0QmRrkTtNEASI+Lq+MeZzeiJlebO73A9tmxNLkV31UAtymZBwVyyTBS1VKsUS0bh/XCR8vb36V5V+UlWeGHVDuUpQ1i6K7rwWFWJ6g7X0E+1bjfQANLoe8G/KwH2F8WF3PbBys6LEH/YSXa8GyndZzmnj3XxZIszSFIcWYS9WxZ4Bq9GyuJwYuF7sfkTCKpkO3qc9o6NbMzCHJSrpVHlme8S8qeWvnm7mF9AWKHy5omZX3MBaCPVfpR8n+xovpFxVDyCzxEjJ6kcw2VkpnIoe0Mt6Iyhb+Kh/jlwDrKUpHyviZNlYLG9VgsQSKddP2TktjFDutEiopItB0GvztaPTeYJUwl80zQtC5wGYGDNE/CTWuVY39LrNVg7fxm2xGnsz+LOKVRdM8Xmk2IEBfuJS
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04eb95a1-59ef-4216-ad0b-08d829629aa5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB5356.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 08:31:15.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbzrSPlhNHeOcbna6J5foEs5lTyRPOo9feqTEKZmKsL+IWMZrHUBWIUYU+tQ1h6pzFKKIxQ/skAj4MdlLvId84kOXomY8PntSGVBRV9w2L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB5029
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

watchdog: initialize device before misc_register

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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
---
v1 -> v2:
* removed Change-Id tag
* added Review-by tag
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

