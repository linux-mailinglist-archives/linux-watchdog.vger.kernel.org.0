Return-Path: <linux-watchdog+bounces-4709-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFECC6F70
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 11:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AE43086EDC
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Dec 2025 10:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B573B346E5D;
	Wed, 17 Dec 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFdkvJ8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGHm4sB/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD176346AF1
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965128; cv=none; b=GRAWTcXn7le6oWqcGntHWKYUquPpMmc55pFA6OJLOUif9PQoa3HHapU8wmr+qnThXIc7cgtpIjaLqZWZEGF7ASUndeqjI6u1SK+p+XeKKC7wjFT+PP4OYxQjWB0umWJ13XNa6fI0/XzffcCjNtYdbd0J7/+XQu0eHIBe8BWNO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965128; c=relaxed/simple;
	bh=tfUVqfSUN7/loUc0Y2WZXc/4Aj4HFepsvMYbIp4rXe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohPapN60iJJhVEXa8QA4eM0rFjrGPVbEhNZTgbapB46Doqjz98G6v+RxtD2e7LbLdAiCmbOfIHrZ5PUtyptQ5rhTWdNsAqWeYN/cLM1qUnbX2rDO+oBe8XwohGSgjCIeZAhqZnJ/7rnC4wOKqMzjHS6ErKQV753nD9v+Esh1UoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFdkvJ8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGHm4sB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0dA2023770
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=bFdkvJ8V86WJnu+b
	7O1dd9CUY8wuek248dutRBEu5fpmHqABaPWNqT7DDNSNdsHCGP1h2FEYoNiNYYhH
	fC1BJsbfxCvxyi+gukYQRs0+95qq5uhsezsXcByHGXI8mD7qJoQ2NQrK6cMYMsww
	CrhFKyGVt/xG/qBhpjOjsqGZNURG7Xi5AAItMw0RKjpilnqRnFHJvlosTLYV7MuO
	uuUDFOtOT+GeVDg/Rczd+WfxbiwGuBi1whEM7nBV7rQsvPw5b93sM0Dq0bJRiLw8
	VHC8z4gXU+H0H6PDUH1SANEvFMpu1wgknZw1xbw789S2T8cU85xS1aztA20MMhpz
	kNFGYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hj17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 09:52:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee21a0d326so72912521cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Dec 2025 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965125; x=1766569925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=jGHm4sB/rDv68SGR0cOlnVq6nXT9bEphzgJSbxTzP76ljO6ua+vF4T35pYJA5v5NCA
         GhYiPJ7i4eWqhQsSWNKgwwc31QUhERiaxZjDS1jXzjHHA5mOeDqpqbNe9vBhyrb42Yr4
         ZS82Fyy18MCdIjBJpe95gjtgZZekAdGQcRhw5HHnT+l+YIUcCm9xYC590pK9/EQHx324
         7EZBunYJO7CRdEmJ/wcB49rj4emkAlbzbfe7bL6SJnRRYSAxUywuUY1U6d3N7+LwboHQ
         Tr8AG0j11FZP3aTKWPSD9FR5c5qu1/NHzcax4YGu1wRgl6j+55s4OBPPvDf6nfQe12db
         Z8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965125; x=1766569925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=p54mlhfaHoXqg9DV0fWs2AqfBkOqm3vfxXX0eGNWB1I7Pfo+oMJPjQhhGFBin9oNrB
         MFllG9JSbAWGdk4J+wZ8ygN1aP3cbUnTnUUs7QLL9g8SeTT+N4fSIodoK398hg+O2YWd
         nEwbdNDIzpXvAUdm4MnXarH/XQkBX92Y6V0fDUq+R/7eIkxKRD24b4dpxvU1oyucGVV3
         d8B1ZlSP4wJ44U9gmPUXv7GiIIuS9deoFXPsq7rDeQEYLep8iqpfSE/I6hbBvWInUJPb
         Alh7PzJ0mFwJZ5EP/PXLkKZcre2K8t2aFsiNQJsyWgLKPO1XP44H0ULRxAF8NCaSPAqK
         GkHQ==
X-Gm-Message-State: AOJu0YxwCj4FjeY/9SuUzffLQBwKUpOc9eAIML05YUjny+Q6x9mtoGi+
	IgPG+ujIV5GHy0Lc3Uv5ka3QTS7LFRhdxdxh3ImabWWPRZmOlDJOghVQGRjqTxIhESz7sZOSZBr
	eCs2K0Xt6uSxgSDW0u6VG+gLRyrP4Ou0hmCKwitv+ZAFnL7z4Oc4BS+9xB2Qfvrz1y+5UxQ==
X-Gm-Gg: AY/fxX6Zg+xfARicoNDYbD6D5YsyNZEslu9giShOJ7IM0UudDdWUcMX5UDwC93vGlFh
	/3xHYc2f1bIKHnZ07Y/ifX7Ol2UARCT6J2sDKZ2LUSs716DYkNKDNo7HpNXD99IPNEINzF8djIQ
	+T111D9XASuQZI6lSGtTewTfLi/JSPjHuHH0jS5CeStfih1vhPRSJeNBTmEk/ncap81YbLgeokD
	3Ofdqj6oXq/optSwKKn+faWV7s9+zR8yKPP4m3U/CJpJo+4rDVJrJShXhhNi9NW2SuyHZAVyG0Q
	zANRI0GQDlqEB/QaDYs2nxHBntkIMVzQG8dpcWB6wAxoU93efbhe7Z9NL6m9qj9VwioeBV+Z1I9
	vgT5TYGqXyhlOhTSZg3Zny59faI7Mke0y
