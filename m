Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E8E2A257F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 08:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgKBHoh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 02:44:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7396 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgKBHog (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 02:44:36 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CPlL76NNBz7231;
        Mon,  2 Nov 2020 15:44:31 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 15:44:22 +0800
From:   Wang Wensheng <wangwensheng4@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rui.xiang@huawei.com>, <guohanjun@huawei.com>
Subject: [PATCH -next] watchdog: Fix potential dereferencing of null pointer
Date:   Mon, 2 Nov 2020 07:44:13 +0000
Message-ID: <20201102074413.69552-1-wangwensheng4@huawei.com>
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
 drivers/watchdog/watchdog_core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 423844757812..5269761ba072 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -252,10 +252,8 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		wdd->id = id;
 
 		ret = watchdog_dev_register(wdd);
-		if (ret) {
-			ida_simple_remove(&watchdog_ida, id);
-			return ret;
-		}
+		if (ret)
+			goto id_remove;
 	}
 
 	/* Module parameter to force watchdog policy on reboot. */
@@ -267,15 +265,17 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	}
 
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
-		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
+		if (!wdd->ops->stop) {
+			ret = -EINVAL;
+			goto dev_unregister;
+		}
 
+		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
 		ret = register_reboot_notifier(&wdd->reboot_nb);
 		if (ret) {
 			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
 			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-			ida_simple_remove(&watchdog_ida, id);
-			return ret;
+			goto dev_unregister;
 		}
 	}
 
@@ -289,6 +289,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	}
 
 	return 0;
+
+dev_unregister:
+	watchdog_dev_unregister(wdd);
+id_remove:
+	ida_simple_remove(&watchdog_ida, id);
+
+	return ret;
 }
 
 /**
-- 
2.25.0

