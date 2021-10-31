Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0EB440E51
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhJaMZI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbhJaMZF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B229EC061766
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id m14so2011437edd.0
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RrIURYBDP1a4DA6ksSS2HfRMjog60CxjLnvPK1JvsYY=;
        b=L7t4KvygT0p8OiytZYSWDiUqpON58iCWJeGYuOzqgfTttfecUanNS4FYqotOjWYkRv
         B7LKz/thQQZMAdjNV9VNgUZzQA2vHOjr+5b7/PT8ZQKswdA+t3njWAhDK4Sb035h80cy
         dNTgqq5q89SJDeMf/bJ+QK4RwMT/O+2qx8NMrqiJlfzoz4ocLz9/Y3x+Dh9Td0wn4azD
         dLd04ARPF7ZwiEsWtMyp4aGgdpxUfPSrUkOXIj691aBVzdmoLkjlVW+/AKLUXQBA86OJ
         6NJcbPb+nVHiO5HqdImLnfYtZJJUPKdTbXoJscyt8kpNje6vAHM5id9MlHizjs3uUohL
         vZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RrIURYBDP1a4DA6ksSS2HfRMjog60CxjLnvPK1JvsYY=;
        b=REEhhkXsGAC06tkUzBa5iwcNygYjm/1krXcftpL9EL83JmbmFMGFHd++W0o+LxSRvp
         p3UswA4eefZNS329+3pWsCM2QwOPANAoeDou75+xtAt7wRk1icaaahMDyKnwV+8QrLN4
         KNzOtn6aoyBROaSRifYsoz/Fe9hZKFQVA68F0rFhx/FPFgrgD9aWZYISiu0Fi1I4kIZ/
         R9EUl0+VXFs4U8NIhgDSRMYswIXfW4gBau2si1n1SkhVcjf2fogR2GveHdPtwk+z68nr
         u8vTAEhm1KbEsbrruE5/Dtln9ozZ6eLum/W5mSkft/xneWP3HEe+YvTN/HtXdWtbZLox
         8keQ==
X-Gm-Message-State: AOAM533F8Flx8k17yasNfJmKG0izvZnI8t2ek3v45QsqD9AesTWFURUq
        CmA1TNJvnq4RkfWu7FJc0SSx2g==
X-Google-Smtp-Source: ABdhPJwCkdgkMqYQa0on/oyTK0hW4kEysTFYDo0AjYA+3Kh7btNUPIifxFWDd+tEmCwdDfNNgeUNbA==
X-Received: by 2002:a17:906:c20e:: with SMTP id d14mr28982991ejz.207.1635682952320;
        Sun, 31 Oct 2021 05:22:32 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id gt36sm5600717ejc.13.2021.10.31.05.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:31 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 09/12] watchdog: s3c2410: Cleanup PMU related code
Date:   Sun, 31 Oct 2021 14:22:13 +0200
Message-Id: <20211031122216.30212-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Now that PMU enablement code was extended for new Exynos SoCs, it
doesn't look very cohesive and consistent anymore. Do a bit of renaming,
grouping and style changes, to make it look good again.

No functional change, just a refactoring commit.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 48 ++++++++++++++++------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index ec341c876225..fdb1a1e9bd04 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -56,17 +56,16 @@
 #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
 #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
 #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
-#define QUIRK_HAS_PMU_CONFIG			(1 << 0)
-#define QUIRK_HAS_RST_STAT			(1 << 1)
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
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
@@ -146,8 +145,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
 	.mask_bit = 20,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 20,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
@@ -156,8 +155,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 	.mask_bit = 0,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 9,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
@@ -166,8 +165,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.mask_bit = 23,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 23,	/* A57 WDTRESET */
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -253,24 +252,24 @@ static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
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
@@ -531,7 +530,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
 	unsigned int rst_stat;
 	int ret;
 
-	if (!(wdt->drv_data->quirks & QUIRK_HAS_RST_STAT))
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_RST_STAT))
 		return 0;
 
 	ret = regmap_read(wdt->pmureg, wdt->drv_data->rst_stat_reg, &rst_stat);
@@ -672,7 +671,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cpufreq;
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -707,7 +706,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 	int ret;
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -724,8 +723,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
 {
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	s3c2410wdt_mask_and_disable_reset(wdt, true);
-
+	s3c2410wdt_enable(wdt, false);
 	s3c2410wdt_stop(&wdt->wdt_device);
 }
 
@@ -740,7 +738,7 @@ static int s3c2410wdt_suspend(struct device *dev)
 	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
 	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -760,7 +758,7 @@ static int s3c2410wdt_resume(struct device *dev)
 	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
 	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

