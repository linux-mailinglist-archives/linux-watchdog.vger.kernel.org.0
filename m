Return-Path: <linux-watchdog+bounces-4510-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1BC2F752
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 07:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B50D3B83C0
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 06:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C2A285C85;
	Tue,  4 Nov 2025 06:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3HAhkor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTCc3Vz/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D085C4A
	for <linux-watchdog@vger.kernel.org>; Tue,  4 Nov 2025 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238409; cv=none; b=kYsGrSHyg4KUb3PnjL9jmd+LMbTTdFsEOoOXLKtnSKM6t5gGKi8agJAYQDWOrUsg/ispB07mQqkqv/5pvL2MGCfGdU+HvI5waOFx5pFVLuCwgOlB15EYLocczwghEjvgyF34R5Erjsh0sbY+G911CZM9wuGBimTL5Ut5G7t+dIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238409; c=relaxed/simple;
	bh=1zqqsPIx4Ao4Gmn1fq3GLOSHJZ6ZN1z3c30WJS9f1aU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XwsF3Q3RSS2FbDNB/DE+AyFpjrVhKj0gNO8G1vUWSbUrFqcch/+buVvKzLKKoKDPyan15YKO+9Wcv/TzTEo3/E/hCmAr8uWUmjOoSCEBRDXAXmkaKvqYp5VQuw29hTknWyxCgyE+pmu+c1rqOD+LwkJb0UeEGbsyNUxgXukyCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3HAhkor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTCc3Vz/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43P6mf905295
	for <linux-watchdog@vger.kernel.org>; Tue, 4 Nov 2025 06:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/eLxjMvN7dLCIi+NES26eyPLirCLrXl/WFV
	AM3oswmU=; b=Q3HAhkor6qY/3+Gk36GpBcdW6rhHHgKSUSNXY3FTWu/wAKrauMH
	PtgCm22k+/gqwpyJXrCN3VD6znWONVidzKBKeKrndZ9QqU+nNPkjUZt34kMFqFCI
	Og6QTHRowueIbKlQtPQDsdhTFCVcNivb17Kap+HOILuAXfT5EuStkaPP+F6ZTmUu
	T7G2eciq4TglLIEeHbVgI+t19O/cEJKXixBBXG6JF4Baafz0TevR20cEXjEnkg32
	+Owr8Pdp4fOtGbPOBbbHt3JfBewsijHnjXppD4a3nfxUNdlaND5JScNK3cwhmlxR
	buR6pTNhwVnegdWQiORLPLgYfMZ7+7s46LA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjresc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 04 Nov 2025 06:40:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9a72a43e42so1935914a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 22:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238405; x=1762843205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eLxjMvN7dLCIi+NES26eyPLirCLrXl/WFVAM3oswmU=;
        b=eTCc3Vz/wCrfEKgWfSSOrvqAsO9eC66S8iXSpivpl0M9m69xf2zDRrnaElwRPp4tG0
         rWBbGp7sq626f29ES7Uo1WxHNWQwWu03NoqK8vafHYhXEkwf8p4AcxeIYtmEr/QAi6F2
         m+LMA1iIJkrbN4a49VXJwbbIADbnAhNOWRhkQQKk02PiQJG2a5c2mo8GnqmjzIF8Djby
         Jl90J4Icv0Voak0xZxBmVGvITtCLJZlOZE3vOtZV1CTmAUefxyiREvS+B9NrQqSwGDUO
         pgBmebGr1FzjeNQyfcr1CUcCracZ+fpPHE3qRiRN1ykBoCtOF+HhzHmbtyRB8vFx4v63
         dXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238405; x=1762843205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eLxjMvN7dLCIi+NES26eyPLirCLrXl/WFVAM3oswmU=;
        b=Z00dwfhGZDpwBAZC2PLZsNco4yPo9GFvy9OmrRobWTrQ9/OGGZmkNhlmAHgcf36uEP
         NjS/36h5JQS9IEU7NSKfqd1RSLw+tqCU2KeKS8HM7EYjISfmL2phDXYi1w1g0BieD5Iw
         198oDcubtYtk7RRqbqO9RWy0TnNDtKbOhDuHKCOq9jlMY87MWPC73r8JWwNA8Snsr+Br
         VjA6bNhZGzNl5U/b0xLCZLJr1/FzctvAsr04GmsxHerDoLpJ1M8jMQonRyx26tqmQ0IS
         RQVQjZ7ysBJRcRCi4tj0FL7kIejEO9iW4oA789Gs0Z2PKxFkih7hcXo48wM5aMa5y8CY
         4bPQ==
X-Gm-Message-State: AOJu0YzPJTJx/nJunys8coXcgZJnL6L3mxSrx1tc7Sxw5ahxLolvDuVv
	yImXAkkBZtKdgSi8ADer9hhMRJFyHcppBFkYzHa/iaCzDiTFSiU7/U8sxYI5WorrvavyMPnaU4w
	iQNVlhCvZQ/+5z4mS4PBPJ2RnuqRLII8r1iwG+lf9HWr4J8R8h6JWwFzQybydJOkMp+ahjg==
