Return-Path: <linux-watchdog+bounces-3979-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6FB1C0D5
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 09:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B0A625198
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 07:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ECA217704;
	Wed,  6 Aug 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kxBiL9/N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63E021B9C0
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463639; cv=none; b=hyykkFa7kS4NoDMNmM18jZthLkGD+/aihls3YuAc4+9bEjQ5rwzkg8QOjahNPxPbZXktMP8LGkNb/08u3LnRB5j/V2SLnvsAmjJOwxJ7oRb4VohzyRBf0AVvBV/Tmqwcz5si2LY7Rp5Pb76br7Bn7UhLCdOrFieroYLQdHmN5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463639; c=relaxed/simple;
	bh=H59zEFkgFttAf9nouPo8nKbeyZ/Sdm2Wafzx8hd7zMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=D9vtFCKi4Kl7o8PidrYQs+xGknsQFdG2QYNbQ+2WBys62mokmhlqAFFYNjGAqV2q6MAWtsJEz6DgGer5Ol6QhAh4FZpfZs6kRKSsiZdOzpKXS6NDY63vBQuuYW/bEhMuQZ9wPT6DUe6+tNM52nzv2aqsNSP4KchIeBPt8tMiiVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kxBiL9/N; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250806070032epoutp02fd6bb9f279611461cb96cfe502fe03cc~ZG2DWlobM0839408394epoutp02P
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250806070032epoutp02fd6bb9f279611461cb96cfe502fe03cc~ZG2DWlobM0839408394epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463632;
	bh=QgSLuMB6IfJaTXVdgDlHnqEzw93HHayGHE/LD8ICjyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kxBiL9/NY3QZDKpUFVDQ8B9ssxfdXlQSIoMtlCAahjZIUgIzjLtPquFXPdrcEsQkA
	 AP1PZuunH6DzIx4/wxvDUr9iAVEpH8H7FG2FxRquFIXOVsDHgecPM/B9wrLnpZr8KP
	 C2g21aD7RpWXlDJhmX++3GD/95P/gZyczoFZtGzk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250806070031epcas2p21c1f038c06775770821addbeaf4359c5~ZG2CyzZOM0387403874epcas2p2l;
	Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxh5B6cxdz3hhT4; Wed,  6 Aug
	2025 07:00:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4~ZG2BMJm2w2311523115epcas2p4N;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070030epsmtip23ac824b074935795eb4b803619af7160~ZG2BC8YTS2044420444epsmtip2g;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Wed,  6 Aug 2025 15:55:14 +0900
Message-Id: <20250806065514.3688485-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806065514.3688485-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4
References: <20250806065514.3688485-1-sw617.shin@samsung.com>
	<CGME20250806070030epcas2p4f9b779bd9fde57b4bfea958efdf62cf4@epcas2p4.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_CNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 541870b4d01a..f25563585983 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1


