Return-Path: <linux-watchdog+bounces-3649-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5BFAD39B4
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26956189B5DA
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D801F4171;
	Tue, 10 Jun 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3FtDsyt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7512288CC
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563131; cv=none; b=WnMNMk5Z17FavyZeHWQxmQEHdWTL4uNXIrtLsUuQ95CBuQPbAF6iUbk/2r6tKRe6WtyW/TniSGCFreOIZSWJ1ALkiY5cexcVmINS+cXa2rHyL3P5jBifgM4S6SRkdTKCdtGRG4lK/m0U7Htx+65A/uqwBxUfX88aPpChYGSNbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563131; c=relaxed/simple;
	bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ABG4AVq/2zVH7L7ZnB7/7gCUb14nHqLaszqJzNB0SepEcV61WKabePCw/ugLi1AzdTd1jPFzTTnAihmFHtqFKdDjRJStfQUfrRi/9aFlfGs/O8YER9WPPoEP/AWkRHWB0MXHrjJH5/wXMaQUOPFAbFIjeqteXdIggvMyBOiOhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3FtDsyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6e2UU020237
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xH2KQv7sgrK758uLs/6IyR
	Mr+4xC8wLvLt9nlR+5ejE=; b=N3FtDsytXAVpxCWCKXP2+Q5k5L9my8aJNzN5Ht
	CPm3XspNcY9tcYLDtcLcRto8wBwmv0iwNhs/T7QzQ1dVpJOaO4A0V+VAHQ/AaGov
	F3gtYW9fkhJGu476Igvd5in7fzEO4zMAz1BIVhRtCGRNVWUIPTAbIqZugJmfb1BS
	7hlEX0mWkQQzdbkuxWC63YodLi4t6fQylCEMkPcCHbR7URu8FMLMWJso49Os5jQb
	WHd77RMMYvCejL60RvVynfvE+SmjVn91l96mYo4phST1/NqypRhvl5ZQStdraFfI
	xHfVsl9yjcgPYHADV2y2BDUoUVSBIaUTdMmuD41cR7SzX3EA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn97nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5333651b3a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563128; x=1750167928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH2KQv7sgrK758uLs/6IyRMr+4xC8wLvLt9nlR+5ejE=;
        b=LEoqRdXoI49HksyZc3juQ3H7hUx5eTH53492sUNGRy3ywNuAHjE3Xn8HXwZMli1ImB
         0VJ+lSTFMd1vJlup1eBp6ru3Ac4ve+w6sWx2OOxBsBt0LvPIy0BC59/WxzRMoaTdbE5u
         042j2ET/4MsHlaOLGhda9/tN6qWrcidSkmU5cEGoX03gSHZm/xNmpcbnUSlNIDnZury4
         8Ky8DEObYnUnCa//2fLG+h4JbOKcMex9HK1ZlrDMOnqmUWtXXCqUkFn0nfeZAoY5d1R3
         +6F9JxwUejnUb7IJwoGLEXn0wXVrL1bE2Q9C5D4pHXdih8OGWxDzkpNS8z9K8BnxwyJd
         Px0w==
X-Forwarded-Encrypted: i=1; AJvYcCVHbbVoZmClrNiU1uWg3qzmC4bYVi0eWxDNJdbO01t0vD2Y5AaHD9CIYWyRbtyFKYNfom15j3H+H5uQr35ufA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLIi21OYhX0y2QdRu7tS1/NzG0yTYKF+K/6yP5qsm7vuWEZhi9
	lsb3BOw2mYVYDWWBjyLT2LFdlPfdhuMPskA5+6NXlltBtWqLjCpMgAILpRGxtB3MVQm8MzHFFXU
	WlxId87YR+k28Q9CVJwJTZeQfgdaBrNzUQs5McBXcm3YwViEC/bDlmxCp2SRAsJdBM63gaQ==
X-Gm-Gg: ASbGnctu7Yro5ykQoBn1113na22Gq9SkY91HI4JimtnN+HUBtxuSGPeIRm1w5Xu7n1a
	0Oq0EQmjZXtZAVn5F3yDF2gbPLkC2A8k7HjTISZBJ3iWFxaPWgwORu67z+7nkWbkN3sAFWr89dc
	ybnvjjdT7TE2S+7Wkm86i0TiqzmYuYCBvbs67fWQ8KuD7X7VUGwwyZneUFGQ3r8vrxRmS+2uPEg
	xtpjwmqZTgYF1e0pkWHLZ1Dkv3zDzQrwa1BMN1W1AeAIWdFZAhW+IVllsBoNw/v34DBP9KZ+uBE
	sRIjEUk47FaxfGi+GtuQzEVRrMq7GIxhT11cCRt2KCfwXal3HAmMudp0evZsx6pMlf97AC9WCSZ
	2sPg36YcyWxG7CQqpbPUUTd7dh3ec2xNVy86WUaihrEZ9b/XOGPy5oDEKFg==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987101637.20.1749563127565;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGcARb34ssWxbNot4ia6+tBWBCtiJuSosdEn5XdfGATdAMmEq5BIaiIvEbLrX9hwPwFyDoGA==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987045637.20.1749563127072;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Tue, 10 Jun 2025 19:15:16 +0530
Message-Id: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOw2SGgC/x2MQQqAIBAAvxJ7TtgEE/pKREiutRcNNyqQ/p51G
 ZjDTAGhzCQwNAUynSycYhXTNrBsLq6k2FcHjdpg36G6/DFnEvroJEVlnXGBLGq0Bmq2Zwp8/8t
 xep4XajbhiGIAAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=2858;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
 b=tHyhZgb3CmEiZAspeTy/FvdJvh94GQqCLJKDhTNqSiLazj13Eavw/gBp8apubAnx0OAA7Inxr
 Dj7buW9eM+FCyecTz0aKWzbwrYVQE/nZw4Je/oCi+HXeN6kUfdhU4HK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: lesOlB_sjc1UMCUdyFXwgbka-Mbtq2kP
X-Proofpoint-GUID: lesOlB_sjc1UMCUdyFXwgbka-Mbtq2kP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfXy/grfcdgN+2y
 /LR58K9CQvsfXImpWzImVDYPbnsA1Es4Y9ymEDTV5enC0n4Bsu1Jt85Ek+VwhuWY0IshO2yiIkC
 SdBQE0qzA7ark6/YXFiP72jENArys0oKQx7RuODb9k1iodnDsVXih6VhT1ozMIOtSRRJlTi8NZu
 VI1kgKQaUTubTPR7Zas5CGLegnZf3Y3ucfMiXO05JhzQ3SqPd8mRcWKgzxakUjiqt0p2/CJU8l9
 VCabXVml929gcLqSuMT2a/bDUGR2SDDBHKH+H6wbujpSBNjygVHMu1dZ1o3e5V7QcSA69j/lzPv
 R+i7sAA0Do+afKnQexKdw1zDR2g5qt9nWTuA7IJA7KOZUJby3MeZxjETOTdYuAnNhA/0ZFWHuIp
 ae2LkTk2f8bdvHSJFyCw/Y77NJ87QAh2wcDh0J9WF0ZxISMv5eAqUnbGcqt2p1jUbJZDmDYb
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684836f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     | 20 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 10 +++++
 drivers/watchdog/qcom-wdt.c                        | 43 +++++++++++++++++++++-
 4 files changed, 72 insertions(+), 2 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


