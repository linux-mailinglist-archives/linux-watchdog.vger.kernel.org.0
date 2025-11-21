Return-Path: <linux-watchdog+bounces-4627-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FFC778CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Nov 2025 07:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A63153209A
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Nov 2025 06:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600E2FD677;
	Fri, 21 Nov 2025 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bm9UrMaE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yio/N7zR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F92FD661
	for <linux-watchdog@vger.kernel.org>; Fri, 21 Nov 2025 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705665; cv=none; b=eQZY9C4khvygZIcUP++wXt2jc4WFr5TVKiAhfxidmFj8prMaf1AUKqSGzE/mAz1aBoWbxug+wCmRr+23RCrQT3VwcGouogrWmkM4R1aIOxRKB9IN1Dcw7kjHbkHQpZbejwo1LxNpxSD3D8bwEiekf/hP9FNylTpXli0tWC485Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705665; c=relaxed/simple;
	bh=PJa9N6pG9T7YlDiO61NYTxL4Oy6CYEY/kLLyweJj/QE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hdxOYTVmY4ZTtcvpVjJXmwMbPdG9gpinT25tJIxsLzhE7hOKKjD7nNBw23R5eDXrEMnj/p6VN7AJKVXUM8Cn+gJs91WmVFEQpBpEx0ljGBPgfm/E+lec9hbUiQWqhixYs3Y1duXdIyMijP55TtIAhgpc9evBJ4e0lb86vOhdntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm9UrMaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yio/N7zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5TFLq2831868
	for <linux-watchdog@vger.kernel.org>; Fri, 21 Nov 2025 06:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sakgNXUS7Vn2+wk1MevlkKIijlFznlQ492J
	XMPqHxMg=; b=Bm9UrMaEkcvmKJY40RHzpG/xcsox1dB/SRgsEgnt1gc6MSVoK1j
	jFXSUSjGxc2FU8xrh2k4KCgVIaQ8yJbAFF9RKeax2oq+bwFO2Dv0FW7QO9jmugDX
	+RMWRAOdjfBbYy4sQZtVoQTfbYnNPiigtjD2DlZxRFS0jN5NT8Sv4g0S8LZmvjZe
	RShOkIky3IpBzurGEppDUq+VGuGZGLVa0QeeIQK05BerJ8G1gQFHzcJmCXY74nPu
	ZW0tvOT12YYly+9MSI8tVUGEpiVXB2Z/gMkN/9WOS99X04O0q2GyAZoJ0knyP3IM
	oAzjbjxNbzuKm8ayY9+qqBa2B+iz/LwYiHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq03du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 21 Nov 2025 06:14:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-343823be748so1836905a91.0
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Nov 2025 22:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763705662; x=1764310462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sakgNXUS7Vn2+wk1MevlkKIijlFznlQ492JXMPqHxMg=;
        b=Yio/N7zRISOkniD+keceNQ6QFzvO4MlJAlVjGP1Rmu+Sw8IM9VTKISaz7mH++4z1Dv
         38WRXm05I1rfadfO913Gkua8SiRWwJYNZMu2NTu0RrRpd4Bx8QOsiRChEV1rCWLbDf7g
         /h5cOzA1hwE4/W/V2PWrTkxEQRrrVjtxuuB6JwyHqvXRJQuuYOGoGExuYu8WyJ9bkn+S
         RRrcmbaG2jnUQBpaFRPygd7fXaHoCNYTBrNE3Ih9xRbm2ccZmCaVs2wBKGnAVKX0tmpa
         h2Av33rRdxtdKnxImqflWaDREWZF/odQbaJF3lIjWOwlK3HLJ1h9cEpVs4TPSa26GwkE
         Oksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763705662; x=1764310462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sakgNXUS7Vn2+wk1MevlkKIijlFznlQ492JXMPqHxMg=;
        b=xNedcqE4IbzbBuMuAeKUZVICum4Lwl9sHLUV2RF5Co5xl/hSTU/CRh7hLRVWceILK+
         a2Z/Y6SG+UCr0y9QKB+2GRAugSkvrYfd+Hh6LPwVgrjMpw7wkJVj1S7xYqbFKNSP/1+y
         oHK34gm80+dQDjwvtD74doYxC8l6sYOsjb3IEdzSjXP4d/IYqwZxTTyWgrFIlLQK05C3
         x4RlFwK0WpehLpHU8uxvvIRwBcFM6Z3B/BCkPO0O+szPky4s/d3U/XeOj8vOfzkPnujS
         rccIm3A+IUFvboAzcNyCogW32tBIROpmbztiwr0z0/Be7dEySxabF5MS8o0B7T52F/FY
         EDjw==
X-Gm-Message-State: AOJu0YyTV6rFZsUNe1ZJTkKLt0aA1cdASVC0o9CY6xPsOIjNO4KfunoA
	/xWkr0LO9nxYF8ynlyftVzXzi776WVE1HNaBCOGpZ7ElANVuCqQ/wpbsibGUAJwcJ2JEqEvY33B
	cl402Xhg6/1UfddTZYf2aUDJX7yKEXPlijDV+G9JYG9bOBsSstKnmwU1aLYO8dqzMQulCHg==
