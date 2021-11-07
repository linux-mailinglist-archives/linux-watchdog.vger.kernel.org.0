Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A235B4475BE
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbhKGUco (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbhKGUcj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:39 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A25C0613F5
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:29:55 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id t11so25491702ljh.6
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PV4wSwCJbaHu7YgJIh/vsbng91RXEQ93wj70IiPFNI=;
        b=zei/iqlL1FfMW2/gdIn/GjaFV4QQD4s1Q7smy8yjq5Hu+1O4dfSTT4RN7BAWLWLmF4
         F11agR++myXSdKjI8gDJ7t8Tii2ZJHszCVD2uasffhLwq5iVyEq7E2qf1t5ckeuAWREZ
         VlLTaOSRziGbWXxgv1RLu/KNuY86ctM8mcAoustNlLGYeL3wD5oGSpmXZAnEZnsd8cq3
         gPwaOkViGqVJ7iuvUB91GY+Yut6CdmvOTFHqZ18+CE10PwxxR7TBplVQyUo97nK78WcF
         grwlLRX5t9l0AcBZSZGQ5EBu40i0jfvFuFIMow4/E9PkCw9y5tPouixcfTlLPudoJOPF
         lboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PV4wSwCJbaHu7YgJIh/vsbng91RXEQ93wj70IiPFNI=;
        b=3QvH0Y+dGo8ngryzUkQV1aojMhKE2oG4fSxpc6K38/6vYuYvDrY7DUzf8DykXl/+LB
         1sXhuaOdJRoROpMFwjKEKKcm+Z6RCtVZ03QmKcESx8Q6C48s3bJUl/PfLXsev5IMkV3U
         5mmdqeFOL/0rz6AJJFMrLv7JUeMa9BvJqjMhTt3sJBMhTaaTLNLNckgogi6/r6U8qidR
         fRf22Q65sSCq5VNqPcpp+BEHx+mCeL4j3gUNSKNdZT4E51rllT9euHNNBtJT8FhdnVg1
         qOCXsiBYyYJet3QcykKDJMGAZtHEPlrmuS0pLxS76FfS7baWAtv5kb9lmdFvZAT5gLsv
         3fUQ==
X-Gm-Message-State: AOAM5304k5Ieumj4rfjI3E+zkP2Uu8S9NHluhoN7+6ksf2pvD7au6oVw
        D7kSXDnCMAJs6EybvvGngFWfOA==
X-Google-Smtp-Source: ABdhPJwHl3dUBT+48Y8TwRqMoUuSAnURp6KkTjo7a/lWo4Q80Z0LiHa+JYrO+lNJ5ZvqnpltCW3ORw==
X-Received: by 2002:a2e:92c4:: with SMTP id k4mr62677573ljh.271.1636316994368;
        Sun, 07 Nov 2021 12:29:54 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c15sm1568036lft.244.2021.11.07.12.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:53 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 05/12] watchdog: s3c2410: Make reset disable register optional
Date:   Sun,  7 Nov 2021 22:29:36 +0200
Message-Id: <20211107202943.8859-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On new Exynos chips (e.g. Exynos850 and Exynos9) the
AUTOMATIC_WDT_RESET_DISABLE register was removed, and its value can be
thought of as "always 0x0". Add correspondig quirk bit, so that the
driver can omit accessing it if it's not present.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Aligned arguments with opening parentheses
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - Used quirks instead of callbacks for all added PMU registers
  - Used BIT() macro
  - Extracted splitting the s3c2410wdt_mask_and_disable_reset() function
    to separate patch
  - Extracted cleanup code to separate patch to minimize changes and
    ease the review and porting

 drivers/watchdog/s3c2410_wdt.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0845c05034a1..2cc4923a98a5 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -59,10 +59,12 @@
 #define QUIRK_HAS_PMU_CONFIG			(1 << 0)
 #define QUIRK_HAS_RST_STAT			(1 << 1)
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
+#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
-						 QUIRK_HAS_RST_STAT)
+						 QUIRK_HAS_RST_STAT | \
+						 QUIRK_HAS_PMU_AUTO_DISABLE)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -137,7 +139,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 20,
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG,
+		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
@@ -147,7 +149,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 9,
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG,
+		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
@@ -157,7 +159,7 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 23,	/* A57 WDTRESET */
 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG,
+		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -213,11 +215,13 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 	if (mask)
 		val = mask_val;
 
-	ret = regmap_update_bits(wdt->pmureg,
-			wdt->drv_data->disable_reg,
-			mask_val, val);
-	if (ret < 0)
-		goto error;
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
+		ret = regmap_update_bits(wdt->pmureg,
+					 wdt->drv_data->disable_reg, mask_val,
+					 val);
+		if (ret < 0)
+			goto error;
+	}
 
 	ret = regmap_update_bits(wdt->pmureg,
 			wdt->drv_data->mask_reset_reg,
-- 
2.30.2

