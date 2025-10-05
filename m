Return-Path: <linux-watchdog+bounces-4313-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3CBB987F
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 16:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B91644E3C99
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011033F6;
	Sun,  5 Oct 2025 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZrlMJhKR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C128BAB9
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Oct 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675495; cv=none; b=Duvimv2oX7YSUX+3xppfrgsHcaSOnJXc2YaVm2nfm7OnwJeOZkH4e8uih1u0cJLdjGEc1O5Ra9V1JL7tWCfE/QRRRL6H+NKbm6RNqil+jb6kv5Sh4AF2I9qJAk17/SZNCO+4jRrIIYA+0D042l4/mLRVPeCXQ0gObR7pZKKQdlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675495; c=relaxed/simple;
	bh=yhjdbjA8BKbYAloqzb6fGDISkdwl7sTzxrAB6MOHAH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVW0S96RDjHYJLnTDS0ty924sxqXIJKrI7bukvjMTzhZPlDxHW7jddrQ/kIwGk3YnQOESfR+Mv6tgYDk48Z1Aw6IDjxg9bdC5jgslp87Ge2QKUeLg21PjUHiPsOR1WC6OgmkXhW39iPbOrXbHdyFGRBxqc5+3ulO73hWpFvnPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZrlMJhKR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Gs+onLVZ/ahmhLP9c5pjFo3Jc9zVNSLBN5TdFn9zv98=; b=ZrlMJh
	KRTT8IBAUUNzarzVSXZWPhOxbRw3xYC23zNFD/B+IAvV8h/86Ae2GjfyMS/RTxf0
	LJ6M5y3vDKQKRTx+5VWv7CCJ2zGNT1wjn8kax+B1iJL1c/wHyLRo4EhOrv0r95DL
	YdP9ChPQr2oWJ80tzW/U5xvERyUqUFIPBFcJQ2CH0FutTp/KO6QRJkYnIc+H1ewe
	jz+8sBZIyWTnIkGsyj0Biijdj0skx027IBtVt+yat3BLmsl0FmxbqByblLe7tb9z
	2ee+VncsjqMyIdZ7A2s01SgJgZEG8tt/13+5LsQcHowg2HeJDw+oMU/KKwodii7P
	2j85vJjLocbGcC8A==
Received: (qmail 1418982 invoked from network); 5 Oct 2025 16:44:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 16:44:44 +0200
X-UD-Smtp-Session: l3s3148p1@THktYGpACNQujnsm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
Date: Sun,  5 Oct 2025 16:44:19 +0200
Message-ID: <20251005144416.3699-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* moved 'clock-names' and 'power-domains' to top-level 'required:'
  (Thanks, Prabhakar)
* removed unneeded label from example (Thanks, Prabhakar)
* added tags from Guenter and Prabhakar (Thanks!)

 .../watchdog/renesas,r9a09g057-wdt.yaml       | 110 ++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  97 +--------------
 2 files changed, 115 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
new file mode 100644
index 000000000000..1c1c464b95e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -0,0 +1,110 @@
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
+  - clock-names
+  - power-domains
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
+    watchdog@11c00400 {
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


