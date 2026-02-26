Return-Path: <linux-watchdog+bounces-4990-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCn+FF+GoGknkgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4990-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:43:59 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C31471ACB9A
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 195A032522C5
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 17:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181443770B;
	Thu, 26 Feb 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewZnY7Em";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5XDYtM9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C982BAF7
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125188; cv=none; b=aPGYnT1aZWE7NL7aJ9DhXRYh/i7r2CQKTtKFM5TtxTUoziyEzhc4j8nDz9lF+UOQDErowFjUUeaSYFMCkw4chHfsPR56sZCygwXo9D6WH7Wf/z6kOgwntJRAba25074hdGXNPCp74xq/5gV7fm6O189NphpJ/ZufjZiq4fLwNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125188; c=relaxed/simple;
	bh=DuCCb/XRGzy50z6hxqbTg5JmBvPSG3Rfjn4nj7hqk+E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LKvLqiErN+s1RRIcjOtFhSXIIxVBuvA6c0y90M9m3/8AolBWe1D1WA4Khcu8CXz1Wtr6b/Rw2kaIunYh4fg09AkzM10D5sc6A7rVIEQYfVGQp7O11TzIyi3OZwEqOBR90pJIVDBLiMed2EjGbG572BDnbsU5QjVWJCMRGepTO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewZnY7Em; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5XDYtM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGhrUb2526987
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d2asf21f0pZXYOQMdBLM1d
	V3RQi6lpy5t1gpF0I3/7w=; b=ewZnY7EmotplmTwFRrWJdyoT2KUrZsn9l3xiD5
	+Ql2GpFEqD+HKwd6dzeY4/5Y4VBS/eQo0y96r/a3xdV9kbzNJCQWpdOmDldJJ8pY
	eVw+Q7HDqUEr+RfJ+7LW6mSDaqHDiVpAxOVTwIVXRTtOQh9vOHhUd3eRxU4nr9fc
	/OAOnzjcbKNe0AkCeR1C4uoEpXSm6px2zBCZbvUjOudL1nisIF696cNh2u440vDv
	Gs1MxRWYjt/F3QM5OfWyOENPqyvY52ViAbFfziRXybw7Z0I5kurLKnaeV+06p9eE
	RvZA/CuMHqvyMqAVvJIr8aLzOD2rZyqTzPJRhBmX38URk+KA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350mjau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 16:59:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8273855525aso1108388b3a.0
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125185; x=1772729985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2asf21f0pZXYOQMdBLM1dV3RQi6lpy5t1gpF0I3/7w=;
        b=I5XDYtM9IgdZTarkobzDby1jIivR5xQSQzdYOsxDmZnKRlrMmHnIzmUk9oLg8K3rjt
         PEBz7QuKpXXRnDUYd/rGejonQyGunlNDW/CIjYN8g8+55zbmDg1RdpMj5wclmqsTA1d0
         wtbZ1Li9Xz0e0uZTZE3M8jgYAlKsvBq747Z+LF99d53+zJ3qquPE4OE0KfvFRFjS1udx
         f8kiGwIKw8xrReinnGs0Qk+o/m2kuO4L08cauu7zqB/CX+eGEBjxQjup96ABYvME6V7W
         hE7/2rYZMmGNRdNq9tvYIqwyA2iySmTo3tJ8EGHl2O5sK6bGCJ3WVlZ/SiBcxKTmo2WM
         jx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125185; x=1772729985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2asf21f0pZXYOQMdBLM1dV3RQi6lpy5t1gpF0I3/7w=;
        b=RdL7cuAfKIJJExOqJuy0t4wK7CyicQe0XqKjKAsMV5mkuIFauKFBvPz91okmQ/x7lG
         TrvrOKhDCIdvwWb8HozAGpbPVnUd7akDXE2db+L1+6Oe89O/XKYIICVhKRy0QoCn5FMV
         YQCHlZd6lu/FKdJy7Q939F2zMF0GYIJhMOcvs6NjTOg6xvVXwgx5O6XWbQUKsBb04hEq
         4oAdlJ8hayx92gt8+gVbJ4yExNkZZewjZBl+/ARH+GgAjWz/euueOThyfhVAq7uy8D9O
         D3OGcOZ/9Ecg0KVL4rypWyDt4B1Z36E9lKcjEH6WG6kksfbeSkj+Gc+KntQvvIrziV3X
         uoMw==
X-Forwarded-Encrypted: i=1; AJvYcCVt9RrDisMbCo4Hid0PP5M3/QmbF01EUMtPYG0JCorQO4eNZTI9QKxd/E8yJBetw/ir2iHSqj/xmy4pNMUXpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwypUAb/Dquy0xNHqzr1MY6wHkxexRnk3F6xKj03WEAtwVqiUTP
	MBHWYgVUkTMZ7i1pVvzxZZajw+XaQcWU31afLULUw7gIq5ozBvkE/kVnwN3ogRohPxyhfVCidDF
	uxV6zZrCl1PWi44mYMNrS8hPzlkphgEd4jnqHjE/ZJLjj+9zNkmFuRYI80qQr12uQynZ+0A==
