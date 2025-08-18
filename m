Return-Path: <linux-watchdog+bounces-4003-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3BB296F4
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 04:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D7A202BA2
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 02:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726442522B6;
	Mon, 18 Aug 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dHehWi6Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3D253358
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483880; cv=none; b=QJQWlII6rnXqLKSJLcTJ9mWyp5b2bLK+bW6CW/ozWE/lrnvwryCBxsIqavba1KNMjcuQFReLYmnWp5UgWoOUyECsbbKQ+eC28xU0srtYCtSxmhLgnuvOpYGdjp5yJK2YRhnpDXBEFgEUNXGiDeIvLcBwCRib90msufhGgeMpyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483880; c=relaxed/simple;
	bh=6JccX6rb/Pl5uPrlz/pFSYC+n7076GYlHeFGHkCmUKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Gr4ig4PxKH6+tJ1UUUR/QcjMf4cvdvx6TtUQsggB0KLYWeDHEUZSrTtwlYIdDXggkmG78h1aFkTtYoMQavE/46yA0CCEnXGhYxiCXYNN2qW3BHNrGfi2s3810RTlYAMWywJaKvzYdCqr4XiyllSxzg+Hl+ge6jogA55GyqjAxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dHehWi6Z; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp04b4e2cf32e4a45919cb4f458cecbcb9fd~cu0iR3qss2740027400epoutp04W
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818022435epoutp04b4e2cf32e4a45919cb4f458cecbcb9fd~cu0iR3qss2740027400epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=Gy16/RzPndx2WyvU5JaijoXqsjTfpeBr39YjjbSjy/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHehWi6ZCuJbWIzKCKNgzqfpn1hx9JCeP97HYRu6Jn+hLbn4TvbEiUJzLl0RdsPTF
	 Gv12+rWp2CFHqqYpW6sNiqquJfZmgAFzOToFd9kQ2TbnMlkIiWnKcy3qHShctJTn5W
	 WMOeubMWFX/Ed7t7zpxMVhcsPdPKDAX/gomry7KI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p4fd13107b3298d90fa381ff9498342688~cu0hzlEwe2945429454epcas2p4X;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c4xPG24nDz2SSKf; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c~cu0gxZS4m0148401484epcas2p3R;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip134777d3422bc84da61719ae40059d335~cu0gsjRKQ2020320203epsmtip1O;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Mon, 18 Aug 2025 11:18:23 +0900
Message-Id: <20250818021826.623830-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p3fc48febfa6729645af6ebd088937c80c@epcas2p3.samsung.com>

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
To resolve this issue, the order of calculations in the computation process
has been adjusted.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95f7207e390a..1e8cf0299713 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -27,6 +27,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
+#include <linux/math64.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -410,9 +411,14 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
+	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
+			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
+	u64 t_max = div64_ul(n_max, freq);
 
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


