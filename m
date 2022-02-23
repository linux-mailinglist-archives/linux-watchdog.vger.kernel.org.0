Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0E4C181D
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Feb 2022 17:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239208AbiBWQGs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Feb 2022 11:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240492AbiBWQGs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Feb 2022 11:06:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABF07C4850
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Feb 2022 08:06:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,391,1635174000"; 
   d="scan'208";a="111356438"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2022 01:01:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1A13F4004923;
        Thu, 24 Feb 2022 01:01:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT reset
Date:   Wed, 23 Feb 2022 16:00:59 +0000
Message-Id: <20220223160100.23543-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch uses the force reset(WDTRSTB) for triggering WDT reset for
restart callback. This method(ie, Generate Reset (WDTRSTB) Signal on
parity error)is faster compared to the overflow method for triggering
watchdog reset.

Overflow method:
	reboot: Restarting system
	Reboot failed -- System halted
	NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c

Parity error method:
	reboot: Restarting system
	NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V3->V4:
 * Renamed PEEN_FORCE_RST->PEEN_FORCE
 * Updated comments with parity error description
 * Updated commit description
V2->v3:
 * Patch reordering from patch 4->patch 2
 * Updated the commit description.
V1->V2:
 * Updated the commit description.
---
 drivers/watchdog/rzg2l_wdt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 73b667ed3e99..4e7107655cc2 100644
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
+#define PEEN_FORCE	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT		60U
 
@@ -117,17 +120,14 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
-	/* Reset the module before we modify any register */
-	reset_control_reset(priv->rstc);
-
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
-	/* smallest counter value to reboot soon */
-	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
+	/* Generate Reset (WDTRSTB) Signal on parity error */
+	rzg2l_wdt_write(priv, 0, PECR);
 
-	/* Enable watchdog timer*/
-	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
+	/* Force parity error */
+	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 
 	return 0;
 }
-- 
2.17.1

