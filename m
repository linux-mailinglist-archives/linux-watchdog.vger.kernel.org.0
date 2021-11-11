Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A9D44D62E
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 12:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhKKL5d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 06:57:33 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:7763 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233245AbhKKL53 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 06:57:29 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="99921035"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 20:54:39 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 98E3F4009419;
        Thu, 11 Nov 2021 20:54:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: watchdog: renesas,wdt: Add support for RZ/G2L
Date:   Thu, 11 Nov 2021 11:54:26 +0000
Message-Id: <20211111115427.8228-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Describe the WDT hardware in the RZ/G2L series.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V1->V2:
 * No Change
RFC->V1:
 * Added clock-names and interrupt-names as required properties for RZ/G2L
 * Re-order clocknames with internal module clock first
---
 .../bindings/watchdog/renesas,wdt.yaml        | 75 ++++++++++++++-----
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index ab66d3f0c476..91a98ccd4226 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
-allOf:
-  - $ref: "watchdog.yaml#"
-
 properties:
   compatible:
     oneOf:
@@ -22,6 +19,11 @@ properties:
               - renesas,r7s9210-wdt      # RZ/A2
           - const: renesas,rza-wdt       # RZ/A
 
+      - items:
+          - enum:
+              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
+          - const: renesas,rzg2l-wdt     # RZ/G2L
+
       - items:
           - enum:
               - renesas,r8a7742-wdt      # RZ/G1H
@@ -56,11 +58,13 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
+  interrupts: true
 
-  clocks:
-    maxItems: 1
+  interrupt-names: true
+
+  clocks: true
+
+  clock-names: true
 
   power-domains:
     maxItems: 1
@@ -75,17 +79,52 @@ required:
   - reg
   - clocks
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - renesas,rza-wdt
-then:
-  required:
-    - power-domains
-    - resets
+allOf:
+  - $ref: "watchdog.yaml#"
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,rza-wdt
+    then:
+      required:
+        - power-domains
+        - resets
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
+          maxItems: 2
+        interrupt-names:
+          items:
+            - const: wdt
+            - const: perrout
+        clocks:
+          items:
+            - description: Register access clock
+            - description: Main clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: oscclk
+      required:
+        - clock-names
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        clocks:
+          maxItems: 1
 
 additionalProperties: false
 
-- 
2.17.1

