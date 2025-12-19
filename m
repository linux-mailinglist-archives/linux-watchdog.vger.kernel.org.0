Return-Path: <linux-watchdog+bounces-4717-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC0CCF4AC
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 11:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4A843020351
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 10:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16EF3002BA;
	Fri, 19 Dec 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1OZ5uA0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnpArdvl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D432FFDEE
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138450; cv=none; b=P6+qFd998dRMQ8sOXLaXUD8UKz7s1qRmqmOHrRguOHcS+yOPX0po8GTIlGrNpJVj+NNnMiXEkv7GfPRWd7ouDsB1zjksTAuqAGYYRwlmkRWki3hQkz4aV8YxE553SH94Pbcx6DErogNYZ3GWskwd8UNRrz2xdsIRtpyxKJIqAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138450; c=relaxed/simple;
	bh=Jluheh2jHquG51NTxi5u7y58uVIJrXt+KUDjFXNRtYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukXNpbbRqg9HNBwfP4GOzq/HOU1QeAii9uvayimOdGQtsawQ1C0v/bcDbGAUHmOmq1TC0UBDdUP2A157On8haKG4KfkbplvIljZhEBOmUxbik7vbBhVWrrUJsGdP40s80YgW4ONBBwSG1/KPlAxZfsGW+alhvPcjratVPoc2/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1OZ5uA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnpArdvl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c2mB3990931
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 10:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=; b=E1OZ5uA0oycFnn95
	YKQmspMeYchnuizmt80l0v+/K5kAeWDgm54yuB+Jb1h8pGLMrTykqYTAuShC2PEr
	u3Rhohp7HdgSxPBfxnQICUmF/38SRWwPZPWE1IlhrBl0uslwQvkAsZK6ARNRj7B7
	8dVTt2ggEPcBob7WrzsQmhQg0VVtBpnp/yVPUy5ZlPqnf2BPRxSgAdQSG5+ZB/lD
	tTHHwC0WI6hq3crz49+keBnSzb00KdXRANrNEOq8nn6eUehnWomuYoj+pPHaEF1p
	bCpUXv6dwC3CtznFVudILpRsReGrC1KiVmiZUEL+mJAUenVRM1AbMvVSExn9dhb1
	xH8LeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da5qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 10:00:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so621465485a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 02:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138447; x=1766743247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=;
        b=AnpArdvloiBRgNyHZKlr/Yto82u8qN+3YgloIqJ03whk937Idr+uisxKaI9yCTCeIb
         wM6VbUhU0UHazk3F4CyoQgBdHDPyJ8czsGJDJ0cgBr2EiUnJzMgKNbhrlPdJQWK/1Lfl
         ZYJSaMqXXtK8mSnF4V/i6Ek3b0NNf05vL+YND5EyAVW6yOrcq+3Sxz1kNm/J1AsHZNro
         tn+3RWn0ilztVgZadkw+M2XQLdCJ+Nf3wT+6JGXI7V+jJPIjJF/hHJ8vYza3T70/vwoR
         q/OIh7717pbmTcEWrdFm3btBTUegko1TQ6xOt9w14lGGwLS0zb8BYURCGfp2LRealpB6
         jUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138447; x=1766743247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZDT5LOQJiRveKj0afNkIJoST5Y8WOlaS6II7EWUiLc=;
        b=my0FBkL+qGEx2OT1Ug4jnl5J/5POCGARAIifeps4mVWducIBo0a5aJyYZ2Xv0/birY
         pz4hIIsG0ptkNq94rKfgsVL1kXpW+5PCiYDxJD291E5FI0bJDk7HusKLRxSsIMbP+IuK
         Cmz1F4jiSWSXQrAxGGCYRcvvPM9f/lWKKBhnQcDsVRk6rDsjZegnIsnlq9JAaJcceNay
         W7iHpP48QiZZHvrkOPPkuIHZEW6lXI9iPNKsFLVyELxFR5xWh3S6DeGrBFZax3X344W7
         rLXzg1cGzIgaxoeQMzyUvKarUHdxvoKhuxZoMB/q/fvpAZZKOKDumDdQr+an9toqDcmn
         pWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlwOSMp8noo8I0agfz70PU3WT3yLl8kV0fd+0C/9AU9Ct122ysmxI6UUae4vUayBfZV07g5ggiHh2/X1XRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrh1saa0X71CFy9SWzM8nqF7zkr6ot3DUJxCjeQF1ywOZg8mrm
	03LEhDLjgJjoRi9dUqXDWGEGFGZp+sbPZYWeq1+U7xzY3kmrxmdR6GlPi6nhbddiq31X3UnVfZn
	XKagSN2NW963zfSmyEpogoeMp9sgDvDIl+TchrNStjjmrKzbKUNHTn0aLtutyZiMs8Igkhw==
