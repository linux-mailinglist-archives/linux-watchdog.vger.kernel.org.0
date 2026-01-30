Return-Path: <linux-watchdog+bounces-4858-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o6g8HZ2LfGnuNgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4858-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:44:45 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5BB972C
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39A23300D176
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 10:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EB936AB5E;
	Fri, 30 Jan 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxD2tAoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EclKDsPz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252D72F0C7F
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769882; cv=none; b=hdZpwrYWmdyN0qUWpsZ2RZ4cy62mj1DFQ1/6mr1zdfwYlXE2dXDokhAveFAv3OyBC1QM1po27XIUnu2sEV9zbwX5LTkaV9QZnc/NkWlIXZDxCOVm+f5uk+QynjlCy2fGnuzQNsCnRdXFSOUXYeMimCbEJndd8Uxpz+RMDuq+RVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769882; c=relaxed/simple;
	bh=UkqzJuJSnuN7H0m3EWp/Ondn1y+Z0aKMJnexqBz9nNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ab92XXzdLoKPGe54SFF9ibbGTi6ciSOAWKXyJcJXihZwP16GuuPhs2R4OP3P5Qvhc1J9L+DxXB483/0tJL45C5zd7RZfWYek+KHp6onWuHayfsm+DibB+bY3UXGhQGI6KVi0Bo+sC8rnIX5WIMsVi0gGUueLKtSxxsjvh2TFnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxD2tAoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EclKDsPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VQDX891218
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KMlzmANYZGozYGIY4q6ueI
	QTYz67Z+A+DviLOBx8XzU=; b=dxD2tAoJt4G2h8AaaRt1eXpcuJ8ejheZHkRNVu
	Px5ucY5XWLzZ48HIZK8C7GaeUTkc71k71W1a/CdeBoNaUoIQjbPDiSNUerjGaE0/
	oTQwoAsgFACL7gIiPH31gFZmePrOBgXa/BM4/JopllhSN5AeQ6ni+bU2ly0LLvuK
	RlXpaDEjY8tch5Tic16T5/BdbFS+u7Y2N1Cq47NPXoidXtosEPMVqVsONnkeh6m/
	98LR5FkatABISP8Uiy275dxW7VjET+jkG6HQ/ZzC0Ilqf3qlo693GauAKNsfrcdD
	vtwxXYohxH77KRf/6WdK1U22JRgmiUokIvGPxYh9KYgf/pIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7sudj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a79164b686so21761605ad.0
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769879; x=1770374679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMlzmANYZGozYGIY4q6ueIQTYz67Z+A+DviLOBx8XzU=;
        b=EclKDsPzMESYAkFj4xm6T+4n9D8O6QIDnyDKq5LQCxPIODtNjBx/QDDxcGrhhIifH+
         fBwsBZyH0go7s6pLQfR6WRCYuE+S2ZhgBJpfTwRq2w9FmM4LXFojUNiL135SWVSTNsC7
         UM9LiJjunZ9ejiQkxRjl0Hzz9UOMB9jWqMzpTP1hgyB0fnTCox/GS7LGnsClSMUMUZ2d
         rdT8DaGD7giXS2fDyvEdDmL6ILW58uCFfoN2AmNRitqX9xp7js1v3uE+k4vyj5Q3C7OQ
         lipw5x519jyKDQB7ZtYj0WooBk3ToCEBa1dd98CyLFA2nT/cxJm9pF1l2zRP10V1qbsH
         kWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769879; x=1770374679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMlzmANYZGozYGIY4q6ueIQTYz67Z+A+DviLOBx8XzU=;
        b=k60kRaq+WuGQ1Z0XNWTfGauQQ5jlR8dHwOoHIs0n4rYzW/Yp8aJ4yBicJroOps49/J
         EPM18BrFNgyR9aarPmQss4eWwlvBu8cbhqAoagaFFyz03AK2s/beBt1/5U3kcUX7QKsP
         bR01UgryV6PbtFc52A7y6stoXachEFdlDSi7fr/6sN9ghRc7You9BhPFh4LzvTPZsv8g
         riJzsBl1taPdzV0PKP6s74TaP9hbJ/BJ20pS/oksXY3tHE0QUZUhp56MvFGs/k+ziLKt
         XizJ8ok+9pnJfGefMsSH+kUDfYElEGIWGIEyDxzfbcya+ikU5mSkFoGun2bjnx46+3P+
         62KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGtH2gx2uQKIbgdDf4ZnpcRP2WEwu8yqPs0V0K5dFxZbQ2oe+WRgHvIgTLPBTAqW9IbynQniaJ1clh+aCUkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkcMCTAsLwk8yiAFti4ZsOWQSdZ0NqykhiphFcUJ4RwdpW7xmR
	g/SadF+jzEKRtms0h6+O9L7mX+GJAaaRmbXm1i+TxxonHMqwTPtJyi35ZjwVI9zB42zScMXfZHn
	/gROAL+UXM8A9RLahZRhiAUm9+jB+o+ovwog2f0iYk/iDlxmy/TRlMlV9/MxCcKY7dX0Ufg==
