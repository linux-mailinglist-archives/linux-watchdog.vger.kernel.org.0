Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379AD7870F3
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 15:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239394AbjHXN4M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 09:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237451AbjHXNzm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 09:55:42 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FA0A8
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 06:55:40 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RWl1W497sz1L9Mg;
        Thu, 24 Aug 2023 21:54:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 21:55:37 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <xt.hu@cqplus1.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/3] watchdog: ath79_wdt: Use the devm_clk_get_enabled() helper function
Date:   Thu, 24 Aug 2023 21:55:13 +0800
Message-ID: <20230824135514.2661364-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824135514.2661364-2-ruanjinjie@huawei.com>
References: <20230824135514.2661364-2-ruanjinjie@huawei.com>
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
 drivers/watchdog/ath79_wdt.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index b7b705060438..e5cc30622b12 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -257,19 +257,13 @@ static int ath79_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt_base))
 		return PTR_ERR(wdt_base);
 
-	wdt_clk = devm_clk_get(&pdev->dev, "wdt");
+	wdt_clk = devm_clk_get_enabled(&pdev->dev, "wdt");
 	if (IS_ERR(wdt_clk))
 		return PTR_ERR(wdt_clk);
 
-	err = clk_prepare_enable(wdt_clk);
-	if (err)
-		return err;
-
 	wdt_freq = clk_get_rate(wdt_clk);
-	if (!wdt_freq) {
-		err = -EINVAL;
-		goto err_clk_disable;
-	}
+	if (!wdt_freq)
+		return -EINVAL;
 
 	max_timeout = (0xfffffffful / wdt_freq);
 	if (timeout < 1 || timeout > max_timeout) {
@@ -286,20 +280,15 @@ static int ath79_wdt_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"unable to register misc device, err=%d\n", err);
-		goto err_clk_disable;
+		return err;
 	}
 
 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(wdt_clk);
-	return err;
 }
 
 static void ath79_wdt_remove(struct platform_device *pdev)
 {
 	misc_deregister(&ath79_wdt_miscdev);
-	clk_disable_unprepare(wdt_clk);
 }
 
 static void ath79_wdt_shutdown(struct platform_device *pdev)
-- 
2.34.1

