Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C563C38B224
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 May 2021 16:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhETOrJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 10:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhETOqx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 10:46:53 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34465C061760
        for <linux-watchdog@vger.kernel.org>; Thu, 20 May 2021 07:45:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9cc6:7165:bcc2:1e70])
        by michel.telenet-ops.be with bizsmtp
        id 72lR2500U31btb9062lRyq; Thu, 20 May 2021 16:45:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljjvR-007XWm-8J; Thu, 20 May 2021 16:45:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ljjvQ-009A0s-F4; Thu, 20 May 2021 16:45:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: timer: arm,twd: Convert to json-schema
Date:   Thu, 20 May 2021 16:45:23 +0200
Message-Id: <3ccc0cf5319f56e230ee3b8a009f8d63afb114c1.1621521847.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the ARM Timer-Watchdog Device Tree binding documentation to
json-schema.  As the old binding document actually contained two
bindings, it is split in two document: one for the timer part, and one
for the watchdog part.

Document missing properties.
Update examples to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I have listed Marc as the maintainer, as he wrote the original bindings.
Marc: Please scream if this is inappropriate ;-)
---
 .../bindings/timer/arm,twd-timer.yaml         | 56 +++++++++++++++++++
 .../devicetree/bindings/timer/arm,twd.txt     | 53 ------------------
 .../bindings/watchdog/arm,twd-wdt.yaml        | 50 +++++++++++++++++
 3 files changed, 106 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,twd.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml

diff --git a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
new file mode 100644
index 0000000000000000..7521353fb4b021ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/arm,twd-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Timer-Watchdog Timer
+
+maintainers:
+  - Marc Zyngier <maz@kernel.org>
+
+description:
+  ARM 11MP, Cortex-A5 and Cortex-A9 are often associated with a per-core
+  Timer-Watchdog (aka TWD), which provides both a per-cpu local timer
+  and watchdog.
+
+  The TWD is usually attached to a GIC to deliver its two per-processor
+  interrupts.
+
+properties:
+  compatible:
+    enum:
+      - arm,cortex-a9-twd-timer
+      - arm,cortex-a5-twd-timer
+      - arm,arm11mp-twd-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  always-on:
+    description:
+      If present, the timer is powered through an always-on power domain,
+      therefore it never loses context.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    twd-timer@2c000600 {
+            compatible = "arm,arm11mp-twd-timer";
+            reg = <0x2c000600 0x20>;
+            interrupts = <GIC_PPI 13 0xf01>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/arm,twd.txt b/Documentation/devicetree/bindings/timer/arm,twd.txt
deleted file mode 100644
index 383ea19c2bf0073e..0000000000000000
--- a/Documentation/devicetree/bindings/timer/arm,twd.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* ARM Timer Watchdog
-
-ARM 11MP, Cortex-A5 and Cortex-A9 are often associated with a per-core
-Timer-Watchdog (aka TWD), which provides both a per-cpu local timer
-and watchdog.
-
-The TWD is usually attached to a GIC to deliver its two per-processor
-interrupts.
-
-** Timer node required properties:
-
-- compatible : Should be one of:
-	"arm,cortex-a9-twd-timer"
-	"arm,cortex-a5-twd-timer"
-	"arm,arm11mp-twd-timer"
-
-- interrupts : One interrupt to each core
-
-- reg : Specify the base address and the size of the TWD timer
-	register window.
-
-Optional
-
-- always-on : a boolean property. If present, the timer is powered through
-  an always-on power domain, therefore it never loses context.
-
-Example:
-
-	twd-timer@2c000600 {
-		compatible = "arm,arm11mp-twd-timer"";
-		reg = <0x2c000600 0x20>;
-		interrupts = <1 13 0xf01>;
-	};
-
-** Watchdog node properties:
-
-- compatible : Should be one of:
-	"arm,cortex-a9-twd-wdt"
-	"arm,cortex-a5-twd-wdt"
-	"arm,arm11mp-twd-wdt"
-
-- interrupts : One interrupt to each core
-
-- reg : Specify the base address and the size of the TWD watchdog
-	register window.
-
-Example:
-
-	twd-watchdog@2c000620 {
-		compatible = "arm,arm11mp-twd-wdt";
-		reg = <0x2c000620 0x20>;
-		interrupts = <1 14 0xf01>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
new file mode 100644
index 0000000000000000..6d50892c96a3154b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm,twd-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Timer-Watchdog Watchdog
+
+maintainers:
+  - Marc Zyngier <maz@kernel.org>
+
+description:
+  ARM 11MP, Cortex-A5 and Cortex-A9 are often associated with a per-core
+  Timer-Watchdog (aka TWD), which provides both a per-cpu local timer
+  and watchdog.
+
+  The TWD is usually attached to a GIC to deliver its two per-processor
+  interrupts.
+
+properties:
+  compatible:
+    enum:
+      - arm,cortex-a9-twd-wdt
+      - arm,cortex-a5-twd-wdt
+      - arm,arm11mp-twd-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    twd-watchdog@2c000620 {
+            compatible = "arm,arm11mp-twd-wdt";
+            reg = <0x2c000620 0x20>;
+            interrupts = <GIC_PPI 14 0xf01>;
+    };
-- 
2.25.1

