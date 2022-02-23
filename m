Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637414C181B
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Feb 2022 17:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235779AbiBWQGq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Feb 2022 11:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbiBWQGp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Feb 2022 11:06:45 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF888C4849
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Feb 2022 08:06:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,391,1635174000"; 
   d="scan'208";a="111356432"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2022 01:01:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5D7934004923;
        Thu, 24 Feb 2022 01:01:13 +0900 (JST)
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
Subject: [PATCH v4 4/6] watchdog: rzg2l_wdt: Add error check for reset_control_deassert
Date:   Wed, 23 Feb 2022 16:00:58 +0000
Message-Id: <20220223160100.23543-5-biju.das.jz@bp.renesas.com>
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

If reset_control_deassert() fails, then we won't be able to
access the device registers. Therefore check the return code of
reset_control_deassert() and bailout in case of error.

While at it change reset_control_assert->reset_control_reset in
rzg2l_wdt_stop() and remove unnecessary reset_control_deassert()
from rzg2l_wdt_start().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Made reset usage counter balanced
 * Updated commit description
v2->v3:
 * Patch reordering from Patch 2 -> Patch 3
 * Updated commit description
v1->v2:
 * Updated commit description and removed Rb tag from Guenter,
   since there is code change
 * Replaced reset_control_assert with reset_control_reset in stop
   and removed reset_control_deassert() from start.
---
 drivers/watchdog/rzg2l_wdt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 48dfe6e5e64f..73b667ed3e99 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -88,7 +88,6 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
-	reset_control_deassert(priv->rstc);
 	pm_runtime_get_sync(wdev->parent);
 
 	/* Initialize time out */
@@ -108,7 +107,7 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	pm_runtime_put(wdev->parent);
-	reset_control_assert(priv->rstc);
+	reset_control_reset(priv->rstc);
 
 	return 0;
 }
@@ -204,7 +203,10 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	reset_control_deassert(priv->rstc);
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert");
+
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.17.1

