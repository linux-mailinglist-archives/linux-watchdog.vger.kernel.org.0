Return-Path: <linux-watchdog+bounces-1425-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4593C699
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 17:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B37282F96
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jul 2024 15:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D219D8AE;
	Thu, 25 Jul 2024 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwyXq7Pb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D95519D064;
	Thu, 25 Jul 2024 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721921865; cv=none; b=NJ2H1B4L4iKeSZ3rG0j/1MhSzhs46MXEinkTsGmJc8oIQg7EtHXIr89AX9eVs8AMPxFTH+WR2gwIlT84NadvcrCArQBVfdRyL7uJbnOQgfZyKSUprZv94c7KOZTnhWkRRkF73BozjNlvK/T/R9C40fEchaLLfaTG4WrSYXhebnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721921865; c=relaxed/simple;
	bh=03tZ91A7YswpGipNDG8v4RkhR31fXoTuQYG/b0jTBkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHbvsDQpAOhooK0ZHTN0sqqBsNB7SPA3dlbyl2DrnbT/Uy1O7lOLAgzyO9B95lry21mmju3vTJ1Xx8iRd2Gyi6YxXeJQ4vATqVx84OtaJz+S6c7X8dgvHMAHXhho6sd+YXR9i8Gp4stQxgxYAByEtQvLBnGxzlUM67XndG75cmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwyXq7Pb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d1d6369acso1505061b3a.0;
        Thu, 25 Jul 2024 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721921864; x=1722526664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB3U4ho8ahoK7TZq66NQYIOWRcyNe+pRLj7UvJ+F/Mk=;
        b=NwyXq7PbaC5Ts3fwvZP2blv3tyO3VAosMyd7lEzarbn4i41iJSp55areC1SUSTnuqh
         TsiEzVN9B4/D9FUaCTAo82ucesu4RkyvAVJBzuadp/Jnr0nNO9XcitP44pp8qheCVBgb
         c4K2UmWaZuXSnUTwGs1UOl0CAK4WmRBoKn+lkPc8f3fH3GN56Jmts6mHDlFZoKdqIm02
         yXPY/kJXALoFNjQDT3/tTafdrUsqhA7nxvf9F0yuzoSt8j8Ak4a3HlI6OI7y4x3RwHrt
         vcA3r+/Y3qUz+kuTf1LGcH4cZK6b7C/j3G2gLxMnjyRQgQgDxxN5/vpRY0dyVeKGUObL
         P2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721921864; x=1722526664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB3U4ho8ahoK7TZq66NQYIOWRcyNe+pRLj7UvJ+F/Mk=;
        b=JdV/sU/HH2cNS/0CQbLLmBhPl0sGtDVohJ80gu1eG3Xkb3IjLvviHUFZNQsi/Om4WB
         dL+YleuP03QhX7BoG+2vFs+fLeEy6N/wqyAvItQHosCg6e6ZpQGccSYa5F5lrYUypFoS
         +qEKWu1blmqMKIZawZzSbLOzNRHoGpxGHAdiNVV/Ic2cngsUq6MBLtw69O9etxMJ4CTs
         64pz/2OFID0rgL/gL+a8aU6FwyS/J5VbfiitiC7nibUy2BBm+6BQhJ+vprDyaChSEpxG
         mZeFUAsPYDnjuXWA/1k4ofnefa4yYDDZeYGzn7yS8Tl4IBpRgjLzmekrJey9o9mkC4LZ
         lVJg==
X-Forwarded-Encrypted: i=1; AJvYcCXARIlwkqEnf+X2TclOuPmdcoB1s+Z4t7rASCO3g5JETHZ8IBs+6kUzMaz57dndHOuMj2Y1phTzCAZbk5Ob+hmddL1BFZ6oobWLvyFM2Slm3J9jVTeu8D5Z1LxNMVX/CSngPMsR00cwTbPKmO8=
X-Gm-Message-State: AOJu0YzF/uVT6HxuIemTRTALJ8EhGu5GIT7RsSUx2fTvFHwDFnW54ZfL
	5T2B4rccABhOc3ajqgqt7fQZM208E80pWzyqYkbZoVVeCUkBdogG
X-Google-Smtp-Source: AGHT+IH8LuTEEz0kza3Ip2eiNoWxdeAVnurWiI0Y3XxzeXLcMZEfQ9CODVkP4VrmKdhSHSaR9QxW+Q==
X-Received: by 2002:a05:6a20:840c:b0:1c0:f0af:60d with SMTP id adf61e73a8af0-1c473c5d298mr5172338637.6.1721921863552;
        Thu, 25 Jul 2024 08:37:43 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:2afe:8fe2:1930:3917])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead712bf0sm1270369b3a.74.2024.07.25.08.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:37:43 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema
Date: Thu, 25 Jul 2024 20:33:12 +0530
Message-ID: <20240725153711.16101-3-five231003@gmail.com>
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

Convert txt bindings of TI's DaVinci/Keystone Watchdog Timer Controller
to dtschema to allow for validation.

While at it, change the order of the compatibles w.r.t. the txt binding
to stay in sync with the existing DTS.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
---
 .../bindings/watchdog/davinci-wdt.txt         | 24 ---------
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
deleted file mode 100644
index aa10b8ec36e2..000000000000
--- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Texas Instruments DaVinci/Keystone Watchdog Timer (WDT) Controller
-
-Required properties:
-- compatible : Should be "ti,davinci-wdt", "ti,keystone-wdt"
-- reg : Should contain WDT registers location and length
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-- clocks : the clock feeding the watchdog timer.
-	   Needed if platform uses clocks.
-	   See clock-bindings.txt
-
-Documentation:
-Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
-Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
-
-Examples:
-
-wdt: wdt@2320000 {
-	compatible = "ti,davinci-wdt";
-	reg = <0x02320000 0x80>;
-	timeout-sec = <30>;
-	clocks = <&clkwdtimer0>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml
new file mode 100644
index 000000000000..f1413e7370a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone Watchdog Timer Controller
+
+maintainers:
+  - Kousik Sanagavarapu <five231003@gmail.com>
+
+description: |
+  TI's Watchdog Timer Controller for DaVinci and Keystone Processors.
+
+  Datasheets
+
+    Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
+    Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-wdt
+      - const: ti,davinci-wdt
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    wdt: watchdog@22f0080 {
+        compatible = "ti,keystone-wdt", "ti,davinci-wdt";
+        reg = <0x022f0080 0x80>;
+        clocks = <&clkwdtimer0>;
+    };
+
+...
-- 
2.45.2.827.g557ae147e6.dirty


