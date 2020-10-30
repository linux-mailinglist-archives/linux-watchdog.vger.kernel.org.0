Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761F72A0A7B
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Oct 2020 16:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgJ3Pz3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Oct 2020 11:55:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:6996 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3Pz3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Oct 2020 11:55:29 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CN60R69GSzhZf3;
        Fri, 30 Oct 2020 23:38:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 23:38:24 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC:     <linux-watchdog@vger.kernel.org>
Subject: [PATCH] watchdog: rti-wdt: fix reference leak in rti_wdt_probe
Date:   Fri, 30 Oct 2020 23:49:09 +0800
Message-ID: <20201030154909.100023-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

pm_runtime_get_sync() will increment pm usage counter even it
failed. Forgetting to call pm_runtime_put_noidle will result
in reference leak in rti_wdt_probe, so we should fix it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/watchdog/rti_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 836319cbaca9..359302f71f7e 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -227,8 +227,10 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(dev);
 		return dev_err_probe(dev, ret, "runtime pm failed\n");
+	}
 
 	platform_set_drvdata(pdev, wdt);
 
-- 
2.17.1

