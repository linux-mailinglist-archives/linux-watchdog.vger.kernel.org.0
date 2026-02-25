Return-Path: <linux-watchdog+bounces-4978-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DPUKoGanmkSWgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4978-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:45:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAA192776
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 07:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B152D3061AEF
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 06:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D72D3A86;
	Wed, 25 Feb 2026 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5nrLXNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnWExHMW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408AA2F2914
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001818; cv=none; b=L1xvltvKNEnoFvhweQBXVvQ8z2OsCAXtaiTvZ2iW9oMtn2aGpGMUv2eso5tDiWODxDWjz+E+To/M/icB6DiN/YXyP0GkQv98K0zYGTWCx5cgmgLUZRvwhb3xWrENviMfaDZ6FYfEt9dT0QCSnDSp3+YY/F2HYDQGVbajS+aMbOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001818; c=relaxed/simple;
	bh=nYJpkitVgYxwVut0tJcCX6ZI2gddIxlTNulWXYIDO9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmBAikwGqmpCu7UFd38vAeCpl2cn9NfgVYKRaG4S2b2lPiXvzHsTlZmT0utFjjuIqbre4J55O+ipHSm4VReGT5Y6cCZx0vV5vjwvbDvZnfbtbv3E5Z91UGF3R4CH4TyK33p/OEaZtvyg1R4YtJX3D3QsGHgJLIJs954sxF2CrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5nrLXNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnWExHMW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P18Uij4150740
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=; b=E5nrLXNB3HGvkUVt
	lIhNdlB0I9TUfVf/YMeS4kiJeqNXj3YPZB2qJNxAYkqoYv/8aiwlkdwpbN7KrQlz
	vGKiRf5IBXsAuK0ulu+yT0k2ExE7zP/riXVpkkWR2pGS4ZCT8COolHunYHTMhCnh
	MicXv1cDhmw429G42a/XUMFC0uSBgODnK/Q0KKpIGSKPmp0IhhiJYCKTDAgqEiGg
	18wA/ZXvb/V893mdPFE96vl6SmBMtl8jJnulgtcFh+OkPAm/eFPLZwYiWZ1EHEPL
	8zm1RonUQG9PwbQQUE7gp7XKbGcYyf3apAJCMwzwdnD6x+fy4i3X+3pg0QEbIfqs
	dC2/4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57rs00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 06:43:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824ae2cac9dso2896705b3a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 22:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001816; x=1772606616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=;
        b=RnWExHMWnJczz/7aRr5b0GSreVH0MQ4270q6WPQOx6RX4NRgS3ut10rB/2jy+40gpc
         LzF/qp9lHKO69A+tG9zz6RyWhe9AtWXuE7wn+NBEUqSdto44TwOkr4iQF7zkl2CLcQUP
         mBMaP5J+OTfXvFESi6iP11efaWoooidrPZCBhW8RZcwQE3kCe+2wevM55eSoQwC5KHfs
         zMeNDYsML4qYPtuJz5ny0GTCMp7qEHc7baARkauNdaYNwyyhx42minP05Xn4k+TIFWLn
         RoWjotvvaqAmbPMD0TAakMPfqPaBQcQnbZAXOH5q1kByHqBrvsbSavPkB+uhGwifpv2C
         KICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001816; x=1772606616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=;
        b=CNy006vYZuAEXcfM5bvHSFXtDYQP5cEEDc+WJj7oPSVMX0bCzFFAiCbDy5sisaRJiB
         0ThIRPkQgB/YsKc4NZMf5W3VgQBbWT1O9RpikhYuCBvGTQU3X96ak8fWaHgrFsJknZLa
         DGzGJJKzz8Dd0qysJERWKNWIZLMbYb4Jpmiq0MQdtDqZwyG4GM8bxDGPqDkA3Dne2cMl
         iSahBdelZP6sbiaF36J9VJX59xkCoqp6/qrOv9/ezfCW3eYx9u37QFQwz4AuAbOH9xmj
         4iNcfyHabAgoV50mZml/EA4WcKXO37NCPslWh93mD1o+mIOJMTaWZo/34hoyb6bFlE9+
         jUbg==
