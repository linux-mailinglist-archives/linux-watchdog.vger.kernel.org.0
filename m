Return-Path: <linux-watchdog+bounces-3652-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8AAD39BA
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2276A16BA9F
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688D829B8CC;
	Tue, 10 Jun 2025 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRnlXGcL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAF28ECFC
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563142; cv=none; b=rEJvdLEK8JMTQ5gaY2oJoITy1qHYNwbkVt98caRC2d3SDKFgujFTTf/kateutfSuWJmvyeT9zK+ujOLT6olunLdnh7P5doCm33IkuDJ6+p80+ldRI7Mr+bAjCi8kFDyvWF82zioYG8L3tgmDr8ZAWmUTKqhAQ4TNYWQjT9pIvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563142; c=relaxed/simple;
	bh=NgMsgeUzbu1NBsXjdXusMRPlVqn66otCTDVh6lp/wFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gStaoAbhCb3CLD/YfZ4QvOpHGDJdIyEdEMMvrGtyRKoz88yz669jTZSEC+UdhfJPNWQTZuD1jjQE1AUDFG3R3pcWhLPK3Am8vyJMs3mTxbfKJzix+dEYEYP/xz+vyGONzofwuJ5CXBfc2SWygol7uCGlGLL9wDi/NZqD+AleUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRnlXGcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6dwc3020013
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PafoB/3Wa4/aWlMuKHG6sO8D3G9m6I3Dvq2Y8WMHdVM=; b=WRnlXGcLz9ZroyHP
	1IUThS4u0jBvdxWJgUqSNonQllzfYsXHOEstZ92isBBYboG0FZWLWu6mzIIG2x4h
	hjhvcjZs916GnEFDWuy9046pNKXsoL5yzkfZV8fR2Gz8CmU/xD7KqUU6zlaEsjsU
	mE4qzbn620Ji6TIDQgDJn6SyaAnbypLY1jN/nyJ33g9ffh0/EXeXdSzMLvHErLWi
	DdNowpvhdnv2Z/ow3VoF7dU3hcAOqYOWKRHyPk968cbo7CtyFOq7hU7raSPFCxmE
	24smwm6tGWcr6fAnTk//LfiICRs2En3T4LWL4ck6DFsAvsFeOwGpR252MV688QBB
	K6NB0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn97p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74292762324so5148602b3a.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563139; x=1750167939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PafoB/3Wa4/aWlMuKHG6sO8D3G9m6I3Dvq2Y8WMHdVM=;
        b=EW3WTc4+efFabhM2lei7T/Q7bJ017ZYsw8fJjsvZ1fvhqGNfMq0HeiKMFUhp2dzZcU
         vE8kS+GPhG6tfcCKI1gbZGqxvn6KT7XzSOiLvObB3TuKy9u6P8phGpAkV/giBQIVl91+
         RpoXZIbRGeRnfEXjtlSjBul1v2BQHET3k98WjE08BvvaIsILB+pjsjR3LwnqzK//Yp0r
         7WDLeTJY5eNYlMqKjSkvWN6IKG4zNaQMTIg/fCj/Lke53MHjeZH4LOtZF07Y9zvgbsRr
         YAWFXPd2m9FbX6tnShegd1yAhjEpkjSOemdNMfgfdszzOAKg6hUW6G91s9RJC+Njv6YP
         5amw==
X-Forwarded-Encrypted: i=1; AJvYcCWRGW2D4F4oNlkw7GFKKf+EFQ2bL3cuP9yoRhac7Nw80ZO2FPW5kEVppyahtPO+4pmOQ/qw7hWyhgumepRyVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XPUyR6xy3I3x8yS+9eF3ZrtLA6qS5FugXe+Y4xgIACuoF9Nz
	i23uSknmczV0Qq1c9ZtPXIuGopQHoV49jq3SLtUNLh/4+pNNC5g+DSigAmYWG8uQ4zYiTj1wlU8
	1+J/wun79o4t+Wdkeh2hAoCE06bYf0jL780k0nOmSKhT2r4GZeaX8p1YFmbuvxP93Vu6Fpg==
