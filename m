Return-Path: <linux-watchdog+bounces-3315-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B18A8B3CF
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 10:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E2CB7A9A0F
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3D922D4E6;
	Wed, 16 Apr 2025 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FELFO+EJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16B622FE11
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792178; cv=none; b=k5COQoiglzlJ3DH+H02HJc/2humve2+pCj4n74+syzinomDmvvzy9DUHXUZg6SZBoIPgW2ds2CAfj3f6O+iF/geX99CgiRQPTCS+83embhbOjL6DTiZYWPnKVP0vDcaJB10HkEw7WlF5QuVCmr+BbiC1la9P9G5UcCdIFoaPKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792178; c=relaxed/simple;
	bh=na1/Zw24hI1uKkKNkkoiRtkTYgr19cUVzwcpNyunse4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JWgEOw59KIzh+ntqKeaN6H5LbmswSUK6oBfqr23Ptotzan24YPMZQhR3ICFvE6VHzAhPXlsXPSCYyw/83sRVHwqW0u+k64olgJ+E0VrQp3+XXYyJE/RvED/4svpYcumIvJAmBMJuA1M98N3KpvuBfLWxjcwYOwvBwXIkICx3MgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FELFO+EJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JiE8011446
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWARJA4TOUUcn5s9GU1UvI0az8KnFVRHVyq68Mr6JyY=; b=FELFO+EJk3iTsq3E
	R1YaD2noOJiXdFukqikMq3veVSAns5RdQ28BTrRn/M46I2RR4lfuJ8kVsCLMFr2T
	ygQz41ddOJH2j0XPzNEfi+CzuYKKAMel7hNUIKimNEqq/MyOj+Dn6mg11yFWUk+5
	5VMEbSJWcfUWX3U/TmI/qP0lbuEKX+17pqu/DD8A7xmciDli/I9vP8bjoZpUjimm
	Alm1JaJ7veWLh4aXiOiCQlJFDXzxvmHsaNhA+e0p4nk3PcK0ncMYOZhqM88Kt9Fg
	reiAB68hTp9hwC4BaHDVUn2xCgo2WMAUp/Y9UjLhFd+2EfM1Qyxv976um6PoKKN9
	gD7uQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk2r3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-229170fbe74so54651555ad.2
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 01:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792175; x=1745396975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWARJA4TOUUcn5s9GU1UvI0az8KnFVRHVyq68Mr6JyY=;
        b=MPjFJx27j0kcUZGESa3Gz38wkUBEFzHkB+tySltlRUNt2+2s85rFB5au+tDV+RR9Ru
         6APHYYjPDysq1PD5bYxMtmy+owSABSNb3lx1O/VPLXdMcJ+QF8KeoCAFnuAb85nBGxPP
         3wvlzYfN0Bek5VMgyacBa/VR1gvRKxXlQd7jVCrRO/Inu1ZEeOUzXFkjOVu+BqgK5xoF
         vdQMn4s/KOOgf2F49Gb/Bw0WyDkBD4VCIDn9oMW8Sgj0/l9Gtrj+NqhQxyOpi92nkY8t
         C+FPoP2Ll21+l7LObZB9WUuO67lyLoASq9WHPa7ixgKEGD4WLN+qS067aFcW+MAjnAeE
         z3vw==
X-Forwarded-Encrypted: i=1; AJvYcCUGkhByTBBVEESectqDH+sP0kLK5z3zTyaK7lHMCGFSFgD4cZXVocDjRgykRkP95ki58lIi2bJs3sQV2Kr0JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Mv8YpckczIe6dpfuOTNMsZ0LRNXAAheyAeRMS104X67VHUNj
	fbTKnZ1Wu84QUFOh0fH/tYIPP5/D+t4cVk/nlxDt83A1EJ0xXJyQY9KVqDelrHQeOUR/Vs9x009
	YPAzYS9O920zyxQrOiZzvDK3IJLbfXzWnAiTLj9s185TtzfhUtadeZWw4I+3O7MdNGA==
X-Gm-Gg: ASbGnctCkE/FkQPF1oy1tVCzOlzPiE2susfg08gNF+J1/9AMubskx2GL3atsdYPqGt3
	qucA6lc9Zzwfq7qNBDRwAaaZ9GN7bfLcwsY5roWZj7hA5R27WFTm8GofU0KJ8y56E20t7IgejYc
	wVYpotvZOSY8rHyTm/9tyY8RI81V5BHfLsYn1+i3RtghFlFuSCxUiQm6OqGSssAegfSLlA8iI26
	IS4xbgI9bJyY62fwchuuvOFmaB8qwNa7Dtu0WsLIuW8ST8kY0ndIoxnJRul/MVgUHTzfloa30lr
	jMWj1F0vTRaAgBc1kacai6SelGsQF1ZcFa7Q5XkkE/RRlFKoG7ZnjcsqBSdjxsLLdV9xCpz0+3Y
	/qbyXKWIBPIDPRl7bdDR1jnxCRIj3McCOhpjQ8Uy068kIN3o=
X-Received: by 2002:a17:902:db0d:b0:220:faa2:c917 with SMTP id d9443c01a7336-22c3596db15mr16780735ad.34.1744792174752;
        Wed, 16 Apr 2025 01:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG06rUxrdzAHKOZGs+EmUFQ4eIFU9Ex60xOVoX1QsrCuGTbmlzASmqV0FH4//IiXg4bgYsd6A==
X-Received: by 2002:a17:902:db0d:b0:220:faa2:c917 with SMTP id d9443c01a7336-22c3596db15mr16780365ad.34.1744792174341;
        Wed, 16 Apr 2025 01:29:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:19 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-2-c65bba312914@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=1346;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=na1/Zw24hI1uKkKNkkoiRtkTYgr19cUVzwcpNyunse4=;
 b=yjnfq6g2dSPN2XqgCgNy6ddNjI3ndxAMrR4pzsbwEpRmPnnFBvnc5FqqrWEejDn+lU8Iz9Ef7
 y57tFJLJdu8BtrZDUzr8NOENBpRmI4IfieN6worrjH2OBI0pnB+Imab
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67ff6a6f cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: x7l2BxHopKPGNNGNNbBeWs18GDOdp-P4
X-Proofpoint-ORIG-GUID: x7l2BxHopKPGNNGNNbBeWs18GDOdp-P4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=897 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


