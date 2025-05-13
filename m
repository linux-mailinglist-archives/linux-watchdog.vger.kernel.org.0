Return-Path: <linux-watchdog+bounces-3466-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E9EAB508D
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 11:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A402D864DE0
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 09:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F542405E8;
	Tue, 13 May 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u1Cam7XM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8B23D2B3
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130226; cv=none; b=tlEDs1ftmZSy4wKA0U6BTJM5vFX2nyy4TOVZzhnuR5pdz/40GtO1o462WeY4+g118XJj8bq3VOjwXvUjF9ZsDAbivOQ9JK6vMSCk6CAdP4k0xo08dARSXr4FfYQ5FD6b8hJ5NK3/0EJKnhXIalyD/JOoJm2Wvzh0RgpayZuWu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130226; c=relaxed/simple;
	bh=hAQdDieYaKsuSNVZS4/KixFvXY7X75ocwsKdy8jvvhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=NMoGrOPw9z6IkAJK1q5kW8UhXT6NjBBeerVI52ba7RKIR6bRbm0rlnLULCnjK81rzAw7RUrscWh1okbhtdxz4sxQFIvyqAt+dybweoMR1wkuEArXutxBLThV5S+EiIcy9rInl9lsJte12OKHD4HYVIeaHTE59KPAEa0x3ZHrjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=u1Cam7XM; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250513095702epoutp02d5c6825befc4db9dc75b02b003666ec6~-Da44Fsa42720327203epoutp02I
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:57:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250513095702epoutp02d5c6825befc4db9dc75b02b003666ec6~-Da44Fsa42720327203epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130222;
	bh=DnQ9+b8org6s1pxYGa7eJ31JPvtF7h8oe1U+bvOBcuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1Cam7XMsSsvHHNaKz3EsUJ3+PTYvj0lbOsxJfrAjJFdMYSJjwATHvqK/KZ2VZafl
	 nHPLOghHxiAEtoSjzEIe3TuzSRaAq9iaWn4VWnysKJofJ0N+xI1OBHBbGV54ehKadP
	 sW5A56E1UWagsIcH/fBOZIF0KnrW5HPWX3Mk2zvA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250513095701epcas2p3f757cc5a03c93e1b839c161b622205b1~-Da4LcN2M3204032040epcas2p3p;
	Tue, 13 May 2025 09:57:01 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxX251CFsz3hhTB; Tue, 13 May
	2025 09:57:01 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34~-Da3HTgts3204032040epcas2p3j;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250513095700epsmtrp12431157914af9efc70fc92756bca32ed~-Da3GYVE51976619766epsmtrp1e;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
X-AuditID: b6c32a28-edfbf24000001e8a-1a-6823176c5881
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.78.07818.C6713286; Tue, 13 May 2025 18:57:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095700epsmtip2957cf38d053f24a138e555a24906be87~-Da29BYeS2427724277epsmtip2j;
	Tue, 13 May 2025 09:57:00 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH 3/3] watchdog: s3c2410_wdt: exynosautov9: Enable supported
 features
Date: Tue, 13 May 2025 18:47:11 +0900
Message-Id: <20250513094711.2691059-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513094711.2691059-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsWy7bCSvG6OuHKGwaKTEhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZTSd72UrWMpd8XjBR+YGxouc
	XYwcHBICJhL3n6Z1MXJxCAnsZpTo+nSDDSIuJfHumWUXIyeQKSxxv+UIK0TNB0aJN4c3M4Mk
	2AR0JKb/u80CYosIxEkcaweJc3EwCzxilLgyr4cJJCEsECzxZetfZpChLAKqEveX5oGEeQVs
	Je4s38kGsUBeYual7+wgJZwCdhJfW5RBwkJAJe/mbGGCKBeUODnzCdgqZqDy5q2zmScwCsxC
	kpqFJLWAkWkVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZw2Gtp7GB8961J/xAjEwfj
	IUYJDmYlEd7G7YoZQrwpiZVVqUX58UWlOanFhxilOViUxHlXGkakCwmkJ5akZqemFqQWwWSZ
	ODilGpi870+uXZccdTCqSjP42EmLmSHaj7VzLrbJKyqcK+dg3fjGK4nvl5rCmvwgQdN5TVNu
	hWwrO9LRlnr10e+fxyvuC6/ZsZpRy+ntuukNAV88lW0M5XP25AjwHS1o8Zfb7cjDyC4p2MN7
	5O/PRoPXS+MOagivvHr18JGXwo75Piy5XGcMfENtF7W+EODMLzCe/CpPJOcgT7wF2/zNcct8
	ZojaGKkovJh421Zf+nbDBjkxzyRGhZ3+2htWVVjday3MvKW4e4aW7d8FdQyfxXeGWr5I6v/I
	zZ7+ecu1ghVRolyOynXCKbU/9h8ycd7A38Jjmb1y++EpXpsOt5tsS223FHaPWSvbe3Oi8qwb
	RUvtlViKMxINtZiLihMB22VAl+oCAAA=
X-CMS-MailID: 20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
	<CGME20250513095700epcas2p33505c67ac3c3ba687ccf4a70ade10a34@epcas2p3.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 48819246f1ac..a630d5da3ba1 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -274,7 +274,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -286,7 +287,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.40.1


