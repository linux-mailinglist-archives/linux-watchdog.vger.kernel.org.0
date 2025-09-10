Return-Path: <linux-watchdog+bounces-4216-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EADB52362
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 23:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38125164917
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Sep 2025 21:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8667530F7E9;
	Wed, 10 Sep 2025 21:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LgEX+2rZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA530F7F2
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Sep 2025 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757539175; cv=none; b=rItrVZY2w0Tals4fVM+o2UFhOJFtVQdA1fVfAErma9z5KclyqEIxcgj+Lo4MMvwHJ3NLAAkntaZI/J0yulta2rAMUGogAbtfSGdug5eWQUV/i8f+DAPxz93IoDlHO0ZXMnSmonlHzyxNKB1t9dKIv5gBEpq6DPzKtOipkwrgzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757539175; c=relaxed/simple;
	bh=ievPIUbEBHGTMNrTQgN5r1NbbQp/YzCcsVvk89v/Dpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snJulGwSKgFE05paHhGF3ShQLug8UOy6H3GPuMc1UQ+gS4iCMS6Bo8rSzNuRhaccotn3/RnBGXpKU78YN1XATkz6QItWzNyvJhF8gkWl/GMNnIa47XW9IDNv021JyxZ4D05XZlGXWrCHuO8vNtpmr1Jn7qY43k4rPYvUAJIC9xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LgEX+2rZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=VMVAEWbpoBa7q4
	s9vXhrFSHIa7ODzgzTMPc0MMsjIDU=; b=LgEX+2rZmulH5hSbSxUko0z6hafofC
	n9OSLR+RcY7e48yA3YEEnWDbkKCq+g8XbwVr5qifbirpel7UOSrDRidWshtxXEgQ
	6RIcZwRW2SWORcNlwJEkTb0b+z+tUuEaIY3gO7dbmmpfZEPZzRS/GXzGkVQDrCs/
	rjhdhEPBi0oNfckOTBonk0Zkb73IIt8QYFsDPTzK2PBkEXXkxtMqp3gqfLXJYrT3
	LdjAcClozCZcvGPKGxvLtOAbuPfmbcs0t2lsv0VKOdFtZbuseMkuOJ5cn4H2j7VT
	Wa41iq+Ka+tK4iCXMfbHfvQrbnQvi/VrWIWAY6Efm/Tl5hQtNcUWryxQ==
Received: (qmail 744484 invoked from network); 10 Sep 2025 23:19:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 23:19:28 +0200
X-UD-Smtp-Session: l3s3148p1@ME/F+Xg+FsYujnuV
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] dt-bindings: watchdog: Add Renesas WWDT
Date: Wed, 10 Sep 2025 23:06:46 +0200
Message-ID: <20250910210646.2443-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Windowed Watchdog timer found on Renesas R-Car SoCs from
late Gen3 onwards.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I send out these bindings as RFC without the driver, so we can discuss
the peculiar items while I finetune the driver:

a) the two clocks have various names in the Gen3/4/5 datasheets. I opted
   to use the Gen5 naming "bus" + "cnt" because they are easiest to
   understand

b) the device has two resets, one for each circuit driven by the two
   clocks above. Thus, I decided to name the resets the same as the
   clocks.

The bindings pass dt_binding_check. But I am still not very used to
write bindings.

 .../bindings/watchdog/renesas,wwdt.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
new file mode 100644
index 000000000000..496ba4297c84
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,wwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Windowed Watchdog Timer (WWDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a779g0-wwdt  # V4H
+      - const: renesas,rcar-gen4-wwdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Pretimeout, 75% of overflow reached
+      - description: Error occurred
+
+  interrupt-names:
+    items:
+      - const: pretimeout
+      - const: error
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Counting clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: cnt
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset circuitry driven by bus clock
+      - description: Reset circuitry driven by counting clock
+
+  reset-names:
+    items:
+      - const: bus
+      - const: cnt
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    wwdt0: watchdog@ffc90000 {
+            compatible = "renesas,r8a779g0-wwdt",
+                         "renesas,rcar-gen4-wwdt";
+            reg = <0xffc90000 0x10>;
+            interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pretimeout", "error";
+            clocks = <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>,
+                     <&cpg CPG_CORE R8A779G0_CLK_R>;
+            clock-names = "bus", "cnt";
+            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+            resets = <&cpg 1318>, <&cpg 1200>;
+            reset-names = "bus", "cnt";
+    };
-- 
2.47.2


