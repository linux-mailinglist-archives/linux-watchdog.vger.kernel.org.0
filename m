Return-Path: <linux-watchdog+bounces-4860-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ1DBNyLfGnuNgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4860-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:48 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B451B9789
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 11:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 224E43039829
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jan 2026 10:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4E936C5A4;
	Fri, 30 Jan 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evFskupP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnyKxjWj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E65309F13
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769894; cv=none; b=SFgp11gbCMUKWtgHJl42TvQh2cKoxZGMaU1WIQzqdLn6ynxU9a7wY+amb+XkXgOXk5JIJYrhiZrr5DhED44kJSILq8Kf1qSXXyzTUf1l1zMv5SRasvlmyv8ErX3ZaDVPp9Hyr0l15FR2jc0RqoMUeCo4SCpfAgqrMrDMwz9zxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769894; c=relaxed/simple;
	bh=gXjLhnZi59oOsbpgrLnWCxeacGmYdwxDOwfKkKznY38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyxh7X2/z++VFocIaujzkK6OKZchVnfOPQUv5ipUjGHUak6bOXSclVdha05/vh3XaAsIfGpZk2DLm5RyUDdzev01zS2ZBaqpJbHaFyAfM3aaMKLcs/UyOB1iRKU6IdD3d6xswzQbQLOcFsWrovaVYMGw37Cg0+xIY5TKrXhMc1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evFskupP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnyKxjWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4tXAo2295066
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=; b=evFskupP39VRPEPS
	Mzu4RA90HWXBPF0o6MOSymnz0Uo9GSUeaI2GuZKZ4OFR8xoFXKojdC2SPWCav+4m
	1M9fJVT6Eh09gAyk4dEWKqz0GMXJEgGtu9CS6DFbD7a1XXbcVg65pIWSo/wrOjrF
	I7/sTZJS3pi/XrSB+0obl1rN4Pm9p3ngjrjSS+GxDg+vQGw96WsR6+8WBWClDGKQ
	RYWd8ZRrVEp851oBoaSceibtydd4Z+IwdscL+c/bLIvU4K1jSjzDOUgwykIOLM8A
	kPktfJiSlBxmGFn+JbpEZ/ovWCiMZJW2hLh9Vvm9BHoHjahMoBup2yNCJ7j16LY5
	FpvQqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x8ymb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 10:44:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1400665a12.3
        for <linux-watchdog@vger.kernel.org>; Fri, 30 Jan 2026 02:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769888; x=1770374688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=;
        b=LnyKxjWjh9iC5OC2949W1p4DF4sIHH7H7thiAJac14uMwwEcI1qZSeN4ktUt6YN0D8
         2clcNJkAXOiZ+iJsOU262clkZnOiiyeG3C2ize+pE0Oujnd7RFUA6roWLeWkT3JYC7EM
         AZojkCktiiMBgLjqnK4nOI/pPjr2NrHNhzTzWa9+MZMa4xUOJJXyGylSQ5NbSc2yGJm9
         pOYkSzUFlN2F4tkXAN/4bBU9p/ISZAKqZFSNmGjTtI1+56NgUWv8/6AicVeGh1InU+uC
         dPcfe+ac1RTAfm3nqlZ49wQYJzbJ7OfdR8obxjN9UyMxc+xESkV/o+k1WtkeLUi1MoCv
         GOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769888; x=1770374688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=;
        b=wPV6TiK2SrFxJdBUHpORMMt6Tbc1xR5zJxwVKw1m3p2OsJaPuJWwVN2/YFMINbeO2I
         nsEl/tMlw4zE2a460qgUrWbzdFtleJrz2+EeYL5XiWkl4NPz4ZlKODNjxCf24sqEnS8L
         bbkQQZgb6rmAdOsn8QZP9u+MAoix0EFhusBfB3A28hA1t4IoWelTH5qh1op2M2/bzMaj
         2rz7YSG1bIUu7CwhDLrWUTZBR8hUU8Xeo1NRS7sLCzttmYuc7IyeMzfQXP4kBvODHLDU
         UKdXtTsM455pfQetS91oNhjgqgSn8O9WBHIRaJQU6xakJcQqSq5jfXsR1G9p+efQ9C7X
         n12A==
