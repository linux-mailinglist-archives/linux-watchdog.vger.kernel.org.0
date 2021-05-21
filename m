Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CFD38C086
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 09:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhEUHRg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 May 2021 03:17:36 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3645 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbhEUHRg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 May 2021 03:17:36 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmdBR1Ry4zmWth;
        Fri, 21 May 2021 15:13:51 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 15:16:08 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 15:16:08 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Yicong Yang <yangyicong@hisilicon.com>
Subject: [RESEND 1/1] watchdog: simplify devm_watchdog_register_device
Date:   Fri, 21 May 2021 15:16:04 +0800
Message-ID: <1621581364-31734-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
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

