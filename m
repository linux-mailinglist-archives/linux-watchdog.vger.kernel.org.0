Return-Path: <linux-watchdog+bounces-4126-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2AEB3BD08
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Aug 2025 16:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3EE561B6E
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Aug 2025 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1139931E0EA;
	Fri, 29 Aug 2025 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d4b+QEKS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984831DD85
	for <linux-watchdog@vger.kernel.org>; Fri, 29 Aug 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756476017; cv=none; b=leAjYBar3DiWLyDOJtprv68OrggT2DEjp1EKdByYTJvBkTN0184FsGWAFvMUjLLNWtuvJ9yaPSzKm0YoWaWsMKBqIRl4Yv7KidXz6pVHdkeKptNGWNopq5r9JA+Le1bdyoouGXf62l08a+QTswa0dGIDb7rQJOhSmF9hPNP10cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756476017; c=relaxed/simple;
	bh=i3EE2OR8VgBxeGjeKxy1ZjKqkUIs6GcKr78n3M/T7pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=N+7iuJ4Y5wqhjSrAeGmU2LEbF0Ky4LOWiXa3p7OGVM7lRm6y2jZz2lxPAYQ8MVW126vQYQORpbwreiu5meKAb9ff/hPvD/ok0GjoIMj9VqJinyMUSxTtBkKS9eblXEUmxOiQFUK2LyvOGEvogVS2pkdywGZe+vNPqXZ+rYbI6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d4b+QEKS; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250829140012epoutp017bc19f2ae11580dad5b3633bde26d1e4~gQaCAHWUD0228002280epoutp016
	for <linux-watchdog@vger.kernel.org>; Fri, 29 Aug 2025 14:00:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250829140012epoutp017bc19f2ae11580dad5b3633bde26d1e4~gQaCAHWUD0228002280epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756476012;
	bh=d7ikzstNHkthbtDA8b8VQUUX9xhB4JWtLC11kBw1nzg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=d4b+QEKSwvDRiv4Z5hwxWvBikCAS9znK/JvuHEB7t1BBzthYGXc5/MrPAU4qQuLum
	 qMmrD/IDsL1sTg1V0nvukKjpJ7BULXFbjBXou09PEQPSx+0n5jSIfE40ZWtOdiriTs
	 azsrWTs+9Nwk5W3j8FFFlgO9AxjWTEmBSlMaVyCk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250829140011epcas5p471bd84c4daa40aa458116a7feec21e70~gQaBPpf1b0901909019epcas5p4B;
	Fri, 29 Aug 2025 14:00:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cD0Jp3xbhz3hhTH; Fri, 29 Aug
	2025 14:00:10 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d~gQZ-_j_ZR2472824728epcas5p1W;
	Fri, 29 Aug 2025 14:00:10 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250829140008epsmtip1b0874f76e197270c46afb5cc6889618f~gQZ_nDMaH2172121721epsmtip1c;
	Fri, 29 Aug 2025 14:00:08 +0000 (GMT)
From: Varada Pavani <v.pavani@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	gost.dev@samsung.com, aswani.reddy@samsung.com, Varada Pavani
	<v.pavani@samsung.com>
Subject: [PATCH] watchdog: s3c2410: Add FSD support
Date: Fri, 29 Aug 2025 19:30:02 +0530
Message-ID: <20250829140003.109588-1-v.pavani@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d
References: <CGME20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d@epcas5p1.samsung.com>

FSD SoC has 3 CPU clusters, each has its own WDT instance.
PMU register bits(.rst_stat_bit and .mask_bit) for each cluster is
different. So driver data is now modified in probe, adding needed info
depending on cluster index passed from device tree.

Signed-off-by: Varada Pavani <v.pavani@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9..a112d9747ab6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -57,6 +57,7 @@
 #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
 #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
 #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
+#define FSD_AUTOMATIC_DISABLE_WDT		0x040c
 #define EXYNOS850_CLUSTER0_NONCPU_OUT		0x1220
 #define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
 #define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
@@ -333,6 +334,33 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 		  QUIRK_HAS_DBGACK_BIT,
 };
 
+static const struct s3c2410_wdt_variant drv_data_fsd_cl0 = {
+	.disable_reg = FSD_AUTOMATIC_DISABLE_WDT,
+	.mask_bit = 23,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 23,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_RST_STAT |
+		  QUIRK_HAS_PMU_AUTO_DISABLE,
+};
+
+static const struct s3c2410_wdt_variant drv_data_fsd_cl1 = {
+	.disable_reg = FSD_AUTOMATIC_DISABLE_WDT,
+	.mask_bit = 24,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 24,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_RST_STAT |
+		  QUIRK_HAS_PMU_AUTO_DISABLE,
+};
+
+static const struct s3c2410_wdt_variant drv_data_fsd_cl2 = {
+	.disable_reg = FSD_AUTOMATIC_DISABLE_WDT,
+	.mask_bit = 25,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 25,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_RST_STAT |
+		  QUIRK_HAS_PMU_AUTO_DISABLE,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
@@ -352,6 +380,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynosautov9_cl0 },
 	{ .compatible = "samsung,exynosautov920-wdt",
 	  .data = &drv_data_exynosautov920_cl0 },
+	{ .compatible = "tesla,fsd-wdt",
+	  .data = &drv_data_fsd_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -676,7 +706,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
 	    variant == &drv_data_gs101_cl0 ||
-	    variant == &drv_data_exynosautov920_cl0) {
+	    variant == &drv_data_exynosautov920_cl0 ||
+	    variant == &drv_data_fsd_cl0) {
 		u32 index;
 		int err;
 
@@ -697,6 +728,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 				variant = &drv_data_gs101_cl1;
 			else if (variant == &drv_data_exynosautov920_cl0)
 				variant = &drv_data_exynosautov920_cl1;
+			else if (variant == &drv_data_fsd_cl0)
+				variant = &drv_data_fsd_cl1;
+			break;
+		case 2:
+			if (variant == &drv_data_fsd_cl0)
+				variant = &drv_data_fsd_cl2;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.49.0


