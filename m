Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D060484790
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jan 2022 19:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbiADSMu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jan 2022 13:12:50 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6115 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236124AbiADSMt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jan 2022 13:12:49 -0500
X-IronPort-AV: E=Sophos;i="5.88,261,1635174000"; 
   d="scan'208";a="105494514"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jan 2022 03:12:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1724040BB07B;
        Wed,  5 Jan 2022 03:12:46 +0900 (JST)
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
Subject: [PATCH v3 4/4] watchdog: rzg2l_wdt: Add set_timeout callback
Date:   Tue,  4 Jan 2022 18:12:48 +0000
Message-Id: <20220104181249.3174-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Once watchdog is started, WDT cycle setting register(WDTSET) cannot be
changed. However we can reconfigure the new value for WDTSET, after a
module reset. Otherwise it will ignore the writes and will hold the
previous value instead of the updated one.

This patch add support for set_timeout callback. Based on the
watchdog timer state, it may restart WDT with the modified values.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Patch reodering Patch 3 -> patch 4
 * Updated commit description.
V1->V2:
 * Updated commit description
 * Removed stop/start and started using reset() instead.
 * After reset, Start WDT based on watchdog timer state.
---
 drivers/watchdog/rzg2l_wdt.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 024e7bf796c6..94f98825ab8d 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -113,6 +113,33 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	return reset_control_reset(priv->rstc);
 }
 
+static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
+{
+	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	wdev->timeout = timeout;
+
+	/*
+	 * We need to reset the module for updating WDTSET register
+	 * If watchdog is active, then decrement the PM counter to make
+	 * it balanced, after reset operation.
+	 */
+	if (watchdog_active(wdev))
+		pm_runtime_put(wdev->parent);
+
+	/* Reset the module for updating WDTSET register */
+	ret = reset_control_reset(priv->rstc);
+	if (watchdog_active(wdev)) {
+		if (ret)
+			pm_runtime_get_sync(wdev->parent);
+		else
+			rzg2l_wdt_start(wdev);
+	}
+
+	return ret;
+}
+
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
@@ -146,6 +173,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.start = rzg2l_wdt_start,
 	.stop = rzg2l_wdt_stop,
 	.ping = rzg2l_wdt_ping,
+	.set_timeout = rzg2l_wdt_set_timeout,
 	.restart = rzg2l_wdt_restart,
 };
 
-- 
2.17.1

