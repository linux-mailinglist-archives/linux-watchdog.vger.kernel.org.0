Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B03742C176
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Oct 2021 15:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhJMNgm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Oct 2021 09:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbhJMNgk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Oct 2021 09:36:40 -0400
X-Greylist: delayed 323 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Oct 2021 06:34:36 PDT
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BCBC061570
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 06:34:36 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:ca:6d5e:c3e3:69a5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id BB686260DB6;
        Wed, 13 Oct 2021 15:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1634131750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9quWZ8YHP7VWy3kgfrQaKTOu8JfgXuV1KlEa02iZIG0=;
        b=oDF1ZZk0MyjOCG2DK3xy2OFg79aNQDMKOYkgA/CzQ8bhnONG7Ff98mLh9sJNF2WVijKSY/
        GlQuBD2hEhaNULoiwHmlyiKkA4bk+94EE/95IGHb2hGPL1PI85/vFUyo+P5LjgblZWd4rj
        Xu1Wu/XCGwT2th9wdtcjvgx8HaudDbh8mDulLRQVJNpz3WTmpdOpBeEL7HuTf8FQPmBIF5
        4dD4TIyUsxPn1hqYzZ8gc8thbkafCl2s5GPnPCJIPZReyyTylLTZyY/DAIMutbCsnWrG60
        EjxWp3MqN5d+FtTlUxEYmnjEsq8C9iT0uvTAC0rIm0G9zPN6ul6FQSPpYni/iQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 1/2] dt-bindings: watchdog: Realtek Otto WDT binding
Date:   Wed, 13 Oct 2021 15:28:59 +0200
Message-Id: <c00b96185441462557cf2c12db96300f18744353.1634131707.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634131707.git.sander@svanheule.net>
References: <cover.1634131707.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a binding description for Realtek's watchdog timer as found on
several of their MIPS-based SoCs (codenamed Otto), such as the RTL838x
and RTL839x series of switch SoCs.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 .../bindings/watchdog/realtek,otto-wdt.yaml   | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
new file mode 100644
index 000000000000..b962fd1229ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
@@ -0,0 +1,89 @@
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

