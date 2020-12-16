Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5242DC6A1
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Dec 2020 19:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731337AbgLPSg5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 13:36:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:48070 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731332AbgLPSg4 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 13:36:56 -0500
IronPort-SDR: odx9MbwZgg0e6Ya/3bDfRddV14MpUQnE1DKa9O+meUEgUwXz8Kb3G+Zka0LoWMTRgiXN+IrBfi
 e6nZAuQGVocQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="239208392"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="239208392"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 10:36:15 -0800
IronPort-SDR: p7YKccSrChP6fYv6vrFBQOW2hcwtc+fdIRvqQIotaACInMxxqC64AG6hYc0zEUza7Z/9k8qQT+
 kSCT1dyzD9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="488645289"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2020 10:36:13 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com, chen.yong.seow@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v4 1/2] dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
Date:   Thu, 17 Dec 2020 02:32:47 +0800
Message-Id: <8c4dad4fb8ba644607aa9379d5ec70d8707d7e75.1608141131.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>

Add Device Tree binding document for Watchdog IP in the Intel Keem Bay SoC.

Acked-by: Mark Gross <mgross@linux.intel.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

