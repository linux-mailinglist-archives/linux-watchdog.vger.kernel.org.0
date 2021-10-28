Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A1F43E873
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 20:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhJ1SiE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 14:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhJ1SiC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 14:38:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03326C061570
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s19so12231791ljj.11
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mR7X/IRD55/2aUJkOcwQinPxIZP7fj14y1hJFj2Tov8=;
        b=oVkXietcdHlzO8yulojwUbd/x80sHG/nhtTKAc6pmjYT27sY4wCda/6vpvlHObluDd
         ykDgLQW6UCEwJ8VGPSdgfTWkA3Adr12Dpjr/IpmbN7d7WdUniwR5WAB2r2e54r5rwfb7
         bt2ppMzQgd5sB1j5f9T44WLkEsaiz/Dk5D/jDpuG+8rP/ZomDZj9jn0D9K3D4QoDxL3q
         /MIInomGW1Bu41RWYk11/ytEjSZYN1ECtvRDNi6X8OXUgoKOSoHCK/jbWhSmdHSXslc0
         ZY2cENK5q34i3ZBcOsI/yZam4UcJh9W92COXkAgaux95iZng7vewGbDybDum2uh6Vj8t
         aqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mR7X/IRD55/2aUJkOcwQinPxIZP7fj14y1hJFj2Tov8=;
        b=aGckZHl2Ay4psAS0pb5mEziCipdNFffXREe+qS4QW2FXctpmVV5cGtjHWUk7XL74Bv
         8S53n7g5J3wG2tVgpEsB2Tx+Go/qZyGD0ZzI0jCoftYc/ytTeEsKdkiYNo/AUJ/8TRPh
         DyPQRX8/kd8m8FGQCPRTx9Soklw9AHiYgiLAN7USo0aIrkGe1uQGLmH3s4PibVmREmFu
         XQOSZCOpn6CRBRVNoecOibMCvTNf83bTE4D60MJNiXI0Sen9K5d2pfjsoIllr5M3GZFs
         S83lFnCg+8E/kvfWwAN/oIdbXwZheB1KbYlH+bHiI/TLu2EAlE5pwnyBE6uFft0Ukplp
         jizw==
X-Gm-Message-State: AOAM533zYpfEW+LKKyX17EoshQg+LA3d9itkFSK/PEMOc1Bgs84WzBxg
        8/g2hEOBCoG+cjcXfcsorZePMQ==
X-Google-Smtp-Source: ABdhPJzcZmQk867wp52X0ImV5pDUvY+SDQshuWhs0SWpOCbNBmz9aPC3FxYi4n1W1qZBmYa7ffVXgQ==
X-Received: by 2002:a2e:891a:: with SMTP id d26mr6530702lji.91.1635446133295;
        Thu, 28 Oct 2021 11:35:33 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f8sm390614lfu.5.2021.10.28.11.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:32 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/7] watchdog: s3c2410: Make reset disable optional
Date:   Thu, 28 Oct 2021 21:35:23 +0300
Message-Id: <20211028183527.3050-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Not all SoCs have AUTOMATIC_WDT_RESET_DISABLE register, examples are
Exynos850 and Exynos9. On such chips reset disable register shouldn't be
accessed. Provide a way to avoid handling that register. This is done by
introducing separate callbacks to driver data structure: one for reset
disable register, and one for mask reset register. Now those callbacks
can be checked and called only when those were set in driver data.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 81 ++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 23 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2395f353e52d..7c163a257d3c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -83,6 +83,8 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 			__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to reboot (default 0)");
 
+struct s3c2410_wdt;
+
 /**
  * struct s3c2410_wdt_variant - Per-variant config data
  *
@@ -96,6 +98,11 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
  * reset.
  * @quirks: A bitfield of quirks.
+ * @disable_auto_reset: If set, this function will be called to disable
+ * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
+ * disable_reg field.
+ * @mask_reset: If set, this function will be called to mask WDT reset request;
+ * uses mask_reset_reg and mask_bit fields.
  */
 
 struct s3c2410_wdt_variant {
@@ -105,6 +112,8 @@ struct s3c2410_wdt_variant {
 	int rst_stat_reg;
 	int rst_stat_bit;
 	u32 quirks;
+	int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
+	int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
 };
 
 struct s3c2410_wdt {
@@ -121,6 +130,9 @@ struct s3c2410_wdt {
 	struct regmap *pmureg;
 };
 
+static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
+static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
+
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
 	.quirks = 0
 };
@@ -138,6 +150,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
 	.rst_stat_bit = 20,
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
 		  | QUIRK_HAS_WTCLRINT_REG,
+	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
+	.mask_reset = s3c2410wdt_mask_wdt_reset,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
@@ -148,6 +162,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 	.rst_stat_bit = 9,
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
 		  | QUIRK_HAS_WTCLRINT_REG,
+	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
+	.mask_reset = s3c2410wdt_mask_wdt_reset,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
@@ -158,6 +174,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.rst_stat_bit = 23,	/* A57 WDTRESET */
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
 		  | QUIRK_HAS_WTCLRINT_REG,
+	.disable_auto_reset = s3c2410wdt_disable_wdt_reset,
+	.mask_reset = s3c2410wdt_mask_wdt_reset,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -200,35 +218,53 @@ static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
 	return container_of(nb, struct s3c2410_wdt, freq_transition);
 }
 
-static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
+static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
+	const u32 mask_val = 1 << wdt->drv_data->mask_bit;
+	const u32 val = mask ? mask_val : 0;
 	int ret;
-	u32 mask_val = 1 << wdt->drv_data->mask_bit;
-	u32 val = 0;
 
-	/* No need to do anything if no PMU CONFIG needed */
-	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG))
-		return 0;
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->disable_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
 
-	if (mask)
-		val = mask_val;
+	return ret;
+}
 
-	ret = regmap_update_bits(wdt->pmureg,
-			wdt->drv_data->disable_reg,
-			mask_val, val);
-	if (ret < 0)
-		goto error;
+static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
+{
+	const u32 mask_val = 1 << wdt->drv_data->mask_bit;
+	const u32 val = mask ? mask_val : 0;
+	int ret;
 
-	ret = regmap_update_bits(wdt->pmureg,
-			wdt->drv_data->mask_reset_reg,
-			mask_val, val);
- error:
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
+				 mask_val, val);
 	if (ret < 0)
 		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
 
 	return ret;
 }
 
+static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
+{
+	int ret;
+
+	if (wdt->drv_data->disable_auto_reset) {
+		ret = wdt->drv_data->disable_auto_reset(wdt, !en);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (wdt->drv_data->mask_reset) {
+		ret = wdt->drv_data->mask_reset(wdt, !en);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
@@ -609,7 +645,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cpufreq;
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -655,7 +691,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 	int ret;
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -672,8 +708,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
 {
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	s3c2410wdt_mask_and_disable_reset(wdt, true);
-
+	s3c2410wdt_enable(wdt, false);
 	s3c2410wdt_stop(&wdt->wdt_device);
 }
 
@@ -688,7 +723,7 @@ static int s3c2410wdt_suspend(struct device *dev)
 	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
 	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -708,7 +743,7 @@ static int s3c2410wdt_resume(struct device *dev)
 	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
 	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

