Return-Path: <linux-watchdog+bounces-1407-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A40938596
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 19:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFD8281247
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 17:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77595380F;
	Sun, 21 Jul 2024 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6rLn3AW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5616A954;
	Sun, 21 Jul 2024 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721581760; cv=none; b=Z/s0/6Py1a82BbgaJflzWITuOS11FzLChttQTX8clYsb8NQV72xa7Yt78x382DBpl3QSgvOo3jcdxMsF9zHf5+pYIBIyh4DiK6mX/ZyijKgTDnqPbThH3eBdS9hRCs4c/tGdaiXIr9y0q4E0A3UpAOj1WzgPrRYVm2b5D6XuhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721581760; c=relaxed/simple;
	bh=mgXMk9207gSsRQUmrkKWubb5TQ6pXEwLYXpKlHkkwRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zvttb1OaOvrIKKYy2x/ljWpzx90eolVLZC8KTQKUdkHKphp9gmJy1T6c7PZZR4dDjOvjDIdsp87uAbAaDeWy+HRMprlnzQWkXfjv01BtG9hoTGS5KsZc05/dqr5gi+K4cbvK/E2xO01LGjYb6eriFy3znedr4VGng/m088ZVoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6rLn3AW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d150e8153so511987b3a.0;
        Sun, 21 Jul 2024 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721581759; x=1722186559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+xFnJLXKFSs1rD/pdMgqeISRYaT8z33SQNfYCihvv0=;
        b=m6rLn3AWso0Nl2pbIRyGNZ4ynCIGODz9C6fWlT1PSNsi23asFb3/PabHWraZtJW9me
         JARnQVJvomzUIWD2QKlWAfe8yzeodC1xWMWIyQm/6Xtfk/4+QZJ8yJZW2k/GIa8kMPl+
         MvsUT5nQAG2ec9F/6oEoDgo7BudK2YrYnF5jZ3sQymtcF53Q1ZH+re1VIdKvd1qc4PGL
         VnBrCdyajo9I4uaGIK12ifgPbgdHIgF4VyVWB4inaeh7WLyYg/LPaePiCmrboR3HZCiP
         RLGKxHuvyspPrmBtY9Kh/FsVKkXjZrq/ZRJD482Q5+ZIkyUnpXbVKKjKvOSSMZ0+8IAg
         6L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721581759; x=1722186559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+xFnJLXKFSs1rD/pdMgqeISRYaT8z33SQNfYCihvv0=;
        b=G+IWqp+tQPRQASEiv74evSSB/dQxYmNBvekyVRdAXPpt07zxKiEwEEJD0KCqPUHMDW
         RdfSQZ/YK03qPbOEs0BqjM4y9+Qe/WNYu8VDRIFa09Cp2Pi4kjE663jS4GFN4g5kXazd
         GQwDywrgso9hdskywQHOl9LPmNm13b3gTnYnvqtxVNo0+8zomLSa54UP/iR/dvoE4AjQ
         palAK586rM+jwC9Y6eFVIGhWa10HdX4xbzPEZdbT9Te4096kbhBR2jV0vVY7dd7nC/WJ
         IIWN8Rk+2t+qqE2VguPkwuqDEBVCOR+BhWsiT3kzf7GVHzF7D2QEoDIrvjIWJ09pUJH+
         ArDg==
X-Forwarded-Encrypted: i=1; AJvYcCXNIyXXBKI7l6AA822TacLUteiKlU7XFsMxxqximUtEx2oLGAvlIJp0p2BLUrntVi1JwOY1Fr+NAL4P95C4OM3AZIZDqExHi7zhgJQGnvv7EZU62B2zwp+aEX/mnN0cQNcrjecRfP910pnLxvc=
X-Gm-Message-State: AOJu0YwPPvNQGuWoUas3Ra3gG5v9Qg1uk7HadW6mg1uykhF1+Zuc5enG
	5ggnWZ+WdlPunta376WUqOylywgoh9duzt99q3e1ggqUS2aroZjP
X-Google-Smtp-Source: AGHT+IENAylm5O+0sTieY5CFralyVXeCUeaCnUG9F/PIBeQRb/dRfNNLBPxjkB3W/gCU0FJWFl0g0w==
X-Received: by 2002:a05:6a00:1954:b0:704:2516:8d17 with SMTP id d2e1a72fcca58-70cfd51e05cmr14110055b3a.8.1721581758481;
        Sun, 21 Jul 2024 10:09:18 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:312d:f66f:2b12:abd:60ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d285943e3sm417810b3a.213.2024.07.21.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 10:09:18 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema
Date: Sun, 21 Jul 2024 21:58:35 +0530
Message-ID: <20240721170840.15569-3-five231003@gmail.com>
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

Convert txt bindings of TI's DaVinci/Keystone Watchdog Timer Controller
to dtschema to allow for validation.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
---
This patch was submitted to the lists before by Nik

	https://lore.kernel.org/linux-devicetree/20231024195839.49607-1-n2h9z4@gmail.com/

Although it seems that the right way include the "power-domians"
property was not decided upon (read through the thread).

I grepped for instances of "power-domains" in ti related SoCs and other
subsystems and it seems that there is always only 1 such "power-domains"
phandle

	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

The existing dts code also confirms this

	arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi

Again, I guess it would be great if someone could point out if this is
right - so RFC.

Also, shouldn't "clocks" be "required"? - RFC.

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
index 000000000000..1829c407147d
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
+    enum:
+      - ti,davinci-wdt
+      - ti,keystone-wdt
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
+    watchdog@22f0080 {
+        compatible = "ti,davinci-wdt";
+        reg = <0x022f0080 0x80>;
+        clocks = <&clkwdtimer0>;
+    };
+
+...
-- 
2.45.2.827.g557ae147e6.dirty


