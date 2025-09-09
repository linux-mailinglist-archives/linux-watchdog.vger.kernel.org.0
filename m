Return-Path: <linux-watchdog+bounces-4212-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A3B4FF38
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Sep 2025 16:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7EF0365EFC
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Sep 2025 14:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B4D3451A3;
	Tue,  9 Sep 2025 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lijg5Xxh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46F32252E;
	Tue,  9 Sep 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757427727; cv=none; b=BMlG3H2hi0kP/Ys2n41LVnx5GUw3+lGGoff92drqbJPcnTgKHU/a+B1u9C/eHyuMFj9P7hBYQsiQUfXbH6BtkJZRqSYF8T0YIIWjL2dV6ccplN/RRoLS6SuORksJpw8K83ITrFPThKehMJF4rL4OmnklVo81zqPy3UpKNxpyBXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757427727; c=relaxed/simple;
	bh=hcsO+0CDu8ebk5l7xQEiuvFomx6Jn3bzyePgBxbYNfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jk/CPiZn7G5spLERyV7Y5xl7EwDBsksApbYKbco6kiy/iSMIBxDBHLzOrhHlN6/bQSCEvJZVYj/TaC+lO6Qsv8lvw3ehNHzkV6IcOGXnXoUWGjsD1qhvfXI5BhlZoJfAmzbH5jRy3nN0jNER6YtWltnkq7skM0VIgNHvZRfor+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lijg5Xxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6D0C4CEF4;
	Tue,  9 Sep 2025 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427726;
	bh=hcsO+0CDu8ebk5l7xQEiuvFomx6Jn3bzyePgBxbYNfA=;
	h=From:To:Cc:Subject:Date:From;
	b=Lijg5Xxhk1ndqA8YsuTfBeLqkWzIrQloB4O6QQHsC7UOsWD/DnAW4cfZ7CSNrBgPh
	 TMjyuG7AKDCV/XwzIBXauLf1RDk7g34JLK03efmZyFBF6l5Jm5af+1T1+L2cHUWd9q
	 EtcGOys1wz0Mmb0pB3f9HTm5hXixAl/55644e0PTGR+/yLdlZi45KFBzhdKRF04ZNt
	 0jmryVkcm2SPC63DgbVuPwzOCw84RPbvcBHTIDL2l793Tdtwv+gZsihhlzKwCZxEHL
	 8hvA7ydUlWyRYf0v2Dc5rpBtH/A64D/ESUQCjZo5VIooHXPh6DL9hz3F6sfbmQ2NWj
	 ra68COBXtoOxg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT schema
Date: Tue,  9 Sep 2025 09:21:59 -0500
Message-ID: <20250909142201.3209482-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Nuvoton watchdog binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 ----------
 .../watchdog/nuvoton,npcm750-wdt.yaml         | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
deleted file mode 100644
index 866a958b8a2b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Nuvoton NPCM Watchdog
-
-Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
-The watchdog supports a pre-timeout interrupt that fires 10ms before the
-expiry.
-
-Required properties:
-- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
-                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon), or
-                    "nuvoton,npcm845-wdt" for NPCM845 (Arbel).
-- reg             : Offset and length of the register set for the device.
-- interrupts      : Contain the timer interrupt with flags for
-                    falling edge.
-
-Required clocking property, have to be one of:
-- clocks          : phandle of timer reference clock.
-- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
-                    timer (usually 25000000).
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-
-Example:
-
-timer@f000801c {
-    compatible = "nuvoton,npcm750-wdt";
-    interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-    reg = <0xf000801c 0x4>;
-    clocks = <&clk NPCM7XX_CLK_TIMER>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
new file mode 100644
index 000000000000..7aa30f5b5c49
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,npcm750-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Watchdog
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+description:
+  Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
+  The watchdog supports a pre-timeout interrupt that fires 10ms before the
+  expiry.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nuvoton,npcm750-wdt
+          - nuvoton,wpcm450-wdt
+      - items:
+          - enum:
+              - nuvoton,npcm845-wdt
+          - const: nuvoton,npcm750-wdt
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
+  clock-frequency:
+    description: Frequency in Hz of the clock that drives the NPCM timer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+
+    watchdog@f000801c {
+        compatible = "nuvoton,npcm750-wdt";
+        interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0xf000801c 0x4>;
+        clocks = <&clk NPCM7XX_CLK_TIMER>;
+    };
-- 
2.51.0


