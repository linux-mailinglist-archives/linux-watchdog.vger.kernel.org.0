Return-Path: <linux-watchdog+bounces-1406-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C6938593
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 19:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA4A2813BA
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 17:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163FC1667D8;
	Sun, 21 Jul 2024 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIMblW/n"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151795380F;
	Sun, 21 Jul 2024 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721581756; cv=none; b=h12Khq4BW7oUL00J5Uu770QTm4APPfBg9gsuvkrolSxue4kyxh+QXxtZF6QAJH/C94Kf4m+WxtTnJdLq6T+SJ/Gz6i0Az409vqrmuk6jjMfVkt1Fu+8j15bbwO2gXmD7q/cyzVxolTxXvgtlvSkUp57wVvuKvOb0ILIe7ruUIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721581756; c=relaxed/simple;
	bh=dkbX/BmKso1WNDWENo072TCLDSRYmDwH7oq/jqphAT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVz7YjeDyOfR+Y1PPzTJgY1NkMw3Qca3TX/97FOqrgxDB25a6gGc1H3/Zn8JIRS3wfx+FmvEBIXmMZy/hYyATWDwui1kWe6856M7M1tt0Jh9rwbzYDlW6o83DQ2oMKT6HM77mRsB3liNFzlhLYFDwH/+vs5effPJbt2HgFrXSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIMblW/n; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70362cb061aso1983060a34.1;
        Sun, 21 Jul 2024 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721581752; x=1722186552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9aEJfvEVkHc3rc+qcpiZ+r3iAy/bh/OhW1EfSbvL3c=;
        b=FIMblW/nLRqJNc9ibarmaaymq/N+9JmN+6K2VmXbaQHW9hRzAVA5csVDoJtoN5TJu0
         b97RSnPYty6qSKvwriAUgjdXOFVFNwVN9jkkw9SJ5/t/nYqHw5eyn3LOe9IuJgJxmhXn
         X0TpGchaP/aPMTqKeJN76p7Nw1hZS+3Y+TmfNaJXcKO9obCXTwbRk59xAOwXIXz6iyKg
         7CWhh/GALmNXUVoicY8Ibydo1PbJxwKW8CCzMGoUWWTj5MkPbXU+CSBcWUxbvUzGZ2tc
         FizxIG7A8O6kpoNqMOP1aplBKHaqBLGPE2iFEq0sz+wNVOmDuy5e6E7cT5BMpxEbpNJm
         Smcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721581752; x=1722186552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9aEJfvEVkHc3rc+qcpiZ+r3iAy/bh/OhW1EfSbvL3c=;
        b=oHaCa6CL5Awj4JYhFrjkKGWpKfG+hv/KSY318+ZpxNEmLoT7zKtjcZazNJ9SKQWSej
         r314OPRsHKK2TclzZv6al4ES1HAclluWlADSQfPjv+GhySa6VcfeS3APA1ucGtkosKF4
         MpU6KYsCfmLz1ipO38/T/TtD3Nj1U930EtZ0HDM+40uz85XjGqyxSBubGqaFjKO53/zi
         5ILU5pFkkaB4RwNKST1op4dg3cduEJiv2QdCdjLerUH1y+B4+PcgNsUQwbSTEW71RT/y
         JAw2OZhkCPCsnajBixxb/3hOm3KtG19yELMUXuXjmTC3ZnBtGt0iGymmaDo/uprnMl1e
         mb8w==
X-Forwarded-Encrypted: i=1; AJvYcCVzL4rlMPxe3ChrnKE7etZuYjRtEqp0n8e+2aQn9cpYTsxlIFw51+4BiV/yU5nmunmo2r9SBQlT9gTvaQvtTEY84hBetEoF0h/4dXnqaWVHiIHvVEIc8M+HCYljRF4JPU0LZ7xj1+U762b5wR8=
X-Gm-Message-State: AOJu0YxJ8PjpNscFrDKz0gMe5wBXwuIedml4Df9fce0UAFJ4gdmmrNnW
	Vl9ErP/VdDmxMWSm68RtfdY2rgoU/94uoVzkWTtVwQp1A0D6uuoy
