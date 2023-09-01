Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FEE78F8EA
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Sep 2023 09:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347413AbjIAHJm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 1 Sep 2023 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjIAHJl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 1 Sep 2023 03:09:41 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D03E49
        for <linux-watchdog@vger.kernel.org>; Fri,  1 Sep 2023 00:09:38 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RcTd428drz1L9JF;
        Fri,  1 Sep 2023 15:07:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 1 Sep
 2023 15:09:32 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bharat Bhushan <bbhushan2@marvell.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] Watchdog: Remove redundant dev_err_probe() for platform_get_irq()
Date:   Fri, 1 Sep 2023 15:09:29 +0800
Message-ID: <20230901070929.1317982-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
to platform_get_irq*()"), there is no need to call the dev_err_probe()
function directly to print a custom message when handling an error
from platform_get_irq() function as it is going to display an appropriate
error message in case of a failure.

Fixes: ef9e7fe2c890 ("Watchdog: Add marvell GTI watchdog driver")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/watchdog/marvell_gti_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/marvell_gti_wdt.c b/drivers/watchdog/marvell_gti_wdt.c
index d7eb8286e11e..d5a1ff91d423 100644
--- a/drivers/watchdog/marvell_gti_wdt.c
+++ b/drivers/watchdog/marvell_gti_wdt.c
@@ -308,7 +308,7 @@ static int gti_wdt_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return dev_err_probe(&pdev->dev, irq, "IRQ resource not found\n");
+		return irq;
 
 	err = devm_request_irq(dev, irq, gti_wdt_interrupt, 0,
 			       pdev->name, &priv->wdev);
-- 
2.34.1

