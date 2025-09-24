Return-Path: <linux-watchdog+bounces-4272-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D559EB9C87C
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 01:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B6593A926E
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 23:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA55A296BB3;
	Wed, 24 Sep 2025 23:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGj2TUpa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C317B418
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 23:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756270; cv=none; b=hfqrpRpHUxvdcxTFMpbS9UvKc0L2yqEiSxNhMTDiRLkfe9eIwUbmkFqfU4sxWVVG1/N3MwiX+7OZ/bXj9GOkKB+2CMKmaCCBuRXkQOdXyNU8hknEC4L8IRzMKDQNkl51+/oYEWVQOiiiBJIjg87xL1OnCeMI3Y+co5iRZojCHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756270; c=relaxed/simple;
	bh=mTfVTgvSGDQYS4dMJifAjU/6hmANPLDQIL/o0pGn4sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TFKIo+xBZSzSdUYGjnObTAjilC/NvTdrobE654QU4zEVN7IpG/qWOH7lHdSdZGP58t4U9/weD+ZdWgswoF/bZQdTYIRnA2k3nhEeD3IBba9eeON/BUiByKsVHAwvtmi0Mqp4jjYFdMJtVWYx7u0Vo0OJb13GV+tc6Eutq3STxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGj2TUpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODM0cd001948
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 23:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KZNciS4xoZfftnPqYXRVX1
	EdzFS/TnwpUdZGiTkk/xo=; b=EGj2TUpaVGpZ5tAQWyrIQHlWmzqhr8hTR3EeAH
	3Odz2mmt+PPa0ETeRJHsSIy6R6Uvv6thRgcaGYChQv/1ueZi7AnAeqnWfc3T9PWh
	jO2A29JEQEgMl/etWTwNqvRh8HFEdAyS9HAWp4HxofVK8BX+qMwxXOkyYAsB1oOV
	qEeOoglBrbBjLlTjGDUny/jKYFo0TATGJO/ocML0dYcYfB8X51HGVPH/1BeeM9oV
	5rYxix3D+eIbaA0Wv2KqWwaNnq7N7vCryoXubzyuPsxKoDIhDxMoxa09AJkGT7RQ
	TQnnH+Sw2z2MvDp+49BPjJEc0aQ5FNy4kVDHIj2uQ1HQS8Rg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p1ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 23:24:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f3feba79cso521898b3a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 16:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756267; x=1759361067;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZNciS4xoZfftnPqYXRVX1EdzFS/TnwpUdZGiTkk/xo=;
        b=hkP9OnbdF2JigecPtaUhCjGBcT/i7xXyVs/4fxNkJsMkGL2MMZ9vtzmQayK4bT6p6z
         Np+PldAZjlvucA+nJaKLPF6/VkLxcASAlN6oFozZfghlOBKCUKPO5fOQEsfB13QXPa5p
         dV7p2PqSMOK/LlQD5xolWkdOlNQ6et1zkxJmwAEyRVDhH0hoLHKRFtRKBhZZ1ADAC7pI
         btiG7Jr2sX0GrcGeey75ovnXwV8+ckxp6Uetmm05jcuSDVd9czN3NXcm9ApQYBCqeF1O
         eu4fTsFu9D/9uDbW9URkRwb7OjR00u4/yPm545n+BFoGaguaGIC5YWUPKOJ/XJJXAyst
         mLgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJtUZST+944/SKYZc3IVvt/QmskFtc05JJSHneSYtCSb1Do8Al6rY+Byq7Gm2f0SEYsktfJlG7SBuvCPHnJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXI+5wBrzBD6nKWEK4hBpCWClcCnxoY8PouxWIDJQhl+PfiMG
	8Ce2wx4Nyx17mZC7Ura8KjaBBO7sBpCceXst6DCnIdeVel82YiGDESCwYtXGKnTGvA+QRA+yGvB
	aWelliDoEHg+u9CVm2AvTBtyJdsawjSACIq6oSvAduznuwm1wWwC2QB21RkHjQ87PhHFSzA==
