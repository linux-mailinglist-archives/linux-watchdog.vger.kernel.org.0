Return-Path: <linux-watchdog+bounces-1424-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F293C697
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 17:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0A9DB2295D
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 15:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD3A19DF65;
	Thu, 25 Jul 2024 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P67Eu/mU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359219DF43;
	Thu, 25 Jul 2024 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721921858; cv=none; b=IB2z24gvIO9sgvIoaYIXEe9BXgedqLvfsFUxevWq+hGHbrHeal9NHFRSO9zklxeeMHjXDc/g5e8odvZc07ftEa/Qw/CoG9R0wuInWV6N5fgfWsKIONGKcoD3ur6JcKcA6LUt1QhYfsTFJOoQBuB41f0sjAM5aGQAxqjvWyOT7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721921858; c=relaxed/simple;
	bh=FSuF3PAXT4zQN8uB5Wd6/bf7kXarkHcV3ZrYugItyaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT4fwEvAnExGpf65TT+baBL039HxUO/P1HSXE86kfCa45uoNWfBolmRquB2rHin9IQBU+eLUcA/zTwwSh7q70+8mEZJatW3y+XtU0H7aw9ZUw+YewSKH6LbuGW8UlyEGj4BXX9NYnDiqedIFkOMPGpPQZylHul4RwkvG2pfKfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P67Eu/mU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso891514b3a.3;
        Thu, 25 Jul 2024 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721921856; x=1722526656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSPbC6awA+5MuLH5Ham/jLJImap7JGiCNhiiQ9tr4zU=;
        b=P67Eu/mUf/FXZVwbBeJaYUwUG7I8lt8A6J+0HrelldSoXEbAdN+te7eoCWPobhWTzw
         aaf1mt/zUkd6Znnz07MTjSlBMpFla9Eedru2cDV9RC9xKXfxjm7w45VJAPQtzsY6Tebx
         vORrVAjpPCw0XY9jhAo7U270MwWz1+PzlE1xc+kchxRgXXiMX2Zz8yWKGOZjWRjUPwkS
         D1Efx7HMcbPdfleVJKE7jUxhqCH1vsDey3SgKESkuLt4Iab2L3HwaYY3uVnG81LaXKTl
         rbL36I3l7k74bMNRM3b0HSMkE44ScQU44jb4wuAO1ieGbhg+yFcX/cBuDtu+s0QvVTAH
         lxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721921856; x=1722526656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSPbC6awA+5MuLH5Ham/jLJImap7JGiCNhiiQ9tr4zU=;
        b=QsNxdO9+o95cUlBEmE2zmiIDzRvTpkbU+JoSNy8C5wgy5xvCzpiwJVKAqlQVbK2swn
         Or5D0vTTyqKDGb6y+Db9nIDumwpK3RBbmXNpO/Kur8il6+XqS8d1331A46bwCj5PxrH4
         o/SrHBMLBdOUhBH+E4sHs5I/Tq9c4KONIJUY2aTaL2iYNLzl+XUapDANQEY5t2YQdneh
         bqI4isuaJqpulo6E6K5+8ZgXZjF9YdozM3zJIYpd9PyKYUbLUgGzfzzY9PYrrB3uWC8n
         zwgIbYXwOdx/avSghfyRzKR3eTlaBgFu21zBXL1txU5NivwgZMbW99dPhzieXKrYk8+d
         666g==
X-Forwarded-Encrypted: i=1; AJvYcCVnjjPrb3jEG71xbvcMl27I0vvJfix9XlEbIpvuZzRhC+Hc2a8OOVSc56RZrrV6ZeqGZ42nzNf6znaOE2H/Zrsq8+4djMFQ9Jx+Ga9iwU2cEIecktiXL1CSTHqLBXxpnUOgdbeNjo0wJDRE+To=
X-Gm-Message-State: AOJu0YzZhlaFwWwIrwk2kksHHCEcdl/WSriqEAqRPcz0dPA5SIOcmFkc
	lQpCcbbi5RBWX6FkC9uE/OxGXhFqzXsd7fViODtyJDJ60Qwe0yqa
X-Google-Smtp-Source: AGHT+IHEh3D4Q5lbwKorUo7rZ7g98q+7yG488EEaoxz7a3qecqJYhmh793yvic7TFbjY0Jjng52ShQ==
X-Received: by 2002:a05:6a20:a12b:b0:1c0:e9f5:f6bd with SMTP id adf61e73a8af0-1c472ce2ec2mr4678766637.41.1721921856110;
        Thu, 25 Jul 2024 08:37:36 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:2afe:8fe2:1930:3917])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead712bf0sm1270369b3a.74.2024.07.25.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:37:35 -0700 (PDT)
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
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: timer: ti,davinci-timer: convert to dtschema
Date: Thu, 25 Jul 2024 20:33:11 +0530
Message-ID: <20240725153711.16101-2-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240725153711.16101-1-five231003@gmail.com>
References: <20240725153711.16101-1-five231003@gmail.com>
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


