Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780EE5EA7AD
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Sep 2022 15:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbiIZNyA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Sep 2022 09:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbiIZNxh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Sep 2022 09:53:37 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DA647BA9;
        Mon, 26 Sep 2022 05:09:50 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MbhKJ0Sj9zpVdC;
        Mon, 26 Sep 2022 20:05:24 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 20:08:17 +0800
From:   ruanjinjie <ruanjinjie@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] watchdog: Add __init/__exit annotations to module init/exit funcs
Date:   Mon, 26 Sep 2022 20:04:29 +0800
Message-ID: <20220926120429.1333802-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add missing __init/__exit annotations to module init/exit funcs

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/watchdog/cpu5wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/cpu5wdt.c b/drivers/watchdog/cpu5wdt.c
index 688b112e712b..3e4534e8fa4b 100644
--- a/drivers/watchdog/cpu5wdt.c
+++ b/drivers/watchdog/cpu5wdt.c
@@ -242,7 +242,7 @@ static int cpu5wdt_init(void)
 	return err;
 }
 
-static int cpu5wdt_init_module(void)
+static int __init cpu5wdt_init_module(void)
 {
 	return cpu5wdt_init();
 }
@@ -261,7 +261,7 @@ static void cpu5wdt_exit(void)
 
 }
 
-static void cpu5wdt_exit_module(void)
+static void __exit cpu5wdt_exit_module(void)
 {
 	cpu5wdt_exit();
 }
-- 
2.25.1

