Return-Path: <linux-watchdog+bounces-3524-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D50ABB7A0
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 10:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5B116DE0D
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2ED27978F;
	Mon, 19 May 2025 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPPwF1kx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037B26B96B
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643685; cv=none; b=mtpJnSJ6F+uaVHOLZWYWpyRXno14UhbsB9tO5SgermK6oDCh/UZgpZ/YM3MnXVK1qlUAXXbb055ldcBeNkFPFLwq4TUfD3LE0+VMRgk6FGoc1Ywbh8HKAeeQCKcUSDhtmgz9q7TGArJoLKQASAPGkuUP5NkZTnSUU8eFbwErFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643685; c=relaxed/simple;
	bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZg8ao3SvVOi13h3OuFNIi1xv6FzxxaYPw+FQXU+pYGno+f4cuH9i6FvqG68RUeLwfWmHNCXh2/61FHVd5MsTVP4uabKvwk1qg63ZvjkNo4L3Y9KuU7UbY1IBh43PpVtaxKHq7abYhCpaqeFJCUP/V1oczMiqujba08nj5aLmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPPwF1kx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OT1K006095
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=; b=PPPwF1kxcpXFaOyM
	bGk5xZqzz0LD6y1Yds15ogk5dQIPwXPh/M7Sf/Xp6/zGj5AxMdZbFQwwB8i/Ajxy
	GhQv6llV+ckJ9tFK5p50mrX3mPz1zmpSejKoiaoWUg2zhjr12wzZqOIjMf9J3/17
	Ngc2dZoglecWKEU9A8WSGJqBoyfFGgZnDE9DoGMUyw6tAKTstLAttrVOkkrw1H/d
	e+3J2TubvdxC5d4/1BT1D9kaTVgJyJlUK34zeJqWb/jLOke3kXt3pGNTIOrhtSx6
	AroQnHTYp3x6Oq9oPHoJhMSnDnBBw1yusv+iwhj4FRglsQKOnYjPkdAjcANBsawh
	ms3pUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgde2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e4fe0c08so2176537a12.3
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643681; x=1748248481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5b1D60mKVscDIbFquf4+neBMATt7Zc0JngQlFyNTPM=;
        b=uFcmJHrsVwlLbS4UvbSbzuADPrdTwSKjHDWSRLIWRht0aCrxjBQN3nFX5pW8J4ze8K
         4qW73Yiyzy5DOVWJpXZZX/GGTJHd84aonnMVbaG/uL/yeeLVXHscOT5JA+vi3KAo5lg8
         sKOjwZECmYEGI/aJvRk2Sl+diKSF/mUCDhsv0WfjFbO1C0CQ/TpB8yicjbLGFHNscQGT
         t6pPxj3jacxxkZAyiocYRKfwl7XUH+RCzXJFjKa6WlsR3WpJfH1hPxqig2x+1PZKs3Tv
         bMSHtmg3UnjZ0CQe9h12CNSadrxQq5sbZG3Ha5whXLAR+Jm0e3ihZi3kmHZvEDSbtUPM
         5A6g==
X-Forwarded-Encrypted: i=1; AJvYcCVw0zqVYZ5V69fmuZNCnUWy9GrABiM4ExsH6ZGU54AG7klohE3rXyJtwEqA3XZQbehBd1FD1PjlNyoXGns/pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysd61YQNqydqh5ScewqlNRpgf9DZ9ZDBYpcDk4LA4dy5B78pjg
	8zboc9JwKgJjPxgJKTsri3VtSaZFiaryVa4N2xm0YqRk1AA0BCpLswGihTM7Jn/UD7M4NNfJxcO
	7zbw07mDgMEfzIq4guRBJ5otVpzS0enzQ0VYKdmuyug8gfly1m8o0tjO3X4M8lokOD/oP/A==
X-Gm-Gg: ASbGncsRTwnubhU7r/GTfRwBiCzpsfpuOYRgCkcbt5mNs40edKZ6KAGMW+XjJfjqxq5
	VWtlpkf6+/vP/ZQ/Sp5UpEnq7+4DPSGtAY9Ek80V2jyW7W6pwqdZ9zKrhSWGjVDqQIFJBnV09cE
	3zOrm7vbofSY+QwYvRDD6nkjnwsNlHmdOQlns5A0qlA+aotCKSl/ZOa5BH86H3/bzDD+C5Y+G0Z
	qe9rIT7mNxzC/Sz9qit+wOaS1IOOQnHQio11b5kzSnOJ1LXFqjzbjSueDeDfWRQHUjT0aXNOS/S
	RVpq79mBeVLyqwt4NYCsk0/BkYZo5N05tyEFFQQcDrbgIMYKqelTURz3dMFjvYa4PQlf27NRwQS
	6tC0Bnxec84wVrsvs647Fzac+RZiQGhWPb3W7SXb6g7r+tSs=
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696602637.29.1747643681022;
        Mon, 19 May 2025 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1QQZg5f/JnejbZmIH8vrFWqCqoHDMyJqtadf6lkZXSiF2OLDv4iZwOSQm+b4Pz7CIeVQoLw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-216219bd5aemr15696571637.29.1747643680645;
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:05 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-5-d59d21275c75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1279;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fZC5iEDyN1WRoOmVWJh9DWv+C3+DDRc/1OmPFIpcscw=;
 b=Bgjf2iHKk0lwDDhpu/9ynKhNsCD/0q5OQzljDVtG5yvVk6VDs60hLeVXDG/tF7epQZdd44u/i
 Wq+/YSHPFBdBu9zvRIhcplEw6J2GplK3Zb9uArZwi0gFTqLWXFjUixn
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: df4JhNrU5zg7xEBCOgnSO86XQC3E31Ya
X-Proofpoint-ORIG-GUID: df4JhNrU5zg7xEBCOgnSO86XQC3E31Ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX0U1cbTfwb8O7
 oLsu3QKbk6aUmhIKXTnlaromczimB+2W96U+CwOuruQlyUTqcg2mHmTJEuYdSNCKJYhriJXw0X9
 MDtizK4ISpc8Rn4954dmfQA1PyHPxkuDxOEhOOXhWhrQSzTXyvKh+FQAWfK8pthca9WNVyS2L7E
 REKSc11fjeFFoOP6rLfB3SF3fX3+horzFatcB5A9e3GaXXFNel1U/bu8IwWs06H/PugG4Pwdb1U
 vzrxUV9fR21iJZFEItFkXRN/TGENP0nxrWAiVEpS5KeTHXbdmUQGjm5hqM34XxWnmBf23xKMxSm
 ozAXyWeC8qFvPe15xkUqrTVRj+8ein3Ri9waMPNH0KlMa573Ky/VRon/2tJVoE/EeCga8YiFPZ/
 gazB4kGdamVle59glWfQWQK1Wb3/I3MuAHRnRY70r/2c/z0CVLFhLqF4VQB/y/0rLHJeVRbI
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682aed22 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=916 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190081

Add the "qcom,imem" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf..8952d769dad4ec4635759d6eae8344aaf1d8a79e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -380,6 +380,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			qcom,imem = <&imem 0x7b0 0x5>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -486,7 +487,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		sram@8600000 {
+		imem: sram@8600000 {
 			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
 			reg = <0 0x08600000 0 0x1c000>;
 			ranges = <0 0 0x08600000 0x1c000>;

-- 
2.34.1


