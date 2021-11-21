Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22974584F7
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbhKURAH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238457AbhKURAE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:04 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9A1C06174A
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:56:59 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m27so68910439lfj.12
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wl3j+iERTalwtvQG413hiTFusOUFeOD/J/RPOUJ6j7Y=;
        b=sLgNyN4lb6jrqMlZIUUep28Phiwo/CSUBVjvHYHN54PubLf65qAs6HNHsX9hQFJCvA
         yJswO/PreIKuBIO7uxte6Jh23nbx7hXpvLjnkV5P7+C690ntJWNBoaqVqDOPVA9fFk7v
         feh6xLHTRiLfRo2VQJ5tJvh2t+7PxsZApcZlpm7jlFGIyibvr7WQWWs03m4OebID7of+
         vxravUegfWi9VnS+jzLbD0Y93aIPFCcLXb8q0L4ke0XcM8tnysVF02VQWO9cKROfO7si
         PJZkDDlclrS8+uaCLznHt/slJBoubwk2OrovZJb3774QSszPXIKRAchpj3lxKjAMCsJg
         fRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wl3j+iERTalwtvQG413hiTFusOUFeOD/J/RPOUJ6j7Y=;
        b=fUwz0td/NfFnxILXhRMmn6Y/TZhC3aBDP1L0IxrYZob6R8Oo2BR4cpumUbakBiNNQN
         gPX2j4N4dlWgoQoenQH8mzZAhagfZ8ToOEvC9dBxQI/v/GIXE2u2UgQBlYUgcaPDXNVK
         0rSdg5+Er1trIexoTwWolhY4WJwqXwwliDw1Zokdu/t8oSbbcSvDuMMDiSzIo/4Gsl5s
         nNJcKysjFmP2pZWUuWmAngNs+2KrLFmsNe6Dv88ML+6FuwWe6A8kaSN/hyEjqjDJDS7H
         UKe7sMmw0yVfRsQp/COC81iKWu4tp5fxB+tRHv36WTvsNOXidJ8LspIAEWz0XoVTnA8I
         2X3Q==
X-Gm-Message-State: AOAM532HDD4YWFzPnNxPHgTkXx+b8cxF+T78bhf5B9dvi30hZreab9/u
        xOOFBl7NSzOdhN1s+bg/e+//8g==
X-Google-Smtp-Source: ABdhPJyxHIFhqWZPP/qWUTVJxLDn3UzQs536lnyiqZTE7xpPCk90DW8p1Tnyqp30gxyjhg2smJoCbQ==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr50522085lfd.455.1637513817414;
        Sun, 21 Nov 2021 08:56:57 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j15sm692326lfe.157.2021.11.21.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:57 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 05/12] watchdog: s3c2410: Make reset disable register optional
Date:   Sun, 21 Nov 2021 18:56:40 +0200
Message-Id: <20211121165647.26706-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

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

