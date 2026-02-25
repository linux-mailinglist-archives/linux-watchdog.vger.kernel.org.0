Return-Path: <linux-watchdog+bounces-4982-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFm2LDmanmnXWQQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4982-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:44:09 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2550E19272D
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04C7F3048078
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A880D2D3A86;
	Wed, 25 Feb 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTgyfSQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRIhxctb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762A17261C
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001835; cv=none; b=nc1cfShozgA8fQos9uTLg/vhq8vVkkFlIaAGqXBh7/HETdnmEkpg9nW6WbjBz00xgxbgx05DWjhGqlVP4OlN9bBXtOohlxWGWoIi6jOGD0yZQH5kv3MsB4+8tIPsFVtvJmdJcEAuo1GoOrGAuxl7negwxcwgdn5SQh4TYeREo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001835; c=relaxed/simple;
	bh=klb1mTD8W7Su19cIU10+TMEB/SZUUf0xo+EcCYWc9R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9vHoc6C6Xacld9vDun2oAEppxgJtDJ5PoWrQfjSsrhb+ybyo7Poi+nVi1aXoF+r5uIcj7UyKr9LlaGluAzyvyf4cqa7AmSgARWB0JKfOBs/eWy4RInBk7wxcO8EpgviK5/CkqqfYb+louPv/Gg6q+1aUxM7v1KXjxEr8v+Ay30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTgyfSQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRIhxctb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P20R5e3660279
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=; b=VTgyfSQ0bdsBVQFu
	dlkKE2M3CByMfFZLxSIYReAph7+pYnyMIrhqjjge6rQxxbAGqikas4JG0TeiEw9n
	OP/ipIxRnulc/eXXPN/KCLoyhclbaczhNmAC1iCDXmXQ1FBlpGYQjT/M44zhrrk9
	ai5PZrLpuiE0govCu4fS2/5rkR6W9mHN9xIaxBx938R9pLH3L9d4vuO95/qoB5fL
	B4P8EazRePAG/fOt7CCP7+mHzYahBhOLsm371oGdR/McOyCodu6z8oAWs6oO4aLm
	RgtncNWgE7C6SOBUChHvCfs8RgHd8/1nefhlTdnOIZflG8FIfvpCNf4LIqII8GXp
	97u56g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sa7nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8244932b122so18927708b3a.0
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 22:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001833; x=1772606633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=;
        b=RRIhxctbMz68nBn8IrJZqfQr721kh+T+oy+wu8uJq25xs/TPJbJ2mKaaJ5tmDFHIm5
         UmyYH0ea8RwVh/39x4vsTDQviPuSNqXqsxNej6iQHvLPYnvZjBjR+LIns4lQnBlhzYnu
         YB16mn6MwTZuRpm3REwlkZr+68wpoCOPpPExx9Xl1LtmQTA5p/4MLc5XJxWenoIbwYq1
         OrceNgJhT1f+QeuBKKdhwTD3CSuen2mLa6pBQI9GkRgZ6te271btPjEchmP7yVbQ7SFr
         977WffWvT/33jznBV1eziR1vehepd8OUPnJ3kh5e6uL5wuuRD09YhW+RXXRqGBc2uRDD
         ERGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001833; x=1772606633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYpFC4PVupG141m5ztdsDiNh49sOlwcUYrUhCvXRdlo=;
        b=GrNLU5LdwEDUKlmjYicNLHnG6lNpFeVL+C9GwNS9AXwDDG3a9+GL2UZMR7QSNDsVFX
         KQHEC+h1IyBAW0U40bkI2bS8iZVO/NRWK0463xRVVhMrco50caxeT4+qt7c5Lb0VlKqi
         93RbFzlBe2l5l4UaY/rMLx62RkNsjYT+8pTtRZZ+W5dHqMF96WtA6Pr19S+I87gzaCQ9
         m5vRfLn15PzgimnlEplIPHdUJvR9uBFcGGVc2LhAWWe7F7uUoFrsaptK5Uzyx48uMLk4
         MjQNt60vc9u1Xjw3bFWI0NpRyCHMkf6qfryB1zK37LoZ8JF11IAWa8YHDnwQFQ0qLvOk
         2Cqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6tUMg2WpyQ2LeB+V/qeliwcVTbp61CJzaJcmoS9BaYHSrVyBew1VJazyYXOnqR2WTjFJCFKqq1VDNG5Nbcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+F0+9mJEWVkVi5MxFWc1XMh04W0V0IB8x25drPicUwjct8BxX
	ng1OCktckaoHXVa57VN5Xp+jrqUxaPYZxKMNvk1F4AinlN5/ZT5rpDf6uqk2v1aA/Jmt4JMwgFr
	3zn8A2BMOTkqtfg4gq3cC29uK0UBOq3n9GoXPnnyo+sWiTSEdWLZNqmGV0qYxWWAjcy1K2g==
