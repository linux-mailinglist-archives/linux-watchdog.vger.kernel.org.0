Return-Path: <linux-watchdog+bounces-3232-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A547A7F894
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E9F17DFDD
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 08:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729C526657C;
	Tue,  8 Apr 2025 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kutGx/yK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F3265CCF
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102211; cv=none; b=svwgyxUMWpPUzPHYmz190V8Mhyh8hiv84NKEkREniz7ZmAfYZfmGxY5c3D8nNxlHITI9K1DbtRFh2jbw0lzQxSs/wX7s583JX7iOu/M/KLR0bRD9tnmw+d5yUJqrXvU/CRBpOdU8Aa2eg6pDSJGE8b+xci3L16P0VKD/qzAymeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102211; c=relaxed/simple;
	bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXc1c3v+z7C9Rw7/bnrWH6fC6EJXsE4Q58siiUUXcfSAahSamqeOA2CdXuvHOuQRaTUAqEX3PmUOeBipLrJ/OJXn6gIfvUldqktL6WqHi0AYGqlibAGqmIMmlEwdRPq1R+VuOPGXss8MvOMDXHRCuo4WqnlYFPl9qYmt94TzzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kutGx/yK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GKf2018829
	for <linux-watchdog@vger.kernel.org>; Tue, 8 Apr 2025 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=; b=kutGx/yKbggNJQeG
	WuAhf7Mw3vhhfb9LiQqVIqVhUFgokqtSfW/LhB8UX1U9jF5jJmHd6dvES14O18aw
	AqGPjh4M5N97Gr534lXDovRL8NISc6hbQz1qGAmwBBHqZMKQidjWlRnAFFRANeeO
	ApypCZuPrVg2AYe2TE/b01+RhGmbalwJy4BghoUddbDvDNVlGf7NgLx+f7mnVZxA
	4OiJM1kcvrpVFrITU23jQLNEx67j67RGgGWEiucC2tdFNDGGJzAu6dKWEJkyPaPP
	PtPUXGtr+HPFWWjq0+PVU128BBETGoptV0bqI+ZH8LCoxbhoiiHAG2SGBpilKsVo
	3aSNMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgf3yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 08:50:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso8007345a91.2
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 01:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102205; x=1744707005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=;
        b=MeVpRAXAVBsVJvH75YzL/l0jmO5wTj2w9xTRnt2sGZkOQKd4RR7ZxYmVWvFrkXX+/5
         lRuvOgUOurVDV/8MZYHZsZ0f0g27emv6pu/otbdCez15XIJRxBTctffUxGMKv3B6Qiht
         u6vWwnicEnNsHOtbvP/S7NTSIalwcwzgoJDcLZQCF4FVQ+7Wlabcwlzws3ARXC0UCGAM
         SuETWEsjeiSntlFHDT9LHEXT5NisfRhhlzC3R2Yor/qipCp5Wo/ARNSjgc0uykwqRQP2
         Vfpocv8uhjFnkkWRj/qh1yEDCAAd+aMmwrgw+7/7sPITcLpr8bKUruN/ugIFLKSzP1TH
         iVSg==
X-Forwarded-Encrypted: i=1; AJvYcCX8vgpn40/7ZRBN9XS70wnkqWBP4n/xmSB3boL/O7jhO9fPzlJkCg7dINYKsbtdyaItGHm3ol2y4cW2qTldZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1B2NbktWLgXcqXyrRwdesmPC1jH0AR4QVwhGi/xtHOPl1DHQb
	OpAxwjXUz9kx4NuWlu/uMJXOS0F46HMficWn+Gqc6CtGLrhgZxzKhoAl9eKl8CeS/ika/cGYiS5
	UKTtW6i20E+vCnTo22agXLFTJa+A40VjCqKR3Uejc9Fae5R158HcHyuotzOSudC04f5FFLxhKrw
	==
X-Gm-Gg: ASbGnct4MVOL6R2iCx9e9MfqqChDZtKq+wmBeMN5ZVa7I5b+35YnT5bTcCS+SRjzPBj
	ItBDy5frSvTRa2FeSEeyWuVSg6eZYP9zy16+4u/ttTMyKOVE67bmKGtLPtj8vGjUY9EkghrrOaN
	d171eyPDCMIgWj6hoZzCF70HJPM2ItYyFO/7/QobnKSYMoryhotDwckwoyJMTY6LYk77RzLJ7Y4
	9syaFsF3RSTXdSvg91Ja3blUeH8V8qy3yLfzBtFcCwDq2otT4xkgNLB5crDXLPm+v1u508Cfft0
	X++K88M+CEnrHKw/p5pXlKGSrxTeDNlwyr8X+55bINPUtJrB6icIdfxxvAPzvGKqzv3OUilsoWJ
	hHLwN3MH/16MFHbARlYdz+/e4iW8nQ9xNX1ooSh29heh5nctMBnU=
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327919a91.23.1744102205662;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7DH7NvrU8wKbJuF8yH1TuTvQSsT4oQgoNTmptJ7MMjVhu3ISVAbO0QfF9w4AUCG7qUA/JKw==
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327891a91.23.1744102205331;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:51 +0530
Subject: [PATCH RFC 1/6] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-1-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=810;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
 b=JWJb4uqlg8iaJcsGYGBQncP/6c8Ml6a1AITVQdLVCNKbipPyQXyr70nJk/5+5RK3LNsLMhDaN
 1HPrcWroCEvBjrprptW2FfsUOBBFXvjmawZFgLN8vdinBYi+WA523Eo
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f4e33f cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Rucs_b4YfuB3uO4azQRfrzIkQZOYm1hK
X-Proofpoint-GUID: Rucs_b4YfuB3uO4azQRfrzIkQZOYm1hK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=854 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

Add compatible for Qualcomm's IPQ5424 IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1


