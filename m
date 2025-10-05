Return-Path: <linux-watchdog+bounces-4311-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5542FBB9870
	for <lists+linux-watchdog@lfdr.de>; Sun, 05 Oct 2025 16:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0298718965EE
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Oct 2025 14:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5E328B4FA;
	Sun,  5 Oct 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MtaFnIbz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A71E98EF
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Oct 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759675491; cv=none; b=idKWMpeqjuK1uOKTJt82NkfWw0MeNmBm4b3vOWE3uIVTpRIvWCXpZnhJrdWimeV0bwzbgNHh0ARtByT6YQ80O/d4C5aHZzfqRJZ2MzDCy8pAuh/FojS3SHbiS4zELtk9FTXSBdDH5R75/IlKrHHPUpif/aGLRSnYDr1tL5CSfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759675491; c=relaxed/simple;
	bh=R3BsoU5vTur4gpERCs56DCpVw4WkYldf14s87O3YRP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o157EOkb2llIhi7UTUmBCaapu/U6Y5L2MbsIm6Pp2cTYkI7z5iy4YJZJRP+Al71XxLuDYBkmrbMoeDUuGYNMr2ujfrDDhs0CSF7mu6F8xW2ikhIhjifYYfCVQlX87xoqRGD8XFZW8VPF1EojksH+5aPB39+Q4KRkBIYdbfRPDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MtaFnIbz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=KKtWrj5+TwXxN5YgYsSbfMrTMYpXMKzFJlf871v63L0=; b=MtaFnI
	bzglLe+aOMn/t0d1KV7Rz7PsWse8Iz6LK/ykvItsYQSkWlvc+rPU2wFIBQP5/qRp
	+uKJT1zVbitkDkK6spmA4oRYuvt6VMQ+88B3ymoENc92Zj252i/oziK7IHmw+bed
	tijrvRVm5WfjyO/Y0xKPM+bTehuyTSWoW7C80LreIbQbIiOBiOTIPL/l2UUcHVf5
	b1WVCc7Xhxumxluyl02XQMQJFXoj66fMEPGVzBKOp93EG46rNJiWiTGFDc5qDjUn
	KhI3X9VHCGP6njfeSyIWQ6xT4NfjBQPwX6ucIB/xG/UHpw42gc3AR10ZIObi8fEX
	qVGAyglsgqeL8SLA==
Received: (qmail 1418943 invoked from network); 5 Oct 2025 16:44:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2025 16:44:42 +0200
X-UD-Smtp-Session: l3s3148p1@kJIMYGpA7NMujnsm
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
Subject: [PATCH v2 2/4] dt-bindings: watchdog: factor out RZ/N1 watchdog
Date: Sun,  5 Oct 2025 16:44:17 +0200
Message-ID: <20251005144416.3699-8-wsa+renesas@sang-engineering.com>
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
which makes it unnecessarily hard to add new items. Factor out the RZ/N1
watchdog to make handling easier.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* turned N1D compatible into a const (Thanks, Prabhakar)
* removed unneeded label from example (Thanks, Prabhakar)
* added tags from Guenter and Prabhakar (Thanks!)

 .../bindings/watchdog/renesas,rzn1-wdt.yaml   | 48 +++++++++++++++++++
 .../bindings/watchdog/renesas,wdt.yaml        |  6 ---
 2 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
new file mode 100644
index 000000000000..0efc9a92fa51
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/renesas,rzn1-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 Watchdog Timer (WDT) Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-wdt # RZ/N1D
+      - const: renesas,rzn1-wdt      # RZ/N1
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@40008000 {
+            compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
+            reg = <0x40008000 0x1000>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&sysctrl R9A06G032_CLK_WATCHDOG>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 8a25e0c6271f..12ba07781763 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -13,11 +13,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - items:
-          - enum:
-              - renesas,r9a06g032-wdt    # RZ/N1D
-          - const: renesas,rzn1-wdt      # RZ/N1
-
       - items:
           - enum:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
@@ -134,7 +129,6 @@ allOf:
             contains:
               enum:
                 - renesas,r9a09g077-wdt
-                - renesas,rzn1-wdt
     then:
       required:
         - power-domains
-- 
2.47.2


