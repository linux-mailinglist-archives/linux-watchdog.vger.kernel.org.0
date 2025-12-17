Return-Path: <linux-watchdog+bounces-4708-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D89CC70B5
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 11:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF530310EB52
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 10:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB11346AF9;
	Wed, 17 Dec 2025 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQHdIe9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvSCW+WF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909E346AE2
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965127; cv=none; b=uQQ/wgyZHvfgCP/UaidCSjdlA8ppLxl/dSneKhZ+x6taYF2obj6uOIL/P1aOM78aIVjO1wxK95OF1Tdeud/kr7S1Dioff7QzbLegowI3ioINEnndNmSrTmrycahwKno1Jz55i+H3jxmMoX5/XCk6pfRGctVlSlbYFGRRcvu1TiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965127; c=relaxed/simple;
	bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BwN+LtbiEe0H/0IbvKagjvUPkVPs49H+ItE+neqS9z85/W8nKD6OdmyKaxfE3J1SEuy5ZYeCtCAq1Px//1wZgU7PHgZ7Q5TEPh/CkHEEHpIH3eNJzA2fxcjz75uUZTl5GdnV+WwWL1cEpEX8P3i462MXgvtJlC/fwb5P8HWj4fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQHdIe9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvSCW+WF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FBXw1591362
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=MQHdIe9Se7dZvplx
	MjH9W40zW1fX6er/eKkIGhtY89dyda0YX+1xufWLqGIMTJpZVfIgw25mVOlq9/Hk
	uT9WDyIRfO6qd9/+zFvWq7x1zrPdFY9PUFUkT7thUu5XCCsbFHraDDYJBUHchIWP
	stzzKQtIzYkjEDtwS+qlSjFOhVuc40NU4bA2KCapDEqVyucr3D35km/lZYx0RG1k
	KFOFshuQriqyoTL30rUcQ3k2/pkwwJrPzwKJgShQS3y3bmYhoKbaAKQ1vA3/g2MK
	z8qi8mh0wqohHpmh676f6YzIXpgHcr4fYlq+rwaTZFX1x7+Tbbn7D02S6kvM6MZB
	/pnMeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefhxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0193a239so57248141cf.0
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965123; x=1766569923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=JvSCW+WFD/k2tSCGc42faolsGD72D2prMMmT6XrTvGeKEjjV6j166BnmQ/wzci0Wmm
         Rn8qFACimdNDNLQrNpgJ6nauc55tr/KVFiN7aI/Kq2qw/QRkrV0FI+QxSl8CVZuNaevs
         EzWfjs8byyEWbQBJOMYAkPJ21mFHTjfVT2lt+Ggxuzi9/q/0EuVDozEZg5N9V0pOv8Vc
         s9qRG+lGjLAC0WYD7U4iuQerBGnEVlD8X1eHHRRsoFYvSC3oCNPodSij1qfgGlOTpmNS
         J0Zf64puuloqYXHinT/PSLheekaRcLE2cALOn9pnbR8hW21zEuvQomwQvmUQuNBA6yrN
         G1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965123; x=1766569923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=DqKGzSbkkYDNt67mfrA3zNZTdkwhE9uroQK3NOC5c9GaqBMgTVSwjtCBvUYfYR/BBR
         tE3sJ2xd571qLrK1cfOMios3AT6jxeAgnsUO50aqrCJcumT/XqLH1o2AeV/3rESVAoD6
         GkoO5TXwlLrxURUzDyVyr8cE8hzx6zOlk17VieKXcfKqnjVvg9EFlsiL3Apvz+qhC4c1
         BMbUCSAbiSezfshvJQMbJSh4spq27vbIDrsoSZrYFn6bVBgiMYzgCrilNZTf+757YNo5
         5qrI0G3zzcwoQZiTRWNso8T+wM3BBvmCLcM4/7k3ZmB6cijnn1WJGVPn2X81fglfID12
         33IQ==
X-Gm-Message-State: AOJu0Yx7HPznAcO2EQ7ki4u6fJipObDQTc2l/jl7V4eWlhfjlHGlHCRJ
	cAFrQnMeD8uN8hQyTbkJ/6/cn3vME9EIr6EwjMWYPX+Sn3q19WGXHK9dxQL9ynxrj4diBOqYVR5
	zKjkLoDIjrJvGkq4CQo763spG7DbEUp2usy1dG2hgxd5+uX5E+T1O1lzHtIif8966OtpMig==
