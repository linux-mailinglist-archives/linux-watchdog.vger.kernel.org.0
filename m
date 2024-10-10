Return-Path: <linux-watchdog+bounces-2164-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD35F9984B8
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 13:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FC528127E
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E151BDAA7;
	Thu, 10 Oct 2024 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aM5GQir3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1733CD2
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559121; cv=none; b=J1ZvT68jesPHzyI36dOMyz2K/h+4fMmQ5+z4+f710oPJpeLeXAel96HWSSR9oZE9ZbvulrZ0b/e6nVtpYU0hUXdIwshMCsU/sd0Hhy+BU04teTwUetzvwu6u7FiytFm/IRzWQRsuAzdSg2qxWAqrTci3jLBBeVG+DXOaOmqZfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559121; c=relaxed/simple;
	bh=Zc926r4ALPVfipCEL0nsTaRtvIld/QQvT7k+cbNSDho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=iGugrdCsbsHNjhT0w5ildE3NF0/pAz3MpXu8+SSpNrx6jZ6STe6rXEpSRgfjwoVm18ogAO3B1Bp8ULpIGHRRxBsO88JuT1AROd9Ss1PUoh7cBTNYUPwhL5dbGWk2w4Ui96o6RwXi+y5fuIlx2K9hbXCKjAWN96V5ZaH0G7M7x7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aM5GQir3; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241010111837epoutp026531e886987a0d2416159aa7bc8e0ca4~9E1vt9qeK2179821798epoutp02r
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241010111837epoutp026531e886987a0d2416159aa7bc8e0ca4~9E1vt9qeK2179821798epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728559117;
	bh=XW5I0qQ4mXeBZjDt6k5n6eX/hNh2dFhfU+kpEj7ZIXA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=aM5GQir3PlP3dREzQ661b13CS6D1ziHajpI42QWbZI5Ufk6p6DDEv7naMbWcReoUk
	 jdedBVH7yGbGOYgcAmYhlNgWp0r3xRq2sVgR3DZJRP+ygaRBpSW/rihW1U6q/4Uiws
	 b3/4M+CeK2Sl3R1glC/+iK94yMqsRRhpX4rGB9Fk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241010111836epcas2p18c45b3e0353da13abafd54838e79313b~9E1vBUDzv2326923269epcas2p1F;
	Thu, 10 Oct 2024 11:18:36 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XPS1S3GCgz4x9Pp; Thu, 10 Oct
	2024 11:18:36 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	25.6A.09770.C08B7076; Thu, 10 Oct 2024 20:18:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241010111835epcas2p298d37f8b2ce4769b33a56c276c4f9d1f~9E1t4_obr0738407384epcas2p2b;
	Thu, 10 Oct 2024 11:18:35 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010111835epsmtrp1f2499d59a8dbe483b63a51f2d89d495f~9E1t4DnoW3121631216epsmtrp1R;
	Thu, 10 Oct 2024 11:18:35 +0000 (GMT)
X-AuditID: b6c32a46-da9ff7000000262a-c5-6707b80c0b8c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.FE.07371.B08B7076; Thu, 10 Oct 2024 20:18:35 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111835epsmtip1a488eb6ae7e94d2e2dfc967381e0b84e~9E1tpO3oC0906509065epsmtip1A;
	Thu, 10 Oct 2024 11:18:35 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v2 0/3] support watchdog for exynosautov920
