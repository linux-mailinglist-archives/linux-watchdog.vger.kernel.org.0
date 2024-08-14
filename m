Return-Path: <linux-watchdog+bounces-1490-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B00BF951436
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 08:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A8B1F247F1
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 06:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7442757F3;
	Wed, 14 Aug 2024 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5pz4d7J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445487345B;
	Wed, 14 Aug 2024 06:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723615955; cv=none; b=cozMG8ex9m9WcnIiU0wn9LVX1SBUrkRGhHK6TwUKXEOITK6WaRpzp2cumDZWCkzco9U+dOSRMTtLD06tL4R27h+P4CDQsQD4TKZVG6YT9HMXAozmrs9F9g+b7sr2m71RWcaDRy4QFIW0LPdXbhWooJ/2QIxUGW/NnkqBfYfLqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723615955; c=relaxed/simple;
	bh=q286dyo4TntvHLHiIPsmtqW+4bsjtjwx/NjK8sUccpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGUsy6MhNYXqiW/WEwGT4qdB4ezXaZioiKI0xOv2AGufDnQpvNsYi2i4qXHpbbLa1mouMD+SCHGsziXMrK5t4X2T/oLUn6E/EVe7ILSj1IH9q+7teDMJ/LAkz9w3FtRw4P3vzsxtcv0WbcdXYVgOxHfUT3ppFXRZ+jcSTnGqCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5pz4d7J; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-710ec581999so3186751b3a.2;
        Tue, 13 Aug 2024 23:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723615953; x=1724220753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OPLbhHV3Ad26qETlz+1LjUQ8aQfeRHHfGng3CkRPUMY=;
        b=F5pz4d7J9/CtdVyAWSuFUaxwc2hrEx7yTDUyUCkA8ILHHx5ICCKK99nl87mlqO9XmC
         hlKwoH9yF7uaMHG4z7zGgggJvgE7Ji5AUl6eRY0W9/7ewXddUOIJ3s3a8gSzS413NiYB
         ygcubSP125ZbU4LrVe06MT7K8Sfs231oft8Syj0cm2/NfMQT+1Km6FEhI6XPK4KsksO/
         A7U0i8jqUn3nWhOWTejDKclNAcQ6pq9zKqFNFoWF39aAHIPuf7sERERS10V22fwsiDia
         xpRcnwbmGekWnjbqmdZvAWYMCmqVgWEmX/tiQFST+cDtxTYKbT2V9mpa2JUSeiLp0Sjw
         sw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723615953; x=1724220753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPLbhHV3Ad26qETlz+1LjUQ8aQfeRHHfGng3CkRPUMY=;
        b=XL1EqoH3GWjVu/RET/+qp/AJhGMnxEt+s3+dKVCLNpOn+XG0aPLip00osMxyr0OFRj
         77QhjrfIfBj8AKtyxNMrzhamW4iR2seKu7drs7bgPRFTdF18kWumAipm8lolEA0ezDRB
         GKVAzLXleUmxcHTMPSmGsTlAwc2dWIdHWCIX5E4JICFwbS44fLeed4EDy2PUBL+zqXIy
         IKG4rRFjS8Mb2bQ/hhkhBhVBM7M8PxfgX7KbOqK4W6pFQ2Ff8qPMRNojL9QBWqbseZJ4
         Q239eHcaj7NbjC88qXh2Zyk9dRXtMI/F9tBgNs7wlHxniscX9JZcbGt/lXzd01h3zAau
         SJbA==
X-Forwarded-Encrypted: i=1; AJvYcCVWvxgyiTA+EZosAdERnCo7vIro10XOg9w7pGYR7WMmg7V/gjkbPM4+v+1Xp6YSw101+jjr2QL3g+sQUFBpc6AfYPkEZe+B0F56V8ejj5cNRPQLMafecQYQMaAarhi8xB1hINT9BLGdUFThegKV2SVblloG87bnxVMqlWQT3wnzOsrgFPwR60wT
X-Gm-Message-State: AOJu0YyhlmFNvNzgZithK4+2U1EnFPOny7dVZw+8+9iXa68TikOmqIkg
	bDYD9iDJxZf8E4Oi3yDFqIuZaIoQw36DxWAp6oqkMi7KXNzlaxyJEsT71HxXDkLINg==
X-Google-Smtp-Source: AGHT+IHMiMkhTc5Fb6I+vx/HqPohcmofXYfWD8lzPfYilJbZPDE0D3Ms/u4+Q/Bkvo99p7SmkGuz5w==
X-Received: by 2002:a05:6a20:c990:b0:1c6:b45a:df51 with SMTP id adf61e73a8af0-1c8eae97a2cmr2617444637.30.1723615953272;
        Tue, 13 Aug 2024 23:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f4:a3:69e7:e4a5:a146:b390:f262])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7dcfc7sm708732a91.14.2024.08.13.23.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 23:12:33 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: nxp,lpc1850-wdt: Convert bindings to dtschema
Date: Wed, 14 Aug 2024 11:42:03 +0530
Message-ID: <20240814061210.56213-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP LPC18xx Watchdog Timer bindings to yaml format.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../bindings/watchdog/lpc18xx-wdt.txt         | 19 -------
 .../bindings/watchdog/nxp,lpc1850-wwdt.yaml   | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/lpc18xx-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,lpc1850-wwdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/lpc18xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/lpc18xx-wdt.txt
deleted file mode 100644
index 09f6b24969e0..000000000000
--- a/Documentation/devicetree/bindings/watchdog/lpc18xx-wdt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* NXP LPC18xx Watchdog Timer (WDT)
-
-Required properties:
-- compatible: Should be "nxp,lpc1850-wwdt"
-- reg: Should contain WDT registers location and length
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Should contain "wdtclk" and "reg"; the watchdog counter
-               clock and register interface clock respectively.
-- interrupts: Should contain WDT interrupt
-
-Examples:
-
-watchdog@40080000 {
-	compatible = "nxp,lpc1850-wwdt";
-	reg = <0x40080000 0x24>;
-	clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_WWDT>;
-	clock-names = "wdtclk", "reg";
-	interrupts = <49>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/nxp,lpc1850-wwdt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,lpc1850-wwdt.yaml
new file mode 100644
index 000000000000..52878fdbe3ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,lpc1850-wwdt.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nxp,lpc1850-wwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx Watchdog Timer (WDT)
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-wwdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Watchdog counter clock
+      - description: Register interface clock
+
+  clock-names:
+    items:
+      - const: wdtclk
+      - const: reg
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-cgu.h>
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    watchdog@40080000 {
+        compatible = "nxp,lpc1850-wwdt";
+        reg = <0x40080000 0x24>;
+        clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_WWDT>;
+        clock-names = "wdtclk", "reg";
+        interrupts = <49>;
+    };
-- 
2.46.0


