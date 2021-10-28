Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B9E43E86B
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 20:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhJ1SiB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 14:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhJ1SiA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 14:38:00 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C77C061570
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 1so6369558ljv.2
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qxGj8ruYQXbdMlsDQaWiFHYINmJfNHh4ixIh1XClyl0=;
        b=ckofLK7Sa+sucC0aMZYSqjyi1MWCkTqu39gaJTKlg3UW5Et83dm1pTloYpabd0qeuV
         ZJ+tqbCJu0vO2+Fw4Pkq7IkUzSiE8I/NxYRfzGC61o3MnnT6v3h4FKIQE6tYaBzdUP+p
         4A6YFe4YwWDQmbGBb5cOE1+uUIo4wFmvRWLHq1ZfNEuwUDR5/a/SWSyO3CvKEUymFAA7
         P1y6oYXgilnjfYt7HfIrbwv2tYvY3m4d5eIW+VRC1+N9OPZw3eVO76HYFfQi7bGaWKAG
         GfHt8GNfYj8N7AfOI4ZEsebO2ZvgJXHlQW2iuH9lDz1+cRflpxU0VMFhSrqG+9TecA0K
         yYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qxGj8ruYQXbdMlsDQaWiFHYINmJfNHh4ixIh1XClyl0=;
        b=mmHDjsDU9oyairZGFGyh2WMHgb+q22xys6CFkueVHyneE6IkUZ3mYIm7LpYiSSLWbR
         LCd+xaO+Zpf4G3nyO0m00/xiFeAtW130e4/9M6596hqjfiJxfU+EqhBIoxsrkA7wRwOH
         ts/NGpIDoqUxNA8wIyU0hZ6vdjzF3Y6F5ioeC7yGQM8JOgo7DcvtR0/lG+cVkQc8b8sW
         ShuFMNsaSGVz1/peMhwmcTU8pGNLFBd6NICy9aDRqy04LNN7MRUWv+N+0pRlLu7704we
         9KMvzHOUjniP0zGxN3Q/AlL6LtYyedwXvRwD9pdX2DSaUjqQrUPIAqlKed7G81rDqWzY
         AkeA==
X-Gm-Message-State: AOAM5310OuW7A85MCYmMhOy2hAOTtmtmPfuFHRsbUcF1ly7Q9attCULX
        TRfUkx/1mxU86JyzBT3SAHJprg==
X-Google-Smtp-Source: ABdhPJwWl2cWkn/oMEy+9pMPff1K5svaTl8d+C7T6biY14aKQY1iB58MomSenBJbmQsXLkO7Gv9ZfA==
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr6315368ljp.449.1635446131729;
        Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w40sm389589lfu.48.2021.10.28.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: watchdog: Document Exynos850 watchdog bindings
Date:   Thu, 28 Oct 2021 21:35:22 +0300
Message-Id: <20211028183527.3050-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos850 SoC has two CPU clusters:
  - cluster 0: contains CPUs #0, #1, #2, #3
  - cluster 1: contains CPUs #4, #5, #6, #7

Each cluster has its own dedicater watchdog timer. Those WDT instances
are controlled using different bits in PMU registers, so there should be
two different compatible strings (for each cluster), to tell the driver
which bits to use for each WDT instance.

Also on Exynos850 the peripheral clock and the source clock are two
different clocks. Provide a way to specify two clocks in watchdog device
tree node.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 93cd77a6e92c..19c7f7767559 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -22,16 +22,24 @@ properties:
       - samsung,exynos5250-wdt                # for Exynos5250
       - samsung,exynos5420-wdt                # for Exynos5420
       - samsung,exynos7-wdt                   # for Exynos7
+      - samsung,exynos850-cl0-wdt             # for Exynos850 (CPU cluster 0)
+      - samsung,exynos850-cl1-wdt             # for Exynos850 (CPU cluster 1)
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Peripheral clock used for register interface; if it's the
+                     only clock, it's also a source clock
+      - description: Source clock (optional)
 
   clock-names:
+    minItems: 1
     items:
       - const: watchdog
+      - const: watchdog_src
 
   interrupts:
     maxItems: 1
@@ -40,7 +48,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420 and Exynos7).
+      Exynos5420, Exynos7 and Exynos850).
 
 required:
   - compatible
@@ -59,6 +67,8 @@ allOf:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
+              - samsung,exynos850-cl0-wdt
+              - samsung,exynos850-cl1-wdt
     then:
       required:
         - samsung,syscon-phandle
-- 
2.30.2

