Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3604475CE
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbhKGUdK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236582AbhKGUcv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:51 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41970C061234
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:30:02 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 13so7529729ljj.11
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chqQsN2BoHNjDvulXyc7vUHvQRCiJOGxZUcMVnPMO7g=;
        b=E/GniszCmrj1uMdiF4iuPkf523pTtWoChlNlWa693rork2ecMRjOmXw9Gq7cfotPdB
         hywHzdohV9tYKXyXdhEYvb6lSzwUozTaY9QCui8bzDyONSVxeFkf2rjTZJgNlxvY1eVH
         J70QmucpFpgQzZ5ij940gDykPKdozT7bLVmlgp5c61HPI4MZg+4l0VSyfkxK8zZ4tEGd
         AUO/EzKO01uITmwgUFyqcq4jkrmP/FhBiWH57PVwCdagIGNCG0o6ADnA9w/yaF9QR5od
         qlfTeLuoiEyWiOvuYrZnKLijmalAtwPvsYHQaRrGShZQ9n4CQO+Spnn+4TMyj5rsRB5c
         bxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chqQsN2BoHNjDvulXyc7vUHvQRCiJOGxZUcMVnPMO7g=;
        b=HJk9MvuaMTFIVZBoLYzZrQPK5rfL4Jbd8Lg5pTWEcKbDaoZusl3dHyObonhtQpEhLL
         fblXgLa+87xUnKJD9WW6ti+X+NrE1kEYOY4+rkR2kRK7kINt/RPy9maoukKV6sFhYOxH
         bpMd/La29zqGBkvhBrli94Vp7Zjr4UMjJQO5y4Fr9YiEYBQg8G78BaF5zgAEnPA3BvZb
         b1y3tEfkkNGvQMeAT0QDWBIXkWqcmm66J4llv4cBSDH9FRs8y+3np8pSM92KQ2bCx2Xx
         uWgx95C+f6EW+HlLYRw7M2tmyMXA847RGckL4aB8RslTgpvmDi2af/HpFpvAto7a/2Aw
         4hwg==
X-Gm-Message-State: AOAM531Me9e9zl649f7kP+Ze0eSK/xegQo1fHlpS3XIGgdx9yUfhK5RZ
        e1Y5LwQm4NwKriUfjcbCLgN7LQ==
X-Google-Smtp-Source: ABdhPJxtUveY/BWcA57HhaAEtu4VP1QLe5RBems9spc+AznVSnpAypW+2ZiXFuq01uefezoTKExXlw==
X-Received: by 2002:a05:651c:481:: with SMTP id s1mr80458018ljc.279.1636317000643;
        Sun, 07 Nov 2021 12:30:00 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i13sm1570037lfb.45.2021.11.07.12.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:30:00 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 09/12] watchdog: s3c2410: Cleanup PMU related code
Date:   Sun,  7 Nov 2021 22:29:40 +0200
Message-Id: <20211107202943.8859-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Now that PMU enablement code was extended for new Exynos SoCs, it
doesn't look very cohesive and consistent anymore. Do a bit of renaming,
grouping and style changes, to make it look good again. While at it, add
quirks documentation as well.

No functional change, just a refactoring commit.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added quirks documentation
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index ec341c876225..f211be8bf976 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -56,17 +56,51 @@
 #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
 #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
 #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
-#define QUIRK_HAS_PMU_CONFIG			(1 << 0)
-#define QUIRK_HAS_RST_STAT			(1 << 1)
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
+
+/**
+ * Quirk flags for different Samsung watchdog IP-cores.
+ *
+ * This driver supports multiple Samsung SoCs, each of which might have
+ * different set of registers and features supported. As watchdog block
+ * sometimes requires modifying PMU registers for proper functioning, register
+ * differences in both watchdog and PMU IP-cores should be accounted for. Quirk
+ * flags described below serve the purpose of telling the driver about mentioned
+ * SoC traits, and can be specified in driver data for each particular supported
+ * device.
+ *
+ * %QUIRK_HAS_WTCLRINT_REG: Watchdog block has WTCLRINT register. It's used to
+ * clear the interrupt once the interrupt service routine is complete. It's
+ * write-only, writing any values to this register clears the interrupt, but
+ * reading is not permitted.
+ *
+ * %QUIRK_HAS_PMU_MASK_RESET: PMU block has the register for disabling/enabling
+ * WDT reset request. On old SoCs it's usually called MASK_WDT_RESET_REQUEST,
+ * new SoCs have CLUSTERx_NONCPU_INT_EN register, which 'mask_bit' value is
+ * inverted compared to the former one.
+ *
+ * %QUIRK_HAS_PMU_RST_STAT: PMU block has RST_STAT (reset status) register,
+ * which contains bits indicating the reason for most recent CPU reset. If
+ * present, driver will use this register to check if previous reboot was due to
+ * watchdog timer reset.
+ *
+ * %QUIRK_HAS_PMU_AUTO_DISABLE: PMU block has AUTOMATIC_WDT_RESET_DISABLE
+ * register. If 'mask_bit' bit is set, PMU will disable WDT reset when
+ * corresponding processor is in reset state.
+ *
+ * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
+ * with "watchdog counter enable" bit. That bit should be set to make watchdog
+ * counter running.
+ */
+#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
+#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
+#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
 
 /* These quirks require that we have a PMU register map */
-#define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
-						 QUIRK_HAS_RST_STAT | \
-						 QUIRK_HAS_PMU_AUTO_DISABLE | \
-						 QUIRK_HAS_PMU_CNT_EN)
+#define QUIRKS_HAVE_PMUREG \
+	(QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_RST_STAT | \
+	 QUIRK_HAS_PMU_AUTO_DISABLE | QUIRK_HAS_PMU_CNT_EN)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -146,8 +180,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
 	.mask_bit = 20,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 20,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
@@ -156,8 +190,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 	.mask_bit = 0,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 9,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
@@ -166,8 +200,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.mask_bit = 23,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 23,	/* A57 WDTRESET */
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -253,24 +287,24 @@ static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
 	return ret;
 }
 
-static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
+static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 {
 	int ret;
 
 	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
-		ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
+		ret = s3c2410wdt_disable_wdt_reset(wdt, !en);
 		if (ret < 0)
 			return ret;
 	}
 
-	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
-		ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_MASK_RESET) {
+		ret = s3c2410wdt_mask_wdt_reset(wdt, !en);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
-		ret = s3c2410wdt_enable_counter(wdt, !mask);
+		ret = s3c2410wdt_enable_counter(wdt, en);
 		if (ret < 0)
 			return ret;
 	}
@@ -531,7 +565,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
 	unsigned int rst_stat;
 	int ret;
 
-	if (!(wdt->drv_data->quirks & QUIRK_HAS_RST_STAT))
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_RST_STAT))
 		return 0;
 
 	ret = regmap_read(wdt->pmureg, wdt->drv_data->rst_stat_reg, &rst_stat);
@@ -672,7 +706,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cpufreq;
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -707,7 +741,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 	int ret;
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -724,8 +758,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
 {
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	s3c2410wdt_mask_and_disable_reset(wdt, true);
-
+	s3c2410wdt_enable(wdt, false);
 	s3c2410wdt_stop(&wdt->wdt_device);
 }
 
@@ -740,7 +773,7 @@ static int s3c2410wdt_suspend(struct device *dev)
 	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
 	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -760,7 +793,7 @@ static int s3c2410wdt_resume(struct device *dev)
 	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
 	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

