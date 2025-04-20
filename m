Return-Path: <linux-watchdog+bounces-3326-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E3A948F0
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 21:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26FED1711A6
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 19:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7A821128D;
	Sun, 20 Apr 2025 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="rx3eCw78"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F7199947
	for <linux-watchdog@vger.kernel.org>; Sun, 20 Apr 2025 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745175683; cv=none; b=iF4b5Cw2KbwMNIT9g+Ex6CPI0Z26/FJF6YuaVVVtjcK8M68TDZbynpYPs65YTGI28Gc8FPrmeuWm1BSH7W/8LPKinMWfbsltTrCtkI+MEK+yeImZYrDc/pJ+ndToNdyRVRhuxcaFVWHUbtjNsdmkqWcIU1HdwV5XcSk99vvR2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745175683; c=relaxed/simple;
	bh=Fxg61Yte1UPz7xtMEapmFGrdMeVN/z75TtaNETL9lu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+Tpd5KSEQACfmG8jen/+CVnpY7O7Z/9RFXGDtJ+WScDkusQFkNiZE3KC1u/USCsFXHy18ZnvUZV2U4JNnWqzOFNVieUTixdmMtA29868JXUE0YLS4cIt289n+hgGeRaiPNlp4tuLD4C+raREEg1udhmzeZOtzt25wxKpOGZKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=rx3eCw78; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=rx3eCw78qPhYWNuVRMoyRSAjmJCKBcAPF4akoG2OB04SC+117kpMAyYjYQjgz3+wlNUKgYTEPiQVPlNL8Bxp/e0nYcBG7SBQL+oCU2Utc+SRmhAN5N/UAW4w45WSoM81Xwz+V6MEXgkeU+vmy6OoJfBC4hUZ+v6my8fbZnKa3cJgV8jGD5j9YPBvlVIYPCpW+sQZanK9OYteZt/E2FC0sf087Lp1gAVCt1cu13TL4OVqKrjmzZb6amia3ZIbqmP6hoz+ur483/NXy857405jj7fGvUVIaORu023lUGeL8U1xGeIeG5uGGlCJziV+nonN4IRSGDXQe/Pyuz8zeq+gWw==; s=purelymail3; d=purelymail.com; v=1; bh=Fxg61Yte1UPz7xtMEapmFGrdMeVN/z75TtaNETL9lu4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-watchdog@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1640089901;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:00:45 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 20 Apr 2025 21:00:39 +0200
Subject: [PATCH 2/2] watchdog: s3c2410_wdt: Add exynos990-wdt compatible
 data
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-wdt-resends-april-v1-2-f58639673959@mentallysanemainliners.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
In-Reply-To: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745175638; l=3556;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=Fxg61Yte1UPz7xtMEapmFGrdMeVN/z75TtaNETL9lu4=;
 b=JS2lGNZDyaaVkljswDbu0dXHW1KjOUlEXMzWb1hi1S0JfSb0OvEezHI/eSl5ZSjQDddueAUxa
 mC7O1cSh3l1D1Da+z7cGPy79Iul+5yUJOh1EurlCLDM9Vu0H/B8bbrF
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

The Exynos990 has two watchdog clusters - cl0 and cl2. Add new
driver data for these two clusters, making it possible to use the
watchdog timer on this SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/watchdog/s3c2410_wdt.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bdd81d8074b2496d68c2b0f086f477dc8652e452..40901bdac42613458f93c09654353190785ff072 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -82,6 +82,10 @@
 #define GS_CLUSTER2_NONCPU_INT_EN		0x1644
 #define GS_RST_STAT_REG_OFFSET			0x3B44
 
+#define EXYNOS990_CLUSTER2_NONCPU_OUT		0x1620
+#define EXYNOS990_CLUSTER2_NONCPU_INT_EN	0x1644
+#define EXYNOS990_CLUSTER2_WDTRESET_BIT		23
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -259,6 +263,32 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
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
@@ -350,6 +380,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",
 	  .data = &drv_data_exynos850_cl0 },
+	{ .compatible = "samsung,exynos990-wdt",
+	  .data = &drv_data_exynos990_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
 	{ .compatible = "samsung,exynosautov920-wdt",
@@ -678,7 +710,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
 	    variant == &drv_data_gs101_cl0 ||
-	    variant == &drv_data_exynosautov920_cl0) {
+	    variant == &drv_data_exynosautov920_cl0 ||
+	    variant == &drv_data_exynos990_cl0) {
 		u32 index;
 		int err;
 
@@ -700,6 +733,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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


