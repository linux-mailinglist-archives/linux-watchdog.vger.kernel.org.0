Return-Path: <linux-watchdog+bounces-4134-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B0B3CA12
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 12:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30BA43B2D44
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 10:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34B6275B15;
	Sat, 30 Aug 2025 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uzxp6n4N"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423F274B4B
	for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549151; cv=none; b=XOMmKPfWwveaTIdUOzAXMgtLlaj/QqixMj+jizglOD1yOSq4Hh/1FWcjEBbiNsE7u0lMZIQ/wFyNKm3EJkNh/IcQoClhrQqHLZfSOR2Gnhu5h8OcsveJO+vdF3gPqIq5nLTOl5TriyKzn1cMoFiyHeisR3eind7r7Sqymiuq67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549151; c=relaxed/simple;
	bh=tzOQaWmU4Y2kJdGcyusF9g24SdvfScKvIrSTOFMPkHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcZUieQ3nrGcuFRTwpb5StbdzF+hfyv2XJH9bqpYuuqFijntYcRwsJehpKpKl8K+ixSktaejGhxFU+brgXDsjOkS89SIM+1gjpvWbj3lhI4y5ljA6DN5BbMc8pnmCF/p/29hfaX1enjrlLvxgwgV2x+GT1LHluTweWEuvhi+6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uzxp6n4N; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cd44b9496fso349702f8f.0
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549148; x=1757153948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=Uzxp6n4NFwlvx43R8pXzHOxIIURYB/4IbfyaaPq4tdRKUqjSXzp2b0zZ/+DzUBkcvq
         Iy0HAE5ysIDJfUFwy/nfwEOEFXXz8dP0lW3JgyP7mv7Ed4Op9oFTWQ0AKjlRhWNNpQkH
         S1+YNN1SpCBGKiCNZxuIn7bK4W6GuSZQrh/xWQw+AvMQZf291YVtc2tbJo01mI7Zoz4+
         J+lpK6uHfcKYYVbHDjf7v8/3orplItMfB/nt/J8X/4RNC+W1er+9RbNPW6kMZ9bVNW/I
         F0KlTuF4LT37JG9cHhEZJqjYePdvQvr4MlFQnu2o0hWYsjMjzUebn0W7Dy15iMYvPctc
         M1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549148; x=1757153948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=Bv4b48SWdYf3g9zyhlfaSZrjmh5OSt/KmB5c+IMwa/cAhk2EpYeLob9xYf8DpVPCcI
         iw3QrAb5w1NXsa6nN2vqKKoaFxd9AbY3gK3RArw0bSHRA025KpPGpbjSB2BM3RqIuzS5
         Zez0qpHhiuCqvad9Me2qKxhtOFihtSpUcltdCHDuCYXZt1rRbtltLN8chSWaUZ5yBWpd
         PaM3sRS6NhlJRfg4Xpgi4d4+91XURxskjCFqXDiYvzdMFEH3EtNBA6ztXwjXDr0GXyeU
         WX23QZH4B8hwPmAE9xqHbuCEIZIpuFXFpE2rjtiJ34yHO41E+o344hPyl9NUSkjyElpD
         2j0g==
X-Forwarded-Encrypted: i=1; AJvYcCVp6g9LJhVI8/3yW1huA+1ZHyenDs4Df+skyKYy0SP0BRViqGoVHS+Flat/ah+HIiGTlr3VqRePuFgSjgbA5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCmaVboJEH6PctBdFk4LJugpyHmYjlVio1xslkOo6HJlaMKJg
	Rvj5+cQvTJB5OE5ACZ3qtsfS9zXuWK7KfB+t8RY/4Dgb0KESw+INlETgsaM4+2jIy6I=
