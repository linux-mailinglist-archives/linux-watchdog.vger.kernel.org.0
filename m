Return-Path: <linux-watchdog+bounces-4788-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C987AD0F53A
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B955C301C386
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AAB34CFC9;
	Sun, 11 Jan 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnN+8QeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwLmQbKJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33234C990
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146347; cv=none; b=WJGPevUK9NsYL6pMzKAEwmqKb3P+lj2eOOkRtK1tXcabV0hbFrp49XBzuq85rn12oRvmq8hGjzq4fZPwp9gwQA8Zir+UgC8dppX/aT28fFZCP9BfVrdP1cxTgme973+wFF5hkt9ZdVh8433MDvLL4Q/vKtKAZoh6YZ0qQ1Fqg08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146347; c=relaxed/simple;
	bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6E7WD0l+TCBG7bUfQa14QA8TY5n1H7isZpJ6I1MXK0ehzxEgHv4rMtuM3beH0q3lbsUcMVW8O8iS74f/JLF3K+70PJPJEQsJmCecMMceZb8bkZWsx+diqLz+KDEUC+QgdL3rJAoN+kkNEeg1ai3z8RusxRGTKGXz3t4szw4jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnN+8QeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwLmQbKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BEFBj92120789
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=EnN+8QeEnkeRVJ01
	Nqeft8QRtV4Vw8k1szM1XMuRIMxNqF8znOGkkaQmZIyBJ4xU8RxxIlBH3o1jEk+0
	S7u1qMTCayaEFR5RwVYZ+mGLVhib+g6cVqgk+pFv9fcwK7UHpKBgqVpgW33fCauB
	z6zeyuP4GgQV/SdhueGD8ceSw2bNs7T8GPUpOqKb4fUagoivScqintzcCb1nC3xQ
	1v/5BdmU2ptWbdx81p3mr/VZw1OPywz6ed06QeOPFnzUkxkhySZD48u52Mli83KS
	YRXvfI/A09EtpI3gIbuAjjbyMfSXQnYzUG5oM8wqehIznbpel5GxIzsydihAHCmz
	mMmUqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57acqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e41884a0so1131649885a.1
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146344; x=1768751144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=XwLmQbKJrozfLPTjstVlNAtlQHTZjWomjU/l13cQwFHM2OxKSCC6sL3Ej93+0ThjS/
         r4id1fLTnEA+/LcjgmxlCqBrOY3D4G1RCMJgRw46/qrdmZM1V1MbMZcSmDvm5mGjybtq
         pObqUB2cpp0uZV67lqK4WYqjPk8j19LgD925DYrd76vPkAPSIPRVyBsc+siMtJOH9w9T
         OIIC9JvLPes0ZDT7HZrq44c+MrAjM/VVkm3eDmm4QyY0ur6klM/+2vptAOsaegIwJQK5
         Ytg626yMx+gQsVMmBE5jYTQFlsAWkjENr/qypZAx64FyWWvmp7VSDuXBhLuft68B6x/7
         F5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146344; x=1768751144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=gq9HDoKoAbRgAGKlA4nq8AlxGzFkqcmAePygW1jObKuhQ7//V0CXOAXqFNAxvmSjQQ
         W4wgGq15gVfWDMwfG8Wttfv24lm3X5hrjLi9r1btgIJkAQ/+1Ef86nt320DXHtfhpOUU
         qZPEs3h4/2+zvo4l5Y+vtpyRZQ/b8p4u18ckuDi81rWKBkrep1m6eoNToZbWJgAgV880
         TFGqHapLQgVLS6iEPoppv5C7st2VcC6l2YZJe2KwyVac9bDjtUvOXjby9NPUg1lkmfW4
         TFT3d07m7X/KraWkQ/xaHBekS3RRXSFaXthrt5H4OoRYeSLFGlXNtlmQ/9nXcy0EXk4N
         TwJQ==
X-Gm-Message-State: AOJu0Yy5qiOoFAs0Pjm1B3uJhwywPZtwi3dxDpWF0p1v1emE8I1v5NcX
	CoG0kMYqOenHRcp+JBQo8TGPZxznUmNFCOBprlBr4dd8jseERcZHswlQTp/2ff0zt931ET5YYeL
	SOdJFzoKww69TdFQfUwxhZ3xbwhx9YRUWHle63Mb/tXeLyW2y0QZ7/tBn00B5Xjt+Db1DVw==
