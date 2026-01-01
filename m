Return-Path: <linux-watchdog+bounces-4753-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A0CED2ED
	for <lists+linux-watchdog@lfdr.de>; Thu, 01 Jan 2026 17:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E98B30047BA
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Jan 2026 16:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C773223A9B3;
	Thu,  1 Jan 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKEkR+fL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F30405F7;
	Thu,  1 Jan 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286469; cv=none; b=j6rw4AuUW8QX4q906egFX/TZ0Cfdu3XqBYQr84OPeGD69IHDVfyVc7yd1+lZj5CrYAmyKBJ27DHicDsPUSnSvZWTIR7QusKnZtfthcZDVp8os7JAOnkmQlxD2z5DXcUxtfQjTeO9c9A9hVESHgLuXNyrARFI/cgwJJMQbKXq6P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286469; c=relaxed/simple;
	bh=nq6v8jCixnAalf9SHq9b05ejaN7vaO9MlQ1lo+AMhQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gj+kVGg+mkxIO886M2UhGNaB63ONmflf5SVfYa1vJlT++XR7p0QqDFrK437KK1DujhWu7ZulM6snmv9RkjSwyOzSL31WB4Bm7ACgyUcZvc+KL9m+sxGO7jlWJ+F4PZPnGoK/ePvOVjYxY3hpdLTnxharBAyv2F0V/b4yZAGS2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKEkR+fL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38DA2C4CEF7;
	Thu,  1 Jan 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286469;
	bh=nq6v8jCixnAalf9SHq9b05ejaN7vaO9MlQ1lo+AMhQg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aKEkR+fL8cxdJrEBKvL3CcqKy8V2bq+QJ92460JJNXgAmJomg65HVzmSAfxJ4D2cr
	 bAEctdvy9JpHnE7hdvRrejOU8iFBlVKLwGBL4Mqa44X4DlqGLwcrUmndYSU5Y6OdYx
	 MbpIN+ho0ESlS4dm4Cm2eOFiUMkoLBCAcRTswg1l7ozE88g6aV+IDUl7a91tjD2mgO
	 /CQoFUcan++mJYa+z9ve+NjCJqFpbZK1+VzxU25l0KZCia3vqmVbu0UOLqmoAift4C
	 1gbaTxlFi92J9Er9nrQMQ7EExLsQiUPvSKC8fhyqf9CLtPeDmm6nG8LeSWev8wQSOU
	 7W80he3HPiZ7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288A5EED615;
	Thu,  1 Jan 2026 16:54:29 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:54:22 +0100
Subject: [PATCH RESEND v3] dt-bindings: watchdog: Convert mpc8xxx-wdt to
 YAML
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260101-ppcyaml-wdt-v3-1-9d59c5aee03f@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286468; l=4148;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=bB23UQDjneYN1/x32YaH9AR28whcCCI45Acz4U/Ao1Q=;
 b=ohP7I0XkNKWYzdv0Q6D5+1rjodHTcz83v5nwSxuoDkFw2DqMMtwOg1vv6gTstu/tIE4HTvdmE
 JOC/tkYDAY3AcJNgA7DFG1M8nnumer9Tbln+A0ZV7tP47ndeb5iosJL
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
index a384ff5b3ce8c6..00000000000000
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
index 00000000000000..67ad4f1eda8de0
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