X-Gm-Gg: ATEYQzzmkQDKo1+CEMQe1pecFENvLCK0Uf6MgJBbaikp4K4duCgnlNn4Ng+k8CMqmfW
	4O0YRGAX+InfsIywdOK4X7hA5BtgvOieXBb8jTbKc8PSQQDG7UVhWdtK9EZoAjWmdsEm6OXnFOa
	+iZCZhyo6E+HxtRLmEWfPH/erWGV5MXa2vMirHv+Xa1YZTyouCBsUogNontCfBJfpNaTs5ToxDy
	VPkbohFkcz7dajjxTzz9BpIO36ZmGXw4GfPZiYqe9iUgADoXRr+3ix1ceZ8SqhsMeMtSHKGkKP2
	o+LkhPvgo3tb1WIgUIWjazBNifLk4wJMkry60TyuuLLrgMnDjheEvinxrKB7hfGTNVZwFHs4j1x
	+pTqvHiXWhSMdk4kxSFpCd+0DmatWrxcr7fB8Enf+rjh7EOqVcGHrGuEhh/+a5Z4pIwT1Vegt0i
	sV+lPc5TDqexWOIvfhD51s7pYM9rDqcwFSm7+wYi6Vzx/VnKuwVOGtfzxG
X-Received: by 2002:a05:6a00:4188:b0:824:a25b:db0d with SMTP id d2e1a72fcca58-826daa7909bmr11966096b3a.56.1772001833059;
        Tue, 24 Feb 2026 22:43:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4188:b0:824:a25b:db0d with SMTP id d2e1a72fcca58-826daa7909bmr11966079b3a.56.1772001832653;
        Tue, 24 Feb 2026 22:43:52 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:52 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:14 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-5-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1448;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=klb1mTD8W7Su19cIU10+TMEB/SZUUf0xo+EcCYWc9R4=;
 b=tl+1L62HFJaNbdkNyXKuOqh52kv39BTvUUSa1o61BUZhftg44KgAoS1Xjyk1CJhWhu3ECCTxU
 lrh8Y69ELX1CXi0FP15SG7RFYnTcv/wt3NHRieeJ6N+YNU6yk3OF7NK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699e9a29 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: wfczwJYl5wmpxLzUzhMeeW-soy5VudgX
X-Proofpoint-ORIG-GUID: wfczwJYl5wmpxLzUzhMeeW-soy5VudgX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2NCBTYWx0ZWRfX6gtpM6FPnTZh
 gFa6M52h1kz5N5qztkeMU+PdIZIjj5XKr+W0cX0oJq0dFwFrHc9g0GkqTHhc8dYhdYGV+cOkugV
 i0NO+wUDP6FipNRxveuRGlYWYz7uRL+IZkvr0NPr6r/GBg/kDsYwoa5EMiQFW2ezt0C1lmK5X7X
 E6jXcVcHfvMkxyida9u2pL1UJFBYMdtT2NpEZ5nmstORyzVah7/etgDAXE3K8lIJIin1cAmEEvO
 qJFxhNSpr4JRjw55gaxnh0YxFEd3lTo2E2dW7COyaq7xnsYoDOslEuTBspyloRzmP2jlBYJw+FT
 vn8lb/ENcoZ+HeHb9SMNbwQ+XwwyZeGaKOdt39VYIVhVu3B6z1Ua8uRy4PISeGU9QZCYru/ONF7
 M5Rhwy8TMMTCTYVljggjFByS4Ga42/eVXPX31ZIFhc6z5WBYIjmRqNJ7hDNUgyqs14e0cnGDEpy
 gA0CPu5KjIXe2MEY6WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250064
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4982-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,f410000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email,0.1.21.88:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2550E19272D
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v7:
	- Picked up the R-b tag
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
index 491bc3b00494c47c5524df069e9d65bb4654e863..86de974949f48269170a2bfbeb64214d37fbe488 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -706,6 +707,10 @@ sram@8600000 {
 
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


