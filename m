Return-Path: <linux-watchdog+bounces-2245-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C7F9A5A85
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 08:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2834BB217D3
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB211CF5C8;
	Mon, 21 Oct 2024 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="svCjVUlX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDFB1CFEB0
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492784; cv=none; b=WB/PM0+krLQCTH3zd0KX8BrszSJpRwiHZjuDB1iyAfzGcIrcfW6zh4BbksjdJhniGIp4o1rc/Ig3bhU9CIhWiSK0aDS/H61AWGoATTkrDrY6P6peLwoWkPVQnmp3r4tDtTNWHSNrMQ74NhsxoYafC5MAzUzXqpN1JdABFPwScco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492784; c=relaxed/simple;
	bh=toSZEPuA8KtW4NGZWit+YtMDDVelJFCqeH6SIX+0vSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=kmpaYg+8fzrlidnFvQjD7I1P4b/5Ugd0udXiSvVVdkCg6XcZ6WL8UgVrorIBYhWSjuaregqgNfz1vRP1JEygbnyWonyuB0P7sC7OeawA3u4yfWwx77UtZddSl+qbKvkefv4Q7/lOTTIT/6jATuaVcVjmoeUPjsHMjy5Wr0j11eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=svCjVUlX; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241021063940epoutp040d39349b0880930e1a0d13bed92c4f02~AZIUzJctf1010110101epoutp04Z
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241021063940epoutp040d39349b0880930e1a0d13bed92c4f02~AZIUzJctf1010110101epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729492780;
	bh=QSyRVDO0W3RLAiNZJSPSIuTvox4rmOFWkLwxUqIuoeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=svCjVUlXHVBLUOq1j8m8yM1vlISe9t+eXUbD/QvYXAPIMhl29b07C6uy5dReImasm
	 /48iczIkGZCmqRPpBHovgrjb2NwFFM7iZ6y69EV6NvTRYIDJA2bWND0JcRwzr0u2v9
	 TRct53kfI9MTQZxJElCtxPAhg1PLD9qUrkCSfUZQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241021063939epcas2p454e9cc22e689e4f877c2dc872993f24e~AZIUP4-u_2426824268epcas2p4P;
	Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XX5JV6mMWz4x9Q1; Mon, 21 Oct
	2024 06:39:38 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	CF.57.09770.A27F5176; Mon, 21 Oct 2024 15:39:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc~AZIS9GdeQ2425624256epcas2p1x;
	Mon, 21 Oct 2024 06:39:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241021063938epsmtrp249ea0445f9583877a9ddffb0e23e3470~AZIS8Jh482414924149epsmtrp2e;
	Mon, 21 Oct 2024 06:39:38 +0000 (GMT)
