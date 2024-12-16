Return-Path: <linux-watchdog+bounces-2581-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BA9F2B7F
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 09:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55A5163EC0
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Dec 2024 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6B61CEAD5;
	Mon, 16 Dec 2024 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="he03HcTC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7601FF615;
	Mon, 16 Dec 2024 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336465; cv=none; b=cQzjvwS5O4IoOngCHjD9kVidDFMIrIqQP65HC73voUn+0h4d71cyYAepXv87VUdoJH6yfrGe4zqRuIvxHvijFFr1VpaxGFcDokuB4PPg0whxzbxcnRpq6wZ+KFfgTg7s5Eh0lhVPSPFWiBFt5NMnRN7ujyCXjhVLhsvG3X+pCms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336465; c=relaxed/simple;
	bh=Nrrpzv5D0ignzOdsBwdtNDJpwja7u1irJgZFRTZyeOo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u2x7Nll6NOnYJoFp/2xvlqEEAGY18a7LT8dAiz2TU9SpncXrbjqfSxnK7yHgKi+VvrzYlnUB2BgWt/9QktHBxfKHg19IiRm4yKRz3ru6iqrQLMQwoXulZVZstYlo7sXwPjvUz2vbKW5DvQgcnbRTgZmC8pwwByCURGu3YAIZ4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=he03HcTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG6XTs6022877;
	Mon, 16 Dec 2024 08:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sL1yIlUQQ65cZAokLj4GXd
	aY0BfotyRSs/hH7bf98SE=; b=he03HcTCHA4Zsq/6ZIAuGWBWqEeGj6CkGkUzqD
	qmk4Gi7Pybs9Q9UZ4uSgqXJhUIG3TrP0YfpMH26duQv3cweF8Y2HgzyCA3yVh/AK
	IJHASo6964krPkFXXEFir87YUl/VX2O442fKYmYIBa6MterrOHHVJXu7rasMOeqq
	8TyILixb1pxihgjBJCaKIhQluxT47OBqF+G9jVGSz5LSBrjiTH9wU5GtKPvlY/cf
	s8THgvREZlhEXmzs2H81D6z/bcF4kDTk1Mt741EV7HEzBT4PB7PDfp8JOnBfvZDn
	2/OQJMekev6VQ4m2HTJYDBEp3D06Mw1R8/gEE1Frp5sTZ8Kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jf1w8aq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 08:07:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG87RK9003350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 08:07:27 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 00:07:20 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Rajendra Nayak <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
Subject: [PATCH v4] arm64: dts: qcom: qcs8300: Add watchdog node
Date: Mon, 16 Dec 2024 16:06:40 +0800
Message-ID: <20241216080640.509182-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kcjt2lqlbi10m7qH_b3iFukB3ZYoiYf3
X-Proofpoint-ORIG-GUID: kcjt2lqlbi10m7qH_b3iFukB3ZYoiYf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=841 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160066

Add the watchdog node for QCS8300 SoC.

This patch depends on below patch series:
https://lore.kernel.org/linux-arm-msm/20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com/

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
--- 
Changes in v4:
- Patch dt-bindings is already applied.
- Move sleep_clk to SoC DT.
- Link to v3: https://lore.kernel.org/linux-arm-msm/20241125093503.1162412-1-quic_liuxin@quicinc.com/
Changes in v3:
- PATCH 3/3：Add \n at the last line of the file.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20241119102315.3167607-1-quic_liuxin@quicinc.com/
Changes in v2:
- PATCH 1/3：Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- PATCH 2/3：Drop the Reviewed-by tag that received by v1. Assign a label to
  the wachdog node.
- Link to v1: https://lore.kernel.org/all/20241029031222.1653123-1-quic_liuxin@quicinc.com/


Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..c0efcd98ec65 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -1148,6 +1148,13 @@ intc: interrupt-controller@17a00000 {
 			redistributor-stride = <0x0 0x20000>;
 		};
 
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-qcs8300", "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		timer@17c20000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17c20000 0x0 0x1000>;
-- 
2.34.1


