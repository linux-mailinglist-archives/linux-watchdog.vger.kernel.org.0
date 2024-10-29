Return-Path: <linux-watchdog+bounces-2370-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA99B40DF
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 04:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2BD1C21F9D
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 03:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1920200BA3;
	Tue, 29 Oct 2024 03:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xt8cDWLU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14C1FF7C7;
	Tue, 29 Oct 2024 03:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171610; cv=none; b=k3iH9GKdHY6xxcyv49aLUXymQqQQnXPULnlzReMjC0/1DgJBHYoZkSdCi0Ldnj5vfPziXAXCuTtv9u13W+AS0AMNt9XMc08lNBqqbGSD1x/WDGx0T24qcoT6B9cMlJr4w9GaNsOkkPPdEbAX6KZgbkNB6zF/eETKu10rftSHqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171610; c=relaxed/simple;
	bh=VjVPfHGRZkgycK+UvHjolvQluCDceGlwFheylj5RneQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pn3L4g2Nby07cd9AKkH6bdOYh/VRNOU9wP1ECO2xAsokTJm8h3uqYJUeI8Uk27CroXxV2Y/eVJMSvf1gXJRGyL67kGoyiQijINj/GOTekzA+J+nyiV2t5s84B6rNgB6afixPmyyFRYbAelIn5n4Fr3qgrWqssj5AmSRO/bYGHFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xt8cDWLU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJs8kp009006;
	Tue, 29 Oct 2024 03:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q6xECSWzAZbEzhjg3lY1FE
	HbnA73xtpjl0loNFTzpRY=; b=Xt8cDWLUq8BgDXe/LVdS/z2RYPyskNLAb5q0ed
	5UyWl6bJ+32F6BQMiOXhvh+XF7Vp/q5urIL7RKFrqAyjHUzR6xzoeuK+6HO833gr
	/Q71RiZtBruQgqMXcjBaD4K0oFlWK1ULlvWcIgYeGkl18nFyUssp+Ie2Rnov8lWt
	UCzd/3Fmn7NYeyvOYzm1BeQLbCVd7/OXKDeFUPRQbNrpVT3dslMcYfKiCVAokZoD
	j9olpjBQsCmqzsmaUJjuefjfYEZ9GmuW/TOSXBjRpYcRrmj+6AgAET8bb2H/oGHc
	s2Jm397NUMmA+uYbONOE0y2Gjn3490OLlTpPYmZUkrxtenKw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8f0pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3DCGk017931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:12 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:13:05 -0700
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
Subject: [PATCH v1 0/3] Enable Watchdog on QCS8300
Date: Tue, 29 Oct 2024 11:12:19 +0800
Message-ID: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S9P51e7X3UBOhIhoe0edTEttk5ru-oWL
X-Proofpoint-ORIG-GUID: S9P51e7X3UBOhIhoe0edTEttk5ru-oWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=700 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290024


Add Watchdog support to the QCS8300 Ride platform. Include the relevant
binding documents accordingly. Additionally, configure Watchdog-related 
clock and interrupt in the device tree.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Xin Liu (3):
  dt-bindings: watchdog: Document Qualcomm QCS8300
  arm64: dts: qcom: qcs8300: Add watchdog node
  arm64: dts: qcom: qcs8300-ride: Add watchdog node

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                    | 6 ++++++
 3 files changed, 11 insertions(+)
---
base-commit: 72ba000b3674188b6b27a5c8b62653ae16a4b76e 

-- 
2.34.1


