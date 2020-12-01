Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A51A2CA6C8
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Dec 2020 16:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390407AbgLAPPB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Dec 2020 10:15:01 -0500
Received: from mga17.intel.com ([192.55.52.151]:40961 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390196AbgLAPPA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Dec 2020 10:15:00 -0500
IronPort-SDR: 12fG4knu+0DifWo+BmUpmE7SAhb6THt3qZTP6gBu4B/0YbmWst29hv3hR2KQ1Yfts0EbY9X8y3
 IwkRocjT7WXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152672047"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="152672047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:14:02 -0800
IronPort-SDR: a0KysZT6sQuLQH8IIUgQfx7UPoR/Os9NDvsegeq32UJgef6ftYNxvKO9Rmv4/LJ1vvX0MchrY/
 ABFzevBnEZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="364774847"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2020 07:14:00 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v3 2/2] dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
Date:   Tue,  1 Dec 2020 23:10:34 +0800
Message-Id: <c3ffd4c2becada82c631ca035a3a1a8f0bd38dc8.1606833303.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1606833303.git.vijayakannan.ayyathurai@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Add Device Tree binding document for Watchdog IP in the Intel Keem Bay SoC.

Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Acked-by: Mark Gross <mgross@linux.intel.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../bindings/watchdog/intel,keembay-wdt.yaml  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
new file mode 100644
index 000000000000..1437ff8a122f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/intel,keembay-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Keem Bay SoC non-secure Watchdog Timer
+
+maintainers:
+  - Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
+
+properties:
+  compatible:
+    enum:
+      - intel,keembay-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: interrupt specifier for threshold interrupt line
+      - description: interrupt specifier for timeout interrupt line
+
+  interrupt-names:
+    items:
+      - const: threshold
+      - const: timeout
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #define KEEM_BAY_A53_TIM
+
+    watchdog: watchdog@2033009c {
+        compatible = "intel,keembay-wdt";
+        reg = <0x2033009c 0x10>;
+        interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "threshold", "timeout";
+        clocks = <&scmi_clk KEEM_BAY_A53_TIM>;
+    };
+
+...
-- 
2.17.1

