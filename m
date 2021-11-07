Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EFA4475B2
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbhKGUch (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236461AbhKGUce (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:34 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F90C061766
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:29:50 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f3so31512405lfu.12
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZiUTPwWjkOdBHnULu9dBeBF/zY+4JoUi8RSPmG0iiA=;
        b=FeTRKWrf1EcOADes4il6+1ExbX+gdlwMW/ismfIc+/8SatZ6TsM6OGOd9w+5pAQ2rK
         3/73FA4/5gKyCCdr25TErb2fNhukBiS3SvG+WwI/wCJfS9bN0KnbRQY6hN+GS5jgNtir
         n1x5vcrNu5BWlhzucZEspUS7l1fbAufLc3OHIvzwtAw1749yCyl5Tq4nUwUFltPczhx9
         g2bnY4bFp4vspcz7Ku8DsprIizk85EpbYzodwY694uchVR9Zd2Bevd2c3Nf6L8/HlLIS
         0TUlQ25rgFh2e6oyA3nWE8jv2zurcztW9YxJfKPluijrlts1IquB5kgTC5BmDPspN3sf
         czXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZiUTPwWjkOdBHnULu9dBeBF/zY+4JoUi8RSPmG0iiA=;
        b=hJMWS8lw2oNFxW6uOzqdbnUjDD9CWKQdf/92nWtqLN3OAh0uVeuG3Iyg8iCNamnJSQ
         RT5oVxlEMg7GeV9TvDdceIIIxKqHaGdy9s5akXlrdt5eg8zh34R6rOLiW+fBmyQ9byJV
         lzNMZ2xK8NL66+0kjg+qgIwDQxZlPWvTuhUVulVGirGRgD4b40E0vlbnaGKV+H3RQzTW
         mDDLni19vIfwTegujphLa8vTOCkeDIOmpVNS9YSzCprUJRNNF2pONswVi6jer/Jz4QRF
         UjikIN5IYU/wW4Kwp1POxLkAhLe1yz4t3xFB7llH0NHaHoBR9vkJuJQzn9rNhd953g9F
         vY/g==
X-Gm-Message-State: AOAM531eN+oKjvO0T//dnSl3qIFXCuAHotpgs38fJUdpthaC1kMeDi9T
        Cs4FfBkYD+Fm2+wgJkcAnX8R5OUvhzvhgAG/
X-Google-Smtp-Source: ABdhPJwJJvFZw/4s3IzDhE9M4P9lg7qJbQ2fV6fToqvaB0czT5ovF1/6caVUFBNRlFOUx0s7YDVosw==
X-Received: by 2002:a05:6512:220d:: with SMTP id h13mr46645691lfu.326.1636316988883;
        Sun, 07 Nov 2021 12:29:48 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id k12sm1571487lfg.31.2021.11.07.12.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:48 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 02/12] dt-bindings: watchdog: Document Exynos850 watchdog bindings
Date:   Sun,  7 Nov 2021 22:29:33 +0200
Message-Id: <20211107202943.8859-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos850 SoC has two CPU clusters:
  - cluster 0: contains CPUs #0, #1, #2, #3
  - cluster 1: contains CPUs #4, #5, #6, #7

Each cluster has its own dedicated watchdog timer. Those WDT instances
are controlled using different bits in PMU registers, new
"samsung,index" property is added to tell the driver which bits to use
for defined watchdog node.

Also on Exynos850 the peripheral clock and the source clock are two
different clocks. Provide a way to specify two clocks in watchdog device
tree node.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - Disabled "samsung,cluster-index" property for SoCs other than
    Exynos850

Changes in v2:
  - Stated explicitly that Exynos850 driver requires 2 clocks
  - Used single compatible for Exynos850
  - Added "index" property to specify CPU cluster index
  - Fixed a typo in commit message: dedicater -> dedicated

 .../bindings/watchdog/samsung-wdt.yaml        | 45 +++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 93cd77a6e92c..b08373336b16 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -22,25 +22,32 @@ properties:
       - samsung,exynos5250-wdt                # for Exynos5250
       - samsung,exynos5420-wdt                # for Exynos5420
       - samsung,exynos7-wdt                   # for Exynos7
+      - samsung,exynos850-wdt                 # for Exynos850
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: watchdog
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
 
+  samsung,cluster-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420 and Exynos7).
+      Exynos5420, Exynos7 and Exynos850).
 
 required:
   - compatible
@@ -59,9 +66,39 @@ allOf:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
+              - samsung,exynos850-wdt
     then:
       required:
         - samsung,syscon-phandle
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+        samsung,cluster-index:
+          enum: [0, 1]
+      required:
+        - samsung,cluster-index
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
 
 unevaluatedProperties: false
 
-- 
2.30.2

