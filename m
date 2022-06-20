Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295B45515CC
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 12:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbiFTK02 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 06:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240233AbiFTK0Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 06:26:24 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02F1A13F8A;
        Mon, 20 Jun 2022 03:26:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,306,1650898800"; 
   d="scan'208";a="125005503"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jun 2022 19:26:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.116])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7C98D4273C6A;
        Mon, 20 Jun 2022 19:26:17 +0900 (JST)
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
        Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011 (RZ/V2M) support
Date:   Mon, 20 Jun 2022 11:25:59 +0100
Message-Id: <20220620102600.52349-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620102600.52349-1-phil.edworthy@renesas.com>
References: <20220620102600.52349-1-phil.edworthy@renesas.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 - Add check for too many interrupts or clocks
v2:
 - Added minItems for interrupt-names and clock-names
---
 .../bindings/watchdog/renesas,wdt.yaml        | 73 +++++++++++++------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index a8d7dde5271b..0f5675d695d6 100644
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
@@ -70,13 +75,29 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts: true
-
-  interrupt-names: true
-
-  clocks: true
-
-  clock-names: true
+  interrupts:
+    minItems: 1
+    items:
+      - description: Timeout
+      - description: Parity error
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: wdt
+      - const: perrout
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Register access clock
+      - description: Main clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: pclk
+      - const: oscclk
 
   power-domains:
     maxItems: 1
@@ -89,6 +110,7 @@ properties:
 required:
   - compatible
   - reg
+  - interrupts
   - clocks
 
 allOf:
@@ -113,31 +135,38 @@ allOf:
           contains:
             enum:
               - renesas,rzg2l-wdt
+              - renesas,rzv2m-wdt
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
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rzg2l-wdt
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
         - interrupt-names
     else:
       properties:
         interrupts:
           maxItems: 1
-        clocks:
-          maxItems: 1
 
 additionalProperties: false
 
@@ -145,9 +174,11 @@ examples:
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

