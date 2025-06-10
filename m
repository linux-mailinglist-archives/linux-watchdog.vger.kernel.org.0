Return-Path: <linux-watchdog+bounces-3651-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0CBAD39B5
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8219A3A5107
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF37246BD1;
	Tue, 10 Jun 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR3q1n2J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE129AAF6
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563138; cv=none; b=rKvVqDeffVDXIKCC0UBLW0mVF55s2rxdAd/Ot0fGQRvgm0fEA9G/yDwh+PxYFUs9e2yWfacVIqoZR/dRWtmDXXl0Psf2ckULwPFHL7uRNJmNkZOCnYk7xIQq2dUhksspMhYWznerSHhK0Op/NfOc1b/v1u/Aw9xgcS/AUA0bLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563138; c=relaxed/simple;
	bh=gRV628O4cjIUWMgrYP/Hj7VGLprVkTS/C0/4hXFUHyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz0jN7a2KIwfjh1jXaAMYSTQnqTYnP7UkBSHESaP2Zt3bAessk8vj/VMJOXNW3VQDx6irczh3U3OQmaJ7u8ogzGbEyDHeIpOt+WNKl+zgk07bCvkGMX1rHM7AfpBxOu8Qs7I1AxgeevoLRk4seI7uDv8ijpyINMkJI+TCl6LqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YR3q1n2J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6qAHl007286
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQoPrvg9W5jhvTTkdFPGa/0JYUGBtoa8pnLOQRkk+tU=; b=YR3q1n2JVHQLdr6v
	pjKEirpMjncJcsHdVXF2nMpJhR3X8SEHIFtYAzi+bWx77YUqgNrZjH7M9pwND4eL
	4m1eR6kyi6jBSxAYCwifyZAPg0m4uA3zmutKwTRTNX1GnV8YunGwSMyFpX3qeJK1
	sj0gVkTSz2cP4txCen7zRv+baCzf8nwvS+FjOP1bDTlpNj9Sm9kO84lpB8CfxpgK
	ZHaERhRw1RMFKJdPtKarfJovrRo/ue84SmRW7veYwm38QkZuq6w92fD/149as3Q3
	VTQ9xHH2gy5DNl3+D/rOYLLsSrHErmdPTm6BbKHeHG9B2hAYe5bravvBF4fR/vcv
	US2ILA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y4dnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5333750b3a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563135; x=1750167935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQoPrvg9W5jhvTTkdFPGa/0JYUGBtoa8pnLOQRkk+tU=;
        b=oq0lJeb83FNy+0pwp40Bw+ABxxtNciFfH5dR3lnTHiDpsoPQitKc03TaAvWyKtK4tO
         slctqayf8bXCRHvwa7jWtxDPZPNlo0ekesLO0JUcNBErPnNwi+mOv20csSSyxI4M+UHj
         pqlhmO4Fz0uueLbhe9MdpOTPFzMzCEGtGGcZpQVEindPGyh1XuhGGfDxnhYKDz16zQsc
         CcDvfCpHmd+wwa0JCwHvMuBTX3O682+6/wxYEdpm9qfljneXRlCD84vspeZskKJjrlRj
         UVhh3KAiYPUgGcFfs3pSNwM2t5giTmkfB06J7RSiIxoMp+Hq0N8EGdORn0K76+KHRoe4
         cqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVW2Tld+BmqhjjUtb14ZEUcicnICo/+JrFLLWmqH8GdLLhOIbqM1MN8H6jJwI5eplktUE33lWbpMMA4HDyj9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp+7sOVyKxLEJBoMWXPhjhoQKDMrXGM2NAvrSRL5o5Uro43r4
	ZL1b3mM37kOBDntGsiFpKXP70LBdSICE8eSeA+PAzq0XC9vHOa80RH6HRyM/gB7apBMTWvFEVE0
	TQIO0tUL1XinfYfxMJbE1D8Qx82W20cttXmfRd60WIP7q5XuEzenyBO09/3NO7Hdo2LwcGg==
X-Gm-Gg: ASbGncv8e9DSLmPvmEdPsNBKLGAoyY8gkmglg6heXV1L+CnI3h7bR4vVTcn6zIDI9JF
	kq5G2duko9nZLD4DHg/AGJj/P6nznk8P/f9it+vFQ0lf0EgYFJnRbHjvhZU+Q/9l3gdmd5PBRyi
	aXK4YUe+MpmFtJEKpigKxOrhy8XFx0YDtfYxK+EWdZCp3LLUzi4xRuKYKRcjTgN6fFMCaPlUVzm
	BPMiUmK6U5WVNHu/IXs44MTUayzR5Hw3/tps1cYUX+cnYI0wNxdZWH4/9/P+RNwLjpQ+A6fwyt1
	SJDnI+VzRuebiccQ471zbbrXR1QHaCK+1pRNajAW7ZgdzNoXwNqOUKqL/bUeixdIYFBS23ko+67
	TH3vvpHVuUrkNwThOrP05Iti8+KL7j8+N3S1ElJ9YUJiVqN727ssFmDLPog==
X-Received: by 2002:a05:6a20:6f8f:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21f768bb422mr6565250637.6.1749563135341;
        Tue, 10 Jun 2025 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBcdRBFkeEE+EAH0fFVFZ0A3sioZzVlSSFpOGgykRhiygclkXJi8Oq+aCuNfkRivNItmW8Q==
X-Received: by 2002:a05:6a20:6f8f:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21f768bb422mr6565202637.6.1749563134928;
        Tue, 10 Jun 2025 06:45:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:18 +0530
Subject: [PATCH v5 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-2-2d2835160ab5@oss.qualcomm.com>
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=1511;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gRV628O4cjIUWMgrYP/Hj7VGLprVkTS/C0/4hXFUHyw=;
 b=aa7tvznPKLnp0bSqhajVeSBeJlJay4tBzrkC146ZA43XpW2btA/5JFYYC8ecBuRn70TtsZCUZ
 EZ9AsHBDQIxDhxcbLnPRpMx5uMS+iITu99D1s6kQcJ30OpMty9M9jW5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX0q7J+dhmOJ3V
 Vwj30T5ouNsprd5/6Zka7aL4uXN7uBSwucmH07XJ2Hg5kAjAg/iS3OD3InOllWz/KzTXK+LIU1K
 LwRKdPXpIJ37AUVfsUWklBRGipDqUf3NXSW590Qt6vHqgGfKqvyVFNvkkYHibNmddY61/JwxBma
 5iEtQAiJ0aJzU+osMypmoMXLuvmH6FSb5XqYHdN3ljMoGpX1ICbnTmg/yKhFj5TMI9Y0HvgGr+6
 rYJRc2/9GgiYFCHYfsVYMVS+yAxac9LKuCUPDSuMqOxEjlioNk+UWGYowHqQCJtnwHJ1srZfjOG
 1TRwot6dYpkra0MnxhrFHYCF4Av8ERbAbkMpACARWKsk65FUadu8+F4ccEG3aQGGd/hC9MRfdXw
 PakDkUn+vqj/87ZPDykreQ+dhSXWXiIbNzZELJnFMYlhbkmR69hdutqweYn9u9KG0401UNJJ
X-Proofpoint-GUID: W-acVWG3MdndCqpic_Y00FzpABlbc6EQ
X-Proofpoint-ORIG-GUID: W-acVWG3MdndCqpic_Y00FzpABlbc6EQ
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68483700 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=982 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100108

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..7fdc003f210e5a69944b00361a16fbdf58f39801 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,15 @@ ssphy_0: phy@7d000 {
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


