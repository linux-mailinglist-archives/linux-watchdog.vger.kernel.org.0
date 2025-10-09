Return-Path: <linux-watchdog+bounces-4364-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BABC88FE
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 12:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 834FD350C07
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 10:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019BE2D8793;
	Thu,  9 Oct 2025 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MQagmDaL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D825782F
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006729; cv=none; b=f/cpQj0/YiGI9ulncgqUtEC2lQRmPlm8juP7o804MCJksOMVLh2SYxpa6SlH2vxAnjnQharbNpMcinP/vHKKczbL15QG2x7yvupuH6/lMr2gf3PmQtdhvAXRehM5ZMoqjBvVRwlZMNn3vrLOJgr8obaG+7A9ZR7wfc+5N2EVp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006729; c=relaxed/simple;
	bh=tKeKFrrVergwa4RJEEz2OQIamnYEeuO3YPWXtfylsrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOTAqWaXew5O/Np7YIl3iowlnK1dgdSly3odqaPXUN/TaP99IqZ+d8QEnz9rh9LTNCBLI9vsK1cVPBXb33vWYFGuPAV2QrnY84FbuyQ5heOMWKZQ5dNlsKPWnoRTZLcaMGyVpgkMlZhNjoyBmWHQShvOuICUfwUDu2uPimyKtgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MQagmDaL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3L39/x7zDKM+jgXQuhiGIybHEgEZW8YbDf5GWdGo6TA=; b=MQagmD
	aLbOq1CvnOD4tNBVGZ1tZZVLOY9nCT3xDu+YeUFocHotfbsLnXpyxuZkzMPcursC
	E8a2TfTwPBxZXRY+hTTBXI3hlCRZHuuY+fTFu7jDwZzpiu4/xujycuQ7e0XriKfX
	/hILSEiemk7V8RA7mMLAEkTeHPeRNvPSZiPjisQ/dAyPRH1acrkwBZFthhsmxUnC
	i3wH656KjH/Rk5uPYpJWL6ejEI46cKrw1cEypxJ4ng2OfLxjUMxewj9TRkjJ024z
	QEoDKSc3t+0sCdwwM0id90LaryG7o2VFJr67OZnisSsYEq+1SIOvKw7oidnLPy/n
	Lk8s0qNfUudBTA6Q==
Received: (qmail 1043411 invoked from network); 9 Oct 2025 12:45:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 12:45:20 +0200
X-UD-Smtp-Session: l3s3148p1@GPZYf7dAgK0gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
Date: Thu,  9 Oct 2025 12:45:02 +0200
Message-ID: <20251009104500.69787-11-wsa+renesas@sang-engineering.com>
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
RZ/V2H(P) watchdog to make handling easier.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
* added tags from Rob (Thanks!)
* merged the two if-conditions (Geert)

 .../watchdog/renesas,r9a09g057-wdt.yaml       | 99 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        | 97 +-----------------
 2 files changed, 104 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
new file mode 100644
index 000000000000..099200c4f136
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -0,0 +1,99 @@
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
+      - items:
+          - const: renesas,r9a09g087-wdt # RZ/N2H
+          - const: renesas,r9a09g077-wdt # RZ/T2H
+
+      - enum:
+          - renesas,r9a09g057-wdt    # RZ/V2H(P)
+          - renesas,r9a09g077-wdt    # RZ/T2H
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
+            const: renesas,r9a09g057-wdt
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        reg:
+          minItems: 2
+        resets: false
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


