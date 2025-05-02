Return-Path: <linux-watchdog+bounces-3409-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A001BAA7330
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AD9E1898018
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F649210185;
	Fri,  2 May 2025 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPI99qm9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A509C253F34
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191892; cv=none; b=MaRNwcEjlcGVHhwuysUENhbmRT25d93GkSK7tvzxAxVzNBv3nE/iEv3XK8TI0Zb7G4g0fgmlr4gfy7vxgltufHk/0mphDME2WwqnclADbiI3oE8eD6pTl2JWucTz/R/4GwI6SskQNFrOTZUHOxCWw+rHFY8QdJoisv8uhTOJL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191892; c=relaxed/simple;
	bh=C2CySGd6ZHVIgvcnuI0Gzs0w0QJK0EJWr2JrYPf1iPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W58x3box7ejRu/USlVmboNzzE2CYkh9FKT4YKnK9GHYXAiAAhWEnrplwoLIN6amJGWBUw1oyGycvI96NBvS9IBn04pz86U/gF/rLzCca4E/4cqO1Ylcdb/teadjQvPm5iUjINC0xEN1BWKzzq1+x3u8kGmInykB/BG0PMwoW42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPI99qm9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542CWmPQ003653
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 13:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E8sL/zuc6D/PHkqkSglj+e
	mYjJifggg81Nq8wDBMLOE=; b=KPI99qm9ExPxlHVF6V5AebqLA7bcpEELoypiUP
	zEQka647HWR0dt/xoGLYcAx7hPXd1o2bAZJkvcrXiXV7xvBEwjIKYAiIpGHjGZfu
	BshfXi+vyvkgP/jVfOlPtFtSjG/Ezuf2Gh8h/MUNmF0HFwWVL7t4tOCoM1ufJBbK
	RDReHGzdNYtR6f+WTHMmc68kYsE1jnl62rNgSlkVKMEn0ox+2Q8C61zTbXGSFyb/
	yiaYRHz/y6QVAYmsTF5bsiP54nclO9fUmoKOuYIY/69jepq+FAVp+T5zn3as4LLz
	HCwz7mD3SQxoh62Ci2fTVcXtzRzXfI9PU+YzdFWpsv9PXUzA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78g67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 13:18:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c1ea954fso1221364b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 06:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191889; x=1746796689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8sL/zuc6D/PHkqkSglj+emYjJifggg81Nq8wDBMLOE=;
        b=XoHsE5q7xavB30reuI0C92HeuoyiDjkqEkpXe3hLjfQZ8+jqbR1Er61IDmgXDJdlYv
         NjyB37asoOm8UZRA3f1wBL348+0Ha0Vo47tlhSSgNC7MNH5MwY5ZvH+tH+9sDS/bM/u4
         SHwdYPUYjHHcrXxy3W5eMXsd0vJoqNv35vsiwyYj+TOeFGMYn8dwXTkWEqnhU6mzkBAb
         reuAUpyt1t/LX5Ni/elMyWR426gSibWdpfnyo9tj3CmuXheeDZ9XCpiQ1qvhjx+XwjCO
         JslIjsTM+kRM6ZBB0Tj+N1FqtH/2c3ZbaKv/OC5RXl03HAoIo2bLjFtFNShR6XHBdHCq
         3qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX46srK41K44p5qtUYiFr32+polZbzCOAWv4Lw0/FZNs7sdft2aqs/kkg2e2HUEKrHWo9DsszlEJRWwG0rfpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeibtH4aR4IaIvYrw5bQcaxycwPa1tx0mMdZQEj0u2EQTUyzhw
	/bngq3MK4773QcJwrvKHBzzCkYyn3yhZhqqWjwUB7Kn16YiFruAjiytxMJTQNud5CpOJFR9XNVk
	KfH9KYtJ/X09ZOLeQ05K83eeZTox0cxbrOPFDfV7wfGCp0+2H0cIdN/YZNFXxLUezoQ==
