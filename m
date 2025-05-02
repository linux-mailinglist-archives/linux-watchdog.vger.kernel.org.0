Return-Path: <linux-watchdog+bounces-3411-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4AAA7337
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC884E1112
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EAF25525F;
	Fri,  2 May 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnXJzSlf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDFE253938
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191899; cv=none; b=S70CAcErXZcIjIuMKkCKSqcZ22h3hnNbLP8BCC4S5WARvZ1ge/AiqxRndq5Bb0ESkxG85LPBNhueTR9Sth6hNai1BnWDEi/YMU3rST4HDqpdBIF+9Ppgx33O5YYnG9GKNgdWDoviVRXafNHXjIrOSEXRfxNfq/toAmRwY6M3FaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191899; c=relaxed/simple;
	bh=QSvt6ky/pJ8+VntHnwTRnuK5ob78/so6X2MfYNDfB8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAhUFaM3PeEblKHrzQM4HAjmA0+AwSqtDaQ9PCHf8RjNaOMjnDsd+v0bTFRs7AYZOjXVdvmKWCQ8r1oOWOwad+wuoN2yQKXhNCDbehPTqZ4USHzMjhAzp6pJ4Qgidb+Qbim5dR0ZRhyf0OrfloovFbVBC1UTJf8vpT9XymKBKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnXJzSlf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N6Il023012
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6s4iQJFnCYwc8Njw/Q7Od3/r3Tk3o0yQdVDAkClWD0=; b=FnXJzSlfLY34wiIg
	dQGkI/aUCoZ4pYufIcjFEsEM+NhNNkZKfhkRI6Z0YClsupcsRKUAwiAgbF7d1V1r
	HcmTO77h/IGBz2BMChQzt1ixMFGz+QWUzjOxbgsNRLWM7BceLyPezxF/m9rtvmLG
	MglEZRJ99jvCYTdjoBqDcHsI+1nq2syzstgEAxRAUB0ALn5K92pIQV7R8tVVDIHU
	Psd7f8PT8AV/hw26LgYhooBfGHU/Sfli0IPVxRWQdcZaI6CEZd9y/xhmzP6eU2qC
	Xv6rRSKHmeZOj5I/1gCa9M1VG+N/Ino1F4MgKp46spdS9Gzi1qCyG6BxNRmxBn9R
	oBcaXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u80dha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 13:18:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b22717f1so1789284b3a.1
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191897; x=1746796697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6s4iQJFnCYwc8Njw/Q7Od3/r3Tk3o0yQdVDAkClWD0=;
        b=rBFA/g/zj5xx/qtGQmWomjGBffU1aQEQxpbH0zbKzl3x97c+9VFJXW7TIAdEKKv1y6
         rxp7r+jfjgoYdjpfTldXsYjnoMNse2HZEYAyrd6JziMvMSiV0153GfmUiyxORTTJfiKs
         /KBGSnzNgI0kGGfA15X+A7T3iDeJ9Uodrqk0GfppFmqosJhVsi5XLqeby5Oy85HS7R1I
         qhINidul+1GF/C6ONNAFW1UK2rll8uTkgbhsjA3cq1rBKTLxwPWyWTs86GKFVu8kiWfj
         K+Q6/EfH35t+UHXhlFc2ceqiqLs7RsM3TZhBGWxVhQtJTflSajueEuBCUMtQskHkODsa
         frEA==
X-Forwarded-Encrypted: i=1; AJvYcCX2aOKa5WK/hEOXhZVBiWDroKj4rUcy8x2q/fV+TXIA+D53sbexxk2IWqmJay3+oLe9WZDs5M9F4ydQqVJJXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTLoHR/JU/iGicdf92CfSAGwmxBvKM6KFO1MH1Fx8cVygS9Rf
	imEDoAS167kWyq2IHJ/ynJ9GCHpOZF/E21jNXAZSE4igPhNE1R5dsYgqVaMyfa75HjkkUyrEW2b
	mtFF45pwqm7YWjLuY9M9K4CB1aHlcvreNUF1gsCcZxNMNhbW0odf4j5dVnGIGMBdAtg==
X-Gm-Gg: ASbGnctK4TM/Xu6T5/sOcJkUikGco9y/rWfLnC3rVxOkIXYmV/vaF9NiAI2BSo6KobB
	fYBdsSj4eoVsrHbK/1DGN/jbFPEVuwJEN9fc8xs3+OJyiOToYyJD6VrBiRUsMDtwvn+Wrvxzb8K
	7l11jl1Fl1NZdiXMSbTxztKbAIBVGkusZv2q1EIpFE+xAmt91Va1Nt2umsF16AdXfpqHUBy1fiq
	DSaD6XCLNYLo6ZOQ0aGDBuglm/XKDjLzG0JaeMMTu6mWmIYVynQVMGiJh/7hGUR7nJ5iEgOwC17
	zUOTSbpS16r0oFuA2mVBnQNgLD9qM4ZsjmlYYUyS21NREy2EF1UZvOMAVdgm64QlRQ2LBl+qb85
	ri0tfd4kkq/LQCHqlFyUwn0LRvJBaOPVJBN6TblVBit1P32A=
X-Received: by 2002:a05:6a21:3a4a:b0:20a:942:47e9 with SMTP id adf61e73a8af0-20ccbf32889mr4746738637.6.1746191897079;
        Fri, 02 May 2025 06:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHykiWgu6P5RWv+jpbrr8/w1EyzW13LNrNIfl/vAhCwU7yGp6LARSRGjcAThyA0Tgaw5qEwyQ==
X-Received: by 2002:a05:6a21:3a4a:b0:20a:942:47e9 with SMTP id adf61e73a8af0-20ccbf32889mr4746681637.6.1746191896626;
        Fri, 02 May 2025 06:18:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:15 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:50 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-2-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=1449;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=QSvt6ky/pJ8+VntHnwTRnuK5ob78/so6X2MfYNDfB8g=;
 b=d3E799PB6j36wxzktWjKR4doHuuJ6ScVx0OfTufOffofpFC5S7yVcCULFdN6gsES1++Dc9cHO
 1XP9nlVvbcEB74cREnucq8d8i1rxwvoZDAJdtjIbt2gKxvMNw0I8rpU
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6814c619 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ehgaR71aKZlbdez5g-l8IdPCn6WN7FkU
X-Proofpoint-ORIG-GUID: ehgaR71aKZlbdez5g-l8IdPCn6WN7FkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfXxpsFRbMsdXI0 2wn6enuMETT2qrLpyI4VW5E+DcT1Khn10AtW8NXIRfXiQR6CnxhrLRzu2awqgMAClKSLmzUeN2/ yNxEtUGhtYP6x4qR8YWxsPULFHpw7GWtCiqIxfRSxaERkpNBQUpNLcrIq5weBU/Tl/rUUPsdOWf
 GEwb2vL/suVUOtwHbhfqOvyQ1tPDt+BLiR/gPELpsAzK4GjveyDmwLL5zg6CYivkcBErlvXrYpe xC+stIADIyW0a5qVxKjO+0bQVgfKZTNLNmVr2r1TqUgdHD5W2rN+7g1ke7MLKEXYSagAixrlw3h HV0k4wEOwv3dYoMuGZp1eHHo0s+qdsxNGMuZ0nPxhKbsSIpcaZnRqm67Qy6AaYklOK9DPyriS5x
 lG7JI7oREmYB6En/X7yYACg/FTkzjYmr+3a5/vREpm735FJlUGujnL/MTOdD8HcL2HtdX8XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=928 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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


