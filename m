Return-Path: <linux-watchdog+bounces-2244-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7819A5A82
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 08:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9C8CB216FD
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320521CFED1;
	Mon, 21 Oct 2024 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NxrwEmQw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7811CF5C8
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492784; cv=none; b=Ych1jUdsviEQtMaUg7InYwNhIkYrmaoOiSymyZoTIX75L7EfRbZS7CrCSZuyap4LiMbz0qJrCL85W9/gLyh/VAl0hlq0VhesGaT1lonCxTvDCjzizIQ8zqQZ52gnFSKXLY63HGzF5Nx/wSorfg3KDgk8k4v8lCTAkTg0MuJL3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492784; c=relaxed/simple;
	bh=ajbFbHHpOVPA0dp0NNtEh0muAPuQegpimc6yE2wDQAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=DDtl6NEmmmIgQ9qO8YRSrI/pVHKAwDt3Kr0nALiH0NChBtRBLKhJQ7Y4jJXscFHwa1U9c1GGtagmrZ4HX9VA4yrgnUXWQeCQX4QrkuNi4KH63JJzuuRHzst9joxb2Jur5mO/JnGChNCeXKcC0Ruqu5JowbvYNSWyIebORrz7gTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NxrwEmQw; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241021063939epoutp02e9dd5f7e97c9bf864e8c60dc5431369f~AZIUK7U0x1881718817epoutp02f
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241021063939epoutp02e9dd5f7e97c9bf864e8c60dc5431369f~AZIUK7U0x1881718817epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729492779;
	bh=eEEtOXJJjAb7bF1Fe2H3d/IPXJDpaQqOWy/rzHRxLps=;
	h=From:To:Cc:Subject:Date:References:From;
	b=NxrwEmQw91MlUH6Yw64KkV1CfYgIZflzqgmmVs3Aah6tShKvYff5RRJeVt/11jmjl
	 xIPMsEgs5CuZ1JBiE+36pfF61iUVAP/x49EdOobO3ClKS1u6/AdfCQZ7csU5VQehya
	 QVjylwNfyuAHbBvP2bShuu57/iTroo+YcJDye7jE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241021063938epcas2p2706a5f24bcfbfa4c18d07a9b40934978~AZITneCru2063720637epcas2p27;
	Mon, 21 Oct 2024 06:39:38 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XX5JV3XCmz4x9QK; Mon, 21 Oct
	2024 06:39:38 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	DB.57.09770.A27F5176; Mon, 21 Oct 2024 15:39:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epcas2p40b368212fc236cd916492f0ed342671d~AZISrCiM72426824268epcas2p4L;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241021063937epsmtrp127c78473dd22f56aac772be287e4692e~AZISqAur91158911589epsmtrp1R;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
X-AuditID: b6c32a46-da9ff7000000262a-0e-6715f72ac51d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	83.F8.08227.927F5176; Mon, 21 Oct 2024 15:39:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epsmtip24e9cf6147b28f521849ef59a6471e284~AZISdGEPM1924819248epsmtip2f;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v3 0/3] support watchdog for exynosautov920
Date: Mon, 21 Oct 2024 15:39:00 +0900
Message-ID: <20241021063903.793166-1-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmua7Wd9F0gzUn+CwezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRWXbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzjjz+j9jwS32irNtN5gbGCezdTFy
	ckgImEis6P7N1MXIxSEksINR4uPvw6wQzidGic67x9khnG+MElfnnmOGadm0uoMZIrGXUeJL
	4wI2COcjo8TvPa+ZQKrYBLQkth1+BTZYROA1o0RT7zuwFmaB84wShw41sXQxcnAIC1hLrF0R
	C9LAIqAqMe/jRLBmXgFbidVXP0NdKC9x/s1/Noi4oMTJmU9YQGxmoHjz1tlgMyUEfrJLNP65
	BXWfi8TpN8vYIWxhiVfHt0DZUhIv+9ug7HyJlStPMEHYNRL32naxQNj2EovO/GQHuY1ZQFNi
	/S59EFNCQFniyC2otXwSHYf/skOEeSU62oQgTFWJ6csCIGZIS0ycsRbqeA+Jo7NegNlCArES
	p6ZvZp7AKD8LyS+zkPwyC2HtAkbmVYxiqQXFuempxUYFRvBITc7P3cQITqZabjsYp7z9oHeI
	kYmD8RCjBAezkgivUolouhBvSmJlVWpRfnxRaU5q8SFGU2DoTmSWEk3OB6bzvJJ4QxNLAxMz
	M0NzI1MDcyVx3nutc1OEBNITS1KzU1MLUotg+pg4OKUamFSPlPrwv65gOWG8MPDn6/DjB2P7
	19WeDvp8tSGmYoOHscKV1LDQBtW8PUbJB6pS75/8pPXJV3yCsui8bZ0zFI1DIzjD7qV9Y33U
	kPrb3f/x/39HdRqfqTye9rby+NNXGdeTb34wlpfjMdhytTFuHkPRu1UynMwCR7de3DRFScJ9
	i1HE5rBr32cIXPkvP7WvjHPrgvUPPhVW8hdOkvIIf5O5/8ccwYWvz/IHtC/6+i53yuSZP+3W
	G0QsVbm8XVhXO8XUwSSs6c7kzsW5Xf2C4t+Df2g7sj1xvmbvcdj0UUqkaNzFBHbG0oK1j1S3
	7SrLv29qd3TO1TD+pLCd0xvYt1wRs9lZ6al/zkrD5HKgvBJLcUaioRZzUXEiAKkkSSwvBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSvK7md9F0g2mHDSwezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRXHZpKTmZJalFunbJXBlnHn9n7Hg
	FnvF2bYbzA2Mk9m6GDk5JARMJDat7mDuYuTiEBLYzShxdVI/VEJa4sjvF1C2sMT9liOsEEXv
	GSVuvdzMDpJgE9CS2Hb4FRNIQgQkcfbLL0YQh1ngKqPEj0XvgKo4OIQFrCXWrogFaWARUJWY
	93EiE4jNK2ArsfrqZ6gN8hLn3/xng4gLSpyc+YQFxGYGijdvnc08gZFvFpLULCSpBYxMqxgl
	UwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgkNcS2sH455VH/QOMTJxMB5ilOBgVhLhVSoR
	TRfiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qB6ejVQwe3
	6t+MPrOlXkZA5GvkjEUBVdExe0WihMz/GN7qFtI19/Z+t0BW4Lf8kbwjvaluNxy3V7+LDJVg
	W/CTZWleh8RU6RVTQ3ZveDUj7uXEwqf/JSNPP1kcr5Tx9HFvq4NSaNyeXrdlUvN5mp48j06d
	snF3kRjzqRyf/KlGSS87Fu8QYkuUOMc9t/zso7MZE1dUr85w/R/cZGJ/fNO6s4auCSFtwsxx
	jDf9gz1vfXj/h9uK+WnKcg8Ts69W/3utvScvYJs3wVYvbs6NT2s3mi66F+uqqL9uqXus5Iwp
	nHM+hOz58NU5VzW6oFRa5fpza/7HxcuPslW4FrikKBmLvHsszmrY2fvqT6KvdWaxEktxRqKh
	FnNRcSIA2Rsp6+ACAAA=
X-CMS-MailID: 20241021063937epcas2p40b368212fc236cd916492f0ed342671d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063937epcas2p40b368212fc236cd916492f0ed342671d
References: <CGME20241021063937epcas2p40b368212fc236cd916492f0ed342671d@epcas2p4.samsung.com>

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
Changes in v3:
- Add Acked-by/Reviewed-by tags 
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
2.47.0


