Return-Path: <linux-watchdog+bounces-3014-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B204A45697
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 08:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8E616A87C
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 07:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A0826869E;
	Wed, 26 Feb 2025 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="U/3BJIwQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A753268684
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Feb 2025 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554741; cv=none; b=UYN4lxsrhLPskrCnJimMAku3fPlqlh18XEvKwoVOtshAKn2h1FfAm8hq5RF8sRx1iL7u+2wMFZipqgh0daWchNsjQ2udVtWxbNXy74qi27bYO/EMoFYy3l6ytNa/AKFKKEKk/Ihlh4RBFl1jE6jZ9u4yzsAEQO8jumrRPMIb5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554741; c=relaxed/simple;
	bh=kNMNh8c15ufMq2hOdDy+f201l80OHrU6gDtUHgb/Pjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=rpoemOq1pBcbDLvQNdn5mlyobJ6+oWtiv8dPR2DygnExfPcJ9lavbrugjcLft45xAKQEMhU/+N8BFrLsfx8YlBPIZrYjotl1g6bnk5Ax3ua3N0yBgb3AghgqO85zM9aawU9NOUATmupimZOhwzC3mc47zb1ANE8dQAJjFquNBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=U/3BJIwQ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250226072537epoutp029cd93e226beaa8c3c71ed37365905cc9~nsU-GsPSH1613516135epoutp02O
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Feb 2025 07:25:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250226072537epoutp029cd93e226beaa8c3c71ed37365905cc9~nsU-GsPSH1613516135epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740554737;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=U/3BJIwQ+2m+T2HIVBrcrunOt9lphQVsGs2nOz766KfjqZCFxfWG918HbuwIadqd1
	 1GhgbFLer4MCuHvV3/P7p3OP1VE/yMPLDdhfDyV8PM+6oI184AW49LCMEHuzn12z1C
	 C1ABwpz11qSlcSxmVyWP9v8cA19lSbX7vHUIuEVg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250226072536epcas2p2669e3682cad6e97d545cc6f2542a446d~nsU_jZinE1172911729epcas2p2y;
	Wed, 26 Feb 2025 07:25:36 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z2mGR6hkbz4x9Pp; Wed, 26 Feb
	2025 07:25:35 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	20.75.22105.FE1CEB76; Wed, 26 Feb 2025 16:25:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219~nsU9VGKON1585315853epcas2p4N;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250226072535epsmtrp2cae8b068735d2728e3d8fac672b2d743~nsU9TwQsh2895528955epsmtrp2L;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
X-AuditID: b6c32a47-f91c170000005659-ac-67bec1ef5bfe
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A4.89.18949.FE1CEB76; Wed, 26 Feb 2025 16:25:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250226072535epsmtip29c454e0beda8b5dc9cf893abaa8f1a2c~nsU9Im_nx2560225602epsmtip26;
	Wed, 26 Feb 2025 07:25:35 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Kyunghwan Seo
	<khwan.seo@samsung.com>, Sangwook Shin <sw617.shin@samsung.com>
