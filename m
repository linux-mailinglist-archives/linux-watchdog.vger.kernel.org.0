Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473407F1EEE
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbjKTVVj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjKTVVe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:34 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57F0F4
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso20234785e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515288; x=1701120088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/mzODFNq007haYnpXxrx2Ui7JbMB+DCZL/XRt/A0kU=;
        b=hp7dGtGSmpl+1UlttBbAqhOalOJxq126aQcaIm2J0wBC8EqGiwoxRKXoBEu/w7+xox
         DAcia+WsgQs4ZCw0CLc8N9k+K8BDGyEIiaEraaS7l9qKZcNjSJi7gFBa2G44szYJjzkY
         zoZA4UE8dgIS84iaVW01eP5AtsjAoxhPVEDSW1/q5LoIO7LiHuH4n/e/QrbnaubHxsHQ
         vspNy3lVNH2CuPZ0LL88d8CZXCwf/KFkzW3V6s0hVPPaAc9w57d0vuDa54NZ/xO/gywn
         X/j7DVM/qlp3r95g0xkl87J4H8nqQ6W3OVN/PgH8S3Yw84P1GzN9vWNsPUKZMSviSMK2
         10LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515288; x=1701120088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/mzODFNq007haYnpXxrx2Ui7JbMB+DCZL/XRt/A0kU=;
        b=kIeWMTJMXWrHq4wPgq2+35KS4d8JffbRDkn3XMGMzXpdfNWYb4cXmXEQKgq3d9ctON
         Bgvgo2xBu1wvdTXWWV81/yUqAhSdXrYgawQe9YhrwnEkOHFJrW6+kGPSxStWpoJHOiUh
         1mEC8cFwXMJqs/jk6I4ZyD3HDFBptmZhEAG/eGurME1Wzg09J7692Vkt4t2lw7G8MTf2
         pMVfEmVcrfLLKVcHBTZiyl2PRg4eEKuYNag4tqlGMVcf8huFFHtzpgOw5RwbRsDSiVub
         Cu1nD4e6u4UOWU5V4qeFXMxWsk4lK26jUOMlNDgDFqtchf0wt+cVCc9yt8cOJBzWG7Hb
         q4Tw==
X-Gm-Message-State: AOJu0YxxpJ+eQhk+ZGf6zQc9Vi5dQnrZVrgXwvMXkp9pcTPlD60wWHDn
        yg6AEFiZMMIPy2Y7cXfolJfSng==
X-Google-Smtp-Source: AGHT+IEaUMpDeFVph8md8u4hazPSIXB5CfnkNERv80cTAbsRvaZtvo5jkS181KLGKQuyKUgInEXaQQ==
X-Received: by 2002:a05:600c:1547:b0:405:36d7:4579 with SMTP id f7-20020a05600c154700b0040536d74579mr5882578wmg.28.1700515288355;
        Mon, 20 Nov 2023 13:21:28 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:27 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 14/19] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
Date:   Mon, 20 Nov 2023 21:20:32 +0000
Message-ID: <20231120212037.911774-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch adds the compatibles and drvdata for the Google
gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.

Similar to Exynos850 it has two watchdog instances, one for
each cluster and has some control bits in PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 47 ++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0b4bd883ff28..08b8c57dd812 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -67,6 +67,13 @@
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
+#define GS_CLUSTER0_NONCPU_OUT			0x1220
+#define GS_CLUSTER1_NONCPU_OUT			0x1420
+#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
+#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
+#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
+#define GS_RST_STAT_REG_OFFSET			0x3B44
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -263,6 +270,30 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 0,
+	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 8,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
+	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 1,
+	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_WTCLRINT_REG,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -278,6 +309,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "google,gs101-wdt",
+	  .data = &drv_data_gs101_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -585,9 +618,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	/* Choose Exynos850/ExynosAutov9/gs101 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
-	    variant == &drv_data_exynosautov9_cl0) {
+	    variant == &drv_data_exynosautov9_cl0 ||
+	    variant == &drv_data_gs101_cl0) {
 		u32 index;
 		int err;
 
@@ -600,9 +634,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 		case 0:
 			break;
 		case 1:
-			variant = (variant == &drv_data_exynos850_cl0) ?
-				&drv_data_exynos850_cl1 :
-				&drv_data_exynosautov9_cl1;
+			if (variant == &drv_data_exynos850_cl0)
+				variant = &drv_data_exynos850_cl1;
+			else if (variant == &drv_data_exynosautov9_cl0)
+				variant = &drv_data_exynosautov9_cl1;
+			else if (variant == &drv_data_gs101_cl0)
+				variant = &drv_data_gs101_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0.rc1.413.gea7ed67945-goog

