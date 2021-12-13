Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E5247306B
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 16:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbhLMP1I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 10:27:08 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:60167 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234672AbhLMP1I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 10:27:08 -0500
X-IronPort-AV: E=Sophos;i="5.88,202,1635174000"; 
   d="scan'208";a="103326599"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2021 00:27:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C2CC440078D4;
        Tue, 14 Dec 2021 00:27:03 +0900 (JST)
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
Subject: [PATCH v2 2/4] watchdog: rzg2l_wdt: Add error check for reset_control_{deassert/reset}
Date:   Mon, 13 Dec 2021 15:26:56 +0000
Message-Id: <20211213152658.26225-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
References: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If reset_control_deassert() fails, then we won't be able to
access the device registers. Therefore check the return code of
reset_control_deassert() and bail out in case of error.

While at it remove the unnecessary pm_runtime_resume_and_get()
from probe(), as it turns on the clocks.

Replace reset_control_assert()->reset_control_reset() in rzg2l_wdt
_stop() and remove the unnecessary reset_control_deassert() from
rzg2l_wdt_start(). Also add error check for reset_control_reset()

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description and removed Rb tag from Guenter,
   since there is code change
 * Replaced reset_control_assert with reset_control_reset in stop
   and removed reset_control_deassert() from start.
 * 
---
 drivers/watchdog/rzg2l_wdt.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 96f2a018ab62..0e62d7be153c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -86,7 +86,6 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
-	reset_control_deassert(priv->rstc);
 	pm_runtime_get_sync(wdev->parent);
 
 	/* Initialize time out */
@@ -106,18 +105,24 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	pm_runtime_put(wdev->parent);
-	reset_control_assert(priv->rstc);
 
-	return 0;
+	/* Reset the module for stopping watchdog */
+	return reset_control_reset(priv->rstc);
 }
 
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
 	/* Reset the module before we modify any register */
-	reset_control_reset(priv->rstc);
+	ret = reset_control_reset(priv->rstc);
+	if (ret) {
+		dev_err(wdev->parent, "failed to reset");
+		return ret;
+	}
+
 	pm_runtime_get_sync(wdev->parent);
 
 	/* smallest counter value to reboot soon */
@@ -151,12 +156,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.restart = rzg2l_wdt_restart,
 };
 
-static void rzg2l_wdt_reset_assert_pm_disable_put(void *data)
+static void rzg2l_wdt_reset_assert_pm_disable(void *data)
 {
 	struct watchdog_device *wdev = data;
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
-	pm_runtime_put(wdev->parent);
 	pm_runtime_disable(wdev->parent);
 	reset_control_assert(priv->rstc);
 }
@@ -204,13 +208,11 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	reset_control_deassert(priv->rstc);
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert");
+
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed ret=%pe", ERR_PTR(ret));
-		goto out_pm_get;
-	}
 
 	priv->wdev.info = &rzg2l_wdt_ident;
 	priv->wdev.ops = &rzg2l_wdt_ops;
@@ -222,7 +224,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_wdt_reset_assert_pm_disable_put,
+				       rzg2l_wdt_reset_assert_pm_disable,
 				       &priv->wdev);
 	if (ret < 0)
 		return ret;
@@ -235,12 +237,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		dev_warn(dev, "Specified timeout invalid, using default");
 
 	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
-
-out_pm_get:
-	pm_runtime_disable(dev);
-	reset_control_assert(priv->rstc);
-
-	return ret;
 }
 
 static const struct of_device_id rzg2l_wdt_ids[] = {
-- 
2.17.1

