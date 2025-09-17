Return-Path: <linux-watchdog+bounces-4255-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F6B8165F
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 20:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5262A466929
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 18:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B35F3016E5;
	Wed, 17 Sep 2025 18:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RzxED2Ap"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF473002CD
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Sep 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758135426; cv=none; b=QqXchXHvyvENpHOEF/LKzYIoiMF+l+2ZtoGvnLvE0LfBhFMq4HrOT6KfSeBsMWHtfNA+QLbbAPQiAtNEI1RMI0y675x7GW0x6JkIRxE8auv9LVzkTAb7M7Z9UolnUfXzJmbfSptZid4W0jlpDKDWViCVeLaBzhb1W7B4fLjp4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758135426; c=relaxed/simple;
	bh=p3Vbvzk4K1zMNAJaBx62/lsgS/ONVnkGAOs4Y8Y9Lf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNxV2nL6al1hUIL7tUxjyni63oBeF5frtcZ7xURCak7uzlsAICHYPdpNk7Wibuacu3Wv9khMextPXZUb+OAtnXdaHhMyVK0szvVKiZehn+iEC+r1PYqcG2/xK5FIztsWpCqwdySbBIHQwGgRR1xqZiGsp/3qqA33QYnIKPc7OMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RzxED2Ap; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aPcu/Qvb4mQCH+fhNwogPuLlfAX3eMQrDYoaAmyyPUo=; b=RzxED2
	ApziTYXY72bHWW8lCoggWZ9a0ugaXz/r6KeuvxWar9jnxA2bjk5ROuGS4z00Wq+D
	Qt00ycTXM0vYw70ubADB7D15mhuzPxbsfjCRoZPxXLl9aVcUJ+NCssPNCyE7aDem
	lDt17H/hh1LFGMhQb5PrQUQXDvThexY9CkJV7PTpxfI2sQNQwJ7sG4abIWxZq0Qu
	ihffTT3gGj2rCF6B6eOwHVNnrV+7YkQXNzu+Q/85a7ImCjqbVONVx4kJnP1fWN9s
	k60XYNfnbdClKoQGKnTxyuykwjEX/j8aMEEyFvg+L0hxiKAIKufjGAA0yonhOPA/
	cUmGL3B1DPdkOqUg==
Received: (qmail 3239019 invoked from network); 17 Sep 2025 20:57:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 20:57:00 +0200
X-UD-Smtp-Session: l3s3148p1@8H8szQM/cMUujnvK
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
Subject: [PATCH 1/2] dt-bindings: watchdog: Add Renesas WWDT
Date: Wed, 17 Sep 2025 20:56:48 +0200
Message-ID: <20250917185651.12428-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
References: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
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

Passes the binding check here.

 .../bindings/watchdog/renesas,wwdt.yaml       | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
new file mode 100644
index 000000000000..921713dd40fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,wwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Window Watchdog Timer (WWDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a779g0-wwdt  # V4H
+      - const: renesas,rcar-gen4-wwdt
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
+      - description: Bus clock
+      - description: Counting clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: cnt
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    wwdt0: watchdog@ffc90000 {
+            compatible = "renesas,r8a779g0-wwdt",
+                         "renesas,rcar-gen4-wwdt";
+            reg = <0xffc90000 0x10>;
+            interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pretimeout", "error";
+            clocks = <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>,
+                     <&cpg CPG_CORE R8A779G0_CLK_R>;
+            clock-names = "bus", "cnt";
+            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+            resets = <&cpg 1200>;
+    };
-- 
2.47.2


