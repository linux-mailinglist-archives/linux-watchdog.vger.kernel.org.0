Return-Path: <linux-watchdog+bounces-4702-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AEFCBC02A
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 21:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85FAB3013570
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 20:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9E230DED4;
	Sun, 14 Dec 2025 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVWePrjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY9YD2nq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066C31354C
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745417; cv=none; b=aI1+t0FA6Tyk4FAN6DceitMfgamNuIWZqXieMyDTjLdlUbHJCJQuWN/0hCCxMEoxqMz9KfZGoVIDVFXi1W5Mra4DyxDZqZNr+5zhlyGOCKWqQfSgJJAhq0TyE6F4bDNGOnZLQQgbP1rqgxMnQ7QYH3qUZzbIU1aNynB5+24zjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745417; c=relaxed/simple;
	bh=8E5rE3b0DA0tlgjhr5pcLqtDXLjj5c08TEwe5c8od4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSV7kUnILYZRfpWpPhSB5JvG/vgVp9BUICg7P15AEI8M+7RkHHwc5q3ox3wa+qljLAANt0US8oqtwtOYXfQ2ZLQ5yQ0quY1Gj1i/QeHUry5JCn77V7X0r1g7GRRlUJVIZuhElCOzkq+fP+wT8jO569MgCEPx5/+GveLqIR5HP0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVWePrjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY9YD2nq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEGA8ou2359055
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=; b=bVWePrjEXbIBxdFB
	KJct33RkLBFByosknabH9U/QwOSHXOj08ho66+gA5akDIze1Nu2s6rYZjLL2lcVu
	vHIqxybKj7GVqzy3Wn3CVb+Q1azWiXx/5HRTmM0XTZZMjbt9Z2jqGSZA8w+OFcZB
	aAT9TKZ7ku8ECwNSGy0/bSPAT1BR6zw32U4xHEEGwBIPby0gL2LLs3SVGravpwfJ
	+LZcLcL09v+Hqtv8pVhRvKWOrn/twPum+gjc4PM9McdPXVGMeTg99lpWoDR1hQwv
	JPyQDwnm2TUNeJg5J90GahKYwOPFIaMBWxBPzU9nE9N9HaIKZYdpCmQ/rNFuVN2g
	tU1OWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119ajh42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so655550785a.0
        for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765745414; x=1766350214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=;
        b=CY9YD2nq9gbnzKdE5d0ER6aUoPNKDWlEkmdW2V1i8OE4+R/dMn6C1cVTzpMJDMC4le
         3Sae8l3JtflMk+OOZD3PZbeoOA6+LFrHsSMkhlRbU1ZNgdx80mCOZ5RsD35AjkuMotXf
         v/HaxUxpsBgkSOEFj8X765SLPx2gbU0WtxJP2R5LJvho3R3kKpH40wljn6u8bVzKGmv2
         vHINCFNSbGfXkhjYgFHJOt/66l0hyZOwXsVfvBfnib5yMaP+lm93G/rF6ehXrGKORUZk
         TUSbTHmfJeZEtxuoq7mIHHcCOyWr1Awk14mEIGuTe2ojWmPJH5BGd4NytLkvpA9Mool0
         A/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745414; x=1766350214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=;
        b=RzwQREjC1EajfOrNfn2ne+jpAsQlfzqopUi4BeF32/ewktuYKwdYO6wAgI74uC+WuF
         W96MX69C0KwEDJ3JzFi0lGXduvTzufRIUx9UDkwz0qr2EgaJ/f0le5JVxy4ikeFysWPf
         hgeCKgGvKi7CzM065l+/uuZ6JYXqTsFRkMNE8cDJO9hx2mHeLpD8Zo/FRK/T/a116JOW
         yfDvYOi6CPTeRnC5Ce4UxkeziUfgP8AFB/Aa+EwqatK64k9Qz6ECkCy9wdwJaVksZ2MC
         oBJIlcKswGRt9N+x5634RqVfsSif5gg5EFdEGib3fIrMmxuE2DufxniQ1VOePzRpkK89
         flzg==
X-Forwarded-Encrypted: i=1; AJvYcCVix/A88KNeH5fPPiyPvoSJP6tFnBc4Ii8Ubzz5G9U2I2NuaXIm3UXBl1eMIe44MxPxe9B5lUM81nsAFmSAtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcb8nBKq9CpExZs63OqFvAyrblHEKBbxSxPSAKdEOLk4ug5Ku
	ERK6RMytgYahCh6c1SoRxlPrdkVM4+qngRp0B2VyU4Wa695mc62T3wg/PSTdMoUkAYcpnjuwz2f
	UvBtX4ISHDSXNOkUwqiiyQydVInI/VDtdSaycL5Owh8Hr1CXg5ziHY7k2PbfOqsvrOzGL8Q==
