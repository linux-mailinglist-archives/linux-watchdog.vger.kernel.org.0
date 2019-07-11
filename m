Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE00B65223
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2019 09:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfGKHAg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jul 2019 03:00:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725963AbfGKHAg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jul 2019 03:00:36 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 84EE695F83B628D151AE;
        Thu, 11 Jul 2019 15:00:31 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 11 Jul 2019
 15:00:21 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <baruch@tkos.co.il>, <wsa+renesas@sang-engineering.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] watchdog: digicolor_wdt: remove unused variable 'ret'
Date:   Thu, 11 Jul 2019 14:40:19 +0800
Message-ID: <20190711064019.60916-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

commit cdad26977e3f ("watchdog: digicolor_wdt: drop
warning after registering device") left this unused
variable, it can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/watchdog/digicolor_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
index 33cda95..073d378 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -118,7 +118,6 @@ static int dc_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dc_wdt *wdt;
-	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(struct dc_wdt), GFP_KERNEL);
 	if (!wdt)
-- 
2.7.4


