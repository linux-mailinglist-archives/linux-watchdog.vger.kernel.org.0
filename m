Return-Path: <linux-watchdog+bounces-3236-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B058BA7F8A3
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3062189CCD4
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 08:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37AD264627;
	Tue,  8 Apr 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMh5kgzk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9CB26461D
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102228; cv=none; b=YJPWH+oGJ7rCH1hpmqU3WsWSdjwXGNRQfrObgPJ2+pdCRtbogvngiHrUrCl0YWlTkGM3iGyEWUVWVQA/N7lJUfcYXiNS7z7vhyWTmSELcOJbneSahw4lBHoa3jbjv++CNrqPN3elU6RZJcVN/4sCKGfzc/IIO0VLZAerpMQl/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102228; c=relaxed/simple;
	bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+wEnG+v5Gy9SicQWDfzQz2mCWPRtjzC8QKr36enm7c+SGLoxXD8YeXdken71v/45eND4BjYwWf4/hImcHpEhNrlNotStv9nd43CNPtIRBv2SjtL/K2XRZ1h/IzJ0wUiT02nnBL9lplgcXO3NYhjZslJSDW8OEtzDSpLtQJ02Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMh5kgzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GWf1019767
	for <linux-watchdog@vger.kernel.org>; Tue, 8 Apr 2025 08:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=; b=pMh5kgzktKuV5Ks2
	2YBESMxwiyrnw4nR0xSN7RZfp6utSc5b9lkS44COySojAE41hoXMvPtFm3kammd8
	jY/B5gGQq4jdI0VsopqG+f5oW8hNX1Yvv+4nYfYAnVFPPKWxeskl8mw8N1Z3IYB9
	z+6OeppTyNUQ0hLYuOKcHCJKZ0Dl7b3x0XzRj3CR+Z+bGcv6G3x2c2N50d+HlJG9
	uCtnYnENRgColE+5eVtSNJ2n43yMhC1iUyIZ3qfIhAWG+MgDbf0NTxCS1BDtqalM
	/ct9qaTVicT0SP8d2HFrHbPfX3JlgKUmJ5AvAnPo/6vEpwhHXPmiDHBw0hULq3uv
	3XNd8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3f2v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 08:50:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so4936279a91.2
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 01:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102224; x=1744707024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loRI/DG6BJeyA3QEAVzMFr8Q2pNYjDeHa+tYwjZmEhA=;
        b=uH7NYel932bS+SBSFRuj4dMMNYE2BT+fcvbSKUX5wdLu/6Y27V9IpZZD1rjO+uWoys
         4UL1haK27DhYCcUIMyA+BopS0cP2pg1giHrqdmYEd5LXb8xuBE5jHdBObrbBfVgPyQqI
         aro0CbJayrKFXyJl5OQ882FeW+LC3eZCLhAghuAH+dgkKdXOCwnBEP6xrbC3ld3hx0HW
         FHzB4BcCls+zTMgO1/iLVbmwjINxKBZo5/CE+3kFvcq3IImYOnqNSqhrHWPEzzcfO6gL
         EH1gruea35AikavnktW60ZYnXKz+RKa5ohSvOB/Mj10xWbfBl3Fj0ir0AkqQu9xCb6As
         GWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUehTOqB30zGHbtSEw3LtpePf+7MULBMOtUnu8hTz1bS6mLbWd+gue3DEiPq4EmraOW2iPjijpqU0qyDiLstA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2ayfXgd9NarcYJ5Ru/97CJ6RcmwQpU3h/Y7k1E9tXIEP7tyG
	4RZj2dxwp54W4PD8s3H8rccc8LEamCi4j1uSlLZHZMX1yOtPdpHLBSCiDiBymQ1sIKRGpGjF8PJ
	GNzxc1GIGEmwNGyG9wiFXDcJlmMGZrzgjOtTdaXqH275bNkWuChHjMt8L7TswiwIMBQ==
X-Gm-Gg: ASbGncs+Vnfz9+5eLhT3M8W3l9cN6+39XuX8VkEPnF1inpEVurtWp/F7SpgXusw1mWJ
	kD1ELBX16ZoNxmehEI/43CM9PO74RgycUIuUbCwlkI66HFbUpc0LABTxTPqw5e3LzUjzMrzuedo
	SR1CnuMIVqKwXiJB6fxIEXQctyJKEdMbLpP9TwzsoiAgwY2C3tpfuc0YjpRf02RgwI3iVMgDIZs
	cDgWK6Ry1XCyAm+JXjZUaKgLcN+mzY//dWB/TrpsDN/57t9KoBYm98TLdanc7dZmix+DCnn+ugH
	t6DbheErctOuEjlWMqc68zTWZEONsFKiXjmuC4g0etetfWIVYGMdHy1YI2/mXuE3Jcc3p11Fi+Y
	9xEHcAZp5LTYc0fmZAflJmV1hEsiYsro4iiSA/WcO1XU9GOzU2cY=
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952895a91.21.1744102224156;
        Tue, 08 Apr 2025 01:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOwLSckL+yWdaN2uT8q2dSYvVISiMLUMwmKOZP5A/vUS1nZ9ejcw1TqflVkrhpjEqV/veqig==
X-Received: by 2002:a17:90b:254d:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-306a48a6878mr19952879a91.21.1744102223831;
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:23 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:56 +0530
Subject: [PATCH RFC 6/6] arm64: dts: qcom: ipq5424: add node for the
 restart reason information
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-6-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=873;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=M8s7BxCEMIKIVssuhwE1Qzjds3ely+Ku4yT4Ok75T/I=;
 b=f8fhhU7k1xmVdNeYHDyzwFQAKC3YeDSuh8ItfvAVxu80upvicUEB4pbPW2s1FggobjsQtzrWV
 oe9GPtl/D1DBBF6a4pqG7f6XHIFt3k2MVzMl9mR1RHAp2R291G5zKfq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: CxImL5lIwgE4SuR0j_Rd7WxHue8jJ1Xh
X-Proofpoint-ORIG-GUID: CxImL5lIwgE4SuR0j_Rd7WxHue8jJ1Xh
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f4e351 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-3m3cBowUQCSrRBqnYEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=864 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

Add a child node to the IMEM region to capture the system restart reason
in Qualcomm IPQ SoCs. This information is populated by the WDT driver via
bootstatus sysfs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index a772736f314f46d11c473160c522af4edeb900b7..d399ae506748b22c1dc653d357c6fd071dd67f04 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -493,6 +493,11 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart-reason@7b0 {
+				compatible = "qcom,restart-reason-info";
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


