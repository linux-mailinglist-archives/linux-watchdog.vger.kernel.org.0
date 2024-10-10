Return-Path: <linux-watchdog+bounces-2167-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E039984C1
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 13:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA092831BF
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 11:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BBC1C3F11;
	Thu, 10 Oct 2024 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nJfpme/6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85B1C32F3
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559125; cv=none; b=EmMWxKKBM/puc5zP0voQj5kgDRTW+YjBd0Gq3YMGK+wCB6Xp4CiN1BksgCsfvxZpzVLDhTtd6v5eC3Uejk7mTLCCmtnqMHnsHp7xbz/OQOQpBRJ/uY0Cu6sEjn8c00mJUmb4OMIgP65pF98jFQIuBGxjP+ov4QGvLRgaSCI79Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559125; c=relaxed/simple;
	bh=Bpep9FUOgAyWuRWmcvyaePc+DQdUTEerU2Q7eVLfGxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=RWdku5mho+eynDfF6wUfPfz8NqSn2aRBVzydADtiuPEfSEYEAjYTH6205L9F4ntYMelx0lXRMZuZJGa1LVAe+jC2rQ92kLrn/APLiVo3X/pZU8MuJhZ+jb26KVDqhEk4auM3Kkr/i9Wv7cxND3Vm/mxRiBPuGDy5sVT9unShIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nJfpme/6; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241010111842epoutp015e0ca527bb2f2680610f0db53fbd66c9~9E10MXk1N1705617056epoutp01t
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 11:18:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241010111842epoutp015e0ca527bb2f2680610f0db53fbd66c9~9E10MXk1N1705617056epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728559122;
	bh=wIINBLDMRpqLoNrF5IHHwtO9vfSiLsyhvt59o9EnTBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJfpme/6kRPx9/B9nSLzFj3WyD1wtZzZn9UKorTykqBI0EomTcHw2BSOWaE6H4tI2
	 Z72n6udJ3qXiyGaTV598tuqWoG9W9xiw6m9C+pTE2ptG/H1PSTDpuElFSyINpQes9G
	 lHB00gmD/GmlT2ltcogvunECbK4P+h5g8LoYArLY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241010111841epcas2p15295b51226f4009efcd3ab6916400047~9E1zvzGaY2326923269epcas2p1S;
	Thu, 10 Oct 2024 11:18:41 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XPS1Y1qW9z4x9Pp; Thu, 10 Oct
	2024 11:18:41 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.2E.08559.118B7076; Thu, 10 Oct 2024 20:18:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241010111840epcas2p30fb3a2facc586d166e0922e52ff8b3ca~9E1yB6Z6j2049220492epcas2p30;
	Thu, 10 Oct 2024 11:18:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010111840epsmtrp1fcec06bdb4ecdd17f799ce85fcc104da~9E1yBNaIC3121631216epsmtrp1f;
	Thu, 10 Oct 2024 11:18:40 +0000 (GMT)
X-AuditID: b6c32a43-761ff7000000216f-2e-6707b8114292
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3F.FD.08229.F08B7076; Thu, 10 Oct 2024 20:18:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241010111839epsmtip132623983ac1f3c84b22521169abb2c09~9E1x1BKok1147711477epsmtip1e;
	Thu, 10 Oct 2024 11:18:39 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Thu, 10 Oct 2024 20:18:07 +0900
