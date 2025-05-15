Return-Path: <linux-watchdog+bounces-3484-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E8AB7FA3
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 10:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C6B01B66533
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 08:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B181288519;
	Thu, 15 May 2025 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pmYFseS5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FBC2882A5
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296195; cv=none; b=SNvP+/HW/tI/L6tHvGBmX+VIK2MVH/5WNkT7T3VeJ2r2Zp+ZGnC45qg9Z5zFbs2TrDFkb6amR+rfZUtU3K2AhS9Py1umgqfOEWDzMuqbz/jo3qb7G4qaMxcP6LPzM+22ZYzr4F/kPcONcZr7OP2Qr92ug2ao8kNz/IkeaqJ8oe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296195; c=relaxed/simple;
	bh=EyGor6XVIMq7J+WDI1N7ciU1xsKQCdfgZtKjtEldfQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gY5GYZikdx4rKPhUR9pHSy/6redcTEsTan7zcWcL29qgEqd8TNGyeMV4Nq44AY7rpiAXBVOJrIU7kx3Sm1Muox8iNkTHhYzQWfxqgAVCavuki5keKQpSAVoi/utZ12l9wMxbU2MeS+fNsn/OBsIL4Xc3Bu2E5f+u9/80ZkzFLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pmYFseS5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515080311epoutp0198ce60ac95036e6afac2e82688c88c0f~-pKD_SlKv0978009780epoutp01Z
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515080311epoutp0198ce60ac95036e6afac2e82688c88c0f~-pKD_SlKv0978009780epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296191;
	bh=6E+pV7n6F1eiQsjNgSMeovGhdczmhV6c5wMuEuVtyBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmYFseS5N4H5pnvdK01BIqDgEPdkLbvewVptfUh5Fm17MgtQKW60Djm8m2yMvEQH3
	 mHwLJ1AzgqUoIGf7KbfJBEDb1hg3LGGwujszqKPyHBZRsPb0FFl4BYIpuqn76ISwkl
	 0UDXurBYrUF+AgSjqWCBnhjX0NVlyQNoDmAg/i/k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080311epcas2p37c9372ba816747ad9656a31ce32f9b3f~-pKDlpvx90512805128epcas2p3N;
	Thu, 15 May 2025 08:03:11 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyjPq0RPgz6B9mS; Thu, 15 May
	2025 08:03:11 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250515080310epcas2p3e045327d03d031d38614464e881957d1~-pKCtzKMG0512805128epcas2p3J;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080310epsmtrp251f35ed8e6bc7e92010376c57bc1c705~-pKCsNObh0272802728epsmtrp29;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-08-68259fbe1191
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	FD.77.19478.EBF95286; Thu, 15 May 2025 17:03:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080310epsmtip2d6c9b47d2e65d4be8635ae76e0ab739b~-pKCeOpfZ1291412914epsmtip23;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Thu, 15 May 2025 16:53:50 +0900
Message-Id: <20250515075350.3368635-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvO6++aoZBscvCVk8mLeNzeL8+Q3s
	FpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4RkmixmLT7JZPH75j9mB02PTqk42j5Vr1rB6bF5S
	77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGVMfTObpeA9V8Xe263MDYwLOLsYOTkk
	BEwkmt9sZ+xi5OIQEtjOKLFp8R32LkYOoISUxLtnlhA1whL3W46wQtR8YJT41PWfESTBJqAj
	Mf3fbRYQW0QgTuJY+2ZmkCJmgZ2MEi3TfzODJIQFwiRevP/LBGKzCKhK/Nl0gBlkAa+ArcSy
	WXUQC+QlZl76zg5icwrYSUy8uAtsvhBQyeE9T9hAbF4BQYmTM5+A7WIGqm/eOpt5AqPALCSp
	WUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEB7pW0A7GZev/6h1iZOJgPMQowcGs
	JMJ7PUs5Q4g3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNTqoFp
	cX9q4vrq1qslwjMnr5nH0f+S92yvjdIK8yb2AwdEn6zOvcffNKWi7mi18LsnLcdCY16nB93m
	q+TeqrrQPYNtpeUkG2bhjaxBLq8vaH9ZUn8j2u3dLPa1f1mEQ/RsFyjMmTzrz+Krtz5s8Fq+
	Sv2nbeWeekO1Ei13TYPO2gOCmtfeGG5nsPv/MdiAU9JelkVk4k2e0xnNV2eHJvbeSeR8ev38
	lnMfQn7t/s7ZZvWYlzOzytSaN3PN/HX77H9xhsiovp+tv9f6eJOZVWYA06z4Z2t4p2esvFav
	t9Kw8KDW7UUuxreWqRzoFnnc48RyueNzweYLf8t4p6lsfBE06Yip8Ob911oi5pw5fzzvGPde
	JZbijERDLeai4kQAlpDYcuMCAAA=
X-CMS-MailID: 20250515080310epcas2p3e045327d03d031d38614464e881957d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080310epcas2p3e045327d03d031d38614464e881957d1
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080310epcas2p3e045327d03d031d38614464e881957d1@epcas2p3.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
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


