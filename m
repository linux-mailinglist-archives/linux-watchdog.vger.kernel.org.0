Return-Path: <linux-watchdog+bounces-2371-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC29B40E4
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 04:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C31B22842
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 03:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666DD20111A;
	Tue, 29 Oct 2024 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QD/k41fo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2CA200C82;
	Tue, 29 Oct 2024 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171617; cv=none; b=qVun2CiKEBVDY7rFkAC/TTMchk24E7vS+F1Pe6T8JJyiSgBmchU0/9KL7QWRBeyNkDh5F0PCXXgr/XWLY+6TpB4kNfhy1AVzyQP7163ZsfoOUwNjD/1mJwpLnWmBcO4Ap2m2lVAgJDy89rjU5aH/UM2G3IvNaz5tLw6uLFfEpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171617; c=relaxed/simple;
	bh=R112qzCnTyICTI3MBNXNLpIeAGF1JZEwI+x+ew6wN4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QN23rgiw+zjok3FfR/Iu4fUEro/5f9N00Wk9A7n0pUefOjIo4Z62/+pSiooPVC0WyLaET5Bw8zKiSyJmnUn2HCPfFylhoaUnpzjo4gDDdCWEnDZ9q/abezTBPukcb7XWG4fNo2BSYUe2KSKPjPHDGdanCeEFaCmvJJ+Uo2YSt8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QD/k41fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SLBB4X023712;
	Tue, 29 Oct 2024 03:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zBdOaGs5byHAp6MuPCFLfw8PYaXz7c8OoYmsJMVosE=; b=QD/k41foORVCSa8j
	tLS9rAN2Ew3J6rVdVWohfe6Uv3AnFiTneoqxknxc1eRMJY1vbCK8eL8GPmhfPj5x
	0m0X5IFY9eitRswh01qkWhDyMXHb3cC7q3vKb299brXwwoc2mNFcD63mE8xie+j8
	oQxWf4ZJkYTCDHkXMTUfiK+JF1ICCZr2+zdB4dWYWu93Nd74afDTarvYpGaUxbgS
	TskTBnpHBy0cn8Cgws2lkpuqC3SaJA3Wb9V0VqoI+USpCBuH6W+vNexl9qxOua1k
	S2UoiY0mhdBXqxkokgRtj1Qia+aY7+DP867R985DMgL8Xt1QyB5PSPWND+Bswo6c
	xoGmOQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5xxfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T3DHvs031683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 03:13:17 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 20:13:09 -0700
From: Xin Liu <quic_liuxin@quicinc.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Rajendra Nayak <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300
Date: Tue, 29 Oct 2024 11:12:20 +0800
Message-ID: <20241029031222.1653123-2-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
References: <20241029031222.1653123-1-quic_liuxin@quicinc.com>
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
X-Proofpoint-GUID: R0GNlhnbKFXvd5KX2CKojeLmYi2seXlY
X-Proofpoint-ORIG-GUID: R0GNlhnbKFXvd5KX2CKojeLmYi2seXlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=801 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290024

Add devicetree binding for watchdog present on Qualcomm
QCS8300 SoC.

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 932393f8c649..200071227d4f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-qcs8300
               - qcom,apss-wdt-sa8255p
               - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180
-- 
2.34.1


