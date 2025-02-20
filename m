Return-Path: <linux-watchdog+bounces-2979-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3A3DA34
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 13:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6921895ACF
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 12:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921C71F63EA;
	Thu, 20 Feb 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp8U4ZYY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DA17BD9;
	Thu, 20 Feb 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740055073; cv=none; b=P2LEX2DCF0aCwYMJP/kywSb4qj/8N2jX53bBhU32ljcOr+cOGNHhTuBsGn/BCE6UtFsPxaH7I67cNV+voPOTL4bycugUy5vp0R/8vuImQ1hlfvRjNBO1GSu+Aqs+AavbyJUJhyvku4Rypi1gSYECPhwZcEuBCALbnH8JmjpktHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740055073; c=relaxed/simple;
	bh=r48HYisUUx76kV56pWhPo/Kdu1yezsxw8x2OsnVHxvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J360ZU2jPn+kM7JRegSME004Hq0iXPoRt9R2PNkwmSCTiU9fMUXX0bh3tGMqfHAfmZwXVRHcF+c5L0QDBQID35qCmSGJ5V3gfPZcM95az1YyiOuqFzpI1iqZCFZKnFd8MDrvZ/VwLvjcHJV1Z5rFGnzeRqWwJSeifTfn39EnSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp8U4ZYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2815C4CEEA;
	Thu, 20 Feb 2025 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740055072;
	bh=r48HYisUUx76kV56pWhPo/Kdu1yezsxw8x2OsnVHxvo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Zp8U4ZYYbvcVEP1h02X9rKzQbG4vG9RwslRkQKR0+meamsEgCkpS1nPkAzcMghZmV
	 ZM8FghsgGTzhR7EW+M0fpdylfH3xOLtWgAx9Euz9p87zDKEOoGpzeNVx23r50QYwlv
	 YX24KxREr7VHArsYR2uUfqh/C2XKG3rwB4cb9u1xqVW/5jtuWR029tGl1beNc5/GGu
	 lMhHxVFUkyv3ZuBFNv950hll0OxXdBQRRhNNhAbNakivRi9KgNqzNz/WmboQoR9kkS
	 E2MoOGSa0+4uPqB1FFJSCQPvpr8+u++x0R6LDEFL0S8mynuVDXTBLN5k8FOFYJFmw/
	 GEcPvB/jsCj7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FBCC021B1;
	Thu, 20 Feb 2025 12:37:52 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 20 Feb 2025 13:37:38 +0100
Subject: [PATCH v3] dt-bindings: watchdog: Convert mpc8xxx-wdt to YAML
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250220-ppcyaml-wdt-v3-1-a0e2ba9b616e@posteo.net>
X-B4-Tracking: v=1; b=H4sIABEit2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3YKC5MrE3Bzd8pQSXUNjg0TjxFRji0TLNCWgjoKi1LTMCrBp0bG
 1tQCK+CLQXQAAAA==
X-Change-ID: 20250220-ppcyaml-wdt-130a3ae38a9f
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740055071; l=4252;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=izQ2S0HRQ3pNq1mfIq6x2Dz7g0dV4Wo3Ov+CrOwy1kc=;
 b=elhAjkZYbKu4rlKzIGvXrPPXNcLUIeXY2BV6/zXA5JoXLmDgyVPEIGWVYtDVAFyEYSoQ/tmnh
 x9IVRoSCgxcBUvp3UubPMZmWAH5K8QzMQ5n8xeaQ9J+bADy1LM4Snc4
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Convert mpc83xx-wdt.txt to YAML to enable automatic schema validation.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
V3:
- split out as a single patch
- remove unnecessary node labels in examples

V2:
- part of series [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
  Link: https://lore.kernel.org/lkml/20250207-ppcyaml-v2-7-8137b0c42526@posteo.net/
- trim subject line (remove "binding")
- fix property order to comply with dts coding style
---
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   | 25 ---------
 .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  | 64 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt
deleted file mode 100644
index a384ff5b3ce8c62d813fc23d72f74e2158ff543e..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Freescale mpc8xxx watchdog driver (For 83xx, 86xx and 8xx)
-
-Required properties:
-- compatible: Shall contain one of the following:
-	"mpc83xx_wdt" for an mpc83xx
-	"fsl,mpc8610-wdt" for an mpc86xx
-	"fsl,mpc823-wdt" for an mpc8xx
-- reg: base physical address and length of the area hosting the
-       watchdog registers.
-		On the 83xx, "Watchdog Timer Registers" area:	<0x200 0x100>
-		On the 86xx, "Watchdog Timer Registers" area:	<0xe4000 0x100>
-		On the 8xx, "General System Interface Unit" area: <0x0 0x10>
-
-Optional properties:
-- reg: additional physical address and length (4) of location of the
-       Reset Status Register (called RSTRSCR on the mpc86xx)
-		On the 83xx, it is located at offset 0x910
-		On the 86xx, it is located at offset 0xe0094
-		On the 8xx, it is located at offset 0x288
-
-Example:
-		WDT: watchdog@0 {
-		    compatible = "fsl,mpc823-wdt";
-		    reg = <0x0 0x10 0x288 0x4>;
-		};
diff --git a/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..67ad4f1eda8de0799954cb5a87df613ea53a2864
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mpc8xxx-wdt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mpc8xxx-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MPC8xxx watchdog timer (For 83xx, 86xx and 8xx)
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+properties:
+  compatible:
+    enum:
+      - mpc83xx_wdt       # for an mpc83xx
+      - fsl,mpc8610-wdt   # for an mpc86xx
+      - fsl,mpc823-wdt    # for an mpc8xx
+
+  device_type:
+    const: watchdog
+
+  reg:
+    minItems: 1
+    items:
+      - description: |
+          Base physical address and length of the area hosting the watchdog
+          registers.
+
+          On the 83xx, "Watchdog Timer Registers" area:     <0x200 0x100>
+          On the 86xx, "Watchdog Timer Registers" area:     <0xe4000 0x100>
+          On the 8xx, "General System Interface Unit" area: <0x0 0x10>
+
+      - description: |
+          Additional optional physical address and length (4) of location of
+          the Reset Status Register (called RSTRSCR on the mpc86xx)
+
+          On the 83xx, it is located at offset 0x910
+          On the 86xx, it is located at offset 0xe0094
+          On the 8xx, it is located at offset 0x288
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: watchdog.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog@0 {
+        compatible = "fsl,mpc823-wdt";
+        reg = <0x0 0x10 0x288 0x4>;
+    };
+
+  - |
+    watchdog@200 {
+        compatible = "mpc83xx_wdt";
+        reg = <0x200 0x100>;
+        device_type = "watchdog";
+    };
+
+...

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-ppcyaml-wdt-130a3ae38a9f

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



