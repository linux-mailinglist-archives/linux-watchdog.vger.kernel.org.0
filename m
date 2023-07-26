Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4DD7634BC
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jul 2023 13:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbjGZLWf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jul 2023 07:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjGZLWe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jul 2023 07:22:34 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C2D116;
        Wed, 26 Jul 2023 04:22:32 -0700 (PDT)
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:08 +0800
From:   Huqiang Qin <huqiang.qin@amlogic.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 2/4] watchdog: Add a new struct for Amlogic-GXBB driver
Date:   Wed, 26 Jul 2023 19:21:44 +0800
Message-ID: <20230726112146.1127145-3-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.83]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a new structure wdt_params to describe the watchdog difference
of different chips.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 35d80cb39856..a6c0d743b607 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -22,7 +22,6 @@
 
 #define GXBB_WDT_CTRL_CLKDIV_EN			BIT(25)
 #define GXBB_WDT_CTRL_CLK_EN			BIT(24)
-#define GXBB_WDT_CTRL_EE_RESET			BIT(21)
 #define GXBB_WDT_CTRL_EN			BIT(18)
 #define GXBB_WDT_CTRL_DIV_MASK			(BIT(18) - 1)
 
@@ -45,6 +44,10 @@ struct meson_gxbb_wdt {
 	struct clk *clk;
 };
 
+struct wdt_params {
+	u8 rst_shift;
+};
+
 static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
@@ -140,8 +143,12 @@ static const struct dev_pm_ops meson_gxbb_wdt_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(meson_gxbb_wdt_suspend, meson_gxbb_wdt_resume)
 };
 
+static const struct wdt_params gxbb_params = {
+	.rst_shift = 21,
+};
+
 static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
-	 { .compatible = "amlogic,meson-gxbb-wdt", },
+	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
@@ -150,6 +157,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_gxbb_wdt *data;
+	struct wdt_params *params;
 	u32 ctrl_reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -164,6 +172,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return PTR_ERR(data->clk);
 
+	params = (struct wdt_params *)of_device_get_match_data(dev);
+
 	platform_set_drvdata(pdev, data);
 
 	data->wdt_dev.parent = dev;
@@ -191,7 +201,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	/* Setup with 1ms timebase */
 	ctrl_reg |= ((clk_get_rate(data->clk) / 1000) &
 			GXBB_WDT_CTRL_DIV_MASK) |
-			GXBB_WDT_CTRL_EE_RESET |
+			BIT(params->rst_shift) |
 			GXBB_WDT_CTRL_CLK_EN |
 			GXBB_WDT_CTRL_CLKDIV_EN;
 
-- 
2.37.1

