Return-Path: <linux-watchdog+bounces-3314-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA2A8B3CC
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4279E1884FF8
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F322FF5F;
	Wed, 16 Apr 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTSbokBN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87960230BC8
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792175; cv=none; b=hBAOZt9VBxWIfuwoGu2ko5NslAgu9/pEPyYohDmQF65wpqc4+UVMzz0rmeokgyfogMmV1xDU574RJX0mNkPQ/mQm59f2i+xwlGFKsVU7ahNFkB7KFjwJrLHYI32exI2WD6T8vlIz/1lu3UNphORclpIY0YaKtwORbbfunLFcneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792175; c=relaxed/simple;
	bh=EA8oF/ldbOsSYZg81B4t+sYTz2WKrNkigSOvYkT5d8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MxPqH0WBTEh2XgLFNU90gPqxIEeQWDtD1q+vNBMqjr+VWjXgEb27hklCATD/mhFAxdFK2Zoeg5rk2wUiE0LWglkviMW3PQYrVTkquD8oL3+jNvWiYC99oczH62A+4+s3NvdLq6fCa7EZoehm7Ykv/YtLkbbF4uIIAMXKO1UyJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTSbokBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G87l85006496
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=slpc2bXbOCKha90h+sjNzl
	g3kbkNp7YexaKrDiTDN/w=; b=oTSbokBNImZ4hh/AOWmyP0XO29yfDjE7/gYhPa
	eQg1jI/tBfvXaALTD0+XEoIYLuZ+vMnDzvVSnmDhd7QETQ51JXZYKTILd+bkMkHj
	Kzeo9gVX3T0jrctn0E6pZHmDLWI7HjYijAq0nrovzvYdMth2AmK7hGyANekUdDgK
	l3qEOPRA/Uxs4JnqmDK2StclVT503mOh3RMx75zA56yKhANzOvXTHc/wKSIkUdWS
	twjdDN3zVyHxzrsaQNSkq5O+cpqp71rrDmZeQWztesAi8MsTRbK1U+fZC/QRN7nI
	2PLxjZC99aSqRJJs3SU3EDUMehUgSUHaUZdXu63IB+szLmyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rv8225-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 08:29:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ce15cc3so51365055ad.1
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 01:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792167; x=1745396967;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slpc2bXbOCKha90h+sjNzlg3kbkNp7YexaKrDiTDN/w=;
        b=FHHgIkfw+DGOb2EEgj67z/D+Wb3JEqUj9I3bqO/b66nOpUJxR1cd8qjc2MhfoSjQeE
         q3lJNBicCAmo7crrkYCEoR6P/ynB+HgS3mtmyeugXjQH6lEY3NfR13Xku973YhkD77nM
         3mz634dZXAkay32X31bS+RHK/gPm/Hbq98Wc8RddM7hrBxH+bFZYqx49QS8sknZNyvbh
         gj1LMKgm4iwv6Uaj2kVkqMDKYq8h8Dqk9uhsQo0oHxqwCFjwtoJk4UQzXRXyCzBFgLI7
         Glfg/t3h+Jww6U1oo6Nc3r+xb5RGPCx00/aXWGylx7vAGqCy3HjepENaekdW15tPxkYK
         2qdA==
X-Forwarded-Encrypted: i=1; AJvYcCWi2xbc0eNP0RztjqI8HABKNgyZWpa2eIP/GEQYPSyL7/i5HOSUu8jiIcJqM3WrBrnQtElF1PgPEptullA3Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeShufHzKimGbjWIDy64qrwxhrqSpw/1GR7n7Uzq7qjQQlpKPE
	P2Zzmg+PYMruYqPPoJ/Ns09MdKS00LcVSPDjUZw5QXVEsNjWonIlgIAmS+AKmj+RdM9PJTYxZhh
	fVnQu5RPaHRB9IiNgwslADK9HvQz6vGf260CmrQd2ecFqWM+oKymZoe1lJ4hBHZuCyw==
X-Gm-Gg: ASbGncs7pRZFRGseGMqNmJR+pu8fQs30SpQSXqJu1zAZVeKgYGA7G2A7hvkmdCJiFQk
	NQdcuwsiJxIFVcHN09wFMLpyETqbRsK1G1C+v2kD6qNFUM2cifw22vrDM42DM6F3tl37FdoLYR0
	+9XYsTjgbBheypDHJqwPHYi83h9F94YyYezN6NB2T16FrR34iTUPIawwKTunJIEc26rejeOYRi8
	i6NCsRmBiYFRM76WhLhebJJBOX+jXLDrnDnxNzTAD00cEjawlBJ1GtT6KXg7+kLsyMAuAK91Jhx
	EN81gh72ZYItRoZymvJGdV3Gl+S+lJDkH+IAqwtnoxBvIdZldeMf5lBAUrsvtcom9qRIYon3WlW
	3+nWosn7kElnoV0YesXlJNspZxhtk1A+4Tu+a+AXbeJOXzow=
X-Received: by 2002:a17:902:d589:b0:224:e33:8896 with SMTP id d9443c01a7336-22c358bc53bmr17010715ad.11.1744792166990;
        Wed, 16 Apr 2025 01:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkY0IYvPuynwwUfpOe7++iQmfTfrqoDmd0WU5zErlHpIIvo01R5A1nx55oi4Ov6D0iV7F6lA==
X-Received: by 2002:a17:902:d589:b0:224:e33:8896 with SMTP id d9443c01a7336-22c358bc53bmr17010445ad.11.1744792166626;
        Wed, 16 Apr 2025 01:29:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add support to read the restart reason from IMEM
Date: Wed, 16 Apr 2025 13:59:17 +0530
Message-Id: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1q/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3fKUkvii1OJUEJlYnJ+nm2poZGlkaGlmnJZopgTUVlCUmpZZATY
 yOra2FgBTMDTtYgAAAA==
X-Change-ID: 20250408-wdt_reset_reason-e12921963fa6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=1923;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=EA8oF/ldbOsSYZg81B4t+sYTz2WKrNkigSOvYkT5d8I=;
 b=azUibPrixdPFYTjGH1Dn65iNy5F9mluVpJcXL0XLa7TgNcdNm8r2Fz80gyro9nclD/Fk6SPkK
 lbS6C3/1M7AD8gd87h65x+IS0GhZkIDpc02RFHsCAhnCFRTvrK+QNoW
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: u03SBwycua5SpdW3PwwMLF6lgZJYnfXY
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=67ff6a67 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=6yf5bMAz9jDV2NJdPn0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: u03SBwycua5SpdW3PwwMLF6lgZJYnfXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file. As of now,
we are handling only the non secure watchdog timeout reason.

Konrad, I sticked with syscon API to access the IMEM instead of exposing
it as mmio-sram to align with what is available in the mainline. Do let
me know if the current approach is still not correct / feasible.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1: 20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: separate out the IPQ5424 compatilble
      arm64: dts: qcom: ipq5424: drop the fallback WDT compatible
      watchdog: qcom: add support to read the restart reason from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  7 +++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 11 ++++-
 drivers/watchdog/qcom-wdt.c                        | 47 +++++++++++++++++++++-
 4 files changed, 61 insertions(+), 5 deletions(-)
---
base-commit: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
change-id: 20250408-wdt_reset_reason-e12921963fa6

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


