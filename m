Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC3BDDC3B
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2019 06:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfJTEI2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Oct 2019 00:08:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:37106 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbfJTEI2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Oct 2019 00:08:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 10F15AC8F;
        Sun, 20 Oct 2019 04:08:26 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: watchdog: realtek: Convert RTD119x to schema
Date:   Sun, 20 Oct 2019 06:08:10 +0200
Message-Id: <20191020040817.16882-2-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191020040817.16882-1-afaerber@suse.de>
References: <20191020040817.16882-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the Realtek watchdog binding to a YAML schema.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2: New
 
 .../bindings/watchdog/realtek,rtd119x.txt          | 17 ----------
 .../bindings/watchdog/realtek,rtd119x.yaml         | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
deleted file mode 100644
index 05653054bd5b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Realtek RTD1295 Watchdog
-========================
-
-Required properties:
-
-- compatible :  Should be "realtek,rtd1295-watchdog"
-- reg        :  Specifies the physical base address and size of registers
-- clocks     :  Specifies one clock input
-
-
-Example:
-
-	watchdog@98007680 {
-		compatible = "realtek,rtd1295-watchdog";
-		reg = <0x98007680 0x100>;
-		clocks = <&osc27M>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
new file mode 100644
index 000000000000..5d92cfdfd046
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/realtek,rtd119x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Realtek RTD1295 Watchdog
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: realtek,rtd1295-watchdog
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
+	watchdog@98007680 {
+		compatible = "realtek,rtd1295-watchdog";
+		reg = <0x98007680 0x100>;
+		clocks = <&osc27M>;
+	};
+...
-- 
2.16.4

