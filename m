Return-Path: <linux-watchdog+bounces-2953-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA10A38CE8
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2025 21:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F44A18956D3
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2025 19:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9655F237163;
	Mon, 17 Feb 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="YsUHYEBq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D514822B5A3
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Feb 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739822342; cv=none; b=LWJKC3MCgCM3regypY4S3teDDxxezWsYJKROiE9ju7PdCyCWHKpqGiACqUKFmHbMHWprmORRcpV9MP6LkwotUGTefNaueIUKuPP4jKv7cznOrNG+Hh3kb/JnkXpQrbmtve8qH37WPs22yMiQc9p/gcGqSzxMyN9lxH0UIARgxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739822342; c=relaxed/simple;
	bh=ooAfCtIBB4Gn/GKkD7UJYql1T65TueuYbZ/OTNt6n3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jkoQrfkt8FDqdDhJpjMPnBivfJTgmUXglfI1IV5OZBTYQiSblCsxDca228DgVtuGwR3+kBG+AjsODWC1XO/gZx2WedNw4CQEErCyMdzYVJ3bBoN/d1G7bvGmeO6ogQ5F8GzdYvSIc5UuBNXDqkMgB0itlyufkD0RubjMk/cWAng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=YsUHYEBq; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=YsUHYEBqnxMEobTv7HlWmBaKlcrr1cs+IXxXJVoDeqT3d7s2DahFvuMq+gpK3/lsJbo/PVe6CjMgEglD1saqASi/Sazb/n7faF5sO/A0vnhEVwG5JpVDhLMw53a+cPUmRhUbrmFa3pd2CnCbJHMChZW39PZDUtHnsuwTAvPNPyOaKYvszEEmENSeA+6i2+e8pXcO4mE/j3Tf93hlBbPipSrDYNwr8BmzSUM2FTAzufouSFwz3HDAIH5PdQtNaLnVLzkoD6kifZTY0sBgQot3Ke1vLtEuWwV3GDd8FQ7UXgML3nLKV9FOJZqDK89NDO7Isks4FeS9JA93b/7+yQoFVQ==; s=purelymail3; d=purelymail.com; v=1; bh=ooAfCtIBB4Gn/GKkD7UJYql1T65TueuYbZ/OTNt6n3I=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-watchdog@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 234657940;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:58:20 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 20:57:39 +0100
Subject: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add exynos990-wdt compatible
 data
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-wdt-v2-2-3eb4fbc113f4@mentallysanemainliners.org>
References: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739822294; l=3489;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=ooAfCtIBB4Gn/GKkD7UJYql1T65TueuYbZ/OTNt6n3I=;
 b=4WxC88dcLDK8WkNH0UZB7vrjj47/wza9Jee7ptYJBYz/1GFhGu53S+uUz2tQwigSn7A8UcjZo
 u0+yjiBuYCuD6ZGNWIcjQiRm8EOUf/43/MHXMyb5hI0D5aedh/dAZl+
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

The Exynos990 has two watchdog clusters - cl0 and cl2. Add new
driver data for these two clusters, making it possible to use the
watchdog timer on this SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/watchdog/s3c2410_wdt.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9d40b5596e2f87cc47c80ccbd2ddd..8f406e08d848646348dafabced5bc0f2bbcf49df 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -80,6 +80,10 @@
 #define GS_CLUSTER2_NONCPU_INT_EN		0x1644
 #define GS_RST_STAT_REG_OFFSET			0x3B44
 
+#define EXYNOS990_CLUSTER2_NONCPU_OUT		0x1620
+#define EXYNOS990_CLUSTER2_NONCPU_INT_EN	0x1644
+#define EXYNOS990_CLUSTER2_WDTRESET_BIT		23
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -257,6 +261,32 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos990_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynos990_cl2 = {
+	.mask_reset_reg = EXYNOS990_CLUSTER2_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOS990_CLUSTER2_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS990_CLUSTER2_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
 	.mask_bit = 2,
@@ -348,6 +378,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",
 	  .data = &drv_data_exynos850_cl0 },
+	{ .compatible = "samsung,exynos990-wdt",
+	  .data = &drv_data_exynos990_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
 	{ .compatible = "samsung,exynosautov920-wdt",
@@ -676,7 +708,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
 	    variant == &drv_data_gs101_cl0 ||
-	    variant == &drv_data_exynosautov920_cl0) {
+	    variant == &drv_data_exynosautov920_cl0 ||
+	    variant == &drv_data_exynos990_cl0) {
 		u32 index;
 		int err;
 
@@ -698,6 +731,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			else if (variant == &drv_data_exynosautov920_cl0)
 				variant = &drv_data_exynosautov920_cl1;
 			break;
+		case 2:
+			if (variant == &drv_data_exynos990_cl0)
+				variant = &drv_data_exynos990_cl2;
+			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}

-- 
2.47.2


