Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FCC4450C5
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Nov 2021 10:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhKDJDC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Nov 2021 05:03:02 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:37246 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhKDJC4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Nov 2021 05:02:56 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:bf08:f0c1:3ec1:1bfc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8509D26C25D;
        Thu,  4 Nov 2021 10:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1636016414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/pod07EU/dO9gkwNUDL95GTzJ3wqD5S57lkIkq6n7Uw=;
        b=M3BULv+Ywm/DVXhml4TBHk+RNKJDeYYUgDwcSbdbXhh90q/XjGJySvS+Htc0t9oRl7A6a7
        HxYtq1xY530sMj67Q6CeeDELRqfY+dIFGMQtGmptKFhlUbidyh6Ti7QLcXi4lMvl2BEZNZ
        X1UAU21ZjZudjbetapH1vyZspx4QlNxIhEs16vC/21nOZgTHgc+EMUc4u5+gez/ARzjTJT
        IPHjh1nefjSlbw4qDntupi/gQps1Y6m/anaWJ2z5V0Wqje8kqGoeo3d2oKtjrL+6zVC3FY
        KpubVASKNK2mu2AFtatt7MuPVo8YWxWyrvIxALSDACfWaY1RNvzDe4NI6rA4dQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Realtek Otto WDT binding
Date:   Thu,  4 Nov 2021 09:59:52 +0100
Message-Id: <20211104085952.13572-2-sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211104085952.13572-1-sander@svanheule.net>
References: <20211104085952.13572-1-sander@svanheule.net>
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

--
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
2.31.1

