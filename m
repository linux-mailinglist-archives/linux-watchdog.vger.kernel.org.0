Return-Path: <linux-watchdog+bounces-4995-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGhrDluFoGkakgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4995-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:39:39 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7C1AC9EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 18:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01C8C353BC6D
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Feb 2026 17:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D45387591;
	Thu, 26 Feb 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuUcFi9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SI5N+WK0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5E42B726
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125213; cv=none; b=CQ5q8qYUTK8YUR6tKpP0otCI3UZFXJLZegovPt9UN0K04dL5bvHSXDWZWQ/n7U7aMtryf9edpQm6JiQlFShJALzs55FXI2n8jfYXnW86XA2sZWIrbT/NBA1MoCw1BzMHqir0qTn+eIlRt2BbAt7z1E13aHzvn57PC7jZSSsrn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125213; c=relaxed/simple;
	bh=gPVQ8S1LAyFSJ2kIEZxgLIWkdzkbKyz5I/jS24nk1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fri9XdyZmJDwLCN2/SrVwEd+wtK35UpfSChIbNZsAl5zERK3N3Rhkfja157KlAAgAiZKkLVjoC5Ht9HnPMJ5VIehhSCEipN2o9U9R4NVy2iEiGRKyBraEI99qQkE/ZyMRMieSkSnWjFB6GrfPhXtGs8WA7kRpAwI6UgKalcO6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuUcFi9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SI5N+WK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGiO311203518
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 17:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=; b=KuUcFi9r/GN8uxvV
	DRu0kzC2umOWlvBmVSNckC72D37WqcmC4dgwNAIJHWKWUGovBZSqv8RIc9HN2nb3
	dYcVNHLUJJ9VHBPQwLFFQHGmL0s1b/p/1DLq/JwvIFodA0zlP9Z1RPw1R3ruL7Km
	yTTmZMfj11QZ4ZXcr1tUo7TvXd2dXpFyFFoT3S22BnagVMnXRPnUs5BayPLCxffn
	vR7pd+Chmz75s69LhNw1APMqVwtTy2GwQWdfMMxBbcAHNapaYGxRdp6Ife28iPvz
	Wx64/uwjqtz2xYB+MIN4F10dt9UxQcnlNeBVS1+JTWi2onxj0TbMeu7GvwceU/xN
	y4wYxg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bdbcra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 17:00:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82743548947so1312073b3a.1
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125211; x=1772730011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=;
        b=SI5N+WK0mzyuWaOe4F2x/PuGXPKXB248kbmJUC1ec59R0LD5JP+AFvrsPjnNKaPmaz
         3qHNMcj6Tahi/Gu02tFCFoZ/xM8biQknaX2AqMqH4SnEbczuMwbFvZoNYQXS0Xs/ZWLD
         1SAuv5tfT/utc9fFMKqPwh7RZ4VCzeDkr+sLbrUhelDp5Ddt3bGYAdU49YFfXqmXTxns
         OqY593uijQ/LsoXBahBn29P+N+kWWQ2QLSS3G10yjyfea0vMmAoge4drvE8/pNFxOOZB
         i6AuAfK2KY3uQ/GsGojiWdivtwUCf3FwEONRcKeEn0Zyk141faFXrEYpSPewA3CK6KKj
         LGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125211; x=1772730011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=;
        b=Mhdc7LAVxyKF0QjBUvRMhAGA53YMjcNMOxD8ajs/XRFCly0EukJtBDyDKjMNwcLQSq
         v0r6TeTV2vQnrDL4IP8iaTVWO62YEUJHrnCaj/GsMxhVJO0Vy0P+oKjFGrjgsj0KlQqk
         i5+3JsMnitt3oxcUsd2jHemXbJW2S7/ZU5m5iFaZYHC0J/sxsBqx/C6XrtGv8E8hUeo6
         ehumCObF0Q2MiXLHHXru9Qh/RwJ47H8EpZJ8Lilb6Ulh4xk/9YqiXLG+bn79+UaQnVDx
         Lgt5eOy33yuCtptORORaHe3k08a+f7euLs6BetA3bg0eFLKRx5gy4gcD+3E4PyNHT+7W
         Hbaw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9aeI5ClOCXmVtowOffyUkFQ0Mli1uwOVDaGqaagh3YVERFbCIVi73KeajhTC6qjn96Fp9erGSEOkJ9JSGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxIPBcjPB76FOCoVglgwI3pwnryOcQ++UaO0fU/9c0UHeQ5NR
	Kipqe3Y2/Y2l2XQnZi5dfs44x1KYRO7rYjZZGCkyzzdctjFg3AItIXF/Zo7GIsaRSOB7vXZkgJW
	pTu0uCtBdOjeYjNZI0zHAlALRJFiJrfTfBZsJtOGIBnq4RnoiFaqOjhaQ+nfgc2zwf+A/DA==