X-Google-Smtp-Source: AGHT+IG4RGm6UldBRPirm/sgg0RJFRpR7a2pTNHo9NF5qkkB4iyXZ5ybq2E6dEdqmje5bNCJc3Rb7w==
X-Received: by 2002:a05:6830:391b:b0:703:b0e9:d951 with SMTP id 46e09a7af769-709008d0de4mr6872850a34.6.1721581751955;
        Sun, 21 Jul 2024 10:09:11 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:312d:f66f:2b12:abd:60ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d285943e3sm417810b3a.213.2024.07.21.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 10:09:11 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH 1/3] dt-bindings: timer: ti,davinci-timer: convert to dtschema
Date: Sun, 21 Jul 2024 21:58:34 +0530
Message-ID: <20240721170840.15569-2-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240721170840.15569-1-five231003@gmail.com>
References: <20240721170840.15569-1-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt binding of TI's DaVinci timer to dtschema to allow for
validation.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
---
 .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
 .../bindings/timer/ti,davinci-timer.yaml      | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt b/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
deleted file mode 100644
index 29bf91ccf5b7..000000000000
--- a/Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-* Device tree bindings for Texas Instruments DaVinci timer
-
-This document provides bindings for the 64-bit timer in the DaVinci
-architecture devices. The timer can be configured as a general-purpose 64-bit
-timer, dual general-purpose 32-bit timers. When configured as dual 32-bit
-timers, each half can operate in conjunction (chain mode) or independently
-(unchained mode) of each other.
-
-The timer is a free running up-counter and can generate interrupts when the
-counter reaches preset counter values.
-
-Also see ../watchdog/davinci-wdt.txt for timers that are configurable as
-watchdog timers.
-
-Required properties:
-
-- compatible : should be "ti,da830-timer".
-- reg : specifies base physical address and count of the registers.
-- interrupts : interrupts generated by the timer.
-- interrupt-names: should be "tint12", "tint34", "cmpint0", "cmpint1",
-		   "cmpint2", "cmpint3", "cmpint4", "cmpint5", "cmpint6",
-		   "cmpint7" ("cmpintX" may be omitted if not present in the
-		   hardware).
-- clocks : the clock feeding the timer clock.
-
-Example:
-
-	clocksource: timer@20000 {
-		compatible = "ti,da830-timer";
-		reg = <0x20000 0x1000>;
-		interrupts = <21>, <22>, <74>, <75>, <76>, <77>, <78>, <79>,
-			     <80>, <81>;
-		interrupt-names = "tint12", "tint34", "cmpint0", "cmpint1",
-				  "cmpint2", "cmpint3", "cmpint4", "cmpint5",
-				  "cmpint6", "cmpint7";
-		clocks = <&pll0_auxclk>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml b/Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml
new file mode 100644
index 000000000000..615ceb8f30af
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/ti,davinci-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci Timer
+
+maintainers:
+  - Kousik Sanagavarapu <five231003@gmail.com>
+
+description: |
+
+  This is a 64-bit timer found on TI's DaVinci architecture devices. The timer
+  can be configured as a general-purpose 64-bit timer, dual general-purpose
+  32-bit timers. When configured as dual 32-bit timers, each half can operate
+  in conjunction (chain mode) or independently (unchained mode) of each other.
+
+  The timer is a free running up-counter and can generate interrupts when the
+  counter reaches preset counter values.
+
+properties:
+  compatible:
+    const: ti,da830-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+
+  interrupt-names:
+    minItems: 2
+    items:
+      - const: tint12
+      - const: tint34
+      - const: cmpint0
+      - const: cmpint1
+      - const: cmpint2
+      - const: cmpint3
+      - const: cmpint4
+      - const: cmpint5
+      - const: cmpint6
+      - const: cmpint7
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@20000 {
+        compatible = "ti,da830-timer";
+        reg = <0x20000 0x1000>;
+        interrupts = <21>, <22>;
+        interrupt-names = "tint12", "tint34";
+        clocks = <&pll0_auxclk>;
+    };
+
+...
-- 
2.45.2.827.g557ae147e6.dirty


