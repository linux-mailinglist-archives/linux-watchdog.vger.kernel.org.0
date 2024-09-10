Return-Path: <linux-watchdog+bounces-1827-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1F973DED
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 19:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 905721C2531B
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7561A2576;
	Tue, 10 Sep 2024 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wl4AzHJN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9D21A0B16;
	Tue, 10 Sep 2024 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987599; cv=none; b=pub4QGW1DjsVusE7w4pg3j30R3KtrDBh0hGHVsfn5yKyS6wFGaIoXhuUKg8sEIGk0JuU/7FWkd7WUa9QA7EkDtJ3kOpEq0TbthzVa/yvrbvVjS1uWEsR2AmZlWLngtom/4c+Q8Rh3w4lRdw/cgV9W4dWVxKphuDOI7QpbsFWTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987599; c=relaxed/simple;
	bh=G3Hn6EXAAEnqcit3JwtQng5VYPSUx2pPYSgFWdELybw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jMNkTrXBrcm4V4dSZjtNc8+AY/F+0l8v6f/EvCwW5Frm870rfAO6zhXddiOJXXUVJV+Bo3YOh70BLtWNqDD8/wJeXUqEou15FRmEiN84HrO7H3tOxfBOhCX/UpakvyfaJ501tB9vFKJh5MACAVR71DXIln5kIttPGOvYEW1HT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wl4AzHJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AEwwo8022692;
	Tue, 10 Sep 2024 16:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l1clwwAhA+PxVigDqdpbpW
	qSsxdksAzpRNKFaR+Ray4=; b=Wl4AzHJNznaMfFJMU8D9xO8ZtWLddweBK4PVqv
	JPNsb6QihER/ODTZXNVfORsGv5Xab9EJVGbclK+GBqcESnP8K4fxjWqxsrQZ3YAV
	hJPQow9RQzbNl6U77uWbC9b1BC1+faYwnb0IJfTBjcKdF8zycWnr08kqTRYVYNqO
	C8F4a2Oack4/ZhhHNgkg3kT1UWoX5NGQw4Ff6LhptPDtCpkfC7nHC4g9MdafsDCj
	qqo5c5GJsmk4iC92WBT4gSaSjBOPPL2dYv3ucGKlwyj1W+G+TRRCoPwu/p9kakHj
	tk7UjEmdnhueOLTtsfFzSOYVgfdBg35aQgwItbHTHw2Huzgw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpptmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 16:59:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AGxeZE013994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 16:59:40 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 09:59:37 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_psodagud@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] dt-bindings: watchdog: qcom-wdt: document support on SA8255p
Date: Tue, 10 Sep 2024 09:59:26 -0700
Message-ID: <20240910165926.2408630-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I-YMtHjydWTnuv4CPKTiUjjam3E9oBo5
X-Proofpoint-GUID: I-YMtHjydWTnuv4CPKTiUjjam3E9oBo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100126

Add a compatible for the SA8255p platform's KPSS watchdog.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v4:
        - Added Reviewed-by tag

Changes in v3:
        - Removed the patch from original series[1]

Changes in v2:
        - Added Reviewed-by tag

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 47587971fb0b..932393f8c649 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
+              - qcom,apss-wdt-sa8255p
               - qcom,apss-wdt-sa8775p
               - qcom,apss-wdt-sc7180
               - qcom,apss-wdt-sc7280
-- 
2.34.1


