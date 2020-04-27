Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738201BADEB
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Apr 2020 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgD0Ta3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Apr 2020 15:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD0Ta3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Apr 2020 15:30:29 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Apr 2020 12:30:29 PDT
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441BBC0610D5
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Apr 2020 12:30:29 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:d03f:8af3:4e83:6587])
        by xavier.telenet-ops.be with bizsmtp
        id XvRR2200B27aUyk01vRRhS; Mon, 27 Apr 2020 21:25:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9Nd-0007je-9K; Mon, 27 Apr 2020 21:25:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9Nd-0007OE-8E; Mon, 27 Apr 2020 21:25:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: Convert to json-schema
Date:   Mon, 27 Apr 2020 21:25:22 +0200
Message-Id: <20200427192522.28365-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the Renesas Watchdog Timer (WDT) Controller Device Tree binding
documentation to json-schema.

Add missing "renesas,r8a77980-wdt" compatible value.
Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/watchdog/renesas,wdt.txt         |  50 ---------
 .../bindings/watchdog/renesas,wdt.yaml        | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
deleted file mode 100644
index 79b3c62f183d26dc..0000000000000000
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Renesas Watchdog Timer (WDT) Controller
-
-Required properties:
- - compatible : Must be "renesas,<soctype>-wdt", followed by a generic
-		fallback compatible string when compatible with the generic
-		version.
-	       Examples with soctypes are:
-		 - "renesas,r8a7743-wdt" (RZ/G1M)
-		 - "renesas,r8a7744-wdt" (RZ/G1N)
-		 - "renesas,r8a7745-wdt" (RZ/G1E)
-		 - "renesas,r8a77470-wdt" (RZ/G1C)
-		 - "renesas,r8a774a1-wdt" (RZ/G2M)
-		 - "renesas,r8a774b1-wdt" (RZ/G2N)
-		 - "renesas,r8a774c0-wdt" (RZ/G2E)
-	         - "renesas,r8a7790-wdt" (R-Car H2)
-	         - "renesas,r8a7791-wdt" (R-Car M2-W)
-	         - "renesas,r8a7792-wdt" (R-Car V2H)
-	         - "renesas,r8a7793-wdt" (R-Car M2-N)
-	         - "renesas,r8a7794-wdt" (R-Car E2)
-	         - "renesas,r8a7795-wdt" (R-Car H3)
-	         - "renesas,r8a7796-wdt" (R-Car M3-W)
-	         - "renesas,r8a77961-wdt" (R-Car M3-W+)
-		 - "renesas,r8a77965-wdt" (R-Car M3-N)
-	         - "renesas,r8a77970-wdt" (R-Car V3M)
-	         - "renesas,r8a77990-wdt" (R-Car E3)
-	         - "renesas,r8a77995-wdt" (R-Car D3)
-	         - "renesas,r7s72100-wdt" (RZ/A1)
-	         - "renesas,r7s9210-wdt"  (RZ/A2)
-		The generic compatible string must be:
-		 - "renesas,rza-wdt" for RZ/A
-		 - "renesas,rcar-gen2-wdt" for R-Car Gen2 and RZ/G1
-		 - "renesas,rcar-gen3-wdt" for R-Car Gen3 and RZ/G2
-
-- reg : Should contain WDT registers location and length
-- clocks : the clock feeding the watchdog timer.
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-- power-domains : the power domain the WDT belongs to
-- interrupts: Some WDTs have an interrupt when used in interval timer mode
-
-Examples:
-
-	wdt0: watchdog@e6020000 {
-		compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
-		reg = <0 0xe6020000 0 0x0c>;
-		clocks = <&cpg CPG_MOD 402>;
-		power-domains = <&cpg>;
-		timeout-sec = <60>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
new file mode 100644
index 0000000000000000..27e8c4accd67bfff
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r7s72100-wdt     # RZ/A1
+              - renesas,r7s9210-wdt      # RZ/A2
+          - const: renesas,rza-wdt       # RZ/A
+
+      - items:
+          - enum:
+              - renesas,r8a7743-wdt      # RZ/G1M
+              - renesas,r8a7744-wdt      # RZ/G1N
+              - renesas,r8a7745-wdt      # RZ/G1E
+              - renesas,r8a77470-wdt     # RZ/G1C
+              - renesas,r8a7790-wdt      # R-Car H2
+              - renesas,r8a7791-wdt      # R-Car M2-W
+              - renesas,r8a7792-wdt      # R-Car V2H
+              - renesas,r8a7793-wdt      # R-Car M2-N
+              - renesas,r8a7794-wdt      # R-Car E2
+          - const: renesas,rcar-gen2-wdt # R-Car Gen2 and RZ/G1
+
+      - items:
+          - enum:
+              - renesas,r8a774a1-wdt     # RZ/G2M
+              - renesas,r8a774b1-wdt     # RZ/G2N
+              - renesas,r8a774c0-wdt     # RZ/G2E
+              - renesas,r8a7795-wdt      # R-Car H3
+              - renesas,r8a7796-wdt      # R-Car M3-W
+              - renesas,r8a77961-wdt     # R-Car M3-W+
+              - renesas,r8a77965-wdt     # R-Car M3-N
+              - renesas,r8a77970-wdt     # R-Car V3M
+              - renesas,r8a77980-wdt     # R-Car V3H
+              - renesas,r8a77990-wdt     # R-Car E3
+              - renesas,r8a77995-wdt     # R-Car D3
+          - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  timeout-sec: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - renesas,rza-wdt
+then:
+  required:
+    - power-domains
+    - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+    wdt0: watchdog@e6020000 {
+            compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
+            reg = <0xe6020000 0x0c>;
+            clocks = <&cpg CPG_MOD 402>;
+            power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+            resets = <&cpg 402>;
+            timeout-sec = <60>;
+    };
-- 
2.17.1

