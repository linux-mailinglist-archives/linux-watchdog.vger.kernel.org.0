Return-Path: <linux-watchdog+bounces-3549-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B8ABE459
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 22:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9E717C949
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 20:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46165286434;
	Tue, 20 May 2025 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezpJvUp5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23062857C5;
	Tue, 20 May 2025 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771329; cv=none; b=UG42xHcMw5vMMpoXnVT+w4DdFCCE3UhHpi42ZdPyDLfchEtUIuQbjeyNhZlX/3Uxn5nt/mMX2b+HgiPRLH8ZCnFBPO2YgrTJY3YImxBQyDtJGKHMrsRmMHxmo/ry8rC9w1i04YZEXBVMoYko8G1VDaQoYhQEm54LMvLpW+ikMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771329; c=relaxed/simple;
	bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ra1UfAkq62vXHcQW6EFWobAzLL5iBzAfQGnBNz4L/QjIlvRySRji90GGHb3RqzhSJvRrN964E+CYjrzOLAmTl9IrQlqrrvY8PaA1wTuhdePtiBDft4tk9cOzmxcyrL6Q7igPGGs9zG09zUjbPg2g4xf15xUBkUAVtSohHpW9e8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezpJvUp5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso7618063b3a.2;
        Tue, 20 May 2025 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771326; x=1748376126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=ezpJvUp5juIr81oOiNXbnrFgCZwOn9PXVpPmtE/GAyygtvqJfLoKOF+gA9RhhoPTrF
         XA9SJPFnnHj05RqtWCH/wYbskV/NL664WhrCVEOwKxpQg3W0765AcPO0C2c2vH7Alu5C
         oKyfhJIOBm0ns7bMj7Pc/7oaRq9ZiK3RPkBIgeMREsaUiUczqHWCI8ePgad6G8SnbyV8
         EkVzES9h/TfGwI5ddupd7LNWf1muE/vKUuhSsdq/XzP+UoBX1TrI/dqj2L3XAX5FXth4
         7/blT7st7FWyxqKjC6t8+Rf3euNFP3o4YUIDMv5vJgjTgBSIHIONt+prBUgsV7Wjy0WD
         0vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771326; x=1748376126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=rq8I9+XbjNabrUFYGwiq7Fhuu3yzNBr/1LpxLMK0HRGTvbB/TGWnUPaBSN0SVDyWiM
         Ql6iqgo6uZO2XY9ZfMg4atwp4KG/D5Ye89V02jSSOtWd3r6wiHDRxiTsDwvm0uEcv7vN
         TfOCnHiQPlwElwhkti7/o19zKGbnNh0YtrMLHVpN+BT9ud57SJU7qNCFrgmkmskmlEjx
         kRoe9CnBaLnHYgyglSaVHrPdS1FnDQqoSvp0HC1aEZLZ9hgugye/M4Qjj3H9Fi53I5XO
         cQpar7aFokvtVB0/KNW5DSkwJefwOMBp/Xwf22KmbMh4gvmHA/3DXPZF3pEvDSnfUYpD
         S0gw==
X-Forwarded-Encrypted: i=1; AJvYcCWEvgB6BjrmmYa+1rOZU14VOoWHLxJxg/FwFD7I8jlnqMYQqoV8cbdXQ3AjT81ha2rz6tGkx7QrmZco@vger.kernel.org, AJvYcCWGIDFi4+Db9/R1G6e2KBxWCZHGp1yW/sRzd0UCJ8jTRMo27mgsjPmdnn7MaUwDQBFU40346QoNpZOvYyzwTdU=@vger.kernel.org, AJvYcCWQEuwyIp2Z21BkDIknxXxanwWthb9HTEaXWpC89OypwetQOnLwcAE4fkf0pwJZ9e94m/We5IPNw2SXn7CV@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5K2S3CMIwIPdHFQCCgq77M9Y87NU/K7R0yl3/tKQ2GSpKnQq
	/uNfN9XsxqEIA7jxNkbK/11DzucURUIpaOwrBbzynM4U7LhjrwLbPVrPXGxuB2YwqbI=
X-Gm-Gg: ASbGncsAOY3a0WSzmUB1fWTS2VU6Cnmu7nkFc9kLWcnhcRkqGiWEmTO6huM2wRHzWRs
	qm4F5FDMGO1YYRsIwjm33joDD7YcRGOl9fo1W8uwwOK1JxIlWFA+fI9UUsKAyHRMnj2+LjhKcfS
	YPztmt4dh8R2UvFH2aHq2rPdkV5M6/SiXWej9aqmCEaRBWneaF/AEbVcDemlJ8PVS5/0eBnM4fa
	2CANgmu6M55V2aSu7OOqcpCQKO7NXmaCYCg9Srqc4SYj67QvFGnDgYQiLBvp0VTmLEE2CTjOP/Q
	0aICfZRpqzWS+SYJ7U+ymPqpgE5hfSjeK+QFQFfPIjCF/1V5dkLOHl1VbseqA8A=
X-Google-Smtp-Source: AGHT+IGupbKGW386mhivPJAiIzzStBvVkq8NfXE2ktxMR1iGMRXrHF0+aT/Q9O1XVoEce0sp1CdPLw==
X-Received: by 2002:a05:6a20:a129:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-2170cde51b5mr31255972637.34.1747771326368;
        Tue, 20 May 2025 13:02:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:06 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:41 +0400
Subject: [PATCH v4 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-1-2d4306a16ae4@gmail.com>
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
 b=M5hJXbl/goJAem+GG1Z//IC/PZa2E1v3pqaTFzunJwsYFk02s0669dI6dFxu7ArHDcdsFQ+XZ
 c1xPI7+iLrABoRq+wo+hj6OWQt3O3XUvxk0xjpnZ8JzblWq7XtYOlJk
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
index 3563492e4eba48b9e9389687fc9ac2a881c47ddf..783e5ee6854b69cca87b6f0763844d28b4b2213f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3435,6 +3435,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


