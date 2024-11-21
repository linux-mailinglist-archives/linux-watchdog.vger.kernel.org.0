Return-Path: <linux-watchdog+bounces-2464-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A33969D4735
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2024 06:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69800282351
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2024 05:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A840C1C75E4;
	Thu, 21 Nov 2024 05:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JkqOGaQV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B961A2C15;
	Thu, 21 Nov 2024 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166429; cv=none; b=Om9BjGAxK1GPGZ0NMMPyZGcPMyD9XXqTH8HzAyE/OFZ9awkRxM30FvJVcfBuEppLK71bimqteRL+RGLjEtCodYdpMa5J4vXYSmnGLWKuTh5rx0kjNrZPCH7aPLa06LnfYCfM3qlwOrOFaUw2xr7iofIdAP0RWWyXyW/HClyZw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166429; c=relaxed/simple;
	bh=CH3gav1e+0qwGPpPDISzuT0mJ8LtkEesYn/o6k/h4Nc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VML6g6tV953IXRhnCfwiLkdwD0Or5fBonHKzjmNFfkvxrG0UA9nfC76VTQKFYX/i8yutSdSq7oBqeO8jWccr12aDO8zYV9JMhhGo9AW7xvAit8bmEMcuyC/lfHC3i/xPZEEfFKfq04dPQBU7QnPpxWs68oxTPjI9GHKGIRqKKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JkqOGaQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK03Ri019613;
	Thu, 21 Nov 2024 05:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JuMW3EbjelFhpz+LMa8TuU
	2hpmkuiNwYmfycYKwBmzw=; b=JkqOGaQV+iK4tWqdEzyDH0PHFyqdaVHP//BJO0
	1HmG4aAKtfXvRGjfHZ1qBP0+ZyTA/9qUeMUPt7GlCJ8gvSIeOcFy+uuBDGQHrl+C
	DsOrLZmCRRmV+FbOI9iqx8CgTi61IE54vbeKRFAlv9RFrJfJgswdbniXff3IJCls
	JcpNjlGfYO/N6wyuGqSepHRzzxZthKf8gNujqW+W5VK+egF1FESHAKTmc0CJAXZA
	ybI/SE8g40XpFMm6S0hY8r/6Oj6GTlN/sSik8uupCdXt9Pl+yPv2Ret/frfvShVH
	XZ1mGEU006vlY0n6sNOnT76A5O1JcSoOvmVeEgAD7jWBRMjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hjvf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5KBtP025313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:20:11 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:20:07 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <quic_rjendra@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v2 0/2] Add watchdog support for IPQ5424
Date: Thu, 21 Nov 2024 10:49:49 +0530
Message-ID: <20241121051951.1776250-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Cgj13lQy3Q2BQGUf9iCzTJrBWqyqhcML
X-Proofpoint-GUID: Cgj13lQy3Q2BQGUf9iCzTJrBWqyqhcML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=660 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210039

Add a watchdog node to the IPQ5424 device tree and update the relevant
bindings accordingly.

Changes in V2:
	- Fixed review comment from Krzysztof Kozlowski
	- Detailed change logs are added to the respective patches

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241120055248.657813-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  dt-bindings: watchdog: Document Qualcomm IPQ5424
  arm64: dts: qcom: ipq5424: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                    | 7 +++++++
 2 files changed, 8 insertions(+)

-- 
2.34.1


