Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563D1669432
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Jan 2023 11:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240696AbjAMKd6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Jan 2023 05:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240887AbjAMKd5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Jan 2023 05:33:57 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C663C39A
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:33:56 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id vm8so51290808ejc.2
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC87lbi3Kix1/WTr6zTXwuAcw9PYl2E9b9lmeuRXx74=;
        b=iLUQ/VIDzCMYYUpP2NCWz1zh2HYJwz/kLaPZjR0ielr/eEO2FL81rphdmYz1Qc6rU1
         KP6dWMOcacq6PiX6UyY/yYf3m9AKLefD0KNqcjevL3a9XJKfRNmCUDVaE+Ym5DI1DkW1
         0mHVxMTpB6PVADFl9CxY0wOdxUIg56VlP4Kr7EmGBSe9qzxhTfltX0qVcCnnZW2JypOC
         5r8kSbFRaUusKALy4DNcoC1DIz7ORfnlmSdqODYpqLgInNKgPhNJlL7iBwIh1NC0DCNW
         4syGlTD1GzF+HKpjl0syKTWU4uusJuZ/vdWnDYIf7P7wuJegYXvAhYQgW8RpCznHn39c
         9Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC87lbi3Kix1/WTr6zTXwuAcw9PYl2E9b9lmeuRXx74=;
        b=8LApyjOmeocQut+sloap1oZI+Y+vqsCVMOgDXm7fuqIFNzUKY6VUAfR6VPD+7pJU/T
         peCP9lS2DaajEZijEMd0PGyHT1GzFlc6KsQnQnga301NIQIkMRDQsgwz/M2zIIgeZRQh
         UhFmeMuRhy0ttxMrKKnVE3XbEqCD9FIc+3BXgZ8ptyHx2Wrrr9ZijfHY0z6o9ljAWBeM
         rh/Kr7GNPEIiQ9Wp+zgsNN66uuvvfMvX88KCmsgDKTT2HL4GmJETsfepcEemBdMG812L
         0Jl04sGhVd1K6Ymkp5Dp7HuGxSZMMbSd5Snq8n6fyZCQctkeQcjtbiUrxrmgxj5+IQOF
         /qeg==
X-Gm-Message-State: AFqh2kqTHJ2SXt+s0TdfyjNEsJc5fZgFozvcv3IZC6f4zw3ReqTQwV63
        cWl81WnFzB6L5RxyzfnwvUu3Aw==
X-Google-Smtp-Source: AMrXdXsbBzg83GbOBY6A3ZILRYqJbcovs5RxB+a4gZsXMO2UEt+aOlqgpY5N7aFPAMjW4eMIGVdkKA==
X-Received: by 2002:a17:907:d10f:b0:83f:cbfd:31a9 with SMTP id uy15-20020a170907d10f00b0083fcbfd31a9mr62188273ejc.47.1673606035761;
        Fri, 13 Jan 2023 02:33:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b007ae1e528390sm8296926ejc.163.2023.01.13.02.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:33:55 -0800 (PST)
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
Subject: [PATCH v2 3/7] dt-bindings: watchdog: qcom-wdt: fix list of MSM timer compatibles
Date:   Fri, 13 Jan 2023 11:33:42 +0100
Message-Id: <20230113103346.29381-4-krzysztof.kozlowski@linaro.org>
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

The MSM timer ("qcom,msm-timer") is a bit different timer and watchdog
device than KPSS watchdog.  It has its own generic and specific
compatibles, so fix the list to reflect this.  Adjust the example to
show the newer KPSS watchdog.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add tag.
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 3e0b30a817d6..93e4381067dd 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -33,13 +33,16 @@ properties:
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true
+      - items:
+          - const: qcom,scss-timer
+          - const: qcom,msm-timer
       - items:
           - enum:
-              - qcom,kpss-timer
               - qcom,kpss-wdt-apq8064
               - qcom,kpss-wdt-ipq8064
               - qcom,kpss-wdt-msm8960
-              - qcom,scss-timer
+          - const: qcom,kpss-timer
+          - const: qcom,msm-timer
 
   reg:
     maxItems: 1
@@ -56,9 +59,11 @@ unevaluatedProperties: false
 
 examples:
   - |
-    watchdog@208a038 {
-      compatible = "qcom,kpss-wdt-ipq8064";
-      reg = <0x0208a038 0x40>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@17c10000 {
+      compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
+      reg = <0x17c10000 0x1000>;
       clocks = <&sleep_clk>;
       timeout-sec = <10>;
     };
-- 
2.34.1

