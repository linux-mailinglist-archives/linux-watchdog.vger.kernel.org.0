Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B6017BF15
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgCFNiC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 08:38:02 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37298 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgCFNiC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 08:38:02 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 770DC8030792;
        Fri,  6 Mar 2020 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bEO0VVTOMh71; Fri,  6 Mar 2020 16:28:02 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/7] dt-bindings: watchdog: dw-wdt: Replace legacy bindings file with YAML-based one
Date:   Fri, 6 Mar 2020 16:27:41 +0300
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132803.770DC8030792@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Modern device tree bindings are supposed to be created as YAML-files
in accordane with dt-schema. This commit replaces the DW Watchdog
legacy bare text bindings with YAML file. As before the the bindings
states that the corresponding dts node is supposed to have a registers
range reference, at least one clocks phandle reference, optional reset
lines. Seeing all the platforms with DW Watchdog provide the watchdog
interrupt property and since in further commit we'll alter the driver
to use it for pre-timeout functionality implementation, lets declare
the IRQ property to be required.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 -------
 .../bindings/watchdog/snps,dw-wdt.yaml        | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
deleted file mode 100644
index eb0914420c7c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Synopsys Designware Watchdog Timer
-
-Required Properties:
-
-- compatible	: Should contain "snps,dw-wdt"
-- reg		: Base address and size of the watchdog timer registers.
-- clocks	: phandle + clock-specifier for the clock that drives the
-		watchdog timer.
-
-Optional Properties:
-
-- interrupts	: The interrupt used for the watchdog timeout warning.
-- resets	: phandle pointing to the system reset controller with
-		line index for the watchdog.
-
-Example:
-
-	watchdog0: wd@ffd02000 {
-		compatible = "snps,dw-wdt";
-		reg = <0xffd02000 0x1000>;
-		interrupts = <0 171 4>;
-		clocks = <&per_base_clk>;
-		resets = <&rst WDT0_RESET>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
new file mode 100644
index 000000000000..8b30f9601c38
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2019 BAIKAL ELECTRONICS, JSC
+#
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys Designware Watchdog Timer
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Jamie Iles <jamie@jamieiles.com>
+
+properties:
+  compatible:
+    const: snps,dw-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: DW Watchdog pre-timeout interrupts.
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Watchdog timer reference clock.
+      - description: APB3 interface clock.
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: tclk
+      - const: pclk
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  resets:
+    description: Phandle to the DW Watchdog reset lane.
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    watchdog0: watchdog@ffd02000 {
+      compatible = "snps,dw-wdt";
+      reg = <0xffd02000 0x1000>;
+      interrupts = <0 171 4>;
+      clocks = <&per_base_clk>;
+      resets = <&wdt_rst>;
+    };
+...
-- 
2.25.1

