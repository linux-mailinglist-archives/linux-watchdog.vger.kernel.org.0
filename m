Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FE42A7EC6
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 13:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgKEMjN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 07:39:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7058 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEMjM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 07:39:12 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CRjkf56XVzhXfl;
        Thu,  5 Nov 2020 20:39:06 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 5 Nov 2020
 20:39:01 +0800
From:   Wang Wensheng <wangwensheng4@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rui.xiang@huawei.com>, <guohanjun@huawei.com>
Subject: [PATCH -next v3 1/2] watchdog: Fix potential dereferencing of null pointer
Date:   Thu, 5 Nov 2020 12:38:47 +0000
Message-ID: <20201105123848.93735-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A reboot notifier, which stops the WDT by calling the stop hook without
any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.

Howerer we allow the WDT driver to omit the stop hook since commit
"d0684c8a93549" ("watchdog: Make stop function optional") and provide
a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
control reboot policy"). Together that commits make user potential to
insert a watchdog driver that don't provide a stop hook but with the
stop_on_reboot parameter set, then dereferencing of null pointer occurs
on system reboot.

Check the stop hook before registering the reboot notifier to fix the
issue.

Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/watchdog/watchdog_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 423844757812..945ab38b14b8 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -267,8 +267,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	}
 
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
+		if (!wdd->ops->stop) {
+			pr_err("watchdog%d: Cannot support stop_on_reboot\n",
+				wdd->id);
+			watchdog_dev_unregister(wdd);
+			ida_simple_remove(&watchdog_ida, id);
+			return -EINVAL;
+		}
 
+		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
 		ret = register_reboot_notifier(&wdd->reboot_nb);
 		if (ret) {
 			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
-- 
2.25.0

