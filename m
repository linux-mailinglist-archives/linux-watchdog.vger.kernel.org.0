Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F21F540082
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jun 2022 15:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244994AbiFGN5E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jun 2022 09:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244995AbiFGN4s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jun 2022 09:56:48 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD7E5B043A;
        Tue,  7 Jun 2022 06:56:45 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,283,1647270000"; 
   d="scan'208";a="122171377"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2022 22:56:44 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3E8D4487B1A;
        Tue,  7 Jun 2022 22:56:40 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
Date:   Tue,  7 Jun 2022 14:56:18 +0100
Message-Id: <20220607135619.174110-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607135619.174110-1-phil.edworthy@renesas.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the documentation for the r9a09g011 SoC, but in doing so also
reorganise the doc to make it easier to read.
Additionally, make the binding require an interrupt to be specified.
Whilst the driver does not need an interrupt, all of the SoCs that use
this binding actually provide one.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/watchdog/renesas,wdt.yaml        | 63 ++++++++++++-------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index a8d7dde5271b..6473734921e3 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -31,6 +31,11 @@ properties:
               - renesas,r9a07g054-wdt    # RZ/V2L
           - const: renesas,rzg2l-wdt
 
+      - items:
+          - enum:
+              - renesas,r9a09g011-wdt    # RZ/V2M
+          - const: renesas,rzv2m-wdt     # RZ/V2M
+
       - items:
           - enum:
               - renesas,r8a7742-wdt      # RZ/G1H
@@ -70,13 +75,27 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts: true
+  interrupts:
+    minItems: 1
+    items:
+      - description: Timeout
+      - description: Parity error
 
-  interrupt-names: true
+  interrupt-names:
+    items:
+      - const: wdt
+      - const: perrout
 
-  clocks: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Register access clock
+      - description: Main clock
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: pclk
+      - const: oscclk
 
   power-domains:
     maxItems: 1
@@ -89,6 +108,7 @@ properties:
 required:
   - compatible
   - reg
+  - interrupts
   - clocks
 
 allOf:
@@ -112,32 +132,31 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,rzv2m-wdt
               - renesas,rzg2l-wdt
     then:
       properties:
-        interrupts:
-          maxItems: 2
-        interrupt-names:
-          items:
-            - const: wdt
-            - const: perrout
         clocks:
-          items:
-            - description: Register access clock
-            - description: Main clock
+          minItems: 2
         clock-names:
-          items:
-            - const: pclk
-            - const: oscclk
+          minItems: 2
       required:
         - clock-names
-        - interrupt-names
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rzg2l-wdt
+    then:
       properties:
         interrupts:
-          maxItems: 1
-        clocks:
-          maxItems: 1
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
 
 additionalProperties: false
 
@@ -145,9 +164,11 @@ examples:
   - |
     #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
     #include <dt-bindings/power/r8a7795-sysc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     wdt0: watchdog@e6020000 {
             compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
             reg = <0xe6020000 0x0c>;
+            interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
             clocks = <&cpg CPG_MOD 402>;
             power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
             resets = <&cpg 402>;
-- 
2.34.1

