Return-Path: <linux-watchdog+bounces-1430-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792893D593
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 17:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F081F22FE7
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jul 2024 15:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008991EA6F;
	Fri, 26 Jul 2024 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUCYz4CH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D907494;
	Fri, 26 Jul 2024 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006370; cv=none; b=n4xTvoQ0wo+31kMSX2UKMC7qQFWJ8rCcE3YhmacTxgBmk34NW5YOPz7BjH9VsMil/EEKaVhj80PKeHKuzkbYGmpdFpk5T2xZK1tLSq+61kl3wgsrL6zkLjemZiFFMy3c6QJ3jsTu2e1ldyQL34HhboIeHFhFbiJrHVbsHaskI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006370; c=relaxed/simple;
	bh=/2NWqLRm7vR2tJQCwRFY6lKLcDi5Nvh2hiXFpvYNEVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYvSqcko0fhR4gOFSftKuqUW29nIjEEZOJLp+rFPA4b0qt2h+wTDF88SfBN9mEgPG/Zp4n8SWTItCgV947AOUWuKcO3/jOFyHNtgsuy9u9xKH3jHrqCsUDu70ZJBM4rhrdL3tKxj1XxdBJabATTnoZboghTW63Ly8Xt5CnWLLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUCYz4CH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d1cbbeeaeso909650b3a.0;
        Fri, 26 Jul 2024 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722006369; x=1722611169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jskn060TGJq5Co5vXiUSQP3ayqytOiAl7GKb00mvlwU=;
        b=iUCYz4CHmB65A0Z4JopB4hvlTNOaWgEfiFkf/rKw69Kl3MXqVBgF2w/kdyY57zlrR2
         d/VEI52EX9nbsi2YuFJ+YOGMwnAYVktwwQlGM5sTiCyisfImHJUmjnAOjnp3JsE477eJ
         BrAtTdzQSdK6sSuyzClKAIuTibQpyMlDe3nTJ+rHmGZ+UdgiiZN0pYdRJCWotrWmoYRM
         0PT+pTOtC8X1igY41z9Eb4X/6JxTNkVyB/8Xd7/HCMqRdpR2FCtMIAfOyB8qerhMquuy
         WEUEIkIGvX8Uqv22+VorjvkzFZSM4NM3VvWcocOQtOyzEgOAM2NhmYxmos7E9Yvcsj/G
         yV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006369; x=1722611169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jskn060TGJq5Co5vXiUSQP3ayqytOiAl7GKb00mvlwU=;
        b=l2fTTidfx60lciAiwOQurDRKzE+a/jR33dzr4/MeNaUSk2aLp7usZXjKLkmHlHwX0m
         VPB1+T6hnuUwBP7vH1sGza92u5uJECgmNblg6SpfNk8MQu/HHvBNqrN8gOh5BZv8oQmR
         1Px5EopAeoQ/e8U9JbwIqVLv2JnuihAmYdWIlRrh054yyZXeG1MuBSSdfsISDP754MOf
         sUPnBZKI2peisvPajeQysczfl9jeESAnb2VU6MQ8BiLRQ0PFASR5qB5XAw5Lvlm97LEO
         YougsJYyjckVafCT+ezs83lB1f7paTkvDBIe7RRpOwyvNkaResRQ8/WMH/dhFEATdvul
         YZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6NkLboc5fI8Jj9MsfY9hIP251kziIYgdTkuTozQyg/zHsW0zzxkVEBdbM16ilj2H5LhNVhb0mP0n37ECxKvlLjlUujzRtZQcajegyyFnHkMrSumf+n4Ao0BzNQRhPhvt64E4HbJmfVIDxRIc=
X-Gm-Message-State: AOJu0YzjbS4kn8Lzw6lCZo4Z5o9KKFF2XjfsTOkJgBSPQ3jj387rFSoQ
	fnpZDql2hR7jpvl72Zuy5Hd1WKjNOrHOWCjKVZvGYq1KAVhZrUcT
X-Google-Smtp-Source: AGHT+IGCgsljrwtacMSBHzuCfqSGhAbgRhfBypR/pk3i+Tff1agL+I9MNb78FSYrbWrj9oFCgIe5hA==
X-Received: by 2002:a05:6a21:6da9:b0:1c2:8efc:88e9 with SMTP id adf61e73a8af0-1c47b2cd35bmr5363146637.40.1722006368648;
        Fri, 26 Jul 2024 08:06:08 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:8948:e4a2:69fb:4168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7aa9b184139sm2357653a12.75.2024.07.26.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:06:08 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: timer: ti,davinci-timer: convert to dtschema
Date: Fri, 26 Jul 2024 20:27:49 +0530
Message-ID: <20240726150537.6873-2-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240726150537.6873-1-five231003@gmail.com>
References: <20240726150537.6873-1-five231003@gmail.com>
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


