Return-Path: <linux-watchdog+bounces-1886-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD18977A89
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 10:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B75A1F270E1
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 08:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422241BDA8D;
	Fri, 13 Sep 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qaqG/9R8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF81BD003
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214634; cv=none; b=gNX6E7he7xhEuflmpPb5h0OHOnPS9e8ys7FjHPgukY6TQg4TUYzNH9P+yhV1l1OFT/44XiPFXQ9upBkw8SdUlCiUpLKIkvc3DYzgEgM6uwZ2mbp6uY1zP4yG3zr9qex5Sn6d8DUo7e/6BmQiXF5+/0TkdujGcLk9Q8l1NTWd3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214634; c=relaxed/simple;
	bh=VXfpLvliY0qreEcwdlpLsHaDpXmSSi5Ra3LdGTOB0yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=odgdD4k9wAhAGw5enfPZJSwRA/chU5SPT0OBwe83L5LSXg/O7Yjvsc7QQJ6WC3uiUkYocgD6e8Ime0ErtyuIclq2lbUbT7JQFxwmiWcVDoDgVkyrrcIcqktYJ/Hn15ps6fGNl+7g9VlD8CH/96N0nG0FT+OxCwCdfdij5JbvnFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qaqG/9R8; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240913080349epoutp049e0b3fb56de7903f17de1651e8c100c3~0vw8uDfk22965929659epoutp04F
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240913080349epoutp049e0b3fb56de7903f17de1651e8c100c3~0vw8uDfk22965929659epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726214629;
	bh=SZfbc9jZ4LzU+dG89MMiiL9I3Js9nc5zQVapmEmqHR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qaqG/9R8w+0I4Vtf60NN9nqDjBqcauJNxCBjarNpiyI1ljr+TuyDRDejkYSjCZ9E8
	 dleFmOE4NKobo8GMS5bCu/xBpmFP6jcAhSplxv1wK7oVBUHD43aQ7CK4aY7w99cEJS
	 Z6nY0Ecb1ZSZcWW1MZ6J5+lcaWCfDpNKnieMOf+8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240913080348epcas2p28d084be4931c403519c8b40180dfa464~0vw8O6GL21146511465epcas2p2c;
	Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4X4mz76mJRz4x9Q2; Fri, 13 Sep
	2024 08:03:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	8C.B0.10012.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c~0vw7LS7PK1978819788epcas2p4S;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240913080347epsmtrp2d37c2ac5a207d9899279f65a004e7c88~0vw7KaDwg1974219742epsmtrp2G;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
