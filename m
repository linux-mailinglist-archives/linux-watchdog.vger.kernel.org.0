Return-Path: <linux-watchdog+bounces-3908-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4AB10318
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 10:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A1AF7BC067
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7334E274FCD;
	Thu, 24 Jul 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IJ/QZ3xB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BC274FCE
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344824; cv=none; b=ZX8jsGBMKjXrrdfbHSZZb3N4rM1eK30iRO02fnmCx5Nn3JM1n+0LA3IqBJH4gEG24GJbsqY2f+OIzaUVd9CwuUovqDH4hC1wQzx9MH/OrEyRTQaPb4zWMpD6AhBD32VaFgaQuZ1xEiTZuNzPHAy4xa1ZvwuH04YdQpifwnJ/21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344824; c=relaxed/simple;
	bh=U7tIo/+hPh5wsSDVa2lALrOfs/J4zuc77cFA4O2QvIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=btPQvOWoq+IOoyh/QMSp4Gw1SYZDh5NwUOQLRGUPy0+cBjo0gz4XTPYAcRCVXcNtFPEC274z8tjs/trJ0mFJZwmMh9RjmQKb2VrO8+zMT9B9NuJsBdVT0KMEAZaA9uK+MAymuoHPE1Mn65U9FbyTb0a9/oT1/m68TEdTIoEd33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IJ/QZ3xB; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250724081338epoutp04f561d2f6aab609332c3f3d200ac95107~VIdLAGnxz1531115311epoutp04j
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250724081338epoutp04f561d2f6aab609332c3f3d200ac95107~VIdLAGnxz1531115311epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=ohWkVViPltngJsHO7QO3hWauv6Xr0PKpOtjgZtEomck=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IJ/QZ3xBh860Y+YV68K2mGFTVfAPqPNyQKBqTeeZ7ReOwu9Hu2I6xY/wDbY6tMFZV
	 Eeuniks0YSdlKMOHkD2++iWfjlDyCF4Td+41Gwb917VtI2LeYNhdURhFxqgwHBOvi2
	 INNcV2CRufee+EAt3eNM6LK980px1U12TJfSqW5k=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p374500980da4a71c430cf64110e52ddf6~VIdKLs-yC1011010110epcas2p3L;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bnkKY2kssz3hhT7; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb~VIdI9bMNu0887108871epcas2p3I;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip13c1b034ffc2b18f9512c58cb6a28178d~VIdI5pJXI1874118741epsmtip1J;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 0/4] Increase max timeout value of s3c2410 watchdog
Date: Thu, 24 Jul 2025 17:08:50 +0900
Message-Id: <20250724080854.3866566-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb
References: <CGME20250724081336epcas2p30ba9afd1e78d9bbb60f44d24d1cf0acb@epcas2p3.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

V3->V4:
  - Merge patches [v3 3/5] and [v3 4/5] into one so that Quirk and its consumer
    are part of the same patch.
  - Link to v3:
    https://lore.kernel.org/linux-watchdog/20250714055440.3138135-1-sw617.shin@samsung.com/
    https://lore.kernel.org/linux-watchdog/20250515075350.3368635-1-sw617.shin@samsung.com/

V2->V3:
  - Correct the incorrect tag information.
  - Link to v2:
    https://lore.kernel.org/linux-watchdog/20250514094220.1561378-1-sw617.shin@samsung.com/

V1->V2:
  - Modify the max_timeout calculation considering overflow
  - Separate tha max_timeout calculation into a separate patch
  - Add max_cnt in struct s3c2410_wdt
  - Set max_cnt once in probe function
  - Add patch that uses S3C2410_WTCON_PRESCALE_MAX instead of hardcoded one
  - Remove unnecessary inner parentheses
  - Link to v1:
    https://lore.kernel.org/linux-watchdog/20250513094711.2691059-1-sw617.shin@samsung.com/

Sangwook Shin (4):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.25.1


