Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A283750CC
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhEFI16 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:27:58 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhEFI15 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:27:57 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee01666ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:16:26 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:16:25 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v7 3/7] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0
Date:   Thu, 6 May 2021 16:16:15 +0800
Message-ID: <20210506081619.2443-3-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 1B38579F38F01EBEE49300CCB3CF1722514C7D44DB791D6ADB295E52E9C1F6172000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add DT binding schema for Advantech embedded controller AHC1EC0.

Changed in v7:
	Fix the patch according to reviewer's comment:
	-remove inappropriate attributes: sub-dev-nb, sub-dev

Changed in v6:
	-rename dt-bindings/mfd/ahc1ec0.h to dt-bindings/mfd/ahc1ec0-dt.h
	 that found errors by bot 'make dt_binding_check'

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 .../devicetree/bindings/mfd/ahc1ec0.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ahc1ec0.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
new file mode 100644
index 000000000000..1bc96933ce29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
@@ -0,0 +1,48 @@
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
+  functions such as watchdog, hwmon, brightness, GPIO, LED, etc. Advantech related
+  applications can control the whole system via these functions.
+
+properties:
+  compatible:
+    const: advantech,ahc1ec0
+
+  advantech,hwmon-profile:
+    description:
+      The number of sub-devices specified in the platform. Defines for the
+      hwmon profiles can found in dt-bindings/mfd/ahc1ec0-dt.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  advantech,has-watchdog:
+    description:
+      Some implementations of the EC include a watchdog used to monitor the
+      system. This boolean flag is used to specify whether this watchdog is
+      present or not. Default is true, otherwise set to false.
+    type: boolean
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/ahc1ec0-dt.h>
+    ahc1ec0 {
+        compatible = "advantech,ahc1ec0";
+
+        advantech,hwmon-profile = <AHC1EC0_HWMON_PRO_UNO2271G>;
+        advantech,has-watchdog;
+    };
-- 
2.17.1

