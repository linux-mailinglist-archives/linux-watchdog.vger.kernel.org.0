Return-Path: <linux-watchdog+bounces-4310-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B7BB9861
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 16:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671EB3B38F5
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 14:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73D928B4F0;
	Sun,  5 Oct 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fTtkIPkZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0E28B3E7
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Oct 2025 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675487; cv=none; b=tDpKKfYR1qk1h9WsgVyIz4Q4g0Q9nZXf1JTvDtpTTwlW15OqK4Qep9Mhaa8qRD1etGui6dc1Jv569zb88vWybBslgvA6MaKFFjyx229KhO/am01dDah6NvkaAgPpgk/RcdSrYbsU1maRKrgo/jDy2kv8vZdGqQ6XMW6F2rlHQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675487; c=relaxed/simple;
	bh=1dw9EnxZssXm84X7znCYFBFt6pCFKlMPUMvgjeIFJw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXRQt/3Wu8iyaSUQoFAcFLe2ol9B3zo10mO6X0XAxwgIWO860bZDDIitUsbJwus/4KrhwgrZ9owN7w8D3jCO+j82tJgmRULjSUXLNNvtSNYdclMjewRLO4FdHyqkvfmW3aSznU7asF3P/YTxwdRnsZdYuu4m2GYJMSqB5NJjQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fTtkIPkZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0tQ/OHstzR4lm5JCUHvCQWZaBkXxF2Paq/Mm20zixsE=; b=fTtkIP
	kZCiPpJGOWsbA8T/JjoR/44/Wep6s4c42NNH+6CoBC9HquBMHxBXe1VsF/VQsidV
	KHzidxn4yu2/b2u3ZHm8YW+wdk9XWlMthszGKP/eJLzASxhiMV/JY8U6VMr0XuCN
	iotQRrzBOmHpCDKOKA6y6Bm9dgTtfdAxlWr8EXeN7WyDjCskXWvKcJ9RuB5zWXf1
	UZ2rHlsag5FV5Dbx803ApWXu/Aa8C/wAhdOhtAf1tySrBZTaEMezABMzLy+Iklr/
	bbIN42/7jppMYMY4npKKrf48N+HltKMyVHa6Xi9W+95pHnseGa1l0xTzEqGQNn2Q
	TtB1zCQK1O8niDsA==
Received: (qmail 1418884 invoked from network); 5 Oct 2025 16:44:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 16:44:41 +0200
X-UD-Smtp-Session: l3s3148p1@2QT8X2pA6NMujnsm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: watchdog: factor out RZ/A watchdog
Date: Sun,  5 Oct 2025 16:44:16 +0200
Message-ID: <20251005144416.3699-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* removed unneeded label from example (Thanks, Prabhakar)
* added tags from Guenter and Prabhakar (Thanks!)

 .../bindings/watchdog/renesas,rza-wdt.yaml    | 51 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  7 ---
 2 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
new file mode 100644
index 000000000000..ba922c3f7b10
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
+    watchdog@fcfe0000 {
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


