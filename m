Return-Path: <linux-watchdog+bounces-2246-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D08059A5A86
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 08:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6A8281775
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186541D0948;
	Mon, 21 Oct 2024 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A0sV5fw5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72F1CF5C1
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492785; cv=none; b=Gs5aHUd/SL+0j5dj2kdmT0MjniDyL28BVja4l9i0B6BACmnKf3cmiGCHFjZDFj1l1aTm8r0IIzIAWpw7lpbczI+HvVqrHuKttmuK+uEg/EV92ZokPw/rMYQpfgAjOCCFmn5nPZbWrAWT0p9+GEKvzYCB3EIUsnZik/B+obgmO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492785; c=relaxed/simple;
	bh=QmAfah6874Vxtxn57TEUYtpz10BZ55Q0VrXc5wBaTkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Rp/9pwzetMIPkDX6dtG16M0bV6rYS6vJ5ns5v880S26HsAhWz0j+5aiPlUewv2a6XVB8iC4LA1YmVODQynxPktow2XmAujWdmwixLpVSVzp8odrDUjGJtFfmi1+gCjAX/vzDPPX7MNkMEl2lLz7iS5LUfLnFkyieoA8TXWBGuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A0sV5fw5; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241021063939epoutp0281aba780677f421ac8ee51810c798044~AZIURnGZy1978019780epoutp02m
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241021063939epoutp0281aba780677f421ac8ee51810c798044~AZIURnGZy1978019780epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729492779;
	bh=hQxDkfbraO852R9WezWXo0oCD3wHYVrlBSU/k+r4htE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0sV5fw5JlDoIqmTfZEhMKNaV+kcLfSeoSy0/XlfxMp0IPIti0sWmj/1Pw43fdSyM
	 MMreN3su4DD7MAVk13G23moYxEOLY7S+oA3Dk3Tlsfu0rJekXKZ99VfByDDcR2Mywf
	 u+vMgQQqYpXr5+h8znWIEMqeONXByRqp5rlb8SZg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241021063939epcas2p28fe89981e9a8238c992efb4ca1e051c8~AZITyQDWj1326713267epcas2p2G;
	Mon, 21 Oct 2024 06:39:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XX5JV3X8zz4x9Pv; Mon, 21 Oct
	2024 06:39:38 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.57.09770.A27F5176; Mon, 21 Oct 2024 15:39:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epcas2p3dd36f16b4daf7dd93a18f2e0fa187471~AZISw9Fcm1483314833epcas2p3a;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241021063937epsmtrp2be56318a8abd4b4300a832ed4a27f9f1~AZISwDE4r2414824148epsmtrp2j;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
X-AuditID: b6c32a46-da9ff7000000262a-10-6715f72abcc3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	93.F8.08227.927F5176; Mon, 21 Oct 2024 15:39:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241021063937epsmtip200a761ad9a00df6870269037f753b773~AZISjvM181927319273epsmtip2U;
	Mon, 21 Oct 2024 06:39:37 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Document ExynosAutoV920
 watchdog bindings
