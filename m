Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B09255AEA
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbgH1NHe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:07:34 -0400
Received: from foss.arm.com ([217.140.110.172]:48682 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729348AbgH1NGX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:06:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB46CD6E;
        Fri, 28 Aug 2020 06:06:13 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 770CC3F66B;
        Fri, 28 Aug 2020 06:06:11 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chanho Min <chanho.min@lge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 01/10] dt-bindings: watchdog: sp-805: Convert to Json-schema
Date:   Fri, 28 Aug 2020 14:05:53 +0100
Message-Id: <20200828130602.42203-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the ARM SP-805 watchdog IP DT binding over to Json-schema.

A straight-forward conversion, but the requirement for providing two
clocks got strengthened from "should" to "must".

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/watchdog/arm,sp805.txt           | 32 --------
 .../bindings/watchdog/arm,sp805.yaml          | 75 +++++++++++++++++++
 2 files changed, 75 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
deleted file mode 100644
index bee6f1f0e41b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-ARM AMBA Primecell SP805 Watchdog
-
-SP805 WDT is a ARM Primecell Peripheral and has a standard-id register that
-can be used to identify the peripheral type, vendor, and revision.
-This value can be used for driver matching.
-
-As SP805 WDT is a primecell IP, it follows the base bindings specified in
-'arm/primecell.txt'
-
-Required properties:
-- compatible:  Should be "arm,sp805" & "arm,primecell"
-- reg:         Should contain location and length for watchdog timer register
-- clocks:      Clocks driving the watchdog timer hardware. This list should be
-               2 clocks. With 2 clocks, the order is wdog_clk, apb_pclk
-               wdog_clk can be equal to or be a sub-multiple of the apb_pclk
-               frequency
-- clock-names: Shall be "wdog_clk" for first clock and "apb_pclk" for the
-               second one
-
-Optional properties:
-- interrupts:  Should specify WDT interrupt number
-- timeout-sec: Should specify default WDT timeout in seconds. If unset, the
-               default timeout is determined by the driver
-
-Example:
-	watchdog@66090000 {
-		compatible = "arm,sp805", "arm,primecell";
-		reg = <0x66090000 0x1000>;
-		interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&wdt_clk>, <&apb_pclk>;
-		clock-names = "wdog_clk", "apb_pclk";
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
new file mode 100644
index 000000000000..980e155d3387
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM AMBA Primecell SP805 Watchdog
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+description: |+
+  The Arm SP805 IP implements a watchdog device, which triggers an interrupt
+  after a configurable time period. If that interrupt has not been serviced
+  when the next interrupt would be triggered, the reset signal is asserted.
+
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        const: arm,sp805
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: arm,sp805
+      - const: arm,primecell
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Clocks driving the watchdog timer hardware. The first clock is used
+      for the actual watchdog counter. The second clock drives the register
+      interface.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: wdog_clk
+      - const: apb_pclk
+
+  timeout-sec:
+    description: |
+      Should specify default WDT timeout in seconds. If unset, the default
+      timeout is determined by the driver.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    watchdog@66090000 {
+        compatible = "arm,sp805", "arm,primecell";
+        reg = <0x66090000 0x1000>;
+        interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&wdt_clk>, <&apb_pclk>;
+        clock-names = "wdog_clk", "apb_pclk";
+    };
-- 
2.17.1

