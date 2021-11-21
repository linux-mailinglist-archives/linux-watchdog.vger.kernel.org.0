Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C33458505
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbhKURAN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 12:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238487AbhKURAJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:09 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3183C061748
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:03 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b40so69306441lfv.10
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/tIvc/iQ0zJq1zkiRcn4TK4rgmb8MImymPvtBfv4Ogo=;
        b=p152vYLVGxhiNGNtSPwJhd2IR3micE6Fq/eS9OTsYemFk+z5Xz0IIKEbbSju/LPpBL
         xObt08E7hFB7ZyIu8LEtV+S3cbMWBvH/6NlAPOuFtpIaMTS6ArtJRW5S1degOeS+en96
         fgLVzFMQV7YvXqlYWv1XDs4ezDwfGaQM/kAs//r31uQF634MWW4JhzJ6ulswgaNfsqo2
         59PXTKCMw8v7w/PNLTOFUd8EHuO/LftphCh/IuGvT4gKPQZzoMuoUWUGjz1JR6IgYsVk
         8gSD8OLlE1nRtc2+5PP7XlSJbmpxRTiTo+J19HOVHiqfnVA1jU+ZRIWQE+DPPRfQFq7L
         6Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/tIvc/iQ0zJq1zkiRcn4TK4rgmb8MImymPvtBfv4Ogo=;
        b=2HY/8ORG31ufuEHVs9xCgj7HqI75gloP4l3zPSgCgLMVfOI7YCRARKDNonGQjoCFIR
         T0ljoi8GtBQL2SuACFLwrRgpwljJhYZiRrl3b/Si/XjLlwOjREnjZ+8sOjtmHKvIv0ia
         em3zbMjWRNAftaF9O8SUK+vUUNFSNAgwdOYN7aEqHPsIbCrAY2EUms5MMcbJ3io3jQWp
         5ceW4aCDCE0zX7Yh70Dk/jP4dL1i8ZPFq94VMH0wD6o2KD+erT8KZCtH6RDGP8Zu2Q9Z
         N0OKsm3hIgUWbeKxvaagd78GZ8S+N6hHaAZR5/UZrDx9YjgNp7925+jsuSDNV71biGh6
         kPhg==
X-Gm-Message-State: AOAM531hWPoNi6h2T0iKKB5kM6KJnxVWFiNPyTl4abblPHMwykhD6B/x
        cQ0jRp0r0MTsJVHwObkjGMY/wQ==
X-Google-Smtp-Source: ABdhPJxHqSCOqGG9TDUi3vripLfEsVZEsv/K9XJjzyK8yN+DLP7y8RNpcq9Ee92gEUKULcXlC6Uxgw==
X-Received: by 2002:a05:6512:486:: with SMTP id v6mr49905103lfq.405.1637513822302;
        Sun, 21 Nov 2021 08:57:02 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l5sm607752ljh.66.2021.11.21.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:57:01 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 08/12] watchdog: s3c2410: Add support for WDT counter enable register
Date:   Sun, 21 Nov 2021 18:56:43 +0200
Message-Id: <20211121165647.26706-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On new Exynos chips (e.g. Exynos850) new CLUSTERx_NONCPU_OUT register is
introduced, where CNT_EN_WDT bit must be enabled to make watchdog
counter running. Add corresponding quirk and proper infrastructure to
handle that register if the quirk is set.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - Used quirks instead of callbacks for all added PMU registers
  - Used BIT() macro
  - Extracted cleanup code to separate patch to minimize changes and
    ease the review and porting

 drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2a61b6ea5602..ec341c876225 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -60,11 +60,13 @@
 #define QUIRK_HAS_RST_STAT			(1 << 1)
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
+#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
 						 QUIRK_HAS_RST_STAT | \
-						 QUIRK_HAS_PMU_AUTO_DISABLE)
+						 QUIRK_HAS_PMU_AUTO_DISABLE | \
+						 QUIRK_HAS_PMU_CNT_EN)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -98,6 +100,8 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
  * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
  * reset.
+ * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
+ * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
  * @quirks: A bitfield of quirks.
  */
 
@@ -108,6 +112,8 @@ struct s3c2410_wdt_variant {
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
+	int cnt_en_reg;
+	int cnt_en_bit;
 	u32 quirks;
 };
 
@@ -233,6 +239,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 	return ret;
 }
 
+static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
+{
+	const u32 mask_val = BIT(wdt->drv_data->cnt_en_bit);
+	const u32 val = en ? mask_val : 0;
+	int ret;
+
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
+
+	return ret;
+}
+
 static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	int ret;
@@ -249,6 +269,12 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 			return ret;
 	}
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
+		ret = s3c2410wdt_enable_counter(wdt, !mask);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

