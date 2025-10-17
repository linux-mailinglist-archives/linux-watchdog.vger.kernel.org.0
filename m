Return-Path: <linux-watchdog+bounces-4397-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6309BBE805F
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 12:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020C0405092
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 10:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9176731196C;
	Fri, 17 Oct 2025 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ILlrFCRk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA163115AE
	for <linux-watchdog@vger.kernel.org>; Fri, 17 Oct 2025 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696172; cv=none; b=TRkytzUJvsWM6eQxXzIILjUbWdoPKRwR0iwu147WToDq4LjVbpOWU36U9+fwaS/mv6prhetCllU5wNwWJf8WU9Y7rerzJ1upxMzL3aeFSZi/xYTgYX65QFDFTtn0TlP2/H0lvh4ryfW1sCYUFziFBB+W6pleC2Qfo/Qt2zA/NsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696172; c=relaxed/simple;
	bh=oQ8SCWZQEBIfmxQVxEY7YNG34/7vTLZHbqtvIQoYtjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSH3kQU7Kx8JfFJbKvTjNVrAmgS4qh28vR+vlQ9SXc2TaKsmA/7juQ4dfLScHzcBk3JpZN4KUl007R1VGahLo1nbFikfva6iHXbxxz5x3ENOzZp45fwXMzGFuGidEOvgMeu5xtPrVAZI2oJ84uMTR2JQXAvKhNXkvfZFDQSpYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ILlrFCRk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oYGsv2a47Wdb2vciR/5lOObvSiGfaD428rdYufYmWKE=; b=ILlrFC
	RkzFt1wzSZHEHkvDSF7Eunc1QlAtfMYXrIXgDuoQhSeXoPrW6yZIzSWAAY6IIAR6
	jYFzFVuOqsPbK0rV4g4H9ZsvZf3SA/7OCSDxBODrwK9vcHBMx2d8AEbVih3VEgTV
	FfC/ATtVImOike9o9tUb/2PRmyd0ZsgFJtQVLoUTjnZG6zqWStL9n1KHQsupoPSt
	Fh1ejAf3eS5yGV2jyEy9qko64z+afJMEaaaZbxlbfqAf0x0b+Zw2oD+JKtQS6wwI
	BTUfPtitBgrPUCii48SDKgmpeYwXpR/0sBxUojVZDIikZ08mquBu/AU66rxZLYYM
	/EW4IGMMBI/m/yYw==
Received: (qmail 4183299 invoked from network); 17 Oct 2025 12:16:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 12:16:06 +0200
X-UD-Smtp-Session: l3s3148p1@jQCFBVhBbMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: watchdog: Add Renesas WWDT
Date: Fri, 17 Oct 2025 12:15:48 +0200
Message-ID: <20251017101549.4275-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
References: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Window Watchdog Timer found on Renesas R-Car SoCs from late
Gen3 onwards.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Note: Despite the name, V3U is considered to be a Gen4 SoC.

Changes since v2:

* none

Changes since v1:

* support not only V4H but all Gen3/4 SoCs having this WWDT
* handle the two-resets exception for V3U and S4
* switch order of clocks, so it is the same as for the resets
  (for resets, "cnt" is always present and "bus" is optional)
* rename the file to match the base compatible
* require interrupts and resets
* drop unneeded label from the example

 .../watchdog/renesas,rcar-gen3-wwdt.yaml      | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
new file mode 100644
index 000000000000..ffafe9a6d3f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rcar-gen3-wwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Window Watchdog Timer (WWDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a77970-wwdt  # R-Car V3M
+              - renesas,r8a77980-wwdt  # R-Car V3H
+          - const: renesas,rcar-gen3-wwdt
+
+      - items:
+          - enum:
+              - renesas,r8a779a0-wwdt  # R-Car V3U
+              - renesas,r8a779f0-wwdt  # R-Car S4
+              - renesas,r8a779g0-wwdt  # R-Car V4H
+              - renesas,r8a779h0-wwdt  # R-Car V4M
+          - const: renesas,rcar-gen4-wwdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Pretimeout, 75% of overflow reached
+      - description: Error occurred
+
+  interrupt-names:
+    items:
+      - const: pretimeout
+      - const: error
+
+  clocks:
+    items:
+      - description: Counting clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: cnt
+      - const: bus
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: cnt
+      - const: bus
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+allOf:
+  - $ref: watchdog.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a779a0-wwdt
+              - renesas,r8a779f0-wwdt
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@ffc90000 {
+            compatible = "renesas,r8a779g0-wwdt",
+                         "renesas,rcar-gen4-wwdt";
+            reg = <0xffc90000 0x10>;
+            interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pretimeout", "error";
+            clocks = <&cpg CPG_CORE R8A779G0_CLK_R>,
+                     <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>;
+            clock-names = "cnt", "bus";
+            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+            resets = <&cpg 1200>;
+            reset-names = "cnt";
+    };
-- 
2.47.2


