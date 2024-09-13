Return-Path: <linux-watchdog+bounces-1883-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B8B977A7E
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 10:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5093C284447
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 08:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD591BD01F;
	Fri, 13 Sep 2024 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Tb7QJdTR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105F1BC9EC
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214632; cv=none; b=OxLo22KXKXQHoVyXfAVoyhMn4OytD3C/8zOpT41l/sn87EoUeL0rsA0Fyu7vuKMejBZzQ5xtDazLDlCjN3i06NXkoVofa2vc7iqFXZnLv3RFBg7jUPY8LICRfNRQ+otAK34I639zOBJowYM+6aCJNSarvJAnDkQSHN8lANlGovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214632; c=relaxed/simple;
	bh=6PINVVeNOi1FFdL0EeeG8KqEqwP2RPH+YzT742JlVTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gIR36IFk5p6A/QL600cuC9l7VPcWjLFVKBCHcegcA/dHs9vt11aW7ve7R+HSGpU9rn5rMMRk9RpAiFXxXyWiRCdLzvMYRRTEDUagGU+CyUQKI6XniEOWunP0lDW/GTKQcj4erZ/2OPH+6sAsyFL9SaSFtwsNgs4sKpEu9jcsNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Tb7QJdTR; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240913080348epoutp0162801a592309e809f145e14bfc65e9f4~0vw8kiMxK1871118711epoutp01d
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240913080348epoutp0162801a592309e809f145e14bfc65e9f4~0vw8kiMxK1871118711epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726214628;
	bh=3LRTVWYsQXjzzI1/oxcfdZncMermUZ1Aj0HJAMy7vq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tb7QJdTRBtpihxbjdAGzs/c2qPbg/EqTk7lpCgFPLkU6VSNEr4I3GzXlK65/ccoiS
	 mV3H4tMl1AwWSTmDHb3FwS6Kp1vGdEKjcUJLN4+RUrbG8t9w/ar2NX8K8DELSlcYD7
	 3sGZH/GJQKmtKPzxHAQa4MNoRJEw7yogkHefOge0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240913080348epcas2p3531d2d05e3f29898b0dbdd41018258b0~0vw8IUOzk1762517625epcas2p3A;
	Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4X4mz75yZqz4x9Py; Fri, 13 Sep
	2024 08:03:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	CD.92.08901.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b~0vw7FrBOR1981419814epcas2p40;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240913080347epsmtrp25d63db8a4bf1c0d84342eff71eb628db~0vw7E5AqR1974219742epsmtrp2F;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-a9-66e3f1e3d999
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A2.C7.07567.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epsmtip20b87633b581872ad1b638af18d025074~0vw61UmWg0679006790epsmtip2F;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH 2/3] watchdog: s3c2410_wdt: add support for exynosautov920
 SoC
