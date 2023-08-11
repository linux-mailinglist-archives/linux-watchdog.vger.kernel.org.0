Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934EF77876A
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Aug 2023 08:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjHKG1l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Aug 2023 02:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjHKG1l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Aug 2023 02:27:41 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5F22D4F
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Aug 2023 23:27:40 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMYh45k3rzVk7x;
        Fri, 11 Aug 2023 14:25:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 14:27:38 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] watchdog: pm8916_wdt: Remove redundant of_match_ptr()
Date:   Fri, 11 Aug 2023 14:27:07 +0800
Message-ID: <20230811062707.2301583-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/watchdog/pm8916_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index f4bfbffaf49c..f3fcbeb0852c 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -266,7 +266,7 @@ static struct platform_driver pm8916_wdt_driver = {
 	.probe = pm8916_wdt_probe,
 	.driver = {
 		.name = "pm8916-wdt",
-		.of_match_table = of_match_ptr(pm8916_wdt_id_table),
+		.of_match_table = pm8916_wdt_id_table,
 		.pm = &pm8916_wdt_pm_ops,
 	},
 };
-- 
2.34.1

