Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569B32C3ABD
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 09:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgKYIQZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 03:16:25 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:53917 "EHLO
        ACLMS1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgKYIQY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 03:16:24 -0500
X-Greylist: delayed 1488 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 03:16:22 EST
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS1.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te30c5b5260ac14014b1470@ACLMS1.advantech.com.tw>;
 Wed, 25 Nov 2020 15:08:07 +0800
Received: from localhost (124.9.5.81) by taipei08.ADVANTECH.CORP
 (172.20.0.235) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 25 Nov
 2020 15:08:03 +0800
From:   Shihlun Lin <shihlun.lin@advantech.com.tw>
To:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Campion Kang <campion.kang@advantech.com.tw>,
        Shihlun Lin <shihlun.lin@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: [RESEND PATCH v4 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0
Date:   Wed, 25 Nov 2020 15:07:41 +0800
Message-ID: <20201125070744.4651-3-shihlun.lin@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.9.5.81]
X-ClientProxiedBy: taipei09.ADVANTECH.CORP (172.20.0.236) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add DT binding schema for Advantech embedded controller AHC1EC0.

Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
---
 .../devicetree/bindings/mfd/ahc1ec0.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
new file mode 100644
index 000000000000..a73d1cf65a4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ahc1ec0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech Embedded Controller (AHC1EC0)
+
+maintainers:
+  - Shihlun Lin <shihlun.lin@advantech.com.tw>
+  - Campion Kang <campion.kang@advantech.com.tw>
+
+description: |
+  AHC1EC0 is one of the embedded controllers used by Advantech to provide several
+  functions such as watchdog, hwmon, brightness, etc. Advantech related applications
+  can control the whole system via these functions.
+
+properties:
+  compatible:
+    const: advantech,ahc1ec0
+
+  advantech,sub-dev-nb:
+    description:
+      The number of sub-devices specified in the platform.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  advantech,sub-dev:
+    description:
+      A list of the sub-devices supported in the platform. Defines for the
+      appropriate values can found in dt-bindings/mfd/ahc1ec0.h.
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 1
+    maxItems: 6
+
+  advantech,hwmon-profile:
+    description:
+      The number of sub-devices specified in the platform. Defines for the
+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+required:
+  - compatible
+  - advantech,sub-dev-nb
+  - advantech,sub-dev
+
+if:
+  properties:
+    advantech,sub-dev:
+      contains:
+        const: 0x3
+then:
+  required:
+    - advantech,hwmon-profile
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/ahc1ec0.h>
+    ahc1ec0 {
+        compatible = "advantech,ahc1ec0";
+
+        advantech,sub-dev-nb = <2>;
+        advantech,sub-dev = <AHC1EC0_SUBDEV_HWMON
+                             AHC1EC0_SUBDEV_WDT>;
+
+        advantech,hwmon-profile = <AHC1EC0_HWMON_PRO_UNO2271G>;
+    };
-- 
2.17.1

