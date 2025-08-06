Return-Path: <linux-watchdog+bounces-3975-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED0B1C0C9
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 09:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 991DD4E2F75
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 07:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F61021773F;
	Wed,  6 Aug 2025 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="exB3lSrH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828A215075
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463635; cv=none; b=NgJLSKSF8lbOsLx7wrdaWzIjsKTtPlZmT4JTTZTNlqQ1Zc+ylIPBl0yCDEwrtBZiKdKE1mjEDvKsGmmpFMYbSzI6TR9189wYOKU63gq//6weHQ2IyMP9d3wYqSi5U4QmXDdl5MvR+UlM9LrbkVznBIEZIRS75aUAy3CgiNWwltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463635; c=relaxed/simple;
	bh=fK9VnHjeGeZ+I4QWMyuMXcWdy0VX33jmireJow/WyE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VHhlalmCQS3p3Mf0FtbWV6DfsliL427DgE5/O1/fYQ7lBir5nNdMFDmuYk6DJDHSRq0fDJQ+qMesvyHFBuK97vfkcV14Des7l3dmH0XEfVEtviyQo4nFNs3jCy1XaockJsFTKiF7vBEz9A10kma6uowaL+689lmQRZ7I0biIjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=exB3lSrH; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250806070031epoutp044b5c8f6f2ac55b970c24d3d8c0f9dfd7~ZG2CVdPA32708727087epoutp04J
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250806070031epoutp044b5c8f6f2ac55b970c24d3d8c0f9dfd7~ZG2CVdPA32708727087epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463631;
	bh=EHP1Kn4u1hbST9K3iiqbN2BkFflYyC4SeT8ll5DHOAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exB3lSrHqLcljETr1Sy15vVeoUV4kV38wn4la7SiiYOKKzjOL3gqI4NH+mcqs6SFc
	 v8Hx4TvgKvXpEwEh2SD0A41RfZ3SNIoQGkwefKAZyO9tuAijApYCZzjAp26I4kOo+Q
	 YRuqdDzbr9D5n4fhEmZoqlU8FnAl/Za6LLrzZF9k=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250806070030epcas2p42ba0d1ddacb08bccdc3e4f97ea317069~ZG2Bz_v9Y2835028350epcas2p4T;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bxh5B3x25z6B9mG; Wed,  6 Aug
	2025 07:00:30 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1~ZG2A32YOF0152301523epcas2p1n;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epsmtip298a6e310946bb155b77ddf18434180b6~ZG2AzuvxD2044420444epsmtip2e;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Wed,  6 Aug 2025 15:55:11 +0900
Message-Id: <20250806065514.3688485-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806065514.3688485-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1
References: <20250806065514.3688485-1-sw617.shin@samsung.com>
	<CGME20250806070029epcas2p1f764301b115b766f88b422b0dbdd68f1@epcas2p1.samsung.com>

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
To resolve this issue, the order of calculations in the computation process
has been adjusted.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95f7207e390a..0a4c0ab2a3d6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -27,6 +27,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
+#include <linux/math64.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -410,9 +411,13 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
+	//(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV = 0x8000
+	u64 t_max = div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	if (t_max > UINT_MAX)
+		t_max = UINT_MAX;
+
+	return t_max;
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.25.1


