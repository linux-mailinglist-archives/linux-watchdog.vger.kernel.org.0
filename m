Return-Path: <linux-watchdog+bounces-3520-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A35AABB791
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 10:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E52D17B04A
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 08:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023C153BD9;
	Mon, 19 May 2025 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9C0kV7R"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2C26AA91
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643669; cv=none; b=MIjdQ9IogxxdVvR3SOrFgYdfuWfV/TLf7xhho4XknB21X8nAxq5hqRS5/ZKV3MD3Eex8tLeSuOQZFw4wQhqB2f9z3SUu9fbqlRShyN0PKg2Rezr6kjmv/k0stQasG2mfV6Dj+P7kbpuEWSO4k4EEW/kpxavTQrrCB65JHOSTImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643669; c=relaxed/simple;
	bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx6TKsidljOs1gs8NNs/GenfXDGdO2qwj4xscmPYrG0RE7cAz06Q5JRyxlGKGMC40G/JEu+BCZvWJmUkBpAnqe+aRQ6FCngN2zSUSwlIBObdF9Y9rI4hSsdU9Kj8+SRUUeVP0EaqDWThh3oFtMwU4KaFAyAU3EsjRYH+xgoMqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9C0kV7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INsIXo032032
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=; b=O9C0kV7RE333OnX0
	RUJbHELNfSXsniZBtX7T6FdL9GedxrjzyWhR5i5FwIRn5qo3K4aUSP4Cf7+8ILCu
	XZN4d0E30U4q/QyjrUUwBtbP/q2g//Ptucf4K43synhoGIFIaJXXJvWQ0SsR/0lM
	Wbuq3guAdFf1Bx6Rx47wi0+yGF+2jt3z+C3K0B24Ez8J+OLXPmHHOxDrm6lAsXlB
	Ljo9pE6RYDiq4lRcmWL3RkID+OrBO2XtTqr5q8ILb+7Hs/svOXsJSGkGqXQ1oXOh
	pCoeCNOzQop2l6a0sedSVHGFGs3b0z6OvIS0P6wXjYZ72K3ZLyJM28Jzbuwals/1
	MD/OpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsumnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7401179b06fso3277853b3a.1
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 01:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643665; x=1748248465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=;
        b=W18pMK3CcG7R1k/eNvNC+CmkJNeJriS1f9o+6p85vSgj2TCc+BppzTo/pK88HMUwG3
         x0gpps9k1Sw3RcflfN1nSDi5L8ZeDE0gOYPKECh4Vy+A0kmHtVuLRjO1pPv5SpecvqYV
         Gn39xr8YETLUkhD6XYGNPBhG+TiNqAAK7o/ng38Gj9KbDZPsIYcI6l/sJAPXlbCXyUIt
         /RwhFNemxFID7+RvpQtaagHxCV0THLTSg19/TATm6GPMGEfaUXyRZDh9TNTnH0TAmzWD
         jKzl1bom1lQUkqm09oBeqAgSYEZUtHF/NcPdATVbI5VVVwtInlnWuLzon0Zsac6P3+43
         XmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEts3aJx+7NNpx+JNmaLhGm9Ep8HTvWDVcaqFYWZxYmAjESNJCC3mn+sinM3BK3lZusriggN5sEa+Z9NoD7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjey91yE0H7ATQ7r8LOxFZpWuKA9qQE4roARmuXt6Y59wICTVE
	Zj8cTFnnEuW4EYEwOfsyXjnaQ2fYxiopAkG3QC2J3f6k4mQCkO+G+UeP97qpvumy3QhQx95Jpp2
	+EseS37xfZNQZIyzTUIhKIX7zeKmLAsvOUII8Syn1GNhtttI/OBS0CaSBtgcRuK/aCYFbbQ==
X-Gm-Gg: ASbGncuZ+BF+VY2RC8s15FdXr90hit2EOpGxMhvG8gCl4EyVjfhrEAaZtgCx0A9qfd1
	BLLPFmfBf2O0ZtuTTABKKyvJCal2f9v/6EL7HPTWDwoLl6VHcGnaK9jJjQO42W76HsRnV8uPE88
	uLFz+7Npi2YpchEKOjmTkD4yB6UnaonhQQp+ZBP1ygS7IlXs5ZjwcVqp03UzVhZ83Q6y9PKdGM9
	P16lRL7hNxiw+7/wX/civUskOu3DVYzEhojBq5NY3Lqiasizdht4+44ICKirWKzRLgSo0aY1POt
	JhO7jf1yUFWKxO3chyK8OgwVjchE2wdP8hvG3Ih0npgI/Lu6mwintFfCWG5e/iFEGTOyoDQGBSm
	Vk8w9PaKu0+kmRIRTW8Ok3SFQjVkAj5nc2DQkKnV5OmxO8KE=
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336812b3a.24.1747643665218;
        Mon, 19 May 2025 01:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQTKw6lhnL36oUfmMNkC7r1OozD6njZlSoHl1rvqW4Fnyq6pePRJv/f81pLWmiXlgsxToig==
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336787b3a.24.1747643664821;
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:01 +0530
Subject: [PATCH v4 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-1-d59d21275c75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=935;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
 b=4Tg02kg9nftr++Xi2EeCTYjzRNEjyorie8LjM/S9D3N1KpNzzT2t+nX0iGVl4US5bQP8KHmI/
 wD7HrED7G3bB7A1tEayBLv5Z65ywx40IJjm/NtYMtIZ8KIAhA1KzutY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: rDabrdbtDVYYd9KHvZiJHEeLbP_dxNjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX0rmZIhB1SAfX
 4BHHRT4k/n4MKOfcQCsgVhj0w+/FcvYKceu8BXvWucM810s6WtK3o84FG3NUfoPBCdDVaeLyekl
 mRMTcv0dO97+bJWSNHZVy/0XnplJM3N1fTyqjZ2V1RmH0AagwI0NKgTOOjNWwwBaR97zDTzGBWr
 wNfO1MZFrx64HKrZdR4bKKTQJ0FYX8qJBit9AycqWN4rIV6q5cJB9YP/H9k8Cw3w3dHMUByC15R
 VhM3Ltor2qVmIy/1TJTlr1NoxN8eTnvDPGuc68pg3ZV/aj9YaPh01zqKIV9Ni5WIIT+BxDdGTs9
 52Y8K3iYnSb50Bhn8QIc4HAC/WQehuECS0aqcznuKmSQzwkdqUkFPEufn50LkpZ1yDfqc8G1xJU
 4Pfw/TcA1lZWk0mkcN+EtY7/QmgRGPxIna/nJ2WmuND9EwJOrIH/XZkpTFmXM7tNoGA5LKH/
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682aed12 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rDabrdbtDVYYd9KHvZiJHEeLbP_dxNjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=995 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the A-b tag
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1


