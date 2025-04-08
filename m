Return-Path: <linux-watchdog+bounces-3233-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B352A7F897
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B14B19E069A
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 08:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7D926658F;
	Tue,  8 Apr 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtqcE8Pe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3A26657D
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102213; cv=none; b=tcLov1nnYW2dp6ZlovwJVro5A/L5n2xVIuyzSo0S4CHHPti7bIUMwQ05zTEFq5EpzQl7XFLmXYyI3U7yG/TWyNDcMcDTfHTSeOsRfR+J9Am7FDpT/duFjgCmBHaB4IH4cy7STIuaOZHLRk2+4FoFX/Bbz31xfTK9bFSenCGwMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102213; c=relaxed/simple;
	bh=wg25rGgJb51l8j90aiDWVM9XpCM+HrOAyDR2G1yCzu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkFdTLQUxl8X48HDwnqTPpE/5u2MEcTFOMMtmHrSPZIigLio4GNooLQxTe1Ntae3buyP6gMHvwh7nHv8Vvn16QW+Vk44dWCogSmhigeQ0ImyL5Q7XgNYhnHMuRZv3CT/n4vL4FGD42FMBzqu2uanhV8j5l+3IxUHHgAqFQ0CHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtqcE8Pe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GYU3010566
	for <linux-watchdog@vger.kernel.org>; Tue, 8 Apr 2025 08:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27NBhoEy2du6Q4/8LfMbFlMU0Ee6Sl5Su0armAPxRpY=; b=mtqcE8PeN3d5NzIN
	YeuKQhoiO8UW5yao1Po4LBOYR//dDoUebRihzHtX5ui6dGFQliAWW+oFT49+rR0j
	BvV34MAlhXw6NvweiT0LHibGJz3otoxsDSAiAO823L/kBCUET1JtM8gmRdwRo3MZ
	gk0J0ec68J3d2eOPW5X73h6RYB9vrjj16ZdHIS8orMPl2bYbedORW1Dh+J2FlrIw
	DTL5ngnzXTqtuvVCw81pbkHlCN7SGtA3NZKLMI4Laxau50/s7kzegNdFjswuMqrj
	yXyFz7kK/ZCUONk6W1WJSir1HqAcbRK+aGb9BrYANLEIsBGxlhyI+87B4iuc/ut+
	50exFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1f0m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 08:50:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so5978761a12.3
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 01:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102209; x=1744707009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27NBhoEy2du6Q4/8LfMbFlMU0Ee6Sl5Su0armAPxRpY=;
        b=DSJJbRGWmyIHQVYaYHQVCnLW9EicGFzCn8T8VkeM1QTnN99gGXrzFGYgMtAAtEKKtz
         NV4fIQrIx4kCcPYdT+j0AArY327+hrju4J7XDu3GV5mNCC9kWIADM+jbbd4h//+eZ58i
         pvDI9+28F8Nnl8cCHUR60ZzHv7akvr5vyCb/4uUJ6LT8gfKHJt6BV8I4gBWLMK0a5Cx/
         kUPqSeikSwnWFyPZRbgjkAPY21qRs+1C6sOSSOR9qEQT5DDFM7Q9cGjDTxHzf9OR/6rJ
         94JdQjd7B2xMJjWSaeu+gQR2XjdQJlxp1UpR2RjkNWnWk7zHAqLgfGpb7o2xzm2uD0Mh
         ZHyg==
X-Forwarded-Encrypted: i=1; AJvYcCXlH1UfX60wtEAUeCU/2YkcDwAkPQwXRehnL3oHLsXMRLf0wvPFFxZx6qrownkgGQGh8r5cE/STKEebzHX4JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBL653WMsNf1uDxTghLxtdQ1/+VoH2Is/oDfztYacbn9XuwVfi
	N2Xk8yVfw2OHaYFdE+9+eEbtN0/0jn16urKVkiQzokOqGpsKctVUqaxXOI1FopICdYCLOR//Be0
	kJ7OchBuv6lbuOmPSIim2Wzd+xBnCFbAdzXUsSshMTZIIsgUQ3fziEXqygxjPY5bjYQ==
X-Gm-Gg: ASbGncuHfYnzrapRebiqSv2VGib8E6zMMktNgKrQgS/KfxzkcVpcGEsrDGdqsucqC0P
	uuAKQzn7CL/+r4+80Eom8Oxm8NNCvGw13PfiT/mYbW4aGbTk8cWGuetwc3zjjXFtfM3zIi1pTGH
	zkx28gvqW7LDoyGoqe3qWGLq5PB7U6M+9bg8rcH0mA546Q74H2wuP4geSvplgVpIHnSFzYzDASN
	lnddM6SutQWgq31WGJnhQEQA45V0aFbh4DtoLuU+8P+XfMut8F5WwsRFtsrKGNXOhs0ErI256tP
	25gY4TYADSG91MAq/sHjV3PrWVJR3TuCmAAxKjvABhdFhRSanFQOelGn5MZ8ATj3WT5K2BjJkVN
	XdVxDYNj7PYsAAAqT2dHkXNtqjT3aeI/mDffTLyCvgirW5fl+ydw=
X-Received: by 2002:a17:90b:280e:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-306a48b391emr24196801a91.33.1744102209268;
        Tue, 08 Apr 2025 01:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfGlPsXrOJLeQRSEXfWds77zcH9NxMS0qbTvAKAsWWWSNrFeI0ExEzN+bmcSgAFTWCM6YeCg==
X-Received: by 2002:a17:90b:280e:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-306a48b391emr24196767a91.33.1744102208887;
        Tue, 08 Apr 2025 01:50:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:52 +0530
Subject: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=1136;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wg25rGgJb51l8j90aiDWVM9XpCM+HrOAyDR2G1yCzu8=;
 b=nRs4e/njdUA6zmbiVfwi1g4hbBZlP6yyFq7nWXpXrnSrORfevKpgfbUgV3C0sVXWRmaUBqxpO
 R6M0TiGdlCZDTteK0mBwkorzjh5jQTtZPPlvCir/dMT1wflQekx1ZAy
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: s2hUeLsY6BK6O4ABNmJiS6OY4xlEVFFO
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4e342 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: s2hUeLsY6BK6O4ABNmJiS6OY4xlEVFFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=652 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality. Corresponding DTS and driver
changes will be added incrementally.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1000>;
+			ranges = <0 0 0x08600000 0x1000>;
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


