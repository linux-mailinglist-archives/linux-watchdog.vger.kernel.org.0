Return-Path: <linux-watchdog+bounces-4363-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EC846BC88FA
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 12:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72BB0350CC0
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 10:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6422DCF7C;
	Thu,  9 Oct 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DGkCUBuD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE042DC354
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006727; cv=none; b=k9eUeQGh2+2xu5Xroktbrmm6Ul8jnoD9EwRJaZTSahvGYE52UTOGLxc4yuLyUmWuDUiYAbceJNEUCogId6hCIXnbqEfd0eckmEyKVNs8agF3e53DXWuIOSC7yHu8pw0mcABJi6hf+UmQGCtjQP+74YPpF3bSSQ8i2GeHrfImH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006727; c=relaxed/simple;
	bh=czwPS0T4rvLPC9kf9iCn3nsUOYszwbQxjR0FG4267F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqqSEu5M/yxl/rze20djJS28c3F1gc0vciJd4CxVvOXx2ZrIl0ySUA1XIp87sktygb/W0oKq2T6TIxoeHI5gG39/haPhGltktiwthWuJ3ySCDDz50Udfqk2y/vsl2eBVzlRdZ5jFUu6jaJE51uBmze4ocXcGTjp0NP2i4uGwfpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DGkCUBuD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pNNtEu5cCMhBV2FDDGQrhcS2MLJ9OTGaPtW2c85jyek=; b=DGkCUB
	uD2bPLz1W3atsSN0Lx9PWql/GZP0A3hHHT4M3Te/fzqSTNBLhLTGwx3Y6bH8LjrG
	RHi4PfbtRWMnTkqMD85eHD98sgGny+DqZoTJvEeX10Iw09tVgivX9YTX4oc+vsUe
	jT2dL6V+6bzgvGt2RVEX5VK4CCQRHkdcs///rezVa/6mA39IjD/SscFh508V1xeh
	xs+9utdLz6N0NAesvFXUceqSqB2rYlucAZbIcXI9howYQUIR9t5g1Kb4HnqgLEtZ
	Ml5Yk8aax4fb5E6XgFUJ/1RI2oogP4mHwSHHNKto22coVCNoG6EY32JsKE1EPI9K
	IBoD3zcm7Y3/gqsg==
Received: (qmail 1043392 invoked from network); 9 Oct 2025 12:45:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 12:45:19 +0200
X-UD-Smtp-Session: l3s3148p1@wLdGf7dAfq0gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/5] dt-bindings: watchdog: factor out RZ/G2L watchdog
Date: Thu,  9 Oct 2025 12:45:01 +0200
Message-ID: <20251009104500.69787-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
* added tags from Geert and Rob (Thanks!)
* allow interrupt-names for one interrupt, too (Geert)

 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 111 ++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  45 +------
 2 files changed, 112 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
new file mode 100644
index 000000000000..a4d06c9c8b86
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
@@ -0,0 +1,111 @@
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
+        interrupt-names:
+          maxItems: 1
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


