Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDDE45607C
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 17:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhKRQdF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 11:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbhKRQdF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 11:33:05 -0500
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91204C061748
        for <linux-watchdog@vger.kernel.org>; Thu, 18 Nov 2021 08:30:04 -0800 (PST)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:baf4:d6c5:5600:301])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 71C4027380A;
        Thu, 18 Nov 2021 17:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1637253002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6A23tSV9NOjt6Ur6i3xHCXM7ZwBmziSJt2dQR9X+5gY=;
        b=ARqucW6n2atuY+oQp9td7rOwgwVtXi0oFZuqzFg1cVE1YsqjuG0kIzi1vCtixpcla9NyTX
        En/QpN6mC8K4ILPyF6K6n3zd0sUHcyyJZftjJ7pkhN/Z5fpS7I9tY7MOtyZFklYn13y9V6
        YMe2MOgoR9vjYXfp7OKndGd2saFG3VqUhZNwqUQunOhF87/CqzHIQTN/eu+F4y4LdG+bwe
        DntA4QKPeeBzeUqAwZWX7azRCFo6eUoS7Jl2iDOtJXqI+cTs93vRZgzMhHc251lenuEVP9
        dM3QUvGZTyQzeNvyuKlnZxqQ5nYQJzpM57tFAKi7hHzpaPzObATn0p4AHUaAuQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: watchdog: Realtek Otto WDT binding
Date:   Thu, 18 Nov 2021 17:29:51 +0100
Message-Id: <d832d5b02976dd2c2674d46778f61e5cfcd9b651.1637252610.git.sander@svanheule.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637252610.git.sander@svanheule.net>
References: <cover.1637252610.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a binding description for Realtek's watchdog timer as found on
several of their MIPS-based SoCs (codenamed Otto), such as the RTL838x,
RTL839x, and RTL930x series of switch SoCs.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

---
v4:
- add Guenter's Reviewed-by tag

v2:
- add realtek,rtl9300-wdt compatible
- make interrupts property required
- add Rob's Reviewed-by tag
---
 .../bindings/watchdog/realtek,otto-wdt.yaml   | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
new file mode 100644
index 000000000000..11b220a5e0f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/realtek,otto-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Otto watchdog timer
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+
+description: |
+  The timer has two timeout phases. Both phases have a maximum duration of 32
+  prescaled clock ticks, which is ca. 43s with a bus clock of 200MHz. The
+  minimum duration of each phase is one tick. Each phase can trigger an
+  interrupt, although the phase 2 interrupt will occur with the system reset.
+  - Phase 1: During this phase, the WDT can be pinged to reset the timeout.
+  - Phase 2: Starts after phase 1 has timed out, and only serves to give the
+    system some time to clean up, or notify others that it's going to reset.
+    During this phase, pinging the WDT has no effect, and a reset is
+    unavoidable, unless the WDT is disabled.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtl8380-wdt
+      - realtek,rtl8390-wdt
+      - realtek,rtl9300-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: interrupt specifier for pretimeout
+      - description: interrupt specifier for timeout
+
+  interrupt-names:
+    items:
+      - const: phase1
+      - const: phase2
+
+  realtek,reset-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Specify how the system is reset after a timeout. Defaults to "cpu" if
+      left unspecified.
+    oneOf:
+      - description: Reset the entire chip
+        const: soc
+      - description: |
+          Reset the CPU and IPsec engine, but leave other peripherals untouched
+        const: cpu
+      - description: |
+          Reset the execution pointer, but don't actually reset any hardware
+        const: software
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+dependencies:
+  interrupts: [ interrupt-names ]
+
+examples:
+  - |
+    watchdog: watchdog@3150 {
+        compatible = "realtek,rtl8380-wdt";
+        reg = <0x3150 0xc>;
+
+        realtek,reset-mode = "soc";
+
+        clocks = <&lxbus_clock>;
+        timeout-sec = <20>;
+
+        interrupt-parent = <&rtlintc>;
+        interrupt-names = "phase1", "phase2";
+        interrupts = <19>, <18>;
+    };
+
+...
-- 
2.33.1

