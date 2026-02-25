Return-Path: <linux-watchdog+bounces-4979-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFujL7GanmkSWgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4979-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:46:09 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F91927A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45EA13064D9C
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 06:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2574B2FFDFC;
	Wed, 25 Feb 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSRJK7m/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8pr8rQ7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54C2FFFA4
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001823; cv=none; b=Ocr0eoXb6/K25G5/kp+pORmfB+AA08N91/aC3uXW4/Q5629V2n0vuvRFDKGJeOsdbDW8eXMUNvVS11KHLy8tmxwp4/X5zX1Np2/Ryn9OxKYE+9fbRWkWfqRfgyqFnlXhgSqX7Gd1GG0G5ojfxZr7E9b0twdO27C7Muu4eeDbYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001823; c=relaxed/simple;
	bh=tQ432oTT+a2DGIcXyvXxUSBUxItod2ZiyCu2o8QpVDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Udn+TLJnVCXmL8NG6Emcif8TZZCaRwKe+Jyk5wQc9WyamjvDto7qpIQB984wKOn56V6CVtwe9Ru0VI28PHPrSl4AeKwlgYcxDmlQ3jMEAdPpa5DbXN7jmSej5KPVUV+LVrVbuz4u5ggRK+1qCqBd4PNBGGEyzCgRM+2g7kFhhj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSRJK7m/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8pr8rQ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2J7jk2334677
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwGUiuyZEcWaooztQd0XK+T4/qLNioeVvEfQJj2Ni4I=; b=MSRJK7m/kOkBnhah
	bgAqafgqNkPSF78dUgE7iYyQJ1WxO0JmbOu/Q3tHlmfUm+dVZ+jJ/RSQakd40gIl
	zkMiqoGCfshwSOVWCGPJ2GjHX/zYfz9mIrz+DXvLgKnKKQDBnSF/C2IvRE2/uyAv
	9ps9xQIh8dfWplo/RThrgmVL7UKPQmA/Sih7w5YEDR0/7kaQ+Yx22JQBZ0kBaB+/
	b0duiFBVbPq1fn1dGiTlwFYbJOc9SA+/lfd2jrQHICTkcqKZfRCz1GuP5bTNqYD6
	W9yMxm9jXEAuzOQ+ERxEstGWQ9wD8E3diqgw4+NAE7V6+7aDkLFX5ghQcAZMWhhS
	4dfy1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37t7su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8249ba7f6e8so2873930b3a.2
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 22:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001820; x=1772606620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwGUiuyZEcWaooztQd0XK+T4/qLNioeVvEfQJj2Ni4I=;
        b=a8pr8rQ7MpFjZK0aTFsWHu6QAGi0YGCCNB/50nc3X1Afk010E1uEuJVrADq+bTzXj6
         B+rBKOT8OJKrWdqYilD/3+oM6Vp5vUP21HHRxJIw6jlHevnA9FCbtYOobf+ogAeop56Y
         Hjx8VW5tTMXV+e1P1tHBkJWgPvYTihMOzyBCH4jlpro/l2T/DwdyIXfcOcA8UkvQoSdS
         QwyDX0rnmdb/htjV6MVPU4CDvzUHSjsPRSrP/8laNxcEtjaOwp2ff22szER0T9u3UwVf
         HzZe7+tQP26oAGirMslaLYzpw9VBrqY4n5vFP2AV50NQM806j8j+VisyuV3K1X3oyM1w
         a5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001820; x=1772606620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kwGUiuyZEcWaooztQd0XK+T4/qLNioeVvEfQJj2Ni4I=;
        b=W4wlfXU+mgxZ5MetBzsgHs9AY8bakOa8ekiizb07uVb9odRm6azJbArrFbyqf46ir/
         OiJLr5oyZ6k1u0ohxyVOaRMVrn2ensIC2ZVWwBO/JitPtIP2oAt/xqIFJaQWtNhW+wux
         39OR/l0+10PKnaaO5NZ+Jbn13Zz12BMMUByGzk8QOxiaAS9V3W/axKtNS+gNZgw9PAAY
         qectjX/fGbN9JFjpi72/nUGseL7I8ylXtWS0A/NV22imzUP7PoKuAaCaFLc5wUQDCb0W
         cs8PNS7emsQUJRnKMA8qX78cdSwHoMCrJCxBOP0uH4cnvmjSfgs7kbWlShSREm7dn5gt
         pLeA==
