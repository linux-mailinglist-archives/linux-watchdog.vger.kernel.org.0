Return-Path: <linux-watchdog+bounces-4401-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5918BBECCA4
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Oct 2025 11:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B9E83AFF46
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Oct 2025 09:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FDF2571C2;
	Sat, 18 Oct 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="v50TmCcY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23F354AC9
	for <linux-watchdog@vger.kernel.org>; Sat, 18 Oct 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779964; cv=none; b=Y1Oak+kf0dsQ56R4nVQchtf0u/QonJ67/QLJ66LEpImlYpnajR9O+CwXEyCw78lbG00csz0UoJnEKYeJQ7ZU1eTIbvRfgr+3rZxAMaWsz71nmPDArJE+K8WT35f9q7VRaG50lRP1c0EJEmuZzWu2lM16hrXIC/5k6stleFbW7js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779964; c=relaxed/simple;
	bh=6zqFy0yOQYaM3ba/ZqW5nko4lKjakH5c4aABB4ez9d4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rd0XHyWvodRaDUEmxBFqf0f4UX43mgkzYg7iPuho8Oi9LiZkU3Wg9tpVOgP8Z+hv/0scxx60hKe6oa+lIp1t8Q6hgTnrsPK4Izvd56zf0dbKPQ5rVKFEAgwRmfDZBgI6CyrpMkwGtaZ5jUenKU7xONTMlCpbNYCQguXEN+HFL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=v50TmCcY; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 9121 invoked from network); 18 Oct 2025 11:32:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1760779955; bh=DFC7NfFRKKc2OZCx5rozLzXsNMg4boTyF7qGSrJ9Fms=;
          h=From:To:Cc:Subject;
          b=v50TmCcYLsOW9mE6E34NPv6YN3UjprgvEIAcntA1TI0KTJN85N0WdtT9eURJfyQiK
           b2KNDpxgTzJKQfd5/gKGu66rK/1tNpqIQB+muplW9XILOQBY/rMSMpGJ3OTENk5/yj
           ApdBgGt7/6qv8Mx7t9Zewonc/lvnNPMAKT4aPsPvuHZOeEVoAzSfMwAcepVmylKTdN
           S9LEudO6CQ9SoNQSZM32+sTh//N2+JZyyBGrTrWhMvzJr/eq4XHkRPI9Oc1VZarszZ
           ALXVr+Mpmh6MCMULuMgUsAO8WeqVaPGeVI2W5FGGQS55IPKXxOjrRdobMD/gs6mw2W
           GXoHt65w7I44g==
Received: from 83.24.149.147.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.149.147])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <wim@linux-watchdog.org>; 18 Oct 2025 11:32:35 +0200
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
Subject: [PATCH v2] dt-bindings: watchdog: lantiq,wdt: convert bindings to dtschema
Date: Sat, 18 Oct 2025 11:29:06 +0200
Message-ID: <20251018093229.291419-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 738e6f299d59bcc5da0efebb1916b069
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [8eME]                               

Convert the Lantiq WDT Watchdog bindings to yaml format.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- requirement of lantiq,rcu is now expressed as a schema 
---
 .../bindings/watchdog/lantiq,wdt.yaml         | 63 +++++++++++++++++++
 .../bindings/watchdog/lantiq-wdt.txt          | 24 -------
 2 files changed, 63 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
new file mode 100644
index 000000000000..204e16be2a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
@@ -0,0 +1,63 @@
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
+              - lantiq,xrx300-wdt
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: lantiq,xrx100-wdt
+    then:
+      required:
+        - lantiq,rcu
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: lantiq,falcon-wdt
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


