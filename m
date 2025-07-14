Return-Path: <linux-watchdog+bounces-3850-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCEB03658
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 07:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30DA1721C6
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 05:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE783212B05;
	Mon, 14 Jul 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jrz6P2A5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4220C488
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472742; cv=none; b=ZSFgRoM5mdrHQQjPZAUPCkyxA0ch31/uzbgyGrRkBU+6lGaslI8ZI2XlAehwK6D8Cy7CjISozPXYPLdn4i+GjZYttfSpCc96eTxnRONkbCv9GSK2/puRE0FGrxqlhwY0yE2mjPd2OGhYgFXxm3m2TCGSaAWf2x2QzYBp2boTMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472742; c=relaxed/simple;
	bh=Eg/RWTxb/7NG+IbjZxqcxi+Flqg0G8yjpryGOtQeDLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=ODs+jLugjJonKHo7BEc6U5xNEM9N9B7GVwUhsK0Pmmz2ErP/Rt7Me3f2verZ2vpRNY997ecsNRx4OUe+5vSYwT75ihWNB03Vr9o55uq2Q4NvQd/Fzo4WXXJO6Erp4rsSTmaQaTRQDp5e/7UxDNd4yMptJAvcTxVg52ZRHigNr/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jrz6P2A5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250714055853epoutp0432944c245c1556653d8b71ebe7229acd~SCKqFFMul1599615996epoutp04Y
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:58:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250714055853epoutp0432944c245c1556653d8b71ebe7229acd~SCKqFFMul1599615996epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472733;
	bh=BJm1Eod+dAJKfRZuImiRIeCSBkJ0UHEbIO+BfLsJsvg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jrz6P2A5v12XpIflrsME7xZc7SmpALibCr3+kU/ncpUasHRXmpbpFnhzowYAmtzF1
	 z1fOyUZUN+weX2Gi3vXm+i9F7SMkJqtI1BKLhEQ/w2vGq90t0Zv+2WUY4Fh9DRK2Fu
	 /8/9piDduIdKSoR49UsFNLon9k+ffpHxi/aJnC/U=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055852epcas2p25ab44199be04da7bbeffdb5d6cb1bf4c~SCKo3tNoc1866318663epcas2p2H;
	Mon, 14 Jul 2025 05:58:52 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bgWpg4J9Sz6B9mD; Mon, 14 Jul
	2025 05:58:51 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a~SCKntcPgt1467314673epcas2p4H;
	Mon, 14 Jul 2025 05:58:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055850epsmtip1d5df253e02e7ef9da2740184fce1db22~SCKnqS9c10363003630epsmtip1l;
	Mon, 14 Jul 2025 05:58:50 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 0/5] Increase max timeout value of s3c2410
 watchdog
Date: Mon, 14 Jul 2025 14:54:35 +0900
Message-Id: <20250714055440.3138135-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a
References: <CGME20250714055850epcas2p454265f0cc65a80e80e536a4e88819e2a@epcas2p4.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

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

Sangwook Shin (5):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_MAXCNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
2.25.1


