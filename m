Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD802A3D0A
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Nov 2020 07:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgKCGxB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Nov 2020 01:53:01 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7405 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgKCGxB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Nov 2020 01:53:01 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CQL7l2Db1z6xy6;
        Tue,  3 Nov 2020 14:52:35 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 14:52:27 +0800
From:   Wang Wensheng <wangwensheng4@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rui.xiang@huawei.com>, <guohanjun@huawei.com>
Subject: [PATCH -next v2 1/2] watchdog: Clean up error handlings of __watchdog_register_device
Date:   Tue, 3 Nov 2020 06:52:16 +0000
Message-ID: <20201103065217.67876-1-wangwensheng4@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
---
 drivers/watchdog/watchdog_core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 423844757812..c73871f41142 100644
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
@@ -273,9 +271,7 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 		if (ret) {
 			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
 			       wdd->id, ret);
-			watchdog_dev_unregister(wdd);
-			ida_simple_remove(&watchdog_ida, id);
-			return ret;
+			goto dev_unregister;
 		}
 	}
 
@@ -289,6 +285,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
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