X-Gm-Gg: ASbGncubZgRBBYKP5FQv/rzA2i1CR7d+pV8GuN5zOTLRD7YNdurJC1nhaGQ3eNoPE+G
	cjdEgv3kxoISK4aWfDmqgRF5iBQMiIMKAUeaBRo1EmrYM6K3LKiQAKnzdXYZaEutZCe1m+qlaPB
	fQWzZjbNuTgIaW2SkQPaYbQhBtl/HO0I1Y/FdmcYNIXiKT+js61SSKa00uVS73jZXLNdWqzXcU7
	fC8NtcyLFTy3YSRc/cz+VAmAhTqg79eoZj3R3ZMNb2nlF97RnNjh844FwtDRpHnCO+Y0scFOaPH
	RXE+ZeYHZL4/ZNOaS+voT+1IDflFZclm3BpstRP/Sqt9B/0h4T89+090FW1H+ZPB7GSRvVT+qQ+
	sJjJLs4EchaknNZr6nh0o+NtY5goZLDoq6BWe0UXmKE0J0fc=
X-Received: by 2002:a05:6a00:2884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-74058b21917mr3667068b3a.20.1746191888811;
        Fri, 02 May 2025 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGnJlGhBXgkli0DVnltPlz+Rz3Rlz0Tns84nb67FojZk7pFA9oqlxADSBZO8yIBi2J9haR+g==
X-Received: by 2002:a05:6a00:2884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-74058b21917mr3667021b3a.20.1746191888400;
        Fri, 02 May 2025 06:18:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:07 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add support to read the restart reason from IMEM
Date: Fri, 02 May 2025 18:47:48 +0530
Message-Id: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzFFGgC/x2MQQqAIBAAvxJ7TjCtyL4SEVJb7UXDjQrEv2ddB
 uYwE4ExEDL0RYSAFzF5l0WXBcy7dRsKWrKDkqqRtezEvZxTQMaPlr0TWCmjKtPq1baQsyPgSs+
 /HMaUXgjRewpiAAAA
X-Change-ID: 20250408-wdt_reset_reason-e12921963fa6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=2135;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=C2CySGd6ZHVIgvcnuI0Gzs0w0QJK0EJWr2JrYPf1iPM=;
 b=soBqD2Is5FZGH42QT7as39Hdc/zedRJbshj+tTlvhcydtgj44+D/FlIhZbi5N9U5HF50hLaCN
 rDeReQoGfG6CApzwzr/oOsq20DaT01Eu9cY/slG2Zw9i2yu8n42ABBl
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX8SfUw31KNTE9 o/oyg2QTHQXleSL4pPoTr6/Vu9DT6tvw04Y8RhkYqK+AMocMlbCgtTb0bFByzh+RrcrjIPV0Fia 4bjdWgiX/y5JE13p+cQkj71MzL0/gSrNdGv+V4C9iIwrwUhLmujOYQ/cHYyybOeYrkkp1XsKAgE
 LJt5YEogoVxrKbMiuX202BRsDMVVWeLLJ6mXEmiAWk8VXDC2/qv6BzuZ7j/ZOpBlqq741ByrFrD vkaGedVaisXuT444l99enTZNuDYNW/MBcoNZutrGXBYRe6xFaPXBy0z55SamKPqhUmJzBL/FDtF zG5NOvR4pxbikVDfMJGJy/kITaqCoLshqYWrHuYDKnR0uoxaxW943e0Xb26H23zxipXDzJW00VM
 ze6Yj0Pvj0y/4qpnrBgwhRR/6K/XwGdLBNATDmABO1gBSdWNh6g2pV1YKLKmAhvMq0u0ecvu
X-Proofpoint-GUID: jeNjiLWt_H-3IlqSKVBFSqywimPOU3TU
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814c611 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jeNjiLWt_H-3IlqSKVBFSqywimPOU3TU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file. As of now,
we are handling only the non secure watchdog timeout reason.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Linke to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (4):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      watchdog: qcom: introduce the device data for IPQ5424 watchdog device
      watchdog: qcom: add support to read the restart reason from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  9 +++++
 drivers/watchdog/qcom-wdt.c                        | 47 +++++++++++++++++++++-
 3 files changed, 55 insertions(+), 2 deletions(-)
---
base-commit: 3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
change-id: 20250408-wdt_reset_reason-e12921963fa6

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