X-Gm-Gg: AZuq6aKkgdfSNAdmAO6PQ0/QrvRTHJh5v65yrJKMhR+9DxlyARvAjpVSvmswPn4EgDS
	Lkg7JBfA/cKPoIV1rIg0hhVDtH6AFSfFMx1TMaG4qjz7vo2JvOJLrPMwvibfawhAU480XXTnEAj
	lh3WoTSy9fWHpgIPmTxg861qz5ShFtTkr6xqn1ObMNNk1SDTTbhZhmZJ6agNNe0xVzH5j/SpMW6
	C/9LTL4qJd12KUcv2Twz72qoiQ03qYO/gDG+4Tq0zZg7bt1vVdOKAVNslK5aUKGGr8wUzDvjkjs
	c/t7tKQjS4Mc2SCGsOzXAanwMpEA9SoavjhxWUHaYeKoBntiEG2LQHq8cEf3YmYsJHI1nVF4JPI
	SeCgWSgt9khZDKn8Khm0mMN5gqHNl05J0dIgacQR/CVq0nVZI9ZdnR5dHQGaA6GdzBcoWMn3x21
	PNJynH2484tHpdiODA+xnvZQG/H/M9SNVB0CWJP/2BU3Hj
X-Received: by 2002:a17:903:2345:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a8d9593702mr16601895ad.9.1769769879222;
        Fri, 30 Jan 2026 02:44:39 -0800 (PST)
X-Received: by 2002:a17:903:2345:b0:2a0:d629:903f with SMTP id d9443c01a7336-2a8d9593702mr16601685ad.9.1769769878692;
        Fri, 30 Jan 2026 02:44:38 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:38 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Fri, 30 Jan 2026 16:14:29 +0530
Message-Id: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2LfGkC/x2MQQqAIBAAvyJ7TtgEE/pKREittRcNNyqQ/p51G
 ZjDTAGhzCTQqwKZThZOsUrXKJg3H1fSvFQHg8Zi16K+lmPKJPTRS4raeesDOTToLNRszxT4/pf
 D+DwvxhNAemIAAAA=
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=3151;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UkqzJuJSnuN7H0m3EWp/Ondn1y+Z0aKMJnexqBz9nNY=;
 b=s/6iFWuKQHil5X08wCG+FNnWw1QVoBzYEHXsjtJin80TYyoCkFZ5hxZV9G7A7nzz9WrcSIDqM
 y8F8qFWh6v4DYUvkRcngJTf2gd7/ma11X1WrmgOSeHMd58i+uYb3Mxw
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX6d0J1sZG6mot
 seNEChh2LlPPFc1j2XLqRe3xSEor+vnPkXF8TXXBfMcU1V1s2UJ6Sd3PcUFK9278wO/0MUVCAZn
 5wEth8iTH6Z8oIngl9E+j3C5KNG7RiZ1Vu1/H7XRpSno5tBvS3E8Pvs27u4ihTzTEfWULx8/n9V
 wJK+y8phqiuYfRBV4BYJOKEHMCn0jHhQ3poVWj66UEouOJFhjFmVXBDdPZSauI/ZKC3Kac6754+
 VWYYpzY1psHK3cc5exxoOIjUhZE6bZjX8ZeNOOCuvdEbHxyvkoZUfiH11EIJOYZs7D9TnHQpKOZ
 1cvvIf2wTHwEB+a51DukQTOoZB0SCPTNd9J248oD61i2roy28Fl50l7DWQi7OmKETG/inQ3+rZo
 Fll+UVgZSg+I63Q74e7lO8zJ2jM6V4pDwFzqArKFfuwh9Vyd6Uz/isr29a6WAMfPk6v22KwwLY/
 idiFgzF5ViuxE8OU7JQ==
X-Proofpoint-ORIG-GUID: Q_ECxlo8wbRMXbrXXWiv3cblDHVMtd23
X-Proofpoint-GUID: Q_ECxlo8wbRMXbrXXWiv3cblDHVMtd23
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c8b97 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4858-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99E5BB972C
X-Rspamd-Action: no action

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
Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

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
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 +++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 14 +++++++
 drivers/watchdog/qcom-wdt.c                        | 43 +++++++++++++++++++++-
 5 files changed, 62 insertions(+), 3 deletions(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


