Return-Path: <linux-watchdog+bounces-2457-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C099D3349
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 06:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C67B22570
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2024 05:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B7156F2B;
	Wed, 20 Nov 2024 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oRyTqoIn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7078C76;
	Wed, 20 Nov 2024 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732082010; cv=none; b=oN5UOq5r3KZKHSq3CXR/PWL33TP8wgXfQ+A9v46rCYBZ8GjpfBTuNBTUbnOdPqOPrfISZuIU3/XH0hMSEgD8qMWe5V4srxI5DmIfX99Da+0/9+pxj7K+wKQwYusa/fFKq95aKk35huji5XxVRtWaGFetWT3+okfOfR96JwLbvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732082010; c=relaxed/simple;
	bh=jhO+MVAyk6A0ALucdUV3SKoONq3wyur4YDIg44CpDyw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H/xGwhkmEKyz0efF6DLOFJl6MWhu0FM+R9aAHEi8z/A4NY6S2Tc650XeCphE7TlO5NDexDC10rWTQgU4y3SwqsMAyCqSJYI3mGlGJF2GuabPJW1uf5KK0cf2i2f6OcIbmmLJPiUnEpKfHFjE95v0h0raLnieYI+kj3bgNrt58Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oRyTqoIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIFE6l030154;
	Wed, 20 Nov 2024 05:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TsDY9yAdf/ePyQdc/w8aQp
	jGS1f8pDLXuad5PrYIUig=; b=oRyTqoIncVR7WqHFsvbkH4V/x+KydvgELOdL8m
	uDDM9HjMv31CgrHjc8lfTLWmSzJdzNeQu2pMrrYegaLH67IFtlIotik0bnMzwKGx
	8Oiyldo/kK8fJftOuXwKeU2UTV24I5uU48ySsAvw8BCToVUZVAy0q4/81tPHmRib
	q8d2uRN7UaupnxYOfaXsJUdWvLoOwSyT/ar3196JG5jP0/wCv1C5naiOD8BNDSKp
	yTX5E7jW+a7oL1sJ8zykLzR1803c+r5WwZDrpifxmo9tgDm/K9uSjCPmAR51r/Kw
	IQjxA54zn9kJH1A/hxl3tGJ+Isx7TS6CEbS6CGQvIgXOnImw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6cv9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 05:53:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK5r6An031559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 05:53:06 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 21:53:01 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <quic_rjendra@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] Add watchdog support for IPQ5424
Date: Wed, 20 Nov 2024 11:22:46 +0530
Message-ID: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: grXfIcVeyE9uCWzTQF5zZ-btSUHW0sJH
X-Proofpoint-GUID: grXfIcVeyE9uCWzTQF5zZ-btSUHW0sJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=756 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200041

Add a watchdog node to the IPQ5424 device tree and update the relevant
bindings accordingly.

Manikanta Mylavarapu (2):
  dt-bindings: watchdog: Document Qualcomm IPQ5424
  arm64: dts: qcom: ipq5424: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                    | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.34.1


