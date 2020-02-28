Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 989611739BD
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2020 15:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgB1OYH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Feb 2020 09:24:07 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55412 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgB1OYF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Feb 2020 09:24:05 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SENj87077118;
        Fri, 28 Feb 2020 08:23:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582899825;
        bh=QpJEH4WZMRrWIDHS2nhaRKdfdtwL/3UibZ6zrK3AhVc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HFYB1ZFKge2lEMzV3raMca4gQ/SfxnAhrm5Ikyvd7k7huYTJ+jCLmohkibbbvMB5t
         JdBnYDyerM6shHCRi2oxaxUZhE6aqiwg7p1ci8ZMpKK6NjE4ol2slpwSks2vI1N73d
         gR7/a6VasnO/kvNh0QfTfsf8fhXK5qD2dKavtPR0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SENj9T031710
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Feb 2020 08:23:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 08:23:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 08:23:44 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SENf3x049600;
        Fri, 28 Feb 2020 08:23:43 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: watchdog: Add support for TI K3 RTI watchdog
Date:   Fri, 28 Feb 2020 16:23:28 +0200
Message-ID: <20200228142331.13716-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228142331.13716-1-t-kristo@ti.com>
References: <20200228142331.13716-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
used to implement a windowed watchdog functionality. Windowed watchdog
will generate an error if it is petted outside the time window, either
too early or too late.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 .../bindings/watchdog/ti,rti-wdt.yaml         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
new file mode 100644
index 000000000000..3813f59fb6c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/ti,rti-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 SoC Watchdog Timer
+
+maintainers:
+  - Tero Kristo <t-kristo@ti.com>
+
+description: |+
+  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
+  Interrupt) IP module. This timer adds a support for windowed watchdog
+  mode, which will signal an error if it is pinged outside the watchdog
+  time window, meaning either too early or too late. The error signal
+  generated can be routed to either interrupt a safety controller or
+  to directly reset the SoC.
+
+properties:
+  compatible:
+    enum:
+      - ti,rti-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    /*
+     * RTI WDT in main domain on J721e SoC. Assigned clocks are used to
+     * select the source clock for the watchdog, forcing it to tick with
+     * a 32kHz clock in this case.
+     */
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    main_rti0: rti@2200000 {
+        compatible = "ti,rti-wdt";
+        reg = <0x0 0x2200000 0x0 0x100>;
+        clocks = <&k3_clks 252 1>;
+        power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
+        assigned-clocks = <&k3_clks 252 1>;
+        assigned-clock-parents = <&k3_clks 252 5>;
+    };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
