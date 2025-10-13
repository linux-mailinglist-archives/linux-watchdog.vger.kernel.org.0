Return-Path: <linux-watchdog+bounces-4379-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FFEBD65EB
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Oct 2025 23:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 838E24F30BC
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Oct 2025 21:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230D12F25E8;
	Mon, 13 Oct 2025 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loPoMt1T"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9352ECD05;
	Mon, 13 Oct 2025 21:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391112; cv=none; b=qNOotWo1F4Hg9GM2cFj3o7G/IOhgyR7lACYaGOT6z/ZcideXdRCO3Pr7z562AYILbfpgGZm3k9/jlmi81Nd+/LpKhu7d3zne/zOTbbDxtktA1vCEcfLAyLTUcVmzjIVOrtPjINQpaLcpjPBv7ui2WXs3sBIV2OJlSXApCd1Bvs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391112; c=relaxed/simple;
	bh=o7Lpk0zL9IRIGoDOLSKoyozj76/fRmLzH3c5Hbv4gjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0NBRqEkxmKEqNbuEvldpQj/6NlxCFjgOkDrMbe/YvY18XWIedB/7NKFj3z6lPmwft2ScNLhL/JP03ghyMmOuGFDP+F4cz15rdZ+5zaiAz4epU82rA3OgIbjMfKp0kdWxXWSZ27NGIlWglC+Gob6xqZpNv3Fdl2T0/h8RAj+P64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loPoMt1T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E63C4CEE7;
	Mon, 13 Oct 2025 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760391111;
	bh=o7Lpk0zL9IRIGoDOLSKoyozj76/fRmLzH3c5Hbv4gjw=;
	h=From:To:Cc:Subject:Date:From;
	b=loPoMt1TTP9YJys7LaFtT7B1THPnD/S4lE51grZNAJE06MLRZfGDRjDs+gsuzL1bq
	 Ppz61V9Yj0O8d1XqDUzaFmrTX7noo6IayyV7szEQH67m7g7rnV4XklkYRTs6IIL+9u
	 X1iBtl0lniznFAM7GF6ys/4AMPbK/8QLoOyR120tDWuLNQTPVoBMa2KIMbA8WO34bH
	 N40Y4HPO7k6sxbWHeGjsDxfGZvv9o5vsyEPP3qdMWS9vNWOjTbNX9CJL0zwhkPP43t
	 H01C26c2pY7CBZkb1VWW1Ys92QNswL/I3lXhW27l5ojm195JVZRArqSlBHD5flMPPE
	 rIjncmD+NmG9g==
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
Subject: [PATCH] dt-bindings: watchdog: Convert marvell,orion-wdt to DT schema
Date: Mon, 13 Oct 2025 16:31:45 -0500
Message-ID: <20251013213146.695195-1-robh@kernel.org>
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/marvel.txt   | 45 ---------
 .../bindings/watchdog/marvell,orion-wdt.yaml  | 97 +++++++++++++++++++
 2 files changed, 97 insertions(+), 45 deletions(-)
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
index 000000000000..95704079463f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml
@@ -0,0 +1,97 @@
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
+      - description: Timer control register address.
+      - description: RSTOUT enable register address.
+      - description: Shared mask/unmask RSTOUT register address.
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Reference 25 MHz fixed-clock supply.
+      - description: L2/coherency fabric clock input ("nbclk").
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: nbclk
+      - const: fixed
+
+  interrupts:
+    maxItems: 1
+
+  timeout-sec:
+    description: Watchdog timeout in seconds.
+
+allOf:
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
+
+      required:
+        - clock-names
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
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


