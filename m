Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710CD2A244D
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 06:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgKBF02 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 00:26:28 -0500
Received: from mga04.intel.com ([192.55.52.120]:62071 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgKBF02 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 00:26:28 -0500
IronPort-SDR: TDgHEtgmGq2XcKFgzF/RRpz/ry0HMGtlXP5TQrfdd+SZS8TiDo42EepBPEcuaByNTn5FVeECd4
 rHOvi5M/K7lA==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="166245956"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="166245956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2020 21:26:27 -0800
IronPort-SDR: BT9VN+EsZ98PEuZRKskqwWhTFAhTmGQrWVeJvkRLJmjc5ECbJDc0BfIG+xyJLXKfdSyUHaJ4sD
 pOiKi3pcdzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="319953381"
Received: from ubuntu18.png.intel.com ([10.88.229.38])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2020 21:26:24 -0800
From:   vijayakannan.ayyathurai@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        vijayakannan.ayyathurai@intel.com
Subject: [PATCH v1 2/2] dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
Date:   Mon,  2 Nov 2020 13:23:12 +0800
Message-Id: <3aa5d9e2031b4646b7f0c9831f4ea9cafffb2691.1604292525.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
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
index 000000000000..494c6d70d9af
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
+ - Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
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

