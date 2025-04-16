Return-Path: <linux-watchdog+bounces-3316-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611DA8B3D4
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 10:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2A614443A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 08:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F8F23315B;
	Wed, 16 Apr 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FF/CFZ9k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C134232369
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792181; cv=none; b=RL7Ozh59T6wGOCowwoHXv8yBWwDRJ65DpzYa6ykqm3YgK1+xRyxJEK57XI6QcmwidXtNNNdpk1wXPzzNbaEFKq39tyggCN6Dc0KEca6i3wvRpbp8Tdntb6KLJmGxRHtf3wyZug7VU2n9Kkaxu/cqaZriI5pG3n5HSDzySW+cjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792181; c=relaxed/simple;
	bh=u+Slyka3f+K5iPRwbFIc5bGO5YI+Q+BDcS1hNApu66I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSaM8z5/vfWa12HEn+8/+IgDyH6h3D2sY66xLrr1RQNNQGrl3R2P3AmxijIW+seh9OKVlWr2CrgUM6X0E9/8wK2R2mbyG2i3f3vqy+Tr6s4wNzIAe3H7Hj410hA/sr22HKObXz6PsCmph66QxvB8tnzxjIljpN/gMyE49dd9QzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FF/CFZ9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JRtt002389
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hA6wQwwvAtFG3FutF9qg11R1y77VyhpjOoIs9S/ctHA=; b=FF/CFZ9ktsaur0U7
	NpsMuvf754grp2HPqH7Z4KKAGoWK1LCg9bSKVGh67xBFv36ENe4EzTNr2lJzRT3J
	NpKIOVoLQ0DMo18lxDJJ1IafYJc8CBRuA5XaINsyqqUmZgyMu0nXqMmxsOqsR9FX
	EiTVEzlfwBGM+knkpv44yovfsvclmOsSCx4tWPy7tnqjGD3Q2lrcwZh2tlqT2T5W
	MFajH8zSRo6Htn4/Dq4+SIbiMOUgfbKMPlsuG1JoIkZPQifK0NLLXR5Ylci/O0OQ
	VBjPpx3wLtw11Yc5t5uZBuCiOXnJxQWeOI/kmM+OVLEMY4JnLtKCOhGKNx0fsQnl
	hM4sLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbptnvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so82577045ad.1
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 01:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792178; x=1745396978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA6wQwwvAtFG3FutF9qg11R1y77VyhpjOoIs9S/ctHA=;
        b=uKi0q44Lw1wWGvNCCK0VI3RLnG2lYd7GkqVzAeyBVOQ9E9ziarPiAhQLoNSiIKU4aS
         g0IumQNIQmdKJIZeLz05LS+K1Nz/QYoyrdfVXqW3UGMn7mntOHM/bmx3T7HGyXdD0wo7
         ZG8AhFD0ZFhLR5U1P6JqysCotT30ZS/vT/I7ceZDBZFsXR0ljwTzO1N1zmNZHGB0+4pw
         O1RwNWNdONnVCX0EMHXWYi9c0Vvv/2nVzr6LFbTvLegRneNIZVXXpSyOvO+Tnohw3HMd
         DA2U/j4nuLsq64dyrO5jHHagkilsmE7to6btvBBcEdkr3z10KzNn00SQniMr297qhRaA
         Q99w==
X-Forwarded-Encrypted: i=1; AJvYcCUgcu/55M1qZldiq7tbIJ/aBnwU/ZBSUCnejOR55fqd8KfJDXMvtUca7BtCTTf4CoVWE85w4vrFS/Ekt9f1+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8AFGhbkRZR0tbhld5JaUYRQ6UVd8l1y6BBN0nO/VCrbRA4RoD
	+pOaQp5WnWlqn2uJs5TSargULecMYDNvdoTDrOSeIfmWF2LLcPwsKJ5tVo9JaYt/8cv7+zj7MKw
	mb2I2bJIW3yH20TcXIsrfdDsAIoS5unhBNBm+hY9hE0c8iSGrOLIncc9r1+qOtcsxZwDW8Bu1jw
	==
X-Gm-Gg: ASbGncv1+OMaSoFQ9ukvrrqBMlWQ4oOG1VE5bD55Cxd0mso5L8kj8SZJ70JruTdgQcH
	2YvhIRPw5KeiM6WZFsaUzi6Hl4fvYGxIifFrL9hHCpB8zA5MZBLeeSnsEOud9dQg9cVqZgkP5Lz
	d7IZqeH2qfAsjiYDgwEyCVuGH3G11Uy90aYQibOlbacLTWu2RmZSO4yKQ2dOQzlKZUllT0k9GQT
	QceBd2ZN1qopeBimiNeRbsvJ28qhPPrQdKLSt5pW4iWd7LFvpEfn038F9lCOh9oBSEj5jtXcWIO
	B6nHDMZgklFuFNIukYRFCho302ThhmNbcTi879MQbWZEKsi51VUN03r9msMcJKpvr0hj6phPzJy
	Ql7bYSSkM5suAU/J8RISodzwc55j72VNhyNFEc3cm2d8V81E=
X-Received: by 2002:a17:902:d589:b0:223:f639:69df with SMTP id d9443c01a7336-22c3597f23amr19041605ad.41.1744792178558;
        Wed, 16 Apr 2025 01:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaDikq4deNWKVGeRnXhiofu8wwXSmIJTUGMTyt/nrI9fSfoDeAaQ1w9XHoBOrxbrFgq9N8hg==
X-Received: by 2002:a17:902:d589:b0:223:f639:69df with SMTP id d9443c01a7336-22c3597f23amr19041145ad.41.1744792178155;
        Wed, 16 Apr 2025 01:29:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:37 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:20 +0530
Subject: [PATCH v2 3/5] dt-bindings: watchdog: separate out the IPQ5424
 compatilble
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-3-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=1662;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=u+Slyka3f+K5iPRwbFIc5bGO5YI+Q+BDcS1hNApu66I=;
 b=gLTH1Gf4Mgje14KDrgWv1TtP50ZpmbNYjQZ08AaafgTSpPZ+D6EmQDmjWzfkYtYvJnqVtb0Uv
 T1UpRfTUN44A7QtSaBfkbZcn6KWGlM2SBiQTEHHvS9wPMy1wKGdfZZI
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: ccafEvVu5wXTAkdxL3kA5nMsr5rXfhuG
X-Proofpoint-GUID: ccafEvVu5wXTAkdxL3kA5nMsr5rXfhuG
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67ff6a73 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=saKzS3r9oGyBWaH7Fp4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

To retrieve the system restart reason code from IMEM, need to define the
certain device specific data. To achieve that, decouple the IPQ5424
compatible from the existing list and define along with 'qcom,kpss-wdt'.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- New patch
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..e800f53381ef5626787eff1029bc94177e2635a4 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -20,7 +20,6 @@ properties:
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
               - qcom,apss-wdt-ipq5332
-              - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
@@ -56,6 +55,8 @@ properties:
               - qcom,kpss-wdt-msm8960
           - const: qcom,kpss-timer
           - const: qcom,msm-timer
+      - items:
+          - const: qcom,apss-wdt-ipq5424
 
   reg:
     maxItems: 1
@@ -93,7 +94,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,kpss-wdt
+            enum:
+              - qcom,apss-wdt-ipq5424
+              - qcom,kpss-wdt
     then:
       properties:
         clock-frequency: false

-- 
2.34.1


