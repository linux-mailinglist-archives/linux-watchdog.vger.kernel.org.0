Return-Path: <linux-watchdog+bounces-4711-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE177CC6E32
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 10:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E70E63036A4C
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 09:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BC8347BC3;
	Wed, 17 Dec 2025 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laq0HF/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juKMJUSS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C92346FB2
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965131; cv=none; b=Fu7p48+7ZDjzX7u0BEqadNnQNbpBd0zKAPxAtKyGZo72YdMqXmN3zp3oRy3YP1dzfIl0/9ZbuPmzQ1ALCvMayvSK9xWH7L337kc9vX/gC6ICNZBO645MzvKLl+O4iXy/ceRGaOt5rmUVHqrVgrttFBzB0RJ7hRsaYNEaw+xZYmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965131; c=relaxed/simple;
	bh=3n8ScSa9U5u4J9FORj/r+W2S9YcBhcL6ToUsDlBBb8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGZ+WpqCSibKPRNMakCiNhGkYtr+lNBR2cNZt3lnoMJgXqO/sIP0Abva/acMU38kHVUVV4IsD++cLwaVjnSp8B66NXW2wlHeOwkoN1XJeeAgB7pyTQkFRVu2cVTGSnzKHge0X668VZckDR55TU6s1RHO9FxeP8XDgIEZyGOkYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laq0HF/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juKMJUSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0qL1871449
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=laq0HF/LGyXfijqu
	FTHG4rbbN7SEiZsOUGovNlD8nXA0T65Gb70OzfkhoEdmuMi7s2jUyQjXrzJhyePm
	oySKe+8VcfuZpVhcJEUwu8egzrZPMqMmsUHtyYQhyPrBa8zTujvepb06Tw+vhmql
	G1vb3NIkVWKrNEisJZcQbkuN9jy0NuAKQ3Sf3ESdiNIrO5kfoto0UnUehgORy0zF
	HCj501w61dJMeqNHlMaliub2C3ZwEqhnufVZxLM2eg2PfgdrRpmZ1qu84rz0+pc5
	SSqp5foCBhNc3B11x8R4SYAN2gfM+5oyjeXSFkaqChjiKadoXJMrcYHjcjnjxvOR
	pRGABQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9g43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2cc5b548so8890976d6.0
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965128; x=1766569928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=juKMJUSSj09dgv5lrSJ+js214tk2rkexd5Ma6LRK2ociHT2cDhcc6+Mg5S7ThfoP7v
         Y/F+mJCyxF5tAGzcXGrlGuSWvTbfyKICXMn5Mm9hNsti9G2V5Bv1P96yOeQ5oN6DXGG9
         3lr/JJUK8Hnu6Ujw3oOmzWU1JEenNghnav957L1mR/kPdfyLt4zIghRw8FpLymoitkwJ
         A/PUCwqioakgmI2G+bCDmSDT+xFOGpts2nSQ+fTs6qnHUWOsLZ3EGR24oA/HxaewI+HW
         B4YfcbxqkCcM0hRjBUCQIM/vM7MZqdtwF8g67qyg9IOz4GBjIGjntmvERXbmx+MjJw/v
         746Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965128; x=1766569928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=tTpCuvCQtpNgasrqoch6w0o5uHBNSc1By79ElH22C80lg+nILCB5EBYXBeD1ANbdTf
         G7s6G+yE6MJtd7adRBwLaAaICPCj9G+oo73q9Cc011exN92Ve6ZNNEmy34BriHaUOqCt
         lBGN4ctwq/lrYosbvKfkMSbX0Zza7giw0uGvk1qIT+e7/oezrHxtS4r96ESg0hXppTza
         q1FpyOlmVNAGa5dXw67ZysU4LSYQ0BpPTfroDx5OwiUPkSX5Dh1vmOV8RdOdpuysB2pK
         jcyHG/g0T6LjI+zH/sDMyJOEBC7bxm48r6PLs0q2etSrH0F6E0hbSCnUAegtn76o3iD5
         iBPA==
X-Gm-Message-State: AOJu0Yy1z/Qk6yV63XVaOjOGBHdgHuIB97eNBCo8pAzHicvFFqGvOouP
	AjY0KjRCCtzkdxyaqV156+FacpDnZxMR7fgk0p024PUuyCEFRrS4QOyCt7UpnWIarXDS1TYGh5R
	8oBncqZnftH6nxcfLoO4Xlm9XGV9EF+IyQrV0u0FzBqLmJcNiZPAg97qDihxbjnji5FFXIw==
X-Gm-Gg: AY/fxX5hIrPz5hF/5XxVTFZbZPtCdlvvQtrHfQymcTVj5ZxQ0WHd4GdTbvIsyFzmNWh
	s5EQIeB/yGj8JcpvzM1LzAc34V5Qw1u1unWBp7Alu7QI82JXVbxOe471HLEo4gZ1TreOoxAom4m
	O4ISgxVvGvuX3+/yz8X6Nbc2Lh7Ha+cPTawdNvQlejyjHZPuTK1+B+cYF5Y9GWo+cnAnkECGckc
	XMTkXCdAwipzXA38QIrIrHnbC4doe6mklteAjUUf6BhaIswo0MgH7MvkTVTyJLjCZ/7bEgSJZbw
	ngajqbMb8zScsV8czEXbiTcZ1Y3JESSJYs9m7711e57zEcuJw/miSpwu1mREbpDSYGr0H0Pr3Ii
	PDwUimeE+Rq0dMTewAv9dAvILQBKDZndJ
