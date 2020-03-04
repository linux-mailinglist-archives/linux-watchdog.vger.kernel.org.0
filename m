Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFC09178DAA
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Mar 2020 10:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgCDJnC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Mar 2020 04:43:02 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:58385 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728387AbgCDJnC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Mar 2020 04:43:02 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0249E4NE011815;
        Wed, 4 Mar 2020 10:42:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xTAUbZgzzObrdlT6XJnXg3/PAUo5cKiPBTLGO0YruFg=;
 b=hlXhHnDbQJxP6dASolVJe0dZAbU211etYavIVMwzJ1KoweX9QigDvPrTsfmZxz0CoBpw
 IcN68SMkFZgDoVNbcq42E0PypcbBwzWFy/mq3AtFroc+urJch3zu9QaB2THUFZzoJki8
 Fcptc6XwZ+vfoagCOgTXsWmktJZxSK4FAMC94M/jSCJe76of4Jkq1SSUk3v++wdShlDn
 jaUY4F13SmSRbrCBIQBQ+GKYlCa+NGxVZLjEZPse29iK9KM3OuoKlD9JsDcuwkaBEOsf
 lBE7jSUiY/kgbWmRyPSd69DGfLS+l86zeRiLGx1YQXCUOnk8NUCGTqO3IAHV7nGmXjp7 Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfem0yy1n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Mar 2020 10:42:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D375D10002A;
        Wed,  4 Mar 2020 10:42:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96C652A59B8;
        Wed,  4 Mar 2020 10:42:30 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Mar 2020 10:42:29
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <p.paillet@st.com>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v5] dt-bindings: mfd: Convert stpmic1 bindings to json-schema
Date:   Wed, 4 Mar 2020 10:42:20 +0100
Message-ID: <20200304094220.28156-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-04_01:2020-03-03,2020-03-04 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert stpmic1 bindings to json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
version 5:
- move $ref regulator.yaml under a patternProperties
- move remain fixed strings under properties field

version 4:
- move on uppder node $ref: ../regulator/regulator.yaml 
- move fixed strings under properties field
- remove unneeded () in patternProperties
- keep ldo3 separate from other ldo properties
Note:
- 'st,mask-reset' property stay in each subnode, I don't find
  the syntax to avoid dupliquate it. 
- ldo6-supply and all possible *-supply are describe by this regular
  expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":

version 3:
- put $ref under allOf keyword
- for each regulator node add the list of supported regulator properties

 .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
 .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
 .../devicetree/bindings/mfd/st,stpmic1.yaml        | 339 +++++++++++++++++++++
 .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
 .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
 5 files changed, 339 insertions(+), 164 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt

