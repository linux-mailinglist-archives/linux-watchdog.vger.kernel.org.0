Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7389E61F833
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Nov 2022 17:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiKGQDz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Nov 2022 11:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiKGQDz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Nov 2022 11:03:55 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565E0646A;
        Mon,  7 Nov 2022 08:03:53 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DF13E80705;
        Mon,  7 Nov 2022 17:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667837031;
        bh=npYaDFsNI6WNDngxPTaMW7qxIj6XNWcAhE4z8/9Z3ns=;
        h=From:To:Cc:Subject:Date:From;
        b=NoelKcAy/1BxHzRIlRmb3IzlavJyBdFLhfv3UnQ+X9fL2sIpPJ/AeuGrBmG6akLu1
         Uo/Mf10Veby7mmr2mPBg8renR3LQ+HMzN0/nBkyZuyeWsC5afG6tWi4qaBPu2bAyA1
         IEXuRR8jTUPeONfd9FmfHHD0l2h9WwTBn0OytW7M0Szn7L1igA5AF7Gt8Xyfr4bjMl
         A3fPu+K0u+Sn9VrEAwMFOu90lYqbSUN5CLZFxzStiLBBMaBzVgQ7JfHJ/YQa8WbwU5
         Fbi8mrt82roKMVorXRXqEFVRDyWNeu+5OTHrgSNy7ooyyOJeRQt5P1RxL6UOIuAU9l
         G/1TpcFjaw55g==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v3] dt-bindings: watchdog: gpio: Convert bindings to YAML
Date:   Mon,  7 Nov 2022 17:03:38 +0100
Message-Id: <20221107160338.27910-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Add missing required: properties
    - Drop quotes around ref: referenced schema file name
V3: - Add Guenter as maintainer of the bindings
    - Add RB from Rob
---
 .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 -----------
 .../bindings/watchdog/linux,wdt-gpio.yaml     | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
deleted file mode 100644
index 198794963786b..0000000000000
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* GPIO-controlled Watchdog
-
-Required Properties:
-- compatible: Should contain "linux,wdt-gpio".
-- gpios: From common gpio binding; gpio connection to WDT reset pin.
-- hw_algo: The algorithm used by the driver. Should be one of the
-  following values:
-  - toggle: Either a high-to-low or a low-to-high transition clears
-    the WDT counter. The watchdog timer is disabled when GPIO is
-    left floating or connected to a three-state buffer.
-  - level: Low or high level starts counting WDT timeout,
-    the opposite level disables the WDT. Active level is determined
-    by the GPIO flags.
-- hw_margin_ms: Maximum time to reset watchdog circuit (milliseconds).
-
-Optional Properties:
-- always-running: If the watchdog timer cannot be disabled, add this flag to
-  have the driver keep toggling the signal without a client. It will only cease
-  to toggle the signal when the device is open and the timeout elapsed.
-
-Example:
-	watchdog: watchdog {
-		/* ADM706 */
-		compatible = "linux,wdt-gpio";
-		gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
-		hw_algo = "toggle";
-		hw_margin_ms = <1600>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
new file mode 100644
index 0000000000000..c729c96a5dc75
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-controlled Watchdog
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  compatible:
+    const: linux,wdt-gpio
+
+  gpios:
+    description: gpio connection to WDT reset pin
+    maxItems: 1
+
+  hw_algo:
+    description: The algorithm used by the driver.
+    enum: [ level, toggle ]
+
+  hw_margin_ms:
+    description: Maximum time to reset watchdog circuit (milliseconds).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - gpios
+  - hw_algo
+  - hw_margin_ms
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    watchdog {
+        compatible = "linux,wdt-gpio";
+        gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
+        hw_algo = "toggle";
+        hw_margin_ms = <1600>;
+    };
-- 
2.35.1

