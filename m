Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1971A8FE3
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Apr 2020 02:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634701AbgDOAsr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Apr 2020 20:48:47 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57138 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392429AbgDOAsc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Apr 2020 20:48:32 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F22C200675;
        Wed, 15 Apr 2020 02:48:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 49A35200651;
        Wed, 15 Apr 2020 02:48:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 15CB1402B4;
        Wed, 15 Apr 2020 08:48:11 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 2/2] dt-bindings: watchdog: Convert i.MX7ULP to json-schema
Date:   Wed, 15 Apr 2020 08:40:11 +0800
Message-Id: <1586911211-1141-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
References: <1586911211-1141-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the i.MX7ULP watchdog binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Add 'timeout-sec' property to avoid build error.
---
 .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 --------
 .../bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 65 ++++++++++++++++++++++
 2 files changed, 65 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
deleted file mode 100644
index f902508..0000000
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Freescale i.MX7ULP Watchdog Timer (WDT) Controller
-
-Required properties:
-- compatible : Should be "fsl,imx7ulp-wdt"
-- reg : Should contain WDT registers location and length
-- interrupts : Should contain WDT interrupt
-- clocks: Should contain a phandle pointing to the gated peripheral clock.
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-
-Examples:
-
-wdog1: watchdog@403d0000 {
-	compatible = "fsl,imx7ulp-wdt";
-	reg = <0x403d0000 0x10000>;
-	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
-	assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
-	assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
-	timeout-sec = <40>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
new file mode 100644
index 0000000..86b4d93
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/fsl-imx7ulp-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX7ULP Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Anson Huang <Anson.Huang@nxp.com>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7ulp-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Watchdog's clock source.
+    maxItems: 1
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clocks-parents:
+    maxItems: 1
+
+  timeout-sec:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Contains the watchdog timeout in seconds.
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx7ulp-clock.h>
+
+    wdog1: watchdog@403d0000 {
+        compatible = "fsl,imx7ulp-wdt";
+        reg = <0x403d0000 0x10000>;
+        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+        assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
+        assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+        timeout-sec = <40>;
+    };
+
+...
-- 
2.7.4

