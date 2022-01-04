Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F71948478A
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jan 2022 19:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbiADSMn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jan 2022 13:12:43 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15298 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233027AbiADSMn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jan 2022 13:12:43 -0500
X-IronPort-AV: E=Sophos;i="5.88,261,1635174000"; 
   d="scan'208";a="106015080"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jan 2022 03:12:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CFFFA40BB07B;
        Wed,  5 Jan 2022 03:12:39 +0900 (JST)
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
Subject: [PATCH v3 1/4] watchdog: rzg2l_wdt: Fix 32bit overflow issue
Date:   Tue,  4 Jan 2022 18:12:45 +0000
Message-Id: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The value of timer_cycle_us can be 0 due to 32bit overflow.
For eg:- If we assign the counter value "0xfff" for computing
maxval.

This patch fixes this issue by appending ULL to 1024, so that
it is promoted to 64bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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

