Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8F01A7116
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Apr 2020 04:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404150AbgDNCk6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Apr 2020 22:40:58 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47256 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728745AbgDNCk5 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Apr 2020 22:40:57 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 723141A0278;
        Tue, 14 Apr 2020 04:40:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 856E51A0142;
        Tue, 14 Apr 2020 04:40:50 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 17E6140305;
        Tue, 14 Apr 2020 10:40:44 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/2] dt-bindings: watchdog: Convert i.MX to json-schema
Date:   Tue, 14 Apr 2020 10:32:47 +0800
Message-Id: <1586831568-24635-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the i.MX watchdog binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/watchdog/fsl-imx-wdt.txt   | 24 ----------
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 56 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
deleted file mode 100644
index adc6b76..0000000
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Freescale i.MX Watchdog Timer (WDT) Controller
-
-Required properties:
-- compatible : Should be "fsl,<soc>-wdt"
-- reg : Should contain WDT registers location and length
-- interrupts : Should contain WDT interrupt
-
-Optional properties:
-- big-endian: If present the watchdog device's registers are implemented
-  in big endian mode, otherwise in native mode(same with CPU), for more
-  detail please see: Documentation/devicetree/bindings/regmap/regmap.txt.
-- fsl,ext-reset-output: If present the watchdog device is configured to
-  assert its external reset (WDOG_B) instead of issuing a software reset.
-- timeout-sec : Contains the watchdog timeout in seconds
-
-Examples:
-
-wdt@73f98000 {
-	compatible = "fsl,imx51-wdt", "fsl,imx21-wdt";
-	reg = <0x73f98000 0x4000>;
-	interrupts = <58>;
-	big-endian;
-	timeout-sec = <20>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
new file mode 100644
index 0000000..674d902
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX Watchdog Timer (WDT) Controller
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
+      - fsl,imx21-wdt
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
+  fsl,ext-reset-output:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device is configured to assert its
+      external reset (WDOG_B) instead of issuing a software reset.
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    wdog1: watchdog@20bc000 {
+        compatible = "fsl,imx21-wdt";
+        reg = <0x020bc000 0x4000>;
+        interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX6QDL_CLK_IPG>;
+    };
+
+...
-- 
2.7.4

