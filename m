Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CE445B88E
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 11:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241576AbhKXKqO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 05:46:14 -0500
Received: from [113.204.237.245] ([113.204.237.245]:34584 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S241577AbhKXKqO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 05:46:14 -0500
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 172.28.114.216
        by cqmailgates with MailGates ESMTP Server V5.0(1213:0:AUTH_RELAY)
        (envelope-from <xt.hu@cqplus1.com>); Wed, 24 Nov 2021 18:42:24 +0800 (CST)
From:   Xiantao Hu <xt.hu@cqplus1.com>
To:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     wells.lu@sunplus.com, qinjian@cqplus1.com,
        Xiantao Hu <xt.hu@cqplus1.com>
Subject: [PATCH v2 2/2] dt-bindings: watchdog: Add Sunplus SP7021 WDT devicetree bindings documentation
Date:   Wed, 24 Nov 2021 18:41:49 +0800
Message-Id: <20211124104149.361019-3-xt.hu@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124104149.361019-1-xt.hu@cqplus1.com>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the documentation for the devicetree bindings of the Sunplus
SP7021 watchdog driver, found from SP7021 SoCs and newer.

Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
---
 .../bindings/watchdog/sunplus,sp7021-wdt.yaml | 47 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml b/Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml
new file mode 100644
index 000000000..bb728f298
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/sunplus,sp7021-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus SoCs Watchdog Device Tree Bindings
+
+maintainers:
+  - XianTao Hu <xt.hu@cqplus1.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: sunplus,sp7021-wdt
+
+  reg:
+    items:
+      - description: Base address and length of the watchdog registers
+      - description: Base address and length of the miscellaneous control registers
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog: watchdog@9c000630 {
+        compatible = "sunplus,sp7021-wdt";
+        reg = <0x9c000630 0x08>, <0x9C000274 0x04>;
+        clocks = <&clkc 0x24>;
+        resets = <&rstc 0x14>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f6a328772..d51f0cb1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17937,6 +17937,7 @@ SUNPLUS WATCHDOG DRIVER
 M:	Xiantao Hu <xt.hu@cqplus1.com>
 L:	linux-watchdog@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml
 F:	drivers/watchdog/sunplus_wdt.c
 
 SUPERH
-- 
2.33.1

