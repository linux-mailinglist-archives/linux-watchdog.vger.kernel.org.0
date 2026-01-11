Return-Path: <linux-watchdog+bounces-4790-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5ED0F60C
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 16:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C913016374
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 15:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D770834B191;
	Sun, 11 Jan 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmIYPdUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ8y6r4d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D0306B11
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146769; cv=none; b=I8nVeA2OO37yTLbTg42p2TnVOtac/geVt4l6aKyaJVB8j/KDwJSf14O8k+gJwbr2rB3b6qq0F/EX8tf+cBOg3SJ3k2bgN7BktcAc01Tbhvvgjd//DTnhLWctkPaKm7MQSnX9cD4lQLHoK7/V9c525vrpLLrKAaRy3xPeuS9Gems=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146769; c=relaxed/simple;
	bh=8l+oE5/ydcmL36vqKsACJnrox1h/uViSmRXsmGplOjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sPjSPK3GPjlGyazdaWN4zZ/e1Scbq01HHounvhqBBrVAwT/SbI5H1Nl17KQo24JEO6ffDYDxlMpxOd3OmPbwm4RsTc5Pc2iPUKTG3H/ZaaYgI+VpV/R7n+YdD2m2FxcvgPmEAlOmA47b2XaiNW1a1kdy0fv5RmJADI7s/VEN3ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmIYPdUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ8y6r4d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BDrGrq220312
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2
	hob/H1bY=; b=ZmIYPdUYe2/tTsG/rsinNKs3d5AraeT/tzZEUYvng9ivDXZfnPd
	0Dal5y1jM/yADyW9HNkrMBhzDO81KGnTV1NMPWJsYNYrct2UgyWbNIzcqWy/8H4V
	4N5epCNHeqZ3tYDALs4ScGlsbrexj9mPEQpVFk1XDkRe4LUBstYG1qr/+EAIeeyg
	vmNp3O6DWR948K2bGipO+Pt+dwpF3V6P4Pc5J1BEXvih4Z+UZYifSkGY0KHCfpdi
	yBv6k3qG2X3tYnva3dCkyedMAk9HoCxcqWpmnnEtG6sZtHUwLtwfTQkFD9KPVv2K
	L548MeJN6DsaSfXNMYghW1TKdjshPuQbaQw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxftbce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:52:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c56848e6f45so1150610a12.2
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146767; x=1768751567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2hob/H1bY=;
        b=NZ8y6r4d5QbydAfNSfQU7bMhrUXE7O8n3kyLtfC/unzhLuIPCiD0TZkzQuww+qLr5R
         yClTxF9szy3IuiP7pgjbjt3fOf3JmUSmBkFOU29gsRVonZxhdnASbIkSRnSVLV0JFPiL
         M/AUxbuxf+2b/ozgYoioadcvQWA4JUvtm36NJbMkdHlqh7V3k+wkzZZ/RhejHxvjJWbT
         xJMBF6OeArVti1cBF+ksBad7XXzXG4cau+j2q/94QcbvqtiIDsqi6XH+WfyrMJNqPeQA
         VDhHl0fu5s4d0pnTviH7dPImBoScD6O5QV6/MEH3sYMr8A1vOANBXmo4ZhIQAl0Tccf1
         oi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146767; x=1768751567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2hob/H1bY=;
        b=Oow4IkLBq3w7RmLmy/cyrJ7o7m3KeIOe0M6yS/8JZ5/ExpBqASCIn6872kIHHSfVc7
         pt7mWA3e3d+FThRrRc9p8nETFiHzY2WLG2G1jbNQowjy4dJrAWerC++RAmYbN+JHjVWo
         th9+MbWpePPKtqD3nsYFmKUsKIBqQmHuD+/GI3IAO7ChA8zpELxnQn0vcPpMtni13q+h
         Z/fGLzYaHrj0HWwXNNXtQ4+x1NFEofnP8wwyrVcEH84rFRMMM6yzF3lqCnoKtMbSkRz7
         9P+vFEuFIh5v/97zra687VlULlSWoKyW9vTaYZJKuLRypJSxa7lovvZ979K3PBROEEcA
         /exA==
