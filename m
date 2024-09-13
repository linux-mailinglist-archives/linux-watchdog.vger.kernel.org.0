Return-Path: <linux-watchdog+bounces-1884-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A2977A81
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 10:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116081F26F31
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 08:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3984F1BD4F6;
	Fri, 13 Sep 2024 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GuWNpS6c"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F413D89D
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214633; cv=none; b=Y/e6DpAvRfuSyCGMOkBJwVxx+mc/TVld857IQ2yjW3B4k89mcc52uRhXDISsT4vMSiQ3YK1jFrBfC1fQ7PRqU6IioJiR7TmEOk0FzXr9gDiIh/ybc7RAaVO+0CMmEqUNF9MsuOSgpp0MA1hZ2Qbjelj3OvZGyFyrq5bxfDPbSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214633; c=relaxed/simple;
	bh=lpgK5gbS6/9SMqTCmS2Z5Slaqd40ZHLdXqf6k8Qr0xY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=LTC6Pq2DvAe6PIO1S1vTd7HdJY0S6t5Ahp5i22SEO4e8mSdzp3hiV/mEbqM3Teai45yPMm55yzADoPukMBybNHj6b5j3zv3NFMdxmOsriImAZZgn3dhpDqYSYoFxJ7eLzUo/xLTm5WDg9+KwD13OIu61mR4MFT3dIDwGgJaoKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GuWNpS6c; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240913080348epoutp02d8ce435a0cdbef674d43ab02fec12816~0vw8YTBPV1230612306epoutp027
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240913080348epoutp02d8ce435a0cdbef674d43ab02fec12816~0vw8YTBPV1230612306epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726214628;
	bh=JSVm/FcnnPcqmoGUM1pLwmPTfMWW5QlF099INg66XHE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GuWNpS6cQdEp0/icMX9fkrfMRM3a/SWwpH/1sXuXIrZgEH5CvaWm7BEZtUOVSZkPk
	 IkGaTBByno6DhP3rEAKWTodchD4Frk3lzfKmxSw8fYGSQsslzNn3/gZreXhmPDGzGp
	 vZM3K0Xtv//tBGuSe5TFzr/ZQkdjzKS3EtszXQas=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240913080347epcas2p4b7e2df6a05e3c9f2028ea0812c5574cb~0vw7qMaBK1978819788epcas2p4T;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4X4mz74XKhz4x9Pp; Fri, 13 Sep
	2024 08:03:47 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	CA.B0.10012.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epcas2p222e2536e026f90bb12c18e640fd05e8e~0vw66cSyK1165011650epcas2p2O;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240913080347epsmtrp13f7d4dea2eafd447bfd2693d711ba8a4~0vw65tuyZ1626316263epsmtrp1C;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
X-AuditID: b6c32a47-c43ff7000000271c-1b-66e3f1e37e2d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	2A.6B.19367.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240913080346epsmtip2a092e2e8b46072e153f1ba0cf7865e99~0vw6qeZ1F0654506545epsmtip2e;
	Fri, 13 Sep 2024 08:03:46 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH 0/3] support watchdog for exynosautov920
