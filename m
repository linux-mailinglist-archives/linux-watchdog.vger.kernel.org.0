Return-Path: <linux-watchdog+bounces-1874-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D66975F79
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 05:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487FB28A889
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 03:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF28188904;
	Thu, 12 Sep 2024 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pkt7u27W"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3717E46E;
	Thu, 12 Sep 2024 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726109858; cv=none; b=tpFjHD0oUjvSU4fsPXwHUDJOUM97htG9mgVaapvAN5NFXJW/XNQF3KkxYE0jBcoq3EJGpg7nRkf4BmCyfTmVct8sHka+vT6fCUCr76qAVQH1uWqXqvBj9hpgSM3xTPVUIZUm54u/0dj3UGLP/KNCTbrAXnwbFEt3ZjA24cV4u0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726109858; c=relaxed/simple;
	bh=2Xgry6/RQgxtq1aLvL2gFkPM+sSA+g0YJU2qjMIyyLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GrjIkit8nPWkVCmRLO5YtVqQFR5ddPLsNtA0O/tjExs02iOPT949TWpKTxQKhj7UwigGTRkziDXJiCfoALDCd6i3s5nkMfbUhz65s4hNCSrdkSowfykKXEgdxuYyeqBacCeTC0H7RjWqjzlcWBApWGm/K1hOzK4d6e3rd63UW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pkt7u27W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2Lst8007628;
	Thu, 12 Sep 2024 02:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=84GJH/u0Zu7gKYdPL4WBOg
	PQVpIdwoPRTQde69kc82k=; b=Pkt7u27WRaFcc9WNuUtVc4E4tJPV4bMm6Q7sik
	eXum7W84N0zYsstz6I/F+RrzY/spA8ITBA3n1Hx0FtqK8FpcV1k+nf7J2hrBkSCg
	AIzJaG5LNNnzm7Yx2fGwXE+ggMWLrZkhKTePvNCPsEg1khkGz51lJRSeVHh2DX8M
	FB5sE9sPXi/V7StxWHhVx4lBvlONMsxAqstMtDtvlHPWV4FA9IiHWjH+zu5D8g32
	/ihUK2iA+6dCZKMgK2jrZ2kWQj65JhS6P18hRvQ0j54QV6oGUanlbOv+XcFehOQP
	Pgm5wcLM1aYYKpIoDqz1NFOX1TOYTgy68jzgjY1TEgn6s8RQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rkm9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:57:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C2vIYU004423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:57:18 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 19:57:12 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Sep 2024 10:56:59 +0800
Subject: [PATCH] dt-bindings: watchdog: Document Qualcomm QCS615 watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHpY4mYC/5WNWw6CMBBFt0L6bQ3Do6hf7sOQpkwHmEQptIgaw
 t6t7MDPc3NzzioCeaYgLskqPC0c2A0R4JAI7M3QkWQbWWRpVqRnAGms1S8zY29dp9E9RjNzcyf
 dOq8nDApKCYClsiZP85MSUTR6avm9R2515J7D7Pxnby7wW//SLyBBVmSqVjVFGRvX6cnIAx7jX
 9Tbtn0BKNQBRdYAAAA=
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
	<quic_rjendra@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726109832; l=1103;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=2Xgry6/RQgxtq1aLvL2gFkPM+sSA+g0YJU2qjMIyyLM=;
 b=YIOQowhFR1X84PqjsUhWPqWpnOkj0nvgqmB/tWDv3rroYsZjZ95w3SnBdfLNIRnUxLUUR9jPa
 BZLQwnbME1eB+nDW50oIiBCpPbBtX+bwDyl9mMuDM76y4jTDy9lO4Im
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5aNYaRHKIzkdqUpYg7UHVWElN1PEddnT
X-Proofpoint-ORIG-GUID: 5aNYaRHKIzkdqUpYg7UHVWElN1PEddnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=792 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409120020

Add devicetree binding for watchdog present on Qualcomm QCS615 SoC.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Add devicetree binding for watchdog present on Qualcomm
QCS615 SoC.
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 47587971fb0b..e8f2488ddff8 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-qcs615
               - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180
               - qcom,apss-wdt-sc7280

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-add_watchdog_compatible_for_qcs615-11c56da30386

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