X-AuditID: b6c32a46-638d9a800000262a-13-6715f72a8da5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	45.F8.08227.A27F5176; Mon, 21 Oct 2024 15:39:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epsmtip20d8581a5f2d02f8c61d13bd58fcc11e7~AZISuxjK31927319273epsmtip2W;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Mon, 21 Oct 2024 15:39:03 +0900
Message-ID: <20241021063903.793166-4-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021063903.793166-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmha7Wd9F0g1V/FCwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y+XlX4wFh7grJm7/wdTA
	eJazi5GTQ0LAROLc48nsXYxcHEICOxglpq2+xwbhfGKU2L74MFTmG6PE5lktLDAt7zd0M0Mk
	9jJKLFjzigXC+cgocfDgeUaQKjYBLYlth18xgSREBF4zSjT1vgNrYRb4CjS4tZUVpEpYwEPi
	yp1mJhCbRUBV4u+dJWwgNq+ArcTWI9Og9slLnH/zHyzOKWAn8fjYUxaIGkGJkzOfgNnMQDXN
	W2eDLZAQmMohsebUZ2aIZheJqyums0PYwhKvjm+BsqUkPr/bywZh50usXHmCCcKukbjXtgtq
	sb3EojM/geo5gBZoSqzfpQ9iSggoSxy5BbWWT6Lj8F92iDCvREebEISpKjF9WQDEDGmJiTPW
	Qu3xkNh+4Qg04CYySkw8tJ1tAqPCLCTPzELyzCyEvQsYmVcxiqUWFOempxYbFRjBozg5P3cT
	IzjlarntYJzy9oPeIUYmDsZDjBIczEoivEoloulCvCmJlVWpRfnxRaU5qcWHGE2BQT2RWUo0
	OR+Y9PNK4g1NLA1MzMwMzY1MDcyVxHnvtc5NERJITyxJzU5NLUgtgulj4uCUamAKuWrXNqOi
	xO5Qztl3H7jfh8XN19IuaLxuu7w6TWZm1YMoo9KpOScSjy6YyPMjaAqH3PKf/f6KlZ++la58
	7+BUeuHFXT/NDo38Eg2HyQ4586WZeJic+SpC105aV3VuWo5LkJmU1epzk49x2MooZH/KN9ml
	Msf7nuccrdc2TS0H9k04Z6VUcvHZ1v2255jlH7OeV4uu0Nh8fL64zpp5xX+yN0VFNhkHyTKZ
	Oq5bfLVpbeaDe/XxrmFzO6yXM0dfFDjvk+fS+ymMx9/hjuq85F6TKZcudn612fe2NFH32bKc
	tLYIj42z7s52LH27dnrV1d/ik4y7L3knMHRnbqia/bJf1aOsJnnKugduHRe5LyqxFGckGmox
	FxUnAgBR4/9XQgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSvK7Wd9F0g0tnmC0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWx
	8vIvxoJD3BUTt/9gamA8y9nFyMkhIWAi8X5DN3MXIxeHkMBuRomjx16wQSSkJY78hrGFJe63
	HGGFKHrPKHHj/kZmkASbgJbEtsOvmEASIiCJs19+MYIkmAV+M0psWGAMYgsLeEhcudPMBGKz
	CKhK/L2zBGwqr4CtxNYj01ggNshLnH/zHyzOKWAn8fjYU7C4EFDNlasvoOoFJU7OfMICMV9e
	onnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHB1aWjsY
	96z6oHeIkYmD8RCjBAezkgivUolouhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeb697U4QE0hNL
	UrNTUwtSi2CyTBycUg1Mq0892dXDaruNjXn5NpNpk9ZU7dLXaX/3xCu07F4G4zxO9QPNm3Z4
	G2sf6fjANT26+L31k2C7Gv+l1jnnvkrksH9/LmK4K7BDZ0sq65v03ktO+y4cnn7rbmkgt6zm
	hqOZ8ptuhVt+bF+QtmjFlFX7jezLzazPbVCX9K99uM0lL0ZwyyNdecG2uuIZjrxv3q/60ylz
	l01SS4fphGLjy/58bjsNw1qZ5OzD+ZvPFjnVMzoHXRXlZJnM7fZv07J3cj8e5b3wZqrL8RcN
	1tEzvVZ32o6tdKnY1VsHqw1uNHp57zU52bLR9JjadL6WsMkea29oxVzdI7SgXX7qhbVdYRz3
	431MTGP3+056JORW+UGJpTgj0VCLuag4EQDIcTVd/QIAAA==
X-CMS-MailID: 20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
	<CGME20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc@epcas2p1.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds two watchdog devices for ExynosAutoV920 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 91882b37fdb3..2b3e8debda3d 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -172,6 +172,26 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		watchdog_cl0: watchdog@10060000 {
+			compatible = "samsung,exynosautov920-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+		};
+
+		watchdog_cl1: watchdog@10070000 {
+			compatible = "samsung,exynosautov920-wdt";
+			reg = <0x10070000 0x100>;
+			interrupts = <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <1>;
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.47.0


