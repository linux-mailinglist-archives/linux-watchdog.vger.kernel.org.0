Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320FA574A7E
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Jul 2022 12:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238290AbiGNKVL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Jul 2022 06:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238280AbiGNKVJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Jul 2022 06:21:09 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDBE52FF9;
        Thu, 14 Jul 2022 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657794068; x=1689330068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g49j0cb9hxZKdZ75BONB6nCv4q9hV2JY4Lk4I2Q6EZ0=;
  b=UEF9Djq1Ma/LZlty0OuGnRTeUJBfvtCMN4XOFB3OgfHQjS/Ir50MUyoh
   GOjLrv4N4NWjVisUkLpmZr1shdUwCoZB3hQhT2Jq7Ds3tyoU2rE6QWjaD
   d4f65l4N8WQExU6Z9K6Q+AnZ0wbjx0Wutkry3pDv0eVb6nsr4wHphXp4L
   IkfEBWs7cJlFGYQwev3U80ko/CF0FG4acJLDXMWAj+BJK6NTmMJCWSptT
   zhjLF8AW4I6FuwIjIqELn9f0KRjlIxRMdtLGVrdKHdKKLxjAUaBdiA+2E
   u3OHtR8DycViqyWp8ZXcp+OTdZ8LlKZSOd8PjdHSlS53/PBrS1R6x/ieo
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="167808613"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 03:21:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 03:21:05 -0700
Received: from ROB-ULT-M68701.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 14 Jul 2022 03:20:57 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>, <eugen.hristev@microchip.com>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH] watchdog: dt-bindings: atmel,at91sam9-wdt: convert to json-schema
Date:   Thu, 14 Jul 2022 13:12:44 +0300
Message-ID: <20220714101242.103521-1-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert at91sam9 WDT binding for Atmel/Microchip SoCs to Device Tree
Schema format.

Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
---
 .../bindings/watchdog/atmel,at91sam9-wdt.yaml | 127 ++++++++++++++++++
 .../bindings/watchdog/atmel-wdt.txt           |  51 -------
 2 files changed, 127 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,at91sam9-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/atmel,at91sam9-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,at91sam9-wdt.yaml
new file mode 100644
index 000000000000..b3f7cbe913a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/atmel,at91sam9-wdt.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/atmel,at91sam9-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel Watchdog Timers
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@microchip.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+  - if:
+      properties:
+        atmel,reset-type:
+          enum:
+            - all
+            - proc
+    then:
+      properties:
+        atmel,watchdog-type:
+          const: hardware
+
+properties:
+  compatible:
+    const: atmel,at91sam9260-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  atmel,max-heartbeat-sec:
+    description:
+      Should contain the maximum heartbeat value in seconds. This value
+      should be less or equal to 16. It is used to compute the WDV field.
+    maximum: 16
+
+  atmel,min-heartbeat-sec:
+    description:
+      Should contain the minimum heartbeat value in seconds. This value
+      must be smaller than the max-heartbeat-sec value. It is used to
+      compute the WDD field.
+    maximum: 16
+
+  atmel,watchdog-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Should be hardware or software.
+    oneOf:
+      - description:
+          Hardware watchdog uses the at91 watchdog reset.
+        const: hardware
+      - description: |
+          Software watchdog uses the watchdog interrupt
+          to trigger a software reset.
+        const: software
+    default: hardware
+
+  atmel,reset-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Should be proc or all. This is valid only when using hardware watchdog.
+    oneOf:
+      - description:
+          Assert peripherals and processor reset signals.
+        const: all
+      - description:
+          Assert the processor reset signal.
+        const: proc
+    default: all
+
+  atmel,disable:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Should be present if you want to stop the watchdog.
+
+  atmel,idle-halt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Should be present if you want to stop the watchdog when
+      entering idle state.
+      CAUTION: This property should be used with care, it actually makes the
+      watchdog not counting when the CPU is in idle state, therefore the
+      watchdog reset time depends on mean CPU usage and will not reset at all
+      if the CPU stops working while it is in idle state, which is probably
+      not what you want.
+
+  atmel,dbg-halt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Should be present if you want to stop the watchdog when
+      entering debug state.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+dependencies:
+  atmel,reset-type: ['atmel,watchdog-type']
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    watchdog@fffffd40 {
+        compatible = "atmel,at91sam9260-wdt";
+        reg = <0xfffffd40 0x10>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&clk32k>;
+        timeout-sec = <15>;
+        atmel,watchdog-type = "hardware";
+        atmel,reset-type = "all";
+        atmel,dbg-halt;
+        atmel,idle-halt;
+        atmel,max-heartbeat-sec = <16>;
+        atmel,min-heartbeat-sec = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
deleted file mode 100644
index 711a880b3d3b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-* Atmel Watchdog Timers
-
-** at91sam9-wdt
-
-Required properties:
-- compatible: must be "atmel,at91sam9260-wdt".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: phandle to input clock.
-
-Optional properties:
-- timeout-sec: contains the watchdog timeout in seconds.
-- interrupts : Should contain WDT interrupt.
-- atmel,max-heartbeat-sec : Should contain the maximum heartbeat value in
-	seconds. This value should be less or equal to 16. It is used to
-	compute the WDV field.
-- atmel,min-heartbeat-sec : Should contain the minimum heartbeat value in
-	seconds. This value must be smaller than the max-heartbeat-sec value.
-	It is used to compute the WDD field.
-- atmel,watchdog-type : Should be "hardware" or "software". Hardware watchdog
-	use the at91 watchdog reset. Software watchdog use the watchdog
-	interrupt to trigger a software reset.
-- atmel,reset-type : Should be "proc" or "all".
-	"all" : assert peripherals and processor reset signals
-	"proc" : assert the processor reset signal
-	This is valid only when using "hardware" watchdog.
-- atmel,disable : Should be present if you want to disable the watchdog.
-- atmel,idle-halt : Should be present if you want to stop the watchdog when
-	entering idle state.
-	CAUTION: This property should be used with care, it actually makes the
-	watchdog not counting when the CPU is in idle state, therefore the
-	watchdog reset time depends on mean CPU usage and will not reset at all
-	if the CPU stop working while it is in idle state, which is probably
-	not what you want.
-- atmel,dbg-halt : Should be present if you want to stop the watchdog when
-	entering debug state.
-
-Example:
-	watchdog@fffffd40 {
-		compatible = "atmel,at91sam9260-wdt";
-		reg = <0xfffffd40 0x10>;
-		interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-		clocks = <&clk32k>;
-		timeout-sec = <15>;
-		atmel,watchdog-type = "hardware";
-		atmel,reset-type = "all";
-		atmel,dbg-halt;
-		atmel,idle-halt;
-		atmel,max-heartbeat-sec = <16>;
-		atmel,min-heartbeat-sec = <0>;
-	};
-- 
2.25.1

