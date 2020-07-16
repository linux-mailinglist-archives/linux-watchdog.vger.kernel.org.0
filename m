Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597CA22217F
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jul 2020 13:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgGPLce (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jul 2020 07:32:34 -0400
Received: from mail-am6eur05on2100.outbound.protection.outlook.com ([40.107.22.100]:21311
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727963AbgGPLcc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jul 2020 07:32:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPQL5xqlVHk3Qqg45ZhJy0SvNmyNmMJPV7YLdo9jwQ6sLwmdDaJ/OZYDJcXcPWXjxMrUXdIb/XesT+/lnTSN1+nc2LpjQlZ6A5Hy9Gx5ZiGYAjglJ5cnWvOs7U4lCZqESmMp7fypRohcMcKlrARti8HpkoQ3MZXziutu4KLfqs/VjvJJCi8TUGjmZY6VGc75eIz/UjC9Te5eq6Sg9eDo5JQ+xVmCafUG99/ZUud3nJ+iveG1kELLMW6x1PMmaAKdMvYY/mzi+rrsMcu+5MG7kO/tOTxUbmDn1JYfoKrjehC3/t/ZboGNONL917uFTqvfmZIoPeBX2xVj+OblPkXQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Lijb+qKJBLu22HdLKWh696+i9hYn6v4P3kQkUMwdSk=;
 b=nAIj/LXC4+pkDmnbG1O+O0uPfa6pTDAohuAT9kiwuHe8RSC5SVvn5KzOmhtW6aFr+BhPNElBFBDKZDUeyomTihZxGWfD+uwlSR6wtNnTVOeNefLnJ1DC+l2uFMuRWdzj1mu4KxvDjBEp4EXv/FNVqOnxX9PyYBQgEwhzp6QmaAWRr8fEuE9J/OJGiBH+JmPE171g13/Cm6CTo3Bbp6vJCLFREP4zIVsJA8MZSUyk2IXhZQFA7AUQWFAl1K72Amg/8I2AJhPysJn4hzweKUMmKWizwwltn8goZhc7W2C/KemeUnJB+ZXm1s7Ch3e3ArRxQsJgxblPx/t3E5rNbUz98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Lijb+qKJBLu22HdLKWh696+i9hYn6v4P3kQkUMwdSk=;
 b=lVQvXnV3Ia7qlnUbuDwoQXrjcWphmlGP+S+/K9hT/5akfGMA/2kHv4qwsuX9T1JrR36Z6bdLTO0OHcfcz31SXK5D+WvgWKkI5GPa++5/gbnT4nJFuijQG1pD6bGM1kqdRkcZfv2NgofNMu7mfQ6N5r0/dM8xM9GA9x6orEMsU3k=
Authentication-Results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=nokia.com;
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com (2603:10a6:10:70::33)
 by DBAPR07MB6917.eurprd07.prod.outlook.com (2603:10a6:10:19d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Thu, 16 Jul
 2020 11:32:27 +0000
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9]) by DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9%6]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 11:32:27 +0000
Subject: Re: [PATCH v3] watchdog: initialize device before misc_register
From:   "krzysztof.sobota@nokia.com" <krzysztof.sobota@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     alexander.sverdlin@nokia.com, krzysztof.sobota@nokia.com
References: <ab5739d7-3542-08d0-402d-65aeb14b78ab@nokia.com>
 <a9338b3b-92d8-08b9-2f4e-59abceb1b307@roeck-us.net>
 <55fa2e05-9a99-b205-2dad-b797786af22a@nokia.com>
Message-ID: <1f20e45d-aba5-6226-27f2-cb6438cc224e@nokia.com>
Date:   Thu, 16 Jul 2020 13:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <55fa2e05-9a99-b205-2dad-b797786af22a@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: CH2PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:610:52::28) To DB7PR07MB5356.eurprd07.prod.outlook.com
 (2603:10a6:10:70::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.154.35.67] (131.228.32.163) by CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.19 via Frontend Transport; Thu, 16 Jul 2020 11:32:25 +0000
