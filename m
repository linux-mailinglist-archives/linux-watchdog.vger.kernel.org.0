Return-Path: <linux-watchdog+bounces-3231-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7522A7F86B
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0260D7A599A
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 08:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBD3264A96;
	Tue,  8 Apr 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SirbSLFw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CB264A78
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102206; cv=none; b=chsE8+YlULxW7xJ8t6kMGnu7BT3lELgyS5/gXDxhC3kzGBY9qliH2VbDgKN2wlo59Zqk8F4N2My7mootikJWT58z7PVasc+dIoS9QaPk2br+gKjcAAjxTyvxJX8iN3PueEezYgSijHCYZq5X5gk+nFrBxBRPyUsPDLpBdHBti6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102206; c=relaxed/simple;
	bh=3WL9RHuOr37ueCpY977pBENFvwmMyXbAuJwbEskYP10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uixQEzmqnnuiYkU58cud5wuj6rfZGOiNIo5+qxeuaJLQ84ShnLqVakMCY/s9tSUGIBJ9/6+wHp5iqUmsF0xN/mRC5pZVH2RUDpGUvc/+n+TWKx47b7iloCbRhSVZ6UNylkQ8FR8Zuu9iFCpP9xrP2xprrHVJ/ssT35+ygY0Weck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SirbSLFw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GKf1018829
	for <linux-watchdog@vger.kernel.org>; Tue, 8 Apr 2025 08:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KX0kg+QY5VU+pzrQGxzEsX
	01PSKAVuHH52HYSLvo0s0=; b=SirbSLFwhmS3MiN7T/Be95a4IWMYEhtzPwoEGz
	q7fdzjjCQFE4mRLwWgukdleL2+moJSAk7c9ZYURRppGN6pZVJwN5bVSs6vgs2zBQ
	tWIN7kWMomq9QpjXgdpvmWCxWMUk3fpqtRYQvO5XF3NcQsrNuavaQLboUmTQof9X
	slTFMTotsfqkyAzYQxt/P3zZXvjgyR22SS69g6Ulax2SELI1YCaHMR+b4fmubOQU
	BPKm+IbPYaGx08rP3YQ0SlXjjRJyf/LFHRzUUeHDs/DHWA6ZAkdYL5kKITgk9VyW
	JrB7WfZMYegoN5bwfY92qfxokOSpez45/yfqO1MaJ5Cu+O/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgf3yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 08:50:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af8c34d03a1so5355572a12.0
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102202; x=1744707002;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KX0kg+QY5VU+pzrQGxzEsX01PSKAVuHH52HYSLvo0s0=;
        b=LeN3QEwZbbD3WVl5uosbQnOc4d674Lh/B4bGkXER+Nn2kOSh/bCPY9mZ89L85pRcgw
         J4Yiud5wl5vmTZvTCbt8R8Il/Ekcq7pzpz8YzQ0+Cmm1+PobwUO3TT1eEpYJwzxezm+Z
         ArTvnFrLS8H8Y7EjlcgT1LtmDF2akjQM9rU73wXtY+OtsTWhN4Ai3vV275jQMR7AbVhQ
         9R8MdkmtfSLfInwcfBrAHlXeZXi4+teSZqkwq3bMEX/PTf+QduwAFwua3Pq9C3NRjyDo
         rLcjUQwXUBI/XK3DUHm+ohrJlGFAsWJ+Tyd719mfMpUou/TRrKwAMNDYh7U9XgVlBsk+
         7kPA==
X-Forwarded-Encrypted: i=1; AJvYcCVATxjHL4cUTTm8malb6oA4DJIquRcSpczl24Y7m0/vim5/bn3LghxX74vrYaL2cNIfKeN7tL/aOun3Zj1v8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMS4ifXPW6ExSQPZKWBJYcduqhZFPdOSZkS1s5HWAKi2gKK4Q
	A96hVTeP0U//m/MQL6FtKizVRurPWhQeGE4xltrTHzMf4olH/efFS/C7S9TM3n9Zo0Fj/tsY5WQ
	SSixuPWfFh50obkIOyXmbCBUO2Wjbppi2/HgVW+HgCC0cmvFvAwF6ywghVLTjsKCopA==
X-Gm-Gg: ASbGncvJ017DCpbEjEIL4bilAvrUcxGLw4VjJSozv7AKBt9czPRfyQOLROrVVC7a0a1
	KcpUUNinsqsr+22U/mwkvuiqUhlzZwJPmzjcmS/ZeaP0JOoTgfsqs4MJaGVaKLZRc7pOyuxbDdx
	2RcJZZMAVsEo5mtSdp9gncw9w8icTtNvucUorYYracZwbFEWG8u75GXl6rqV3Y92tF8Aj9xa8zU
	GWcX+KapO1E8KIQNzeddS4x9IWDfzGpdkZR6OyhfMxo1a/1KfdExZDE91zdjHcJeX92GURdGPpX
	ygM3cJ3xyGC8RuykMUpVE5J4gpBDBgMdewxGBO53ZRV8IW+GVIPzSLQPmObIhgNfgBqQtRLt26Q
	l60UNl6fsj40hw0xh76J+lJCWa7SapnIyS5iYtljWLlVd836zS2Y=
X-Received: by 2002:a17:90b:5144:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-306a47c2d86mr21775328a91.1.1744102201948;
        Tue, 08 Apr 2025 01:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZDu58HLU8z1kjAvtuD0+tTe4rj0TQqBxPVQxMknp/sqfe0o1vsto4rylXMqGaXoGMRj8i7w==
X-Received: by 2002:a17:90b:5144:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-306a47c2d86mr21775310a91.1.1744102201605;
        Tue, 08 Apr 2025 01:50:01 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH RFC 0/6] Add support to read the restart reason from IMEM
Date: Tue, 08 Apr 2025 14:19:50 +0530
Message-Id: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/j9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3fKUkvii1OJUEJlYnJ+nm2poZGlkaGlmnJZopgTUVlCUmpZZATY
 yWinIzVkptrYWAGssErpnAAAA
X-Change-ID: 20250408-wdt_reset_reason-e12921963fa6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=1647;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3WL9RHuOr37ueCpY977pBENFvwmMyXbAuJwbEskYP10=;
 b=SAdcE6fBGzs6IH3MdA9eaCRwAUGWQckJseD6tm3tHBXicqdLB9R1izF2UHddv7nvXjSHsySFw
 INH8Vd9aLDoBBLlA/OtRlSxMEPi08mLDwQNDgapqIl0DEf3xdgdqfXa
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f4e33b cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=6yf5bMAz9jDV2NJdPn0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gi6a0gSaT6vb3jtuP6rKMBX7KJrI20J3
X-Proofpoint-GUID: gi6a0gSaT6vb3jtuP6rKMBX7KJrI20J3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=904 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file. As of now,
we are handling only the non secure watchdog timeout reason.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (6):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: Add Qualcomm restart reason binding
      dt-bindings: sram: qcom,imem: add the support for restart reason
      watchdog: qcom-wdt: add support to read the restart reason from IMEM
      arm64: dts: qcom: ipq5424: add node for the restart reason information

 .../devicetree/bindings/sram/qcom,imem.yaml        | 25 ++++++++++++
 .../bindings/watchdog/qcom,restart-reason.yaml     | 46 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 14 +++++++
 drivers/watchdog/qcom-wdt.c                        | 40 ++++++++++++++++++-
 4 files changed, 124 insertions(+), 1 deletion(-)
---
base-commit: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
change-id: 20250408-wdt_reset_reason-e12921963fa6

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


