Return-Path: <linux-watchdog+bounces-1434-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FC93DD5C
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 07:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCDB81F2221E
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 05:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7832D179A3;
	Sat, 27 Jul 2024 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrBrENMY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B4282EE;
	Sat, 27 Jul 2024 05:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056951; cv=none; b=IWpHTuk9L9BUHn6JIx0Fw50AcI4xN1yzJrWCe1u+BmyyesDE0jViMT6IEN6m20uPH/M1nVuFG55aj8GoXlB0XA+QQ9VXiI87MeHqc91GFgvnNVqsvMx3LrOyOKcCENJeWuGhpabuJWjamvCMo5Zo+m9TfFs/CkEg5ozS2atnkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056951; c=relaxed/simple;
	bh=/2NWqLRm7vR2tJQCwRFY6lKLcDi5Nvh2hiXFpvYNEVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NP+zg017HiOK1UZkzp7EK7UnV7N6ykZcaBlky0vMhG9OZbDmomJ3avM2c+6Wd9H5cQ7uw7VFiEeoCX2nfYo23Ox+7t9OyDHDC6LB/YAuRQ9XM29MyeD30Jpw/oitUYRCrtGYRgBXCfru+cIsanRzuhEGQgp1cbkCkNIczzgTBx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrBrENMY; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db1d4dab7fso753496b6e.1;
        Fri, 26 Jul 2024 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722056949; x=1722661749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jskn060TGJq5Co5vXiUSQP3ayqytOiAl7GKb00mvlwU=;
        b=hrBrENMY9inHxJwxCqt9AZFkPfIdQigd5oOzMOTFA6oTe0aykftBDuhai2hyDOIAkW
         oXNAPP0nrosBDzGw4F9sSGCOw670XKagkqndxFxpH3hrvml2Jn7cNndtjP2YvLWUiiDZ
         WH6K160HqVQzb3dYF+U83UZqzdypEeBhZu4Wd+JRgw1p6DwXpsbbGgMZyyLRHBtiFv5q
         3yOSdmDBz2RiFPuQub/1ywnOYYsUUD/oGHos3jjSOBUvEiqff1pDz/6HVRWR9SqUMSsN
         Pfgzngk96TJPnGU8iM5noO7PQtlLe8Z608+zUPfd9iWIXCDkts36jJ7R4S1Br++NnumB
         i4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722056949; x=1722661749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jskn060TGJq5Co5vXiUSQP3ayqytOiAl7GKb00mvlwU=;
        b=vdqnYOik2/ykjcoQMDDVwEhqpQODXZz0luFib+r3Manlj20/MaPSeS8ebCTmbJ28YO
         SQyfo7G1SlrAVq+tyFTsK9xBO0Mud3mJHJi2XiqwKUlJU6xEyA9BK+XiDWK/qHZNdryq
         l/3o3RE2eibH+wp4WcgyvdGh2kcJ/rkAsIXBsKRK0pDfSWBYNov58S2PrQeAsou2VG6d
         TUqPyZerPiSYQY8YCOejBpBaa4pbXJaYDThdTdq/nztikJ03hfObJa1CZ6+dkmqGV0b9
         356vWx26VmzFXLRakoCw2tNg2hZJnHyo4ctJrzvg6QX4eXV+j2gG2d10W/DS+B8PVp2v
         o9XA==
X-Forwarded-Encrypted: i=1; AJvYcCW0hhhlF5zF/ud5rN6kMW+czePteMuzHuLXqkyOzDRI1OF0EyFxb8OJt1vqQYdT0FzhhzPT7IQKVBMX+4g8s0iytvMpdXyyaeTLeLvR6WsBG6p+Ad7krmrToa1EZ13h6pq90UNNce2gkzJTphU=
X-Gm-Message-State: AOJu0Yx8HehWuZENfFe9M7XUNXsdDGN63YPvyPzu3aJRb9RJAsRoYDS4
	x9KLzXHLTnQ/dSFZ/vefFgOCDFVWwMvGL+wdKs4nzTCGrW8e+xEE
X-Google-Smtp-Source: AGHT+IHrBTWJGfiE6gm3x43/Am7Z8OjiEWDYyi4+knnsglpPE5cEkP1i5OP/IB1blYEMALI7+f3v2g==
X-Received: by 2002:a05:6808:1387:b0:3da:bc74:e9c7 with SMTP id 5614622812f47-3db23aa5748mr2335158b6e.38.1722056948839;
        Fri, 26 Jul 2024 22:09:08 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:4245:58a3:6108:fcf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead87a372sm3495756b3a.166.2024.07.26.22.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:09:08 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: timer: ti,davinci-timer: convert to dtschema
Date: Sat, 27 Jul 2024 10:34:43 +0530
Message-ID: <20240727050736.4756-2-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240727050736.4756-1-five231003@gmail.com>
References: <20240727050736.4756-1-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt binding of TI's DaVinci timer to dtschema to allow for
validation.

While at it, change the file name to match the compatible.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/timer/ti,da830-timer.yaml        | 68 +++++++++++++++++++
 .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
 2 files changed, 68 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/ti,da830-timer.yaml b/Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
new file mode 100644
index 000000000000..e9646f4e86cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/ti,da830-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci Timer
+
+maintainers:
+  - Kousik Sanagavarapu <five231003@gmail.com>
+
+description: |
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
+    maxItems: 10
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
-- 
2.45.2.827.g557ae147e6.dirty


