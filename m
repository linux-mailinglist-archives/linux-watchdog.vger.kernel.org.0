Return-Path: <linux-watchdog+bounces-4707-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A599CC7009
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 11:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E04430A5E31
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 10:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D40346ACA;
	Wed, 17 Dec 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3QdQmDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TszgohMG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3D30FC31
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965124; cv=none; b=ieQkM9VwWdHjMpOpIjDj1JeMuw/DC4iZ507KOFiLhh7/zxvumoLWdfr53ehsIkYDmZe5lTlo6nzKrMSsRQz7+8i8ArHsb8EsQQzbHj7XODBgZk+teMgEkA0vpnfZJDmBWjR0yo242yAL5FMYZxjafOzPYtXvyEYG7SPKvQ4JjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965124; c=relaxed/simple;
	bh=I0XGlhNlBBsl9vkByyjMxMD0C1qFTDvEIM47UaNKPiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LPdiHq1l2FMl7YUhfdmiXFvRkCQM7LSZxis0UEZyxWts8LxDBM1XwUnQxPIAvyzyu85oyaKehvdM4VXwOhf4M5JMu7KabL05pxmGJQleuxd8zpyLKyI98Bcc+RoedkCPMv5ePLklkfq2laT5UtgZnoR0bUIzj/Gd6yKD+eT59UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3QdQmDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TszgohMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F4Ax2024928
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dOceBZo7Lige2wxbRvG1+Y
	Ee9PMsaKngRhKApDOgGS8=; b=b3QdQmDqNVBReu0yiptEhsaXofZdp1fsuHWoK3
	ge0g9/+8iBWhA0rzl0RmCweG2k1oBtbdH3oeGKe3HoWbsmVmec/sE3OqDNbJZGTY
	gtlj3Stf8VZtvXd1p29jXaeuzSOBCKCImdg9KOUMla0z+Hu3YCMVwTlyrIqSC6Th
	RC5Ve9CJYCN6U3RfRfbD8oi2tjihDjwBEC8P9G0VvkrKFVZFsd6Yx6Et7vwNmwCa
	+fVvJ34rK0WG8HEFxaIyq4I321IEIcHgRNnp1Ea92Y77xD4Zs02vDfxWMYXhq48x
	b6HnIE+e1ASEYvCPdGq2G/EdIHtsDuJraEFKvG/Gpi7wLLkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hj0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee16731ceaso113481411cf.2
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965121; x=1766569921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=TszgohMGJHikZYoKYCzi3T9TbnVGo5NAds10zYnThJAjL1B/RF/0BQI8hmQrauoZAl
         KP1NdRpNSJm5vMI8vUv6Tqlo0qwyGzn8KAN2JfkjU+FKCfZqAWA1NE27zwmRaNzbMWZI
         427Cr4wfb1S7wYuIOsnXahRaJxx2JXWtwtxk9tsefkCJDcT/iBVOFSGy6eOhWceb4ieH
         9ARjv0hn2gqqba9FYnvrXm1O3YkGiveYIXYrgioONTDdduGczUhd48heKVvcvXD681zc
         OC+6fGsHqAF5Fidm4OVdyksX5Sn2ItlYpJZGCL4mgzrycYfNTO+2DuebEOp7tHRAkZaW
         nFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965121; x=1766569921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=hkWznHebWDZoGwMAicTiXbCuum3pNmBaQDvJdf7T4MvW874FkQy4czK2Cz+uRfOj17
         UnKuCiWk4dHNUrFMvzrLMD1cWl0CmK8GJczugZCZ6zSHAqiiqtxxX8oGgEbTZUT1EK7y
         m/Yrle/GzAgl3LMeIx8LfdlxMU5exyEdM+CzDl8+hbS0ev45MOJQfbcqK6WdjsdlUDux
         NOQywo0fgk3CUM+mek+t6FoWBEbRdwHxzfjV5FjlqoN5d5vFP6NJu3/RKVho54asbR1c
         0DQ9FimtU/uvDutpmWjSzOIofxpPIyybXFea44dW2SBcqkaTkRu/jhF25Gaji9XWwMpo
         oSaA==
X-Gm-Message-State: AOJu0YyaJQzQw8gKdOkuTxLKM1TcmcmEjkq7ckqdiA3aGDT9AdpA1WSx
	T4geIwLuLb9OLAJ1aueTOKMVceEARHp3miAUWEIit+gKqU+35cWxVqCDj9MYdFBRmiIB69L/iKu
	q2z0ZqO43YUEs3oytY0E+5FPJuomyM/7NBJechS2oZvzRl6QXEfmBLZ7XbILf2taXcLIxjpfGcs
	jFcw==
