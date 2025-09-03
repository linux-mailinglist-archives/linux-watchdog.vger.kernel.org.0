Return-Path: <linux-watchdog+bounces-4163-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A58B429FA
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 21:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780FC3B672D
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 19:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7D236932A;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuZyfqOo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069C2C18A;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756928067; cv=none; b=mWqZhySJoJc+xXy/aMNTuppY9OcM28Y4nURMwJ6D9NWLr8gnuJxbvGEmqWcEFKHwP7a3ev/a398se9g0uwMdVhQWfHgcp/ZQhtxNV9QxkzO96rrlOT4PvuPyMFM9S+w+g5fHmGOS0I6N6gW/ogL7XzvrEilwKpvEavfU8OzleS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756928067; c=relaxed/simple;
	bh=EgDo/LLsnhBVCLOMOYaz57dVgqrxts4nTCtm2WMV5Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jkNknBHenSjT/fU/qNWTymu8LY7ZpYZf8z+pRuBk6JZRzkTeB/1NFnufGHXED5vqC1sbTnxtXW+4r/ECBq9/6yL3ha2dv2O1PCaY5SHXU433byz8iETVs9D+dFGqZKZFr+h7g7uCZY4+avb3VwyS3mJtGcdXqBZExuwEd3juf0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuZyfqOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10734C4CEF4;
	Wed,  3 Sep 2025 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756928067;
	bh=EgDo/LLsnhBVCLOMOYaz57dVgqrxts4nTCtm2WMV5Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XuZyfqOoorDq3EBsBqISJ6Ka+BbzKetSxm/iJv3dmuT5xo4DrrEbHIBHZDA00f0/y
	 bRVhewjfeIwIzt77Wpchflpu/DKQg7NBCq+Q02wxJU/DBSHnZiGT5I/CzPNNiWfJSH
	 xjGWJHGxfzoK6P9EIRt25DWp23DkhpdzjSbkQwRIuKnaljVvBCJMSmU1GWaQvUo6zj
	 nZ0gYljYXgA9F3JSl3XQCRztUBFk32u7C1yTYE2bAnnqiiQurxXlC/PhY2ljEqA+ws
	 BzM2Cr1H70wxbVuWtsXWUYcCTsvi7ZLkNLrh1OxqP6azaGfc1iQQshLLkDUBNdZDD7
	 jgAau1TrtcOYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF84CA1009;
	Wed,  3 Sep 2025 19:34:26 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Wed, 03 Sep 2025 19:33:59 +0000
Subject: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
In-Reply-To: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756928065; l=3492;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=12mv1xnCm68+mV1cO5nlkW0+E3MQXZbHMWHwIp/NcZc=;
 b=qkUoVFWdbjWAoQfKRxKiRBGxhdVw4DOqAVLkp0OdTPsi7asOUUgp2H6GBPAlISkEYQvIQLQPJ
 6ia4WubGpXuCD+oUMeXuoEarrwRppe27z3h0y+gtE01MxxGY/Wgvxo4
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

The Gunyah Hypervisor applies a devicetree overlay providing the
pretimeout interrupt for the Gunyah Watchdog that it will be using to
notify watchdog's pretimeout event. Add the DT bindings that Gunyah
adheres to for the hypervisor and watchdog.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
 .../bindings/watchdog/qcom,gh-watchdog.yaml        | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
new file mode 100644
index 000000000000..bde8438c6242
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/qcom,gh-watchdog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Gunyah Virtual Watchdog
+
+maintainers:
+  - Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
+
+description: |+
+  The Gunyah Hypervisor provides an SMC-based watchdog interface for its virtual
+  machines. The virtual machines use this information to determine the
+  pretimeout IRQ which the hypervisor will be using to communicate pretimeout
+  event.
+  See also: [1]
+
+  [1]: https://github.com/quic/gunyah-resource-manager/blob/1b23ceb0dfa010b3b6b5a5f7a4ec1e95b93ab99d/src/vm_creation/dto_construct.c#L519
+
+properties:
+  compatible:
+    allOf:
+      - const: gunyah-hypervisor
+      - const: simple-bus
+
+  "#address-cells":
+    description: Number of cells needed to represent 64-bit capability IDs.
+    const: 2
+
+  "#size-cells":
+    description: must be 0, because capability IDs are not memory address
+                  ranges and do not have a size.
+    const: 0
+
+patternProperties:
+  "^gh-watchdog":
+    type: object
+    description:
+      Watchdog node which provides information about the pretimeout IRQ which
+      will be used to communicate the pretimeout event.
+
+    properties:
+      compatible:
+        const: qcom,gh-watchdog
+
+      interrupts:
+        items:
+          description: Interrupt for the pretimeout.
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - interrupts
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hypervisor {
+        compatible = "gunyah-hypervisor", "simple-bus";
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        gh-watchdog {
+            compatible = "qcom,gh-watchdog";
+            interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>; /* Pretimeout IRQ */
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index c0b444e5fd5a..03b74513e4ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3076,6 +3076,7 @@ F:	Documentation/devicetree/bindings/cache/qcom,llcc.yaml
 F:	Documentation/devicetree/bindings/firmware/qcom,scm.yaml
 F:	Documentation/devicetree/bindings/reserved-memory/qcom*
 F:	Documentation/devicetree/bindings/soc/qcom/
+F:	Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
 F:	arch/arm/boot/dts/qcom/
 F:	arch/arm/configs/qcom_defconfig
 F:	arch/arm/mach-qcom/

-- 
2.43.0