X-Gm-Gg: AY/fxX423k5RKdFFpV2NfmxrTiRjG3gqves2LIoY+Frph/TzEz4EmOmXyEFSXoH7YBH
	S31ZXOZXtYaHCVSQ6/CnWnNBuZJOf4f0fQvr7v9utTeGS/0F70o4lhliRftYpc7E5rLXQ7XoBGT
	3X8cJgXcItiOGdZt24n4fqSI88qSSv8arEs7leJg4Nt4/z8FSsGrSXq1IXSq/GfJ4qE3N7wHJ16
	eWYOqa6DmCpEGZA/HR6VmxerupotaCaf1U40a9MG7ONiGxtGld54VCXGr7RM63EymFzLfhNYdGg
	txU6ncg4Y2PMPPE7EcE5fGcbGYGWN/o4+z67aCw3zWAiGWTfOCvFBb/2vvPl7j52g7CkB6gGU8/
	8T4+jx7IFxHLClVo=
X-Received: by 2002:a05:620a:3711:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8bb3b33417dmr1229964185a.47.1765745413920;
        Sun, 14 Dec 2025 12:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKPrK1ylrv5UHGL7Z5p6urp71n8fWr50ON1eeAGrV+W7jIuiT0u23MK9CuVN1b0rnGlQtSNQ==
X-Received: by 2002:a05:620a:3711:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8bb3b33417dmr1229961685a.47.1765745413414;
        Sun, 14 Dec 2025 12:50:13 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1206316366b.16.2025.12.14.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:50:12 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 14 Dec 2025 22:49:59 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1-el2: Add the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8E5rE3b0DA0tlgjhr5pcLqtDXLjj5c08TEwe5c8od4Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpPyL/xBLDMiCuFKgzGQwI0suYSu3gOPEefwBiS
 Z2JQO7ByWKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaT8i/wAKCRAbX0TJAJUV
 VsE1EACQQTSgdcyzM7RafKL0dClPui3wALYss71jURRwnV+DM6cAb2TtnM6oJiPvR9Fv3g5TZhI
 N6NxcEWvb/xinJVXYm5KpZapxjJbu9Rn9eC8MRvNvCjJvoOsbc+m/ogEHJ/gl5rmnSHkYtbKha+
 vcqVdrOU6kwt3jCANXlXWc0VO1QEYVFpHCpl4fX0AZzOr39BZLeQC4dTXBfeSRIM4zy/N/arop5
 OKglkIKL4RGmOz1XUlrXPi1qY+CYnxRnLIxdMRJ6QFj2/dpBq2w3Ain0d37TfaMnf2JDcT4yliJ
 zX9ley5HuVGHtTm+P9Dr8B/U0RjLHUsG/RlkGiCOGO7P2r/f8XnnaWx3Oh7XKUm9EfbHPc59rDF
 D3f4R/WG/nYwkXX+jUUgoqDr6nawCCC+MVT85QbFJhocUihPp1nr107P0/Jjxw5hbjr90rDeYbN
 dE8MPGgHHI395aiOudHz5NWcps6kIgXZbi2vVPmK0UpeLpP6pmlzpSgmJEfXQwbQZTIN6KTQLmO
 5x6fKCDTicJx6Bmm1VypYJhLs9J+CGf7yjFPeOTvbB5EalddQ5+5SwsPN5LRlIQbY94UtGEt+Wd
 Up2H72VjKVKGNe7yVoEOgfskHZftaR1vyuDC2R1OCUevmu2FXtn6tQPBy/L8x9qFcEyDQSO14wo
 teHT1IBhFJL083A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE5MyBTYWx0ZWRfX4j9uXDVHzH/e
 Q0U2U06Bmj95HzXP0AH5HRZdKwq4ueSt5sgTX6T5CSoAFv6nVMppM3Ecx06s3ORWfPE6NYR2dI2
 gPgwSO2RfTLi8HiRNlX198CzDXNTAjtNm5Rwvcz3BQltpoOLI7rrvzs/FcslrMmj6mVvDSGWaxU
 66PgTdf2YctXFHmoWbb4SXETBPWhD+iNOicw9k+y4sGh8ufunT4O+Ek+k5PBY6HG/2VQcfYF6S7
 2KQ4WDvT7+Oi92HWUOhEh3BvhDsqURvNY8Yhja6ViEINmAoWCt5JWjtaSOgrPOl6RD2kS6K51/0
 eo1Vmx5LzNVncuOF90OqFHCdxBLfNCw0+ys0cmA/5zFCMOtGdDnZnZckOIi7utZFWfFS2gjP4ky
 LnGlzzaZXCbHBvcpXAivQizAHXWrPQ==
X-Authority-Analysis: v=2.4 cv=LNFrgZW9 c=1 sm=1 tr=0 ts=693f2306 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uqBh7opF-ep0G11Q42QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -1pviJ3PHSqA9plp2TuC103G0C70QAQI
X-Proofpoint-ORIG-GUID: -1pviJ3PHSqA9plp2TuC103G0C70QAQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140193

The watchdog support in EL1 is SBSA compliant, handled by Gunyah
hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
block, same as older platforms. So describe the APSS WDT node in the EL2
overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 2d1c9151cf1b..404174a15659 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -7,6 +7,8 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
 &gpu_zap_shader {
 	status = "disabled";
@@ -55,3 +57,17 @@ &pcie_smmu {
 &sbsa_watchdog {
 	status = "disabled";
 };
+
+&soc {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/* The APSS watchdog is only accessible in EL2 */
+	watchdog@17410000 {
+		compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
+		reg = <0x0 0x17410000 0x0 0x1000>;
+		clocks = <&sleep_clk>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&intc>;
+	};
+};

-- 
2.48.1


