Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8FC96388BC
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Nov 2022 12:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiKYL3P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Nov 2022 06:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiKYL3O (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Nov 2022 06:29:14 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A606BE21
        for <linux-watchdog@vger.kernel.org>; Fri, 25 Nov 2022 03:29:12 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id i10so9669770ejg.6
        for <linux-watchdog@vger.kernel.org>; Fri, 25 Nov 2022 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjVN2/rarqDocQfRidrwGPz+qRzx6OCOZytsLPLYMiI=;
        b=TCteURvHQM5/U/BicR2ooC7pNBm94/ZNg1On4HQzhX1qR+4STId8/XzuNEF9aWrzXc
         7XkkxA+clrH55MWjx645uvUgrvZnmVoOJJYPQGkKBksl4Ct5qzh87nuqSyGjhWQBizcw
         LYIbQDm8Y65s6zdydt9EA+bLLfAtNcflaPd9yJSF39A1emvBm30GAYPGgcb4aQFGU97A
         JM7sryoKzCFnuVDddXsqEeRYEwtu2nHm9MIxFiSwtzyu3/cigC6k2Xmu1TIrhlXsgzuv
         XDBfw5VminEL6THAxgk6NBoduMboAmC53SoECNHgP9TZjFL7/Zbl9ZTSwwwQvAxkKRTy
         FOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjVN2/rarqDocQfRidrwGPz+qRzx6OCOZytsLPLYMiI=;
        b=mCPwsm/2EUG+IlgJJsx8tDriKwx8qIl4sW9RWvXFZmSRN+klZNTvfRhrU1PWfVkM58
         37TMw0C+ql1NilgFeGHNnhgzZh+eVROZAFVZyae7aYemUOOkIbw0oYD7KtkSMWNX8Yks
         muz8JvAdrM8R9+qmWsTn3ezat85rsF/ikafeZIjf1Uju6uaeD5wodfebHc3XUdHiGpCF
         3u+icslx84b7/1ygkuXOwMM4m67iK2rf6pw5pM4LjcnaeHbTHOK5V3/UuiTr6R6BC+UU
         U77aOI2XCAU67DzNPa3WGivFid55Uy7Dp0aRXojnptduWguqgTY5o95FBWFduNZpSERL
         Dhfw==
X-Gm-Message-State: ANoB5pnR5lwHFNDJYhY+Ryl0XuOhk5EYYIgqmdzyFpL5YC+5R4EC4qtH
        Q7ydUZVXNs+3QkD/gl9LKlvjjhsnR/YwPw==
X-Google-Smtp-Source: AA0mqf4RcSOX8BzWZvef3/rhkSC3lI78SUp/kX4xqPnhbCEp/4hNeep6gDAalJKqBRoSBRxq21lYdQ==
X-Received: by 2002:a17:906:190d:b0:7bd:1f71:ee0e with SMTP id a13-20020a170906190d00b007bd1f71ee0emr581811eje.714.1669375750653;
        Fri, 25 Nov 2022 03:29:10 -0800 (PST)
Received: from fedora.. (dh207-98-224.xnet.hr. [88.207.98.224])
        by smtp.googlemail.com with ESMTPSA id f19-20020a17090631d300b007a1d4944d45sm1451996ejf.142.2022.11.25.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:29:09 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>, luka.perkov@sartura.hr
Subject: [PATCH] dt-bindings: watchdog: Convert GPIO binding to json-schema
Date:   Fri, 25 Nov 2022 12:29:04 +0100
Message-Id: <20221125112904.48652-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the DT binding for GPIO WDT to JSON schema.

Cc: luka.perkov@sartura.hr
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 ----------
 .../bindings/watchdog/gpio-wdt.yaml           | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
deleted file mode 100644
index 198794963786..000000000000
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
diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml b/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
new file mode 100644
index 000000000000..155dc7965e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/gpio-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO controlled watchdog
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+properties:
+  compatible:
+    const: linux,wdt-gpio
+
+  gpios:
+    maxItems: 1
+    description: GPIO connected to the WDT reset pin
+
+  hw_algo:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Algorithm used by the driver
+    oneOf:
+      - description:
+          Either a high-to-low or a low-to-high transition clears the WDT counter.
+          The watchdog timer is disabled when GPIO is left floating or connected
+          to a three-state buffer.
+        const: toggle
+      - description:
+          Low or high level starts counting WDT timeout, the opposite level
+          disables the WDT.
+          Active level is determined by the GPIO flags.
+        const: level
+
+  hw_margin_ms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Maximum time to reset watchdog circuit (in milliseconds)
+    minimum: 2
+    maximum: 65535
+
+  always-running:
+    type: boolean
+    description:
+      If the watchdog timer cannot be disabled, add this flag to have the driver
+      keep toggling the signal without a client.
+      It will only cease to toggle the signal when the device is open and the
+      timeout elapsed.
+
+required:
+  - compatible
+  - gpios
+  - hw_algo
+  - hw_margin_ms
+
+unevaluatedProperties: false
-- 
2.38.1

