Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BAD22394E
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 12:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgGQKbl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 06:31:41 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com ([40.107.22.122]:21940
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726599AbgGQKbk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 06:31:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5aGbs49rCKxK0dYQ+guO0GDuUnWqQcgWAHlK3E5i8kDcSHZ/tM31rR/mFQhT8bKCbNwaKsFLcyx4i7C+TWvGEjLAvLBKdHt6qNLBwMpkJB0/oaDbK9g3a8YKg19+eu5K8yMmdGtg/AwxlpGBEtTpLFSRG5R0XBrP7HuEWgiqeAPxb5t0TUUHrVL1/R9GdLe+B1EmMzpvVpfCDhH2auc/mv8D+C6e2OuAdU6pIi9CJ+wWu25SaT1FxZRBHoIzhgZkc9UtWu7LJ14zvCOLpxm4ovMLDDmHhv0ZsCVL/W2ZBpF8+Xok2t5ApriEpsTNi0VXqq223TFQEnSDP5FjksIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5gtqm/eQhHpSeZnbW7tSt56P+Kn6c0Rt0ra9UYuY+0=;
 b=ZjhRK1bvPJQhAw9LH2RQXije3/1k4Xh9e3Nw7byKGwfElEXg+AiuSaDcgSbNtmI8elxZeFNBYzUNUNiwFguzETa8NJP76tM/ETMOhmsY6qbULyfZBFd/vu7NbAM8MLb2rHL7YWkZfM7EA/in3qDrro6UCd1Je0M1dva0rxyQm+hudTIsEoLSrLmzaQ+Tg+pA47vuQST/SARKpH2dWFxj1XG1x83/kCkzByNWB0C01ad8nes0ad3mvncBtosqg6yKReaSovWZEQnG9hZM74p1qLuxU8l9JKMmck727r1JFUjIdDXJ2yzanoX0ttxvEbwiaIG8+/FfZVVFAsPG6rt6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5gtqm/eQhHpSeZnbW7tSt56P+Kn6c0Rt0ra9UYuY+0=;
 b=Ofj8vg7cIDCdGJ9Y0BUCypEpPYFVcymUJamDRidFHpj3Oi8Vg9DBfHFXl2pDQ0086POWCwbh6/fXgzo9YSlZxo3xFnuf/oiAApVIE3sGQb88BHIr3xAjcEuLa0GvJhK7IBI5ZHHzNX+ZZYXmelHiZI5szhbf/4z4Id04cWukP4g=
Authentication-Results: linux-watchdog.org; dkim=none (message not signed)
 header.d=none;linux-watchdog.org; dmarc=none action=none
 header.from=nokia.com;
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com (2603:10a6:10:70::33)
 by DB7PR07MB4571.eurprd07.prod.outlook.com (2603:10a6:5:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.10; Fri, 17 Jul
 2020 10:31:35 +0000
Received: from DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9]) by DB7PR07MB5356.eurprd07.prod.outlook.com
 ([fe80::986:d072:defd:74a9%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 10:31:35 +0000
From:   Krzysztof Sobota <krzysztof.sobota@nokia.com>
To:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@roeck-us.net
Cc:     krzysztof.sobota@nokia.com, alexander.sverdlin@nokia.com
Subject: [PATCH v4] watchdog: initialize device before misc_register
Date:   Fri, 17 Jul 2020 12:31:09 +0200
Message-Id: <20200717103109.14660-1-krzysztof.sobota@nokia.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0372.eurprd05.prod.outlook.com
 (2603:10a6:7:94::31) To DB7PR07MB5356.eurprd07.prod.outlook.com
 (2603:10a6:10:70::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from master-ThinkPad-T470.emea.nsn-net.net (131.228.2.28) by HE1PR05CA0372.eurprd05.prod.outlook.com (2603:10a6:7:94::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 10:31:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [131.228.2.28]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a65da28-c127-4a26-f775-08d82a3c9445
X-MS-TrafficTypeDiagnostic: DB7PR07MB4571:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR07MB45714EE939D547EACF475BAD937C0@DB7PR07MB4571.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YxerYGSF+tFlmi2rIIpvrTSkdQdz7xsHTi1YGBZ1k+eP5lHa+vTvL3TUC8AGkt5iwt3MTONBiamYrlEG6r29uu+2SCdLHglnQHyeRSLtM4A8pKpGNwgl7IrRQ1KEtmOQdJ4gYP25I4p/XdgwxKBgORFBhc6cBoUv02FdahgnIxs2ppumwnNBNrcbxUJRTMhRJFnNqAnb3qlWC23n6VGZLNN/T1EgR/jl9qahCpOIW0T6O5jM98+oC2AGGvNcZGicSelug2/UmNYQ+RGx+7gq9i83PmIuwWbITHvyTdc0q2Nf2RUpa82lXSoPHkBH+10z5/kA/f82Sj6Mc4GLkIuww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB5356.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6666004)(1076003)(6506007)(83380400001)(186003)(316002)(44832011)(26005)(16526019)(2906002)(2616005)(6486002)(66946007)(66556008)(5660300002)(36756003)(8676002)(478600001)(52116002)(45080400002)(86362001)(4326008)(8936002)(6512007)(66476007)(956004)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: /xFvCTT4vfP6MJwM+EUESSAwciklpI5RJBpKv2ED5ngtJC7T3gYU4jVBNJdjn3cDV/E5fW23OYuBgFrt7llakPDSdtf2WwqxZl79AE14teDQejbc04NRYoQZqAj4/MsCcBLq8j1FTM8+1GRBgrFX0syLsvGm4q+JJqu36tb3mh6TW6uGM6kVihtpdMkrpXT4ypVUgrA/zhyXaIyUROdz+DM1zEHLQxlRM9WstC4s7P9biIAuH6Lx/Cfxyw0mxCTyzjwbWhH3hM7D2w6WeNDvZSmZyzeZ0DLuqsPssYSQV1XzaR0SLeXc3DbgzAZ3jAWnmPmnwTxcvE5yHAEYDn2pv/fPSLVXnluIf4glYeN+zfDgf9C+Vo7IuEzBKXzKme8qRTSgcU6pVfhtncDLKQhBMtoEBYuBiR3N8y/w3nWE8qJn8uTja4MnWBbI3OU59p6hnYIF56jyQ0s/Zy6+IMMTo2fKsChamTwHbdhZFbKitF8=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a65da28-c127-4a26-f775-08d82a3c9445
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB5356.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 10:31:35.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7Vr5ndGnFY96hd/PCx3kVzFEz3v3xYMPTF1Ug7QY8zhiLHsHhQdaht3f+OZS8pF0boDdQb9eNhxtFA2Y+/CZPkJltMcsq0l9gXI0WsbhKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB4571
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
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Krzysztof Sobota <krzysztof.sobota@nokia.com>
---
v1 -> v2
* removed Change-Id tag
* added Review-by tag
v2 -> v3
* convert spaces to tabs
* convert (hopefully) mail to plaintext
v3 -> v4
* use git send-email to fix style problems
* rebase on top of master
---
 drivers/watchdog/watchdog_dev.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..b535f5fa279b 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -994,6 +994,15 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
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
 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	wd_data->timer.function = watchdog_timer_expired;
@@ -1014,15 +1023,6 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
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

