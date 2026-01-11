Return-Path: <linux-watchdog+bounces-4787-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19FD0F531
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 16:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF223046772
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 15:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4074834CFA7;
	Sun, 11 Jan 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlojS593";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGQFbjje"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C943081BA
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146346; cv=none; b=Am5dKIVLJgjgM/5MRVZM0JzHEdrK4AELgttoxcEGQdIukSA8KVBoEGy2No5eri35kpHPWwkod4EkQU8sgvWDLqYJod3/LfqK/sArKIO4S6LOyeYLJiAtzE/Uyl0Tp+JQL+hojZfGncI82FnWwdOWq6yQXoOUGpmSZnxNN9vl0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146346; c=relaxed/simple;
	bh=tfUVqfSUN7/loUc0Y2WZXc/4Aj4HFepsvMYbIp4rXe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aExXtVOnfzNB1TP+tue859SN2E40zFfZ8ftCbvPWYLnP08OeWA1bRo7LFpZ/p3qQaAQVR7+UTiJfnYslTu/+wHiLr/n0BHw75UV6U9U9lk7YkOfJyHaCqSgAmilYO2oC11qKoSlQzUvT3TMLxLj/zS5jmaQ7iRwQRHOTRvX9+p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlojS593; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGQFbjje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B9c3YT2597035
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=; b=XlojS593hlXIZ7Mx
	gwBumC/gHHpEFprdV1RxIc74c9yS1PBkWL2iH1i1lyajdgi1PA6wh+dXQe0Fib1P
	QEU3afWQD2b62ycU2X7EIusWthnuPECsar0XHohAcu3PwJ/M06cDGE6XXgkQc455
	3hr7v5eWZEvKd6CzyuEYLqbQYpYmFi5KVz09BIBMsRgcAnykXDD7VgwBO7qSxHUL
	k1dOUBZCeA0eJMjLc0AI063wHmL8Aj6ehjOKDZYur46+xwA4UoGQFFHUNenShbzl
	XEehEcLXoci/7twcFF2/WmsGoY6uk+ipLEz4CtpwqJBKRnJzEBnmFhxqgCAsT1WR
	QH4C2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu2e68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea3d12fcso48229085a.0
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146343; x=1768751143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=UGQFbjje4re4i8/0uqqiZUM1pk/ofEDeCJZwGfVbFhY/2WffhkJlCS4iTpnkiqBghs
         6MAscyS6mnjW+gEYbFTBL/B4kyhtpwxcJfUwaUDChX3gKKveCy6vDJiV91IQJcgx4Qib
         w+iU1gep0AkIUwBy670LOHJr4weCYXTBA1E3aCw943OYOzMkGHTQd9WQ0ig3oPbU276T
         s7tjowlzGAI6L7KxFke4T2aihw3waxlEbqGwIUxi6Mk8ymG1kPNCDBpnjM55ep2xSdh9
         G6pj2C8nAV23XDkz9B43uhcfyzBfWK1jPbQ/gbCFHsNl1MniNMQ6cKhrC3iZpHK+lVPH
         x9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146343; x=1768751143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Ps9zzlmwajZdK6WVYvUFwmHm1zDHy3alwitBecy758=;
        b=lD/gaem8oKxYg1/S5cBy/NW6qBzhlFlLg9U9CubxUC/w6o1bnVGlqSzjgBiweSfzc1
         blpHLO9RNslVfDJHnq4A18lLj4caMA0SkThklYJZQS8Z9rMV0dAUZCqAiv3UJ+1IGdgb
         THxhTUBTmp73wT8Vnm9pr+EPkz3Cz++1sKNdYkLHhGDZmq5xJTGXDzvcsdSC8ZfQSyR4
         mxeacuOspzKGSSDV+ij2LeX5DKggLd8Z+bb254SYx7VbjzuW9roMFCv/75ReJ6vAi5BW
         S2lRGVpXLrMphRxYh9j2ij7d5Re7hTjtd00bz5BhBqM+ueT8tY7ebQBC6JCVkFSrMjrd
         C9ew==
X-Gm-Message-State: AOJu0Yyggom300Yh4gQrElMTjmDfWHKCepzP9jOBshBdVS3nOhwJnfrZ
	0gCT3pFRWkbRsxREELYPtop2j1ZVjecOVQENaB4R1SV67rvAq53tj/M0R/NQ8HAqkEHhMxJUi4z
	Obdr2PobquzajWo2Mw79Td9kKmXGn8V1rQhVC4583Z6zdC7bST/1URvRT1pPGWiysciUYaQ==
