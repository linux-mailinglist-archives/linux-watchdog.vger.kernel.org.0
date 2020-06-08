Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F1F1F1291
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jun 2020 07:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgFHFvi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jun 2020 01:51:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:55798 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727905AbgFHFvi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jun 2020 01:51:38 -0400
IronPort-SDR: WUpWyfku+0hQkCrROXrV5HkZMx9UvrpTJLhlwGitt0IAQy8Zir+muy+YUmssFp40Z7npxfEr/k
 bmOyBWQdL8Ew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2020 22:51:36 -0700
IronPort-SDR: T08PTBvy0gmbb2ptjSJgeqp5fdIRUJ+0bHd7T/Qp6vvGbgWtGeNFvQOgWIXg3pRXpQz2R665JQ
 hsJwhiKiwDfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="258594814"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2020 22:51:34 -0700
From:   Dilip Kota <eswara.kota@linux.intel.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        robbh@kernel.org
Cc:     linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: intel: Add YAML Schemas for Watchdog timer
Date:   Mon,  8 Jun 2020 13:49:39 +0800
Message-Id: <ac89e289b79fec0a82d1dd060e17eeca024885d5.1591584255.git.eswara.kota@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1591584255.git.eswara.kota@linux.intel.com>
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
In-Reply-To: <cover.1591584255.git.eswara.kota@linux.intel.com>
References: <cover.1591584255.git.eswara.kota@linux.intel.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add YAML schemas for the watchdog timer on Intel Lightning
Mountain SoC.

Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
---
 .../bindings/watchdog/intel,lgm-gptc-wdt.yaml      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
new file mode 100644
index 0000000000000..83dc39a5090c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/intel,lgm-gptc-wdt.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/intel,lgm-gptc-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain Watchdog timer.
+
+maintainers:
+  - Dilip Kota <eswara.kota@linux.intel.com>
+
+description: |
+  Intel Lightning Mountain SoC has General Purpose Timer Counter(GPTC) which can
+  be configured as Clocksource, real time clock and Watchdog timer.
+  Each General Purpose Timer Counter has three timers. And total four General
+  Purpose Timer Counters are present on Lightning Mountain SoC which sums up
+  to 12 timers.
+  Lightning Mountain has four CPUs and each CPU is configured with one GPTC
+  timer as watchdog timer. Total four timers are configured as watchdog timers
+  on Lightning Mountain SoC.
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - intel,lgm-gptc-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Frequency clock
+      - description: Core clock
+
+  clock-names:
+    items:
+      - const: freq
+      - const: gptc
+
+  intel,wdt-rst-hndl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Watchdog timer registers handle
+
+  intel,timer-cfg:
+    description: Watchdog Timer id and CPU id
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 2
+        maxItems: 4
+        items:
+          minimum: 0
+          maximum: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - intel,wdt-rst-hndl
+  - intel,timer-cfg
+
+examples:
+  - |
+    watchdog@e2500000 {
+      compatible = "intel,lgm-gptc-wdt";
+      reg = <0xe2500000 0x10000>;
+      intel,wdt-rst-hndl = <&sysconf>;
+      clocks = <&cgu0 31>, <&cgu0 136>;
+      clock-names = "freq", "gptc";
+      timeout-sec = <30>;
+      intel,timer-cfg =  <1 0 2 1>;
+    };
-- 
2.11.0

