Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8422C2A7EC9
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 13:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbgKEMjQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 07:39:16 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7057 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKEMjN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 07:39:13 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CRjkf5HJCzhYrj;
        Thu,  5 Nov 2020 20:39:06 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 5 Nov 2020
 20:39:02 +0800
From:   Wang Wensheng <wangwensheng4@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rui.xiang@huawei.com>, <guohanjun@huawei.com>
Subject: [PATCH -next v3 2/2] watchdog: Clean up error handlings
Date:   Thu, 5 Nov 2020 12:38:48 +0000
Message-ID: <20201105123848.93735-2-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20201105123848.93735-1-wangwensheng4@huawei.com>
References: <20201105123848.93735-1-wangwensheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Clean up the repeated error handling process in function
__watchdog_register_device().

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/watchdog/watchdog_core.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 945ab38b14b8..4fa54a620ccd 100644
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
@@ -270,9 +268,8 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		if (!wdd->ops->stop) {
 			pr_err("watchdog%d: Cannot support stop_on_reboot\n",
 				wdd->id);
-			watchdog_dev_unregister(wdd);
-			ida_simple_remove(&watchdog_ida, id);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto dev_unregister;
 		}
 
 		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
@@ -280,9 +277,7 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		if (ret) {
 			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
 			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-			ida_simple_remove(&watchdog_ida, id);
-			return ret;
+			goto dev_unregister;
 		}
 	}
 
@@ -296,6 +291,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
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

