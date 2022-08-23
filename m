Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C803559DEC3
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Aug 2022 14:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358742AbiHWL5C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Aug 2022 07:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358845AbiHWLy4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Aug 2022 07:54:56 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 803722190;
        Tue, 23 Aug 2022 02:33:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,257,1654527600"; 
   d="scan'208";a="132257384"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2022 18:33:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.107])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5AF8B423AE47;
        Tue, 23 Aug 2022 18:33:06 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v4 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Date:   Tue, 23 Aug 2022 10:32:33 +0100
Message-Id: <20220823093233.8577-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823093233.8577-1-phil.edworthy@renesas.com>
References: <20220823093233.8577-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
the parity error registers. This means the driver has to reset the
hardware plus set the minimum timeout in order to do a restart and has
a single interrupt.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
 - Fix enum names from I2C_* to WDT_*
 - Change cast from of_device_get_match_data() to avoid clang warning
v3:
 - Don't call pm_runtime_get_sync() in restart()
 - Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP
v2:
 - Replace use of parity error registers in restart
 - Commit msg modified to reflect different contents
---
 drivers/watchdog/rzg2l_wdt.c | 39 ++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 6eea0ee4af49..974a4194a8fd 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -10,7 +10,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -40,6 +40,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+enum rz_wdt_type {
+	WDT_RZG2L,
+	WDT_RZV2M,
+};
+
 struct rzg2l_wdt_priv {
 	void __iomem *base;
 	struct watchdog_device wdev;
@@ -48,6 +53,7 @@ struct rzg2l_wdt_priv {
 	unsigned long delay;
 	struct clk *pclk;
 	struct clk *osc_clk;
+	enum rz_wdt_type devtype;
 };
 
 static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
@@ -142,11 +148,29 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
-	/* Generate Reset (WDTRSTB) Signal on parity error */
-	rzg2l_wdt_write(priv, 0, PECR);
+	if (priv->devtype == WDT_RZG2L) {
+		/* Generate Reset (WDTRSTB) Signal on parity error */
+		rzg2l_wdt_write(priv, 0, PECR);
+
+		/* Force parity error */
+		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
+	} else {
+		/* RZ/V2M doesn't have parity error registers */
+
+		wdev->timeout = 0;
+
+		/* Initialize time out */
+		rzg2l_wdt_init_timeout(wdev);
 
-	/* Force parity error */
-	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
+		/* Initialize watchdog counter register */
+		rzg2l_wdt_write(priv, 0, WDTTIM);
+
+		/* Enable watchdog timer*/
+		rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
+
+		/* Wait 2 consecutive overflow cycles for reset */
+		mdelay(DIV_ROUND_UP(2 * 0xFFFFF * 1000, priv->osc_clk_rate));
+	}
 
 	return 0;
 }
@@ -227,6 +251,8 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to deassert");
 
+	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
+
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
@@ -255,7 +281,8 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzg2l_wdt_ids[] = {
-	{ .compatible = "renesas,rzg2l-wdt", },
+	{ .compatible = "renesas,rzg2l-wdt", .data = (void *)WDT_RZG2L },
+	{ .compatible = "renesas,rzv2m-wdt", .data = (void *)WDT_RZV2M },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
-- 
2.34.1