X-Forwarded-Encrypted: i=1; AJvYcCUR95sC0hzD0sPNts84b2eExLvWIDGI9/q28eK9sBR1GCFO3zJoV+4K/IHb7G8O2gs9SlRjAoIVKKc1mtsXzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUJm+fDS5BTzZXNT4+lv15qbvMu+7QWNOzUKFs02gHiJH9YUC
	to2E955yk0+oDeLherkWodW80VA8HbLI4fH/LLUMvgJYGdRvg2CNcpZ2mXQCRgBRFyph4PftIvl
	KlAVRZ8QPn5ocV4zFnftZaFJ1WDeZNnrrv2GMS0Mk27rAjCeKo1YDyVKZz2EnrU5Jm83LlQ==
X-Gm-Gg: ATEYQzz/yFs8w0IN/Jhwa3FtrHbSZqM36vZAE/uoBT+ZeM2jgohWXfU3VlSQaSc86f8
	tJKIm5bRlGiTAEgnav5MFwXMh2JrJd8n44IVgHbovTcsdfv1VAEt3hn+G1dMsrUfKkKdyeAfH3Q
	2BPeTAAJ930cvNiitO/68bIy8jJdMqQfPKqbVoyS3PABPGyvWzHTEKPLPymzxBuW+nSlaZAGOHV
	eS5lYpYJ/e7gRoDu3Jv3THecFj8eO3yOvgHhlBcZ+GlzKAA6ZSpqYjqvMbajAPXMLevtk1HwynY
	gF93167q7OvRGJ58vTqxJSi2QRNQaYfFzicnzUdeZfF0b8kSUcG4xTq3+Vz14YyK7GjxG31L5Fp
	4Q8DAG8dTj29Wn4nNY2VZtMjUOCHCzOO5cVUVl6YI1aHl0o2+I5A09puqGWuqkwZZxybMRJaZXD
	/UXopF9MlO4bAJJjv5EpQAzSGhumfuNtlAF/25xtXxnl4sv7rgP6r5mKf1
X-Received: by 2002:a05:6a00:3a22:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-826da906fe6mr12663148b3a.21.1772001816012;
        Tue, 24 Feb 2026 22:43:36 -0800 (PST)
X-Received: by 2002:a05:6a00:3a22:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-826da906fe6mr12663101b3a.21.1772001814749;
        Tue, 24 Feb 2026 22:43:34 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:34 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:10 +0530
Subject: [PATCH v7 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-1-65d5b7e3e1eb@oss.qualcomm.com>
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1814;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=nYJpkitVgYxwVut0tJcCX6ZI2gddIxlTNulWXYIDO9k=;
 b=PKlwEknRXdAzx8wrH2+KNwwUmsFL1OE8JLbSlTUKfTAGAQ1hqdNoRuTf7/WkCzDRlqHa0p01h
 +HZEx7VaW4SA2b4SwCpImIfSl1AEXdU/Yg2cFv33D1F1bgDKCGSyxr5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699e9a18 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: nkHAt_DRXq4ENhv0egjYHxgZ-YLZyh17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfX0deGylM5nDJa
 QhnAFLgzw46K/nmgeB3xjH583pkoRVh0j3cWy4JpPBDIUFLvA5XW51MODjFG6RfP87EbYu87Iks
 uQZNT5EaR4PTlupNwoY72DnDZTbdR3aDy9nu534Ueq9vhEjdYsrODVJdQAhfg3dl/5sFME1/KuU
 vUeIBQ5Ys6yVXESUJRlt/U9Pfn/PLeYIIOniArImGCDPGa4zFMg8tl/8+k8/6wHtWblGG4wKmRM
 Z4CM0tSG4evA0TEI/YCp2MlxnD8IXdF5eB1WYY9ejTkON9UgBdfIfowEjwJgdT/FpvtbhtkSaTy
 j1H1R37qiVfwA56lzgHKGC57VQT2c9aCBzfQMB1KEeEVjZUneQKHfEvPwvUFrs5/zqQCYmC+EsK
 HDhITn04hoPIcnaa34bZrFc3mm66JsrMclUyQ7/6Ags0g/0m5Ir99cBB5FKkOFGLMTV+pmQ8C6m
 IcN7gcwmdv1gUVTUSZQ==
X-Proofpoint-GUID: nkHAt_DRXq4ENhv0egjYHxgZ-YLZyh17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250062
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
	TAGGED_FROM(0.00)[bounces-4978-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DEAA192776
X-Rspamd-Action: no action

Based on the discussion in the linux-arm-msm list[1], it is not
appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

So drop the compatible from qcom,imem.yaml and add it in sram.yaml
binding.

[1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---

Changes in v7:
	* Added the reference link
Changes in v6:
	* New patch
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..72d35e30c439ccf4901d937f838fe7c7a81f33b1 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


