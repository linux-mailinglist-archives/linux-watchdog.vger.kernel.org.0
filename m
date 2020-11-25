Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6832C3B11
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 09:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgKYI0n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 03:26:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7680 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgKYI0n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 03:26:43 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cgv9m5J5xz15KLY;
        Wed, 25 Nov 2020 16:26:20 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 16:26:31 +0800
From:   Wang Li <wangli74@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>, <krzk@kernel.org>
CC:     <linux-watchdog@vger.kernel.org>, <wangli74@huawei.com>
Subject: [PATCH v2] watchdog: rti-wdt: disable runtime pm in case of failure
Date:   Wed, 25 Nov 2020 16:29:56 +0800
Message-ID: <20201125082956.3325066-1-wangli74@huawei.com>
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

Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
---
Changelog:
v2
- Change the fix tag.
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

