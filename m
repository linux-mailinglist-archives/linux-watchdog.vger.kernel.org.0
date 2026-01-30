Return-Path: <linux-watchdog+bounces-4863-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ6DGLiLfGnuNgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4863-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:12 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105BB9763
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F1743006177
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0824B378829;
	Fri, 30 Jan 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjpJVZ82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Op9AQByY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0E36A00F
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769907; cv=none; b=bcivhqdVAeVItmZbivDrWpSQRSTv2K+3A+JO2Wm8eLPIOTNt1e4V9DTsOxnFAB0j/9DiYt7SGmAZF5zOra+WY0AqFWnUbqmO2vUXlDzx+gjO+MBmgbAIH77N4Z8EE2OvPj8afDinYxTnXdtwT93ZM4KLOOmIElFMkrYiQUBdqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769907; c=relaxed/simple;
	bh=q99Qqc+U7uBkSM9gi2OdFlBatTczLX8GNf343bWjK5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ijf18lGgNaPN3XNRFa6+28KjIgrzBB4cgD3Tlvx5DX6XBOGwR1e/w1qlMCzNOAQVo5MY4eOPJcPUGDnQYcSqVgoMwpTe54VLt3ZpmSie3awkpR3Rj4ah3UGm6tD/wGJgofPKCbJySZrysJps3paKGSqzHeiHNHX57CdsHWs0T64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjpJVZ82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Op9AQByY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9UxgG2675365
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=; b=QjpJVZ82KSZaELDN
	rPLTOrCm6k5mGfVwwtnmLUVlQpNKbiYNYHzFjnMTZ2P4g0Alom+3bsu1eQONntp7
	mg+2iYZK4DvQzg/k0tccqqNdVoRu4sVCGJq9Xc3SHSjVf2379KrNuEKAivY46TsA
	PeeZPQ449xPvPukiR5MJHMxpXsePRe1RSSwFiR0nM1pEjXSOvOGd/mvTbWC1J4yd
	MWqwe1o8ER+cTe5n/UYqp2IDI6ZyEvpm3okx8rQa8vt4caglkZK2omK36+aCmAwX
	wxYUhWcLCY+w2/OqlL81rz39zX0VsqKIwsg8wcimJqUSY3ec7SVUvuiQ2xFlnOrg
	fsHoDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t3407q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:45:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso43065185ad.0
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 02:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769901; x=1770374701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=;
        b=Op9AQByYJZ2IO8mtRDe5k3lBkFUAdHKEEV5VOlFiZQi/+mjQj6D0Go3LwsE+OG2oT1
         snrj0gNq7xwSwYCUsoXWJo+3e6ogJTzty1re39hZBO18RRVYvWyH2Yno+eIYw7vC6XI1
         mQ+VYiwnoN/uipVmeoSHKGg4kqIT2EZ1Mm9e0kf5qjgWYY/orw5Ym0eu9O4dWf8wVdtc
         AHB2+JOEjf6mcHcobnsRSMN5mRBtyT6EHdFifn2ycRgppo9+hzlpFiBxaFyfMgSSofln
         rl5wqtyE5HPW7BfN3KYMN0ZXFtCDR2P3Ctm4GNSCTxvuETCxogWyDjYmqUU/cm0t3I+i
         ls4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769901; x=1770374701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q9VuwPEH5V9+Td7nRq5PK2t6fgfchqZ3xAcPCIZiZK4=;
        b=RR+FFAG5P/fB4srKYKJD0Af0RCuexEdLwyTExiq+YNguwNCheuonrmWP+xeMj/xOv0
         AHsFzfrLqGPGiFrqjHdZ5CkMTIcsqvPhxNq4rpqVYapi9m9j6Cs9Wj+UaPUzqr5oWpGb
         kYAuAZy5AufcGv5zlZpfxGMschQPW2KJnpUSd9LrxWIsWygudv2oJoFa5vujCQ3AKk0R
         jYwqCsJG24kDmdm85gVsJqymET/H7m/28z+YK/V/suect18xMKSD/tXqvjzMXXa9I8ke
         rXaWK6bW0oWE65IrrXkx619o0Vn3qvw7za2azocLQL+y2psP2TzRLV2GPKoB0CwBN0wn
         ASMA==