X-Originating-IP: [131.228.32.163]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e8b567d-4d43-447c-a576-08d8297beaca
X-MS-TrafficTypeDiagnostic: DBAPR07MB6917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR07MB6917219CFF6981CE4189BE31937F0@DBAPR07MB6917.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roCu9nX4AaMaHSf/wlRn19ZRlERQJh5jxU5Yf3peCjMsI6gZooRlCh3yKk6W7RBdVVMm6YlwB4gWuhIOvy0NEM1mY/EE3TXpET8OlX03VMn8DR/7pP+sTEMevNbf7sro8wDuco4u5mk7KGLmIYbAKpGuPFezUfmBnkJ/PM1ZAi08zrVskjel6LUsqjbQi0l09lE3e8W58wnygvMbbxLyEV1P2CqrqMkJdDDIu/LQZ4twntDfj6G1UD1VnuMoTjA5WgP9Io99iYpGeJ31zMgFYpbM3OH5v8uANFJaewtez2r4mXiR6T9dLhmaLs7mxyej8RlRW7WGtkb1xzGjHRUiTlLEAwtEHoMXC5iTWzX58eO4XWjwrc/AxwvSG1t8vZPp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB5356.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(8936002)(83380400001)(4326008)(316002)(478600001)(66946007)(107886003)(66476007)(6486002)(16526019)(16576012)(26005)(31686004)(66556008)(52116002)(45080400002)(31696002)(186003)(8676002)(5660300002)(2906002)(6666004)(86362001)(2616005)(956004)(36756003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: hcaUwYK8SIVt+35+pDYfWKl/JzJKyz/UXAJuHVAIFZci9sBhUSPAcEBhqobXo/ShBzs9jrJWcQkqRuT8cbJgPjEP5zvTZ8yWkCL4AkSjLPWP2GHur6vhgnN+O7/FEvqmdNoKx4Jh84W1R3iuNVhlXtktJyvGGoI11LlAE7/4trmmQSHgG+G7WS8iPah2wqdSMvfP1bb76ZR4owggBJCP8djmOPq53pEp3GIDLGfspiUpq+7nQt6TvC9vO155uxJ2HaybiQtzPpnQmXYRdG8NY2fPnYPcYwCZYmLRBO2xLD88xAWFQpMfVH0NSjUfRQZZvBfRUdGLF4LlHcEmNNeVNOnah8Cy5Zvg+PzhLIXjdMBI8pLwNENMPODjEWzsq9lY1ivcMDS/Ly2HSEUa8zwlV/5oDyQHc4QyP0aMpTHKZnqLP9M4+C7j6YagERmFT7xpmvLm+ikMXaMiFevpYaCyNK7nGWpxnw2CT6LgVq/ICdJfpI3VppKMJdcJx8bHZiZX
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8b567d-4d43-447c-a576-08d8297beaca
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB5356.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 11:32:27.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ME3tAfQ+GSpeKpRFsypxjTquGH/ysT0SKPvfNVdBLXfSdVd3pYSfIAIP71IgJXesvYgCIgfWxHvQQ2YSJrpTgNUFcnv+w369Iof9QTr2wXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6917
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When watchdog device is being registered, it calls misc_register that
makes watchdog available for systemd to open. This is a data race
scenario, because when device is open it may still have device struct
not initialized - this in turn causes a crash. This patch moves
device initialization before misc_register call and it solves the
problem printed below.

------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at lib/kobject.c:612 kobject_get+0x50/0x54
kobject: '(null)' ((ptrval)): is not initialized, yet kobject_get() is being called.
Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
CPU: 3 PID: 1 Comm: systemd Tainted: G           O      4.19.113-g2579778-fsm4_k2 #1
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
ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
---[ end trace 7b16eb105513974f ]---

------------[ cut here ]------------
WARNING: CPU: 3 PID: 1 at lib/refcount.c:153 kobject_get+0x24/0x54
refcount_t: increment on 0; use-after-free.
Modules linked in: k2_reset_status(O) davinci_wdt(+) sfn_platform_hwbcn(O) fsmddg_sfn(O) clk_misc_mmap(O) clk_sw_bcn(O) fsp_reset(O) cma_mod(O) slave_sup_notif(O) fpga_master(O) latency(O+) evnotify(O) enable_arm_pmu(O) xge(O) rio_mport_cdev br_netfilter bridge stp llc nvrd_checksum(O) ipv6
CPU: 3 PID: 1 Comm: systemd Tainted: G        W  O      4.19.113-g2579778-fsm4_k2 #1
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
ffa0:                   b6f69968 00000000 ffffff9c b6ebd210 000a0001 00000000
ffc0: b6f69968 00000000 00000000 00000142 fffffffd ffffffff 00b65530 bed7bb78
ffe0: 00000142 bed7ba70 b6cc2503 b6cc41d6
---[ end trace 7b16eb1055139750 ]---

Fixes: 72139dfa2464 ("watchdog: Fix the race between the release of watchdog_core_data and cdev")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
---
v1 -> v2:
* removed Change-Id tag
* added Review-by tag
v2 -> v3
* convert spaces to tabs
* convert (hopefully) mail to plaintext
---
 drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 10b2090f3e5e..1c322caecf7f 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -947,6 +947,15 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
	if (IS_ERR_OR_NULL(watchdog_kworker))
		return -ENODEV;

+	device_initialize(&wd_data->dev);
+	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
+	wd_data->dev.class = &watchdog_class;
+	wd_data->dev.parent = wdd->parent;
+	wd_data->dev.groups = wdd->groups;
+	wd_data->dev.release = watchdog_core_data_release;
+	dev_set_drvdata(&wd_data->dev, wdd);
+	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
+
	kthread_init_work(&wd_data->work, watchdog_ping_work);
	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
	wd_data->timer.function = watchdog_timer_expired;
@@ -967,15 +976,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
		}
	}

-	device_initialize(&wd_data->dev);
-	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
-	wd_data->dev.class = &watchdog_class;
-	wd_data->dev.parent = wdd->parent;
-	wd_data->dev.groups = wdd->groups;
-	wd_data->dev.release = watchdog_core_data_release;
-	dev_set_drvdata(&wd_data->dev, wdd);
-	dev_set_name(&wd_data->dev, "watchdog%d", wdd->id);
-
	/* Fill in the data structures */
	cdev_init(&wd_data->cdev, &watchdog_fops);

--
2.14.0

