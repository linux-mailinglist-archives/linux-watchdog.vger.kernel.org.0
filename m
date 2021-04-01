Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E5A350CAC
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Apr 2021 04:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233048AbhDACZW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Mar 2021 22:25:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14659 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhDACY6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Mar 2021 22:24:58 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9n546Cbwzmc8K;
        Thu,  1 Apr 2021 10:22:16 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 10:24:51 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <khilman@baylibre.com>
CC:     <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] watchdog: meson_wdt: Use device_get_match_data() helper
Date:   Thu, 1 Apr 2021 10:25:21 +0800
Message-ID: <1617243921-56774-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the device_get_match_data() helper instead of open coding.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/watchdog/meson_wdt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 459f3ae..539feaa 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -162,7 +162,6 @@ static int meson_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_wdt_dev *meson_wdt;
-	const struct of_device_id *of_id;
 	int err;
 
 	meson_wdt = devm_kzalloc(dev, sizeof(*meson_wdt), GFP_KERNEL);
@@ -173,12 +172,7 @@ static int meson_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(meson_wdt->wdt_base))
 		return PTR_ERR(meson_wdt->wdt_base);
 
-	of_id = of_match_device(meson_wdt_dt_ids, dev);
-	if (!of_id) {
-		dev_err(dev, "Unable to initialize WDT data\n");
-		return -ENODEV;
-	}
-	meson_wdt->data = of_id->data;
+	meson_wdt->data = device_get_match_data(dev);
 
 	meson_wdt->wdt_dev.parent = dev;
 	meson_wdt->wdt_dev.info = &meson_wdt_info;
-- 
2.7.4