X-Forwarded-Encrypted: i=1; AJvYcCVPHayErv5IgF9mBS4svsk7+2gAVoYnazh/eC5f9Zc6TyW/YjuCqnq+ej0R1sNfMlswNMhZSrDls5Lm60ImvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLopl6TyLGovrtpNfl7d2omtMvzwN0ccAe87i4lwzPPpDECE7C
	irpGtjdq+zZJXJsKOmM0D9K2Jz4ko9A6jUThzEXQo8V9cWX82c+TYQEiB8fR6ai6uX6CA0kGTSp
	vN37vZuGO6GWG6SoZfxM1O2XmXdth6OAcE/n+KEJrCPFto1q1O4N2+snRv5hQ8qAd2/CyvQ==
X-Gm-Gg: AY/fxX5TCXmQ34ZhzMlkbFna4rLR2bYbb80vehhstSPveAR04DpOvHyRTw/Oflvg46Q
	n9D5QnyAk/VMKIe836sr57HIHNJxgIKvfeoaZeiWLMnlK3unpCCv1ts1vbPoPJFrQ7IO7kJGEYG
	VXhufVHF/Wi4e9LCNfElUhp0z2lI9DxGorwMDuVPIH/vZTulSWOzrRU5otaCVQsLhv6oqgU1beE
	BP8lKykn+Pl7kUalXuSkME1Q0p+PfJsMn/SOwdraTH70oEdwdJJ2+5VCaptNRp0/NBl3WrhS2Mw
	VEDAluKc88kfBEpxjHiil+mswXDUEZ38ZkXvSA9kkR8cjthCDbVsGTSVvFgkagOYwWuzk7AAcfT
	kdT2akenrX3MfuCwrsf1ltO0YLOdpadbdTuFDKekoHaZ4Zi7n+WivZzbzBB4Sbmg+i6SVW+qIWY
	hKCWzpeGEDvCSs0ieRiNE64ZJz7nJmEQ==
X-Received: by 2002:a05:6300:210d:b0:384:d0fc:f518 with SMTP id adf61e73a8af0-3898fa174aemr14449376637.79.1768146767356;
        Sun, 11 Jan 2026 07:52:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPuuDAYDdmjGEASuvCN1GVxCQSLBpt8L2f0b6eOml2ugb6D2LyZDOnn16Ta/XhQo/7fJhjA==
X-Received: by 2002:a05:6300:210d:b0:384:d0fc:f518 with SMTP id adf61e73a8af0-3898fa174aemr14449360637.79.1768146766853;
        Sun, 11 Jan 2026 07:52:46 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfc2f6d3sm15188241a12.9.2026.01.11.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:52:46 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Glymur watchdog
Date: Sun, 11 Jan 2026 21:22:34 +0530
Message-Id: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768146754; l=790; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=8l+oE5/ydcmL36vqKsACJnrox1h/uViSmRXsmGplOjc=; b=hiOGL4coSK0fhqmbF62bkwvEPEtn3I7vPgcqdzePfY0EQENtfuO7pCelH74ctkfRxH5AOaeDV K9YNMMot8iyCFv7NCRkaW6UZTyphJFRYxVP9zU8kzwXcDtcH9Mw0v0i
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MlFZE-4teAsx0AsOK3n6EJUh8Llolssy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NyBTYWx0ZWRfX0BQmuRReDXFj
 /H7bP6P4IF/6/3wOK9/RT4pnzIjcIpOTZ0lu+YP/oULHpA26bnfufLB3UincQCo9rHIuGeCYjz9
 Yf4p/+yIcSyO6QpOysg1HuAdvRTv6jFdTUT8MiU1HP+w7HIQ2q8HGSZuKvd6b4pGBBm16ggn3Ql
 9nRnogPzt9BoEE4S/qW1XpVjigG7weIhDBqBqGAx97jEOdir1muCnBgbyIWnB2ItHBG5OWIK/Uj
 SEyjaiRu5pD5I8F6hJSsUy4zxXzW54/8QgYP1gJv1Wk19tIGg0aogzrX4c7sfxyoiHV1Kr94lo3
 y8O4XFHhJN5rIorAsT89j16BNQAcDNfYtGmNYJRqTpOxa08hXrFFFnB1nxOvY5ZRFELlFWlwibE
 3AVo/L4VWhEVbWr2ERGwTtICUVpFKAotWlIN83TXUTZiIQlT+UAMaBpJvRHe78VWh+BVf7IvmjM
 Qt9fvO4TTrkUmvtN3Nw==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6963c750 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FN4xVkFXDHB5uStvxEgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: MlFZE-4teAsx0AsOK3n6EJUh8Llolssy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110147

Add devicetree binding for watchdog present on Qualcomm's Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f5eb648e2801 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,apss-wdt-glymur
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
               - qcom,apss-wdt-ipq5332
-- 
2.34.1


