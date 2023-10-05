Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65D87BA42B
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237392AbjJEQFD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235961AbjJEQDs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A128680E
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:28 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40537481094so10222125e9.0
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521447; x=1697126247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm1Xoms6oZd6xtVAii0x+Ehd7QscBFZjC7N/3rM4L+E=;
        b=J2PmE2oB1URGEsp76TaSVawfkMe4F4kDzfmcdu7ugPqRHWgMLSBrBm/Xbywv/FZ0jL
         /x6+usNTUBBkF7N+Ww1qEMLzFcM5DPIEJHllwIFkeMX6Jn+BxorWCXRZUWFj7PZjekmw
         kaKtuFMc+ZVXZiDhyNZEzkC3NInSkg6H7XXjJHazPjsj+MlMbBkfyKMRryOLcR/KPfG+
         06E027BQVjlExoL4yeinYpIBhllEzeXfIBC0StTZvtNjjLWIwfXNzbJhQ0oixQiyIdjs
         ktf8UBb4gmodCIrdAR48mXx9JX4daW76ZGHX+Q6oXlDzzMYh5L+fQUZc0x5ixObhuq2u
         7cCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521447; x=1697126247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm1Xoms6oZd6xtVAii0x+Ehd7QscBFZjC7N/3rM4L+E=;
        b=latW/MeYdDIe26BPbp54oyWCRQCdCq8S4Rf2fivIJxCAvyC8HLL8yAEJ08a8XvZScc
         MOw3GogUthGhvENK8sBgO0ooYumxHsLHOXumxV2tjk8h/qbiqz/O8jd9xhAcWwVpb0nu
         YfTt6TtqFhc/Y9kxKnt1yYl0X/BFR0iuEocrwSsXv2ACnDuNRXR/Cd9eeDmRcE7jVRSI
         F9nQXQ5zE8skzWV0HeC/W/onIRX6RuF8QUWL0HUY5VLUzP05dkkQCAUKgU0JEzlMAj2H
         NG81dgCsP14WjvapGowvx72gme0W1pqMfmd+QbkcR6rw0X+3KZ3ZOzb5HfWoZPJJjJ1f
         voPQ==
X-Gm-Message-State: AOJu0YwWAHxqPTiYNIo6+fE484nqwY791HqTOrZO87QZ+Mlkvv/44JzQ
        FFFUihql7yq8G/+iGd6cPWgB3w==
X-Google-Smtp-Source: AGHT+IEMvnjwfd4IeLtIJsxbXTd4pMr2IsgDm+E4xxpemwktFFHqJeH+cuxPlOWDyzgeNbQFbEBaMA==
X-Received: by 2002:a5d:4c4a:0:b0:322:478b:2be9 with SMTP id n10-20020a5d4c4a000000b00322478b2be9mr5294165wrt.25.1696521446692;
        Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 05/21] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Thu,  5 Oct 2023 16:56:02 +0100
Message-ID: <20231005155618.700312-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..30f5949037fc 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -24,6 +24,8 @@ properties:
       - samsung,exynos7-wdt                   # for Exynos7
       - samsung,exynos850-wdt                 # for Exynos850
       - samsung,exynosautov9-wdt              # for Exynosautov9
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs101
 
   reg:
     maxItems: 1
@@ -42,13 +44,13 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gsx01).
 
 required:
   - compatible
@@ -69,6 +71,8 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -79,6 +83,8 @@ allOf:
             enum:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       properties:
         clocks:
-- 
2.42.0.582.g8ccd20d70d-goog

