Return-Path: <linux-watchdog+bounces-3522-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63666ABB7A5
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 10:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E1A188798E
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF66D278E6F;
	Mon, 19 May 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ahi/r0cb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C180C278E4A
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643678; cv=none; b=dwM1Y6BtkDyXG9rmgJK8AxNEDiyeI+6GE/95X4vaEHNKKuePFh5eax8cwgEANEHEcFkegbXqN17ixY9gEO0lndlv4RIakZMTwNcv6mHotGcL70kRoq5kswpkQNeC/d0KCC45FvMKaMqx/xU2np2ydtiMiWP/6PUQ+vzNtgz40Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643678; c=relaxed/simple;
	bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQUzbrY9wRB8DfVv7cLYa41O2dF6i0ItPgPTaayHrrHVUYHdJ6SGJsHiOZEzqG4Gq+oc/N60nKlVds+K3sNg4P226lCyeg5XjOQFNXSaC8rrVQBBkNf5G+oCjyBz9Y1jX++zFYAosWMVWsk8+xB4CGmcGaMV3Ax9OBG3qDcwRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ahi/r0cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILHbFX015603
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=; b=Ahi/r0cbJmnnirKs
	k8TyuQSJic0aSrcFWjC7aeBYOXp3hEoCJrUngrtXskoF2w0dspWvMQhq6KErqCTk
	Tr8+68FszJYPpfiqtPs/Lp2F0rGWUMHhcxjhmBp1fOZyT6+sHrxZXyJaVy+t4z2O
	n3h6OAvIG/YjLKaDMiACu90nn5xbdAzoOFbNeWMxIGqDPcgu4e7OvHS9p+wEP9iD
	eOwflDW942j3XEe61kapODxtzksW78T3xXPybmzTablastoJBh+/W/SpR7IvnS7+
	bwOIbh7cyarvhPp03nMZTWlZ6uL3jMpOplXwj0LQ+mB0pHnTpBqXXbMpdmvW/Ucc
	OYeSUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnykpe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0e0c573531so2809496a12.3
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643673; x=1748248473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=;
        b=cUiamr1vfNDtPoJka+/t+oELrImseB8/FmDfCWlwyxYB+NQQOYY4lLvt4k7g8nGtVY
         ZnkoaNQHOzVIEZ5z20NJIFQFnTQxdlHtEuOxQL6abFmaqJkPYJvnYZCQyXESQs1Wufwg
         9ExvoSa9mk0K4W5CeU0mP3qVayWqukwaUk64yrIlEmcPsWqsJlf8U6Wjbc5LZ+Pn89N2
         b7mgbdWmNvQFZ2SyROoXwlo18qpQx3TYdT2Is8PkKHkGk7WfsbQMZSHeq7RR5Wp2jgNW
         /nDJqx0Y6qRekQ5IZRh47OOw+7gQJ3lPVT5HF7hSmhicFfVPsuREIXvucmeaxC6gjan+
         EtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkUwizDj5fajPGnj37y5sEM2GxJMiNA7pMYi8jCx7h9wIQGYSFojIGiaJI7wWGuDJuF6c7uwSD3wj6LVqHxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyObatioANOMEq0H/9k7aPAPoYO5jfuzPm2VV/vTMBim0I6Ir5G
	6e6Cp9pKXpE/E8daQ2Ilq8UWH4kYPFMOYBZlOF6CSTvNFQN9AUP9ymxBeO01ycu8ReDrIUXE7Ml
	fOfyAFDj0+x3Dggmmnzbj8e1fy2eb6X1+LWNG5qXDoSWku5ra1Wsq45M17bgcEgpeFKEG3w==
X-Gm-Gg: ASbGncuJxp3Rju7ALNeNEfWn/43nPCKtapQc5gu8p4Gshj+AnNGAlLHdKVsWvX1fEjv
	2si28s0AAtUMYk+nnCPirEUqD8sn06ZQc8D0za49E/M7b9bWeJsA8ybv/1AZHLpvRl9gd5oJF+k
	rBf4rLpsI9Onhy1//NdzaI2yUi28B/iiRUz7Wl4Rka/16D889rjw+uXlmUTXIcQ/mMpCj9cLU0D
	p5dYEIjfe1U6CqNL8tqnzmDjdh47EGfQcyiyQbZHZ+AI+EZ9GNO5pHKgvRtwXPc0H2T7G5lTWA+
	xONGU8I6G0SPjtdYQyXqO3rIO3X5CCvvFsfiD0JpEcRqGc1q/SHFzTWNM4DkFfrfdaS2e1v4wmf
	2aVkKMFWNEnYtlEyJJjhCsQqJym7kuuTLKIRs0Xna0IMRuAQ=
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769126637.17.1747643673280;
        Mon, 19 May 2025 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkog3pLTR6wQhBvQeivAevxsoJCv2JZBKSEW+h0R+Q7bF8fXq9mejEIQNqo0rSHrTjINqnmQ==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769088637.17.1747643672863;
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:03 +0530
Subject: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document qcom,imem
 property
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1835;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
 b=OyCJmSO5oVigl8JwR5QSAjSTJGL1WO0OhSspgEdH0DngJj+D0n8HNy8BGLCS50hozF0K+BY5G
 VqaROZdDVKIC3mA82cHdtMbTNVAdiR7GQGAAn39So0tJPJpk0C2V1vN
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX+WVHiyk8jbbC
 vKhpbWLdbGemrI7klZUX5vOPEfXwxks4W79Y7xtwSV4IkUJMlgB3JE58UvWaVx5YPG4eWqXVFkg
 2UA88qwozxpnZsHT2s1dNvwUqd6ahfAGLuSIr14TQxTrIGJI4AbwpRxWu9YluDBWyyAwz0EHrD7
 OGtynNGYr4fIq1xXIkT2NIiJrUsAyJqrUaaOXlixhJxqy7YZYNxo+oyfoVdZL1NxqibnIL91Kko
 wVJ+eKUJORV6K+p7suQBr0HWuTLL793mKFMJSm85XnG9fW7UTYgOdvNvtCF2/wHcFZynZuFHpTB
 rEgXZx9feNR09pGM7XbB0R7247i9BUhaEHSgkYntegyIEWvsu94t4ufweYM7UbudUPyRQWXzOPL
 TXlozcykWP5ptJCiHSYi2RIVHXPmTPmocLgR3tDfYqGh3eoHS9tbeSPUr2BcgkW+gy/d3zZr
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682aed1a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hdD7v9c95OJ3thUhsDcA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: BDnyxG1S-4XqJqQNPVf6CY7akpg5C8IT
X-Proofpoint-ORIG-GUID: BDnyxG1S-4XqJqQNPVf6CY7akpg5C8IT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

Document the "qcom,imem" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -81,6 +81,16 @@ properties:
     minItems: 1
     maxItems: 5
 
+  qcom,imem:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the IMEM syscon node that exposes the system restart reason
+    items:
+      - items:
+          - description: phandle of IMEM syscon
+          - description: offset of restart reason region
+          - description: value indicate that the watchdog timeout has occurred
+
 required:
   - compatible
   - reg
@@ -117,6 +127,16 @@ allOf:
       required:
         - clock-frequency
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apss-wdt-ipq5424
+    then:
+      required:
+        - qcom,imem
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


