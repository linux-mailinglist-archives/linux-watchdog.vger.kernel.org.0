Return-Path: <linux-watchdog+bounces-3472-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD5AB6812
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 11:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B4A1B672D2
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 09:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EB1261574;
	Wed, 14 May 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VCzszoMP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7846525E456
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216427; cv=none; b=p0ANwgESOl/ir8m3proNIYUUb35SrhUuR4xzb/5zWFgkzb+1z2VMgAeo21m7f0XU12JwZPt2umKm30sYKnFWe9cdvEXPgfCnz5+KK+hW26N+vb5fTC5qiVKvXmrFg25Td27LF1frHfWDIF3nXMQsIwfKwVYrOJrCwNuRPfxkkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216427; c=relaxed/simple;
	bh=622+LtoyH7U4bpu0gZpm1wzigDBNma3B5KPFSwSgLl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=BvNinDOQKmSAcccL1KQPUWfuMbtuqSe8SRvRvFAPIEr9gC+H/sgVxtsCdqY4iAWFw6ehuL95XtFRZmlQVo7dTilzWDjIeYOpNgcModXsFzH0uVLeWj0jBoT+tZU2L+A2cRTHh1DJBiLQy+vubQaYqVI4HUEjVipmdZNmxg8WZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VCzszoMP; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514095343epoutp01fddc30f867f4cf37fd1c769e162fa7c4~-XBR92IQx1877618776epoutp01N
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514095343epoutp01fddc30f867f4cf37fd1c769e162fa7c4~-XBR92IQx1877618776epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216423;
	bh=euDg0lpNrnAL1l5Mdnq3mtKgKzdVtdPZ2zegxJqxchA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCzszoMPD7nw+jtgtfo2yfzdf/o4bMLtODt74fiW+R3xb4WJ06a0eCqguMG3Yn7SH
	 szze6IKugVyKyuyOuQzR59luLsAEpd0Sv8D99ePX/GC46n0/wJjKCWniNFo9n0K9IU
	 BlBPudwPjGSHHgXhte574g6PB2FsE6YePr7cWUY8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514095343epcas2p134dadafb319aee512fab07dc76564974~-XBRh5m0j0288702887epcas2p1D;
	Wed, 14 May 2025 09:53:43 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zy7vp4ZT4z6B9m7; Wed, 14 May
	2025 09:53:42 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250514095342epcas2p366f8abb441850d4b503926425082f2e7~-XBQj9krg1373113731epcas2p3H;
	Wed, 14 May 2025 09:53:42 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095341epsmtrp1a88bf0b1c84a630ccc397dcf28e64214~-XBQiV3do1996219962epsmtrp1S;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-da-68246825082b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B9.55.19478.52864286; Wed, 14 May 2025 18:53:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095341epsmtip16e419ee7529645ed800122dee606b8f0~-XBQYfbc43083530835epsmtip1Q;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Wed, 14 May 2025 18:42:20 +0900
Message-Id: <20250514094220.1561378-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSnK5qhkqGwcUvFhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZcxcsp+5YCl3xeVVdg2MFzm7
	GDk5JARMJNrP/2fvYuTiEBLYzijx42AzaxcjB1BCSuLdM0uIGmGJ+y1HWCFqPjBKTNzwnwUk
	wSagIzH9320wW0QgTuJY+2ZmkCJmgUeMElfm9TCBJIQFwiR6v+5gA7FZBFQlWs6sAovzCthK
	9Ow4xQixQV5i5qXv7CA2p4CdxNyWVjaQI4SAapq2e0CUC0qcnPkEbBczUHnz1tnMExgFZiFJ
	zUKSWsDItIpRNLWgODc9N7nAUK84Mbe4NC9dLzk/dxMjOOC1gnYwLlv/V+8QIxMH4yFGCQ5m
	JRHe61nKGUK8KYmVValF+fFFpTmpxYcYpTlYlMR5lXM6U4QE0hNLUrNTUwtSi2CyTBycUg1M
	OQ9ebZu/7MeX7QvCo77LvNzxwb2c/VP3m6cZEterUx4GLJqw6GHT4r8XLmZ/63q3qpG9wPR/
	4mfhJV6hV5acCzi7PGrP79KnK/jOGbzc8eRWh9O6BKt8if+hzmU32RUu3n79dVJCiwjHp9gE
	MeYmKWvGFwzulq7nCz/w7UhX+1z/R8NV78WRdT9WZRZFXLfSf3Gv4seO2qstd9/Ihc29HtQV
	r/zisnq/lEFsrKd+/bw40fyo1uUP5k39fpDlo8NzmeArSYZ9Ei68mk1l1pVtmQwbXv1VFH5w
	6eQp+y+bV39y0TTrM7i6+kH/uy0x88xkglslDrgwb+zitZvqtcG6Ztmd+ud7TdbrmBo48E1s
	UmIpzkg01GIuKk4EAO3sg/fnAgAA
X-CMS-MailID: 20250514095342epcas2p366f8abb441850d4b503926425082f2e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095342epcas2p366f8abb441850d4b503926425082f2e7
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095342epcas2p366f8abb441850d4b503926425082f2e7@epcas2p3.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 3c12a3ae50f8..bbc1d9916f67 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -275,7 +275,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -287,7 +288,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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


