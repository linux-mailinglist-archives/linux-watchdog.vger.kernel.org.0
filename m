Return-Path: <linux-watchdog+bounces-3317-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AD6A8B3DB
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 10:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87616445167
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 08:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC379233D8C;
	Wed, 16 Apr 2025 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1k+7CsN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EB723371A
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792185; cv=none; b=i59c3H3SzpE1IbGmtKqlg+BJs6uLRiDANhSuVlOXsLdjEhIsR4O4ESsQJg3Qn+5ciQk8OWRd2h20uu9tZSKTY0KuyZek4KGfvoGPUhPQ29Pohdzz0DyaSDu6UZZTEc94vLh7xyGSgyM6KqlJEfvahTXvplIFBtvV/yikvKuPzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792185; c=relaxed/simple;
	bh=Bdkn2b6ZpeMHbQhVahzonRMdWfvL/rZtW6VH4bwyHSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8a1//+xaziXD1XMVSrvy5KfVhPtImhAlxhTtgsABlV1jY/LoQ17qWf7bx0pnAD2X8K64MEphIwK3jIzhjosx4w0aKQq89Xja/GXc7wiFe1wgy03C1GksIiqNGfZPRAWbVBorNwTGbEsgqR4EjubXkeqBTYVeNsYfe5u1xSDTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1k+7CsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7Jegr005853
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cH8mZ0MUw4+nzZg4NOXeMV2RqmXxipr0ZYOxyNbOdl0=; b=V1k+7CsNWrsjqo0W
	ZX2xMKSIq0/FmA0rq5DXdmWYzMn4t6RAhPl41v7l5CC4VpHQ8/I3RCYvyIxH+tEV
	/Znnw21bOet0hj5t36rzSWKUCIQybm9qOg4kMJrr0b7zVbAk1EbiV4pCwev/q+l+
	8XCZCDEUEasYdzQLXerME5+WgKTWMpiRKsm+v1n+lP0x9gXX9/uf1eChqWpRKUtc
	7VfYl00pQK0oHJIOR6/B1xaAXJHVZ0uzjHwI/weYJCtAHWDb6SaBtPfP6EY6rPsM
	oeUWHhRcNc/miKbpxjYsa8aHZ1ENordLSh6aWX54mFXE8T1aTSnmvR6gAzaQp9Fo
	XGd8Vw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjb14w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ce15cc3so51367165ad.1
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 01:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792183; x=1745396983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH8mZ0MUw4+nzZg4NOXeMV2RqmXxipr0ZYOxyNbOdl0=;
        b=hhPGLRLSc7lIyVHKh7Snmj6BAKZ0S/lXGaXkto+L5PACApUajens+anUBrytyANr6M
         XK+523wRAvR5d439XSDh5QYeNKL1MGPfTNTQdqGsmvON2spzqP5jv5YJdAC2QwStA6cC
         SrcPksNh/6mQwthXT6EVhF0WPf+a+18fBNy2yeSWK7RxY/ucG1PUaBE/slOW794KphuD
         bj6xcN2tnwID0/8+pcXIgoianmeWs9eMStMuZlCSWha/hXtn11oPk9XisAAGs/7oPm7c
         2M0NQ/NIu6YMAfD41d/e7Kr+EREiGQDmdFBXHGED2GJ7x75WBRVRiJxqZV0OBR2KLR2Q
         cBtw==
X-Forwarded-Encrypted: i=1; AJvYcCUhIvJLpEZAcvG6//V8ipC25DojUMY8wyTS8/GOHYgclC+xxsWWESp06ckFjX1HafVsBl9Vidik/J1fxGlywg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydvvjNmGFdqbrEWv93b4G6J6s5wK/kJ9evBWGLiR8/EQUqsP9R
	a1/WXHt5MU4O0OcwmU0qj7PkfZanq1eiivrDBXpL5j6lYjHZ94gJWwh+GZt0oSTe2ez1p/a1M5Q
	le2XGoecYfU/e3JUj9i/axbM66R0FBRxvpbAmCU+2QChpbTS5myyFoa1ivpDx0lSlhg==
X-Gm-Gg: ASbGnctg5EOV9gF6qOjY1DC17ZMUdTdxDHpM05r9TK+9TKR0JmvO6wTDPhwLAngHxY1
	t7tavgP7E9zZWlbQZK/LucMtoAQSjseeD378ao0+9d6fJuPL3IOBNujiNQrhEhBJJDnrzWOiF2H
	eTPN/pJY1HoCupk79A73K6nl807hGGvS+w68XtyHi9mF8+bxfY/ptw8qvAFt+e1GT9r+rOM9o4G
	8S98U0VOdMPKMOBArrMvWs2A7JAVKeghwDJnke+OyIJYL6WWtUc1KiYnUIhPM9HJwoGdRL0KVJ0
	S8TvgYhtkxpFuY+kCpn+SSoS3WNQzj8rPxEK4Vvs7OXP3ZJWTuT4LNWkDG6PAgcWwbVAi4ztm4f
	Xf/hZyEIlds9YXm8B6N2TkGLjcWXND8ednPocSF0anujsdSQ=
X-Received: by 2002:a17:903:22cd:b0:224:1001:6787 with SMTP id d9443c01a7336-22c358bc567mr14879205ad.4.1744792182591;
        Wed, 16 Apr 2025 01:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgrK4YU6GJo1s3qFd78AbTpbWE5QhvljMD/CkRuhrNJNzpD7F8dVjir5MH7OEUm9GXptaiRA==
X-Received: by 2002:a17:903:22cd:b0:224:1001:6787 with SMTP id d9443c01a7336-22c358bc567mr14878975ad.4.1744792182203;
        Wed, 16 Apr 2025 01:29:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:41 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:21 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: ipq5424: drop the fallback WDT
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-4-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=958;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Bdkn2b6ZpeMHbQhVahzonRMdWfvL/rZtW6VH4bwyHSs=;
 b=lL/ai6TMfCSkT5IJ6SVB/cYi7PikRg45B1UVsr68J3/l+BxYDyxNH+DPZRgN/8h1ZiRjuN0WP
 KEy9hi3ljaiDm0HkKsHWsx5sMXb+rDcXXdPVlnxlgInrqwukyzzS5co
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ff6a77 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Xt55oPNL4kCmFbjnQFYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HHRrmkMoW7wuh3qVfNQYKJvRIKC4kixu
X-Proofpoint-ORIG-GUID: HHRrmkMoW7wuh3qVfNQYKJvRIKC4kixu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=638
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

To retrieve the restart reason from IMEM, certain device specific data
to be used. To achieve that, drop the fallback compatible.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- New Patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf..21252352b7328e4a1b7ba6ca7080f73722f097ad 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -376,7 +376,7 @@ intc: interrupt-controller@f200000 {
 		};
 
 		watchdog@f410000 {
-			compatible = "qcom,apss-wdt-ipq5424", "qcom,kpss-wdt";
+			compatible = "qcom,apss-wdt-ipq5424";
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;

-- 
2.34.1