X-Gm-Gg: ASbGnctdbL7+QnfXHiBu5+yzNBFrQeK6akYvgkF4/JWYA7oQvoE9qeGjX57DiU9dQUS
	66lthvhRIrai/ZDcTq/2wRalOQAC7A6EdmJ4+CnU60t7/0YfuvAtraFsAtMGCCy7R0rD6G1VnMn
	0dnUm5GNMWf0kL/0B7EiT9kX9xMhcvmCezR/Ch4lvHGs29aK+EqVsMqU06H5q4V7C3VfN8gcqkY
	RUGJ77rgS7mkLhA7HIRZ25bVZloxqWpSzLD7VCAYWgrUIEtv2palOGX7XjcCNDeF8ryetjJqHyX
	EB1dz6FkKaiBTcSCDTpBxjckQ3NNdy7V1tbJ5YY5GSc4vptpopFkl8HzRVfN06uMESDzRyN2V9K
	uOfRJjVmznd/QCbXyflxVtzbPXjC7oHBLAtEBQSw9mLh4VokPKsxTBElZSQ==
X-Received: by 2002:a05:6a21:8dc9:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-21f78c75463mr3996078637.38.1749563139229;
        Tue, 10 Jun 2025 06:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjjZpNDZxLb9Z6pAdAQAD/xCdCacbKubRpCZmPtfdp4I6UMK9b1IuSydPftAse8qDNXpGldg==
X-Received: by 2002:a05:6a21:8dc9:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-21f78c75463mr3996032637.38.1749563138749;
        Tue, 10 Jun 2025 06:45:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:19 +0530
Subject: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=1882;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=NgMsgeUzbu1NBsXjdXusMRPlVqn66otCTDVh6lp/wFo=;
 b=AAqKs26bBLfnLC+UHWUOLU9c8X4MRvyGM2fp3soA+25gWxjKfJX/Z5oJE4C0FOe1K6mihEpAS
 yR1KQRO723eClZQoxeIinNj83GJ9a9AUedp/9sByxmnBDpFJsEn7v/C
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: chz31Jn1zlgzvXjafhxA6aeSZqYKKYH0
X-Proofpoint-GUID: chz31Jn1zlgzvXjafhxA6aeSZqYKKYH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX8DalAcLcw1iK
 wwBHLCT6ntaKyu+D0ISku7MfGHwFnteSxaYPZl7JLvuSH5i38mhtgAxPsyCXSlIoVymL+o+VJSa
 RYYQugL2Uw3CbJXpB6HkxdyKc7bPfbFAUtcQB/Baop6WKJECTV5TC9Cl1NiDxReJIZh27RMziB4
 Tw5A9s3WVcdE/Y0aNL8lIwGOMUIYgab508gC7dpYVeYTFTriqmaJyxzI1HQC17e6IfTHiyhh5Ly
 ATi834BI3d+wXj+SoEoRrkkCrBmJ89IyfE+1tg/JYBD7AohRnukmuryXJ1LN018zSrmzk1ivWRC
 g/T3LhzCBLpP+5stH5HGEzWzhxFCQ2zhiWO00XTBv8MD6fcZB/47YOUBwG0TAjJEq5YR1wlQXAY
 UlStCAo4aCg3OVq1Rg9qyZrKCLc9e3CcSbgkhQluDythGL585ucjSx//691jkuHKYboLN4Gp
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68483704 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=0aCF2Bm0WFNHtCR-1QwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -81,6 +81,16 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the IMEM syscon node that exposes the system restart reason
+    items:
+      - items:
+          - description: phandle of IMEM syscon
+          - description: offset of restart reason region
+          - description: value indicate that the watchdog timeout has occurred
+
 required:
   - compatible
   - reg
@@ -117,6 +127,16 @@ allOf:
       required:
         - clock-frequency
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apss-wdt-ipq5424
+    then:
+      required:
+        - sram
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