Date: Thu, 10 Oct 2024 20:18:04 +0900
Message-ID: <20241010111807.3635504-1-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmhS7PDvZ0gwV3xC0ezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRWXbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIznj37wdzwWL2iu5vS5gaGF+wdjFy
	ckgImEhs7LzK1sXIxSEksINR4vqFTVDOJ0aJOUv7mEGqhAS+ATlz7WE6ehY8YoGI72WUWPtc
	FaLhI6NEy7StTCAJNgEtiW2HXzGBJEQEXjNKNPW+YwZxmAXOM0ocOtQE1M7BISxgLfHsoQhI
	A4uAqsSajR/YQWxeATuJI6vPMUJsk5e4/vgoE0RcUOLkzCdgm5mB4s1bZ4PNlBD4yy5xcG4v
	C0SDi8T3TWehmoUlXh3fwg5hS0m87G+DsvMlVq48wQRh10jca9sF1WsvsejMT3aQ25gFNCXW
	79IHMSUElCWO3IJayyfRcfgvO0SYV6KjTQjCVJWYviwAYoa0xMQZa9kgbA+Jh/daGCFBFSsx
	4cNHpgmM8rOQ/DILyS+zENYuYGRexSiWWlCcm55abFRgBI/S5PzcTYzgRKrltoNxytsPeocY
	mTgYDzFKcDArifDqLmRNF+JNSaysSi3Kjy8qzUktPsRoCgzdicxSosn5wFSeVxJvaGJpYGJm
	ZmhuZGpgriTOe691boqQQHpiSWp2ampBahFMHxMHp1QDk/p5rrht1ianJlY9uzPj0/eEZJvV
	lgs/iayy5VRT0wpakJC7Xn3t5CfRDQt2hWaVb2CdyNGfNudufvgW3c0yd+/NXDyvM0tl9e34
	oBoTw2suh0+f0koKzU3kmqNyQehWl+YvfTH+I+sq57C2nokXmqN3/bVfg2b3XOm7jB/89vzS
	vd3BdYbRVDX3oOyqwLknVB6fvBaZ+Lh50o0ejukJDUUbsj4JLDx+Yb3D/etxnxkPu31JVDyg
	c1054umX3auz3c4c3Oi3wrCtd82rF51bn91bYxvwJ/sp65XDnkvEfl+cYVgfOXmaxom4uhB9
	T4lv69uy2ycfmLG85PacLU0vezdElHlPyIlP3rHt3AcpoXYlluKMREMt5qLiRACizyr/LQQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSnC73DvZ0g2cnZSwezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRXHZpKTmZJalFunbJXBlvPv3g7lg
	MXtF97clTA2ML1i7GDk5JARMJHoWPGIBsYUEdjNKrDzlABGXljjy+wUbhC0scb/lCFA9F1DN
	e0aJR3tOgSXYBLQkth1+xQSSEAFJnP3yixHEYRa4yijxY9E79i5GDg5hAWuJZw9FQBpYBFQl
	1mz8wA5i8wrYSRxZfY4RYoO8xPXHR5kg4oISJ2c+AbuIGSjevHU28wRGvllIUrOQpBYwMq1i
	lEwtKM5Nz002LDDMSy3XK07MLS7NS9dLzs/dxAgOcC2NHYz35v/TO8TIxMF4iFGCg1lJhFd3
	IWu6EG9KYmVValF+fFFpTmrxIUZpDhYlcV7DGbNThATSE0tSs1NTC1KLYLJMHJxSDUwr331Y
	181ZVW83WUdtnqrrP63OvW8+/LH4tCHYsevWE8dpdR/uyMTuf2tV1qcaEf7m8g4vu71LDpcG
	PDVMXSQcwzxtf8n/63XPFdk+7pDNNa54H1P+r/br7isfyza+y7TdJ/jc6VioTbiFf5X+iv9V
	GU9zElTE5zt8favdznzyD4ONyILnMS6ZNlM3bK3Oadv8/31UwzsFC6saq6Pzdk6e+eNJZ8/5
	6VaRE0N3RJ6bz/Be//SqHYfrpjg5drDFvT9yTuSwg0/J3gyBE6bRif9uTNsyxzzUcv67520P
	7XdoLV7z0sr5bfBa8WdVl83ZNxT7vtvY9zsp7WibokZxhCTj86pDM+tfcDrnlX78y/xGiaU4
	I9FQi7moOBEAOv/iDd8CAAA=
X-CMS-MailID: 20241010111835epcas2p298d37f8b2ce4769b33a56c276c4f9d1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241010111835epcas2p298d37f8b2ce4769b33a56c276c4f9d1f
References: <CGME20241010111835epcas2p298d37f8b2ce4769b33a56c276c4f9d1f@epcas2p2.samsung.com>

Add support for the ExynosAutoV920 SoC. Basically this is almost
similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
each cluster but some CPU configuration are quite different.
Therefore device tree, compatibles and drvdata should be added.

---
Changes in v2:
- Add a space before }
- Fix worng variant condition (cl1 -> cl0)
- Move the location declaring watchdog node
  to the correct location that fits the DTS coding rules
---

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


