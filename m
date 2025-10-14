Return-Path: <linux-watchdog+bounces-4382-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75BBD9084
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 13:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968D73A3EA2
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Oct 2025 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BC730C61D;
	Tue, 14 Oct 2025 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dZ9ek50b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE282FE055
	for <linux-watchdog@vger.kernel.org>; Tue, 14 Oct 2025 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441430; cv=none; b=OXt05sHGE8brspz2LiffsnO7FNSFjv97/C9A3S9plUbMmyjIGSD0cIL5Gc12bgPXMsjZOAFntAZmMbH5B8rVMSj1WIw8sKpEQp42QT80ZQ7aoaay+IjvlpTQul6+7dYKuzYRuxw1zF6WDjQYA9HM3OCqTESvQpUSMeZnKVsU9QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441430; c=relaxed/simple;
	bh=xKTYsXPMGOMKMV/jt+4Z9kaeJjZ4nbFhnUfdLzk38tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jabo4D8K+/aecxWfEddi4uaWI2UZVVwddZW9Jlv+79khTpLz9vwT1gJfWXyCqSnFxJYgRpd5McVXWTqu25e6M4HgZ9EJzdLiVwxpEI0s1GE7ub954Qrik6vuQluzMHzIe/PYTT26ANCGYPf0GBOIT937/md4fof19tuR5ucsET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dZ9ek50b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=m2Ce9z697ssvL8uDRJI2+5HkTIC8S6bwRAdA0cAsyWg=; b=dZ9ek5
	0brAbd80iuMBUeh0ftOxJgK2OsXYBeX7Mv+do0fVcvEcG7KaT+RTiyrGhMg4PgJW
	o4Ga+M92oOSWkHGXsoNcUTwpXq1eYJu+ZTF1b+YXTv8joNuHXZ/NGQphLlupitLE
	ivipDgVj15IgP1Oz/PlHmHFapR3tPBYwnFkXsuziOnFmo5dTnEeIfxonbioiZT0N
	aQKyIOMUaPHm4WT9I4k97jXjI1YEqEh0LoWvhKVHqvJzY/ua0oiOy9211MXFW2eq
	feBxC6zRRLJPLDAUwtEi9WFKO7+rjKkxOKWVdNzjhV7OXaZAkPLLfRdjzEbWu1YP
	GELhXyAkA42NJW7Q==
Received: (qmail 2943660 invoked from network); 14 Oct 2025 13:30:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 13:30:18 +0200
X-UD-Smtp-Session: l3s3148p1@6CphtRxByN4gAwDPXwQHAL/S9V79e5yL
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
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add Renesas WWDT
Date: Tue, 14 Oct 2025 13:29:53 +0200
Message-ID: <20251014112953.25712-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
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


