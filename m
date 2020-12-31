Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50652E8010
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Dec 2020 13:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgLaMw2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 07:52:28 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:52393 "EHLO
        aclms1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgLaMw2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 07:52:28 -0500
X-Greylist: delayed 686 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Dec 2020 07:52:09 EST
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS2.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te3c6f00f20ac14014b2650@ACLMS2.ADVANTECH.CORP>;
 Thu, 31 Dec 2020 20:39:57 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 31 Dec
 2020 20:40:07 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-hwmon@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v5 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0
Date:   Thu, 31 Dec 2020 20:39:45 +0800
Message-ID: <20201231123948.10473-3-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201231123948.10473-1-campion.kang@advantech.com.tw>
References: <20201231123948.10473-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: aclcas3.ADVANTECH.CORP (172.20.1.12) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: FE1F84DD2CDD6A7C207A62C48E14381FFEF41B577E08027541A82567DAE4FA542000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add DT binding schema for Advantech embedded controller AHC1EC0.

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 .../devicetree/bindings/mfd/ahc1ec0.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
new file mode 100644
index 000000000000..da57d782ea77
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ahc1ec0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech Embedded Controller (AHC1EC0)
+
+maintainers:
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

