Return-Path: <linux-watchdog+bounces-3855-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0761DB03668
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 08:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00B33B9373
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 05:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA092264B5;
	Mon, 14 Jul 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J2JO1dvE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B98F2222BF
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472747; cv=none; b=IfMqyoOjPvwaJ2lXVjuf7dnMTyzmnJdjvaX/6WZKWd3xbAD6ghh8k33E248PBwarrqQxknJYOfnaOCNBPxS7chGv24LQSHHBAhM1X7+iq8+pUmmUcyhuA6g/uA63ftZt2Y3K5uFOoKPyOUOrba8dlkV28A/sba2oN1Yi3uuRF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472747; c=relaxed/simple;
	bh=ZX4Sj/8gihZS0yNpxG9qjEZ9uV/DMHh10wMZ7nATLxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Cbz8BOHS5lXiv3hO/WTCsxE9W61ZtnSgqg3eahJLSnql1kp2nYYGwCru4OcSRpK60XONkxlep5PKlTtuIPf4ImJH+2khL5M6Edz0OryJo6lANVW4RyYNV85NrwcB6hRYvmoynbheXrXRkeASq2G5nk/1n+wQ1V8N0MQKM1oHSQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=J2JO1dvE; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250714055859epoutp0229fc5dc01265a1bf13e42f2438b183f5~SCKvXxNAN1586915869epoutp02a
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:58:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250714055859epoutp0229fc5dc01265a1bf13e42f2438b183f5~SCKvXxNAN1586915869epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472739;
	bh=Pbi2ramR8l7UZqKCJOrdKuItlZX/GmKvNFxVQLDc/nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2JO1dvEnxsmltSfd2BEwtKYDopCRx7wOpcxpHl/urO63Z+rDYaoRZL0eSFNAzClG
	 gXtb7QzZSn0hkKftKS56oMq5g9p7GSSs8g1+oBXkOPeH25oUtJAfd4/ZKxWTUaaXNh
	 0eEJz7NlfktPLhR6yTW2vPs2iFiqsw3FLUQIPeq0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055858epcas2p24a090b666afd311886f4e04b775007c9~SCKuyYWUf1914519145epcas2p26;
	Mon, 14 Jul 2025 05:58:58 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bgWpp1MZxz2SSKs; Mon, 14 Jul
	2025 05:58:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055857epcas2p18cb516424b84f972970eed1ac5726c54~SCKt5qB8F3217032170epcas2p1W;
	Mon, 14 Jul 2025 05:58:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055857epsmtip14b84532306385aa5f10258f158f9da0f~SCKt0fYvC0355503555epsmtip1Y;
	Mon, 14 Jul 2025 05:58:57 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Mon, 14 Jul 2025 14:54:37 +0900
Message-Id: <20250714055440.3138135-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055857epcas2p18cb516424b84f972970eed1ac5726c54@epcas2p1.samsung.com>

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
A ceiling operation is applied in the calculation process to resolve this.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95f7207e390a..31f7e1ec779e 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -411,8 +411,8 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.25.1


