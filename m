Return-Path: <linux-watchdog+bounces-2488-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365C9D82D7
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2024 10:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B603B2C65E
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2024 09:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0421922E0;
	Mon, 25 Nov 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FY0IZHSq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A61917F9;
	Mon, 25 Nov 2024 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527449; cv=none; b=lZX+VF5KWOr/ydk63ggnMwc65z/uc2RA4pRAGaq2ULL3JLn3EmJMTcOJVZQyJp0fDzPc+OT8koje97e06kvthycdKvaJSyG8qnIvoy2jvUO7A4q+95fXwfIA/Ubh4EJilQBSphiVQnASb31OzsSZmxurbdCTcuuNtaOGqgTvOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527449; c=relaxed/simple;
	bh=9/r2KXRjTpL/M2e57CW6adj3KzD4FNsi4hnGkmYEstQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s/wCrfNl8Xsta/b0jFGj84GAhmFsirVgmaF51DC9o363XZKK98Tk2h6fUIEN91YOedrwH0jZ8jxGFwlfXUVcTOabDRorCrW/ISbRoDUPYXGl9Ey5k+t2H6tUmtq66aR3KL79vUsCCpqSFPXVzIq5qnAozGAXNp7fori7JxQTcuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FY0IZHSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONMZd1017673;
	Mon, 25 Nov 2024 09:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EMeCqmK8hY19Wh3c1t1C1A
	+th4PzsYO1nSGx7XXkGf0=; b=FY0IZHSqMqIrxplOY00xJIyXCdhYIieREQyphT
	10Bknh0wUkcfv6oIEnKpdJkkiUm3wfFYIDFQLb57Q5ufMdZYMWmGLAL9R0uDN+Ao
	TV2MkR5uSf9Jtmt9PARL9ifcpQZDq0R7CoM+cyaMwwiQw+YdMNoozr37SD0iXXU4
	sq1RC5QsUAG1k1Cf9aPK2TUH6bqaViHVL86cTJtXfxODR26NukYZHJ5msuxUvWlv
	j7Pjzeva02AS1HgBbbnnyIsVot4Yj0nszFq1PJftt4qy1v3/T7wAz7j1rGa6yMVv
	ibZUsg6xEycYnlmzijKe7wDqtT7A8w24I4TkADGymoe8eS8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43387jc0yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:37:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP9bB5j013990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:37:11 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 01:37:03 -0800
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
Subject: [PATCH v3 0/3] Enable Watchdog on QCS8300
Date: Mon, 25 Nov 2024 17:35:00 +0800
Message-ID: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nK6ZIB5mY7GlHHiV7pkm04laAwM8-A7j
X-Proofpoint-GUID: nK6ZIB5mY7GlHHiV7pkm04laAwM8-A7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=833 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250082

Add Watchdog support to the QCS8300 Ride platform. Include the relevant
binding documents accordingly. Additionally, configure Watchdog-related
clock and interrupt in the device tree.

This patch series depends on below patch series:
https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
--- 
Changes in v3:
- PATCH 3/3：Add \n at the last line of the file.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20241119102315.3167607-1-quic_liuxin@quicinc.com/
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


