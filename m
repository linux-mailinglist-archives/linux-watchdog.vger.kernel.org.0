Return-Path: <linux-watchdog+bounces-185-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05A80B7C0
	for <lists+linux-watchdog@lfdr.de>; Sun, 10 Dec 2023 00:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB19F1F20FE9
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 23:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70822208A;
	Sat,  9 Dec 2023 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZADniBo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B38C10F1
	for <linux-watchdog@vger.kernel.org>; Sat,  9 Dec 2023 15:31:21 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c3fe6c1b5so5931445e9.2
        for <linux-watchdog@vger.kernel.org>; Sat, 09 Dec 2023 15:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164680; x=1702769480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNKNc9ba2oW+5GVALaJt9jJ8CT91VxfoYNg+x7EUoR4=;
        b=CZADniBog19Zf40pGDDctUroIVaP4xin3/sm7MpHJZ/OvHPWG75SYTyr22tiUmJ4N5
         d6+P/l4TGuaaI9qSJD6CI3UiH4hb5bnocHwp+fEuATOlqoo/vjf5sBCcEsN50J2K5jf4
         HMDngV0mNOCZ2kLUWnEqwnEM2wnVi7dCEVJNbWHIDyaQxXkVKGIqfGCg+ba9OrIH7l/w
         9RWwKkbQ12h9a0GhbCqPXcJh+lqAQyW5KCJ5sVzt3ccwq6T5nn3BVgzfzEE1/RqetBpe
         49MU9khHr0omDwUeW7OZUxAhx5QrH9up3QnE9v8qSwKzavKMCRK1TrMKXbXe/pFCQnmt
         HsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164680; x=1702769480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNKNc9ba2oW+5GVALaJt9jJ8CT91VxfoYNg+x7EUoR4=;
        b=Ani3zTsZBVWwJLMsCIJcGnYi9MxGnS8mQSRb3+9mdLq+VyA7YkDOqF0MBKx7FKSmTY
         SoWYbMehe7kuwpUzwzuol+Yu88K8fbVWpeVDX6C3KOQuMY6GHHEPex22zl97Qn5QV2Ws
         eGi7aXFaY+87Ew1WtlLBk2o5O3f9K6Bm0Z7ZQfctsayph8zi7wBaPRwsBmq5AFPBC8op
         EhUIqSpDnxTrN61miijbzwyG8AweIyUh3GpGHV0ntaOcZY+/44urZjfq+FLn0nsUopv1
         H/9Mp8BKN1tk+qiSqzjT++PosC/SWdm57N7RhrUNxh5RDnmTPAXjsSM7eRipAgjjYfFc
         GFlg==
X-Gm-Message-State: AOJu0Yx8AKFArJlJHIX6UF4OpwwDpTaU5K17JJ1jiZ9Wp/AYor2G2zV7
	YppFWVwNfdJ/9kk/l9HvPxZ0Kg==
X-Google-Smtp-Source: AGHT+IHxsGCDs1nqyGnKq+XEy7/JjY+5fCac/dj81p+I/NjwJHH6T+elv8cUb+jRy4JwuXiqskzBbw==
X-Received: by 2002:a05:600c:3411:b0:40b:4aed:ef31 with SMTP id y17-20020a05600c341100b0040b4aedef31mr1133307wmp.21.1702164679695;
        Sat, 09 Dec 2023 15:31:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:19 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 04/20] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Sat,  9 Dec 2023 23:30:50 +0000
Message-ID: <20231209233106.147416-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" compatible to the dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..57468c2c5ece 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,7 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +43,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850
+      or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gs101).
 
 required:
   - compatible
@@ -64,6 +66,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
@@ -77,6 +80,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
     then:
-- 
2.43.0.472.g3155946c3a-goog


