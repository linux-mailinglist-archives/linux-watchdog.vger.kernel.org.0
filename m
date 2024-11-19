Return-Path: <linux-watchdog+bounces-2453-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB29D238E
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2024 11:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E366282E7A
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2024 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A961C9DFD;
	Tue, 19 Nov 2024 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EQsjbloR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01E1C9DF6;
	Tue, 19 Nov 2024 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011844; cv=none; b=PZ+G+dsvU6eIqOa4SuCa1q1GHk2exGtJjO+UaOoaf9NHgnrxJ11O3E/0Fkp1xy5wIeLnkdTNpEat5TGuRyppuZVuTOAmtAoTHcfyw02Dqad+KKBzljZVRuSy3p9s+JYcP9u/XsVwmxdF2uUiSIUkucHXNEjjnF5H4LKSA9o4UKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011844; c=relaxed/simple;
	bh=Pv40rSWLHKOi34jEfdhdLBYjzD9a/OO7eQQNjrV3/FA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q2p6VIUYxXYXocb6M/ki8Nu5xzPY+7yhm9A7OlMXcDvJBQcqMkOgJX/bEw3GkemKXVPOIJQyXttAaRHukjCZ7eToUKZY/PrqyRQ0nOeGJwkpSzzmLiTxWOwspRN+is6JeoLUdby83BNN1bcOS3eCihulazFPbjvUZYIcy7n980k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EQsjbloR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ8I9Of027540;
	Tue, 19 Nov 2024 10:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=juYE28EVLRWPIn7hgFjXuQ
	UaYUljPr4Wq5BL5A4ikz0=; b=EQsjbloRP2Nnn781bPDeZdm6MoYuDlIgg3XeMp
	gf5hA43FyX31AaD4YJsZwANtEu22iXfQclXXpNBfY60jqctxBRtUdx/P+OCeJzZn
	Dbpg05qR10pPl60ddNbY6vwRVW2n6yHGzKB8712QAvN0GheKdVp7uvC7LJeQfpF4
	js7p9oL3eC6mE3mhLJuYD5jfEQoeui7kUgulFAX0TnEJ92YEOR5+L0luIb8iti5e
	Nt+qZvb4Qu4EMt+xXATCNKuzVJSay8BlVKTvKBroeo1rvA6jwipChO7Dh85AscT7
	Im3bBXOpR1vgH8466EXoKE1TluZ4Br8G9DjGC8BEpVrBjNuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6t7qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJANgJ7012947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:23:42 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 02:23:34 -0800
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
Subject: [PATCH v2 0/3] Enable Watchdog on QCS8300
Date: Tue, 19 Nov 2024 18:23:12 +0800
Message-ID: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tDQaA2q7wreOM-n6PJaDeTdPKjDji1MO
X-Proofpoint-GUID: tDQaA2q7wreOM-n6PJaDeTdPKjDji1MO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=859
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190073

Add Watchdog support to the QCS8300 Ride platform. Include the relevant
binding documents accordingly. Additionally, configure Watchdog-related
clock and interrupt in the device tree.

This patch series depends on below patch series:
https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
--- 
Changes in v2:
- PATCH 1/3：Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- PATCH 2/3：Drop the Reviewed-by tag that received by v1. Assign a label to
  the wachdog node.
- Link to v1: https://lore.kernel.org/all/20241029031222.1653123-1-quic_liuxin@quicinc.com/

--- 

Xin Liu (3):
  dt-bindings: watchdog: Document Qualcomm QCS8300 watchdog
  arm64: dts: qcom: qcs8300: Add watchdog node
  arm64: dts: qcom: qcs8300-ride: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                    | 6 ++++++
 3 files changed, 11 insertions(+)
---
base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422

-- 
2.34.1


