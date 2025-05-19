Return-Path: <linux-watchdog+bounces-3521-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B5ABB797
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 10:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A161624C3
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 08:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25D226B2D8;
	Mon, 19 May 2025 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwB1CTWJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A826B0BC
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643673; cv=none; b=VjQBPn7F6Wvwsg1ClnBo8iE2Qlj9oS/Y46tPMYqoceymLO92FUamllUn3oB5eD9LmCBLxvz94yeU2l2qmiNsBwTpsHR4Helx+MamfuwC234erBHaHVWN8YZt1CWUcabR33jxLBzTsaPeBGVeWwLIIwlYjYs3f/1KBo7QNs7qIbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643673; c=relaxed/simple;
	bh=LoYhVEORcNdoRG4Cv8JP1GsIYuNzXKNHE4ebg2To1e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEJ0pxxju3qqmw9XR4aZk0b0ePPy7ubOzXO+cOmc8zDjt1CKOA0OdAnmL/WIET+7uAfZ439FAdXVUr3ifL+zKQPQIIoEaUuuT2Bu9OUrg0ktuijKSVjHjer1DET60JIhpSJ07XOMmshuoZeEZIZBGfMOSw7Lpb1Ms/xotygGcCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwB1CTWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OPQ5006071
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAhawXMXCUU8pDWEvZyvc7zJc7iT4tJIcjRASOLZ2pw=; b=AwB1CTWJ0j8BisG/
	v18d95fz1OCIAapECLlSYz1tgUbLnyX2qHGYy8rlpkfh3JyZ2gIJYGxBdud0Q1A5
	gdybqDqL+MnGrZc9nb3GZ8+6CIYq+hYei8ti+odOCXd5bIu4scWWzClUmAF6WTBj
	JMQ7ovtFjaiwUFOUOIG2kWBb4mUMFm4BZeBJ7z58j2RFiN6Ph1BSLH899UO7eJ9m
	/hnkXP8sTczlMvA35AiIRu/Ck7fMp+sx5+yIU8PCdDU4ZO3TY2KEYKkORNBdAzFA
	/Gh7X+KnVIZ01E7jiUltfSqLFwLtbjtDicy9wim7+OgrvCCZyrqAvkZs3myykDxi
	TxsIjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgdde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b0f807421c9so2448248a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 01:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643669; x=1748248469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAhawXMXCUU8pDWEvZyvc7zJc7iT4tJIcjRASOLZ2pw=;
        b=fc6PNAjg5erec5KYd76ZqbnsjKmmfSKxWTW9/h4QuseSPfPzp8yUUzepCiKIffJADY
         hiszFthdpUvhWyIGdYp2xeRfdC3tu9Tf7GuPKngPCICHpCPB3YQXNISLgUrNWCCdBiLH
         NUxLHgU1ab0amX7XTBoN4kSEY7Mrc0IPqnoq+tnvrDM5X/noBAs+olY4JBGJgBtnAw9x
         9aISVvbe9e265BVNSdrNF5wezDWqbdQp3Jhr/3mU/IcrJhg9nUkzEqy1+sMmMiEWcFFY
         PWIkdWjoDOwb3UV81wTFnDI5e37f6MYesZvYBqIbbgI2NahoQhzcwOOc6eYyGyqPT0N8
         o6FA==
X-Forwarded-Encrypted: i=1; AJvYcCUe3PCOhLNOqGfLEMwVEL6yum7qD1yMaAQ/UpeHHEfxqVX5TxCCeKtHrykI5nnwXVUgm0U4QfxjqR3X+6BKmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GI9qBIQfFnZLup8bCBMj2M8AHfu8tIyv97KgwoCMCHIqI0kl
	Q4J5rEgS8XIffYHXHx63VPKwC45vq8kR8D9CUSP2MyNUsbb5Ia1Nti1J4pjn5KMwHvr1QIHZ0gV
	K9AQmU60ennl5AtRFTgc+WPaSTDEU1DHUpmBwN4cpZjh8iH+r6OIph8bpDa96f5ly/tkEeA==
X-Gm-Gg: ASbGncv/OjN4ifwnuJPROyKxxgfThrSSHrHaxyFjyLTK+yNBDibn7nQNZj0UkPz5pCW
	jsDikBgGJLkliJGvP8gQ2Cf/m2YSdUXS3MUPvmqhHFQv7YGt/DnDgbZU6bDFlvI6i6oM+uW28OP
	8Z1lSmZNQs4ILVBi/NMMtFxQWY6r3wa28kZQ9O63qSz290Mmw08b5Yht9OY2R9QZAxVG7Y5la6z
	mu7FMIFtEb9j+EytVwYb4e+BlYUDjfvOl4cuRWfUtWntAAF5Vqeb0YeFCiMMukPmcuwEryAt0Bu
	Lwh1ScZ48XooW131V+Qx5DSOFwFPTWG4A2TU/zqsK5/Zd1Divlnf3OoFPWskz2LTM+Uc94QDrcY
	okc4cI2kqhO1pzxyZrRjgQOaQOrmPwKwmW9N8RYquDOc+48c=
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr15969835637.17.1747643669198;
        Mon, 19 May 2025 01:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKoTJNUEJROXcOMHLacxfq+rhAzAVq5vhHTPrQtAU4RvYCSnth/uPG2GCGaVDZ7D6nDALWmw==
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr15969821637.17.1747643668859;
        Mon, 19 May 2025 01:34:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:02 +0530
Subject: [PATCH v4 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-2-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1480;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=LoYhVEORcNdoRG4Cv8JP1GsIYuNzXKNHE4ebg2To1e4=;
 b=tAOpTDapw7pz5ivYWLsg4tX29Q5nVDoeSSfZaRF0KFwzW+depFffVI1FTq2CXmfzXas63MO/K
 T4rvtegHi7XCvpKnaqU4jGeVo2vIWOg0H1l/CHyejD49tbDgMY8vR0d
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 6tqdvEJrAXI05vbdag-oAaT59lgPsoBP
X-Proofpoint-ORIG-GUID: 6tqdvEJrAXI05vbdag-oAaT59lgPsoBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX3liB5UM6touT
 8jseedLT03sTq9zJjrSKjUQ3vlRkbtHIdmeiwchSGg+QeizUmrwRA0sDpc4A3Nh80gu5IYMUkx7
 Rwn2C42sEnKXRMm2x/kqhSqME429HeIaQEotUzEOnfaBgBDIO5fQ0NVrCoPh5G3+AWSF1UnqaaH
 9Y2tgfPUS19R8jjTNHBBuTuNBpULIJfGOhUxsQLF86qqHjabl87JtVjT1XTECtBCYz4wi6Q3LBV
 Bu7hIttQnl40N9AXTKze/60fW6EZrucG9G40rN7xu+1IvYlaySwTak9bvqytHCMFi5CP1fEIWyt
 /hTQ3mTW5yp4DTES5qosiKdQiqzf2diDzcwFDaWo6Ir10OWS1+hGawYuZJnJp9mVYpHun47UVim
 Vic9qNL9cxn7oYVpUxuEC4f4HPpQwtaDy/0+wLaUMPwoci8YYYw7j4Di8NZaP6CYjYSqXQap
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682aed16 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=979 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190081

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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


