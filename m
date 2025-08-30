Return-Path: <linux-watchdog+bounces-4135-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67EB3CA16
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 12:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0DB17DFA5
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748A52765D7;
	Sat, 30 Aug 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4bYN35Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B627586C
	for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549153; cv=none; b=D8RK9bWActR+1Xf9DAShuC3/QKWS0ggZkuHlcr2HxJfQtQMMLTb4KteQYf1Qb6Eunbx/ApLSDAQu3oDbpJO4XHfXsvrlAbL2YTyLthguAwZ1P5UI6ih+Oar/KsDGHJ/rsD8Ka/tU3Fqc44gbU59pOczXQf2O1Ohe1h+N5m6iQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549153; c=relaxed/simple;
	bh=NvFVk53JPURQUDV8Y4c/VLoYIsxRD0yXmhCyTafaDzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Emb6pm63bgaXMeSRBkHV9lGFHQN2XXmd96JX69fCSdOaFeiLm54YtWTjI5Ho7CJzZW4UVpbeTrjL8F6koyFp6XfWIzjahoOegZvdgwJoDVbTKG0GYf5q9pNG+xmzvbwoOg4oTwfCQPFhyrWPv6NmkX7hZFhtUkzFhcr2BBybQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4bYN35Z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3d323be1617so9805f8f.1
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 03:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549150; x=1757153950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQkwG3esvRsRXcGjq0nlDl6dBfzj0vcyqIdzAb+t90U=;
        b=i4bYN35ZLZDD0Nzhk/bhLF4zakj4gmtbBh9AquJ7r16P1tCgrJRcBgSGaesVnKHdpo
         eqks+zDij/eehE1a7xhPhYfuGeONd1YzaRvpMqwtjkFsh8KGhwutB//r7UOqyFPckXws
         L3Vsck4BGlzwlLWGw3ku9Re7QN9Ai0ekYwe9cFvnV3iq2dtohoc43QOkePvmIGNbAB6z
         xkUsb0LQv9MMtHES9WYFVNspFJiz9haIQXECzw9ihQm5CxnKXou+sX3YAa8kFO9WYJYd
         dbOQ2hQkZiZC3Ro56XL0dv9JUJ33ZN51xqRbJzoIfwUO0d76YkPHIHN5JPLouH5nUMKx
         Rz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549150; x=1757153950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQkwG3esvRsRXcGjq0nlDl6dBfzj0vcyqIdzAb+t90U=;
        b=gE8z7RM+tL6zpN8wIeEAxLLXga8Laz9o05r1xRAEqHLuElE1E+B1C1rdYdYRVNj3OL
         9Hp8Rl4BtCDPBFviGqbBMlOoRlhHLc5Xlh4viOvfq4k3ykDqtRaQ2kd8fi/RpI01aw9n
         HbPLESLI/bVvU3lkAi3bwVHS7DU/rL/qx/4eaKHuEyfykxpJZZV4w4IIMi9/L92BFo7U
         YeFPSBFa6ofY5hiWbzHUlI+2qTo83zrJ4Wy0bBj+eQLuvSmpsHNy9suJdcCgFFMAWp1c
         lJG/ylKcWktUdBjnYXoBVr8u28WBItPvzskzAMH04porPeNgWUqDUJ++z9Su8Km/xfoZ
         8wxA==
X-Forwarded-Encrypted: i=1; AJvYcCXlYw9FXAk5osczZdyt8TFW05NxXq8cIsRJIfbz028oxB3iB4jpk60klzeFA0WvZzKqXwY7OjCx5AoRZuSJ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NrxySHngErREvTGseJ/EsCRkcfSQzkIgA/CY3gswR/7mTQkW
	AlbXURPERF09OQzZ/EztGf5gcU3JfGmBYN2A7ioQoPnL9wChHoOuBWF1Mc/diUJhGBs=
X-Gm-Gg: ASbGncucx//yd5Vch98CK9L+bjjp0AM8E1UkMBC8RXRZ5I01rsh+0tsXwdU1TIsWg5a
	M1W0YhQ1jfdrlylQZWv7eG1PWY2QO8pBAJv5i6M0FwXwf9qGfYWaA1qrp5tidMCil9+toxQva7T
	G0E2KMhx8Ol2LEWeUONJkTIplpk/hHMcquPHQgCbk1w1bK5qKCcLklCB+2vKSD173Y30ZAKBSvE
	828IYVmkt6PH2GUdd0HaCa/eyRD5XMU6ADuWRpqk6y+xHLX0yqtV2nUCH7HN0ySjwkQbba6jsJU
	oPPO3ai5nYqfZS3zaPi2OpczKfVTV2uhT2SIs16577sVJ4apF43GiJhZCHKDdahJhwa848IlqGA
	nFeugwRgMmoo6U4s89m6A+ZQ8sBO0G4NBIiyAddjqiFnEMSGDtw==
X-Google-Smtp-Source: AGHT+IGvK4zWnlaCkD0f/IQFYVOmByD4kqH4uguG0N/BCo4r6RwhrUrDJK8xeOPyv5jvg1TSq2X0mQ==
X-Received: by 2002:a05:600c:444f:b0:459:d7c4:9e14 with SMTP id 5b1f17b1804b1-45b800cecd5mr22607935e9.0.1756549150034;
        Sat, 30 Aug 2025 03:19:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:59 +0200
Subject: [PATCH 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-3-837ae94a21b5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NvFVk53JPURQUDV8Y4c/VLoYIsxRD0yXmhCyTafaDzY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAVi1bpYXyeIxAn9++1KZjZ2KpRpiB3xHjRF
 uAMEVQ8RMaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFQAKCRDBN2bmhouD
 1xxQD/4ii3iTngoFf9A4Dgol3h6dIma/GS0zpvssmtqke8BXY3xVZWg+j4w7cvobY7VQckDxOMN
 ZFnQ9kmddkcXTuKB33VdUlZLd2qnZiGZohnl0EEdDzQRJj99lfwINF9GdMgxuX9urIcCV7bXLV2
 rNmOLdOfoyTOl7NJjQvBVGyN5dAk/dEPbzqcHkKSSVxuu13deyIZhOQwhagA1j3JKhIYZPUwf9b
 k4bPN0yBvoC8bz474FsU/awElM4pRLcqAObicKeyMhzLZ33U0C0+vQvfp30YF+GIP9HVw7OoufF
 WxE93XppZpgXfHnXgMoph9qXjMycTUkipcX9hpvs2Vt82bfBUlKaSxlz815RMpQ3VgluSoNNS7D
 q9SjLMj6Nnm5AdreDm2wQLpJQ1HM05jlEPU4wYgK/NBDUrF6UCmEeFjBbIJGnUNnHRO6r+xb4y+
 A2njgktciBlZ9ZbtyZ/GAvm5tcorVl5ztTRAkWGFgDaFV4HGhQfqDAaNklgkdwFwT79KwLNodLV
 YrPI48t4HlPiPNk7TbpUBJObPFc9qYgSQmWDB5sBVcZ5Q55sL1/T5VPPlFTG01BNDz3S4qF0tyy
 XinK4XV82zUsIa8JyFcfsqlGlf5VzO4bVfrZ0Knwr6CJ5ZgR/PZpKm3XBz7gISM2seUqrvy2pF2
 XbheD6X0aTBjwDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f002f2b05645a0e748dd9be5aaf72..51e597ba7db2615da41f5d3b6dc4e70f6bb72bb6 100644
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
2.48.1


