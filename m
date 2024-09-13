Return-Path: <linux-watchdog+bounces-1885-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDA977A87
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 10:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8FEA284E40
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 08:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC041BD518;
	Fri, 13 Sep 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eRvFEcQ/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F20155742
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214634; cv=none; b=kylSgztQFLFzJy2FD2ZMEPBT7dufCCrqYQQlTuovY72QOyy3dpcng1yvy9JygJ4Y0C4WtkAcyL4s5xyJ6LgjQ868WQtNDkYni/9AhoTApWC2ttZJzplHl3C45UP0oj9YBTAIhVPSL2Ja4LDBI9OyAcyp4iMiv2OB5T1Sk8Yoh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214634; c=relaxed/simple;
	bh=Vc6s6+COXzy9c+XnCeM/NP2FHQTRAQyn6+gq+l+mYD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qJDG617H1Lnml7al9BiYP4mM+/LCXp7JCy7reaMdu5I8XIfVj/QfCf+KJ6qBcCjiH9B0WAy6/0MA4CUKGspvj6lNf0YptFbYc1hIchJMmuzLmpZmCAWgEUJU+N/VI5zhyIiwcOlBz9PrussEuAhN9jCk9yKPoLT9r6ycOwnGSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eRvFEcQ/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240913080348epoutp013068a94ce9e264702f1710e6530f9364~0vw8icLsA1930119301epoutp01H
	for <linux-watchdog@vger.kernel.org>; Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240913080348epoutp013068a94ce9e264702f1710e6530f9364~0vw8icLsA1930119301epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726214628;
	bh=JSOERbu7StGHVylZzo/2W5mtPqm88Oi/lnglXITEDJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRvFEcQ/RwVkDatNxxbasYkPHXqMtFp43riQ53yavci1txORUWyz63VSZr1BlESPO
	 IsUxH370S7AFtkw4HCR7Sy1m0nDOK6iURIbo5puNbDmjJ1jrG990X6wvWH/K4j2F0w
	 ItExIXcxGRArbf0bylgb6NrYNWEuqu//Te1xVXvI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240913080348epcas2p2e6a83aebf78ff8b2e917eaf40a1132a8~0vw78Ovig1146511465epcas2p2a;
	Fri, 13 Sep 2024 08:03:48 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4X4mz75GGyz4x9Q8; Fri, 13 Sep
	2024 08:03:47 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	DA.B0.10012.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epcas2p3f92c8fe85b252f8ac2033261db345837~0vw6_VY8I1762517625epcas2p37;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240913080347epsmtrp246bdcaf21491c10af322b1a6669d1c68~0vw69jH_n1974219742epsmtrp2E;
	Fri, 13 Sep 2024 08:03:47 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-1c-66e3f1e366f2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B6.D4.08456.3E1F3E66; Fri, 13 Sep 2024 17:03:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240913080347epsmtip2670470d2b09a101313dfd555a11827ce~0vw6xNT1i0679106791epsmtip2E;
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
Subject: [PATCH 1/3] dt-bindings: watchdog: Document ExynosAutoV920 watchdog
 bindings
