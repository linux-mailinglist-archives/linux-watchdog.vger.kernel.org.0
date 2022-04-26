Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2176250FA9C
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Apr 2022 12:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349069AbiDZKbt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Apr 2022 06:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349009AbiDZKbS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Apr 2022 06:31:18 -0400
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5979810FF1A;
        Tue, 26 Apr 2022 03:09:35 -0700 (PDT)
HMM_SOURCE_IP: 172.18.0.48:40704.1059882310
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39 (unknown [172.18.0.48])
        by chinatelecom.cn (HERMES) with SMTP id 933B22800BC;
        Tue, 26 Apr 2022 18:09:32 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
        by app0024 with ESMTP id e723b373378f47eda2446529dd617a05 for wim@linux-watchdog.org;
        Tue, 26 Apr 2022 18:09:34 CST
X-Transaction-ID: e723b373378f47eda2446529dd617a05
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Sender: liuxp11@chinatelecom.cn
From:   Liu Xinpeng <liuxp11@chinatelecom.cn>
To:     wim@linux-watchdog.org, linux@roeck-us.net, tzungbi@kernel.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liu Xinpeng <liuxp11@chinatelecom.cn>
Subject: [PATCH v7 1/3] watchdog: wdat_wdt: Using the existing function to check parameter timeout
Date:   Tue, 26 Apr 2022 18:09:20 +0800
Message-Id: <1650967762-3122-2-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650967762-3122-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1650967762-3122-1-git-send-email-liuxp11@chinatelecom.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If max_hw_heartbeat_ms is provided, the configured maximum timeout is not
limited by it. The limit check in this driver therefore doesn't make much
sense. Similar, the watchdog core ensures that minimum timeout limits are
met if min_hw_heartbeat_ms is set. Using watchdog_timeout_invalid() makes
more sense because it takes this into account.

Signed-off-by: Liu Xinpeng <liuxp11@chinatelecom.cn>
---
 drivers/watchdog/wdat_wdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 195c8c004b69..9db01d165310 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 #define WDAT_DEFAULT_TIMEOUT	30
+#define WDAT_MIN_TIMEOUT     1
 
 static int timeout = WDAT_DEFAULT_TIMEOUT;
 module_param(timeout, int, 0);
@@ -344,6 +345,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 	wdat->period = tbl->timer_period;
 	wdat->wdd.min_hw_heartbeat_ms = wdat->period * tbl->min_count;
 	wdat->wdd.max_hw_heartbeat_ms = wdat->period * tbl->max_count;
+	wdat->wdd.min_timeout = WDAT_MIN_TIMEOUT;
 	wdat->stopped_in_sleep = tbl->flags & ACPI_WDAT_STOPPED;
 	wdat->wdd.info = &wdat_wdt_info;
 	wdat->wdd.ops = &wdat_wdt_ops;
@@ -450,8 +452,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 	 * watchdog properly after it has opened the device. In some cases
 	 * the BIOS default is too short and causes immediate reboot.
 	 */
-	if (timeout * 1000 < wdat->wdd.min_hw_heartbeat_ms ||
-	    timeout * 1000 > wdat->wdd.max_hw_heartbeat_ms) {
+	if (watchdog_timeout_invalid(&wdat->wdd, timeout)) {
 		dev_warn(dev, "Invalid timeout %d given, using %d\n",
 			 timeout, WDAT_DEFAULT_TIMEOUT);
 		timeout = WDAT_DEFAULT_TIMEOUT;
-- 
2.23.0

