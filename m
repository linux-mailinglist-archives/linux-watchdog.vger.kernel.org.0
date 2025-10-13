Return-Path: <linux-watchdog+bounces-4378-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EC1BD65E7
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Oct 2025 23:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C3419A09A8
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Oct 2025 21:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804C2F0C71;
	Mon, 13 Oct 2025 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdgp4rsk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC011EFFB7;
	Mon, 13 Oct 2025 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391102; cv=none; b=C9jgS81apnJ7cM0AlfADyil+fUv4+W+F3ywHpY3J/j5mSGLMppVWQJ2eXI66nWr+b31KatM2S1v80luiJWwTb2TDDGXUSaLMCXuq0lrHKXMqb4wTXwEnywhss9gtK6WP7DTgjP9HRQvG+zdPnDTREuaE6K1fxcV77XmsBEMsW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391102; c=relaxed/simple;
	bh=HtmEgH1eGnRP0drWUWZjF54Z3KTQ9fj5NWzBiBVCWrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txl9Nmp6cWCgTCUOQFacOMTr61XTXxIcq9SDup1vAQwx4QfqmPHPtcdWhoqatgSfxkboKigwied2Yz2H78DUDnPBM1gG3DqbaoVRVC06u4vYuiU9TJ208A4xWCxiAQQuHZ8Z8JfhkNj/PuFV693Y+eMDSmhl8tK/HMz5QfFpbxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdgp4rsk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F06C4CEE7;
	Mon, 13 Oct 2025 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760391102;
	bh=HtmEgH1eGnRP0drWUWZjF54Z3KTQ9fj5NWzBiBVCWrk=;
	h=From:To:Cc:Subject:Date:From;
	b=mdgp4rsk9SwGU3S8oV1qdM1fjFePs9aGjRCAYJgeXPZw7C9zhZHe4TaLr56XO0Yob
	 O44fIpv6Ujw9JRrgKayHRHZB+nCa93Inujv5ZtL+ihbK2G3E8K4JcA+C98GMw2thCA
	 Wrxl0G6HmpRLA3hlT3Lt7jcL7wYqKAXfcQ98RiIzf2MN163Uq8uqOa58wNExCCO4qu
	 fireKkodAaGFE5zY3u/oFP+FCAjpyHIaSwp1rFHK0ohr4KkIZ6z79cF8KLeutGx5dF
	 v9XOW3qQf4Tp9Eqfxoet2c4A9kaLb+7KoJlqt8KW6NZzKy1HtnnGxlI9D8EvXKbZL/
	 HB/xUzRqN5yCw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Convert TI OMAP to DT schema
Date: Mon, 13 Oct 2025 16:31:35 -0500
Message-ID: <20251013213136.693752-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI OMAP watchdog binding to DT schema format. The compatible
string list was incomplete. The "reg" and "interrupts" properties were
missing. "ti,hwmods" is also deprecated and not required.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/omap-wdt.txt | 15 ------
 .../bindings/watchdog/ti,omap2-wdt.yaml       | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/omap-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,omap2-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/omap-wdt.txt b/Documentation/devicetree/bindings/watchdog/omap-wdt.txt
deleted file mode 100644
index 1fa20e453a2d..000000000000
--- a/Documentation/devicetree/bindings/watchdog/omap-wdt.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-TI Watchdog Timer (WDT) Controller for OMAP
-
-Required properties:
-- compatible : "ti,omap3-wdt" for OMAP3 or "ti,omap4-wdt" for OMAP4
-- ti,hwmods : Name of the hwmod associated to the WDT
-
-Optional properties:
-- timeout-sec : default watchdog timeout in seconds
-
-Examples:
-
-wdt2: wdt@4a314000 {
-	compatible = "ti,omap4-wdt", "ti,omap3-wdt";
-	ti,hwmods = "wd_timer2";
-};
diff --git a/Documentation/devicetree/bindings/watchdog/ti,omap2-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,omap2-wdt.yaml
new file mode 100644
index 000000000000..693ea272185a
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ti,omap2-wdt.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP Watchdog Timer Controller
+
+maintainers:
+  - Aaro Koskinen <aaro.koskinen@iki.fi>
+  
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,omap2-wdt
+          - ti,omap3-wdt
+      - items:
+          - enum:
+              - ti,am4372-wdt
+              - ti,omap4-wdt
+              - ti,omap5-wdt
+          - const: ti,omap3-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hardware module associated with the watchdog.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@48314000 {
+        compatible = "ti,omap3-wdt";
+        reg = <0x48314000 0x80>;
+        ti,hwmods = "wd_timer2";
+    };
-- 
2.51.0


