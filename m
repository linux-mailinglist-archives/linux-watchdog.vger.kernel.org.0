Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A07750F1AA
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Apr 2022 09:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343629AbiDZHGn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Apr 2022 03:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343616AbiDZHGi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Apr 2022 03:06:38 -0400
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E994A6D4C0;
        Tue, 26 Apr 2022 00:03:30 -0700 (PDT)
HMM_SOURCE_IP: 172.18.0.48:51254.2065698957
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38 (unknown [172.18.0.48])
        by chinatelecom.cn (HERMES) with SMTP id ED99028008F;
        Tue, 26 Apr 2022 15:03:27 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
        by app0024 with ESMTP id 01340970e1564cc285c864ea13158509 for wim@linux-watchdog.org;
        Tue, 26 Apr 2022 15:03:29 CST
X-Transaction-ID: 01340970e1564cc285c864ea13158509
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Sender: liuxp11@chinatelecom.cn
From:   Liu Xinpeng <liuxp11@chinatelecom.cn>
To:     wim@linux-watchdog.org, linux@roeck-us.net, tzungbi@kernel.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liu Xinpeng <liuxp11@chinatelecom.cn>
Subject: [PATCH v4 2/4] watchdog: wdat_wdg: Stop watchdog when rebooting the system
Date:   Tue, 26 Apr 2022 15:03:06 +0800
Message-Id: <1650956588-795-3-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650956588-795-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1650956588-795-1-git-send-email-liuxp11@chinatelecom.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Executing reboot command several times on the machine "Dell
PowerEdge R740", UEFI security detection stopped machine
with the following prompt:

UEFI0082: The system was reset due to a timeout from the watchdog
timer. Check the System Event Log (SEL) or crash dumps from
Operating Sysstem to identify the source that triggered the
watchdog timer reset. Update the firmware or driver for the
identified device.

iDRAC has warning event: "The watchdog timer reset the system".

This patch fixes this issue by adding the reboot notifier.

Signed-off-by: Liu Xinpeng <liuxp11@chinatelecom.cn>
---
 drivers/watchdog/wdat_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 9db01d165310..0ef2b918364a 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -463,6 +463,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	watchdog_set_nowayout(&wdat->wdd, nowayout);
+	watchdog_stop_on_reboot(&wdat->wdd);
 	return devm_watchdog_register_device(dev, &wdat->wdd);
 }
 
-- 
2.23.0

