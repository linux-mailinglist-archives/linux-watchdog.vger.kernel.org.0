Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439F02C3A48
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 08:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgKYHsg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 02:48:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7679 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgKYHsg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 02:48:36 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgtKp0qZ2z15S0N;
        Wed, 25 Nov 2020 15:48:14 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 15:48:25 +0800
From:   Wang Li <wangli74@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>, <krzk@kernel.org>
CC:     <linux-watchdog@vger.kernel.org>, <wangli74@huawei.com>
Subject: [PATCH] watchdog: rti-wdt: disable runtime pm in case of failure
Date:   Wed, 25 Nov 2020 15:51:51 +0800
Message-ID: <20201125075151.3264632-1-wangli74@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In case of runtime pm failed, should disable runtime pm.

Fixes: d342951bcda6 ("watchdog: rti: Simplify with dev_err_probe()")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
---
 drivers/watchdog/rti_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 836319cbaca9..8885841eef4f 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -227,8 +227,10 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "runtime pm failed\n");
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "runtime pm failed\n");
+		goto err_iomap;
+	}
 
 	platform_set_drvdata(pdev, wdt);
 
-- 
2.25.4

