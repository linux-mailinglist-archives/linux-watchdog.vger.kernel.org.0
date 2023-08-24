Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817307870F4
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Aug 2023 15:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbjHXN4M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Aug 2023 09:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237974AbjHXNzo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Aug 2023 09:55:44 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF669A8
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Aug 2023 06:55:42 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RWkzj4Fq9zJrcc;
        Thu, 24 Aug 2023 21:52:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 21:55:39 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <xt.hu@cqplus1.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 3/3] watchdog: sunplus: Use the devm_clk_get_enabled() helper function
Date:   Thu, 24 Aug 2023 21:55:14 +0800
Message-ID: <20230824135514.2661364-4-ruanjinjie@huawei.com>
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

watchdog: ath79_wdt: Use the devm_clk_get_enabled() helper function

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the need of a dedicated function used
with devm_add_action_or_reset().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/watchdog/sunplus_wdt.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/sunplus_wdt.c b/drivers/watchdog/sunplus_wdt.c
index e2d8c532bcb1..9d3ca848e8b6 100644
--- a/drivers/watchdog/sunplus_wdt.c
+++ b/drivers/watchdog/sunplus_wdt.c
@@ -136,11 +136,6 @@ static const struct watchdog_ops sp_wdt_ops = {
 	.restart	= sp_wdt_restart,
 };
 
-static void sp_clk_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void sp_reset_control_assert(void *data)
 {
 	reset_control_assert(data);
@@ -156,17 +151,9 @@ static int sp_wdt_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
-		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clock\n");
-
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable clock\n");
-
-	ret = devm_add_action_or_reset(dev, sp_clk_disable_unprepare, priv->clk);
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
 
 	/* The timer and watchdog shared the STC reset */
 	priv->rstc = devm_reset_control_get_shared(dev, NULL);
-- 
2.34.1

