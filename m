Return-Path: <linux-watchdog+bounces-2923-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60EA33433
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 01:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABDA4188A749
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 00:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25354D8A3;
	Thu, 13 Feb 2025 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Nj/kPgnA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9F78F24
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2025 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739407448; cv=none; b=Uf62B3gK/LlCtITaRli9RPH4zGHlZJSJQmCy/C1msKHKR+DWx6h9uclZ0HjOdsErTomioU+2qxjkbXuQwj7Pz5UjpcaNJBTnljkuDA1XisNquSDgYNs1FqYAr5VRjQxRzyyuo5M8LlA2oKMjhqyzxazrceJvWcUhB/aSH6+Udp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739407448; c=relaxed/simple;
	bh=kNMNh8c15ufMq2hOdDy+f201l80OHrU6gDtUHgb/Pjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=D59y7NoeQ7mV2YTd5fyudGvln2a6geXU2aEzJ+ZlIlIgMwOYQA8MaKGKcyFjURyp6eviXmIQVZoMZ0tC07IQvy+RuDN4RswaB3hGbinARbUppXvrG3n0zbno71M9mTcbHEEVlNF66aImmo7XWAVCao4Gpklfvvq/umgAGUNj2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Nj/kPgnA; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250213004404epoutp04a634a1cc29d5435bc8a331b54d06920b~jndrWF24c0235602356epoutp04x
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2025 00:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250213004404epoutp04a634a1cc29d5435bc8a331b54d06920b~jndrWF24c0235602356epoutp04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739407444;
	bh=qbsRW+rPGG7sOyzmINLAUZ6n+49WHNhTA0JmCyA9gd0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Nj/kPgnAIPEHbsCUiBDAMy8HhDpJMmRmob26t5NUgGsZ1R+eMr5VDM9nQnK1FXsvN
	 BgG0+L3ghibl632WzsF/sht6GMMcAgX/9d2KmZM8LvKupD/sL/BHvl7KhYAYX0fPoA
	 naPLF2fgRDySUlAIbTYYypEufYNoJooVjJu0QpQ8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20250213004403epcas2p1fd64379ec227f4747d2b7869ff563cb5~jndqx7TXN3215432154epcas2p1o;
	Thu, 13 Feb 2025 00:44:03 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Ytbz70dnhz4x9Pq; Thu, 13 Feb
	2025 00:44:03 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.45.22094.2504DA76; Thu, 13 Feb 2025 09:44:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0~jndpwXQh31412714127epcas2p3n;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250213004402epsmtrp135a32c55cf064ad1d4c0242b0595a572~jndpvmMWf1131811318epsmtrp11;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-c3-67ad4052a3ba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.80.18729.2504DA76; Thu, 13 Feb 2025 09:44:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250213004402epsmtip127a07f22bedc87064fa6ed47580ccf53~jndphlQjr2674526745epsmtip1Z;
	Thu, 13 Feb 2025 00:44:02 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Kyunghwan Seo
	<khwan.seo@samsung.com>, Sangwook Shin <sw617.shin@samsung.com>
