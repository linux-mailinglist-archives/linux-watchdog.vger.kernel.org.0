Return-Path: <linux-watchdog+bounces-2544-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 453559ED4F0
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 19:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7072849AF
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 18:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8CD2288EE;
	Wed, 11 Dec 2024 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnYxS5ta"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E49B211A14;
	Wed, 11 Dec 2024 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943038; cv=none; b=JzuFPjd//fwnZI96evw0bXezuj7jy0C2+11DcOrAldEXBtuVsHXQ/t6DEzXBZWiG2OU+oM5DMmf8BKltJfM4DRHRO5iQuhZO0KmZ5b2WFq4fXQgcp5tfO3+vIRO8vByH4UbpmapFenWPL+5VMwHgm/Jqb35efe3yXNAnAxKw+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943038; c=relaxed/simple;
	bh=qrrMUOSZEfY/cTaNeMEEDWyFjmfOCB6G3PQly+6iqjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIXjOlvs74IjDfUYL2eJyu+RvVlYJNk+VFlasYzAI12AM9XXdFfg4L/M50SiRmpqOFp3IPeb+dDxTiX5UGeKtpL8YvPVuYrqRlJrSeot5JNwkaU2yzOUGuOIBzBPsmv22FVHGNZRI+66iWTeWYAescE0wiUw9AdakgCwjT/OnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnYxS5ta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9787AC4CED2;
	Wed, 11 Dec 2024 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943038;
	bh=qrrMUOSZEfY/cTaNeMEEDWyFjmfOCB6G3PQly+6iqjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnYxS5tahjnBIDKL6W1G4XMFjoiORdj5TFan4lrQOfPLoYA45Y7lt/JaC6y7PimxK
	 0tSdwfjIU7RZ00amc17CkJ5qnhyLkVUXkBVX6gRjnoQH39yfUKCjo36Fpjai4aq7Tx
	 FWDSSWdLPzbDIY+4ZYUD3jy1efqbA5HRICM3M8cxSJfxn+mcN8mave5JHEv4EPLXr8
	 yBJdJUAeX4Lndx81C+BlMOlFvYxOiRcEWn1yVx5Fp9Yv615kwGrguFOCTWx3gPAYkG
	 0JmwykS1aH5dE8On76PHWRF5nUynqkuxTxVoTCdTIw/zFGBta7nU1VzRCAZMah5hSh
	 8hwM0cqlZcSSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/36] watchdog: s3c2410_wdt: add support for exynosautov920 SoC
Date: Wed, 11 Dec 2024 13:49:21 -0500
Message-ID: <20241211185028.3841047-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit

From: Byoungtae Cho <bt.cho@samsung.com>

[ Upstream commit a5cb13980e00e9c4fbc382d68eda250ab6a14d7c ]

Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
is almost similar to ExynosAutoV9, but some CPU configurations are quite
different, so it should be added. Plus it also support DBGACK like as
GS101 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241021063903.793166-3-trunixs.kim@samsung.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 349d30462c8c0..30450e99e5e9d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -63,6 +63,10 @@
 #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
+#define EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT	0x1420
+#define EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN	0x1444
+#define EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT	0x1720
+#define EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN	0x1744
 
 #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
@@ -303,6 +307,32 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
 		  QUIRK_HAS_DBGACK_BIT,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
@@ -320,6 +350,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "samsung,exynosautov920-wdt",
+	  .data = &drv_data_exynosautov920_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -643,7 +675,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
-	    variant == &drv_data_gs101_cl0) {
+	    variant == &drv_data_gs101_cl0 ||
+	    variant == &drv_data_exynosautov920_cl0) {
 		u32 index;
 		int err;
 
@@ -662,6 +695,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 				variant = &drv_data_exynosautov9_cl1;
 			else if (variant == &drv_data_gs101_cl0)
 				variant = &drv_data_gs101_cl1;
+			else if (variant == &drv_data_exynosautov920_cl0)
+				variant = &drv_data_exynosautov920_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0