Subject: [PATCH V1 RESEND] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Wed, 26 Feb 2025 16:21:51 +0900
Message-Id: <20250226072151.2123990-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTXPf9wX3pBu8/mFo8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsZiw+yWbx+OU/Zgcuj02rOtk8Vq5Z
	w+qxeUm9x87vDewefVtWMXp83iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGto
	aWGupJCXmJtqq+TiE6DrlpkDdJmSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8
	QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj/pYutoI9ghUPGwwaGO/zdTFycEgImEg8W+HTxcjF
	ISSwg1Hi+MbnjBDOJ0aJhq6NbBDON0aJr9NfMXcxcoJ13G78wQKR2Mso8eUyTBVQy8bzsxhB
	qtgEdCSm/7vNAmKLCERJHNyxjB2kiFngDqPEvv8vwEYJCyRILJ0+gQnkEBYBVYnzF0VAwrwC
	thJ7lk9lgdgmLzHz0nd2iLigxMmZT8DizEDx5q2zmUFmSgi8ZZeY1/SGEaLBRWLO4WdQtrDE
	q+Nb2CFsKYnP7/ayQTydL3HqiTBEbwOjxLvm92wQNfYSi878ZAepYRbQlFi/Sx+iXFniyC2o
	tXwSHYf/skOEeSU62oQgGlUkOn5uZoVZdPTMA6gSD4ltu3RAwkICsRIL+6YyT2CUn4Xkl1lI
	fpmFsHYBI/MqRrHUguLc9NRiowJjeIwm5+duYgSnTC33HYwz3n7QO8TIxMF4iFGCg1lJhJcz
	c0+6EG9KYmVValF+fFFpTmrxIUZTYOBOZJYSTc4HJu28knhDE0sDEzMzQ3MjUwNzJXHe6h0t
	6UIC6YklqdmpqQWpRTB9TBycUg1MDcc/HDj/0t2nb8Fet4txHX8EX3IeK26udvnv17aN9eDH
	YrfFE10lbebt8GOv9548LZ45+SCP7/Pzf49r341ZcafQWWP39Rmpb+t2u0yTX82wUUL7pMmV
	jLm8Wy7vPhTqK7VwbZhrcMGifV4zPtvEPryYvkPKiz9pX0lZhRfjgXsVF9YkcE63VFls+F3c
	+OhaK7ErInP1nEVMbNZbOLodNvp/VWNZplrM4aN7GeOZYp+6hHJs4N201YHN8VDcnhMSpw/q
	75r4pPvTpXefguUz3fYsPfVmd41O71/27EOsherHDz3RW8jgnidXk2IxwfXlwgmLNxqvFF6/
	afqcOZOXcX37d6ZpRu6tHKfq/VL85kosxRmJhlrMRcWJAKVLhBkiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsWy7bCSvO77g/vSDS728Fg8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsZiw+yWbx+OU/Zgcuj02rOtk8Vq5Z
	w+qxeUm9x87vDewefVtWMXp83iQXwBbFZZOSmpNZllqkb5fAlXF/SxdbwR7BiocNBg2M9/m6
	GDk5JARMJG43/mABsYUEdjNKfJpv3MXIARSXknj3zBKiRFjifssR1i5GLqCSD4wSR9f9YARJ
	sAnoSEz/dxusV0QgTuJY+2ZmkCJmgUeMEmdvTGIGSQgDJdoerGYEGcoioCpx/qIISJhXwFZi
	z/KpLBAL5CVmXvrODhEXlDg58wlYnBko3rx1NvMERr5ZSFKzkKQWMDKtYpRMLSjOTc8tNiww
	ykst1ytOzC0uzUvXS87P3cQIDmMtrR2Me1Z90DvEyMTBeIhRgoNZSYSXM3NPuhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXHeb697U4QE0hNLUrNTUwtSi2CyTBycUg1MnpuOdUjP/D2FhVNyS+dz
	2Wa39/8tdn8sv/180c6vS6ZMnSu9VPNb8srEMwvKn4dqaffVCjb9qbgu9snmTcHuk8wrDq34
	lbR+/XTljfJrfKJVJj98tKdxHmNsYsTLpWacM3jcPn/nX/llntxDl0MbvXKPpk5o22esk/cj
	u/jXlXCnZrf4k5732vgtlk5Q3ur4fPWrTNVo6U8ePx1/xShsClmTGPJIL8dAo4Dj22/btt3a
	dgsk+Jm5zNiWSpyzcarJcOf0vRngpOfaP7G0vyA1ZkXekidXJ8zzjsi/v81A4TuD9rXy7eoy
	l1cd9b776DBHunxdzycV+/Nlmv8P8hUcvWZYWZDv96Pq3IWt/yYlKbEUZyQaajEXFScCABcQ
	jCrSAgAA
X-CMS-MailID: 20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219
References: <CGME20250226072535epcas2p46d41cb5cdd7ece18c898657c3c66a219@epcas2p4.samsung.com>

From: Kyunghwan Seo <khwan.seo@samsung.com>

Fix the PMU register bits for the ExynosAutoV920 SoC.
This SoC has different bit information compared to its previous
version, ExynosAutoV9, and we have made the necessary adjustments.

rst_stat_bit:
    - ExynosAutoV920 cl0 : 0
    - ExynosAutoV920 cl1 : 1

cnt_en_bit:
    - ExynosAutoV920 cl0 : 8
    - ExynosAutoV920 cl1 : 8

Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9..bdd81d8074b2 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -72,6 +72,8 @@
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
+#define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT	0
+#define EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT	1
 
 #define GS_CLUSTER0_NONCPU_OUT			0x1220
 #define GS_CLUSTER1_NONCPU_OUT			0x1420
@@ -312,9 +314,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
@@ -325,9 +327,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
-- 
2.40.1


