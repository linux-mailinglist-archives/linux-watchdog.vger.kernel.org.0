Return-Path: <linux-watchdog+bounces-4392-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFCBDBABA
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Oct 2025 00:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0BF0E4EE6AC
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 22:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAFD2E7186;
	Tue, 14 Oct 2025 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS1DcPtW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B72405FD;
	Tue, 14 Oct 2025 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760481798; cv=none; b=QsWcROdgfSV5BBPJW29tbIwJQrdll6jGVd+oWkTfQ05qc/gXjphPAti3RuF69JxGYVbFDwJalZ1PW+Cr/TLY5ZLpluGQb6TlYa/hFsEQ1uHdVLnfZqS5YrHcdsSYUua8FGr3+lnlqoY0uOXFFhHhO+GmbueXfeawhJVKU7vcid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760481798; c=relaxed/simple;
	bh=MLrJat3xYrtBUlgpr4HqaIIP/bFxWTF5YaEXdnEHebQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R72Ysvn5syYBa8yCBXfUAuG2kYU3sTE37A2nR9Jx3bs1dHAukEn/yP++dvOqVUizp+w1XuJwv2EEEGER7a2OLjhhkYOqmwHk2/T2QTnUwm16SXYVPqv1LL0b0woEZK3jG47HR+o8Q0SLrYNHd972V9t4GSmDb/w7SIFJqp+6JOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS1DcPtW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554DAC4CEE7;
	Tue, 14 Oct 2025 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760481797;
	bh=MLrJat3xYrtBUlgpr4HqaIIP/bFxWTF5YaEXdnEHebQ=;
	h=From:To:Cc:Subject:Date:From;
	b=pS1DcPtWiaKQJMW1RscipQUHJH2tnusFQAFw/epGKlmGoVgwpo9YCoFRyMoiRgDfo
	 IifKSzdS8QmFbY7VTA46SzyHLrV/J7UHM0ow0f91b6vV2K3fRUCwYZWx/Bsc75txAs
	 iz7Xbq0iPbwyBJnpQqf5T4Iy1pK8BmYLlL8rFhtTQTss9dF/4EKmD86fdZ/bNZbeoF
	 dZmqouyUICYYJujqpWfYJbHoGvfp6kSWNoG4uzI6TF2Vul9onYhjjBzTC/XawZq3Tx
	 X8RxuYQtB/fTiqR8GF/AMGDerMd0mgQtNPI48G+qI1LrKZdDMdCTZ0xzXiWA760naC
	 Us8y0jP/IDOdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: watchdog: Convert marvell,orion-wdt to DT schema
Date: Tue, 14 Oct 2025 17:41:26 -0500
Message-ID: <20251014224127.1212608-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Marvell Orion and Armada watchdog binding to DT schema
format. It's a straight-forward conversion.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix order of clock descriptions
 - Add 2nd interrupt found on some Armada platforms
 - Add reference to watchdog.yaml and drop timeout-sec

 .../devicetree/bindings/watchdog/marvel.txt   |  45 --------
 .../bindings/watchdog/marvell,orion-wdt.yaml  | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/marvel.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt b/Documentation/devicetree/bindings/watchdog/marvel.txt
deleted file mode 100644
index c1b67a78f00c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/marvel.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Marvell Orion Watchdog Time
-
-Required Properties:
-
-- Compatibility : "marvell,orion-wdt"
-		  "marvell,armada-370-wdt"
-		  "marvell,armada-xp-wdt"
-		  "marvell,armada-375-wdt"
-		  "marvell,armada-380-wdt"
-
-- reg		: Should contain two entries: first one with the
-		  timer control address, second one with the
-		  rstout enable address.
-
-For "marvell,armada-375-wdt" and "marvell,armada-380-wdt":
-
-- reg		: A third entry is mandatory and should contain the
-                  shared mask/unmask RSTOUT address.
-
-Clocks required for compatibles = "marvell,orion-wdt",
-				  "marvell,armada-370-wdt":
-- clocks : Must contain a single entry describing the clock input
-
-Clocks required for compatibles = "marvell,armada-xp-wdt"
-				  "marvell,armada-375-wdt"
-				  "marvell,armada-380-wdt":
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : Must include the following entries:
-  "nbclk" (L2/coherency fabric clock),
-  "fixed" (Reference 25 MHz fixed-clock).
-
-Optional properties:
-
-- interrupts	: Contains the IRQ for watchdog expiration
-- timeout-sec	: Contains the watchdog timeout in seconds
-
-Example:
-
-	wdt@20300 {
-		compatible = "marvell,orion-wdt";
-		reg = <0x20300 0x28>, <0x20108 0x4>;
-		interrupts = <3>;
-		timeout-sec = <10>;
-		clocks = <&gate_clk 7>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml
new file mode 100644
index 000000000000..fdc7bc45dfde
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/marvell,orion-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Orion Watchdog Timer
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,orion-wdt
+      - marvell,armada-370-wdt
+      - marvell,armada-xp-wdt
+      - marvell,armada-375-wdt
+      - marvell,armada-380-wdt
+
+  reg:
+    minItems: 2
+    items:
+      - description: Timer control register address
+      - description: RSTOUT enable register address
+      - description: Shared mask/unmask RSTOUT register address
+
+  clocks:
+    minItems: 1
+    items:
+      - description: L2/coherency fabric clock input
+      - description: Reference 25 MHz fixed-clock supply
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: nbclk
+      - const: fixed
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: timeout
+      - description: pre-timeout
+
+allOf:
+  - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,armada-375-wdt
+              - marvell,armada-380-wdt
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,armada-xp-wdt
+              - marvell,armada-375-wdt
+              - marvell,armada-380-wdt
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+        interrupts:
+          minItems: 2
+
+      required:
+        - clock-names
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@20300 {
+        compatible = "marvell,orion-wdt";
+        reg = <0x20300 0x28>, <0x20108 0x4>;
+        interrupts = <3>;
+        timeout-sec = <10>;
+        clocks = <&gate_clk 7>;
+    };
-- 
2.51.0


