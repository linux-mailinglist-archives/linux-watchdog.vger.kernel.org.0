Return-Path: <linux-watchdog+bounces-2489-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B29D82A5
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2024 10:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6246E287812
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2024 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7B21990D9;
	Mon, 25 Nov 2024 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J7GztLUh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE61946BC;
	Mon, 25 Nov 2024 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527455; cv=none; b=gra+LV84XFcxH6IlmCIgIMhKjJs26BYStGwHpNNs3PZg2FujsJ8fUiMalTwEenZxeMMf2cEpa0LU5l4DeY0GdPviQkMBnDP3sVA3+fkUErB1QsxlxseHW1HJ5GcxjvepQt7iHoMbsTEXS/q7von+WqpfK1npJWU+f/RPylJdD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527455; c=relaxed/simple;
	bh=aTwRZbpsyqVBsEJ+HrYziqYmBZNzta9D88CC4h1zpME=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfaOrayrtUnwbPu7pW/l7Ne7DVaSAFSfSzqeakEuD/F6/eAWvrJ1+rV8S+0HfP8aHnnFJyjUPPlUyt4++JrCgbr0X73buCOIgX4jj/lPBTqjSTonrM/DjkQfWQYy+dOlG1oQG+UPYQqQY0mHvSkYPxo4na8YBp3tH7mdgq2/oPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J7GztLUh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONGpPW021756;
	Mon, 25 Nov 2024 09:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yOnQZGbawvvw7rrJWZT+gPRYRD7yNctq7gznrwEbtXQ=; b=J7GztLUhhxSA6C2x
	NchkUV3kq4r9OcXYUz5aoKxRSEvroRJDbQM5Xw+f842IrJh3WcrhRhGMKQLFr/uX
	LeedcUWZ/7Jf6W2TEZjfgSV9CoC0l0BsHhcxQ4XNqGOmBRUWdPyiLRY2X7iC49Uf
	BMk/mHDaKTMhBLvOTOFDP7eXG3pS9DRVOt5OPFjncPewXQiIbOit/I09re+mqoqq
	5aS1MiLtY6PeK4W+3O4W31Qcb18z+1bEgOZMYFJNv+zONijkJW75Z9rwaPV0WUJ5
	I388wZUBkxYhyxfEqEjL7M125M76BdRpbIMerbaAfaNkZqZ5m/GJOuDUbKmulxkM
	LLM+iA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334rd4bhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:37:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP9bH1Z017319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:37:17 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 01:37:09 -0800
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
        <quic_tingweiz@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Document Qualcomm QCS8300 watchdog
Date: Mon, 25 Nov 2024 17:35:01 +0800
Message-ID: <20241125093503.1162412-2-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
References: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XRc2xap3JlU12ZFtlZcUl7S8N4-yt6Ty
X-Proofpoint-GUID: XRc2xap3JlU12ZFtlZcUl7S8N4-yt6Ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=825
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250082

Add devicetree binding for watchdog present on Qualcomm
QCS8300 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