X-Gm-Gg: ASbGncuCpYVb0pTJWr/Yr9pqbmlwVZy7FgObNxW90nyU9fNpe96AKqYbIm0vHtnsLyR
	n+pB5gyTwb2/eeoniDCgGNmCBy7k4idY+BoTH7nx19K1zG+IzZXrF0N/RtEBDeSRXq6v3BhfGuW
	/gbnITSxyiXew2m/6znPxFuxpdRoYL5WYRbOxuNhou/9wh+WKbW0q43SuWuVfkUFoEocpwoIQKz
	+1GDU1AeAyIL/3VfKnk90hbLe1PoH62GCBIKJIUJUX67cIWKFx4bADBMXJ7D0TFn1dwWB++vDdJ
	fIItWRrMOav3nXfBcyabNo4/RcLqqVeYOYHPyRs4mm5HEmcslKdx9tWSd/jtgnrufw8x4VU6hN3
	mIEKFew/U57QDujtYM45/gxMCRT8hK5os8OB4L2JRAX+ISmZECwyYAaNnTK38
X-Google-Smtp-Source: AGHT+IFygDyjBigp6iZ69YDdQmrabcSS3QXu7NjqRTS+fEAREpf4yRLclbJcT/wkaR/57d/WiRMZ7A==
X-Received: by 2002:a05:6000:26c9:b0:3cf:6a9:f3dc with SMTP id ffacd0b85a97d-3d0fc3b630fmr1581151f8f.10.1756549148299;
        Sat, 30 Aug 2025 03:19:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:58 +0200
Subject: [PATCH 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tzOQaWmU4Y2kJdGcyusF9g24SdvfScKvIrSTOFMPkHE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAUEYwVAJtWM+2isVc7f3o+wMUKCm0EagDjU
 aZ+JOri5seJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFAAKCRDBN2bmhouD
 19uCD/9CaCFnhAJlqwZJknBdZ3Sgef20JhK7F0OVjmhy2NesYaYZyETjCt/5O33RFCN9lVnK8+l
 r8tud3DpSBL5Xyq4zqA1Fcuy5iKSpMuWigJ7LqDzquDawxoXtDcZ31/th4ZAg2Kpr0ONMCONsPx
 D8FjGLFmNJEGV0VDDcBKe3Dpv9fmAdvw89yHLwOpoEXPMboThA+eIUeOcH3lViARsaaI5taVPhU
 vDvo7xQOBXdSuzFNKsKrSis4pSoSa6/BTHoVAQX/UeVPK7uR+UnUow5LhLBCgck0ylZCU0Ey2e/
 +xFb7ptteGXzDJs36WyeCzmvqUgsEIDI6IEGdVOwE7PvZLc5Ho+PSsQ/Ij+28dDvZqv8+4yMf2M
 vFA7r+QD520/OAFmEePSx8QzVbFMkXse1EF73AnRYW7SEqS3I+gCYTIPRjflEmMqATuRoQR1NED
 m+72P3imsoEOus4/JdSRV+rXVuEYSK/sK1aUjdrTnT7+y3/CUSMDml1xuaxxHWttgkbHoCuJs10
 Mjm749ZzlD7bOY1J7GWBDI3IYaBquJX85jLKnxz8GpNZ/fXQKO7gLa2bP9eK9h9p5Eo2v7SXKXc
 QVgbwskQ2yQN7pnh+5oeGSaYhU395mJhe6AiPZ7NvNesoE+8d9N7tPq972tjXOlc3G8twG0IkSH
 m2aSXlbDucyrD0w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
and s3c2410-wdt platform device name, so drop both.  This leaves the
driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac42613458f93c09654353190785ff072..f65f25fcce3ecbb1739ff98245b69601dc5353d8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -200,11 +200,6 @@ struct s3c2410_wdt {
 	struct regmap *pmureg;
 };
 
-static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
-	.quirks = 0
-};
-
-#ifdef CONFIG_OF
 static const struct s3c2410_wdt_variant drv_data_s3c6410 = {
 	.quirks = QUIRK_HAS_WTCLRINT_REG,
 };
@@ -368,8 +363,6 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
-	{ .compatible = "samsung,s3c2410-wdt",
-	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
 	  .data = &drv_data_s3c6410 },
 	{ .compatible = "samsung,exynos5250-wdt",
@@ -389,16 +382,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
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
 
@@ -705,7 +688,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-#ifdef CONFIG_OF
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
@@ -741,7 +723,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}
 	}
-#endif
 
 	wdt->drv_data = variant;
 	return 0;
@@ -929,11 +910,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
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
2.48.1


