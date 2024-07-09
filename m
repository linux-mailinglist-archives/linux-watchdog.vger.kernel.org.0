Return-Path: <linux-watchdog+bounces-1343-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A92BCBA
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 16:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDB9BB2165B
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 14:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67A618C325;
	Tue,  9 Jul 2024 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cKV2t6EO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE911591F1;
	Tue,  9 Jul 2024 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534898; cv=none; b=cTZ8L71L8qjVuMSBy1WHp3CUqP5BwROT4yS6XOb9j+N4oDeGUCjdW5shIB6wnYAz1NMNYe/OO1hMq0rVlB9eUgC4JrQXbIY7AFPimsgUk2xo1X5XOCHxhsKc1AVOXm2kB73Yr4k5zMtRQNrPJd7CyKXsg6/impuujGnSS7dGYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534898; c=relaxed/simple;
	bh=4E1vxQgpgX3kemPC0EQy1ZCCU3UQ28R1B05CW+AMOn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jQnwD5ZE+ZM0Kl048q3O/dRxvGTsUSrIrcHLe9m61h8nmqbLM1c8ElqDc5ytEdBxac9tDP3UoNaHBSVJWI8kWL2w4RzYej+Pa4Gzgi+FDOSn7tTDowL7h7KmPO3Wb+xPw/R9vR0UONoJyqorcXHM3HXj8Cgp/0MJQ6IrSSnM9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cKV2t6EO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469CwtaR004756;
	Tue, 9 Jul 2024 14:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cr5c/9QT2RyhMKr0m9AhQ2
	SOiseSOKanTDp/1ZsMK/M=; b=cKV2t6EOzE9B+95KwTBUpKXNjgW9vBG81oKgG5
	T6vYhXKlGBxTnX9m7ph4pifqHblVLGhZmHEG4pTKu0rdXnjd6oT3IaihhT2rEcP2
	6HL2ik9Z904CB3kaoyyJLzMKUD5Uq7Q+uWSE3NGvuAEqSTRNdWjl2mPKfYbfMolb
	yOdRRUVB9VpcIswjcH70H4vllNStu2PcF1x/I5SFQked35QUsA/P1aAxn/N+ljPD
	cBq04EdJiH7g7uiDzt5U09llBAyvemXXvz24Se4KsXqIHDG4tC0w6BRptmr7N41M
	8xtulRSsomKKR2yEE3sX5rz2Q8fuWOo31McgX7adlq+baVqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0r9hdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:21:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469ELJ9M002163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:21:19 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:21:14 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:21:00 +0800
Subject: [PATCH v2] dt-bindings: watchdog: qcom-wdt: document QCS9100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_apss_wdt_compatible-v2-1-beeba6288c97@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEtHjWYC/zXN0Q6CIBiG4VtpHIf7IQztqPtojhmi/luCAlrNe
 e+hW4fvd/A9KwnGownkdlqJNwsGdDYFP5+I7mvbGYpNasKBC5BQ0sbpeTA2qkmHkgGoegxBvZu
 otBvGOuLzZahkUggtriznkqSr0ZsWPwfzqFL3GKLz30Nd2L7+gQvwvMgh40xygIIyOs2oVTS2a
 2t73wOtzpJFqm3bfvYE8dnAAAAA
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
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720534873; l=2433;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=4E1vxQgpgX3kemPC0EQy1ZCCU3UQ28R1B05CW+AMOn0=;
 b=zHIHHw1gtolQXeMOBJz4uSYgOcLoM/lRgHBXc24SFrKW82jh0Le/3zvQ6MZwvq8y/589oQm9L
 s9JI7WQ2FVHAPFZT3uHY66Qlwqfko4J8tZDBytR6tFYjJCLQN+J99/r
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vIB4a5dQTvHyv8HiWA352rcW2I6tvhJP
X-Proofpoint-GUID: vIB4a5dQTvHyv8HiWA352rcW2I6tvhJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090093

Document the QCS9100 watchdog compatible.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,apss-wdt-qcs9100" to describe
non-SCMI based watchdog.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 47587971fb0b..5a78816aeece 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-qcs9100
               - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180
               - qcom,apss-wdt-sc7280

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_apss_wdt_compatible-71744c461527

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


