Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFF5C97D48
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 16:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbfHUOim (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 10:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728724AbfHUOil (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 10:38:41 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 516802339F;
        Wed, 21 Aug 2019 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566398320;
        bh=eJ9mdPF8bwcHy4e3Y3EhyW1YNP3Drr6jk1OFNQOt26M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E3D/uYAZ34F2zDSbWxjIo+CVyv99LkqXGoPzJTIODaDjBJeClgDniqOfhC2hpKVsR
         ROPzYj1mg5WkDCYj94K0Knitx4SksK7nlMoP51Jq1TxSej3vOFGPSacA2zxTjzHdeg
         IW0mOlUiALBGrM3INz8L/UHV004hCKBvhBSZWOnY=
From:   Maxime Ripard <mripard@kernel.org>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH RESEND v2 2/6] dt-bindings: watchdog: Convert Allwinner watchdog to a schema
Date:   Wed, 21 Aug 2019 16:38:31 +0200
Message-Id: <20190821143835.7294-2-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821143835.7294-1-mripard@kernel.org>
References: <20190821143835.7294-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The Allwinner SoCs have a watchdog supported in Linux, with a matching
Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v1:
  - Use generic watchdog schema
  - Use unevaluatedProperties instead of additionalProperties
---
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 48 +++++++++++++++++++
 .../bindings/watchdog/sunxi-wdt.txt           | 22 ---------
 2 files changed, 48 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
new file mode 100644
index 000000000000..dc7553f57708
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/allwinner,sun4i-a10-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Watchdog Device Tree Bindings
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-wdt
+      - const: allwinner,sun6i-a31-wdt
+      - items:
+          - const: allwinner,sun50i-a64-wdt
+          - const: allwinner,sun6i-a31-wdt
+      - items:
+          - const: allwinner,sun50i-h6-wdt
+          - const: allwinner,sun6i-a31-wdt
+      - items:
+          - const: allwinner,suniv-f1c100s-wdt
+          - const: allwinner,sun4i-a10-wdt
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    wdt: watchdog@1c20c90 {
+        compatible = "allwinner,sun4i-a10-wdt";
+        reg = <0x01c20c90 0x10>;
+        timeout-sec = <10>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
deleted file mode 100644
index e65198d82a2b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Allwinner SoCs Watchdog timer
-
-Required properties:
-
-- compatible : should be one of
-	"allwinner,sun4i-a10-wdt"
-	"allwinner,sun6i-a31-wdt"
-	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
-	"allwinner,sun50i-h6-wdt","allwinner,sun6i-a31-wdt"
-	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-
-Example:
-
-wdt: watchdog@1c20c90 {
-	compatible = "allwinner,sun4i-a10-wdt";
-	reg = <0x01c20c90 0x10>;
-	timeout-sec = <10>;
-};
-- 
2.21.0