X-Gm-Gg: AY/fxX7TmHIaZRtCSPBohF6ENKlCY2jufHFLJ49KKtWauqPWTijcdZmMeXIcppzhNQU
	5TYOHRLLQrS+xoB7A9NiIUuc8x6U7txnYH3SCQf5fajtBWOtMzzsAjHipSuAIJfFwIlCUhpCWxu
	tsizTAc2lImLiOjhQ41ABGbpffDar+Uk3hx70mfny1IEDIRlG8zQ2caVxkTVRz6YzvInCr7Ey4U
	aUf6EaczKtOPyHkexCkCtmfKFueJzmdkvyzhCLIOSxaU53aRaJTsS9jdsuc5yJfYsonVYPbPBNc
	D3YYip2f4SjtNm3c9QdHjB3xGKi6tQAryA8K/HEWkjnbp0wg9w31I9ZcfuLw2r7ihkG3tyIIZag
	QmDu3t7k+ilt5ikozGna0XNeil4E4Y5LMww==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071481985a.37.1768146344277;
        Sun, 11 Jan 2026 07:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz9O7YN1enXB0wx3Ws7XQpMqq3t0e2A1DTAisft9TmruPQQQTLdjNv5Jgj+wrAeCnztv2Xbw==
X-Received: by 2002:a05:620a:4151:b0:8c1:30f8:c884 with SMTP id af79cd13be357-8c38939e7eemr2071480285a.37.1768146343884;
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:32 +0100
Subject: [PATCH RESEND v2 3/4] dt-bindings: watchdog: samsung-wdt: Drop
 S3C2410
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-3-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WgQQOI8xuc4+r7KOXCHUB3EUibNZw62EmtD
 MMnDKY3Xx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFoAAKCRDBN2bmhouD
 1/GdEACXHSiXCBO3zmG9wQ1XItLYf7CTnukRjdr27+vLVZemIeeZXDpraN8MVn6nxSUEZuQ8DYV
 ESDTewwPGB6cX0nH/YlLmMI41ckcffgjLFSwZsZvbV2Ij7KvJ/+Zr+GP3CyyRgxhpMR6hmU5xQM
 RJuoCyZEgsljnceiEOdzatnAXL3dUqyMU+Nc3A78+aFHlrn2O20+Ob/q4QQs52ZK2RRLOovNFdQ
 EumH6G9YBQP6cnoiBasSFZdUT9IqWA8GLujgP5WX6pqSXdy3KgLHM0/OJbai0lZ+ozIrX5mbQQs
 OFLGRXwH6qyGQbwXqbwF8fLpVeNsMDn015u6iOvpLSe628Rty4BanzY9Ofv2Qn2o4sCHUDG689T
 f4Qy0cu7HY0b9EZIu85rFoNFzKhQh7nOC+/0PO0wBiZeWZUxEBVjGxsetyBhaCBHvifIak7RhsO
 NRJcVeGXSnLP4k1B+QG/2YKju4CdgV1muUtonXMfnKV1QTsttXyaIP6uI+c5sCNtsuO7VkL17k1
 Nc7JBUqAlQPXoIlfUHcn7gCtj3zcHaXNz+GODGO3c/KUCTTDU6h0zdGGJmW6hWteDPBsR77dPqh
 kc9e5znP+rHaOEjdjSCcIkV+qgUWnUcS2imEt8FIrBME8xXaWrfhSdj3WrTASXL+0VQX04PmgVA
 sycXjkiLqRbofIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963c5a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=87NIDPt55Z06IyZ_8NIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXwtnejELCvMbK
 PWG1NXfqBXWhUM6mp1VQRMTuAG/oOVhmIaYUTAyL7W130+Ye1CEEb5HGE/QQN1L1dcpfdXnEQuC
 wdhRf0oGvpCPrSnjYLt7rGGkDlUAPqWuWe4ouUG0/HUfdQFbWSVNOyQXEyFAaHMBSyVFPg6AKF7
 e+QCVXxsYxeiOSi1X3sAs7HutQyaBmqhBpOUJnd1MVTmG9VOxVMEeBj/ikNw5W1MExpZ1hMHdEx
 ck4DxazS9VMQ/LUW+L/qCzWUXzdm9S0DRAWz+/Uueg+mQROSLvljpGJlM2k1f6eylXWq547gI//
 xn4U+NjG9SaAVnM4h68H0utgYMFEHQp2Co+7nT3yUJkWDNAFkShwenJJHbfedSOZdyZ2+B4CY+L
 IVhxP3a5H+FS9y/ZD7NVF1N3loHZCM87Z1hECEVZyAlYM6MCk/ZXfbPa/GQxob2suf2BtumOn0z
 veMWUSeO7jE0T1hsJoQ==
X-Proofpoint-GUID: qCY-19AOrfe_JloQKkW32sjOl0PuKEG-
X-Proofpoint-ORIG-GUID: qCY-19AOrfe_JloQKkW32sjOl0PuKEG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f..51e597ba7db2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.51.0


