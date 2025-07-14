Return-Path: <linux-watchdog+bounces-3853-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD6B03664
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 07:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E853A46B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 05:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FD1221544;
	Mon, 14 Jul 2025 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qb3l8xD/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59121171B
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472745; cv=none; b=ny/7jBJ53heMiwiDW1iRy/g6GbxmmmKv2j3HMTXb9u94+gERnfSmhPL0HjvylNiF23tHvVNj4jW/IhIUKSmt5t8rv2/+yIHaT+T3l9Rn2x3kLchtQZPmjdo4w4f9/bE0y+YlQyeaS1qdHTFea8brIwpgdzzSsI01JFIvGs/ILHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472745; c=relaxed/simple;
	bh=L5w8nOCWhHIt4VUgcnETruLqwDBiuQMPXWAtncpU36w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=k4glYD6mmtcUt22HKBn90Fyxfaw8R45XGWdO/u0GpjksGic0v6tZMTayGdg6E2D5zwhRFnk5vrhx8mtSO7YawCILueXVyNplw9nrUg/OzfEnDRbMwAlbetfBI/BWVCWZVKYRQJZp9NPEwpQ5M3J4sYvwVFzNLcHPfYLrWCjdPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qb3l8xD/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250714055901epoutp01457ba94493f57865202d7d7944deca27~SCKxgJtmY0863508635epoutp01F
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250714055901epoutp01457ba94493f57865202d7d7944deca27~SCKxgJtmY0863508635epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472741;
	bh=h/2fQI/zf7/x61gr9rM3UlriUS2jlgszH0VwYLpTmgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qb3l8xD/rVVZ/eSF6O54Q+n07gfiRibmjbY/5S8x206zHST858k97u6y6vEDKXmdG
	 0du8iobqOgAznivEq1AymF3fbdCIJRxJZKD2hs9ErwYaWblQnoAC+r26OcuGRZSuPG
	 RVG3PcY6NbXouxf41jvVxwiZpjUZzFs5DjLeEIBs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055900epcas2p268638335cb5c29aec01140f927fd2e45~SCKw-0Xa51842718427epcas2p2H;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bgWpr1hy7z6B9mG; Mon, 14 Jul
	2025 05:59:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d~SCKv5Z-HM1914519145epcas2p29;
	Mon, 14 Jul 2025 05:58:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055859epsmtip168e49a98a3b9a9ba36108b133133ac95~SCKvzaigo0355503555epsmtip1Z;
	Mon, 14 Jul 2025 05:58:59 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Mon, 14 Jul 2025 14:54:39 +0900
Message-Id: <20250714055440.3138135-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055859epcas2p256ce350e05d8812ca2900823a1e4913d@epcas2p2.samsung.com>

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 090b78717cd2..184b1ad46ca6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -356,7 +356,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -369,7 +369,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.25.1