Message-ID: <20241010111807.3635504-4-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241010111807.3635504-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmha7gDvZ0g5lNXBYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8Wmx9dYLS7vmsNmMeP8PiaLG+v2sVs8WXiGyeL/nh3sFpMWn2ey
	ePzyH7MDr8emVZ1sHivXrGH12Lyk3mPn9wZ2j74tqxg9Pm+SC2CLyrbJSE1MSS1SSM1Lzk/J
	zEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpUSaEsMacUKBSQWFyspG9nU5Rf
	WpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdMffWUtaCQ9wV837uZmlg
	PMvZxcjJISFgInFwUjNrFyMXh5DADkaJfWdvs0A4nxglHl79zwzhfGOUWHf3AmMXIwdYy5uH
	ohDxvYwSrzbOZIRwPjJKfNtxnBVkLpuAlsS2w6+YQBIiAq8ZJZp634GNYhb4yiixvbUVrEpY
	wENi2bv/TCA2i4CqROOOa+wgNq+AncSCB+8ZIS6Ul7j++ChYDaeAvcSsb0tYIGoEJU7OfAJm
	MwPVNG+dDbZAQmAuh8T0dUdYIJpdJJr73jBB2MISr45vYYewpSRe9rdB2fkSK1eegKqpkbjX
	tguq115i0Zmf7CA/MwtoSqzfpQ/xvrLEkVtQa/kkOg7/ZYcI80p0tAlBmKoS05cFQMyQlpg4
	Yy0bhO0h0djZAg2rSYwSz1fMYZzAqDALyTOzkDwzC2HvAkbmVYxiqQXFuempyUYFhvAYTs7P
	3cQITrhazjsYr8z/p3eIkYmD8RCjBAezkgiv7kLWdCHelMTKqtSi/Pii0pzU4kOMpsCgnsgs
	JZqcD0z5eSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MC13kJ39
	T/OcrkN6vKqfwaQ1Gx0evV6lxOP/f2Xmer9g/Qx9M+bjRvI2TQvjbUIZW/7Gx+ZGeb5pObXi
	r8zGf/K2act/3j/zQ780V6PEuYW3a4v9OR6OawULvXL4VE12bmDwnCUv/jDt2Dv1CEeTOZtq
	q46Lz3nzqUjt+fbrF2pOcdSqen+Xt68/wnWl6evlN3u4bjypbmW/dCxyOlvuhaeV5RGCDzgf
	XZ2d3jZD1r5IUMBzaR773bNtq+bXmP3VW+6a3vIswNfqsMtvthuv8q1m9Up1+No96U7J+ddb
	HauTW3+288bN/HdCwS8vVh1b8C2e73/QbrcfTRVlHhGcym8DdadJP+Sd2+o3sfCZEktxRqKh
	FnNRcSIA04izS0EEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnC7/DvZ0g3V/LSwezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9NotNj6+xWlzeNYfNYsb5fUwWN9btY7d4svAMk8X/PTvYLSYtPs9k
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJUx
	99ZS1oJD3BXzfu5maWA8y9nFyMEhIWAi8eahaBcjF4eQwG5GiSO3JrN3MXICxaUljvx+wQZh
	C0vcbznCClH0Hqho4ipWkASbgJbEtsOvmEASIiCJs19+MYIkmAV+M0psWGAMYgsLeEgse/ef
	CcRmEVCVaNxxDWwDr4CdxIIH7xkhNshLXH98FKyGU8BeYta3JSwgthBQzff/n5gh6gUlTs58
	wgIxX16ieets5gmMArOQpGYhSS1gZFrFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREc
	G1qaOxi3r/qgd4iRiYPxEKMEB7OSCK/uQtZ0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rziL3pT
	hATSE0tSs1NTC1KLYLJMHJxSDUw8N4Qi1S8bnPnk2mS/N40z3T9085GZG366KubyW59UuXEl
	ucOKp/bTDLZQDUk+5oYnBSvXOM89aLT5282VqZ7+1e3N5zZZany31lr+v3rrZQGBnk/39Sbv
	rZ4gItwi88VxndOxCe/s9Vf6S9VPUBUX/iNStmGbeiePc818DcPbMSmrX/V9Fn6//95LkTPf
	9256+CPtfaTLxB/pzzw+9M7o3hK28mjzOz7LHxK9HZpXnkgmnJgQce3gn9NPq5c3f844qnvM
	JF9aRuPDYU7B9tYTp/6s3rf4nNB1VaUT+qo5hy8r7ZdrE08r0ujr7Qji6Nu3RU7nQrnTqmO2
	j/gXz9vhNWO1kYxt9NqCp0qqwQxKLMUZiYZazEXFiQBTh5Ul/AIAAA==
X-CMS-MailID: 20241010111840epcas2p30fb3a2facc586d166e0922e52ff8b3ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241010111840epcas2p30fb3a2facc586d166e0922e52ff8b3ca
References: <20241010111807.3635504-1-trunixs.kim@samsung.com>
	<CGME20241010111840epcas2p30fb3a2facc586d166e0922e52ff8b3ca@epcas2p3.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds two watchdog devices for ExynosAutoV920 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..3b541d0e9d25 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -182,6 +182,26 @@ chipid@10000000 {
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
2.46.0