X-Gm-Gg: AY/fxX5AF82XV7JBpiWF+9dKvlrmWS0C9dKpX6NMiqhNAUhvaAFbx7NOEstfXJbcsqL
	A416kjZFlYgInLCvLd5jH1co2Kp8cZ1g+l8tXAWMS8GVf+AzyNXHPKdYLAgaLlwjsg78Binc30k
	pFG9jnMDZMz0nkhK6K80I6c7nI1ch1z6q0hNhC7MIyFQ/AgJbvuO07PIjN7mi7w1xd35Bb5ot9V
	iAWYgB9rP57NDRBDIOeNy/jcwPI9583mc4Pljmaa8nN4IibSdGgO8kklUVfJcGDFHlSOvAdYTcY
	ki1QwxNABBTecBo3wDm/3oTMFHyo7xh6bZrNA2R3wpv5Xd4jaUEQQbDJH1g/xa/Und6P4EjGJ8F
	D3yNGrqC8aCpb9O4=
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f35f45624dmr86977551cf.31.1766138446540;
        Fri, 19 Dec 2025 02:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9UtKykWpaEkxs6kiRs0NfY+njLFW026gAdANjggNhdxoRU2Ew+Askc2CMcbS38/RUZv8LzQ==
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f35f45624dmr86976751cf.31.1766138445921;
        Fri, 19 Dec 2025 02:00:45 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4106563f8f.22.2025.12.19.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:00:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:00:28 +0200
Subject: [PATCH v2 1/3] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-1-fdfc6ba663e6@oss.qualcomm.com>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jluheh2jHquG51NTxi5u7y58uVIJrXt+KUDjFXNRtYE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRSJG8l9WhVzcJGaIvfZQZhwes/GWQfGSiRMrO
 d6+JjqSu0SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUiRgAKCRAbX0TJAJUV
 VvHJEAC7yMt28QcxQv66SvejS2r0WMMK3pUR9tyCDRRNCdEc8e51XcJ+4MdDFNYJrfk6T4FC4ef
 j/1ak2n602Zl6sBghdwUIkwUtski3M6sNAhSSwLb7z0nENoa8t8ZbnGCHyCn+zJ6qkgnNU7Eo1L
 CDqdJ/Vuf8haY+CSaoSkrKUfayV78WusL0AqyS73gb0rOEWhieFGBo4CygnqHZqaStEzBrcYaop
 hR6K0k225hJMkkeIxMMxX2aOCYCSsoeLMYgKQaNzJJLJIYcBd8/SzFUg/6NM1MxOOWnvCdB1pUi
 +raXQsMXjiy4R0fbWQ3StjpfahwtMHFrwR1mm8oc5iiziaLSuX1e1YVApb6EQPZLaZpMXLtURhs
 INeA8imWu4589sGmSu0n+/8cSyB8ZS0nIVe32gBaYhesMHvjZg4iEnTf//6v6W+CX0RTGh9/3uJ
 lPoso5gXVkG6KHCARrMt/LpGDJPkOK5HXaZ7FnLsZaYY9w7I21E5+tcvDFjHWpsMUr5TG0cL2Kz
 8TMewOH/nTZIRcMHm8oiecpwULl+aURSJwpUwpyfOz4tEbnTEelZnX6PVrJ2kTgT9uufH4/poEa
 OI5vyhJcMaZ8CDoybjY7BjDzrW8nC3phIzLmZ4IFo2Bw45BwnXon6Xaa9HruX2shAawfYNYdsQs
 4uVffD9TW/zQXpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69452250 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b9FoeKhDW2wivhjuwToA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX2vXlnUrdcI9B
 DWoAsZIgGccGmcIau+GKnslJJO7bn2M2zUgzPQkHDwrrZL0QwuiuLGxROYFxNV0XwnD9K5EuJTx
 wO3h8ZpfwYTpn0aER9ukC0c1PO0z/IYmXemC/D3cl6P9k/tY5Zz08hu8yv0KsIOLxLQfAW9br58
 c+MFKKeONnBurYGRws96ujYTwgzAdxL1mGP58gF4mEWkFhOMb2vMSbP64FFm88A+kc5T4Oomc71
 17PIf28XUaelgB1AtQgRqgmsCdxc6g1E3F3a+fMhg1vimlX9Qc1NcPs2lbuXvGWaEHnqZ1jhwa4
 ZTScKXja5+CNq4vBwgnrsWA8ApE1UdjvFlWSQOw63TbjVBIUa91WMWyg17RPNT24gwvA7h47A+g
 SZsflomDYhQcy4wx2t9xhT/A/y/4QxgPJ/loF0KJxUqN1bzVKTqVYDbKELMPeTIxRHT6Z1lFsTr
 f17gz95GgRMxrFKlb9A==
X-Proofpoint-GUID: rISqX-h3YJyRpqUmAE4LMuC9KN5Ik2VL
X-Proofpoint-ORIG-GUID: rISqX-h3YJyRpqUmAE4LMuC9KN5Ik2VL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f2c4bc900e5f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true

-- 
2.48.1


