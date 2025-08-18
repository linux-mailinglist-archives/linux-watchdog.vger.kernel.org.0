Return-Path: <linux-watchdog+bounces-4001-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2BB296F3
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 04:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3037202A8B
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 02:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C3E254849;
	Mon, 18 Aug 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P3DLlH+Q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD0253356
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483880; cv=none; b=ghgnQ/AMvLsklQAwMWNEIP6TZpU4wAp2P3ImEmAMdH7qXnG5wXI0iwEk6du28A9sUhebu3RL66GxrIP8Zx82FC9nCiB0JUSV6NRBgLfcH0PL1ba59IzARj0eCHIVv83G3B7WpQNf/dr2H2qevuoXohrwKtc+pDlJo/MB+DJ/UAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483880; c=relaxed/simple;
	bh=IVidwSACUdW3iWcaqBV11py1Km7GjirKrhYqgLTxBWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=fg0rwLPc59Ws2RF+gRVcwoQ9FRNJ0CkU27EN9yot5FAV+YfvASx12WUyUG+Ql10dKyC+TFz0+lRoSey6TOlMy37nJWLfwspbGymhaFq7Ryx8ayRwJhDFl7eL6n9Nles6Roi1zDbiGF8BgILrJtBJ7VrlCnnFeq9yNSQM7TKDiJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=P3DLlH+Q; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp04a6a756e43f105b341c5c8a25d5c8e7f0~cu0iZSyZw2871528715epoutp04q
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818022435epoutp04a6a756e43f105b341c5c8a25d5c8e7f0~cu0iZSyZw2871528715epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=ueluXiD+6F0xoO+M9xYzmVHY/W8ImB599hf7Mt0Mbh4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=P3DLlH+Q1sP7yBw4mT4OKg0bDjUFGggPh2EOESpv5zck2SWI7LrIdEUBxU47KG+I/
	 mjAHH1RD44qOm8/UUhoLbgU84l8ltKkGbxrnC5B+y5IaxioKALZ4AefNyo055bvG2V
	 KS7Iy3CD57LshI/3eqlpEuGd8aonH+/A9MRc6+cg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p411816927055f844a9fc2782503e85f38~cu0h3_Ts72945329453epcas2p4S;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c4xPG0PP8z6B9mH; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53~cu0gkyZ8j0507805078epcas2p3e;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip171af2b2b971b67eb1628c28c1b3d28e9~cu0ggapY01854218542epsmtip1d;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 0/5] Increase max timeout value of s3c2410 watchdog
Date: Mon, 18 Aug 2025 11:18:21 +0900
Message-Id: <20250818021826.623830-1-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53
References: <CGME20250818022433epcas2p37fe2cdc20b32b23ee894ceb636717a53@epcas2p3.samsung.com>

The ExynosAutoV9 and ExynosAutoV920 SoCs have a 32-bit counter register,
but due to code constraints, only 16-bit values could be used.
This series enables these SoCs to use the 32-bit counter.
Additionally, it addresses the issue where the ExynosAutoV9 SoC supports
the DBGACK bit but it was not set.

V5->V6:
  - Replace hard-coded 0x8000 with calculated value.
  - Link to v5:
    https://lore.kernel.org/linux-watchdog/20250806065514.3688485-1-sw617.shin@samsung.com/

V4->V5:
  - Update s3c2410wdt_max_timeout with Sam Protsenko and Guenter Roeck's sugestion.
  - Break [v4 3/4] into two [v5 3/5] and [v5 4/5].
  - Rename S3C2410_WTCNT_MAXCNT to S3C2410_WTCNT_MAXCNT_16.
  - Rename QUIRK_HAS_32BIT_MAXCNT to QUIRK_HAS_32BIT_CNT.
  - Minor Typographical Errors and Style Adjustments.
  - Link to v4:
    https://lore.kernel.org/linux-watchdog/20250724080854.3866566-1-sw617.shin@samsung.com/

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

Sangwook Shin (5):
  watchdog: s3c2410_wdt: Replace hardcoded values with macro definitions
  watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
  watchdog: s3c2410_wdt: Increase max timeout value of watchdog
  watchdog: s3c2410_wdt: exynosautov920: Enable QUIRK_HAS_32BIT_CNT
  watchdog: s3c2410_wdt: exynosautov9: Enable supported features

 drivers/watchdog/s3c2410_wdt.c | 46 ++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

-- 
2.25.1


