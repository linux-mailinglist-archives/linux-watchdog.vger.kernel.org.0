Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880D248478C
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jan 2022 19:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbiADSMp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jan 2022 13:12:45 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15298 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233027AbiADSMo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jan 2022 13:12:44 -0500
X-IronPort-AV: E=Sophos;i="5.88,261,1635174000"; 
   d="scan'208";a="106015083"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jan 2022 03:12:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 42BE240BB07B;
        Wed,  5 Jan 2022 03:12:42 +0900 (JST)
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
Subject: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
Date:   Tue,  4 Jan 2022 18:12:46 +0000
Message-Id: <20220104181249.3174-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch uses the force reset(WDTRSTB) for triggering WDT reset for
restart callback. This method is faster compared to the overflow method
for triggering watchdog reset.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V2->v3:
 * Patch reordering from patch 4->patch 2
 * Updated the commit description.
V1->V2:
 * Updated the commit description.
---
 drivers/watchdog/rzg2l_wdt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 96f2a018ab62..b02ecfff5299 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -21,8 +21,11 @@
 #define WDTSET		0x04
 #define WDTTIM		0x08
 #define WDTINT		0x0C
+#define PECR		0x10
+#define PEEN		0x14
 #define WDTCNT_WDTEN	BIT(0)
 #define WDTINT_INTDISP	BIT(0)
+#define PEEN_FORCE_RST	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT		60U
 
@@ -116,15 +119,11 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
-	/* Reset the module before we modify any register */
-	reset_control_reset(priv->rstc);
-	pm_runtime_get_sync(wdev->parent);
-
-	/* smallest counter value to reboot soon */
-	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
+	/* Generate Reset (WDTRSTB) Signal */
+	rzg2l_wdt_write(priv, 0, PECR);
 
-	/* Enable watchdog timer*/
-	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
+	/* Force reset (WDTRSTB) */
+	rzg2l_wdt_write(priv, PEEN_FORCE_RST, PEEN);
 
 	return 0;
 }
-- 
2.17.1