X-Gm-Gg: ASbGncu7y1/c3oRKBjEILelnbiqplYddUjsWGNHFhmWum6KZ/VfF7XuXBQTsKWuZqeZ
	ie4v8OJv2FID3NcwM1LJyEMgP6beotnRwkIAfwM1htIfZPRScwBF85c7M2f5/Z9sW10NMayNliL
	ECbyMJFw8uw4TUMGt58QpY7klGQ/ckP6org+6vWjFwEsFhySg47yB2vy7mhgU541JJ10iK3JUXi
	J9zSnskdwPPBdSlHWEol0EiUcihtjIE+f/MDWretSrAhYnqRN4elPXq8aNHsdAKpzuc4NaQhzw/
	jeEf+ioJmcFpWbgYoA9YU1PvQuzSq7sEQnZq3kTrvkFBOlQ0/S5WzlH781mgHXLAtWYvFN3EGJ8
	mox0Xl8RGs1U3ghc=
X-Received: by 2002:a05:6a00:4f89:b0:77e:cac4:446e with SMTP id d2e1a72fcca58-780fcf0c79bmr1746151b3a.31.1758756266780;
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8pZDBqMmBGUYCq5JA6tZWwAcXM/OTJCyVhBNbzZ8u7884rMNBKHjRuMnFGdMkg5lXMtDJQQ==
X-Received: by 2002:a05:6a00:4f89:b0:77e:cac4:446e with SMTP id d2e1a72fcca58-780fcf0c79bmr1746129b3a.31.1758756266349;
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm194173b3a.8.2025.09.24.16.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:24:22 -0700
Subject: [PATCH] dt-bindings: watchdog: Document Qualcomm Kaanapali
 watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-watchdog-v1-1-fd8f3fa0ae7e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKV91GgC/x3MwQrCMAyA4VcZORtYi1Lmq4iHrEvWIHYjGSqMv
 bvV43f4/x2cTdnh2u1g/FLXpTaEUwe5UJ0ZdWqG2MdLP4SEj7rim7ZcpmXGQc5RSJLkkKAlq7H
 o57+73ZtHcsbRqObymzzJNzY4ji8O+rzIdwAAAA==
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756265; l=1025;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=mTfVTgvSGDQYS4dMJifAjU/6hmANPLDQIL/o0pGn4sU=;
 b=vh2YAAt0+hRveOEVepPOWT2IBEK3RQNJ2Hj16CUoLVIIbLSbTX1JqcSp1y8XZUqj4oKCif9+g
 jF3FskmXJ/2D0SgUkwxFnVNQ0Pooa28J/IXvvBuVuS6WIJ3ijbC9S2h
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: xcmkWrXfhnFvstKjQNluL636nbPBtM_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX6EbFII1VyiRf
 jY27XENC3nk/xTEe8yI1nshViwpWm80ZTaqo1/4MIdvuzCZqAar0/WAI986pb9HRX1D2+QaGZw5
 zaw5enghZwoj8Z6JV87fQ8FP9HgelK1pF2mA1Mn/EmOeWjCDXTjNZzsd4DwdEhQzhHeNt70Z0vi
 6Lwm7qtgycd3R1Ve1FygXGXuoOeXlSJmIiY+VBqwBiuo0sxzp02qx0Bnv8lml7JHj4VAO7Zq6cG
 E1MradDxkTs+Oo6sngf7D+52wwNl8eZ/aNhdkhZd9XWD6Dh4mIxoug7QtPO5fmsg3I2aCA7Sh55
 BJ2xxGGGshLnRbVfFs7dC0rTqeQl1n7tSGdCkzWkG8Qk4SZC4scC3SWRW8druLpC+wGY7NEhjxe
 +QNWI7NN
X-Proofpoint-ORIG-GUID: xcmkWrXfhnFvstKjQNluL636nbPBtM_O
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d47dac cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eTIQKQMR0C5kcNTfsesA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Add devicetree binding for watchdog present on Qualcomm Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0b..54f5311ed016 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-watchdog-9f42faf7fc17

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


