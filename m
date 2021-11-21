Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8AC45851F
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238616AbhKURAo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238630AbhKURAS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:18 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A174C0613D7
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:10 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id c32so69252477lfv.4
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZgxr5VWcKzaOese34CdY82dfHZfhVgGZXKjQ6A5UTA=;
        b=ThPBptw5FVZvd0ax7ZISjqsp4n/h95JFxBmvbZUOrUehNfGjrD2zGTT2nJnyu6g1Bo
         1a38Z0AFmei8eEwiisuDW0Rll1Y/ikX3Rt9j/XskeulD0rgTB0tCgPvwq5b7SbrTssIY
         U6Ppb0qp2bWnkianF5gNk9tIBBHNQDIoO8cgakXS3D0WQXn81R6ajzcF/sbGwnnrpd+R
         qQbf3fXk3a4lFNEmSZok+4DyT8s3bDMMZ6zxgQz0vKQ9aC07wfIRRoKrVbx0NN+0km8K
         OGAyJDqldFTymhbzk+whTfgVwGUhUdSbf2EtiipLnysSKHwB3WZZI/+YlIBWCOt4zyFN
         RqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZgxr5VWcKzaOese34CdY82dfHZfhVgGZXKjQ6A5UTA=;
        b=G4ebM53jDfVuo8/TIxpCOfJAJ9Oln4pRod2qWjUXg/vK/k4lyjrlo+KegJgwMBwQOu
         WSMgozQRo25AnpMfWjSajh4YjQ60EOGSooU8L+Wypwn+/Wc9bosrare4ND1MRyRFnBE2
         NTot9LWuPrYCYUzrU+lyFYEqicWkjDw6vmsRT2o3/2I7CEYlu6dpGn7Q3s1gO8xmAWC+
         fXGPTEzuG4MLAZ4o98jSh4lNA668ILtQeYhmFNPnYeGCXMWOkEvKzgAigor1/pgehDtG
         oLLv8Z+r7/8Uby/C17jFy/X7sLIcufLOKh1UFn+/vcdpoBW3HpE1tirJh28gS7upSjnU
         aaFg==
X-Gm-Message-State: AOAM530WPzTUg5oyHf6toBuSXUwrjSgSqgg/7BfR98sbE3Ea2ZuCvaOq
        jTfQCBv2zJ5bVW+u4FD4NGXB0g==
X-Google-Smtp-Source: ABdhPJyU682mJ5O2LiJiCidyP7BqjcYSRFpzAWaMKbqJLrmF5XMdKWkauBsf7zI7TgoaeSLm8gs23w==
X-Received: by 2002:a05:6512:3404:: with SMTP id i4mr50002428lfr.689.1637513828927;
        Sun, 21 Nov 2021 08:57:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e5sm695726lfs.51.2021.11.21.08.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:57:08 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 12/12] watchdog: s3c2410: Add Exynos850 support
Date:   Sun, 21 Nov 2021 18:56:47 +0200
Message-Id: <20211121165647.26706-13-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Fixed build error when CONFIG_OF is disabled (found by 0-day):
    added #ifdef CONFIG_OF guard in s3c2410_get_wdt_drv_data()
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - Used pre-defined and completely set driver data for cluster0 and
    cluster1

Changes in v2:
  - Used single compatible for Exynos850, populating missing driver data
    in probe
  - Added "index" property to specify CPU cluster index

 drivers/watchdog/s3c2410_wdt.c | 64 +++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 96aa5d9c6ed4..115a6fe7da57 100644
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
@@ -587,14 +620,40 @@ static inline const struct s3c2410_wdt_variant *
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
 
+#ifdef CONFIG_OF
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
+#endif
+
 	return variant;
 }
 
@@ -615,6 +674,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
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