X-Gm-Gg: ATEYQzzODM/0txptSnwxoJSUqc6IekFR3iW99r5ufqXfFj8cQlRMJZra/MHQKJuqCDm
	YE+ki/eWFqfj9fZkwazOjptoeFdckL0Ks1pRnh/R7lBPvOBCmRmKsvXWc3D9BqnO0wXkAXFyWvi
	qm47rmh0BC48INaawE15/V/Poswc8Uea6C9dlNdI5IoImj6Zihl1x7TGiIbRJai6fO3MfareqAS
	NIRsaImPq6VCBMFo8gF8PLSBc0Z9Fel6OgnXmlLvqjOH5uOqcWWzXq0wP2zgCzIvDBQirK4wGDa
	Xna+B7CE5Ge6BKsxwgs4eIJw6A7noItSvLOQ9BdwbzZK5R13V8aeJPvEiyiNd9hcrjh6xUkWAFW
	9kfnZjXaoSnagunCRUGG/shgdH00DZD0+OHPk4FlxojeEwD7s9zrSycXc+q1VgltAKbk46rC1xk
	RVnmeQzFe8JrvHJdWBiAa0wITOu86reZPqgpuzL4HipW8NzVcVV2XLwwKi
X-Received: by 2002:a05:6a00:b483:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-826daa1ff11mr18495283b3a.47.1772125209246;
        Thu, 26 Feb 2026 09:00:09 -0800 (PST)
X-Received: by 2002:a05:6a00:b483:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-826daa1ff11mr18495210b3a.47.1772125208339;
        Thu, 26 Feb 2026 09:00:08 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.09.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:00:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:40 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-5-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1551;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gPVQ8S1LAyFSJ2kIEZxgLIWkdzkbKyz5I/jS24nk1TU=;
 b=eWY5KJ7an0ubp5dCxCHLe6F5zfmqxb4WfQfUBtCXzr5KlQx/DEiqlhVZnQ98X8rvB/XfDN2qY
 o55zoOFdVh8AfsmzZOYtwzxYl/BCiEcQHYjiGZqy0igmvp+6wvazrO6
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=69a07c1b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Nppw0-34gcEb2MaYcXUXXzNrbt7P4Vb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX41y0ztxH9bFX
 DZslApZPP6dItBQA3eU4jtBTGIISD9g9vEWyf7jfQ3Kj6JyNgSjgy0WfBXo8q2hxVch2+Gtqadq
 UnnFI3Z3AyG2e73aWEsQ/ykNGGm1LL1pcgC27AKxpnbHdPZBr/az3dvEJiMN2sTW8pQyvwjylxF
 qJVhyL61kSplvOW+M1vby/DNe2IQaCh5m76Zaxb3lLhbaGgtqk08dkmVykvMcVeOti3qGtAwJVp
 ObzlRcSk2E/GunLqdYB1mAHu9eotwj00wb8QD6NuaHuPD6ldc8lKfECpNXgmrNCax+tQdWGYEjG
 ldBZxkOym5bt/K2X4ZhnwOv6UoLKzzqhL6l3iINwKWlRgQOYKbdQ6aA5eKM6gVUiCbuTjQCN4zz
 ui/4b5eYNY4UWOgAZKfzJCov4AM3/H18yv7peyBGmJt3fwfIO1CS7ePH8VX2QqXbN9V6TCVcr17
 ouhxt1SYHaWVBhpQ01w==
X-Proofpoint-ORIG-GUID: Nppw0-34gcEb2MaYcXUXXzNrbt7P4Vb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4995-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.131.57.192:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,f410000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,8a00000:email,0.1.21.88:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1D7C1AC9EC
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	- Picked up the R-b tag
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


