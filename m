Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E69B357960
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Apr 2021 03:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHBNd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Apr 2021 21:13:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15957 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhDHBNd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Apr 2021 21:13:33 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FG39p3CFmzwRdg;
        Thu,  8 Apr 2021 09:11:10 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 09:13:11 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Yicong Yang <yangyicong@hisilicon.com>
Subject: [PATCH] watchdog: simplify devm_watchdog_register_device
Date:   Thu, 8 Apr 2021 09:13:36 +0800
Message-ID: <1617844416-64519-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/watchdog/watchdog_core.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 5df0a22..cea6080 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -364,9 +364,9 @@ void watchdog_unregister_device(struct watchdog_device *wdd)
 
 EXPORT_SYMBOL_GPL(watchdog_unregister_device);
 
-static void devm_watchdog_unregister_device(struct device *dev, void *res)
+static void devm_watchdog_unregister_device(void *wdd)
 {
-	watchdog_unregister_device(*(struct watchdog_device **)res);
+	watchdog_unregister_device(wdd);
 }
 
 /**
@@ -381,23 +381,14 @@ static void devm_watchdog_unregister_device(struct device *dev, void *res)
 int devm_watchdog_register_device(struct device *dev,
 				struct watchdog_device *wdd)
 {
-	struct watchdog_device **rcwdd;
 	int ret;
 
-	rcwdd = devres_alloc(devm_watchdog_unregister_device, sizeof(*rcwdd),
-			     GFP_KERNEL);
-	if (!rcwdd)
-		return -ENOMEM;
-
 	ret = watchdog_register_device(wdd);
-	if (!ret) {
-		*rcwdd = wdd;
-		devres_add(dev, rcwdd);
-	} else {
-		devres_free(rcwdd);
-	}
+	if (ret)
+		return ret;
 
-	return ret;
+	return devm_add_action_or_reset(dev, devm_watchdog_unregister_device,
+					wdd);
 }
 EXPORT_SYMBOL_GPL(devm_watchdog_register_device);
 
-- 
2.7.4