X-Forwarded-Encrypted: i=1; AJvYcCVGn3ENPouj+z1qFhYYz0qu0jLlkRE30jUAawp71XISwp/3tbPK47MU+31YjsjkRhZ19EgGWB7FVi7Bxc6nbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySvuKnGtZ2HlXR/PHJJRVfYg4Z6a2gd0lPbibGgHrpwFpoddF9
	pOMlovNxNwwD6dIRstfSR23/1LyyOeRxHdSXpc+1atitEdcab3+wy+xmxrGftpEMm/JlZ6i1Y5L
	Pj4uY1NWl+N9XnVU54yNmcYOff/0EqVZYFeCb1pCp0qTzIgr19vPcA/OCaqVG9vpG3kYvgw==
X-Gm-Gg: AZuq6aIRNYUQgXMoLXYooQD0vHjEJ2Bs0sKdGnmE60Ym3E1rIFNYPCL/U0zJOPY9yaI
	GUz4E/ph2AOLzbA4cdDZbn+etBivphtR5/NGKpDcmKAm/lPm+9tIj99moWa02oTl6VpcDHIxqPI
	N1Ey3FUGtdQm1EPx2U8usEs28155eqQQmdVn/6S7l9DC0iNnDdVkXje6aaYo7TuJ3EgFapgLT/u
	xx1yk5ggpNtpjNL2QmW4T6IEwEgRpPHEL78heJA9CyqbxoemQggWPEyToLzkxWFF9PxKpBAFDo3
	ZG7BcFvOeSkmFu3lzRwltRS5RaZ9nGqFyXQFKxAANGOLPcSHpeJBetQxuteBBoojqCD+WQ88OHm
	t4SfGJeZUADsYu/bOnxJQN7aJumpNXNAdDzFnZ9RFtz3oKCabNksZtJzNscQG3b/tLUC5SIuChq
	rQCZ3DmtA798jzIiwJTND5/sE3yW3E4KEb9oxLfDtjoqXP
X-Received: by 2002:a17:903:1b47:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a8d99404a0mr20467685ad.50.1769769900704;
        Fri, 30 Jan 2026 02:45:00 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a8d99404a0mr20467465ad.50.1769769900262;
        Fri, 30 Jan 2026 02:45:00 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:59 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:34 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1339;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=q99Qqc+U7uBkSM9gi2OdFlBatTczLX8GNf343bWjK5o=;
 b=Ghfc0JwemKQ+o7B+z4KwjfCC4qGkEMzypMum3Cld/85VCjFIeIRyqQjynccIedvTvMJlLKkU4
 7wY42maPE5qCrWWxq3fCi0YSD2zjU9txw7StJjmuJZpZ+NxdXkaXXWi
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX9U9zPkAkP4Qg
 ruMQZsigbItJhir2IRUg7Jzj93Ai88ttjusxuyhmOcFMxLihbFlONEwJooYt36fxskd5zt64Rw/
 76Qlj5ZH5WAk9LDetrfbK4ir+5BBJMFfyFRZBbfFl4QKufOgNCouJrD4udaQT61hgFsG/hVn2oZ
 OUjemvvGgxRuRPAiSRvTGkfAsGOleiCcWdK32KMxHfLN0G86HeD5YVnN3xZ2Q2eZLHs/HhXAZiX
 xRdEWvkZxjw4V7FjlMUzPIlWx7/hdSDULHHGWuBpK25xxLf8UB4T3/y6wfOVnHBgIsalUBVrB6E
 rRVM+D2Nev4oMd5sFKTib9DYbs1bcV/42ycjKP0l8iGHAudUBy4UJtlJVGfSyZlMRR54ux6fgR8
 QiuEHvmF4KNPE4/Zw8EXVla1q5/dUTwR2np0CnVUTkJf/BxauNREmQgeTzE10XCxH2SC983xd1V
 +Pnc7gBy74XkrCM25Ug==
X-Proofpoint-ORIG-GUID: ABfYTNMmXZxhFJ143xsUi6cEaAZJofiR
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c8bad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H2taRdZ_j9poMSv-UmkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ABfYTNMmXZxhFJ143xsUi6cEaAZJofiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4863-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8a00000:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,f410000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email,0.1.21.88:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0105BB9763
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 90790f99f0597b63801d4e07b9b72cd372ad46d4..dd91113c770502346dc4c65bd447a14bcbec4a27 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -704,6 +705,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


