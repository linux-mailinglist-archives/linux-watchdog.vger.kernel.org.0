Return-Path: <linux-watchdog+bounces-3410-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 461DCAA7335
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B32D981B28
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD1325524D;
	Fri,  2 May 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX6FvctS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED84255224
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191895; cv=none; b=QuiYCqTER9oPebyx/1RUyF7ILRI8m229VSueHY65DWco2W9y6ZwsvnSprpoQt7ZSERQ4b8UBA6RZ5Oyk3a7Yhgw8wMDG5LzIzqUzfpgeex5kjRfSKIHVwUU4nqRxSbrUsfMR4iaxpn8WV+NXBUllPMhlAD7W06y+4q3PRTJwTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191895; c=relaxed/simple;
	bh=kuc3nwD+lVGfX59PAIq28QGYc+7HorB/Mg6Kws2foiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5oZmHOUw7m1j1fWiFupd+OW368FLFF5H8SslG+w/DZOTY+vBQ3i8KKeIy7TDcPaKhqnzEN4wh61p0NrwII0RtLDl4Cpbwc4ce2cFEg5ZVijzaVAPDCGQEKcbyac+rFQzOgmQpyAmOs8KjobA5QucoEQRx4xTDk88RFB/WjC4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX6FvctS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NLC6023378
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 13:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfFYMVQSeb9gxCMqpC9gyzIMAiB8t0Jg4Tc03ZwPL/4=; b=hX6FvctSasNVQeC+
	lxcAGA6/d9Gt/YUfsyatXcCFxanOPNSakQ/CNzfQF3y1jbF4gpPUR+16HcENIv8W
	8eee+JyBFaw8AjtFfckxKLflTUiOmpjlwVOVUgwzJnFn2gExI7tB6cHwbYTwYIzH
	W/z23wkQkQSflDGClIc9nZx8eVmahhK9VJ+S78NtnGpeSW8B6PMEqRCutMBK8mgL
	M1+cAusyS9pTmsZiuRPE9gkAXiHLKANvSLptbi4BGn8+xWrpsu2Nug91Dah77MUP
	svb+sFsE3zMnj6YVdlC47xMFeequpgQC+9rjG2+cToK5bsuiDUuzeXq6IpOPzf8v
	4OIBUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u80dh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 13:18:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso2964277b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191893; x=1746796693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfFYMVQSeb9gxCMqpC9gyzIMAiB8t0Jg4Tc03ZwPL/4=;
        b=AHYYtCGihpBG6RjHMgoB8sTJ08Rk55zxAbmVAC7GfmUAvx1HWUY4evhZ/aOblvurrG
         2bgmSH7jotxNYMc1FCzfJnqVZ+9u8c6kg/a3BhwDMcKR7C/1H2uOrjP/15wdq3Q4so3Y
         8tzeW3JCL19nKx1Qg6LxCrgOErHdW0jPGK0ulDuYgHcmMPNpt9pzk4nWLxy+606CMpkM
         0HQFpLz8MzPKVGxxTYYsO72RrtJSOYj5EmmClMAvNAXp8M2Az3dkQDFf6e+81F1dynhn
         1atukIyNph3ZoRZAXgbKqZhWG81lO59mEx62Bq/oobjLNlkTiZriZq3E8nSxF/MfdLuW
         0JNA==
X-Forwarded-Encrypted: i=1; AJvYcCXOq+z+4BEn+D/PwC5fyWQdoqdUtr77On/f/0PsMqN6oBJw5zkKhAdLK0RBeD6dPasI2eHhNg15GgAsSSgJ6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOCnzq9dlXjJA6yxDgU2005IVT9e1verTkH0HYWpUaVhp8qwH
	ezLcJSUEIBgk/o8SzLIQuLK4m8T8m/jb4jpQ5zkcXV6jCVY0Q+9aFKXwenwzqlYidNCEFGvZuwF
	uHIfJGAUOO3/ZziHqSgu8sNtIq8qsMuwVLePf9dIH7xehmv6daMBWLkRV7WmVxjZNhA==
X-Gm-Gg: ASbGnctRW4R1zop5IyT4MXaOLBmY1s5dQm6yP6DkekyIvHCGKG+YRanNQixBG14QbNE
	AGGa2unOBD3iFi/cK0iZiZMjqgk5u1sXjYy6aTK37hPiUIFYOrF545aRlmlZuxDScrnyrM59iuQ
	APB13dvrcFBtt3aBdmDEFftVsXhhUJmh2MfQlR9VbYfE4eXlrB+8lq1aoGIJwUT53R/Xssa9sfb
	Is9wfIhGpSE63gCPzZiLAOXige+ssFhz02MIHrjyqqBNd5ubg9jpO5s8iaT/38LUZGaxpdyU9nx
	u1LzIkst4Q3yyA3X8x7p2/lOUlnVOjkZ8jtPII56mEgZTwcXlIL1K9J5qVpyfX4G2DbI611X5sb
	0JjpLFjUPyBTss9la/G71DzFXen4p1ULiEIDzNbJ4FX6P4E0=
X-Received: by 2002:a05:6a20:9e46:b0:201:b65:81ab with SMTP id adf61e73a8af0-20cdee3caf9mr4468314637.23.1746191892770;
        Fri, 02 May 2025 06:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfmJNczsGnet4Gkz0D0Mrc+1uQYNYpgTJdD3D/OrH8RLj2AReOWrjWS6ngfsAJXui1vi/DFg==
X-Received: by 2002:a05:6a20:9e46:b0:201:b65:81ab with SMTP id adf61e73a8af0-20cdee3caf9mr4468279637.23.1746191892405;
        Fri, 02 May 2025 06:18:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:11 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:49 +0530
Subject: [PATCH v3 1/4] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-1-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=904;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=kuc3nwD+lVGfX59PAIq28QGYc+7HorB/Mg6Kws2foiI=;
 b=/sHHOupQearhAFVBllGVOZfEFzBNF22HDoTAgH7WYVaI4fX3X44JA5y5wxWgp6h3W6sUcd+l9
 uOliBBckz3YA/anqCFFTVYGYMufOfv/Wf1ruq4/P7npCMWEPH+SR3Vc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6814c615 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wnVXQied8PxpUl3475gaSHYSOeiaGxZ7
X-Proofpoint-ORIG-GUID: wnVXQied8PxpUl3475gaSHYSOeiaGxZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX2TktQz8M635s AIYNpGrL64A4a1VR/tKzeGazHln2zQoQ532LoK4X3VhpzjG9gUZxfDodTGGP1cKlkomSS4vdIXM /tl0x3nnUAru43ispl5z1optbps1H99psI4DTY9kREbFfP0d9Y9iG2JvijarCnLh1gtBjOTdx3F
 YbvEcsJ+cCDCywB+oFv0FFyOIkvRAdfghu1qvOnpfNmJPUHWsXSC3ef3qGnyUhCocJZFvLAzLVI HBQGijzkNimU2cfqzFZ5CbR5ALvTwlAtv/1CS/hVtfoHULnQIXe7cHOkqTwMM9REUsnEia8JdoN fCHlvumPTDNAm3xsMBB4kCefmNzMqTMp2yUPUeUpNAvoNLPT04XisNfuKVXyIiqZZNPuC5Z4S3v
 78oNfY4FTDdMetQQtZGt8evt1MM/JVksxjF3nytDpS9wfB3opHeT0JX9hYSJp/uFuZsBSXS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=948 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
	- Picked up the A-b tag
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