diff --git a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt b/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
deleted file mode 100644
index eb8e83736c02..000000000000
--- a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-STMicroelectronics STPMIC1 Onkey
-
-Required properties:
-
-- compatible = "st,stpmic1-onkey";
-- interrupts: interrupt line to use
-- interrupt-names = "onkey-falling", "onkey-rising"
-	onkey-falling: happens when onkey is pressed; IT_PONKEY_F of pmic
-	onkey-rising: happens when onkey is released; IT_PONKEY_R of pmic
-
-Optional properties:
-
-- st,onkey-clear-cc-flag: onkey is able power on after an
-  over-current shutdown event.
-- st,onkey-pu-inactive: onkey pull up is not active
-- power-off-time-sec: Duration in seconds which the key should be kept
-        pressed for device to power off automatically (from 1 to 16 seconds).
-        see See Documentation/devicetree/bindings/input/input.yaml
-
-Example:
-
-onkey {
-	compatible = "st,stpmic1-onkey";
-	interrupt-parent = <&pmic>;
-	interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
-	interrupt-names = "onkey-falling", "onkey-rising";
-	power-off-time-sec = <10>;
-};
diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt b/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
deleted file mode 100644
index afd45c089585..000000000000
--- a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-* STMicroelectronics STPMIC1 Power Management IC
-
-Required properties:
-- compatible:		: "st,stpmic1"
-- reg:			: The I2C slave address for the STPMIC1 chip.
-- interrupts:		: The interrupt line the device is connected to.
-- #interrupt-cells:	: Should be 1.
-- interrupt-controller:	: Marks the device node as an interrupt controller.
-			    Interrupt numbers are defined at
-			    dt-bindings/mfd/st,stpmic1.h.
-
-STPMIC1 consists in a varied group of sub-devices.
-Each sub-device binding is be described in own documentation file.
-
-Device			 Description
-------			------------
-st,stpmic1-onkey	: Power on key, see ../input/st,stpmic1-onkey.txt
-st,stpmic1-regulators	: Regulators, see ../regulator/st,stpmic1-regulator.txt
-st,stpmic1-wdt		: Watchdog, see ../watchdog/st,stpmic1-wdt.txt
-
-Example:
-
-#include <dt-bindings/mfd/st,stpmic1.h>
-
-pmic: pmic@33 {
-	compatible = "st,stpmic1";
-	reg = <0x33>;
-	interrupt-parent = <&gpioa>;
-	interrupts = <0 2>;
-
-	interrupt-controller;
-	#interrupt-cells = <2>;
-
-	onkey {
-		compatible = "st,stpmic1-onkey";
-		interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
-		interrupt-names = "onkey-falling", "onkey-rising";
-		power-off-time-sec = <10>;
-	};
-
-	watchdog {
-		compatible = "st,stpmic1-wdt";
-	};
-
-	regulators {
-		compatible = "st,stpmic1-regulators";
-
-		vdd_core: buck1 {
-			regulator-name = "vdd_core";
-			regulator-boot-on;
-			regulator-min-microvolt = <700000>;
-			regulator-max-microvolt = <1200000>;
-		};
-		vdd: buck3 {
-			regulator-name = "vdd";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			regulator-pull-down;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
new file mode 100644
index 000000000000..d9ad9260e348
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
@@ -0,0 +1,339 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/st,stpmic1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectonics STPMIC1 Power Management IC bindings
+
+description: STMicroelectronics STPMIC1 Power Management IC
+
+maintainers:
+  - pascal Paillet <p.paillet@st.com>
+
+properties:
+  compatible:
+    const: st,stpmic1
+
+  reg:
+    const: 0x33
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  onkey:
+    type: object
+
+    allOf:
+      - $ref: ../input/input.yaml
+
+    properties:
+      compatible:
+        const: st,stpmic1-onkey
+
+      interrupts:
+        items:
+          - description: onkey-falling, happens when onkey is pressed. IT_PONKEY_F of pmic
+          - description: onkey-rising, happens when onkey is released. IT_PONKEY_R of pmic
+
+      interrupt-names:
+        items:
+          - const: onkey-falling
+          - const: onkey-rising
+
+      st,onkey-clear-cc-flag:
+        description: onkey is able power on after an over-current shutdown event.
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      st,onkey-pu-inactive:
+        description: onkey pull up is not active
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      power-off-time-sec:
+        minimum: 1
+        maximum: 16
+
+    required:
+      - compatible
+      - interrupts
+      - interrupt-names
+
+    additionalProperties: false
+
+  watchdog:
+    type: object
+
+    allOf:
+      - $ref: ../watchdog/watchdog.yaml
+
+    properties:
+      compatible:
+        const: st,stpmic1-wdt
+
+      timeout-sec: true
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  regulators:
+    type: object
+
+    description: |
+      Available Regulators in STPMIC1 device are:
+        - buck1 for Buck BUCK1
+        - buck2 for Buck BUCK2
+        - buck3 for Buck BUCK3
+        - buck4 for Buck BUCK4
+        - ldo1 for LDO LDO1
+        - ldo2 for LDO LDO2
+        - ldo3 for LDO LDO3
+        - ldo4 for LDO LDO4
+        - ldo5 for LDO LDO5
+        - ldo6 for LDO LDO6
+        - vref_ddr for LDO Vref DDR
+        - boost for Buck BOOST
+        - pwr_sw1 for VBUS_OTG switch
+        - pwr_sw2 for SW_OUT switch
+      Switches are fixed voltage regulators with only enable/disable capability.
+
+    properties:
+      compatible:
+        const: st,stpmic1-regulators
+
+      ldo3:
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-min-microvolt: true
+          regulator-max-microvolt: true
+          regulator-allow-bypass: true
+          regulator-over-current-protection: true
+
+        additionalProperties: false
+
+      ldo4:
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-over-current-protection: true
+
+        additionalProperties: false
+
+      vref_ddr:
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+
+        additionalProperties: false
+
+      boost:
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-over-current-protection: true
+
+        additionalProperties: false
+
+    patternProperties:
+      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
+        description: STPMIC1 voltage regulators supplies
+
+      "^(buck[1-4]|ldo[1-6]|boost|vref_ddr|pwr_sw[1-2])$":
+        allOf:
+          - $ref: ../regulator/regulator.yaml
+
+      "^ldo[1-2,5-6]$":
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-min-microvolt: true
+          regulator-max-microvolt: true
+          regulator-over-current-protection: true
+          regulator-enable-ramp-delay: true
+
+        additionalProperties: false
+
+      "^buck[1-4]$":
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          st,mask-reset:
+            description: mask reset for this regulator,
+                         the regulator configuration is maintained during pmic reset.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-min-microvolt: true
+          regulator-max-microvolt: true
+          regulator-initial-mode: true
+          regulator-pull-down: true
+          regulator-over-current-protection: true
+          regulator-enable-ramp-delay: true
+
+        additionalProperties: false
+
+      "^pwr_sw[1-2]$":
+        type: object
+
+        properties:
+          interrupts:
+            maxItems: 1
+
+          regulator-name: true
+          regulator-boot-on: true
+          regulator-always-on: true
+          regulator-over-current-protection: true
+          regulator-active-discharge: true
+
+        additionalProperties: false
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+examples:
+  - |
+    #include <dt-bindings/mfd/st,stpmic1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@33 {
+        compatible = "st,stpmic1";
+        reg = <0x33>;
+        interrupt-parent = <&gpioa>;
+        interrupts = <0 2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        onkey {
+          compatible = "st,stpmic1-onkey";
+          interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
+          interrupt-names = "onkey-falling", "onkey-rising";
+          power-off-time-sec = <10>;
+        };
+
+        watchdog {
+          compatible = "st,stpmic1-wdt";
+        };
+
+        regulators {
+          compatible = "st,stpmic1-regulators";
+
+          ldo6-supply = <&v3v3>;
+
+          buck1 {
+            regulator-name = "vdd_core";
+            interrupts = <IT_CURLIM_BUCK1 0>;
+            st,mask-reset;
+            regulator-boot-on;
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <1200000>;
+          };
+
+          buck3 {
+            regulator-name = "vdd";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-boot-on;
+            regulator-pull-down;
+          };
+
+          buck4 {
+            regulator-name = "v3v3";
+            interrupts = <IT_CURLIM_BUCK4 0>;
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+          };
+
+          ldo6 {
+            regulator-name = "v1v8";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-over-current-protection;
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
deleted file mode 100644
index 6189df71ea98..000000000000
--- a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-STMicroelectronics STPMIC1 Voltage regulators
-
-Regulator Nodes are optional depending on needs.
-
-Available Regulators in STPMIC1 device are:
-  - buck1 for Buck BUCK1
-  - buck2 for Buck BUCK2
-  - buck3 for Buck BUCK3
-  - buck4 for Buck BUCK4
-  - ldo1 for LDO LDO1
-  - ldo2 for LDO LDO2
-  - ldo3 for LDO LDO3
-  - ldo4 for LDO LDO4
-  - ldo5 for LDO LDO5
-  - ldo6 for LDO LDO6
-  - vref_ddr for LDO Vref DDR
-  - boost for Buck BOOST
-  - pwr_sw1 for VBUS_OTG switch
-  - pwr_sw2 for SW_OUT switch
-
-Switches are fixed voltage regulators with only enable/disable capability.
-
-Optional properties:
-- st,mask-reset: mask reset for this regulator: the regulator configuration
-  is maintained during pmic reset.
-- regulator-over-current-protection:
-    if set, all regulators are switched off in case of over-current detection
-    on this regulator,
-    if not set, the driver only sends an over-current event.
-- interrupts: index of current limit detection interrupt
-- <regulator>-supply: phandle to the parent supply/regulator node
-	each regulator supply can be described except vref_ddr.
-- regulator-active-discharge: can be used on pwr_sw1 and pwr_sw2.
-
-Example:
-regulators {
-	compatible = "st,stpmic1-regulators";
-
-	ldo6-supply = <&v3v3>;
-
-	vdd_core: buck1 {
-		regulator-name = "vdd_core";
-		interrupts = <IT_CURLIM_BUCK1 0>;
-		st,mask-reset;
-		regulator-pull-down;
-		regulator-min-microvolt = <700000>;
-		regulator-max-microvolt = <1200000>;
-	};
-
-	v3v3: buck4 {
-		regulator-name = "v3v3";
-		interrupts = <IT_CURLIM_BUCK4 0>;
-
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	v1v8: ldo6 {
-		regulator-name = "v1v8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-over-current-protection;
-	};
-};
diff --git a/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt b/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
deleted file mode 100644
index 7cc1407f15cb..000000000000
--- a/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-STMicroelectronics STPMIC1 Watchdog
-
-Required properties:
-
-- compatible : should be "st,stpmic1-wdt"
-
-Example:
-
-watchdog {
-	compatible = "st,stpmic1-wdt";
-};
-- 
2.15.0

