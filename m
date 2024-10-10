Return-Path: <linux-watchdog+bounces-2165-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF909984BC
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 13:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 489B8281580
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 11:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DE91C330D;
	Thu, 10 Oct 2024 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PaHnC+Av"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30A1C245D
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559124; cv=none; b=nVK2OVP55wTOWbGDF463WxF+uq45rRTKu2ogfDvLrqmlZLGVwH8U0o5nTdmf7NnYKxe1N1IANp6VQI/Y44o9vRptLVROySXZuLLlKdkIs3bSD8ZFT3jUoV2hgLZ4k6reO8bYXF+zhhNMQ6VspPoD+zqZKpRJFpvVfhwNO9n/o5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559124; c=relaxed/simple;
	bh=VSwZWlxz1VeNMQwWcnNYN0iIOcX5lra2nWwP/BRzkZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=WGvrtJ3XgkIPaLeK9sdIs6iGILrjDQjUSqk/ojaG7+kH9ieW0x2rfi5HlNBjnbECkewg+1ymT/bpQ7xPePnYGew0in+o8B2ku8ewcngXnfPOTr0BT3WtWV4lYtPNnJz5QXLz0pK+9yrbGBLzXG4HpKU6Gurnr49g0iz6EXeL6Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PaHnC+Av; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241010111840epoutp024449bf511acb2efbd05cc9da3c499cb8~9E1y6q2Se2192221922epoutp02n
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241010111840epoutp024449bf511acb2efbd05cc9da3c499cb8~9E1y6q2Se2192221922epoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728559121;
	bh=jff9NSuMoS7Yqc0bLCDQyQa6uBRmIcSfMJ/0V7DhauA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PaHnC+AvaR7XVZsSxdIPacPK9wbjtWf6ACJoPXZJE+2YZ77AAPQ2VXvmT3baZxMX4
	 aSdviDCdQfEaUK0OCmbB4lqoC4nSpARgVGBVG9SUJqA9XLefe0//Bsw58vho1Fyihl
	 IhysZOVNniVsboU89iWaTY1AarFmiPl6aR4jJG5o=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241010111840epcas2p18a960c6c543ea329b9ea718eee5d7f1d~9E1ySJvRs2326923269epcas2p1N;
	Thu, 10 Oct 2024 11:18:40 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.70]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XPS1W58WLz4x9Ps; Thu, 10 Oct
	2024 11:18:39 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.17.09776.F08B7076; Thu, 10 Oct 2024 20:18:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111839epcas2p10a4386f2097c8ec9bebe1df6832e15b1~9E1xcKXRh2327023270epcas2p1D;
	Thu, 10 Oct 2024 11:18:39 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010111839epsmtrp1fa39588eaa4f241503f2661c99e67a55~9E1xbSP2u3121631216epsmtrp1Z;
	Thu, 10 Oct 2024 11:18:39 +0000 (GMT)
X-AuditID: b6c32a47-aefff70000002630-38-6707b80f88b3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FE.FE.07371.F08B7076; Thu, 10 Oct 2024 20:18:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111839epsmtip18769cef815600d2739a75d693b82d4cf~9E1xN-J6j1147711477epsmtip1b;
	Thu, 10 Oct 2024 11:18:39 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v2 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Thu, 10 Oct 2024 20:18:06 +0900
