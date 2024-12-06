Return-Path: <linux-watchdog+bounces-2507-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39619E6479
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2024 03:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89C631884733
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Dec 2024 02:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBF91741D2;
	Fri,  6 Dec 2024 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pM+GsbY5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27414EC46
	for <linux-watchdog@vger.kernel.org>; Fri,  6 Dec 2024 02:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733453523; cv=none; b=JczWLFw/LAiv4NdeiETd+tA4K2OrgtJ/munpaDN0SG9It+jYhBHIS4lqlKzxdcDItaTXNaUj3zoWiBArKjKaMDNq28zY3U8aK/6ilu4BS0l6NJda2ju/fp/2xbnFWLc+obBmRhl5JaUpDVMDGvyLlrJezP+YTmPE8S9HZB9tMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733453523; c=relaxed/simple;
	bh=feCUvC3SSXWPARoG6xLkk3g5qe2XfwFu91s3EPhtxOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jEHhDDdI0oxNROtnbISJryUCODL1D9oHoS+4XWhNWN7cjldedGa4W/CiDb3ScowsywELn+FcOftRxQrQUsJAziTJFyNOH7tTiBLRd45HXwuw89KQN9CR4NzPGL7f9Wb2rGV/MTYu1QQyylMeoG1mqPlZKRyx0WP//7zH4cDfuGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pM+GsbY5; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241206025157epoutp03f1cac81f0092bf7aeb4247486aeb2c92~OdspUXO8q1171311713epoutp03_
	for <linux-watchdog@vger.kernel.org>; Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241206025157epoutp03f1cac81f0092bf7aeb4247486aeb2c92~OdspUXO8q1171311713epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733453517;
	bh=cqimClylACdPib2XjzAzujqrVa+bLgNFlUoMYpGNb7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pM+GsbY5Jqv9e3MtoD/eWJpKDxQUsgAJDev+rEgcMpvEe+c5IkMZMzBJ5KBaFxbjB
	 3YE4d4pB8fHjgawfcNasCpys/R6AKF2+Sv8+L8GcAj7setjOQdzZcanJdevJnyA0vt
	 7Wn1IqtfHERnyTBgGb1LFfNlzOGZ0rwUdj0oD1Gg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241206025157epcas2p1de9a1f3d058856d20254a587ef836e9d~OdsopW9jl2022620226epcas2p1I;
	Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Y4G4X4YSPz4x9Q1; Fri,  6 Dec
	2024 02:51:56 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.61.22094.CC662576; Fri,  6 Dec 2024 11:51:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833~OdsnjsnD93176431764epcas2p4B;
	Fri,  6 Dec 2024 02:51:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241206025156epsmtrp2ce7ead182b09be7aabed38fe61e14aeb~Odsni1Mk23190931909epsmtrp2c;
	Fri,  6 Dec 2024 02:51:56 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-aa-675266ccb376
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3B.74.18949.BC662576; Fri,  6 Dec 2024 11:51:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241206025155epsmtip1bcd0f7988c86df47d542edc9def24326~OdsnYg9TL3234132341epsmtip1C;
	Fri,  6 Dec 2024 02:51:55 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v4 1/1] arm64: dts: exynosautov920: add watchdog DT node
