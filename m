Return-Path: <linux-watchdog+bounces-3468-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C62AB6807
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 11:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028A9867BD8
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C271259CB1;
	Wed, 14 May 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N0Db7/Fo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97625D91C
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216424; cv=none; b=qN1SvztJ1iTvllB8JipZIWqwDEoCVeMfIOmS0tv4AKpOMHIxeARq5P3YokQsXcd/iweR1aCJ4WATwZkWLyR7FFyf0dvS4OywnUoh1O6pTALacy+nTJI1YhYEdv5QkYODYerv0XIl+P3gGU0OzjQmCx3s/hHplEk7zl/bGme7xoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216424; c=relaxed/simple;
	bh=qzfrVWIrtpfJTjmH7ep2gUq4Zq97d9cu9Umr2PFxAYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=N3+BCLsKCy5b8gU/mJNqbc9FP4cqnYMLvS+UtnOFwU/KZ/stwM5qWU0/3uOwHCCHzh62XkQl+G/m2UzjlGnWoylf6om/vGxVgq8C7z6fl7toej4dqItHiCYCSQQ0w3+5pNefkkbBdp9EJ3xy/nwlMZjKIZX31oUvigZDY+oDc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N0Db7/Fo; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514095333epoutp046cffdbf1219890741ab9e69b788508d9~-XBI3dSzK0360403604epoutp04F
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514095333epoutp046cffdbf1219890741ab9e69b788508d9~-XBI3dSzK0360403604epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216413;
	bh=rzfjBDdCV1bMbhaN4veuqL28+nSEvMmCnFpMP9vcanM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=N0Db7/Fo5XU7Fd0VgOAREVIIj/KC/Gz7Q60spdghuJ8DJ9HNc4VL1SKh73hkQjOBU
	 2YPF5/ZO1zGVCmgkYYltO0wTWL2iv7C5x3Du5V/rtRUq+scYXGijMP7dspBv+hubZL
	 MlHBnh/IIoS3DotgPKeLvl7Zk8kNjfUYoDscjpMI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250514095333epcas2p2e4f261863a747b91ce04e7400387a839~-XBIczive2406324063epcas2p2g;
	Wed, 14 May 2025 09:53:33 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zy7vc5CrJz2SSKm; Wed, 14 May
	2025 09:53:32 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483~-XBHdTRKJ3207832078epcas2p4W;
	Wed, 14 May 2025 09:53:32 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095332epsmtrp196f32a0b5e6edcf2b367aaf70c3297f4~-XBHcl-ma1996119961epsmtrp1K;
	Wed, 14 May 2025 09:53:32 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-04-6824681cc9d5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E6.C4.07818.C1864286; Wed, 14 May 2025 18:53:32 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095331epsmtip13fc246ce0f9b028881178be751c13600~-XBHO_1A23233232332epsmtip1S;
	Wed, 14 May 2025 09:53:31 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v2 0/5] Increase max timeout value of s3c2410 watchdog
Date: Wed, 14 May 2025 18:42:15 +0900
Message-Id: <20250514094220.1561378-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsWy7bCSnK5MhkqGwZ2zHBYP5m1jszh/fgO7
	xabH11gtLu+aw2Yx4/w+Josb6/axWzxZeIbJYsbik2wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBk9S04yFrzhrNj60LyBcRpHFyMnh4SA
	icSdN1vYuxi5OIQEdjNKHLrzjbmLkQMoISXx7pklRI2wxP2WI6wQNR8YJWbs/8cGkmAT0JGY
	/u82C4gtIhAncax9MzNIEbPATkaJlum/mUESwgJuEk83vmICsVkEVCWOnL8GZvMK2EosO9LH
	BLFBXmLmpe/sEHFBiZMzn4ANZQaKN2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OTDQsM81LL
	9YoTc4tL89L1kvNzNzGCA1hLYwfju29N+ocYmTgYDzFKcDArifBez1LOEOJNSaysSi3Kjy8q
	zUktPsQozcGiJM670jAiXUggPbEkNTs1tSC1CCbLxMEp1cCUI7CbM9rVMf3F00OB5xN47lz4
	rWsYtNbmq+f3hEtP/+0PvJCy2L6KPXTZx6LeNp3T/47+vi3YEJ7y7hGfZ35J6vPG1JunTz+K
	KD/gs1q/V1XnqIzFmuN6vJv2fRJZNVv0meX0ZakCbkdv9AtLPNhR4LLzcF+r5MLkjy/P73nH
	zDbz+hHdCY+fTXa3jNx8Ud/3tL7th9LPXgcv1/wuk5nsrXTDucjwjPc+gSXbFhQVcQQukDwq
	m7Vu7x1Lg98/db9we3zrv3e48v6hnFrhdytvpTrcrNztPc/+SFh3zM2ClP0N+1ovcBidObzn
	h5P/juk7J7Wf66qtc5yxY/Yit/W676TSPkVIck+6lHw/7T77ZCWW4oxEQy3mouJEAP5kI7DP
	AgAA
X-CMS-MailID: 20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483
References: <CGME20250514095332epcas2p4ab71a73ab68e55f0e5e34cd9c4c7b483@epcas2p4.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

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
2.40.1


