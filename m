Return-Path: <linux-watchdog+bounces-4002-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB770B296FA
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 04:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672133A9470
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 02:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD3325487A;
	Mon, 18 Aug 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H6PLsc0k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E42522B6
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483880; cv=none; b=q/wlQWQpiuXBefdfdwWOsGdGYHoGhlNeYEKUvMHPRoK/RXHQXIpJHLLG/EmoQDtQu/reWVtUzhI1340DVKVWiq07IiahK0UdvMS6FEpCiPiUbvaq5362h2wkI6dmm0eO5RnoPofEUmfuyhrF5ijkpF4l99drEA4OiApraGKK9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483880; c=relaxed/simple;
	bh=l1zppUoGsgYQuvWfeE9ZII+mvExfI8uZ5tf9ENz9M9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=szsE1OLt30eDidNjR7qrL+y5y77LT+Oxd9ZKHStHAKPa0Iv/XRnXMWXxUNQBxS4UkgcPV3sCP6cO62Yap0etY/LvES/scLaQGgNGZGcFy6Dlttr6UHXubM1CzXHnkGg/XJu91FOpeiz7nMo2wboP569MTHqUSnprkzxCSwg2fl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=H6PLsc0k; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp020cb186dde5bb1bbdc05c0538683088f7~cu0iWqmE71805518055epoutp02y
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818022435epoutp020cb186dde5bb1bbdc05c0538683088f7~cu0iWqmE71805518055epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=iF7XGLKPcudkWLwpYz/z12ZVFINWFvDEkKGpP/Zh/5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6PLsc0k88J2COkoanK5Vft9WABSgOSO3zR0u4+q/N1NUI47saqrGEYR+0KDxyik1
	 t0KsP588+QQ15pN3yDaL5DOoQgAHjYbAOIC6DZ7BkmEe/kPxQqyAuYmtz4Gg7RxqlS
	 EQ2OTsaTh8cUOHFk9pTuP4w1CWOQxFlfQ0G7B4SI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p1aa372480dd5834f5b2f2e63737219b49~cu0h1Any60956809568epcas2p15;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c4xPG0fpfz2SSKh; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50~cu0gr7DFt3096330963epcas2p2y;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1b7f6a2586034e6291a0000e252656057~cu0glYO2z2174121741epsmtip1N;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 1/5] watchdog: s3c2410_wdt: Replace hardcoded values with
 macro definitions
Date: Mon, 18 Aug 2025 11:18:22 +0900
Message-Id: <20250818021826.623830-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50@epcas2p2.samsung.com>

Modify the code to utilize macro-defined values instead of hardcoded
values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
difficult to understand and reducing code readability.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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