Date: Fri,  6 Dec 2024 11:51:38 +0900
Message-ID: <20241206025139.2148833-2-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206025139.2148833-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmue6ZtKB0g9fHlS0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y/6r5WwFp7krGr9MZWxg
	vMjZxcjBISFgItHaY97FyMUhJLCDUeLZ7jtsEM4nRomdZ5YzQzjfGCW+nzoJ5HCCdSybuZ4J
	pFtIYC+jxMoqiJqPjBLzp/5iAqlhE9CS2Hb4FRNIQkTgNaNEU+87sEnMAl8ZJba3trKCVAkL
	eEh8n72MDcRmEVCVmHRlNpjNK2AnMf3udCaIbfISk9a0gm3mFLCXmLhmMQtEjaDEyZlPwGxm
	oJrmrbPBFkgIzOSQ2HF+M1Szi0Tb39usELawxKvjW9ghbCmJz+/2skHY+RIrV56Aqq+RuNe2
	iwXCtpdYdOYnO8ibzAKaEut36UPCS1niyC2otXwSHYf/skOEeSU62oQgTFWJ6csCIGZIS0yc
	sRZqj4dEy/ONYPuFBCYxSrR8lJzAqDALyS+zkPwyC2HtAkbmVYxiqQXFuempxUYFJvDoTc7P
	3cQITrVaHjsYZ7/9oHeIkYmD8RCjBAezkghvZVhguhBvSmJlVWpRfnxRaU5q8SFGU2BIT2SW
	Ek3OByb7vJJ4QxNLAxMzM0NzI1MDcyVx3nutc1OEBNITS1KzU1MLUotg+pg4OKUamPqVbN3u
	njjdOGta4gnV/KPX/C4d+x2Y8+Bn17w9lwJnvX/8WTPz8cmezm9urU9W8l/e7ZFzZO1Krqid
	AWd4/i3bNj/UZ0mgdsjRv2Wztlrciprj35R+4Mm0n+umJM8qcku4MkPgWp2/ZE5f8Z++m7c5
	wuZ2zz3qfMLSpq18t13augT1iANfNx62+e06iyfyb4Sj7K/NLgtYlLeYnlWZtiZEY4qK8nox
	rZepzXfCOs5M2Xf31t0/3vlau2vbb//SlzH42+sp/+xbKn9Q4srVZ7YkSDNObf59T85L4k3p
	8gspSe8nTo+I0Ar7k3P8G89Cj8Dvc7wfFZ4ytTH8t6h8c9sst2j/edePnvQN2XXpqvdmJZbi
	jERDLeai4kQA/L4iET4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnO7ptKB0gxP7bSwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJUx
	/9VytoLT3BWNX6YyNjBe5Oxi5OSQEDCRWDZzPVMXIxeHkMBuRolV7cdYIBLSEkd+v2CDsIUl
	7rccYQWxhQTeM0r82isMYrMJaElsO/wKrFkEJH72yy9GkASzwG9GiQ0LjEFsYQEPie+zl4EN
	YhFQlZh0ZTaYzStgJzH97nQmiAXyEpPWtDKD2JwC9hIT1ywGOoIDaJmdxLmVFRDlghInZz5h
	gRgvL9G8dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4M
	La0djHtWfdA7xMjEwXiIUYKDWUmEtzIsMF2INyWxsiq1KD++qDQntfgQozQHi5I477fXvSlC
	AumJJanZqakFqUUwWSYOTqkGpqPX4r/V7az2zWvLTNqzPembh4Vnesv6Lbs4xAznhtd8neO6
	2sH006c3yQweggzus/2vX1/7/NkyrvigMxHbOAo50+YfmS0xi+1uyNUVrCu7LFmcrIvv3la0
	7TuREZSxOaY6dlPCiu60FSuj3gX/vqkRsF+7JWbrrPKIxPkvZhVIiR38v2xeisLckBqzS99U
	0tXyHHcUGPHc6ItlP3nordsahaMNezwav/y328Dy786RmtD+F9e7n97Yv93rTcCpba4Ldy5m
	4ngwqyfQ91EZ72lG18R/Kjov1mTrJey6YuCxsTWW9Ud4ev1Vs7m6ixhsBUJLO/LOhJyemLnw
	Orfnd+VUzr2/mZT/tvG7vl4vo8RSnJFoqMVcVJwIAElLh5j7AgAA
X-CMS-MailID: 20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833
References: <20241206025139.2148833-1-trunixs.kim@samsung.com>
	<CGME20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833@epcas2p4.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds two watchdog devices for ExynosAutoV920 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..7b9591255e91 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -183,6 +183,26 @@ cmu_misc: clock-controller@10020000 {
 				      "noc";
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
2.47.1


