Return-Path: <linux-watchdog+bounces-2459-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCD9D3351
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 06:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63684B241FD
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 05:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0046157487;
	Wed, 20 Nov 2024 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eG4NnS45"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9F13C83D;
	Wed, 20 Nov 2024 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732082020; cv=none; b=bPULMF1ThIJ5CGfhnBfYjaKPRIPgC6TkvCy18UVGHMv2Wr8fNq4fm/dV/pKOfWUIE6tEdgmFvLGCLKW3OXPivihKhTWeQUfAccttfNJ4JcoINiIUnjaW0dyF8tJ95ENI+tHS3qyuz1FcIj0trE+SyIrEXXkcUPPQqQ3JVRr4ayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732082020; c=relaxed/simple;
	bh=6pyCClsYEEuHPm9ASvNq6Flgjbz0HvtC/Js0Rcc+Slk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgf/nrH98ENUNHz2k+1ueyhSMnw8LBintqIqch4u1mdO0c+xB3Y9VlrLoVprGOvloEnIZJTXsAHv0fwt/AWebmAsTQ8t2FHuz7gTO6D+ZUINrCHsnXyWF4wadLIyVIRy8Sewy/VzenOJNpks3DqXO5XXQJZ7oORSqcISvgz5lm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eG4NnS45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIE2RI010186;
	Wed, 20 Nov 2024 05:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBi7ZQDMcVZhAk28A7BZR12jE6Yo6a/iWTWb8suChio=; b=eG4NnS4597H15xCb
	BR0av9ftMbd7IK1FwsUgWGq1gYcoROuepjNuOdwISgv1PYpkm9pB8Uq7FfQls7Th
	KeeK9TU2QK3BzmjZmyf18LtJaH+K0pRj58cgAnETgifw5F4KN5U6321Fz0OC8BvK
	/MXT7gj59REmlLr98XH1Mud2fJHk231GlXzZNv4N+W+srFrRBBAiLBc2m5Um6PAH
	Y2q/MeZ8YEL0FTcpQqMOTQYGTmpkDIMbLxS/2o/1JUqHwwu1w42P+5vYhDH0pI87
	GiGedJ59r7Zfn4K9baExX1btOf1ULO0p+HhnvRaVvjnocXC0Y0IAC1YcxgNFc0Cd
	K1TjgA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y94sm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 05:53:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK5rFe1031777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 05:53:15 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 21:53:10 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <quic_rjendra@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5424: Add watchdog node
Date: Wed, 20 Nov 2024 11:22:48 +0530
Message-ID: <20241120055248.657813-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s55h2n0W-TmCASQ4nYFMLIrbhdZDi-Q7
X-Proofpoint-GUID: s55h2n0W-TmCASQ4nYFMLIrbhdZDi-Q7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=737 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200042

Add the watchdog node for IPQ5424 SoC.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..4ca1ef1c4dc7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -233,6 +233,13 @@ intc: interrupt-controller@f200000 {
 			msi-controller;
 		};
 
+		watchdog: watchdog@f410000 {
+			compatible = "qcom,apss-wdt-ipq5424", "qcom,kpss-wdt";
+			reg = <0 0x0f410000 0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&sleep_clk>;
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
-- 
2.34.1