Message-ID: <20241010111807.3635504-3-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241010111807.3635504-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmmS7/DvZ0gy1LNSwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7o6t7AWvBB5mKc6/+sDcw
	bpHoYuTkkBAwkTg5ZRdjFyMXh5DADkaJTZPeskA4n4Ccu+/YIJxvjBIHlr5gg2npvfCfGcQW
	EtjLKHH8tzVE0UdGiRVP34IVsQloSWw7/IoJJCEi8JpRoqn3HTOIwyzwlVFie2srK0iVsECw
	xN2Hn8BGsQioSuy5dwysm1fATuLTwz5miHXyEtcfH2UCsTkF7CVmfVvCAlEjKHFy5hMwmxmo
	pnnrbLAFEgIzOSSO7/vJCNHsIjHx425WCFtY4tXxLewQtpTEy/42KDtfYuXKE0wQdo3EvbZd
	LBC2vcSiMz+BajiAFmhKrN+lD2JKCChLHLkFtZZPouPwX3aIMK9ER5sQhKkqMX1ZAMQMaYmJ
	M9ZCw81DYuvLa6yQcJvEKLFlv9EERoVZSH6ZheSXWQhrFzAyr2IUSy0ozk1PLTYqMIZHcHJ+
	7iZGcLrVct/BOOPtB71DjEwcjIcYJTiYlUR4dReypgvxpiRWVqUW5ccXleakFh9iNAWG9ERm
	KdHkfGDCzyuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgWnHkiSV
	5Cc3IlcpbC043fs8en3zj7JgRiPZdz63nfZyBK0Vzp9R9+Nkm8EjdvnJzx3uuIfM+WPfu9vw
	+jbV7jQWzp6pUk3HDOuf8c3bdN9axyrsFq+jSLDXx1en1D0yFh38JM5907swa5K0xXXGjfsr
	GJjMjay2chWHaMhU88XlqU3d2MieXWtqs+kD35eoSTw3Ty/O9rosa2d7vuvCjcssr9d+OPXd
	b95sN5dyvXvOd9NLQvZOvRs7oWR3/r3nHmv4yzd28to+1X14xPfP35WuqfH5z89Nclgh5yD4
	/6L6JbG73Tlz373pbnCWbM3nULvCOfnxx9TVN+aLqd7UKWRZJrDlp2GkyG7nEtaWPUosxRmJ
	hlrMRcWJAK384rtABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnC7/DvZ0g4vdAhYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8Wmx9dYLS7vmsNmMeP8PiaLG+v2sVs8WXiGyeL/nh3sFpMWn2ey
	ePzyH7MDr8emVZ1sHivXrGH12Lyk3mPn9wZ2j74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4Mro
	6l7AWvBBpuLcqz/sDYxbJLoYOTkkBEwkei/8ZwaxhQR2M0rMXB8GEZeWOPL7BRuELSxxv+UI
	axcjF1DNe0aJR6+7wRJsAloS2w6/YgJJiIAkzn75xQiSYBb4zSixYYExiC0sECjRdmEHC4jN
	IqAqsefeMbBmXgE7iU8P+5ghNshLXH98lAnE5hSwl5j1bQkLxEV2Et//f2KGqBeUODnzCQvE
	fHmJ5q2zmScwCsxCkpqFJLWAkWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwbGhp
	7GC8N/+f3iFGJg7GQ4wSHMxKIry6C1nThXhTEiurUovy44tKc1KLDzFKc7AoifMazpidIiSQ
	nliSmp2aWpBaBJNl4uCUamAq5hebf/D77Gft55YpSj4vuf/AvijyleZWs2UMpvuVF17O09vp
	u477YJPrXl4NswWHT256a7hg9tLzkyU0whbN/77sj/35PRYnt/B/4KhfY60btXDZyZnsTLLu
	3xewK0Xvs5sw/8LskpCgO7+b9fOtcw+wXwhnc7pr/Hdf5NZ8nisf30m3C39dKrNe98pK4e8m
	fYrFzxNqzFQnq55Pl9LeUd1x5d3Uk9odyc4PT047dc9bbIVijSnvx9tsGZNfnX+5XGPKozwN
	iewXJVeinkjMuC6tGs+lfc9+c+gmnWL12W0LWSfZ9BWorThg/VzDq+Jkef3TXeWzv/HVzn76
	ujfrUGzauRmXOJ5a9uqbT+frU2Ipzkg01GIuKk4EAIvroZL8AgAA
X-CMS-MailID: 20241010111839epcas2p10a4386f2097c8ec9bebe1df6832e15b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241010111839epcas2p10a4386f2097c8ec9bebe1df6832e15b1
References: <20241010111807.3635504-1-trunixs.kim@samsung.com>
	<CGME20241010111839epcas2p10a4386f2097c8ec9bebe1df6832e15b1@epcas2p1.samsung.com>

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
2.46.0


