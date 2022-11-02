Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251B9616DBA
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Nov 2022 20:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiKBTUn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 15:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiKBTUl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 15:20:41 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C778E0A2
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Nov 2022 12:20:34 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DB62284F39;
        Wed,  2 Nov 2022 20:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667416832;
        bh=KQ7SPCMB51dJ/SDQrgfQd7I0irSU0npFOfzmrtjSj9s=;
        h=From:To:Cc:Subject:Date:From;
        b=iaB0YL8UUzAWpXHfDvF0IFR3licJ9CA9TGpI2firDeK9DkKPlKY2pkvbssoIOJYun
         +QjdoG3DxjGCrvOztAks5RWHc/laD8VuRLj369axzl8vkSJkAyeYeYsHzYpzUkj8LN
         7a7vTgNXof/vl0eeeXfooWVOPdqaGDUf66/mvW/ymnwQ/XA+ZA71gsu3RDdsYo4A6Q
         en7d3mChqCTj7IGg0mB5PdeRmJUKtMOfnCsAtffYXvI+diVHuZTU49p904WGO2q45N
         pnjPh9H0r0OPQwFUCTNpRuhB3Fbw+rl44zgiYKSvi9VP2P4Ml7+YsBKOEChRiMwjtn
         ji1QZKU4h3Irw==
From:   Marek Vasut <marex@denx.de>
To:     linux-watchdog@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH] dt-bindings: watchdog: gpio: Convert bindings to YAML
Date:   Wed,  2 Nov 2022 20:20:29 +0100
Message-Id: <20221102192029.120917-1-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org
To: devicetree@vger.kernel.org
---
NOTE: The Maintainer entry should likely be changed, although it seems
      like this driver and its matching bindings are now unmaintained.
---
 .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 ------------
 .../bindings/watchdog/linux,wdt-gpio.yaml     | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 28 deletions(-)
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
index 0000000000000..6b014d60c9471
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-controlled Watchdog
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
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
+
+allOf:
+  - $ref: "watchdog.yaml#"
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

