Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E049A4C4CF5
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Feb 2022 18:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiBYRyV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Feb 2022 12:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiBYRyV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Feb 2022 12:54:21 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3BDD1187BAF;
        Fri, 25 Feb 2022 09:53:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,136,1643641200"; 
   d="scan'208";a="112393442"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Feb 2022 02:53:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.192])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A828540078A5;
        Sat, 26 Feb 2022 02:53:45 +0900 (JST)
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
Subject: [PATCH v5 7/7] watchdog: rzg2l_wdt: Add set_timeout callback
Date:   Fri, 25 Feb 2022 17:53:20 +0000
Message-Id: <20220225175320.11041-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch adds support for set_timeout callback.

Once WDT is started, the WDT cycle setting register(WDTSET) can be updated
only after issuing a module reset. Otherwise, it will ignore the writes
and will hold the previous value. This patch updates the WDTSET register
if it is active.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V4->V5:
 * Added Rb tag from Geert.
V3->v4:
 * Updated commit description
 * Simplified the logic for updating timeout register, if wdt is active.
v2->v3:
 * Patch reodering Patch 3 -> patch 4
 * Updated commit description.
V1->V2:
 * Updated commit description
 * Removed stop/start and started using reset() instead.
 * After reset, Start WDT based on watchdog timer state.
---
 drivers/watchdog/rzg2l_wdt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 4e7107655cc2..6eea0ee4af49 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -115,6 +115,25 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	return 0;
 }
 
+static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
+{
+	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+
+	wdev->timeout = timeout;
+
+	/*
+	 * If the watchdog is active, reset the module for updating the WDTSET
+	 * register so that it is updated with new timeout values.
+	 */
+	if (watchdog_active(wdev)) {
+		pm_runtime_put(wdev->parent);
+		reset_control_reset(priv->rstc);
+		rzg2l_wdt_start(wdev);
+	}
+
+	return 0;
+}
+
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
@@ -151,6 +170,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.start = rzg2l_wdt_start,
 	.stop = rzg2l_wdt_stop,
 	.ping = rzg2l_wdt_ping,
+	.set_timeout = rzg2l_wdt_set_timeout,
 	.restart = rzg2l_wdt_restart,
 };
 
-- 
2.17.1

