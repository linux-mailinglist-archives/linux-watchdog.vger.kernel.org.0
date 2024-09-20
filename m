Return-Path: <linux-watchdog+bounces-1993-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FA97D187
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 09:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E085C284A8F
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2024 07:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE0142ABD;
	Fri, 20 Sep 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DSVBRiAx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0F3BB50;
	Fri, 20 Sep 2024 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726816343; cv=none; b=ETHz+lNWowZW3iV9kgCnT/o3dfgofiwvlbgwIxci06+z6BWu8ueDyxi4c4xskHsOErd+JbCVnbkze5/J0one8HcyFpXkFnvClx4IulOBlsPPMt4Lp+Zb9dgO3vVGCF+cSosp8y97K84PVKQ7K3l8QTUiZBP/owKJqPj/tKXBkVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726816343; c=relaxed/simple;
	bh=/8F4vC+WrRK8JmcD0TA3VmXt6A8IcZpsr5kN9dbyx7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=R9PQQSyiMvtZRf4byHzhhB3R6Fpv3Cw/K5eSm2/XRmvMtXEnDG148+DRPbJbeupyV0ZNkeLDWR+2JiJJMBuMly3IblLdeXMvNhSNPuQ0SbHlIpx+/leXHO9i4cshpvjq7HRNEYhwTshO9wBMhSBRrvCMhMNa1TAHEMwbJJLF+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DSVBRiAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JLx2kl018133;
	Fri, 20 Sep 2024 07:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0EKgVH//p3yEU4Of22Zpii
	69hvSp1EgzKmBMS7nyUfU=; b=DSVBRiAxcTbzJSnxmAek/GIIjgTySK5YYE75XW
	T7wMWjHt0X4vmDPZ286A1JSNhswbjVDXjzgHzRqNJ22TVDZNHfpasyD+TfueDqZp
	UnGrEbh4FQlOfpWy1a5As4YB6RJrjZIWKmp7aWrorK6YjdjXp0YoYWs8i1GtciOn
	Rql7CxLRllKKDYCDmL2SFoYvhe8U6lHIKP/ioJzWmM5bcZNlRf6tcimtYLfkZo48
	u9PRdbkoSHhJOgQjNWyHfmcj3+YegqnfZ00PzM0kahPp6dd9bcRs8uN8Ivr7faNh
	GKwEFgoAraZkncksGZUkErPqGzGBqPQdfc5ayjMXRpHfbETA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfr2rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:12:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K7C4cR006797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 07:12:04 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 00:11:57 -0700
From: lijuang <quic_lijuang@quicinc.com>
Date: Fri, 20 Sep 2024 15:11:41 +0800
Subject: [PATCH v2] dt-bindings: watchdog: Document Qualcomm QCS615
 watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240920-add_watchdog_compatible_for_qcs615-v2-1-427944f1151e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACwg7WYC/42NQQ6CMBBFr0K6toZOwFBX3sOQpkwHmEQptIgaw
 t2txAO4fD8/760iUmCK4pytItDCkf2QAA6ZwN4OHUl2iQXkUOQacmmdM087Y+98Z9DfRztzcyP
 T+mAmjCdVSiKsbIWAGgqRRGOgll975Fon7jnOPrz35qK+60+v4B/9oqSShABNaZ2utLpMD0Ye8
 Jj+ot627QN1orgt1gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726816316; l=1347;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=/8F4vC+WrRK8JmcD0TA3VmXt6A8IcZpsr5kN9dbyx7o=;
 b=AyiaB6kq6mN7zrKjfS3c7QTrfacqklSKgmDxslJeYz3hj6UVjrLSwKt755IHXcqoZFueHRPIZ
 x3rutL4hQX6CCGTrsgd7B2zWcYegmzaZ1KJt0erfV8yrLlfupwlQPWx
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2LvPdIpFtkIOlW-stJqeU7CLoU7Wqp4c
X-Proofpoint-ORIG-GUID: 2LvPdIpFtkIOlW-stJqeU7CLoU7Wqp4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200049

Add devicetree binding for watchdog present on Qualcomm QCS615 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Add devicetree binding for watchdog present on Qualcomm
QCS615 SoC.
---
Changes in v2:
- Collected Acked-by
- Rebased patchset on top next-20240919
- Link to v1: https://lore.kernel.org/r/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 932393f8c649..32eaf43aadb3 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-qcs615
               - qcom,apss-wdt-sa8255p
               - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180

---
base-commit: 3621a2c9142bd490af0666c0c02d52d60ce0d2a5
change-id: 20240920-add_watchdog_compatible_for_qcs615-eec8a8c2c924

Best regards,
-- 
lijuang <quic_lijuang@quicinc.com>