X-Gm-Gg: ASbGnctKJELTh43WqVeWuiCs1y8Sd/55m2qY1VFcMa/2YyICX24YsAu3nPhWNtcmS7L
	BJUDSRqCqumfY7m0wi6P7L0y/SMlCcnTyHqTauIAY6pCT+97GzXsqtzcyg5bzvv1S+J1rPzux4t
	6c6aFSzdJd9e7CMhW7ic42uAidshCOHYKLh4Mns+lhViHCR+dSeEwOJGqQEK969RkMF8QJlDdtN
	DN0Or8SYVsDWC+KlqFk5aqleUZvpSLjO29m/re+Sk6FI3EnQDvvDrLTlX4aOc3uBX9eM1GnGq0X
	V0clP8jFlIgfmtK2R1FFcOMk2Ki0yWqhoWlECspedwAmx4u4tAO3tmOkU6ZyjVjHYc6SIJX75hx
	/iuiHl3wvzOUXykF7d+rWkUd10ErY1w==
X-Received: by 2002:a17:902:dac5:b0:295:888e:9fff with SMTP id d9443c01a7336-295888ea0dfmr114992425ad.20.1762238404809;
        Mon, 03 Nov 2025 22:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZzc1gK6aEGU4kh5W4B9zeXAGjoHqkQ2owMT3aqeKlsqObQB8xBxtxLpCSTSz4228El6jqmw==
X-Received: by 2002:a17:902:dac5:b0:295:888e:9fff with SMTP id d9443c01a7336-295888ea0dfmr114991975ad.20.1762238404256;
        Mon, 03 Nov 2025 22:40:04 -0800 (PST)
Received: from hu-nainmeht-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998336sm13712935ad.31.2025.11.03.22.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:40:03 -0800 (PST)
From: Naina Mehta <naina.mehta@oss.qualcomm.com>
To: wim@linux-watchdog.org, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naina Mehta <naina.mehta@oss.qualcomm.com>
Subject: [PATCH RFC] watchdog: sbsa: Update the W_IIDR Implementer bit mask to 0xFFF
Date: Tue,  4 Nov 2025 12:09:37 +0530
Message-Id: <20251104063937.839138-1-naina.mehta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BasDuwDoqFijZotRA4V3SDrvKbXyef-n
X-Proofpoint-ORIG-GUID: BasDuwDoqFijZotRA4V3SDrvKbXyef-n
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=69099fc5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zM6BruqjD1Q-ivkGMqcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MiBTYWx0ZWRfXyHIwzqCYLu8Z
 QyUbAziHh2g4wgRH/YZ6dBxXwgGLDnZsLVnp66gbVYcq1xoEvUO1eQB1K5O/xYflulrO1DXe7s1
 oLLKb02dFTkPwOVZ8gXtmvO8FpcEU7q1BEL4i8msfMJ/IBddLg3zs3AxjsKaxh0QPDnuDVlYV7a
 FTSbPTp0SfhfvblHxyk5fEH+dh51ZtR0t77PxAuCPSPnEEHFIpov3gB/GcvlcgyiFgC5oUf+utP
 kxPXTZfv90NNGGYCDm/fAB1ia6I0RDKy6jid/bCIKlD+OiF5rNbIFjZ6K83Ms7Cruv1QUr6LLe6
 VwK0SkmxWbA5Y9AhHGJkYCPPLQPjWCjTKaLfO+pN4Xt99PVOiLnk4ChUqWsaKhDeoAqoxYZKL0O
 iPVzfr0pjILHB9NkSniihTTzPKjGvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040052

We noticed that the implementer mask defined in the driver [1] captures
bits 0-10, whereas section C.4.2 of BSA specification [2] indicates that
bits 0-11 of the W_IIDR register represent the implementer JEP106 code.

We were hoping to understand if there is a specific reason for using
11-bits in the driver implementation.

Looking forward to your insights.

[1] #define SBSA_GWDT_IMPL_MASK    0x7FF

[2] Implementer, bits [11:0]
    Contains the JEP106 code of the company that implemented the Generic
    Watchdog:
    Bits[11:8] The JEP106 continuation code of the implementer.
    Bit[7] Always 0
    Bits [6:0] The JEP106 identity code of the implementer.

Signed-off-by: Naina Mehta <naina.mehta@oss.qualcomm.com>
---
 drivers/watchdog/sbsa_gwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 6ce1bfb39064..80cb166582df 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -75,7 +75,7 @@
 #define SBSA_GWDT_VERSION_MASK  0xF
 #define SBSA_GWDT_VERSION_SHIFT 16
 
-#define SBSA_GWDT_IMPL_MASK	0x7FF
+#define SBSA_GWDT_IMPL_MASK	0xFFF
 #define SBSA_GWDT_IMPL_SHIFT	0
 #define SBSA_GWDT_IMPL_MEDIATEK	0x426
 
-- 
2.34.1