X-Forwarded-Encrypted: i=1; AJvYcCUiEzfhD00zEG28D4gLTq/Z9EYQ5zCC0Nl4uvzUKvIxNshh6D8GzHop2D2gQdF/x+eRJ5pxV1NWJtdASZGeTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEn+pw4iAjN25chJZrbahHCAd1ysfZoQkjomdC/fLAoD0UPJmZ
	kVKiVVs8iRlFARhwCPcsMNAkurnCRgIFMMIpZSipN91Z/JzOVdfF6wmbzJhDErWtnu7t10i9cua
	joQLnkwZuB4AIAbE7XcOQSarxs2kKzHrPqOfCgrgI4j4X8eZ7mQRMqMXaaVcPBbfSTaJFRw==
X-Gm-Gg: ATEYQzyHQd7n9oMo9SI4WpNZlTh5Xz/d18y3ITh3zZorIQ9xcFjktCPQsYXBJM3RUm3
	Q0KyXghx69747wvtT28zMgFrLrGJaL3yBszK9zN6v+n/EWirHZGfJEhIVrwyaAGOmBGASyP9vqD
	6WYXwq40fFdg2mE8VHk3j2u4O0lFVLIWnBqi3chZCkb3CJLPcMw95rwv3ApAJjlBf5YFbX+9CkC
	yjTx/Yyn1GSMuX9PQ6wCfZiwnU+nP7iUx/ZVCysZxIyLW6QWGyNb6ozhOSRoXcJF5wPHOlvFiZA
	/tVjenU1JmEBn97OA6gGrELTWlH8MRkr6HGA2q+Qpz4/Frmc8LQFeqWNxNRyFcvYXNu252dauTU
	kBDjRXxG1G5m161f5jDFHYWJOo9aEQi1ccIKk4AzQfBLon4+FnYlDQ2yTCCT1AgSOPAjnM75tqh
	XEt9t9GqEck18EaWfeZJ7DZzgyBg8PuA9N1Icxar+r3HKdMWA+MXWcy4xM
X-Received: by 2002:a05:6a00:b83:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-82724afa2d4mr1116072b3a.48.1772001819787;
        Tue, 24 Feb 2026 22:43:39 -0800 (PST)
X-Received: by 2002:a05:6a00:b83:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-82724afa2d4mr1116046b3a.48.1772001819326;
        Tue, 24 Feb 2026 22:43:39 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:38 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:11 +0530
Subject: [PATCH v7 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-2-65d5b7e3e1eb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1676;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=tQ432oTT+a2DGIcXyvXxUSBUxItod2ZiyCu2o8QpVDI=;
 b=U4LoXWwfF2KCVn1Ijg0f7tMKuvd63gvrcZMqi7QEH+WCrptBzsm1bfOjGn3X5nTPoNRgl1Nv9
 yKsoNDc2rr1AoOqwfAa6tUcjgHZf3auKHwXVVfFSxqq/se01QuWfpl8
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699e9a1c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfX5o+Lw+WOSqe1
 uv6/+vqYayyLVdRgd/TWwjUM0FFskspLWHoLtNY4EOjG5i9w1h1Sbb1r5gOQDHA+XlkB31KdwD1
 pkOcrsHZ59P33uRiTyQYs8ydw86Ds4YuAi6NHwhNgkbWni3o9GJy48kEhusnYbdeCn5QMHCTReO
 wgqmETDOgXxdMY4JyE9Y5Ue8zvQkHM6MbYBAWVKdfrBi6dwPn9GJy8XKs/D7uWP47xJNAGCYENL
 fjBdYfxHe9Ym9QbqCqwMlwxDZcUQaF791OG5g7HobRTrMs3rNK/XkcZ+Z/SnJ5nw0YzhxT+r80P
 NsAekttTvacRVTnwZd7gSsA6IISJTurw+J6twPYPd77KzuV+A5tQcOFJl0QiK/u47Dxt1gae+VU
 hHQD6zyM0HMpn/gmM08SZxsgP3WiuZNwKZmUjz5qUpOrGYkB88GekTqoXQ5dEt+biS9XYElsKlF
 SgnHr8vG2bV5cfxxPfg==
X-Proofpoint-ORIG-GUID: qXiCLaBp4xwXLuLixXV1rxuwdMF1MREW
X-Proofpoint-GUID: qXiCLaBp4xwXLuLixXV1rxuwdMF1MREW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250062
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4979-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,7d000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F0F91927A1
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v7:
	- added the flag 'no-memory-wc'
	- Picked up the R-b tag
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
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..491bc3b00494c47c5524df069e9d65bb4654e863 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
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