Subject: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Thu, 13 Feb 2025 09:41:04 +0900
Message-Id: <20250213004104.3881711-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmuW6Qw9p0g/PrbSwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWMxafZLN4/PIfswOXx6ZVnWweK9es
	YfXYvKTeY+f3BnaPvi2rGD0+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0
	tDBXUshLzE21VXLxCdB1y8wBukxJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2Be
	oFecmFtcmpeul5daYmVoYGBkClSYkJ1xf0sXW8EewYqHDQYNjPf5uhg5OSQETCTO/7vH2sXI
	xSEksINRYsrES4wQzidGiWt7W6Ey3xglZh75wAjT8mr7JTBbSGAvo8SEf95wHQuvTWMHSbAJ
	6EhM/3ebBcQWEYiSOLhjGTtIEbPAHUaJff9fMIMkhAXCJB5+WMMGYrMIqErMeX8WbCqvgK3E
	ouMH2SG2yUvMvPSdHSIuKHFy5hOwocxA8eats5lBhkoIfGSXmPR/KQtEg4tE74ErUKcKS7w6
	vgVqkJTEy/42IJsDyM6XOPVEGKK3gVHiXfN7Nogae4lFZ36C1TALaEqs36UPUa4sceQW1Fo+
	iY7Df6Gm8Ep0tAlBNKpIdPzczAqz6OiZB1BLPST6p+5hBSkXEoiVWLcqeAKj/Cwkv8xC8sss
	hLULGJlXMYqlFhTnpqcWGxWYwKM0OT93EyM4aWp57GCc/faD3iFGJg7GQ4wSHMxKIrwS09ak
	C/GmJFZWpRblxxeV5qQWH2I0BYbuRGYp0eR8YNrOK4k3NLE0MDEzMzQ3MjUwVxLnrd7Rki4k
	kJ5YkpqdmlqQWgTTx8TBKdXAFKIjenFiw/QT+upal1qvvFbcvCqCacfl5esc7FnniHvVb6o5
	7xPnJ2ao9fDBRl+PgulxE59kfD7OZXr1nneZh/E7t0ULzosZ6ZuIFQuJsARu2rwtkYXpaMDx
	a/6W2s7ix24UNS165f5KaU2iVVqPPEfkrv3X48vaLSxjvkjO7jPyFL9cPEXhl3mZzyXd3fce
	LenNUjjNGbQza9fS28yLhXKzFib5sd6+HeJ34uXvV4JzWc5tnnzbK2X1ajU2KdstrTuPzo+0
	NJCY53P7sJb0bwGtPu3sC5Xv7+3tOpBevfr4O/HkE5++Lzr2a1lW1vQ9CdOmW8ssjjyXKy/5
	1D2ysevvoY711W6Wx7M9WZRfK7EUZyQaajEXFScCANojCCgjBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSnG6Qw9p0g72zZS0ezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWMxafZLN4/PIfswOXx6ZVnWweK9es
	YfXYvKTeY+f3BnaPvi2rGD0+b5ILYIvisklJzcksSy3St0vgyri/pYutYI9gxcMGgwbG+3xd
	jJwcEgImEq+2X2LsYuTiEBLYzSix9FsDcxcjB1BCSuLdM0uIGmGJ+y1HWCFqPjBK3F21mA0k
	wSagIzH9320WEFtEIE7iWPtmZpAiZoFHjBJnb0xiBkkIC4RIrD56jgnEZhFQlZjz/iwjiM0r
	YCux6PhBdogN8hIzL31nh4gLSpyc+QRsKDNQvHnrbOYJjHyzkKRmIUktYGRaxSiZWlCcm55b
	bFhgmJdarlecmFtcmpeul5yfu4kRHMpamjsYt6/6oHeIkYmD8RCjBAezkgivxLQ16UK8KYmV
	ValF+fFFpTmpxYcYpTlYlMR5xV/0pggJpCeWpGanphakFsFkmTg4pRqY9n4WTj3mO7tuj8HB
	z2o1nxlT178PKXlnvO6Lx6x5z5Z8q9Z9/VGidIHSERmWKXrCncoGU5652LEfbvt8uH6ViZe/
	+84pD678r22Wmhiz8bNPnapbQKOo6L3MKXzXlJdYl5eIHqne9uHwgWu6m3Sf/jtQKic1Pd86
	b/mirez/9r/cPP2BlFDHupc5Wyw0Hpx6wl/66SbvMq1Ztx7skNGZucF4elOoUG3Os3W12377
	81oEX3JNcfi8xqaiOoFx2ZmJG0y2OvF9S6lIX2+3Re0Fy+LuZ/O25Nk13Llz9iuzssq6M93h
	Mc3LNrw88ezYeVfzkq37bLysFA/1/6hq5K+Tfv9TsrWu9IViUYNjaS3fTSWW4oxEQy3mouJE
	AJaJ723UAgAA
X-CMS-MailID: 20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0
References: <CGME20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0@epcas2p3.samsung.com>

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


