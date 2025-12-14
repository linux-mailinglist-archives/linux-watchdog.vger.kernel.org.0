Return-Path: <linux-watchdog+bounces-4701-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B5CBC018
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 21:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 460A43007186
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 20:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF13313E0D;
	Sun, 14 Dec 2025 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lERWT+Pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9QWhaqw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE32D5950
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745415; cv=none; b=rf35vGbPu7U9bPbW6F4otOuldIdfrabDcTNs9gXsk7UpKvEF83GaI+102VC1puxaw32OXnvDEKkkrTasbJqtMxtB7SmfbxCRLiiLyc87g2EEcuJGxWDxUdcLzIOyyqzMe4jxBjlJSz3CEvp6u2+AWPT0DYIA7ZdfXBW4YQpehzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745415; c=relaxed/simple;
	bh=oOMh4OyXYGjUE696EX9XPgRxSeZI/QYVedwe5b1mA68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgkXj/GvepsuymX3g+29PLKxDWmJ1qAOjvF3GQMfWam9cQwxuWCfYWY8+IOdrXuTbGuDrxJv6fah9ubm0ltdrppMlf5yTWWz2uJb7GDpI4JyMM1J3rbsp6xz5B1G/fArRboDON7xEIMXTXRQnC6JmxLj7fVAuhjvhAM3rghaaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lERWT+Pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9QWhaqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEGAPXG1446130
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=; b=lERWT+PzbHUO3q9+
	2eQgWQzp5oXhSnFCQI4HG57kMJxfJcma07U3VrRgfkDQdORb77VQKFqZoiOc4zmk
	q67UvA6mN7Y9usQbWBmKtLCMxPgrDn9sVeTS5tBZjt1QJXcbpMW/KaxSr/2nJgXl
	cX3faWJgpiBYC6OVq+rkuyiztgpry79mXNRflWndnWEnSckGGuE9vSCNPWd1dRUe
	gtM6jsD9VBjMS3h545AB8l0K9ukNh5o+FK7L0uS8vwnSI9F7XfOs3bxBoaLhEIvR
	yms3bbld9+smu4uErFToST6iyBCGJuANaaxelDkF1Wvs0eTZ22tEEZ+CwgEifv14
	dB9TXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afahcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb3388703dso898013785a.1
        for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765745413; x=1766350213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=;
        b=H9QWhaqwNlKL4xfG+xfko3xG64alPyA/gEKj7n6T0kTpTmPryRxeuMpnwqqM6DYiwc
         HN/5AUHg03UDGagCq2UhenS3a+WJRz2xkYHYtULYTVP7VtuHdVze5E9SK4X1ZkyupHi9
         Lh+8tX253tapNHsT+mFIIPo59R76xADCVWe+xLFfpbrr2PHIYYTDFLT0rfAM8HcbF2Fr
         UsLCN8VMD2j2l+vSXTuFU6C4j4yk6BQdnG5iGWGFnaYC9bKYBEY+ZBxs+vkuPuIta5s+
         RrTDV6dnaUvoEhjBySIzl7jY+j/QCSHstx/laO03uczlTLXPcUybNh57C+MGDLQEm2YA
         xhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745413; x=1766350213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=;
        b=rZBcRReinAyYV/Xq/iyuSwjBAxfW/sVXlx/Xcp0WUfIRdpNFV68Qt6rm3Wajh3UflA
         L+2w9oBVucz6LoHAdIQPdNRXtju2uILAzWZpaHU5n9E8v5cTyNxqmLbz20u30ZVcyOI+
         BoaELscuSg3KTFljCe6ehc+pCa9mGTGkaqpCazJHKqIbbUp8D3HWgaOaMowT9Av1hNpD
         2LlkWix8DTzlY0Tle16RN5mApVXmQTY66FLUYpDAMzmsBg8asSYpqFjB9SBNaq0xCCFy
         A0JFkRUahToQrYKVM+6xUKnLNhEmXnaMiL1uKVr997iJz0tVRkgxNnDhG5JG4amApN5l
         zvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn74fTv1/35ViQkx+KhTe8C1hRB7t7QgUEYnY3VyoapUkQR5W0+ZmYJRLh4aGSr4M90itV6qvICfc85bMNaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyciEeuzV8n2Bej0Iw7Hlh+TU9VXXxNt5UOQ2vNXzQbluvlVwXz
	VHqYKIPXnxN4rhQzKMjv5SPJTG9z+EmO7b+q0tB4/5CipG7J297NrG1JZGiOVuXHhUoqHlTqt0A
	9JzXsrl/2P67sHjur7V+btj4OY7zhj8QBav6ZeNF2sb9rx8owfGlFvnI7yNjTA5BqDhJMkQ==
