Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEF62FA00B
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 13:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404129AbhARMkC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 07:40:02 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:57631 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404051AbhARMjs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 07:39:48 -0500
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te423a07c0bac1401c812dc@ACLMS4.ADVANTECH.CORP>;
 Mon, 18 Jan 2021 20:37:43 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 20:37:58 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v6 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0
Date:   Mon, 18 Jan 2021 20:37:46 +0800
Message-ID: <20210118123749.4769-3-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210118123749.4769-1-campion.kang@advantech.com.tw>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: F25FC035AA96CB49ADD0029C056A6E40CEEB0EAC20D8CBE35F14B54E244B543C2000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add DT binding schema for Advantech embedded controller AHC1EC0.

Changed since V5:
	- rename dt-bindings/mfd/ahc1ec0.h to dt-bindings/mfd/ahc1ec0-dt.h
	that found errors by bot 'make dt_binding_check'

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 .../devicetree/bindings/mfd/ahc1ec0.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
new file mode 100644
index 000000000000..40af14bb9c0a
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
+      appropriate values can found in dt-bindings/mfd/ahc1ec0-dt.h.
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 1
+    maxItems: 6
+
+  advantech,hwmon-profile:
+    description:
+      The number of sub-devices specified in the platform. Defines for the
+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
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
+    #include <dt-bindings/mfd/ahc1ec0-dt.h>
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