X-Forwarded-Encrypted: i=1; AJvYcCWQWzA9kJEB1/uBD6qBVAvikstM434kqkBoOUBwBnKfW5x0W/7FLiNzfnqV5DGgXPoxU/nyiR3ic5vLRMzl6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lwTGBb827K0B3gFa76F1TnA0fBmXBKvSXoIujZ5p1us83FL0
	nndqnKFN1HwYV8J+foIyeVIIOJTvJ4vJbpKjo2HJmcA+osm+ur62I57sAj+buUPGs8wXsEUG2IP
	zxZEO+e0jEiZj7KR7lzpgn1EVz0SunYm4NDAyIjTM3id0CudKp4AeHRk0G6YOJmnY0uBxjQ==
X-Gm-Gg: AZuq6aIc4ZsBnfPOQ2toApnE7FXVHA2tG94ui9E/7j6ODb3Ys6i2Og4guU84Vb3O6Xt
	WtOWhKU7TfatX5WIuHm/4BNmoKZM7HTtkps53sEdlRkI37Q9Zaon3LAmQhPK9Y1SqPKgbC+t+Yv
	6S8Auag0MtCUbwVq80oPKlgTDEg+IMdBpXKgTldqsfgNldkPXZsHFAO6RbM/an/2A4z/k/jtrWC
	ruz5Jf4qCE+ejIKgYXoo3X6Hv3r482L9L5OEkfrVCHkVdR4YwBKcfRJuehCNfIFcKM60LntBvDL
	qV/o7DF/UkEKyQnPnjGthYVX+3OIOnyN0jMgzxk/VCVLqNCn93WUhfMc0wbkR0wrzPwePRA6Joo
	Kxbn0Xeu7AZQOBTqZfqxtz/Dm1b0zPZw6W8Gmnymir9dvUSrvfaoqGhzTYVA4tXqaUsYOnv9Wp4
	AoNeI04xAtWlZgUDO8frQHVE+67mdlvcqTkr9VwEBUNbAs
X-Received: by 2002:a05:6a21:7906:b0:392:e5eb:f04 with SMTP id adf61e73a8af0-392e5eb12f3mr1673101637.72.1769769887759;
        Fri, 30 Jan 2026 02:44:47 -0800 (PST)
X-Received: by 2002:a05:6a21:7906:b0:392:e5eb:f04 with SMTP id adf61e73a8af0-392e5eb12f3mr1673074637.72.1769769887303;
        Fri, 30 Jan 2026 02:44:47 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:46 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:31 +0530
Subject: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1507;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gXjLhnZi59oOsbpgrLnWCxeacGmYdwxDOwfKkKznY38=;
 b=iyCnNzRbBhnBPvMnE4k7TYWY2XLp7FU3ecZLTl2matj+diTY05JLq+kQ9oHgrsuZJ7P1YpPsi
 /7qqukJLPccCZvmDd9+IJ9XY38LrA4VeXr0xQ7i38XGWjcEbN1O8Kz5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: te3wNbLTqnn4Ewj226nqcbe5O0IdOXm5
X-Proofpoint-ORIG-GUID: te3wNbLTqnn4Ewj226nqcbe5O0IdOXm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfXyURg30DNxfD3
 /gbUR/m5U4mf3owoudWS5OfYUIuLdLchy8KepRypkhJ40eRnn0h2EhtG5+c951Se9nnCaIvrCyp
 Ov4YRMJo6yYpgedgm9LTD0Ml1+Ej46c0f5k92vWPnik2ILMr/T6mvurVAQ3AWdMQ0Jja9JTj7XD
 ouaq8ikvYdb93RrkBFgNWfGUKDP4MXYOf2GULfn7WE527AXGOV4ZEBDokcTowFpLYLNVN/Ea0BR
 5MvcSaf0kW/WobHnvRrCpzU4uW6WUckRNy8F4/GOd5tuPtQB/H+KhzZt0AUON/bHjkMYr7rc4Uc
 4GFHtxx1t4iUDW8L+BFNhmlTISFb/lR+MyN5DwiR98rlPWB9J8Y8CndxF0tfHhbo+uTN+TOt30v
 zZmPS+0Od35LkZjUgNX+7aO3PzFDqzuipEzP6PEfu4A7XaRQTsO2z63uKGi9WgsqaK8WyA6w+na
 uTKrx/X2umfZ39Qx9YQ==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697c8ba1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4860-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,8a00000:email,qualcomm.com:email,qualcomm.com:dkim,7d000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B451B9789
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	- move to mmio-sram and drop the Konrad's R-b tag
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..90790f99f0597b63801d4e07b9b72cd372ad46d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