X-Gm-Gg: AY/fxX7TjQfs6u6da0oiV/KYlfAz0IS7/lBXy5cF0vq1LtqUYQLfcnTrurzyDTbCbuA
	JYYngZxv/SNq/NncdCgBltxswYX4nzGv1GLi2DKV4ZIB4L+7YIk2iAzz4NuCo6fc0LBi0btsSPE
	Y7TklWS8RTAf3HzqkuAGstsChzHuzQIw3/ORR8lqmJaxftW3RQDLilI/NkdSPbzChDoR/bQCSg0
	HUVbk4T47EE8h9e9ezJ2Z6qovb30DnCZhi0ebkw6sOwblgsD3yyOAZ9sDebwg78azf/7qikxLlu
	1KwTqU2rPraXpDLiYyaFu+nEiMCiX1iii22H18PaYkM2nwikdXL9bOfqljdhp0Dt1XWC5tDNc3x
	JqCdwEH61zD3JDi4=
X-Received: by 2002:a05:620a:46a7:b0:893:b99:7120 with SMTP id af79cd13be357-8bb3a38f6abmr1277317385a.80.1765745412479;
        Sun, 14 Dec 2025 12:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnGzCsdTgvQPQuSCCUb5HDbghpBjQIKbS56h8BoWAzwSzndAO9vGC32uevwEc+zIM5YKtRpw==
X-Received: by 2002:a05:620a:46a7:b0:893:b99:7120 with SMTP id af79cd13be357-8bb3a38f6abmr1277314585a.80.1765745411892;
        Sun, 14 Dec 2025 12:50:11 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1206316366b.16.2025.12.14.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:50:11 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 14 Dec 2025 22:49:58 +0200
Subject: [PATCH 1/2] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-1-94ee80b8cbe7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oOMh4OyXYGjUE696EX9XPgRxSeZI/QYVedwe5b1mA68=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpPyL+hKRBngv/xGSDGnYKgkRkqCIqy5brQDXOE
 R7z/d4uM8mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaT8i/gAKCRAbX0TJAJUV
 VkHXD/9nnqBbTWy4LWahARK0bk5c8IfjuH3dd3gm+zOCV9xbCcTAy7q/SPLquCVlldX4+toz5t2
 pg3lJm9gFLXmgbnJwPZ0gr1SagIFvy+1PZY73lHovtZoZqGmsU5dX2KAYlGu07WPsWw75p1ttYZ
 Inr+Um+Ow3JILewNxixTjin/wPZZh7XSBMGrIcjXzcNRin/IIVMxU7dshVeGcVuVsEuBt5M7NtE
 8ol7KYnwkm1/JFfXXPuNI+YxCh/o096lXr1keh1d3RR1sioe5C7d28+B28tjoc+UV3VFNndT2o8
 MRTTXQotXnMcMe5vGtiJjoWMcyjWWHyZG3I/xfOKZuCB4rQcaYGZNPE55Kd/kW/wIu7ahzY43F7
 byZs7ZMqALkbrokPrfxME+4eoyOUIDy8NB1HbbfhtAiJarppkBmu2lL9hD4VhkhHYyu30MRWRvW
 WLECBqk9ryULxT4iJhxHteTSfieibpEdaUbb6Yeg775dD8RZnqSzTrhht+6Qatd0OYYD12cu7ye
 kLADOdoBx0ByR2MH0wW8nzZWQqdYhJDqUF1xg/xJhPXMcNDQd76T11Iaet79i/Ij/W3E0tcXOKB
 kckezDbTOJHsCstKfO/5fedmpeujZU3/n4BrGUZdckfhGIzcRKbAMMjAnBkxbVNr1DLJoK1qDcY
 3jNgSJ/j4oHzmsQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693f2305 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M593omIBZdqBa3o2AgMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE5MyBTYWx0ZWRfX8tbQs4Esj8wy
 5n0Z/uzhzKzQpf0ZszSOQ2T7LC6xebk3F+oDi1o7CSQ11rNu9c+pr/fAfu3A6Yj7rEvxZ5BYqfV
 0V584EuTW5M5ui2Tfj5hyyiHFnNLA840oZirLdCj4ljmFdr5wRggHoQiOkuzsXvD/YDS2kKtPoO
 ZDu3xOD3sSavyLJRrneQRKlqj1YTbO9QbPlVH2XO9DWVJEZnqFz9UBUyvn86zosUDLP0u53tWpd
 X7iIsU1AovAA0bfbvqclS5kz7wHc9aWeO3t45+Fb9Cgp4aPmRGTK2ywmfM0TvlrfzcQQZZNNI4E
 rek4IZucfuJi3F7io2ZPW1RoiZPY/SqIuZo/BJQSd2d7yXY3y/tsGa0lDGRMLSjEDTy8nPFYjMf
 5+wWg1ZClPTlRrpsuu42566hKIPQBA==
X-Proofpoint-GUID: DtGRhaSLyBpP8piNG6iKF2tQiXEbrb0H
X-Proofpoint-ORIG-GUID: DtGRhaSLyBpP8piNG6iKF2tQiXEbrb0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140193

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

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


