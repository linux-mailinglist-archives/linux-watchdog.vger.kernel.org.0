Return-Path: <linux-watchdog+bounces-4347-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A744BC1E84
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 17:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4310C3BBDA3
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454352E54BE;
	Tue,  7 Oct 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DVpGC3fO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99F2E36FB
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Oct 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850437; cv=none; b=pv3wVoeooFNr+j7AFn9StTunLrlU8ejIoyNM58/zabIlD9QakiuM0MvvpB4pNCNQ0f+Gg3orkgD268TWKn1+3nA4Q7ysQmwoW2mxzLUG3XU2lVBpPLFxfC0bJROYwGE5kgf9PaT12niSHuf6xWRY/hUpaC1+ejm9ZqL004elnm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850437; c=relaxed/simple;
	bh=/nNNp92X9khsJwQQkgcCGs12nQSvroQxjwuA+q1NXBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2CeAkB0gpPF0QLNKVV1VcQKaXzqJXlS8twWm0zd5NWdvhjgk5ej+x0P2DreppZGa4hhcR81TyZCSRegJiCYQWW7PWKZeK6rngc4ijTrq3awM+VYTKhqwIFnDSCaMAmS987NareV7rZ4PI1hT4DzmppEB8ScH/UqQmdHWlZip8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DVpGC3fO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=obJb7JBvD3H03q8kvST/RNR8+psjZ6WbsrM1w2QkDWM=; b=DVpGC3
	fOpeFSaLg3QubLOqoLuJGGpMvYwQiKhhw9ow3mYnbYMTRPcmPWGuj0nZZj8Gy707
	ifUMrtqUa0//XmDyaILwuTszYDqBhMCHirMPvjist8/kMOohWz2ZK1ZaUBc059Vq
	172s5+wIRQEPb+3LtsvJE09OApz5K8wajO4LWYiWMR23EX0fxc2BAHlCW3K+kSqd
	ymmk9VejDS0tvdCAZokptJNxIDCZatkiTIiNy2TFnBIk+ZaVRNQYucjeH57BCCS/
	PX5KQy1B2CApNX+nlDlGXcEnoL7QMig0ixmoi+5KDJLBNzufXX/TvKNqaeWNYaqz
	ow/UDjtKFZFBOZrw==
Received: (qmail 313243 invoked from network); 7 Oct 2025 17:20:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 17:20:29 +0200
X-UD-Smtp-Session: l3s3148p1@pX+qG5NAaJ0ujntU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/5] dt-bindings: watchdog: factor out RZ/G2L watchdog
Date: Tue,  7 Oct 2025 17:20:08 +0200
Message-ID: <20251007152007.14508-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas created different watchdog IPs but they are all handled in the
same binding documentation. This leads to a lot of conditional handling
which makes it unnecessarily hard to add new items. Factor out the
RZ/G2L watchdog to make handling easier.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* simplified some 'enum' to 'const'
* added tag from Biju (Thanks!)

 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 110 ++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
 2 files changed, 111 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
new file mode 100644
index 000000000000..837e4cb33dd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rzg2l-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
+              - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
+          - const: renesas,rzg2l-wdt
+
+      - items:
+          - const: renesas,r9a09g011-wdt # RZ/V2M
+          - const: renesas,rzv2m-wdt     # RZ/V2M
+
+  reg:
+    maxItems: 1
+
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
+    items:
+      - description: Register access clock
+      - description: Main clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: oscclk
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
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-wdt
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@12800800 {
+            compatible = "renesas,r9a07g044-wdt",
+                         "renesas,rzg2l-wdt";
+            reg = <0x12800800 0x400>;
+            clocks = <&cpg CPG_MOD R9A07G044_WDT0_PCLK>,
+                     <&cpg CPG_MOD R9A07G044_WDT0_CLK>;
+            clock-names = "pclk", "oscclk";
+            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "wdt", "perrout";
+            resets = <&cpg R9A07G044_WDT0_PRESETN>;
+            power-domains = <&cpg>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 12ba07781763..2a15c012fd67 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -13,19 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
-              - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
-              - renesas,r9a07g054-wdt    # RZ/V2L
-              - renesas,r9a08g045-wdt    # RZ/G3S
-          - const: renesas,rzg2l-wdt
-
-      - items:
-          - enum:
-              - renesas,r9a09g011-wdt    # RZ/V2M
-          - const: renesas,rzv2m-wdt     # RZ/V2M
-
       - items:
           - enum:
               - renesas,r8a7742-wdt      # RZ/G1H
@@ -83,16 +70,7 @@ properties:
     maxItems: 2
 
   interrupts:
-    minItems: 1
-    items:
-      - description: Timeout
-      - description: Parity error
-
-  interrupt-names:
-    minItems: 1
-    items:
-      - const: wdt
-      - const: perrout
+    maxItems: 1
 
   clocks:
     minItems: 1
@@ -140,8 +118,6 @@ allOf:
           contains:
             enum:
               - renesas,r9a09g057-wdt
-              - renesas,rzg2l-wdt
-              - renesas,rzv2m-wdt
     then:
       properties:
         clocks:
@@ -155,25 +131,6 @@ allOf:
         clocks:
           maxItems: 1
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - renesas,rzg2l-wdt
-    then:
-      properties:
-        interrupts:
-          minItems: 2
-        interrupt-names:
-          minItems: 2
-      required:
-        - interrupt-names
-    else:
-      properties:
-        interrupts:
-          maxItems: 1
-
   - if:
       properties:
         compatible:
-- 
2.47.2


