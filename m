Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768B640249B
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 09:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242480AbhIGHoG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 03:44:06 -0400
Received: from mx20.baidu.com ([111.202.115.85]:45210 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241955AbhIGHnp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 03:43:45 -0400
Received: from BC-Mail-Ex23.internal.baidu.com (unknown [172.31.51.17])
        by Forcepoint Email with ESMTPS id 5A432D70E7AF7E549FC2;
        Tue,  7 Sep 2021 15:42:36 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex23.internal.baidu.com (172.31.51.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 7 Sep 2021 15:42:36 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 15:42:35 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: iTCO_wdt: Make use of the helper function devm_platform_ioremap_resource()
Date:   Tue, 7 Sep 2021 15:42:29 +0800
Message-ID: <20210907074230.2757-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/watchdog/iTCO_wdt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 643c6c2d0b72..ebf7e5bc1199 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -96,7 +96,6 @@ struct iTCO_wdt_private {
 	 * NO_REBOOT flag is Memory-Mapped GCS register bit 5 (TCO version 2),
 	 * or memory-mapped PMC register bit 4 (TCO version 3).
 	 */
-	struct resource *gcs_pmc_res;
 	unsigned long __iomem *gcs_pmc;
 	/* the lock for io operations */
 	spinlock_t io_lock;
@@ -503,10 +502,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	 */
 	if (p->iTCO_version >= 2 && p->iTCO_version < 6 &&
 	    !pdata->no_reboot_use_pmc) {
-		p->gcs_pmc_res = platform_get_resource(pdev,
-						       IORESOURCE_MEM,
-						       ICH_RES_MEM_GCS_PMC);
-		p->gcs_pmc = devm_ioremap_resource(dev, p->gcs_pmc_res);
+		p->gcs_pmc = devm_platform_ioremap_resource(pdev, ICH_RES_MEM_GCS_PMC);
 		if (IS_ERR(p->gcs_pmc))
 			return PTR_ERR(p->gcs_pmc);
 	}
-- 
2.25.1

