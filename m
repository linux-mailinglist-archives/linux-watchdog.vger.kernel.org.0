Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B42740249E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 09:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240143AbhIGHoM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 03:44:12 -0400
Received: from mx21.baidu.com ([220.181.3.85]:45106 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241870AbhIGHng (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 03:43:36 -0400
Received: from BC-Mail-Ex24.internal.baidu.com (unknown [172.31.51.18])
        by Forcepoint Email with ESMTPS id 361429DCC28D2C569E46;
        Tue,  7 Sep 2021 15:42:29 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex24.internal.baidu.com (172.31.51.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 7 Sep 2021 15:42:28 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 15:42:28 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: ar7_wdt: Make use of the helper function devm_platform_ioremap_resource_byname()
Date:   Tue, 7 Sep 2021 15:42:22 +0800
Message-ID: <20210907074223.2706-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/watchdog/ar7_wdt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index ff37dc91057d..743e171d97a3 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -63,8 +63,6 @@ static DEFINE_SPINLOCK(wdt_lock);
 /* XXX currently fixed, allows max margin ~68.72 secs */
 #define prescale_value 0xffff
 
-/* Resource of the WDT registers */
-static struct resource *ar7_regs_wdt;
 /* Pointer to the remapped WDT IO space */
 static struct ar7_wdt *ar7_wdt;
 
@@ -265,9 +263,7 @@ static int ar7_wdt_probe(struct platform_device *pdev)
 {
 	int rc;
 
-	ar7_regs_wdt =
-		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
-	ar7_wdt = devm_ioremap_resource(&pdev->dev, ar7_regs_wdt);
+	ar7_wdt = devm_platform_ioremap_resource_byname(pdev, "regs");
 	if (IS_ERR(ar7_wdt))
 		return PTR_ERR(ar7_wdt);
 
-- 
2.25.1