Date: Fri, 13 Sep 2024 17:03:24 +0900
Message-ID: <20240913080325.3676181-3-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913080325.3676181-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhe7jj4/TDI5d1bJ4MG8bm8X9T31M
	Fmv2nmOymH/kHKvFy1n32Cw2Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgt5i0+DyT
	xeOX/5gdeD02repk81i5Zg2rx+Yl9R47vzewe/RtWcXo8XmTXABbVLZNRmpiSmqRQmpecn5K
	Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtChSgpliTmlQKGAxOJiJX07m6L8
	0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjOvvdjIWvJep+L7epYFx
	i0QXIyeHhICJxIdP8xm7GLk4hAR2MEos+fadBcL5xCixbepBKOcbo0TzrW8sMC3PFv6GatnL
	KHFwzzl2COcjo8S9xW/ZQKrYBLQkth1+xQSSEBF4zSjR1PuOGcRhFvjKKLG9tZUVpEpYIEDi
	3a25YDaLgKrEzmu7gGwODl4BO4nN3Z4Q6+Qlrj8+ygRicwrYS+xu7gNbwCsgKHFy5hOwk5iB
	apq3zgabLyEwl0Ni2bt5TBDNLhIf/26BultY4tXxLewQtpTE53d72SDsfImVK09A1ddI3Gvb
	BVVvL7HozE92kHuYBTQl1u/SBzElBJQljtyCWssn0XH4LztEmFeio00IwlSVmL4sAGKGtMTE
	GWuh9nhI/L/wnAkSVJOAodt3gmUCo8IsJM/MQvLMLIS9CxiZVzGKpRYU56anJhsVGMIjODk/
	dxMjON1qOe9gvDL/n94hRiYOxkOMEhzMSiK8k9gepQnxpiRWVqUW5ccXleakFh9iNAWG9ERm
	KdHkfGDCzyuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgWnBnkMZ
	tqGsjyQusM1wYtrUOUN61kObGwzPZ5RNLJ+W9kvv1pNfnfahSkcOzbl+euHCTxss1nDstxPZ
	//Vyy6VT045M4yxe8Gl7Taju6+xpbYGWC9xUnfYpmXtUCoWkPU4Iv/1V0n1110w/oWXb50Qu
	Yuhi/uLlw2LKMWFDi4vI+20XdWes+m+1Zd+c9VNnmLPZvuTyMpv+T1n5qeG7nSy3A8QLJixT
	NLrCzcl2SV/Ay0tqhm7N3SlXFqw9uqTfdIH/7ccnvLUqy8U3G3/wumlz7dm94C/LLJTTrvCd
	rthTf2oKV1DynOBW24Ny72+3P9LZf7+SM9F+cb27hHN5wg5n/rrbRW91TLQ7fK13t8cosRRn
	JBpqMRcVJwIAx3IxLEAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvO7jj4/TDP6d4LF4MG8bm8X9T31M
	Fmv2nmOymH/kHKvFy1n32Cw2Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgt5i0+DyT
	xeOX/5gdeD02repk81i5Zg2rx+Yl9R47vzewe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG
	9Xc7GQvey1R8X+/SwLhFoouRk0NCwETi2cLfjCC2kMBuRokbbTwQcWmJI79fsEHYwhL3W46w
	djFyAdW8Z5Q4MHEeC0iCTUBLYtvhV0wgCRGQxNkvv8AmMQv8ZpTYsMC4i5GDQ1jAT+LGNwOQ
	MIuAqsTOa7tYQcK8AnYSm7s9IebLS1x/fJQJxOYUsJfY3dzHBnGPncT0BS3sIDavgKDEyZlP
	WCCmy0s0b53NPIFRYBaS1CwkqQWMTKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS83M3MYKj
	QktjB+O9+f/0DjEycTAeYpTgYFYS4Z3E9ihNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/hjNkp
	QgLpiSWp2ampBalFMFkmDk6pBiaPK3UGIQb2ebcTW2yur2eOuCNQNeVD9cPz2T65DiZrJe9U
	bA+dXRF2sODTnMr0jdauO2v6qkzsFVd028edqr27QplFSmPL9j/eQSGltxjCr//fckD22AMx
	FZme+H2fpNefnPZ3wvSm4rnLz1m1101NmLNt4vS704w23FTe8l3l+vm7XPu/GblcaAhfcMrN
	V0BhRVN+5K0OsUPtk650BXKHWeXf26s/ye1E3S75O6X+pmXBzGc5Wn9HRBf+Vjx6NsVmzbbC
	YM5j/P9/K+c+yjXrn6Gvzj/thOHm340q+44GfQy2TRWrrRO0U7slXnO3u2HeDO9PyWXT4zd9
	fjbhdaufjiv/2bZt0RP+fNdoWa/EUpyRaKjFXFScCAC9sDsa+QIAAA==
X-CMS-MailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
	<CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
is almost similar to ExynosAutoV9, but some CPU configurations are quite
different, so it should be added. Plus it also support DBGACK like as
GS101 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae..c25133348f0e 100644
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
+	  .data = &drv_data_exynosautov920_cl0},
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
+			else if (variant == &drv_data_exynosautov920_cl1)
+				variant = &drv_data_exynosautov920_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.46.0