X-Gm-Gg: ASbGncvhMWee2l/zqHgS7G1p7LwtURUUYCXzwk+cld9yOGWt+ZhWpCapWjxD0FU9PBB
	F/fJ/UjsBlycsz4BQmY28kRlt2nOcmxWxFVfxxW9i+Yz0NEklX0Z0qBySLU0xYi+E5rIGJRFpLK
	+g156sj9sWd8RVkxAWU2BHEXeKKGuQIZ1X4heq9dU7t+GLbsXrQ6jdPLeqLzcytnPMXcKjMBqV8
	x086w1t7VAAgsrrp9TEzNMveh0EfBd3jA1YGH5f69aQf7ApkS8HyqJ8Dhazb9Bituz0RJ6UpggL
	RE0cOyV+gAWq/22FuM6HgMOGaD6CS6HqE9+RosE4n9jneHZqvug20kDKkxA+BDNLJuisOr5Vpc1
	awknNkqbhp39+VGLhUeVL3/1EeQ3TI26hA3/N2Fv+
X-Received: by 2002:a05:6a20:3d06:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-3614eb3a094mr2088562637.10.1763705661489;
        Thu, 20 Nov 2025 22:14:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEfnV66467SnQmVQE5B6nqIn9rGSkn8UJDhvkh1aS26VUn4BzACrIVhW1vYwqCEI0hJ8kM7Q==
X-Received: by 2002:a05:6a20:3d06:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-3614eb3a094mr2088524637.10.1763705660945;
        Thu, 20 Nov 2025 22:14:20 -0800 (PST)
Received: from hu-nainmeht-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd7604dec63sm4360655a12.17.2025.11.20.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 22:14:20 -0800 (PST)
From: Naina Mehta <naina.mehta@oss.qualcomm.com>
To: wim@linux-watchdog.org, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naina Mehta <naina.mehta@oss.qualcomm.com>,
        Aaron Plattner <aplattner@nvidia.com>
Subject: [PATCH] watchdog: sbsa: Update the W_IIDR Implementer bit mask to 0xFFF
Date: Fri, 21 Nov 2025 11:44:11 +0530
Message-Id: <20251121061411.4185792-1-naina.mehta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gcPRV-N0HKx7cTXmL-C_uqyeRMXzJb7-
X-Proofpoint-ORIG-GUID: gcPRV-N0HKx7cTXmL-C_uqyeRMXzJb7-
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=6920033e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=c8hZkOuhMWBtbjM8IJoA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0NyBTYWx0ZWRfXz+nEVoUQkhql
 9oLcJSv7+4vVv1ZjYJ2D7s5d137TbeR+bUE6NFOhWR2vL1RqhaVe8n59h95Au5CPHpkAk3rBhR3
 qy+0/iE/HgcbC2LC8MGc8lvPYP+E0HbfcngH/BvCuYL3CrCEhf3r9L/6l829XwXBdePy/cpvHhZ
 iqJPMGM96hTMbwZbKAhQH571zWNTt4ibA6pB+EKsd7rih7dsOVH4IPxnALxox3uzod+CBOtk4s1
 3Uty7pQwXO3bgBx+IUL7wJXMPAaOKjV4aJ3hj/lrSmoaaw10Wg7S5fm70F9WKd7Q8z8G91YSiFW
 gkAROvHN1QcBDOGmlDpTrZNuUgrh+FcmlAM/9Fzdn8gfJgGCO+7Ou2MbjczCgLxClhxZpdwRMWo
 fFuZXaT8Kn8XtgGnIGP2hZA1MIfAaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210047

The implementer mask defined in the driver [1] captures bits 0-10,
whereas section C.4.2 of BSA specification [2] indicates that bits
0-11 of the W_IIDR register represent the implementer JEP106 code.
Update the SBSA_GWDT_IMPL_MASK corresponding to bits 0-11, while
at it update SBSA_GWDT_VERSION_MASK mask to use GENMASK.

[1] #define SBSA_GWDT_IMPL_MASK    0x7FF

[2] Implementer, bits [11:0]
Contains the JEP106 code of the company that implemented the
Generic Watchdog:
Bits[11:8] The JEP106 continuation code of the implementer.
Bit[7] Always 0
Bits [6:0] The JEP106 identity code of the implementer.

Signed-off-by: Naina Mehta <naina.mehta@oss.qualcomm.com>
Acked-by: Aaron Plattner <aplattner@nvidia.com>
---
* Link to RFC: https://lore.kernel.org/all/20251104063937.839138-1-naina.mehta@oss.qualcomm.com/

 drivers/watchdog/sbsa_gwdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 6ce1bfb39064..f7cdc277eb3f 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -72,10 +72,10 @@
 #define SBSA_GWDT_WCS_WS0	BIT(1)
 #define SBSA_GWDT_WCS_WS1	BIT(2)
 
-#define SBSA_GWDT_VERSION_MASK  0xF
+#define SBSA_GWDT_VERSION_MASK  GENMASK(3, 0)
 #define SBSA_GWDT_VERSION_SHIFT 16
 
-#define SBSA_GWDT_IMPL_MASK	0x7FF
+#define SBSA_GWDT_IMPL_MASK	GENMASK(11, 0)
 #define SBSA_GWDT_IMPL_SHIFT	0
 #define SBSA_GWDT_IMPL_MEDIATEK	0x426
 
-- 
2.34.1


