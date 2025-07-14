Return-Path: <linux-watchdog+bounces-3851-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCEDB0365C
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 07:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA743A66E7
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 05:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BF32153E7;
	Mon, 14 Jul 2025 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qvSnWaCw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2C211A35
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472744; cv=none; b=FR1tu1N+Fm6h5jb0201bKz1gSr25H/pcaJ2ig2Z0EGvhoD4N4bl/INuUB58gOhpq28CP7GknwF6+FDewPCLQfFnQ6v896tTQbuYTybW+S9Fqu/fetEhot77IxAxTiSmICFQgn6WNEeImgRMXyDtmhhYTcpndJhZctLva7EVe17E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472744; c=relaxed/simple;
	bh=eA8fW0D4S9/fahe/LSdY6vP0wbZlz0Lx4LhA/cw+8XM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rVxSqSJ0FANloy8MAhwU/NqSxLYutLeU9S8CN59cF3BRhtg+jZAGeXhy06XTmi5ZAVG3B7/7JQRGf2oi0Eqw7G2zWj30kbiNHq6RQULyxOkqdQavPm0BfMvoB0c5LTnjq9v9Mt811xNbHKo18zP8p8tBLJKDRLXo3bppGCrmiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qvSnWaCw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250714055855epoutp03d053c861ebf60439c11a6cdbbdb93097~SCKrsNyUa1565215652epoutp03K
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:58:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250714055855epoutp03d053c861ebf60439c11a6cdbbdb93097~SCKrsNyUa1565215652epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472735;
	bh=DEE4uWjAAvqGbGNHuZIiAusKYEx36zda62ZjOAcwkGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvSnWaCw4mtPSN1I6zh82H/gfllGlf5eEwLhF0c+cOoi6vfsVoOK56aSD5oCz3k8W
	 4TsXspk5i4zMey6rYOd4oZ3FJo4Hl+QbLUoSB0N+Apq5BbJOHXU3vUv0K+KkPurNSC
	 /P3sx2C7Y/UxgC4JLYCAfmU1L9C1mlWHDC7Ah4Ds=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055854epcas2p2e7f656b05ffb32038de95175d9c4017f~SCKrQ0r0m1945019450epcas2p27;
	Mon, 14 Jul 2025 05:58:54 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bgWpk1994z6B9mH; Mon, 14 Jul
	2025 05:58:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9~SCKqPDzbx1936819368epcas2p1H;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055853epsmtip19fb52d10a7006a5d55c0744d4b862c49~SCKqJ1vbW0366003660epsmtip1M;
	Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
Date: Mon, 14 Jul 2025 14:54:36 +0900
Message-Id: <20250714055440.3138135-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac426..95f7207e390a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	if (count >= 0x10000) {
 		divisor = DIV_ROUND_UP(count, 0xffff);
 
-		if (divisor > 0x100) {
+		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
-- 
2.25.1


