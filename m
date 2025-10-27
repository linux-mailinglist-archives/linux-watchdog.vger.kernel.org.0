Return-Path: <linux-watchdog+bounces-4417-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33CC117BE
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Oct 2025 22:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFF474E1696
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Oct 2025 21:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EE332861D;
	Mon, 27 Oct 2025 21:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="M83y6t9i"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1A3254A7
	for <linux-watchdog@vger.kernel.org>; Mon, 27 Oct 2025 21:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599412; cv=none; b=XL3I/QstAyr5UW5VHILf/1BOFIjOrDmCWZh2pRzxHnR0z+Jgs8D8JR3OUwCG5i1aHTw9+Zx3joAfznnaP64YU9+a/K3s63SbwphMrGYXzsyINvr73F3Bg1POIFHMXfWhN9Wb//XACNpsIHHSlaoeWNyYiPprmFcoYRnt+PQ/Pbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599412; c=relaxed/simple;
	bh=jNH/kzCDBKsYypiUeXn+yKSh+uztVIDGMbQ53q72RZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SdSo1SlE3yoKmwCwReEF6R0UOlP7mOAyR0prhQUS8j6Q7yMhzzY5Cvb7IMSjAxFCHAwjVvGPOBnhWH4Kk/4SxV4c496ElR+m0epwzsQvUW2QnaSluyKRdWmQSym5fM6FGfXkvwpM7skrh/YAFoomTVgejP1bQ5FqTXBX3SCTZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=M83y6t9i; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 37032 invoked from network); 27 Oct 2025 22:10:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1761599400; bh=SZiTSSmg83AheSBNoOMqCK3+aCGSjx8ounEcpfN8HdA=;
          h=From:To:Cc:Subject;
          b=M83y6t9iyNpGQbtKniPpMOIlwGptY6cVcZB6xjLn+ph3MQfk0S3JoJCx2y4bEjomj
           4UWkBiQtD7p43dCELecoPkCNsJcosmVGY1ummHgfOzRHWm2wzbr6Ow1rmLvypYGXh2
           +ModlgBHSeb8oNUO6LKAS8BmIV5brq7bjIRWvfuDItNJ09T53TZU32I7JX/d5+LaJx
           TbhWeg6kzFuLmHDTWQvZwhYt2SOORidDwL1NNZXdYFwVePrjZrsYSbuTpQXQqwPwF2
           Y+DCK1KUiZB07ltua3yiTBPFofcqGINDdrwH2xked5edb5iSa1VaqviFJCoqhHekOE
           HxIF36TLo8Ksg==
Received: from 83.24.132.245.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.132.245])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <wim@linux-watchdog.org>; 27 Oct 2025 22:10:00 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hauke@hauke-m.de,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3] dt-bindings: watchdog: lantiq,wdt: convert bindings to dtschema
Date: Mon, 27 Oct 2025 22:06:57 +0100
Message-ID: <20251027210959.58297-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 152fe6dd94dd1852bc56b6e692f430a0
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [8aNE]                               

Convert the Lantiq WDT Watchdog bindings to yaml format.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- removed xrx300 from strait binding conversion
- moved falcon-wdt to previous enum
- added ref to watchdog
v2:
- requirement of lantiq,rcu is now expressed as a schema
---
 .../bindings/watchdog/lantiq,wdt.yaml         | 57 +++++++++++++++++++
 .../bindings/watchdog/lantiq-wdt.txt          | 24 --------
 2 files changed, 57 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
new file mode 100644
index 000000000000..a7edae9ca05a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/lantiq,wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq WTD watchdog
+
+maintainers:
+  - Hauke Mehrtens <hauke@hauke-m.de>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - lantiq,falcon-wdt
+          - lantiq,wdt
+          - lantiq,xrx100-wdt
+      - items:
+          - enum:
+              - lantiq,xrx200-wdt
+          - const: lantiq,xrx100-wdt
+
+  reg:
+    maxItems: 1
+
+  lantiq,rcu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the RCU syscon node
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - lantiq,xrx100-wdt
+              - lantiq,falcon-wdt
+    then:
+      required:
+        - lantiq,rcu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@803f0 {
+        compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";
+        reg = <0x803f0 0x10>;
+
+        lantiq,rcu = <&rcu0>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
deleted file mode 100644
index 18d4d8302702..000000000000
--- a/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Lantiq WTD watchdog binding
-============================
-
-This describes the binding of the Lantiq watchdog driver.
-
--------------------------------------------------------------------------------
-Required properties:
-- compatible		: Should be one of
-				"lantiq,wdt"
-				"lantiq,xrx100-wdt"
-				"lantiq,xrx200-wdt", "lantiq,xrx100-wdt"
-				"lantiq,falcon-wdt"
-- reg			: Address of the watchdog block
-- lantiq,rcu		: A phandle to the RCU syscon (required for
-			  "lantiq,falcon-wdt" and "lantiq,xrx100-wdt")
-
--------------------------------------------------------------------------------
-Example for the watchdog on the xRX200 SoCs:
-		watchdog@803f0 {
-			compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";
-			reg = <0x803f0 0x10>;
-
-			lantiq,rcu = <&rcu0>;
-		};
-- 
2.47.3