Date: Fri, 13 Sep 2024 17:03:23 +0900
Message-ID: <20240913080325.3676181-2-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913080325.3676181-1-trunixs.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmhe7jj4/TDBqmKls8mLeNzeL+pz4m
	izV7zzFZzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awW0xafJ7J
	4vHLf8wOvB6bVnWyeaxcs4bVY/OSeo+d3xvYPfq2rGL0+LxJLoAtKtsmIzUxJbVIITUvOT8l
	My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hQJYWyxJxSoFBAYnGxkr6dTVF+
	aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xs/XF5kLPvFUtKw8xd7A
	uICzi5GTQ0LARGLDpLuMXYxcHEICOxglds5ZzQrhfGKUWHNtOhOE841RovXldnaYlgsPZkAl
	9jJK7G9+AtX/kVGi7+JpVpAqNgEtiW2HX4FViQi8ZpRo6n3HDOIwC3xllNje2gpWJSwQLrHx
	4TwmEJtFQFWie34j2A5eATuJ3YsWs0Hsk5e4/vgoWA2ngL3E7uY+NogaQYmTM5+wgNjMQDXN
	W2eDLZAQmMkhcfTKD6AiDiDHRWLrpQKIOcISr45vgfpBSuLzu71Q8/MlVq48wQRh10jca9vF
	AmHbSyw685MdZAyzgKbE+l36EBOVJY7cgtrKJ9Fx+C87RJhXoqNNCMJUlZi+LABihrTExBlr
	ofZ4SFx7MxsaupMYJVbsOM4ygVFhFpJfZiH5ZRbC3gWMzKsYxVILinPTU4uNCozhMZycn7uJ
	EZxwtdx3MM54+0HvECMTB+MhRgkOZiUR3klsj9KEeFMSK6tSi/Lji0pzUosPMZoCQ3ois5Ro
	cj4w5eeVxBuaWBqYmJkZmhuZGpgrifPea52bIiSQnliSmp2aWpBaBNPHxMEp1cC0wmnFr6Zz
	q15aXRMOfh3cHMC9dpF28r8TXFsPXA46t6R8wiMBv8kmHncfJW25MfXy7X4zS9b14VnHNPNC
	Z8+OYdT74R9cuc7/zuUV7RONWmc4WWVdSPSvnPfVT77i0KRJM8VFvh/RjrMO2D/Nw2zWj8aj
	VXO2SC9+JjPh0yorvZCif0xHXP4J3HrxWX7i5bVFnIlvr+4XEf+gapjx6n1HyI75c9kncTba
	qm62VWQM5u0/1ul9pfAmw99Qi4XfV8y4OyeV95QW2xv+q7PXxrkEzF3XW8AcWSjYasJeeEFj
	wxMzlogNLxvvzuM9bvL6/Wm/aUI/3WUjlp2zslutLnm17DhPfurBS/tPrC8W0X1YpsRSnJFo
	qMVcVJwIALoS/1dBBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSvO7jj4/TDBbM5bB4MG8bm8X9T31M
	Fmv2nmOymH/kHKvFy1n32Cw2Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgt5i0+DyT
	xeOX/5gdeD02repk81i5Zg2rx+Yl9R47vzewe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG
	z9cXmQs+8VS0rDzF3sC4gLOLkZNDQsBE4sKDGUxdjFwcQgK7GSUWXfnBCpGQljjy+wUbhC0s
	cb/lCCtE0XtGiW835oEl2AS0JLYdfgXWLQKSOPvlFyNIglngN6PEhgXGILawQKjEqwXrWEBs
	FgFVie75jewgNq+AncTuRYuhNshLXH98lAnE5hSwl9jd3AcWFwKqmb6gBapeUOLkzCcsEPPl
	JZq3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwdGhpbWD
	cc+qD3qHGJk4GA8xSnAwK4nwTmJ7lCbEm5JYWZValB9fVJqTWnyIUZqDRUmc99vr3hQhgfTE
	ktTs1NSC1CKYLBMHp1QDk9Ez/jY52b+xFVOvBBpv2yN42fvn1naJzw5fljKHHBTcEmcxdWXJ
	vSV3DgqoXlThK/F5uWzBpIPsbD4x96Ydmz/R8foG7W9Tl0UUsp13YMz+r7W2X3i5f8TjWRsW
	LT2vMXWqItt5d6eOpj/LfbVNp2TdOVRd8KXaeXEH67efmyYv27JByPmA7PTPWvtz5i5pr6rN
	37jm/ptJsUtnzjBf05e/jb+wMCJocn7Wm9XHFjJueJPw68buipiFvQaFE9P+y/1z/Pbn80ff
	U0baR6bsN9mV26S/vfMZo9c3zqJXd2ZfZT/d356bFxBqnnxSifnSwqiHGrtVXz7ptxQ2P+ex
	v2XhpNWWmYsSQy9f60y9oCerxFKckWioxVxUnAgAGchwVP0CAAA=
X-CMS-MailID: 20240913080347epcas2p3f92c8fe85b252f8ac2033261db345837
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p3f92c8fe85b252f8ac2033261db345837
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
	<CGME20240913080347epcas2p3f92c8fe85b252f8ac2033261db345837@epcas2p3.samsung.com>

From: Byoungtae Cho <bt.cho@samsung.com>

Add "samsung-exynosautov920-wdt" compatible to the dt-schema
document. ExynosAutoV920 is new SoC for automotive, similar to
exynosautov9 but some CPU configurations are quite different.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
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
2.46.0


