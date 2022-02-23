Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497A94C17FF
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Feb 2022 17:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiBWQBg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Feb 2022 11:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiBWQBg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Feb 2022 11:01:36 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22BD2C3332;
        Wed, 23 Feb 2022 08:01:08 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,391,1635174000"; 
   d="scan'208";a="112139503"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2022 01:01:07 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D84FB4004923;
        Thu, 24 Feb 2022 01:01:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/6] watchdog: rzg2l_wdt: Fix 32bit overflow issue
Date:   Wed, 23 Feb 2022 16:00:55 +0000
Message-Id: <20220223160100.23543-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The value of timer_cycle_us can be 0 due to 32bit overflow.
For eg:- If we assign the counter value "0xfff" for computing
maxval.

This patch fixes this issue by appending ULL to 1024, so that
it is promoted to 64bit.

This patch also fixes the warning message, 'watchdog: Invalid min and
max timeout values, resetting to 0!"

Fixes: 2cbc5cd0b55fa2 ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Updated commit description. Added Fixes tag
v2->v3:
 * No change
V1->V2:
 * Added Rb tag from Guenter and Geert.
---
 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 6b426df34fd6..96f2a018ab62 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -53,7 +53,7 @@ static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
 
 static u32 rzg2l_wdt_get_cycle_usec(unsigned long cycle, u32 wdttime)
 {
-	u64 timer_cycle_us = 1024 * 1024 * (wdttime + 1) * MICRO;
+	u64 timer_cycle_us = 1024 * 1024ULL * (wdttime + 1) * MICRO;
 
 	return div64_ul(timer_cycle_us, cycle);
 }
-- 
2.17.1

