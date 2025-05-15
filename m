Return-Path: <linux-watchdog+bounces-3506-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD0AB8F6D
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 20:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EEC1BC1309
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 18:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2CC28C028;
	Thu, 15 May 2025 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5KfyAoj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BB26982D;
	Thu, 15 May 2025 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335334; cv=none; b=Yeh3vyTDbwCd/+MvDUKj2UPYKb7sUBNyN0AZNKiiSFvY9jFZ5CjwyRWF3axZcZ3ZaMJFQbhnT998dOp93ekSdDMjA/WFK/9Gfb29EVzVKmMlPcNmTVxqx3ABJWv8eXWQBV702IWSC9yzqmja/WuX6T9C6dpoeIjufW4/bJk8Kv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335334; c=relaxed/simple;
	bh=yNxDhm/uuiO8dmzR5EBORWvZsJNFwbuRqrNhv+/q4vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFkbIeh5vta3ZdUZayhyAt6XaPgKwur3vDLdQpDIJGlPtoKwZ559jqx8Bw/PswESLfHd6GIekuXzkfIjEYASiak89gqiAxPJ9AHLZks3XKslfHnSfYAaYMcH8NMOEC5O0h3Y8pbW678T+Y3NdmTajyFAKaFqxTeTVoXeVEvEnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5KfyAoj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1557646e87.1;
        Thu, 15 May 2025 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335331; x=1747940131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfvGa2EDVDelSmhnP0283dUZyM9fnNxCHCR9wjNeA94=;
        b=m5KfyAojESTVK0tcjP5q3KuJCF38puGWosqUzWAneOn1Qq0PIHocHSzI9GaITnq/VN
         eaT98elAkedOD/eyJccboA3q3ay+GfYRrW0GhLxg5jFxpLo9dxNWmA3Hdm8V+dpTXjHj
         vdJbGw/Zo9vtv2slCp1hPjjcRmHnLe+V1LaWdXDSLHqhtIFxsBUqp4AmT2RD959qsFxM
         QOddaW0ELQ5RBjE2pBJqlhyq2n5vMAC5IQR2sBTLpgoMPx9qrH3g4L7NRGtf/3wgAjkd
         Jl4lcc0pOmFBiGOLsV7JnpHgNnJ0ELiEmNRhmtifzcT+pZERjCz3HWfCYqwxw8XLhvAe
         vD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335331; x=1747940131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfvGa2EDVDelSmhnP0283dUZyM9fnNxCHCR9wjNeA94=;
        b=D5hQhjgrb1dFPRUj1uMcefEGkk7tdnGIO1Nmp57CJmHTgY1s8L6pRf/3d0EDKN7j3F
         qZBsOVrqamwsDcq+o2Ho0bPRSqTimDuG2vTI2Gq5nPTdMAobxkC6htOfOHczmcBAHwpj
         NyOqZlcKSwtyETLIAzQXn2u/h1NIxgfBkCftLfKQCDOjtcbBIz7jfFnBe6OoUZto93fj
         87tMJ5gKg9MEnj3M2gmlh1GLNFAeC4MIM46SHujmGgS2H3y1rbCU5R3ljscPAcACM4NG
         lL7xyUirESSvTVUnnq3BtOj1ERfcRIjoeM1Cv2b5dHlKgBOQJXpp00Sel45Y6X4dd+rN
         qvaw==
X-Forwarded-Encrypted: i=1; AJvYcCUtXI1zT9VgfJC2R32wjF197AKLvTFulXo9II+Rc05rYcAv76HUVpsR2dMW3wBH7GEdqYm5auOKMrHx@vger.kernel.org, AJvYcCVDvEdHri10chwDDNl9pepdqxlPPu+c1BfcHYEzKECRGIBxKQkl422S9xk+1ann3a4qH7q/2rNIUuJzIgg8@vger.kernel.org, AJvYcCVHmxy0UXzuz2dT1pipVUqGEVXtbuO9YL7JukZ1DxXVDehWBHpf3f1haCnCklXgFmJdC5ihQBYVrng0xxZyBl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzVEm3Z8vgfIHyraDFVftb4I60LqII4ej/KRJ6TsXMZeD/Zlp
	uGD/gGEzoJqSCDXrOXaMSMcOcoKK8aV+owWzRCNkjagcgGeKBqF5eIgV
X-Gm-Gg: ASbGncvg7iqsVH0ZCB1S+jx8xwIAFI/XzQQ56X2E3wvrUDc5T2j03X/74cByC3Etcsh
	eG3IIXzED5J/nQ0j3MevF44C1sb+J1+/a8sQra2R6yd9Lc0KMJK81ZOXr5VFKGFF5pqD6+U7a0z
	Vw7BhweD1kNQkZw1gjUYja3O3aPUQcdvZiRH+LTfxw7igCcS+7yDIJw5UVr6/iB7RE+qAIuFq/k
	J5tUpOZjgEzAJ0Yr3KdfbAxamteAiVrhLRst9l+TSqZ0o9D940PI2uQbBCZgE0/GO/kWtka3uw6
	pYTwRMNcVZZKxqFHGajIgcZgny4/gQ8ggw23UhvX/Ux/xutY52DsggNj3dTHwTjj
X-Google-Smtp-Source: AGHT+IGwGxrvOSfW01fCcygvtE81OaRuc1eoF2HsrgiOy6ljMEknHiCgS823LFFyZKoREeRhf+Vzsg==
X-Received: by 2002:a05:6512:6301:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-550e71b4a93mr192311e87.16.1747335330530;
        Thu, 15 May 2025 11:55:30 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:26 +0300
Subject: [PATCH v3 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-1-2197a1b062bd@gmail.com>
References: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
In-Reply-To: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=yNxDhm/uuiO8dmzR5EBORWvZsJNFwbuRqrNhv+/q4vw=;
 b=NRQGss8+va4KZKjCJRO11/7j3cq4lJKPSHXgToJoCXBCupR0aSzlOR8ZJakm75pow+quIu++K
 Y+rqzvZ5vE9DICWK24cfXrlUVIy5I/LI9KL+WoZ+G4jBnJYxG9yiyjH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
deleted file mode 100644
index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Timer
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-timer"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : interrupt for the timer
-
-Example:
-
-	timer@d8130100 {
-		compatible = "via,vt8500-timer";
-		reg = <0xd8130100 0x28>;
-		interrupts = <36>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e748149948f3140d4a158f800b91e70bf9c4f042
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
+
+description:
+  This is the timer block that is a standalone part of the system power
+  management controller on VIA/WonderMedia SoCs (VIA VT8500 and alike).
+  The hardware has a single 32-bit counter running at 3 MHz and four match
+  registers, each of which is associated with a dedicated match interrupt,
+  and the first of which can also serve as the system watchdog (if the
+  watchdog function is enabled, it will reset the system upon match instead
+  of triggering its respective interrupt)
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    const: via,vt8500-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Channel 0 match. Note that if the watchdog function
+          is enabled, this interrupt will not fire and the system will
+          reboot instead once the counter reaches match register 0 value
+      - description: Channel 1 match
+      - description: Channel 2 match
+      - description: Channel 3 match
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d8130100 {
+        compatible = "via,vt8500-timer";
+        reg = <0xd8130100 0x28>;
+        interrupts = <36>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76fb7090a2a550f4c59a7daf188493..b8b2843491c47182a4fc6c76f5c29b6c411830a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3434,6 +3434,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