X-Gm-Gg: AY/fxX4ngsVXBy6SmAonp1+U7DHoQBEMQo7ghPOWwHHidvNxjtfij4OMJx5GP/mGmkL
	G8psApAYaMeYXB9CNN10NaF78BiPxhE+eDLjH8UrQ16Sd8KJj/c57/sl/tT6OgMdikOHBAhWbSt
	q3f71PlSrm6mOQ0/xLSueo+V+pH2wM4kcTW/L8ibMOCgt58fER3FhkkrQBPoE2/3TKYmIoRGsNV
	As3ZmbFypU8etZ43X91Rn5Xz8XB/jUsycBKeth5S4YGS8b1/rfnkRoCbdQGmAAtj0pzGsZwm1hb
	/opgC4Q+e639eqoPtCyqSELx3Vq1K+1TmZgR/Nujwj6CLbqof7W9BAYplDouNAbg1MUsBgnZ09/
	euEQSkgqU7clS6+Piq1SD9BePbhb1T0Z4bg==
X-Received: by 2002:a05:620a:4555:b0:8ba:c15:e998 with SMTP id af79cd13be357-8c38938b5c8mr2149039585a.29.1768146342900;
        Sun, 11 Jan 2026 07:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvsha3u4Nuo7Y3nMu2qTWPHZlW7jiK2dwV64P/LB1S8s6OVHDY3b3dD6dBTP99yi29N2vlPA==
X-Received: by 2002:a05:620a:4555:b0:8ba:c15:e998 with SMTP id af79cd13be357-8c38938b5c8mr2149036785a.29.1768146342459;
        Sun, 11 Jan 2026 07:45:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:31 +0100
Subject: [PATCH RESEND v2 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-2-fab2d21a2048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tfUVqfSUN7/loUc0Y2WZXc/4Aj4HFepsvMYbIp4rXe4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WfQB9eA5fjhUbOkZcGFnyEZ8Z9nulliqAw3
 s7BG3vnmdyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFnwAKCRDBN2bmhouD
 1/4iEACRraOZ3YaA+6GG8UwHOtvBOGeUda0rq/nK6G100DesDo/Oo81m3NOkcAtQwHWCVQgGYfz
 lqnRs8kGQMw81r4iPveYo4DLx1PQ7fcUbfR4iFvHMZDNEGRJVk76nxOg/ouuAu4bnz7DVDrYf92
 RlDKKpnPx4v4Zx5UC9OOny3d4KfaobFuKOwUr3QWMNUgCf+n5U+rvvoWeNUN5azXTd8DZYnTy6H
 d4P+iNisUVljQ9cc5HsE3mYIivP2rSbELwqgXThGkHiJWW4rxjrpJ53BgWGjSmtEXKtrevtANz8
 7Hdyctwd2C2H2BlR9A48X3mQoDcqeYS2GJtm4aF+gOteAP58UftHpzzaVdSuZ4hnxi3fvKKTR1L
 RNOltTI1W6VAokmskGNKegF9j91GxpDtBKDVEc+fdcCEGRpNFKDD9GbET+DpHzWzKGb89SNzFHQ
 YHpse4xSQEA/lO9+lwEnHXHbHY2aqWSmidbnTjgwHpOq91dfW+q/P65cXXt7FdnzvhogqpKspuH
 z7aN0j2HxSCTbMIM0yUON+BxWcSgHGdj0qCGWU6gZ7Sx5heRAXIquBFqUDiwg7IFbZn9mBiNTT9
 PKekTnBzRl+S5YwN2YWSE97mvOWS28SARWkeX4v03oMOqTpTCO+YhvQc01kn2EFscA/XqhXqcvl
 JkHdpp8q9Za2h2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 4JyjttVb2GhAZx6SeernW6FWPDh5jdh5
X-Proofpoint-ORIG-GUID: 4JyjttVb2GhAZx6SeernW6FWPDh5jdh5
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6963c5a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=SrvLU9wFeIYBZhyLgqUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXxlzMiKwuCR47
 uOpRA2ixNCpkx8rZKpprwTLNb8XS70kCgMsqFuP+X78KeveF1ctr8Zxic23tRyr0H0iDJzA2TrO
 rr6Mge9JAVRlbyOlvpIj0BpXqwvui2SIfAHjMeY5uKHJSQ/vyjrVAN5mKZUkLtz3Xl6ASzj3obN
 JzKraBdkKiEl96Vg2fNA7kJe/WVLV21slK26Ajplv1yVGlO3LYuvTKL588vI3TKodF/qzh4EB1v
 IO342KGoVhFp8YTKJS4K4zjpYAzYwggYd/udmGEbLny4Fa6C8FLWg8eOEVGCZLjSzFqF3cCMWy/
 smhjqVDwUksTLOtAPVEQ6na7zy9bPKScydruRPCOsNIcXTp3FxAWKnSBqAVnffriitSnqD3JRWM
 gUVSTgUzYv9bdUh9hPT+0jTU27Szvz76mApPS1TBNQhkTK+6+jQbOGVbXcvjezPr8hp0WjJxfMb
 zFOKD+APqNyqHNCWzqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

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