Date: Mon, 21 Oct 2024 15:39:01 +0900
Message-ID: <20241021063903.793166-2-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021063903.793166-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmqa7Wd9F0g59nJS0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Nou9r7eyW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	MWnxeSaLxy//MTvweWxa1cnmcefaHjaPlWvWsHpsXlLvsfN7A7tH35ZVjB6fN8kFsEdl22Sk
	JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAnaykUJaYUwoU
	CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM648/og
	a8ET3oqe3RfYGhjbuboYOTkkBEwk7t37zdzFyMUhJLCDUWLpik9QzidGics/drNBON8YJX6u
	/MIK03JkXxcLRGIvo8Th9/tYIZyPjBIfX98Gq2IT0JLYdvgVE0hCROA1o0RT7zuwwcwCa5kk
	5vxoYwSpEhaIkrj6+goLiM0ioCrxt/kmO4jNK2ArcfLyD0aIffIS59/8ZwOxOQXsJB4fe8oC
	USMocXLmEzCbGaimeetssAUSAks5JI52LGCDaHaR6Ny6B8oWlnh1fAs7hC0l8fndXqh4vsTK
	lSeYIOwaiXttu1ggbHuJRWd+AtVzAC3QlFi/Sx/ElBBQljhyC2otn0TH4b/sEGFeiY42IQhT
	VWL6sgCIGdISE2eshdrjIdH0dw00RCcySryYfYhlAqPCLCTPzELyzCyEvQsYmVcxiqUWFOem
	pxYbFRjBozg5P3cTIzgNa7ntYJzy9oPeIUYmDsZDjBIczEoivEoloulCvCmJlVWpRfnxRaU5
	qcWHGE2BQT2RWUo0OR+YCfJK4g1NLA1MzMwMzY1MDcyVxHnvtc5NERJITyxJzU5NLUgtgulj
	4uCUamCqWD65f87PvJ8+wvLvfspm3bddev6UbcuLj8vK/fkcD+yV73HT8/w/da1IteqjGf7H
	T9uf01Ry2Mcfen2ZR9uRqWYe5a5c3aJ9KiH3BfKjko4snRJ04837012Xs4Tfn9t0U7jQSblC
	8e0HQVdp73myc52U55+b7v+Jn3XJ/b7ss/tNP7rxHWj5VcMSGP1l+sQzYaX8b9V+b39x7Hvn
	dXMv02qno6tjolK3ePi0v5Qo/S4pI30iM+zPFNktLmFRy6f9qnmjFvP0vNZGR1V3rSt/VS5e
	OC8WfGfOH/YWXxulhDNXfYOWftqtf6ju9OrVz1x/Npv9r/u3pk7RY9kn6d6ClCSHDSeDT0nc
	ErzuEJimxFKckWioxVxUnAgABQ86f0wEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWy7bCSvK7md9F0g4dtphYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8Xe11vZLTY9vsZqcXnXHDaLGef3MVncWLeP3eLJwjNMFv/37GC3
	mLT4PJPF45f/mB34PDat6mTzuHNtD5vHyjVrWD02L6n32Pm9gd2jb8sqRo/Pm+QC2KO4bFJS
	czLLUov07RK4Mu68Psha8IS3omf3BbYGxnauLkZODgkBE4kj+7pYuhi5OIQEdjNKNEw6wAiR
	kJY48vsFG4QtLHG/5QgrRNF7Ron17WfAitgEtCS2HX7FBJIQAUmc/fILLMEssJlJ4so0JRBb
	WCBCYl5vL1icRUBV4m/zTXYQm1fAVuLk5R9Q2+Qlzr/5D7aNU8BO4vGxpywgthBQzZWrEFfw
	CghKnJz5hAVivrxE89bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10v
	OT93EyM4YrS0djDuWfVB7xAjEwfjIUYJDmYlEV6lEtF0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
	4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpgEDzSLKnzcYPOu5up/f3dXx1l/Pp5m5Jyr4zB3
	8pNQ1r0BBQcqHmZO+VwVb7UrriKu/1QSv8nOKVunrLif1V7PwHtoqtqxaJ/a17nXHOv55qWz
	7Fh06h3Ldjff5KCcufPPbg1UKvxwX7Hoe0NUjKSA31yFhGkuDu/ir7xXV7WSinuolrrxv27D
	jNDdpZPPKO+2X34w1r0q3691a2CRh5pz9lnl516Z20qmbJ0Z+6DM6abU1+JAtaw4zk+Pyzdv
	P3DRXPCRwCbntzLNxmfaizj4ftfe/q6tem/pnt5Zh2Ve+pUeMb29KH5jjnzfgccL1GzNJ6od
	q+rxn8tzZJdK8szCuc7e5Yt5mVc8rtVefVOJpTgj0VCLuag4EQCzxNPvBwMAAA==
X-CMS-MailID: 20241021063937epcas2p3dd36f16b4daf7dd93a18f2e0fa187471
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063937epcas2p3dd36f16b4daf7dd93a18f2e0fa187471
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
	<CGME20241021063937epcas2p3dd36f16b4daf7dd93a18f2e0fa187471@epcas2p3.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Add "samsung-exynosautov920-wdt" compatible to the dt-schema
document. ExynosAutoV920 is new SoC for automotive, similar to
exynosautov9 but some CPU configurations are quite different.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 77a5ddd0426e..d175ae968336 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
           - samsung,exynosautov9-wdt              # for Exynosautov9
+          - samsung,exynosautov920-wdt            # for Exynosautov920
       - items:
           - enum:
               - tesla,fsd-wdt
@@ -77,6 +78,7 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - samsung,exynosautov920-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -88,6 +90,7 @@ allOf:
               - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - samsung,exynosautov920-wdt
     then:
       properties:
         clocks:
-- 
2.47.0