X-Gm-Gg: AY/fxX5BKEUL508gbHpbW07xRVGjmGMgoImDTiHbXRTMih17pBOXs5ZvxVwgJvzmwuZ
	uRR6GBsWBpm3ZeGmVNde2+aERXfkj1Lv3spqcYuGd2SdLcF7D4g5vnTirMMuEJkqNXKJE8xAeph
	8PB1VAaoii3zxJTtc3Nj01LFe37dOHSRcYWXoYBQqwhfLGkNKC1qsFAu+C026DteSk8T92FYSvY
	+Jc4/m2QJD7pI5HnnoTgY5octKCf9P8XK/TK4xBUaekWyEjrzYRLm83Zvfn60Wfs0MJLaG3YrNi
	KX3hzwlkfVZMz4vA4Gs3bSvxMCkQ1JOAAKYVw40L04A8E3cgxnRzgo3o45N1GGXFZCw5lissPFV
	cxH7a+vTZV3njk/1PhsplS4l1vXR4mSwa
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963201cf.72.1765965123219;
        Wed, 17 Dec 2025 01:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXkNSdNnHweEKikyXzlt4EEB+42BULtBSNK+x5JvVI709mhaYmQtx7shg/iQQ5h9VEtm7Axw==
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963001cf.72.1765965122786;
        Wed, 17 Dec 2025 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:54 +0100
Subject: [PATCH v2 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-1-79d8caf65ec3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn08GwVfAzRVxrZFPlAs3C1xZM/0gJe0MU5Rm
 pLwZ1LKZcKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PAAKCRDBN2bmhouD
 1ySMEACKiUoyvl8N31YiC7Iz57fK+ZWem9zh/ehs6hC79j8z2BJMFD1WY6h+VsBUOa1i6StrfZK
 9gcn40aqruCyr2iRSPoZimiiCu558JKaSMdBO/uzpPu5Jd7/1Zlrr5E/onbXQycM8SDKLU5AywG
 jPrxcLzc2sexP1Ccv7Q4ZYnq4k8Q+SVTlCEzqK9t5X1eR2rTcsmZF4kX8e6DFAFU85aAWpF4kX/
 ynSmTHh/1KM+t2RLlOV5W3eAOEWrNltqHkeQPqhCNl5NQNgTUWGPNysXwo22vvjJF4Hx1EwExwh
 82f7KRcmJTfp6qahAl/TZ8pDgZ5eNpHEoaUNl3wdzHrVhsCU8VoA/zCnQQRFW3AHgq8Ef22UJ8K
 GtD0qS0YQklDbnJVN6b+lye2t2A9cis21XBQCwuxTRGyi+SJ86TeATwHCUFkJ96ckwh5sC9WHjH
 E4OuszXo2CIYLDEwHfWM20bgLHr6ZKCq+YqZfnajhxK8GhNkzu51CRqEvZbSko06X4TbCjCFjrm
 clS6nXAxJZOkbj6902q4GTmrnDkiLx6zjX46FomgCdsfkRxskANzHz8xmStMjQiMNxGx5FOlfI8
 7ccWbgzlS+g/QSChJ9WF/36l+Mwvtn8GKTkkDgySthLAZrh5WLBVE0z8u5pUWlpt3uTxugkHRv+
 GyfMQFtOBD5bv6w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX1mGek38ZcQLO
 V0fHR2WakWBmhzu02qGx4bWU6oNqm1Ftz3o3bIt9zZHI3Nx0a+Y4OUeK/vopnYAzLxSCcFo6+uG
 nAzHU/YBzC81Ho+6VUKVt5+BTzzqsVM5PcD9PD2H1u2CNfmj5meME+MjIXDq1nJAMytnO+q2+SC
 imTW3lLhbnN/tK6C/D6+6hCC1FXlWg7vfF2i8gRJJh73qEs4e8S1+L/6FehAzpl/tR5ZpAivJAY
 iw+YgQ/2BRPpY0bUddtQNqdyoLybLNL9B952xsm7kGtbTyKeYrFltBTZwBXt8q7po2hFwGHIbMi
 gEQMn9Uv+KDc4Xh3rRgFX7lcO2tm1sdzF4t5w83JrA9Esv+0aK8WSmLcskeCMQIhB+W4c1eg1E1
 O8KdsMpjoR4vCRSgBj2KkxCo+dpjEQ==
X-Proofpoint-ORIG-GUID: aXKxBxNOaa6SmmZExo1b87SMXUY95P7u
X-Proofpoint-GUID: aXKxBxNOaa6SmmZExo1b87SMXUY95P7u
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=69427d43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RUZyBBiHXQlI0l-aNaAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170078

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d..445c5271879f 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.51.0


