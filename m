Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19DCE7870F2
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 15:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbjHXNzk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 09:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240972AbjHXNzd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 09:55:33 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854851711
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 06:55:31 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RWl1K4zjDz1L9Ll;
        Thu, 24 Aug 2023 21:53:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 21:55:28 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <xt.hu@cqplus1.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/3] watchdog: at91sam9_wdt: Use the devm_clk_get_enabled() helper function
Date:   Thu, 24 Aug 2023 21:55:12 +0800
Message-ID: <20230824135514.2661364-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/watchdog/at91sam9_wdt.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index fed7be246442..b111b28acb94 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -348,25 +348,21 @@ static int __init at91wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	wdt->sclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(wdt->sclk))
-		return PTR_ERR(wdt->sclk);
-
-	err = clk_prepare_enable(wdt->sclk);
-	if (err) {
+	wdt->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(wdt->sclk)) {
 		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return err;
+		return PTR_ERR(wdt->sclk);
 	}
 
 	if (pdev->dev.of_node) {
 		err = of_at91wdt_init(pdev->dev.of_node, wdt);
 		if (err)
-			goto err_clk;
+			return err;
 	}
 
 	err = at91_wdt_init(pdev, wdt);
 	if (err)
-		goto err_clk;
+		return err;
 
 	platform_set_drvdata(pdev, wdt);
 
@@ -374,11 +370,6 @@ static int __init at91wdt_probe(struct platform_device *pdev)
 		wdt->wdd.timeout, wdt->nowayout);
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(wdt->sclk);
-
-	return err;
 }
 
 static int __exit at91wdt_remove(struct platform_device *pdev)
@@ -388,7 +379,6 @@ static int __exit at91wdt_remove(struct platform_device *pdev)
 
 	pr_warn("I quit now, hardware will probably reboot!\n");
 	del_timer(&wdt->timer);
-	clk_disable_unprepare(wdt->sclk);
 
 	return 0;
 }
-- 
2.34.1