X-Received: by 2002:ac8:7f13:0:b0:4f0:2211:d08b with SMTP id d75a77b69052e-4f1bfe5615dmr312364091cf.33.1765965128247;
        Wed, 17 Dec 2025 01:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsdR4N3vHyv8amDOPM/OH89kFgMV/Z5oKndrL89pNMc4wMQxwekHFD2SeSkPhEiaDcPXyjQw==
X-Received: by 2002:ac8:7f13:0:b0:4f0:2211:d08b with SMTP id d75a77b69052e-4f1bfe5615dmr312363981cf.33.1765965127700;
        Wed, 17 Dec 2025 01:52:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:57 +0100
Subject: [PATCH v2 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-4-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3929;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3n8ScSa9U5u4J9FORj/r+W2S9YcBhcL6ToUsDlBBb8w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn0+2GgQ2ETAUn4PXAy+s3AdxFmkRonLCHYok
 G+Ib60KmcqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PgAKCRDBN2bmhouD
 1yxeD/0cQIN6Oy3QfGVCiba73/vXoSj1fnzE0ZaYR/b6K9i75xua8CCcvW8mdiPzW+rWSNBUtri
 +45+dwL2x1XbjN9qf4kLaAgsqR/PoER8qhQ0AROmHF/xy8vACNA6QhYarzeZF5DoPQIuCDa34YE
 hNPyG9ifW1sw0Glv3xa2u5JzbyYJhf9XtySjYdBZq/dkdMayQTwK2GnDMKpm2ztXL9zlYH+Je4k
 7XLAB/XvNEAhyKzNarDOa4084QOGsK3gXzC9XbPwmJHSxAwn3luGaCqfdQLYkTCna8yy36/tT20
 bPzrcnzBwHZZOQ94Dt7u0AKdCix07LxYTQjVVFaT8xiAP0RVUFTCHo2y3wUM+IA0VlzouudH5L7
 coBvGE/90gCZzgR7Qhvhq5dSis+Ug4867hTUOQKmHT54xke3EoroBY/RL8D41WqXIpOT+ZF0Xhm
 2qIaYPZiKmnWPPyDffWKNgS1hJ8g+ucMgDHM4v1yueQovcD0+axcvyVfJ/122hZ0j+ffTkX94gP
 5UM4kXOxh9NrReg9HJgl5HSAj4E0BmW8DbpuKIW4J+c9BcaU2UefRfgZtvDsqlTqQI5Vrt66QKI
 kXAnpSmkH2MfdnhH2H5s8d6U5kRPDm+SuygOffxjHJeJUOKbKqD0ynu20UsecCV2F8rG1JU4th+
 hUCAjzLdWUi6IfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=69427d48 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=l-N3HDM6Fn6Kim4WiOwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX+JhG63YXTaly
 T0v0ZUt/sUYOIp/dawU8YFxXl3AszS41hQca5VHAJopeADXhA0itw9UpjTmFlFuoVv7gT1B89Y1
 bYKYYzWSFfKXUsQ6nhopFXy219M83VsoTE4RXv8q2vOQZr7XUcWmOiPGROP8tt2DZ+tZPR8UU6H
 XNLUerl/AObMIAgxdq6kL+8dr37A4Ok6DNS78xCiSROJQ5fx9cODW79Hkk0fi2zoYDXH3uMjgmq
 oBUssXqebMVZFq+Iz77BdhUDdE0nzy4TWzKa8yjXArY+MoUHQR3R0YHw7CQ2Kxcy/RHIJaFpZVY
 7xdCbu8XKY5UHWIwv4XnB/dyjGShSpSBGS7S9GJPo3PYjWCs/DJZDgEmmRtvQazhysw7TjPMAFC
 QlUdfvQiim3TEv6YJwQMsU87cGUdAA==
X-Proofpoint-ORIG-GUID: S8nOi4a8Xk0YjTNwutphLKQtUpFQRCfx
X-Proofpoint-GUID: S8nOi4a8Xk0YjTNwutphLKQtUpFQRCfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170078

Binding defined two if:then: blocks covering different conditions but
not fully constraining the properties per each variant:
1. "if:" to require samsung,syscon-phandle,
2. "if:" with "else:" to narrow number of clocks and require or disallow
   samsung,cluster-index.

This still did not cover following cases:
1. Disallow samsung,syscon-phandle when not applicable,
2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
   clusters.

Solving this in current format would lead to spaghetti code, so re-write
entire "if:then:" approach into mutually exclusive cases so each SoC
appears only in one "if:" block.  This allows to forbid
samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
to [0, 1].

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 51e597ba7db2..41aee1655b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -74,24 +74,7 @@ allOf:
           contains:
             enum:
               - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
               - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
-              - samsung,exynosautov9-wdt
-              - samsung,exynosautov920-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -104,9 +87,41 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
+        samsung,cluster-index:
+          enum: [0, 1]
       required:
         - samsung,cluster-index
-    else:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+      required:
+        - samsung,cluster-index
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-wdt
+              - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
+    then:
       properties:
         clocks:
           items:
@@ -115,6 +130,25 @@ allOf:
           items:
             - const: watchdog
         samsung,cluster-index: false
+      required:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c6410-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
+        samsung,syscon-phandle: false
 
 unevaluatedProperties: false
 

-- 
2.51.0


