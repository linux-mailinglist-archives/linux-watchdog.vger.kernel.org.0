Return-Path: <linux-watchdog+bounces-3650-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B81AD39B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B797A788A
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41CD29A322;
	Tue, 10 Jun 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6JUGWEt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A464296161
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563134; cv=none; b=klmjL2JXnCKouD/jwXsl8hHLMUTNCi6D5N8bLiEY2zlqFEt38yZZAVl5aaGW9ThMSX0h2yCynzwINp3gzhUPE/5QVbWCD9Zujg5ea9XCbp7GCd3ouOhYahtHT2CE7XMpEaungv2XBvHk5HpYcDGNNPcvbH9ACcuJKZ4hBw5t1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563134; c=relaxed/simple;
	bh=lRTdGZr0aQBOohKHQi0z+qkIwN8mJlJ286epa15TUb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VA9Pnm2EUUoc2oPHmYnyuDvPlP3JNQFFINFT/lrGqmEWdIYZqGf8T4KvSJ0L5/St7lpR1KgRRfteAHIxc7Kvj2nBw+fvO1dHbHENvHrMczKc99JrYdufIhyZQFBhZrl24NZHyzzr3vQ76l6wp7vHdLMLIaLs8A186BUVnHdkyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6JUGWEt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8wrjL001471
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ip6JzXoXzNg1IMXwmAxpeKkTCk5UZ4yAdalMGWbYLk=; b=A6JUGWEtiHBO2REr
	dZMeM87m3Tg6sAZQc+pD+U9oUwQByjXbE+ZZsD14xgzoo7l+04iY7hbRAaOcQ5lM
	hfWXWylpx6SD7YiO1U2tMZMGA3J7xS1tTWqzmZjoA1om73qtG3aWkliqd5jm+ZvN
	VaNG7PEoxV9VRbG9LcX0vjxHbDFx9H4yJYFxl1YRAWM6D2DuLUQrPJLvbYTPwPNz
	RSCWANNsOJl+KX4B5bxaSiPHvDIsMPw3hiVSe5LYF4Fj2uTi9foIzNAJ8dtr1hS8
	PozrhGBO4e25YaoWGBgHye05MI7sHFH8DL1UKSX8LV/vneepjnY/5+LJzgxNLCkx
	I/25dg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn69ja6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23632fd6248so11915525ad.3
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563131; x=1750167931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ip6JzXoXzNg1IMXwmAxpeKkTCk5UZ4yAdalMGWbYLk=;
        b=T5iscuXO3EhPnOUwTXpW9Me1iZH/1T20aQm2oLvnba5eAA1y7YMn+0Nac808Px3yDp
         I2wQOwGUFg//OuiG5zpNfx6iX+Zxxa6rPGKcd9aH7DN6PCtQ5sFloKlJWOsqhsOMyxy/
         ygDW6i77N47S8/ZlomqOHxfJuPoIeYekY3scDv394YXaf5z6ATc4cCwvW3Mi9By+Uv/z
         qzlIztG6Xz4b+Xrej5k68AUyYqglQsyI+BVC9lIuMa4Y2Pfj9rrceh8zOJJT/dAgIqg8
         YeATmpmFNdcKdjMSE9zoEOb+i2Tyto1ACvkJx/fVrSxmTvF0m1Kgre9oXOBZ9NkZ6w2p
         mN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhwm/6Dw1P0AiyFNjpiX4HtenlMUQKl/LHbqiFSB7zVZmanhHOPJByb36stnZ0C5YwYbnpGKfkqEkHtEr6NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaQBKcQoqdbnUeLNB1ZhDFxRCHGdws/3AfsqRKsWc8FC4xIpU
	otZN2Tweoc7iR+4vP6RiFAgr3WYYFAT0l2w99YcSflT/hJD99t27o+FiBu+ZRne1Qaa0mIx7OsM
	gyuH0+Uh2gJ7PNRXxJfbHRvZF8232Tw/IGM2HzJOZZAXWmyvWb8u/Mo4HkojwKfbuoA4SjA==
X-Gm-Gg: ASbGncu51zSJqH53e2QnQvIdPgGKj+LFM+Sd/o+XkapgCA4ft5ZStkEKMTc7YccAlkJ
	zUF9A3OT3z9USvgMje584SQEw/WxAAh6A9Am1VYAwSQEvk0jixqyfmcR6x6DUtFxXcciV3ErxU8
	er0E89CaKxwuv1gsX345d7mNgmNN6h86FMI87gwSlK9pHaZ8WrrEj6o+ZhX7VzzrOFtQWMa9GQY
	4TRM1VNQfPRcbMGr5Wtk95J0ZXQPwM6obnvfM++v2BioVjtYqXTn360/W9F2qtp0Sa+j13jKMu+
	rnSpZcaDoGJOdeQi9bR+NuHaN+DyRzJlD+ZNrn2ylAo58RMJy8G4MpbHHBQCsBP7CyRvMroOu+W
	aKV9vThPKu4THQLmxCJNiqr5nQi1a/61U4jitKvI7zBNejjjNAV3p9pwYkw==
X-Received: by 2002:a17:902:e845:b0:234:9670:cc73 with SMTP id d9443c01a7336-23601cf2f3amr258755425ad.5.1749563131304;
        Tue, 10 Jun 2025 06:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGagDwRHIdZc82bl/Bc4fkh850v1GfJHbnj0t2zwGj/im0wRw69ffh5SSZvgBKPQez5uO4MHw==
X-Received: by 2002:a17:902:e845:b0:234:9670:cc73 with SMTP id d9443c01a7336-23601cf2f3amr258755005ad.5.1749563130925;
        Tue, 10 Jun 2025 06:45:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:30 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:17 +0530
Subject: [PATCH v5 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-1-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=966;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=lRTdGZr0aQBOohKHQi0z+qkIwN8mJlJ286epa15TUb4=;
 b=Cz/fVLAzSNzfmtCcKdndL12pNT67DVD3c8cVSEDgf30NJmKS5BSiBO+pDjtJEYaPdq7mcbcnN
 i+xVgS2gwKBCaVOgoFK0w3ug58sLoHm45tjHFR+CQ7z1KlhsBZ4Yytw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX4ERC9uJTNI9s
 ZT0isB92vFtBjB9L46uZSN8h12ugJZrseYlZ647xiWour3cGP8y/+tQuIPfo4/QCk1w8xXaHnBw
 dIIGtRGZ5/PtlIsvxbiLCl8+DV8bmBZI378BLjIoqYKOwDEgelzvw5cWqQd2iSB9eljofNBosb/
 85NLk4nLh5hBuwXQL+mi3SR1sS+z2F+1KgOk4hV8jPA/OS87/gyXUCf5SnmYF24gjGS3y8IPLnM
 1OSxWV1iM2PmJcJUQU83aYGT/SwPh8IJRI9M57FLDpMvhVagdVFqLfQlBQjCZ72vsDwodW2DQNt
 ZZGhxOT1QK84ZrJxRDa4oWyQKqhhIjdq74d22l4nSQ4Y2ao2DEbU6wKGkqfnBIkfUahKoeR1HGH
 3C08UQbGR9Ygu9rXo4Unk/wIHrOegpcN5s/6GKXu7fn1tsNNwdIWBOOgnAVdFLisOCNxD5uM
X-Proofpoint-GUID: kOZWY4l5L06-dhR1elprOcRiduP4__yS
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684836fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kOZWY4l5L06-dhR1elprOcRiduP4__yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- No changes
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


