Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392C3440E60
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhJaMZU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbhJaMZK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:10 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A7BC061203
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w1so1029900edd.10
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3iEY6GQYQz83dpV+fT6R+J5oU7g9/XFul1oWQ/m49lI=;
        b=paMNXcWgNsqVxxXLElooVUCI5zgF9Hx8RgxZ2SqhdtT64USC0+p7vplys9LI42Uk+1
         XcU4l37vhiQcoRIWt5azDuYrnmh5IDKVqJc2xo/tk8KjqUUnlgSmmo4z9NkvrcU3SSX5
         QoN4cEBdqEFK6lU+VVqu6DYrBL1qV2xiY1ny52WZRRYLeQpL/MYhO+j/03383iBqwu8P
         RmzESNsirHGqn4jcwi801Dial2eRQkEliy84+LkWS1TprmKj0oHbrNH75HxsPQuJlhEl
         SX9IMToBjQAihJR4aIzFvGGKsjBCXpjLOVv2nMhhF/Rn7p+nTy2kDV30CrexMJ0fbxfK
         B+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iEY6GQYQz83dpV+fT6R+J5oU7g9/XFul1oWQ/m49lI=;
        b=mOjOF8Pl9W3Vi9UeJ4nGLR4riDMONLCp752cpy0BUSSxUqCf5/CrKz9D+4Eyd9aRtv
         cCU2gZqUKHlSA23cpqoDBikV82nAThy086xNU3geHTKENfyWM94I9jkIA8KKkIooQ5M3
         WUP8p/okmx7NssgiwJvxqry3YJI+K0IH2iqa73ZX/q6CAM4L25yAn6Ri8Insmku8PgEh
         jvW0zUMdyRCjrOaFg7D3jUCy8sjul3YPHXKLZETMSxXR4Yy5OeykbeUyFIq6euS/p5QV
         CqpVxzf3iq8RArLeFYnCjMKAyCCSfrXOsOGWMPwroNdicCP5xJpAQFUZdlOtPRDnU2ni
         3qfQ==
X-Gm-Message-State: AOAM5300vZo2l+wVqkE86fIDuUGpBBaqP6tiedpv0lcTGRddTyATlz7l
        vxbaOoqMFJWDon5Tu6KJoolUPg==
X-Google-Smtp-Source: ABdhPJxPnAd54K37gzIe2vTLOeK3l83domUTd7RNcjPhHCG0f0Gc1/AJpu51uIXA6chLbUgrUG730g==
X-Received: by 2002:aa7:da10:: with SMTP id r16mr9332682eds.56.1635682956847;
        Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id eg33sm4316607edb.77.2021.10.31.05.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 12/12] watchdog: s3c2410: Add Exynos850 support
Date:   Sun, 31 Oct 2021 14:22:16 +0200
Message-Id: <20211031122216.30212-13-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
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
Changes in v2:
  - Used single compatible for Exynos850, populating missing driver data in
    probe
  - Added "index" property to specify CPU cluster index

 drivers/watchdog/s3c2410_wdt.c | 68 +++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 8fdda2ede1c3..457b725c30ac 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -56,6 +56,14 @@
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
+
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
 #define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
 #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
@@ -171,6 +179,21 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos850 = {
+	/*
+	 * Next fields will be set in probe(), based on cluster index:
+	 *   - .mask_reset_reg
+	 *   - .rst_stat_bit
+	 *   - .cnt_en_reg
+	 */
+	.mask_reset_inv = true,
+	.mask_bit = 2,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -182,6 +205,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos5420 },
 	{ .compatible = "samsung,exynos7-wdt",
 	  .data = &drv_data_exynos7 },
+	{ .compatible = "samsung,exynos850-wdt",
+	  .data = &drv_data_exynos850 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -548,15 +573,51 @@ static inline const struct s3c2410_wdt_variant *
 s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 {
 	const struct s3c2410_wdt_variant *variant;
+	struct s3c2410_wdt_variant *data;
+	struct device *dev = &pdev->dev;
 
-	variant = of_device_get_match_data(&pdev->dev);
+	variant = of_device_get_match_data(dev);
 	if (!variant) {
 		/* Device matched by platform_device_id */
 		variant = (struct s3c2410_wdt_variant *)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-	return variant;
+	/* Have to copy driver data over to keep its const qualifier intact */
+	data = devm_kmemdup(dev, variant, sizeof(*variant), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	/* Populate missing fields for Exynos850 w.r.t. cluster index */
+	if (variant == &drv_data_exynos850) {
+		u32 index;
+		int err;
+
+		err = of_property_read_u32(dev->of_node, "samsung,index",
+					   &index);
+		if (err) {
+			dev_err(dev, "failed to get cluster index\n");
+			return NULL;
+		}
+
+		switch (index) {
+		case 0:
+			data->mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN;
+			data->rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT;
+			data->cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT;
+			break;
+		case 1:
+			data->mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN;
+			data->rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT;
+			data->cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT;
+			break;
+		default:
+			dev_err(dev, "wrong cluster index: %u\n", index);
+			return NULL;
+		}
+	}
+
+	return data;
 }
 
 static int s3c2410wdt_probe(struct platform_device *pdev)
@@ -576,6 +637,9 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
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

