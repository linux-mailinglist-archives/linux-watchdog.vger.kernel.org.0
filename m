Return-Path: <linux-watchdog+bounces-3463-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBCAB507E
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 11:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F8819E1D2E
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE923C4F7;
	Tue, 13 May 2025 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a8dZUktS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAF23814A
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130212; cv=none; b=KMBLIen/Lmt59cjMb7veXfYplmpUVkzkU2I/0t0ufp1QCM6EkZnTRtv+Z1Jv0/IQr5QLEh1LYyShhKEWp7yCNRQARMNwaa9lhd4MpATXt1w39MECoMXsquF3IgUILSOdAzsvBvzU0KnRxFJpTs6lTvHxpeZR6wRbxgKS0QyZwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130212; c=relaxed/simple;
	bh=Sr1G6fLU6BFMDFoLZiB3jJuOclK9d7Syp1mQy5PAwpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Ttkc8gQKaRmbUXJ6cGwm9Oehq+ETdcuoZGE2xEB8zSaISixfHYrBHA0D30TcTy5CE4WHbsVLWgtFXimWmVs6msNzpNlaMYP9MCt88GIploWHcXuOWyBoEJNs7dVTRfTNdaJFwhp3hkYJscfv6EOuVlnpkiJweURYsC2EwBexm/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a8dZUktS; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250513095648epoutp038eef9f6fb890ba00d4573914385c75c1~-Darw1Ek41806318063epoutp03G
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:56:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250513095648epoutp038eef9f6fb890ba00d4573914385c75c1~-Darw1Ek41806318063epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130208;
	bh=vL0cr7fBrUc/KWtU42iEj3Tt+KU0GKzlaCQEW9YfGIQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=a8dZUktSSnJm22q/vzFl17YWK5rjaO/OOZkmKCaRaIbLdSyLazAO/DfI97ShxvhDF
	 BIl47+knvAljmZDGGaQDjeG2qJzQxDJ+j6k7qyz9iVEFrOEJHPGsA9V8VofaVI9e+s
	 2LEGX/qvcslkXTnJPxu8bFYJJeH742r8qUoRwv3o=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250513095647epcas2p1281a6e30d6ea62b48b23b2638f9f0061~-DarI2ian1927019270epcas2p10;
	Tue, 13 May 2025 09:56:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZxX1q22yNz6B9m7; Tue, 13 May
	2025 09:56:47 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb~-DaqASh-U1927019270epcas2p1z;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250513095646epsmtrp11d4de783d27dcb344adb08f35f42ee01~-Dap-PMHc1976619766epsmtrp1F;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-1d-6823175e555e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.DD.08766.E5713286; Tue, 13 May 2025 18:56:46 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095646epsmtip24254bfc5695cd06dc6df339e29d9d31e~-Daps4WzU2427724277epsmtip2W;
	Tue, 13 May 2025 09:56:46 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH 0/3] Increase max timeout value of s3c2410 watchdog
Date: Tue, 13 May 2025 18:47:08 +0900
Message-Id: <20250513094711.2691059-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSvG6cuHKGQdN8XosH87axWZw/v4Hd
	YtPja6wWl3fNYbOYcX4fk8WNdfvYLZ4sPMNkMWPxSTaLxy//MTtwemxa1cnmsXLNGlaPzUvq
	PXZ+b2D36NuyitHj8ya5ALYoLpuU1JzMstQifbsErox5s88xFixhrdj6ciFLA+Mmli5GTg4J
	AROJd83XgWwuDiGB3YwSJ349ZO1i5ABKSEm8e2YJUSMscb/lCCtEzQdGidbHp9hAEmwCOhLT
	/90GGyQiECdxrH0zM0gRs8BORomW6b+ZQRLCAs4SzQc3sYLYLAKqEhOuPmQEWcArYCvxd5oP
	xAJ5iZmXvrOD2LwCghInZz4Bm8kMFG/eOpt5AiPfLCSpWUhSCxiZVjFKphYU56bnFhsWGOal
	lusVJ+YWl+al6yXn525iBAewluYOxu2rPugdYmTiYDzEKMHBrCTC27hdMUOINyWxsiq1KD++
	qDQntfgQozQHi5I4r/iL3hQhgfTEktTs1NSC1CKYLBMHp1QD0wZ5Tqevm/ZMX+55Y8MPxven
	Dt7z1ApWXxmd+4RtoQWL1n2/jImTZflOiPZP0UkuzI1ltTHnFdTuuc97fXLVoVk99X7bGE7Y
	RiUbhOSsCH1fk7FCYqnTilqPc3drs5nSHl8NE2413fHD3ZZn6cxf5xzOr7CVChUxl+EwCl3r
	by7z0PWKoeXMKs+3sTt3dy4pedFVwLsrZsVrYeZd37mNahfcLVd42/Jew0440FZsQVLnidRn
	PxZ79bFNZ98k0yw7qZ8tVea34uINr7T7udlNVGQEj33eF+tUzCQmMC001q9AtuZav/e7VYzf
	++UNOd/cmLiOeynz7pBStg1uVfrn5p/44NQrN0mwxOekzT0lluKMREMt5qLiRACvEETczwIA
	AA==
X-CMS-MailID: 20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb
References: <CGME20250513095646epcas2p189a3681a52ba1ecda3452fd0ae84bffb@epcas2p1.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

Sangwook Shin (3):
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_MAXCNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 40 ++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

-- 
2.40.1


