Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B344C4475D8
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbhKGUdW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236579AbhKGUdJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:33:09 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133C6C061205
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:30:07 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bi35so31555978lfb.9
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FXAys4F2ibTIQs+sq0fDW6xOS098cuDbLHdnNGTjsAo=;
        b=TkttbcRZ4B7USPq/+cSBKyyTionhl3NhWWD4lovc5vz/QV0NeK0mrbvr5LtvPdmrDa
         SfmED1rAsKRuSSlGFiApJwVLDx/+3uacTUz1Q0R1Iedh4vqBLvaLTLZAJppnKwGFnITd
         YBy35o1eeS22GuOEn0+F9GS7H/4qqZHiS0Kbf6EKVHEr9pA54/XpKf+wfTxzO5dOwvzc
         cN5ul3eWVGK1kMyq5FYTP51NRbOZwDV7VDTjg5P7wg5yndvx5DReKGqmeCID/v4ey55c
         QHv1uli/5BDrL2iMuyO2b2vWcq/zReOoAlaD2i17PINdF5B23C5AHHGzdULIspfog/og
         qgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FXAys4F2ibTIQs+sq0fDW6xOS098cuDbLHdnNGTjsAo=;
        b=ZbTewmbS4KzWBhgLG0mqMP9XRhSMDBpmn5LlLF5btS+Jb6VzmEWOsW/mizNlFukq4E
         BGijMzqv4bmfPl3gKT9n4pKEGMJYPT+m9VmywggTFGEqfkfEzNOjYi7w7YDYO079uCIv
         yS/1AtuKzRNIFQ3+s95yiKe20kF56fGDuOfp7tuTWwRR8PfMn4fRtot23PhApwrH4V5+
         BKpPWxffaTRqIGHUKFqzqNwKRVeE1lYxLNPiLOMjbGwmrHo0J1ySG1dOEdzlmlA9yWmi
         gX5scklsYCXEQEHiE0mTAeWxa/mlw53JwYGPeF0X0Ws0S1e3rjIW7FbnN/pnkNJHITPe
         MyrA==
X-Gm-Message-State: AOAM531spejW9bQQ/cBHwqNJcq4IWYVwG7/R+JNUfNLI8uiAwRjGtAHC
        QqWKA605xXEJaymhNnV/+V7Zdg==
X-Google-Smtp-Source: ABdhPJy7PfblvJlOuqmcggvbIIQA3eZk0eKINJ61c90bjZv+IxrgEF3WVnQJqRpOa81qvpIrkxVokQ==
X-Received: by 2002:a19:7b1b:: with SMTP id w27mr27302828lfc.379.1636317005429;
        Sun, 07 Nov 2021 12:30:05 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id a23sm440816ljh.140.2021.11.07.12.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:30:05 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 12/12] watchdog: s3c2410: Add Exynos850 support
Date:   Sun,  7 Nov 2021 22:29:43 +0200
Message-Id: <20211107202943.8859-13-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos850 is a bit different from SoCs already supported in WDT driver:
  - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
    always 0; .disable_auto_reset callback is not set for that reason
  - MASK_WDT_RESET_REQUEST register is replaced with
    CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
    reset interrupt it's now enabled with the same value; .mask_reset
    callback is reused for that functionality though
  - To make WDT functional, WDT counter needs to be enabled in
    CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
    callback

Also Exynos850 has two CPU clusters, each has its own dedicated WDT
instance. Different PMU registers and bits are used for each cluster. So
driver data is now modified in probe, adding needed info depending on
cluster index passed from device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - Used pre-defined and completely set driver data for cluster0 and
    cluster1

Changes in v2:
  - Used single compatible for Exynos850, populating missing driver data
    in probe
  - Added "index" property to specify CPU cluster index

 drivers/watchdog/s3c2410_wdt.c | 62 +++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 96aa5d9c6ed4..1456201f27de 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -56,6 +56,13 @@
 #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
 #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
 #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
+#define EXYNOS850_CLUSTER0_NONCPU_OUT		0x1220
+#define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
+#define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
+#define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
+
+#define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
+#define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
 
 /**
  * Quirk flags for different Samsung watchdog IP-cores.
@@ -205,6 +212,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos850_cl0 = {
+	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
+	.mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -216,6 +247,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos5420 },
 	{ .compatible = "samsung,exynos7-wdt",
 	  .data = &drv_data_exynos7 },
+	{ .compatible = "samsung,exynos850-wdt",
+	  .data = &drv_data_exynos850_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -587,14 +620,38 @@ static inline const struct s3c2410_wdt_variant *
 s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 {
 	const struct s3c2410_wdt_variant *variant;
+	struct device *dev = &pdev->dev;
 
-	variant = of_device_get_match_data(&pdev->dev);
+	variant = of_device_get_match_data(dev);
 	if (!variant) {
 		/* Device matched by platform_device_id */
 		variant = (struct s3c2410_wdt_variant *)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
+	/* Choose Exynos850 driver data w.r.t. cluster index */
+	if (variant == &drv_data_exynos850_cl0) {
+		u32 index;
+		int err;
+
+		err = of_property_read_u32(dev->of_node,
+					   "samsung,cluster-index", &index);
+		if (err) {
+			dev_err(dev, "failed to get cluster index\n");
+			return NULL;
+		}
+
+		switch (index) {
+		case 0:
+			return &drv_data_exynos850_cl0;
+		case 1:
+			return &drv_data_exynos850_cl1;
+		default:
+			dev_err(dev, "wrong cluster index: %u\n", index);
+			return NULL;
+		}
+	}
+
 	return variant;
 }
 
@@ -615,6 +672,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device = s3c2410_wdd;
 
 	wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
+	if (!wdt->drv_data)
+		return -EINVAL;
+
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
 		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
 						"samsung,syscon-phandle");
-- 
2.30.2