Date: Fri, 13 Sep 2024 17:03:22 +0900
Message-ID: <20240913080325.3676181-1-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmqe7jj4/TDJ7uU7R4MG8bm8WaveeY
	LOYfOcdq8XLWPTaLTY+vsVpc3jWHzWLG+X1MFjfW7WO3eLLwDJPF/z072C0mLT7PZPH45T9m
	Bx6PTas62TxWrlnD6rF5Sb3Hzu8N7B59W1YxenzeJBfAFpVtk5GamJJapJCal5yfkpmXbqvk
	HRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0o5JCWWJOKVAoILG4WEnfzqYov7QkVSEj
	v7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAhO+Pz/7nMBXdYK3ZMv8XcwHiBpYuR
	k0NCwETi9J5drF2MXBxCAjsYJV5vns8O4XxilPjVcZQZzrn8cTMTTMuOjj1g7UICOxkl5nws
	gCj6yCjR+HQDM0iCTUBLYtvhV0wgCRGB14wSTb3vwEYxC5xnlDh0qAmsXVjAQuLrql52EJtF
	QFVifssFRhCbV8BOovfPHEaIdfIS1x8fZYKIC0qcnPkErJcZKN68dTYzRM1HdokZx+whbBeJ
	XeceQZ0qLPHq+BZ2CFtK4mV/G5SdL7Fy5QmomhqJe227oKFhL7HozE+gGg6g+ZoS63fpg5gS
	AsoSR25BbeWT6Dj8lx0izCvR0SYEYapKTF8WADFDWmLijLVsELaHxOOp56FBFSux6tEqtgmM
	8rOQvDILySuzENYuYGRexSiWWlCcm55abFRgDI/T5PzcTYzgVKrlvoNxxtsPeocYmTgYDzFK
	cDArifBOYnuUJsSbklhZlVqUH19UmpNafIjRFBi4E5mlRJPzgck8ryTe0MTSwMTMzNDcyNTA
	XEmc917r3BQhgfTEktTs1NSC1CKYPiYOTqkGJjb1fbYVGzvMk04flV3t+F/UVai66D3Dn6Nt
	Uvlz0h7+1EuSttyhKv25uiC5YFr6skOz9iuYGOoyHl2auXJitcYX4dmXb3N+7+7Iva8dwvTt
	xnzXbcwX+/afNr60hPnxlNMiv33fGU6WmfhrtlVW/0KPu5v6GXbLPHRwv7iH843nMdZmlv/G
	lvvPiCQJ7VgoKmV5+7cOV37e3SkMd1R85afM2r4orHHlRj+LD+ohzj5zla4cMLapqI9c16sm
	Xx7rYP4n1vbU+QABo1Q9s5r3QTHfl2ecaI1wC1dTWZAUM+vXuo+sBflL4pxWfrybkLcpavtO
	/jjxf1XTdIJd89wfrj8VeGPeQ9WsNMMf5+NllFiKMxINtZiLihMBOeKXgy4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsWy7bCSvO7jj4/TDH7dZLZ4MG8bm8WaveeY
	LOYfOcdq8XLWPTaLTY+vsVpc3jWHzWLG+X1MFjfW7WO3eLLwDJPF/z072C0mLT7PZPH45T9m
	Bx6PTas62TxWrlnD6rF5Sb3Hzu8N7B59W1YxenzeJBfAFsVlk5Kak1mWWqRvl8CV8fn/XOaC
	O6wVO6bfYm5gvMDSxcjJISFgIrGjYw+QzcUhJLCdUWLL+Q3sEAlpiSO/X7BB2MIS91uOsILY
	QgLvGSWWrwWrYRPQkth2+BUTSLMISPzsl1+MIA6zwFVGiR+L3oFVCQtYSHxd1QtmswioSsxv
	ucAIYvMK2En0/pnDCLFBXuL646NMEHFBiZMzn4CdxwwUb946m3kCI98sJKlZSFILGJlWMYqm
	FhTnpucmFxjqFSfmFpfmpesl5+duYgSHtlbQDsZl6//qHWJk4mA8xCjBwawkwjuJ7VGaEG9K
	YmVValF+fFFpTmrxIUZpDhYlcV7lnM4UIYH0xJLU7NTUgtQimCwTB6dUA1Nh2SdF+dfRhywD
	GbdxhrFGnAvhtXjL+IOD0bZQ2/rzJL1zYXGpzj6zvO5yCzx4+9vf92lU2+ZDM/SjwnLc1M0S
	NhZV8b1Wqup6tGXp/fTkw/VOIiWSW2JfxcxzOf7EIsvTrPq9w3WRvyvkD1kKZh1lWPHoQoxP
	9x3vs7v//98QoTF9NcsV7VmPtWPCDkQ+dObVVXFckOjet7CEleli4I3JfmzfeLLFate2/hN9
	tDyL+d3DOR1WMvVC++LSBbTOXLOpCz9h2vC6bV2e334x99D+3o2rAvaFdF0z2LNvb/sUhmq2
	2fYaa1QEj4nM0M05J39nyisuvktNBW2x2zbo+NxhFnt656KaBmuQwZTlSizFGYmGWsxFxYkA
	d/CDgNwCAAA=
X-CMS-MailID: 20240913080347epcas2p222e2536e026f90bb12c18e640fd05e8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p222e2536e026f90bb12c18e640fd05e8e
References: <CGME20240913080347epcas2p222e2536e026f90bb12c18e640fd05e8e@epcas2p2.samsung.com>

Add support for the ExynosAutoV920 SoC. Basically this is almost
similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
each cluster but some CPU configuration are quite different.
Therefore device tree, compatibles and drvdata should be added.

Byoungtae Cho (3):
  dt-bindings: watchdog: Document ExynosAutoV920 watchdog bindings
  watchdog: s3c2410_wdt: add support for exynosautov920 SoC
  arm64: dts: exynosautov920: add watchdog DT node

 .../bindings/watchdog/samsung-wdt.yaml        |  3 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 ++++++++++
 drivers/watchdog/s3c2410_wdt.c                | 37 ++++++++++++++++++-
 3 files changed, 59 insertions(+), 1 deletion(-)

-- 
2.46.0