X-AuditID: b6c32a47-c43ff7000000271c-1d-66e3f1e37f3d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3D.34.08964.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epsmtip2db59ad0f635dc9527d8bdd02aa2c9beb~0vw65fUrT0679106791epsmtip2F;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Fri, 13 Sep 2024 17:03:25 +0900
Message-ID: <20240913080325.3676181-4-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913080325.3676181-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhe7jj4/TDO5dNbR4MG8bm8X9T31M
	Fmv2nmOymH/kHKvFy1n32Cw2Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgt5i0+DyT
	xeOX/5gdeD02repk81i5Zg2rx+Yl9R47vzewe/RtWcXo8XmTXABbVLZNRmpiSmqRQmpecn5K
	Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtChSgpliTmlQKGAxOJiJX07m6L8
	0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjKsL2lgKNnFXfLw8l72B
	8RBnFyMnh4SAicSTs79Yuxi5OIQEdjBKbJ62jxHC+cQoseTvI3YI5xujxJwPr5i7GDnAWpb3
	mkPE9zJKvHg6hxnC+cgocWzmSmaQuWwCWhLbDr9iAkmICLxmlGjqfQdWxSzwlVFie2srK0iV
	sICrxL2/n1hAbBYBVYmOba1g3bwCdhLXPv9lhLhQXuL646NMIDangL3E7uY+NogaQYmTM5+A
	9TID1TRvnQ22QEJgLofEr7W72SCaXSRufv4ANUhY4tXxLewQtpTE53d7oWryJVauPMEEYddI
	3GvbxQJh20ssOvOTHeRnZgFNifW79CHeV5Y4cgtqLZ9Ex+G/7BBhXomONiEIU1Vi+rIAiBnS
	EhNnrGWDCHtInN+iDAmqSYwSF9pWsk5gVJiF5JdZSH6ZhbB2ASPzKkax1ILi3PTUYqMCY3gE
	J+fnbmIEp1st9x2MM95+0DvEyMTBeIhRgoNZSYR3EtujNCHelMTKqtSi/Pii0pzU4kOMpsCQ
	nsgsJZqcD0z4eSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MGkn
	t0orynR+sP4//5B5u/F/Tb3ABS/PFEap/tp5srFVMPzLlITIf8tP1V32ctszyd9Cpnv/1xNl
	lf2RvZonuI3VTaokehdr3jY+yBm5fGF5l45WoUrn78w2DW6pq++VTS7V/GK9dnZi7Rqt2wWG
	rAe3xyvqvPh4e/tSoXC3k+vjPi7743hmYVJetVjGK5ulogIqh1d6B91lXFbuzNlb/fAaY0Hw
	jSveEw07kx7tn/v2PqOzvbUAW9brW4eVO4ViHthOkbv6I4PP+f4/n92L3G+6M22e0PbuVVfB
	2YzcXd9WPC6dXsRQ8ql50gX1M1vfnAm1/jeLcSPT1msPrzLs/7/1frCfm4jo+abS881s65RY
	ijMSDbWYi4oTAWu7RNdABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSvO7jj4/TDBqOClg8mLeNzeL+pz4m
	izV7zzFZzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awW0xafJ7J
	4vHLf8wOvB6bVnWyeaxcs4bVY/OSeo+d3xvYPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvj
	6oI2loJN3BUfL89lb2A8xNnFyMEhIWAisbzXvIuRi0NIYDejRMOKD+xdjJxAcWmJI79fsEHY
	whL3W46wQhS9Z5SY3v8LLMEmoCWx7fArJpCECEji7JdfjCAJZoHfjBIbFhiD2MICrhL3/n5i
	AbFZBFQlOra1MoPYvAJ2Etc+/2WE2CAvcf3xUSYQm1PAXmJ3cx/YAiGgmukLWtgh6gUlTs58
	wgIxX16ieets5gmMArOQpGYhSS1gZFrFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREc
	G1qaOxi3r/qgd4iRiYPxEKMEB7OSCO8ktkdpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/Sm
	CAmkJ5akZqemFqQWwWSZODilGpgyd3ybdu7TOkMrXia9peIX/D1sTE8lJE1rejjpzaoDb21F
	zG3jz7x6eUxxVdn8/5fCz/zQuGt5JmFZhHrgE4+j7xsnTow8+iHiu7ZSBrfbMf4HXUY7xOxj
	xd98PdT9TdqUMzk4n7t4RWFD/MJtd8viHZUZ7V6GK9241BAVffVbzKHeKseHGUeMZV/udjr9
	IOuS3Kkphbv/hWzqa1j49PqsJxwebF0H+7x2sGmfaT97oylaZs2Cbi/exhPXJMruXfb3vxt2
	3ynQ8lqEVE3eFtHET6qOK/sEjSSnfGM+mCXbOM9ga61cgxP3Kn+B7mJujTbb3CfsvEGv2Kaw
	PNvUXX/uw40y/f9r/2zzdHgx45ASS3FGoqEWc1FxIgD4Sj3W/AIAAA==
X-CMS-MailID: 20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
	<CGME20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c@epcas2p4.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Adds two watchdog devices for ExynosAutoV920 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..de210f8e5599 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -297,6 +297,26 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
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
 	};
 
 	timer {
-- 
2.46.0


