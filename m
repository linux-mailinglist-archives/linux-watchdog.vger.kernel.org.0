Return-Path: <linux-watchdog+bounces-3991-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9519B23A05
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 22:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEE76E4F89
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Aug 2025 20:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E102C21E2;
	Tue, 12 Aug 2025 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4SQ4e4b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB5202C3A;
	Tue, 12 Aug 2025 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030785; cv=none; b=eChGLUy/xq3XwknEsgxQT9nFkrHsCQkz+0xJunxCZKhghzoIa9zmcGsqLn0s8jhHDzdy/Mo/VoU4aDYOVLN/0mHSLdUMcrNsQvexH/Eyy7P0Cs1IWdqdjqoXukwWbZoBnVkfV8wPLWvroaFCSB8cB1nDJAqP8TwT+QWryAu+4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030785; c=relaxed/simple;
	bh=1zQDwv+c+2f8PAjLjmyAUalogDJhgfoJjuw8TmC5/fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u8aiU5gmZw5Q7dehR1AdsRN/a2mUekZmUGSDNcsUpXN3fdU0znGgtckesZ11KK28P1ECH0e59tUoXVjfD4m/DxDtp/t9+sshC5IwAsYxYWvPVPGj63YzdJFVgIVAJgy48h0LVnP85j4SOogfBWgpeKE1haxOSgGG6UwGXTZ1H68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4SQ4e4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF141C4CEF0;
	Tue, 12 Aug 2025 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755030785;
	bh=1zQDwv+c+2f8PAjLjmyAUalogDJhgfoJjuw8TmC5/fQ=;
	h=From:To:Cc:Subject:Date:From;
	b=P4SQ4e4bFLupR3TzUMp1am/GwXfw7JyeJPr1ysMR7ki4SP6VkCE8A2g61LTrM2EXK
	 U7EkuaZzgMPLghKkZ39zoTCNjwuvFy4kiWmsfLigXy69Rt5aSjURab/QVf8bdBtFCs
	 OQuvaicDLsuPHbIJ67Ismm+KPGF4wABSCYOU0s3U9V2Mux7sBuytZ5XviXM5YYuUfO
	 6fCi2TE5gkH/bfXFBgTLZGkVZ1d9/qsTVE1s6PriULIM7rrfxIgr0LKRm3hb6w2tk3
	 v+T9buWsTsJQMVj/SsWeiv0rWIZjYQ5MIPFsrxMVQkTxYfhILlfWjY+9IILhES4unh
	 KYCHaMbNWHnqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Convert marvell,armada-3700-wdt to DT schema
Date: Tue, 12 Aug 2025 15:32:57 -0500
Message-ID: <20250812203301.726374-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Marvell Armada 3700 watchdog binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/watchdog/armada-37xx-wdt.txt     | 23 -----------
 .../watchdog/marvell,armada-3700-wdt.yaml     | 41 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 42 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
deleted file mode 100644
index a8d00c31a1d8..000000000000
--- a/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Armada 37xx CPU Watchdog Timer Controller
-
-Required properties:
-- compatible : must be "marvell,armada-3700-wdt"
-- reg : base physical address of the controller and length of memory mapped
-	region.
-- clocks : the clock feeding the watchdog timer. See clock-bindings.txt
-- marvell,system-controller : reference to syscon node for the CPU Miscellaneous
-	Registers
-
-Example:
-
-	cpu_misc: system-controller@d000 {
-		compatible = "marvell,armada-3700-cpu-misc", "syscon";
-		reg = <0xd000 0x1000>;
-	};
-
-	wdt: watchdog@8300 {
-		compatible = "marvell,armada-3700-wdt";
-		reg = <0x8300 0x40>;
-		marvell,system-controller = <&cpu_misc>;
-		clocks = <&xtalclk>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
new file mode 100644
index 000000000000..60d44d642fb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/marvell,armada-3700-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Armada 37xx CPU Watchdog Timer Controller
+
+maintainers:
+  - Marek Behún <kabel@kernel.org>
+
+properties:
+  compatible:
+    const: marvell,armada-3700-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  marvell,system-controller:
+    description: Reference to syscon node for the CPU Miscellaneous Registers
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - marvell,system-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog@8300 {
+        compatible = "marvell,armada-3700-wdt";
+        reg = <0x8300 0x40>;
+        marvell,system-controller = <&cpu_misc>;
+        clocks = <&xtalclk>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 06a4cde222bd..6a2de9638c08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2623,7 +2623,7 @@ F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
 F:	Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/marvell,mpic.yaml
 F:	Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
-F:	Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
+F:	Documentation/devicetree/bindings/watchdog/marvell,armada-3700-wdt.yaml
 F:	drivers/bus/moxtet.c
 F:	drivers/firmware/turris-mox-rwtm.c
 F:	drivers/gpio/gpio-moxtet.c
-- 
2.47.2


