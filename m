Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF77669440
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Jan 2023 11:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241159AbjAMKe0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Jan 2023 05:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241096AbjAMKeO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Jan 2023 05:34:14 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B6F48CEA
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:34:01 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id l22so21585982eja.12
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67GIFM4w0hAvvXxWdOb9SiBmz/aaBvD0zgwwHWbhAi8=;
        b=RFBKBKDCxfLFl6eG3A7gTJgZCwDB9oRNIOCDwXHMaKnG2t/sOigSIxc57WJ7zvi8+t
         PtIjYzAJAU/1hMhqBXyU64gIZnAKeIcpjhqIDccrMHx+jvVwtpdblLOyjNOF2Mt4hxJu
         oOeC75A71pwfHkmwuI7nUQlWvbHfeu5rGzniUQ+BGmruDQ1PdIWkJLxUblB9raMEV4b1
         yGwhKvGlnZx1ftkwze9aoqH/vqaVIle5hEJUJELAbKQvuk+9G7IA3el1M11rXvjudneY
         PkRjLhH82ThZv5BZpclePn6unU6xf4V613NACXawL+GrvN0L+ORJakRXzRLR38yGZGFz
         MYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67GIFM4w0hAvvXxWdOb9SiBmz/aaBvD0zgwwHWbhAi8=;
        b=QOG80Ifdvu3n7nujrUJ3RMxgcsq6oQXeg2HA2j2YuTc8OTH1IDFFZrRPIEv4Z9gQl3
         dgT7XlK9W3RHs0pGRF9oZNjXJFqb6qtKfVP7rpM/dfJB50Xh+1UeWSG5CLs/y/Tt7TlG
         8Ka5QuWQqcBGITWQtkKmKJ4g38L99prCp2xzlJ+LAzuPQjLCcMkfIT5tsGPgpwOez3iE
         eliq4Ig20kmGg4wbPVliml35Vmq9QDVr6EdDMcamNivdbPrgSTp1E4VlaNGcO4j6mt57
         D4hBK2O0iXojr2ixYRdkkKbgYjDAE1T4bYxaF2NqTYLll2bd8F2GYT92FKbWLy9aGfkO
         uvCw==
X-Gm-Message-State: AFqh2kqefKWYWd0kat41QCJdybev0W0SUOBLIwCpk22OauBa2RWl78WG
        XUPM50AuqCsT1ik4X6HvznFkIA==
X-Google-Smtp-Source: AMrXdXu6UyZku6/JqTmo74doxjdiLkVHFgc6Q+Hfn0IedG1oehCVXgnm7vhnUbWMejUf5SBEjMjQNw==
X-Received: by 2002:a17:906:eda7:b0:7c4:f402:9769 with SMTP id sa7-20020a170906eda700b007c4f4029769mr85624406ejb.76.1673606039746;
        Fri, 13 Jan 2023 02:33:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b007ae1e528390sm8296926ejc.163.2023.01.13.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:33:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 5/7] dt-bindings: watchdog: qcom-wdt: allow interrupts
Date:   Fri, 13 Jan 2023 11:33:44 +0100
Message-Id: <20230113103346.29381-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
References: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Both of type of watchdogs described in the binding (the KPSS watchdog
and APSS WDT timer) have interrupts.  Allow interrupts and describe them
for KPSS watchdog to fix warnings like:

  watchdog@17c10000: Unevaluated properties are not allowed ('interrupts' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add tag.
---
 .../bindings/watchdog/qcom-wdt.yaml           | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 1828eaf70b3b..b7fc57f4800e 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -9,9 +9,6 @@ title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
 maintainers:
   - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
 
-allOf:
-  - $ref: watchdog.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -51,11 +48,31 @@ properties:
   clocks:
     maxItems: 1
 
+  interrupts:
+    minItems: 1
+    maxItems: 5
+
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kpss-wdt
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          items:
+            - description: Bark
+            - description: Bite
+
 unevaluatedProperties: false
 
 examples:
@@ -66,5 +83,6 @@ examples:
       compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
       reg = <0x17c10000 0x1000>;
       clocks = <&sleep_clk>;
+      interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
       timeout-sec = <10>;
     };
-- 
2.34.1