X-Received: by 2002:a05:622a:2443:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4f1d04bfe5fmr242556841cf.24.1765965124970;
        Wed, 17 Dec 2025 01:52:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+3hMiRP+attklLgtgofiK57yoL5Ct382xF3L33kH87mVyl7+crPmgYIhkbQpPG7pV+dpESg==
X-Received: by 2002:a05:622a:2443:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4f1d04bfe5fmr242556561cf.24.1765965124521;
        Wed, 17 Dec 2025 01:52:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:55 +0100
Subject: [PATCH v2 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-2-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tfUVqfSUN7/loUc0Y2WZXc/4Aj4HFepsvMYbIp4rXe4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn08njWbvBo4bxgkg+4rCp+eaWZdetCYgwez4
 treNRcnbtyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PAAKCRDBN2bmhouD
 11A1D/4+bDgyvQQSOxP+Hj15yNATRPRad5DXeWoPM2D+tS6/0Rpv9Yc4KbVCS4adhcHgqhA9lRm
 +UcnY425ViAFzPCwFWGFE6kYPCBmpOI7VYQHxPmeC2egbN8GahfFVqgT1BtsTwxm13//rymFAKJ
 wnoCM5HS1OLhF7T8JDbL5qsL2jB+0J1FXSnZSgO5ICa8mxU5fX3nCp+Wh1O1NFHnOpxo3ujKm5w
 YRMj/b/dcekLaDDUn9nlm3v524UDYLOa4hj9sthCq7SRRjJRFp8aDZ9GesI4+RkEyn+AVumNz0x
 I23Jz8aCyCIuwFkGVZk4iOCfNwRfJVR8PBhpeIpuj4CWGlIeL+rZ5xjaYjkI4m9dNeCpt2fx2G3
 +9tK6dTzvukYgIRI9BqzYbkUAeKdYn1RXn2/4e+lo9BpAQe3PQbIV7c/fm+bSejhRin9qLx6I9G
 7/lrByx36rHradlyHcM7ZjCH2EKKZ2I9z76+ZUBAYKZBD05TrhNpKDwb+1u7nfKiqB7Umcy03lp
 eifr/o3mNtV/4bdZnpgRc5KU6RX8YsNdW/fBwOtKLUpwmMsQ+tiXDaBlEbZpXUHrgdJka7lwAab
 sDut9Pl8T8eYwMfmS/I+tXamqv1NXv/NJ7YIb8NIKSVVqqxwzO51lE+PbsR5yWObyQ526tP+Xmg
 j/hk5m2Xqvwp0gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX3ndms/7pUFj3
 6HTDndfJv6NPlsTtPc/3A/5ZPFAVPQnhsdlgj6jDugj3DS7SD9Vwk2oOmDxPf01B5Qmf24PsiGG
 Os02mcoM7AmYRILq2UCPcU0XI7fA23/PAXXONxTldkAslIlKKb5uKQoIuS33H0iL/4oPqubMMOI
 o07qWfVY2xsxGKs5zrbk71IgDa0KWRUT7j6nOjBbxooMwSoRBu4mjTeethalOD9T3QowdY4l5i+
 drJCW5Qi2XYJ6thGYvn7EOsHI1ZAg4SPAvJAJnH9uPSRmfgvIepAEH/I0XPuxMUj6lChqqDrjhm
 PkCBMGALV1gJtrWydomXQkSHQCzIJq7UmfSR3w/uHVNLzkAniuvfZyxL+dLXNkJlqv5g7DOkdPi
 3CaJn5b4hjUgkbxnoZvBHHnG99EvQw==
X-Proofpoint-ORIG-GUID: 4PMGdKQaEK3aquke6blUTce5KcB-6_RK
X-Proofpoint-GUID: 4PMGdKQaEK3aquke6blUTce5KcB-6_RK
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69427d45 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=SrvLU9wFeIYBZhyLgqUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
and s3c2410-wdt platform device name, so drop both.  This leaves the
driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/watchdog/s3c2410_wdt.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index b774477190b6..e31f93db0509 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -208,11 +208,6 @@ struct s3c2410_wdt {
 	u32 max_cnt;
 };
 
-static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
-	.quirks = 0
-};
-
-#ifdef CONFIG_OF
 static const struct s3c2410_wdt_variant drv_data_s3c6410 = {
 	.quirks = QUIRK_HAS_WTCLRINT_REG,
 };
@@ -378,8 +373,6 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
-	{ .compatible = "samsung,s3c2410-wdt",
-	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
 	  .data = &drv_data_s3c6410 },
 	{ .compatible = "samsung,exynos5250-wdt",
@@ -399,16 +392,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
-#endif
-
-static const struct platform_device_id s3c2410_wdt_ids[] = {
-	{
-		.name = "s3c2410-wdt",
-		.driver_data = (unsigned long)&drv_data_s3c2410,
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
@@ -720,7 +703,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-#ifdef CONFIG_OF
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
@@ -756,7 +738,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}
 	}
-#endif
 
 	wdt->drv_data = variant;
 	return 0;
@@ -949,11 +930,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
 static struct platform_driver s3c2410wdt_driver = {
 	.probe		= s3c2410wdt_probe,
 	.shutdown	= s3c2410wdt_shutdown,
-	.id_table	= s3c2410_wdt_ids,
 	.driver		= {
 		.name	= "s3c2410-wdt",
 		.pm	= pm_sleep_ptr(&s3c2410wdt_pm_ops),
-		.of_match_table	= of_match_ptr(s3c2410_wdt_match),
+		.of_match_table	= s3c2410_wdt_match,
 	},
 };
 

-- 
2.51.0


