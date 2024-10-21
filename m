Return-Path: <linux-watchdog+bounces-2247-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 162249A5A87
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 08:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5DB628177B
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305501D0967;
	Mon, 21 Oct 2024 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fdMzb7Z/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB31CF291
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492785; cv=none; b=TOhmhs9lQeAI5XBpmO6CanS/b2gcgThyzWhx4KUPmr9k6U6FKY4GzpCpOJhJK8Nn2U+PD6O4xrhs8q3l2FecJkQvt5tbn7wvKIPm3lFawk10rcCGauqrqMxIyT5532Rd5kgiyEWXudcUya31iRTWMoN+/5rMIfe/4j21KhL6Db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492785; c=relaxed/simple;
	bh=yP63p3olM6y48xBFe7ix+AC1xOfxPYOA0crl2Zz54lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=R1csPJw1nP+gNm0AU/BYWqxFRlYmfPK8ozZVNvmrQH19BSOk3QS5dLnHFncx0d9cfwd2hBINNYzcCdn6A6bAcJJlMTgp/mNjNdl1XdCf+CBHQd2Hra2AJ0kIiYb/pyMygKC1+Mc9SWAn1mdKju4gL21+B30l7oZtGGJD2k5kv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fdMzb7Z/; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241021063939epoutp03ccb53bbc83a31b513dcf8624728b622b~AZIUWOrr_0797307973epoutp03E
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241021063939epoutp03ccb53bbc83a31b513dcf8624728b622b~AZIUWOrr_0797307973epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729492779;
	bh=y1rVAAUbL4XZfrYkt5r90v9JFxYMUZqPCTcgm/yJbCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdMzb7Z/l70wqGdlAjIsM/uBh/g7TMZMhzVCsycqFwfgKZR2aNf/FpX2jJrvjZsz4
	 T8OHdZJhaPBEu6hRaMc1g/MSKyuQoZYym8T8TvebrZ6IQGYQt/X/zyJiuaZqk2BpDD
	 GpcUCc4IDAVSl1gM+A9IewXV4CBR8nK3pBty5vFI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241021063939epcas2p253d4fd6e3af9b6310857b0d4cb72570a~AZIT3Hiyh2063720637epcas2p29;
	Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XX5JV3X2Tz4x9QD; Mon, 21 Oct
	2024 06:39:38 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.57.09770.A27F5176; Mon, 21 Oct 2024 15:39:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241021063938epcas2p22e0a9f4f869237ceadf4f2035778bfc7~AZIS4FlqH2063720637epcas2p24;
	Mon, 21 Oct 2024 06:39:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241021063938epsmtrp1eaa5da4c43b8b32e0b92f7a621cf634a~AZIS3NkOs1158811588epsmtrp1T;
	Mon, 21 Oct 2024 06:39:38 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-11-6715f72a8699
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.99.08229.927F5176; Mon, 21 Oct 2024 15:39:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epsmtip261c9eb531f2414339874f3626022d22d~AZISoWHWN1927319273epsmtip2V;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Mon, 21 Oct 2024 15:39:02 +0900
Message-ID: <20241021063903.793166-3-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021063903.793166-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmua7Wd9F0g/W7pS0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Nou9r7eyW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	MWnxeSaLxy//MTvweWxa1cnmcefaHjaPlWvWsHpsXlLvsfN7A7tH35ZVjB6fN8kFsEdl22Sk
	JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAnaykUJaYUwoU
	CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7onfSB
	teCJbMXdw9eZGhjnSXYxcnJICJhInDn1gbmLkYtDSGAHo0Tn+ttsEM4nRol5vxcygVQJCXxj
	lFizIBum4/WevVBFexkl/v/fxg7hfGSU+PqylxGkik1AS2Lb4VdMIAkRgdeMEk2978CWMAus
	ZZKY86MNrEpYIFii6cJqsB0sAqoST/ftBrN5BWwldp+fxQqxT17i/Jv/bCA2p4CdxONjT1kg
	agQlTs58AmYzA9U0b50NtkBCYCWHREvre6hmF4kt+9axQdjCEq+Ob2GHsKUkXva3Qdn5EitX
	nmCCsGsk7rXtYoGw7SUWnfkJVMMBtEBTYv0ufRBTQkBZ4sgtqLV8Eh2H/7JDhHklOtqEIExV
	ienLAiBmSEtMnLEWar+HxI3fO1ggYTWRUWL7tQ9MExgVZiF5ZhaSZ2Yh7F3AyLyKUSy1oDg3
	PbXYqMAIHsPJ+bmbGMFJWMttB+OUtx/0DjEycTAeYpTgYFYS4VUqEU0X4k1JrKxKLcqPLyrN
	SS0+xGgKDOqJzFKiyfnAPJBXEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwf
	EwenVAOT596z28rsX5lcrAkXuSMX7rt8x+RZb64dinph0x9Wt+OK49LpC3/fKnn91fY475qu
	Bes1L3Dt8yk8dOrm9Kxt51+c3Nzi/Mknxf/m5mt/Vumek36ooXzgwC3+lEN8XerMH1YpXxP9
	WDzhzrSDv9J8VJc6S009Ps/x3etFEx4802xdfpOxdpK6zNmU/ob9bPPKzC46xs+ULrxsELFc
	Wv1jsh7/nbc9t/+ekVFVE5wj58/P2WcwKe+l8eySus9u959nHQxdZ9fCcODgXw2eKW7Mryrl
	Jk8X8T//POqFzqJzn3tmf//n/ejGuimP9gSnP5dYu0HwwLEK2c554QcK+K6ucOcW5S8IWmjz
	cnJc8KSHT78rsRRnJBpqMRcVJwIAK2IRaEsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWy7bCSvK7md9F0g1fHbCwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Nou9r7eyW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	MWnxeSaLxy//MTvweWxa1cnmcefaHjaPlWvWsHpsXlLvsfN7A7tH35ZVjB6fN8kFsEdx2aSk
	5mSWpRbp2yVwZfRO+sBa8ES24u7h60wNjPMkuxg5OSQETCRe79nL1sXIxSEksJtRYk3XRWaI
	hLTEkd8v2CBsYYn7LUdYIYreM0pMXX8MLMEmoCWx7fArJpCECEji7JdfjCAJZoHNTBJXpimB
	2MICgRKvN70Gi7MIqEo83bebCcTmFbCV2H1+FivEBnmJ82/+gw3lFLCTeHzsKQuILQRUc+Uq
	xBW8AoISJ2c+YYGYLy/RvHU28wRGgVlIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7N
	S9dLzs/dxAiOGC3NHYzbV33QO8TIxMF4iFGCg1lJhFepRDRdiDclsbIqtSg/vqg0J7X4EKM0
	B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUA5PkdY4rx3PKViac50ri388XWVDNbmww1WV2
	9rQ/L678ibi18oDI0s0/tu+MeeXL+v+f58cHbfXrWZhjLj2Z/Nra6lre+mV2uwu8nJy/HN57
	ykhpx+9J7/z7zng/Vle3Fzm/edO7KTE53Xw8B82vzJ7A/6HJqmifwMTcTfZyU9fN+tS14dnK
	AONDbK8l2KT3erQU3ry0xPOUdM2zK9+XfPIV/dWTaLd2Y+pNZ0drH3l9VpUTb884NoSrVl5/
	MNN/1vVzb+dd3HCDP/SkZqa5hlTNhIfm+3faMR3UF6lvT5g9f3nQkj3Ox986mQUrvXlzRlH0
	F1sqp+WONbf9b4a4aD5XX9w74dTs73nt+mYy7+wElFiKMxINtZiLihMBSIxYWgcDAAA=
X-CMS-MailID: 20241021063938epcas2p22e0a9f4f869237ceadf4f2035778bfc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063938epcas2p22e0a9f4f869237ceadf4f2035778bfc7
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
	<CGME20241021063938epcas2p22e0a9f4f869237ceadf4f2035778bfc7@epcas2p2.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
is almost similar to ExynosAutoV9, but some CPU configurations are quite
different, so it should be added. Plus it also support DBGACK like as
GS101 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae..aa128099c47d 100644
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
2.47.0


