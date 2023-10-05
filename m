Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953207BA463
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbjJEQFO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236864AbjJEQDd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:33 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7986985DB5
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:25 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32615eaa312so1110712f8f.2
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521444; x=1697126244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqGxynjd2WPI1dcd+xfmUDs2mxNl3KtmyJFW0p/wctU=;
        b=dwGhxgLZi7YRLBQftSjLjjY7VD2il1J05qW/5YBdSnUsolZHGmnKeI/CQqpJ19sS7q
         +uoRAsa5BeO+gcbBkuLfV4TO1lnx8fKzXMRoiJVL3UbaVVndwAVihH2qFofkk8P7YUni
         7zFDiwUc2EOsx+G1w1Jebr2A2LeF22aQgqgFDFSMDAQlqufMrnm25KgPxCYCtEs2FwKm
         fOJV1LIDb6CfRxL/HFOxg3PxVwDC6hX2i+CUQczl4HvPWisuIzbr6EE/KRqQt3jk2ZHj
         DZhY5sa7U+okVVw65pMHyiEvVt3yx/cryPc2UUBf/hTGS586Nsu2LmYXbxQRrlI/2g5E
         If1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521444; x=1697126244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqGxynjd2WPI1dcd+xfmUDs2mxNl3KtmyJFW0p/wctU=;
        b=EmK45CiTJpLHpJ4iinfS24hB9S0JrYKZpfCyNinsaSOXSl6AL1J4w2gryyAg5ugS7Z
         Sn4Ujg8hdh8OW7+EzIIo94OYgASRGH+b5gEc5JO7rewjmkh9VcSbRi6mAmjq/XmkuBAV
         kcIX9R4DR1518LT/PhqOlTFLaTCDESXq81rtdj39OlBjbM7SkWe8t90MpcZg0wiccoyi
         ATHcR6xDNTeUj1EuyNen2lE75nlfzO77XkizSz2JVaYLheT3lWVMxApSj4vMlghJYFyE
         MCPjLgnm9PeHF4fz1rXcXygn38lhuYFMo/tZUhvH0QYeIN+0qjDWeze6aJbuxmgoA4R8
         yXBg==
X-Gm-Message-State: AOJu0Yy0a32wvuD9Osy6N83WS5XY+tt2ZpFarwgPx0onyibfVqjiWVKY
        Bmt/yfv58nPfGURF2ye8yzPUlg==
X-Google-Smtp-Source: AGHT+IFVvYSS2Teb+3C+yTzocwyuLqySOLh37A4RBSXTHwdRSE57cXIgg0jBOZT62IFM/d6hCX7Abw==
X-Received: by 2002:adf:e8cc:0:b0:322:da1f:60d9 with SMTP id k12-20020adfe8cc000000b00322da1f60d9mr5392415wrn.47.1696521443734;
        Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
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
Subject: [PATCH 03/21] dt-bindings: clock: Add Google gs101 clock management unit bindings
Date:   Thu,  5 Oct 2023 16:56:00 +0100
Message-ID: <20231005155618.700312-4-peter.griffin@linaro.org>
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

Provide dt-schema documentation for Google gs101 SoC clock controller.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/clock/google,gs101-clock.yaml    | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
new file mode 100644
index 000000000000..a28d05d88afe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 SoC clock controller
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  Google GS101 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that clock tree
+  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
+  clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/gs101.h' header.
+
+properties:
+  compatible:
+    enum:
+      - google,gs101-cmu-top
+      - google,gs101-cmu-apm
+      - google,gs101-cmu-misc
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-misc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Misc bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_misc_bus
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_TOP
+  - |
+    #include <dt-bindings/interrupt-controller/gs101.h>
+    soc {
+    #address-cells = <2>;
+    #size-cells = <1>;
+
+    cmu_top: clock-controller@1e080000 {
+        compatible = "google,gs101-cmu-top";
+        reg = <0x0 0x1e080000 0x8000>;
+        #clock-cells = <1>;
+        clocks = <&ext_24_5m>;
+        clock-names = "oscclk";
+        };
+    };
+
+...
-- 
2.42.0.582.g8ccd20d70d-goog

