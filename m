Return-Path: <linux-watchdog+bounces-3988-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B12B209C3
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Aug 2025 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCCA3A6C18
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Aug 2025 13:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901942DAFCB;
	Mon, 11 Aug 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="ikcc/73y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC422DCF78
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Aug 2025 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917876; cv=none; b=dIrGr0WzJczWn8lwSy6QSaqKW+BMkoXmosrTaeonZZ6NmsQbANcys9LgLU7UHgiO+lcQmROGP7F4jzkyswPZjDWtu1cKkQEnEJ4kGBX50iIIlOXCb0e5zY5ulf18ERfiejLsCNlDXmMHou21pQOrTVhGtou110cDgK+DSPu084o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917876; c=relaxed/simple;
	bh=yE8OBW9bYAOuGyoQFj9KdGZ+ZdFLWH39KSV1Pq77KYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQUDqk8I/s3DTAXgGobuYFh4vZ+XWXIcPBedXdjNu8P9A/2mUCTu7Z2ZRnUNCR1wMrArpeka8L6NNPpFVCXRdDh4Gb/skhoNbsEfpDCQgsls+DBO5KTwzqOUXM+fpvV7z0toqgUw3Fs7x3GzlmjpStuZ2K+3QhI1QSBx3Ios7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=ikcc/73y; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 25722 invoked from network); 11 Aug 2025 15:11:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1754917866; bh=KnzIC1aJsKjtkakaOx7iUoe1ZE5aQxCNyxXlWh7IfTQ=;
          h=From:To:Cc:Subject;
          b=ikcc/73yIhh28pvl4yiMflQvjczOKxb0dD74SlshaCboXC1nFawVK2LXJ5l6tp6Kx
           4hXzu9+Aq5uMstIYZNF5dfyHpTEYtJAb/42hwAU/HLao3h5wXbk7Xw2c8FQbhy6UC0
           ReoXrvu4Rdo+k5uWZpd3LuoI3yeReJbpcG6rlqzY4J3h6akODi7U0nm7fKDTmysr2Q
           B3zNO7t69aEUYmedjH7zNMrSn+C0VYx1dMmVVuXUPkIpdURsNzne9siR/KcwKvHqpf
           LkS3jz/7BPtbMn/WqpxTEOlInvE4gK9zGiIzh1gAkuKGwJk/h9YujHv1CtsT+Rl8/9
           PKxQDZBqdCeiw==
Received: from 83.24.148.125.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.148.125])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <wim@linux-watchdog.org>; 11 Aug 2025 15:11:05 +0200
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
Subject: [PATCH] dt-bindings: watchdog: lantiq,wdt: convert bindings to dtschema
Date: Mon, 11 Aug 2025 15:10:54 +0200
Message-ID: <20250811131104.837210-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 80e68a2d6ad57dd231c1b90fa7d6dfd1
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [kZN0]                               

Convert the Lantiq WDT Watchdog bindings to yaml format.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../bindings/watchdog/lantiq,wdt.yaml         | 50 +++++++++++++++++++
 .../bindings/watchdog/lantiq-wdt.txt          | 24 ---------
 2 files changed, 50 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
new file mode 100644
index 000000000000..f1102fff2d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
@@ -0,0 +1,50 @@
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
+allOf:
+  - $ref: watchdog.yaml#
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
+              - lantiq,xrx300-wdt
+          - const: lantiq,xrx100-wdt
+
+  reg:
+    maxItems: 1
+
+  lantiq,rcu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the RCU syscon node (required for
+      "lantiq,falcon-wdt" and "lantiq,xrx100-wdt")
+
+required:
+  - compatible
+  - reg
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
2.47.2


