Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A2F182CE8
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Mar 2020 10:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCLJ6z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Mar 2020 05:58:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37998 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgCLJ6z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Mar 2020 05:58:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wT4i003925;
        Thu, 12 Mar 2020 04:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584007109;
        bh=7XS2rSf9do7vLAHsmt3lKnrTGG4y/3+r+6Om922Y3Ys=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=AyulOqRngq8OXqFkwBn72rJjV6K5rT5qbX/iVnHNLIz5yACZwBsOR2Lg3TwtVIypd
         C8gslIozumgOF1UnkY2PbNjv/HE0PlH6Ka7tpJfDt7gARUk8XqX+J7wU1mM78fbN8n
         MOyhfhBltWprcY+eCgr6vHS5ECp87y1Vw+0ZZCYQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02C9wTZZ104222
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Mar 2020 04:58:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 04:58:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 04:58:28 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wOR6089783;
        Thu, 12 Mar 2020 04:58:26 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv4 1/4] dt-bindings: watchdog: Add support for TI K3 RTI watchdog
Date:   Thu, 12 Mar 2020 11:58:05 +0200
Message-ID: <20200312095808.19907-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312095808.19907-1-t-kristo@ti.com>
References: <20200312095808.19907-1-t-kristo@ti.com>
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
v4:
  * changed license to dual
  * added documentation for missing properties
  * added ref to watchdog.yaml
  * renamed main_rti0 to watchdog0 in example

 .../bindings/watchdog/ti,rti-wdt.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
new file mode 100644
index 000000000000..e83026fef2e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+description:
+  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
+  Interrupt) IP module. This timer adds a support for windowed watchdog
+  mode, which will signal an error if it is pinged outside the watchdog
+  time window, meaning either too early or too late. The error signal
+  generated can be routed to either interrupt a safety controller or
+  to directly reset the SoC.
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - ti,j7-rti-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clocks-parents:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
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
+    watchdog0: rti@2200000 {
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
