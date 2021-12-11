Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387DE4716B9
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 22:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhLKV00 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 16:26:26 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:2584 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229615AbhLKV0Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 16:26:25 -0500
X-IronPort-AV: E=Sophos;i="5.88,199,1635174000"; 
   d="scan'208";a="103588514"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Dec 2021 06:26:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07CD64106FDB;
        Sun, 12 Dec 2021 06:26:22 +0900 (JST)
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
Subject: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for reset_control_{deassert/reset}
Date:   Sat, 11 Dec 2021 21:26:15 +0000
Message-Id: <20211211212617.19639-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If reset_control_deassert()/reset_control_reset() fails, then we
won't be able to access the device registers. Therefore check the
return code of reset_control_deassert()/reset_control_reset() and
return the error code to caller in case of error.

While at it remove the unnecessary pm_runtime_resume_and_get()
from probe(), as it turns on the clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 37 +++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 96f2a018ab62..58fe4efd9a89 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -85,8 +85,14 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
 static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret) {
+		dev_err(wdev->parent, "failed to deassert");
+		return ret;
+	}
 
-	reset_control_deassert(priv->rstc);
 	pm_runtime_get_sync(wdev->parent);
 
 	/* Initialize time out */
@@ -115,9 +121,15 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
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
@@ -151,12 +163,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
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
@@ -204,13 +215,11 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
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
@@ -222,7 +231,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_wdt_reset_assert_pm_disable_put,
+				       rzg2l_wdt_reset_assert_pm_disable,
 				       &priv->wdev);
 	if (ret < 0)
 		return ret;
@@ -235,12 +244,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
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