X-Gm-Gg: ATEYQzw5CbHgMbAi1+ykaMKNzTKTtnBbrqmTdeRLoYEcvvcjyG0WyAXOW3EJZdycc5E
	lPYZh7ybkEa+DaXZ0idg1viKA1OqDGwMhf+j2Ycx0p10SWZsjHRwYlDyWbrfBBXU6fiNyH67yGl
	DiBGS7GHblgUVZE5FikpUC7VJoKYMCG4P1ATmLC9GKfiLM2ur50E0iG0ig3oBfaUyhfM6pa0+3O
	s02HGXfIDEbjAfvaU+zBNtwP7qUze4cCvlETbblAQ6uxa23NNIF6MCNcZ4dWamjrVlvTO1BIyyS
	bDusqh/zcZsPSxLJon/yLGeoe/pOp/hfnbTwqciDfhQG7LsNie31sFVAfHfIvRUEwlmWPLB0eN7
	ZK6X/NyDhxgmY+Vu3GlhyZfEnLTzGfuB70zwmMCEYqwGAPWNurZ//O9n08wGbhLa1xl6twg5eAV
	JWILKNep7BOxX7HhEmcjLTTDSCc2AiX8waD4Q1K0ccjcIYMABIdI3n0NfX
X-Received: by 2002:a05:6a00:6c9a:b0:824:a466:7470 with SMTP id d2e1a72fcca58-8273980607amr3318732b3a.17.1772125185225;
        Thu, 26 Feb 2026 08:59:45 -0800 (PST)
X-Received: by 2002:a05:6a00:6c9a:b0:824:a466:7470 with SMTP id d2e1a72fcca58-8273980607amr3318704b3a.17.1772125184707;
        Thu, 26 Feb 2026 08:59:44 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:44 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Thu, 26 Feb 2026 22:29:35 +0530
Message-Id: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd7oGkC/23NQQ7CIBAF0KsY1tIAFaZ15T2MMbRMLYktChU1T
 e8udOOmm5/8Sf6bmQT0FgM57mbiMdpg3ZhKtd+RttfjDak1qRPBhGSKM/o209VjwJw6uJGClrp
 DYIKBJGn28NjZz0qeL6n3NkzOf9cPUeVrxhTj5QYWFWX0wEE3UNWtqeHkQiieL31v3TAUKUg2I
 /wdIeSGA8lR0sgGsESOzYazLMsPhpfXZ/8AAAA=
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=3591;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=DuCCb/XRGzy50z6hxqbTg5JmBvPSG3Rfjn4nj7hqk+E=;
 b=tQed1FF0lltwTzC7SkqiVeV7oHUd4NWOpxFR032Si4YzylEyb9Nhr90xfpmhVIcpJ5UAR82cg
 cq4I9HJ1byDCdWEK53Wv7rmtk6DII4sgL+FCYo77z1L1qFgfXA1fehK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: hjZYhOFOr7bwEocSploskl8aSxv5PwHp
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=69a07c02 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX0INyG100CHfF
 nZjJBMpMZN6f3yiw4mYj8vpzTT8wEfYOuwQysoILzjwGFgWMIRnGAZdZCpoxfFy/DYiLxcgUjdx
 8uHBXZ4mgSaBWlHRX4VKsP2RDpLQY7PKy33AY4oi0rjWiGL+0D4y3VNk4M2AudPQwpwWauR5jmw
 Bwm6+s6b3G0g6mLAoGLtfy+CblJ8QgOp64O8S0wQtd5dxsyM0jn4IZ0i85nzps7t7gjZ+406itx
 /uukQtS0jfuq8Fp/g1EtOtgdVY8nh4DY4ZQcd7726Z6ajhmLQZVGAOk9sw3cK1JZTwUn6U4TfBQ
 1A9Ddn4m/qK9N5BfvipM4LyEjl84IgH2EX5ksoYXQcFBwvgX8iCMFenj9PusKRi1uxBYQ79Uegr
 jgoSVz9HiGLKaliwdgxOXEQ9BjUAaEXrYRAgiDzOxg7GgvnV/JfYQ7H8AC4sVkiI6RL5F0ITtba
 F3x77c2BSPenF238vhQ==
X-Proofpoint-ORIG-GUID: hjZYhOFOr7bwEocSploskl8aSxv5PwHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4990-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C31471ACB9A
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
Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

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
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 ++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 16 +++++++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 5 files changed, 63 insertions(+), 3 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