X-Gm-Gg: AY/fxX6ra7Jdl6pUTdlaCEWnwZwbZMLBVYcZ6azlpmIcp1igk9ZXYplqmW8gGyIv2i9
	FkhFagVs7DwNTZRJzWYG612YRYkr750HrrXW0fGGgkiApePFwS1VQHHN3o4yuVjos4qCMMMBSVK
	hE+MOLTDPwmUnUKtbJ8omZjKSj0H/Bi4TkyPVtSdOybAlq1/MYkUMYIn5hWcuCBClnf6NcNG0vN
	auZhQ+xLXlmwHLcuwg5izoLsOctkIsL7XZiln62mKOM9pBpGkDrBGLuXN3/KteykTQZRTGCkRgD
	DlF3BC+XcoCvAcnRUqjNh+/xUToVrV0hN80XrlMI5tuDCQA4ULfrsFj/r6YVOVhj+baLxsAOwXN
	GJIJiOG5t0fcFqOX4uBinwh4w1vh1Xueo
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582371cf.79.1765965121386;
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW5O1g8WvltuNum/M7cEnhFa1EcdU8QfUbnfhuoRsT0cINIuTq7Qu/PNM30t8RgEV9cpZJVQ==
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582131cf.79.1765965120963;
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Wed, 17 Dec 2025 10:51:53 +0100
Message-Id: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl9QmkC/4WNQQ6CMBBFr0Jm7ZhSJFZX3MOwmJYBJiEtaRE1h
 LtbuYDL95L//gaJo3CCe7FB5FWSBJ9BnwpwI/mBUbrMoJWulakUvmhxYxcGTJVDNzH554yuJ21
 sb6zVDvJ0jtzL+8g+2syjpCXEz/Gylj/7J7iWqNBUV+LbhXRp62YSTzGcQxyg3ff9Cydzti25A
 AAA
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0XGlhNlBBsl9vkByyjMxMD0C1qFTDvEIM47UaNKPiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn07tdxZryfaFCLlY7XrK6B6l9O/jW0GBoliO
 i3wC47HGDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9OwAKCRDBN2bmhouD
 18R8D/9Rb9xm3GmEye3zHH1mOMF/5S+DhZ+qU7E++Q8fo5BUovLldcY0Q/NEjh5unr8MB6CwLno
 P5Tcat0GRosyayr9qk5blbuuD2Xbgl4fXT8R43K9oTMEQckYPzJi5cfUiURGMfElnVQ1NrYvS74
 el9gHlk8TW44x9h8WZvLg1I7xzei6mDKd5692aWdEfvMHJmTBzbOsNTGRepEhipyDD/0guLr5Jg
 xANui0I6Q0M8f5t8WtL0hbLoIjQ2Ss7lDuK6RJH0P6Q6usDwKuLhjCJn9YYteA/0LUcvOJP/hvy
 C+FUP2ycAIqetuf9rc/36nYUflFWzrMUtDINcBC1qJsYOvPvfHe8GZX+ET8mPWG2uGUenluo1wl
 VoDOTY12cl32oEH7VJZeq72y4lYeHpUhoPySSwglulaTnYXDtY5hah4uzSQB1by94FOpsjMPrir
 k2OEn4w5qPuVMmd67xoAl6CYGDnLL6HE0ii42XGnjvqxgzOOpFEXs7grjupjGoSV5WayztaMjsw
 W9pZ8eEma4N8mBcvOmD2ivip48x0fdmlzRp4DtzO/Hz31WahIssF9WhFFrmwHiVZryRrcEt8KKl
 Ug5+1LdZR48sVSnVtHVTWT7D2QljtlmxtiA0pjxaERe8KecVaJDvlYg8vjHxch02bSUHWcuRtNY
 VIXNSvKzR9xXnBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfXwfD9p3hy4rQ1
 rkr0G2R6NEoZiLvcYe2mavDDYwNXhz62Vs9PmH4ThXiO2Sf2t6nfnXoC39G4wWY2yx4YFn/rzbT
 TUCG8RZGd7sNIW4YkRf0+GqWK0cVsfhICG0xh+qIcWDxAOKP5QGXh6OkY2J2ElmiKvp3Bnh54Dw
 zxOGuKggO0lICaaG9ku7sAGkGZpVMQ64k1NddTCTSSe3HetTwoPzN4zoktqjjkeQKp2/gcc2AjN
 R35k4MBh1PMEUuO93f+kve0RKbeirkYVApJPbiWeWqlQfmxkXi/9ga/tNDIw92KRCTI7G8gMX3W
 4eFagALrtNCMbZY/h/AkNQldxMVk4Uoiv8b2XNk8+Kn9kez2jSJfUa9uR4dNlCNqmyVqYSmQ0UU
 p+rNxUKRd75gOsRjZoahNmP7WSMuKw==
X-Proofpoint-ORIG-GUID: eq4Rdx-tTCBu-setTlvfYnHytax3gEvK
X-Proofpoint-GUID: eq4Rdx-tTCBu-setTlvfYnHytax3gEvK
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69427d42 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IkrQgrjNrYqhz69tAt8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078

Changes in v2:
- None, just rebase and apply tags.
- Can this be finally applied? It's waiting for almost four months.
- Link to v1: https://lore.kernel.org/r/20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


