Return-Path: <linux-watchdog+bounces-4284-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D34BA37B4
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 13:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BA9F4E13E3
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF58E2DC77A;
	Fri, 26 Sep 2025 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VJSFZnnR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF202D7DCE
	for <linux-watchdog@vger.kernel.org>; Fri, 26 Sep 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885755; cv=none; b=l9l7sV29kpCd/qTKSrfTTJok11NVPDWeFWxJkhzY3qyt51bbwEkbhYO9pow5tJxjpNrQDZ7apO3pCocNY1Ab0lTGlkxE7tG8XyTm+B4p+yP0EZWHg51jFsdieEh/ZTBXDdoWhrT4d27d2pEOFgtW/uScNr9GYxjmLtTsYbJQ5Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885755; c=relaxed/simple;
	bh=HmUzYBHZFnJQ90UxwI6g0hrOh7E9nnfA1Wbk/zdC+So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNOCs/lIiBbkzoLI5XUZH7zq4/ns/VHNkLR5LrxW9lHsYnfTU4db3LP0c+MdMijkglWHLHGTeD7MRa7P5YPjzKmtMSf5os6e/WPNU/1OZACBdeh2+CqC9tKquQP+27ewPBD81FAZUSjrRgDhqlxUPm85/t3TocinxxuAgpPLYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VJSFZnnR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rF/2Jvu5TaLq9vARdLBacQgLXx71abzACA07MNbKMcI=; b=VJSFZn
	nRnf/LdJkxxJHy/XIde/N1wOxhjDmCMf/ba/X7nJIM4HYZXDU99y8tUJfo8lzVN+
	CzHs4i+Vrev4ZIjCOoqPnu3trfNBbCZ1EyTrZyKXLEYTSjBhemiBOFmF023CGw6W
	rNCR1cOGPJkMVtkVOjuDmib3DcP++ycxxnywF7U8E6LBR5aQrNKztm6nBmEEkDjB
	wI6gNl5TU+hecp73wmZjVGMQMx4d0dJvECQQIAQRtCsYBZq8JdhScZYIroukhBe4
	8wttgbLdTo67RZ+t5CSvNoh1pl0uGXyrTynlQeETmS3IFQW5SL2ld4gwEAUx/aWJ
	ZQpvU7yXjD40+VWw==
Received: (qmail 2235363 invoked from network); 26 Sep 2025 13:22:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 13:22:24 +0200
X-UD-Smtp-Session: l3s3148p1@CgH9f7I/qosgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
Date: Fri, 26 Sep 2025 13:22:16 +0200
Message-ID: <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
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
RZ/V2H(P) watchdog to make handling easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 113 ++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
 2 files changed, 118 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
new file mode 100644
index 000000000000..2450ac856783
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g047-wdt # RZ/G3E
+              - renesas,r9a09g056-wdt # RZ/V2N
+          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
+
+      - enum:
+          - renesas,r9a09g057-wdt    # RZ/V2H(P)
+          - renesas,r9a09g077-wdt    # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g087-wdt # RZ/N2H
+          - const: renesas,r9a09g077-wdt # RZ/T2H
+
+  reg:
+    minItems: 1
+    maxItems: 2
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
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g057-wdt
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-wdt
+    then:
+      properties:
+        resets: false
+        clock-names:
+          maxItems: 1
+        reg:
+          minItems: 2
+      required:
+        - clock-names
+        - power-domains
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+
+    wdt0: watchdog@11c00400 {
+            compatible = "renesas,r9a09g057-wdt";
+            reg = <0x11c00400 0x400>;
+            clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
+            clock-names = "pclk", "oscclk";
+            resets = <&cpg 0x75>;
+            power-domains = <&cpg>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 2a15c012fd67..08ba128bf442 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -51,38 +51,14 @@ properties:
               - renesas,r8a779h0-wdt     # R-Car V4M
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
-      - items:
-          - enum:
-              - renesas,r9a09g047-wdt # RZ/G3E
-              - renesas,r9a09g056-wdt # RZ/V2N
-          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
-
-      - enum:
-          - renesas,r9a09g057-wdt    # RZ/V2H(P)
-          - renesas,r9a09g077-wdt    # RZ/T2H
-
-      - items:
-          - const: renesas,r9a09g087-wdt # RZ/N2H
-          - const: renesas,r9a09g077-wdt # RZ/T2H
-
   reg:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interrupts:
     maxItems: 1
 
   clocks:
-    minItems: 1
-    items:
-      - description: Register access clock
-      - description: Main clock
-
-  clock-names:
-    minItems: 1
-    items:
-      - const: pclk
-      - const: oscclk
+    maxItems: 1
 
   power-domains:
     maxItems: 1
@@ -96,76 +72,13 @@ required:
   - compatible
   - reg
   - clocks
+  - interrupts
+  - power-domains
+  - resets
 
 allOf:
   - $ref: watchdog.yaml#
 
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - renesas,r9a09g077-wdt
-    then:
-      required:
-        - power-domains
-        - resets
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - renesas,r9a09g057-wdt
-    then:
-      properties:
-        clocks:
-          minItems: 2
-        clock-names:
-          minItems: 2
-      required:
-        - clock-names
-    else:
-      properties:
-        clocks:
-          maxItems: 1
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - renesas,r9a09g057-wdt
-              - renesas,r9a09g077-wdt
-    then:
-      properties:
-        interrupts: false
-        interrupt-names: false
-    else:
-      required:
-        - interrupts
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: renesas,r9a09g077-wdt
-    then:
-      properties:
-        resets: false
-        clock-names:
-          maxItems: 1
-        reg:
-          minItems: 2
-      required:
-        - clock-names
-        - power-domains
-    else:
-      properties:
-        reg:
-          maxItems: 1
-
 additionalProperties: false
 
 examples:
-- 
2.47.2


