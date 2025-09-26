Return-Path: <linux-watchdog+bounces-4281-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC9BA379E
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 13:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AB81C245FC
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Sep 2025 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FB82E093B;
	Fri, 26 Sep 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gg1Uj4v7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1F261B6E
	for <linux-watchdog@vger.kernel.org>; Fri, 26 Sep 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885747; cv=none; b=qdzsn1ZKk0QP4Mx9P4wRZIhgWNbKLn3osJpGpfmxHlswS6+0qebYslWo1AmlmuLwemdoC1ZTGPEs+4TRFsqx91Iuvj2+/UuuqkQNfmXn4vUfyZCZVSLQpeARG2M3RLGqZO+5pgetlXqBx14weN0xBGMk6m57oKiw+HV6P2gCrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885747; c=relaxed/simple;
	bh=K6RRZSIzeWh0L5BK/95GkzZU0b+YACtnWwaQndYE/y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahL1k/uqdxVe5BDYsvy8OQjCdkzIQxW+Di/1U4CEEFn53KclxgycZJME9ixQz6NNi9SyU50Ky0TySFKnX9jD0bXhmUd8alT18FoRkjEEUI/3sEgj/cflFb+b1XFIBl5wiWNv19EjnA2pKAsPIXjum7StzdISTKxtl35hpDZNALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gg1Uj4v7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1KtlphG7Dk+mTPLOBBnK/xtQcUhvx9wf/vRu4vDwvHU=; b=Gg1Uj4
	v7QDdeJGa6VV3FalpdZ/FmSzIsQFWpzWs1OfrFHxJkL6EnXdU5Fp9M+oL6J7m3oc
	DCRFsrpEAzn3GQ0tRpnsEa7zUPgaKhUGVlt1czrvyZ3GwN0U2Xz3VHyP22XOoS8e
	9Do5cR4P/mGAsbgQ9VPBYrVgkSRLvarN9gDCKXGW3V6gEUAXfeqc9sz9zy+g7hgu
	OHR/hq0FGH+yCXeSgmuSL4d3nIqXXAhGtG+lMycxHOUytK9epDC9DOo3lIjIL8Xj
	DpgrWQlN9nUTiiZQnpf2utE5oHDc+eeeyXWY8VX+ItldCtmfvg+aIGgVb7HpG/hA
	RJs+lNibOSd7M3RQ==
Received: (qmail 2235263 invoked from network); 26 Sep 2025 13:22:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 13:22:20 +0200
X-UD-Smtp-Session: l3s3148p1@rgjFf7I/nIsgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: watchdog: factor out RZ/A watchdog
Date: Fri, 26 Sep 2025 13:22:13 +0200
Message-ID: <20250926112218.28723-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas created different watchdog IPs but they are all handled in the
same binding documentation. This leads to a lot of conditional handling
which makes it unnecessarily hard to add new items. Factor out the RZ/A
watchdog to make handling easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/watchdog/renesas,rza-wdt.yaml    | 51 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  7 ---
 2 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
new file mode 100644
index 000000000000..7078218e0759
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rza-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/A Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r7s72100-wdt     # RZ/A1
+          - renesas,r7s9210-wdt      # RZ/A2
+      - const: renesas,rza-wdt       # RZ/A
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  timeout-sec: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r7s72100-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    wdt: watchdog@fcfe0000 {
+            compatible = "renesas,r7s72100-wdt", "renesas,rza-wdt";
+            reg = <0xfcfe0000 0x6>;
+            interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&p0_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index b6e60162c263..8a25e0c6271f 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -13,12 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - renesas,r7s72100-wdt     # RZ/A1
-              - renesas,r7s9210-wdt      # RZ/A2
-          - const: renesas,rza-wdt       # RZ/A
-
       - items:
           - enum:
               - renesas,r9a06g032-wdt    # RZ/N1D
@@ -140,7 +134,6 @@ allOf:
             contains:
               enum:
                 - renesas,r9a09g077-wdt
-                - renesas,rza-wdt
                 - renesas,rzn1-wdt
     then:
       required:
-- 
2.47.2


