Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520A5392B4D
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 12:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235966AbhE0KDV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 06:03:21 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:14430 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236031AbhE0KDU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 06:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622109708; x=1653645708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yz80Hjo1XW+O2NjLkpyn0DsjcDlcfjnTODrJ9v4dQc4=;
  b=maiLJiUXpryT8l/osw1Zd9ZTUMh0YjstHLHEOr4T9GfMZdLxX6Am5sub
   axXoLzh/+vDyw9uZPt6OMR9s2GY2D2eLDplkgHk7geZRFLowpbtfJaayT
   o/kMaDP3vasPtH5iYrdpEhvRsdocoMa8BP310Y0mGfxRUM+HehgUikNCp
   MAnrJBsE8Qdn6tAFKkpCVfIJvsdoTz2IpHGwv7YtQ6G7SOL7okr4m7xxb
   Z/9dxdJztbX3hkh94MY9ZVZYLedOyg4ToYb9L+sWfqjOQ0epo2MeRzL3Y
   ey+N90xYgo6yIT/OM57cT6bz7oiaHX2yVQKLNtyLhFZU1FrJj0WgERUfw
   g==;
IronPort-SDR: xxAs3LFHSKUQ6WoGduLNiFpckRc7SX2DtA7ZF2OUkAfKKGgfIfPGQylxJXdegD3EpOTonW8h19
 Fj6BwYzkSpDjt5BYkt+utScK+7+XAMy97UvVud0vk9URma0VIKBWD0vlz1zA8x2Ba/wDPKQJSf
 5L+JOZUHqQCWQkP7O/qmZl3/tlPdmgZ17rmyzdgiDKiKjb+OCT6cwWQcifqr434bP8UJUNvTDJ
 cDkQd99cr3YonTCKRqn+vRbERc7UPIOYwLQKJiKH9F8mdpKC8qWk2F7uFjEG1io84om73XZYaf
 N+k=
X-IronPort-AV: E=Sophos;i="5.82,334,1613458800"; 
   d="scan'208";a="129696694"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2021 03:01:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 03:01:46 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 03:01:33 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 1/3] dt-bindings: watchdog: sama5d4-wdt: convert to yaml
Date:   Thu, 27 May 2021 13:01:18 +0300
Message-ID: <20210527100120.266796-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the old txt binding to yaml format.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 73 +++++++++++++++++++
 .../bindings/watchdog/atmel-sama5d4-wdt.txt   | 34 ---------
 2 files changed, 73 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
new file mode 100644
index 000000000000..0d0ab81da040
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel SAMA5D4 Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - atmel,sama5d4-wdt
+      - microchip,sam9x60-wdt
+
+  reg:
+    maxItems: 1
+
+  atmel,watchdog-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: should be hardware or software.
+    oneOf:
+      - description:
+          Enable watchdog fault reset. A watchdog fault triggers
+          watchdog reset.
+        const: hardware
+      - description:
+          Enable watchdog fault interrupt. A watchdog fault asserts
+          watchdog interrupt.
+        const: software
+    default: hardware
+
+  atmel,idle-halt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      present if you want to stop the watchdog when the CPU is in idle state.
+      CAUTION: This property should be used with care, it actually makes the
+      watchdog not counting when the CPU is in idle state, therefore the
+      watchdog reset time depends on mean CPU usage and will not reset at all
+      if the CPU stop working while it is in idle state, which is probably
+      not what you want.
+
+  atmel,dbg-halt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      present if you want to stop the watchdog when the CPU is in debug state.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    watchdog@fc068640 {
+      compatible = "atmel,sama5d4-wdt";
+      reg = <0xfc068640 0x10>;
+      interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
+      timeout-sec = <10>;
+      atmel,watchdog-type = "hardware";
+      atmel,dbg-halt;
+      atmel,idle-halt;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
deleted file mode 100644
index 44727fcc2729..000000000000
--- a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* Atmel SAMA5D4 Watchdog Timer (WDT) Controller
-
-Required properties:
-- compatible: "atmel,sama5d4-wdt" or "microchip,sam9x60-wdt"
-- reg: base physical address and length of memory mapped region.
-
-Optional properties:
-- timeout-sec: watchdog timeout value (in seconds).
-- interrupts: interrupt number to the CPU.
-- atmel,watchdog-type: should be "hardware" or "software".
-	"hardware": enable watchdog fault reset. A watchdog fault triggers
-		    watchdog reset.
-	"software": enable watchdog fault interrupt. A watchdog fault asserts
-		    watchdog interrupt.
-- atmel,idle-halt: present if you want to stop the watchdog when the CPU is
-		   in idle state.
-	CAUTION: This property should be used with care, it actually makes the
-	watchdog not counting when the CPU is in idle state, therefore the
-	watchdog reset time depends on mean CPU usage and will not reset at all
-	if the CPU stop working while it is in idle state, which is probably
-	not what you want.
-- atmel,dbg-halt: present if you want to stop the watchdog when the CPU is
-		  in debug state.
-
-Example:
-	watchdog@fc068640 {
-		compatible = "atmel,sama5d4-wdt";
-		reg = <0xfc068640 0x10>;
-		interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
-		timeout-sec = <10>;
-		atmel,watchdog-type = "hardware";
-		atmel,dbg-halt;
-		atmel,idle-halt;
-	};
-- 
2.25.1

