Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48218440E3E
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhJaMZB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhJaMY7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:59 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE07C061746
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:27 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w15so55105590edc.9
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l/1LxvCuuFDJGwtjOtmgZOfuOt8wH/h/0UaZ8nhlwUA=;
        b=r4WYK47YXxinnVjs/tkpEUTNJ56wjldwJfKCnLmWtvZT8cXGvQRKsuqa6qan/AtFzK
         /r2stn+pTKVjVGdo1Rj+umP6K1FkHMvmoHHjfNEUmXwmktle0xwAGgRC5uowsZQ1Gh3I
         l0uR3EW3bnZJLUdIaB3/DV6en/syF2WV1ldeOb6stll8DWEe/+eOX1vMQFhqtDXY6Wvk
         9dBkkgvuwNAIJpoGr2cb/Z1RkL/wT+/d9Q6dMv2zixItvDWepAVSxMTKpIg7P4ll6TNk
         tau9XXLfFuMaizVosPJ2LsUtkKHrM3RrWQk7r67DJT+6DJ/geilxYhpN+1IdYzZku7qp
         1cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/1LxvCuuFDJGwtjOtmgZOfuOt8wH/h/0UaZ8nhlwUA=;
        b=aUHJncmqwg+pSZXeZLAUUWPl9ScFTCPdLJ23hL0k9AcNaCi1fKx0fSXFRrGla0UFad
         Ap0q8piLJGgNmK6+r7uolC0Q6qmNY8bBQNakOz1MVEiH4MWQ76DWUbAH7Veq7946jmiN
         /9f9uLOi2+dnlyrAzdSNJdAkVNLWtlxla/woebkccf4WBziWTFNpbLaZBDXuTYq3YlCu
         kau2drKi5deZoCdyd3a2VNspxloY7tp4yLbnYMg0p2Zfd2DnHP/RCMP08drMVecpw+RE
         pYTutF0eq/vHOBseRVrugtI6ASr2M343MZYsDBqNCl4s4MGUEvIVTcQ8xJcprYadDXV6
         BqCg==
X-Gm-Message-State: AOAM530+bX9n8TZBDP50cXpPeri8sAttbB6V5990xuuGc5mUJzK7gKdm
        aK4Ntfkam9u0BmBol0LD98I6RQ==
X-Google-Smtp-Source: ABdhPJwdxXzOyQrZCUIk6ItBBUXusTHqCFBfjHyfm5iiwuVPEuhCYVnaqavTp82n047YIr5IUAdvhQ==
X-Received: by 2002:a05:6402:3588:: with SMTP id y8mr31603322edc.285.1635682946076;
        Sun, 31 Oct 2021 05:22:26 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m9sm5539310eje.102.2021.10.31.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:25 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 05/12] watchdog: s3c2410: Make reset disable register optional
Date:   Sun, 31 Oct 2021 14:22:09 +0200
Message-Id: <20211031122216.30212-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
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
---
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
index 0845c05034a1..048ca47d0b8a 100644
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
+				wdt->drv_data->disable_reg,
+				mask_val, val);
+		if (ret < 0)
+			goto error;
+	}
 
 	ret = regmap_update_bits(wdt->pmureg,
 			wdt->drv_data->mask_reset_reg,
-- 
2.30.2

