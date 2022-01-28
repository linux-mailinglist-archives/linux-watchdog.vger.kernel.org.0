Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10F64A0249
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jan 2022 21:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiA1UtH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Jan 2022 15:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbiA1UtG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Jan 2022 15:49:06 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C9EC061714
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jan 2022 12:49:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d138-20020a1c1d90000000b0034e043aaac7so6401576wmd.5
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Jan 2022 12:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESpslK+beLC9Gzg3G2enDgpikVrsMthhnTttwFurZUU=;
        b=RP0QkJu8mO0x6vjhFhpMD0CnzenWOihV+I6CsFJCVRy1BUBlML6BMv5TM79Q6UwVzV
         Q49gSU5/RYQINK6HLaS5CXWV3+8gDGaSMWIHm/ccFn/BRCXaIOpv10z43Agz3ChPuvul
         3RXA5KAwqmXE6cdaADXIegXtdIqwlWYcpe0SLKrVgRMwzPUc9X9C08MF/UzWhBd3dG8i
         S3T72uFAR+EnJuBdZm1HYdzgaIvKDCI52JDclgzSjeiNiC2MNQqVCcPUi9qr8nU46E4S
         GGjiWSElUEP+4eoS2KPXkIJ5BuboqXsCAWqTi4pWs/QmGi02kjrzhXRoAGYb+fygo8c3
         DXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESpslK+beLC9Gzg3G2enDgpikVrsMthhnTttwFurZUU=;
        b=epxtUjbQqT15kNta0fwMkCv49cDkSPgPzMBAu7NqCGbX5323hWWguwH+jz7IE4dHi3
         dZxeuRxs6ZdJNyCK2SszVg7rROGo/G8G0PcZS2TyhWpRA1zjRi0psASfxmlW8eFP0g20
         mcuLM61cl2ZBWohZpAW3W86e2HY96nBTcrQaFzGIoEZWKFZXUnNrlLIQWnvaA829KgNW
         umGN8FbJ/NwKJE+qO7KZ2jdBukElQTVdSkt3cdoXJUCc7SyxsUxJvKVAIrxrpguU5YKT
         Rk52HA1Fa2gxsOzMf0fdEc49m7n2AlVXWyo2CfF5Nt5GSEIZka1//k16rLoGJ5NwAQNG
         xTNw==
X-Gm-Message-State: AOAM530xIIEBuUuU3iVakc2rhJ0GnZTBrZl6i0QS6FUuA9fRhQIPBq7C
        frfNCHcvYcmS7WyHCEXWc16k4g==
X-Google-Smtp-Source: ABdhPJyRLqDpTjXu1yxfsjJq5ifIjnvy4f+FrKjjZCvZEITvEPBmieIMqU1Z4SOsk40t9IJp++Qv3w==
X-Received: by 2002:a05:600c:4f8d:: with SMTP id n13mr17088213wmq.45.1643402944959;
        Fri, 28 Jan 2022 12:49:04 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l10sm5453398wrz.20.2022.01.28.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 12:49:04 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, linus.walleij@linaro.org,
        wim@linux-watchdog.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: watchdog: convert faraday,ftwdt010 to yaml
Date:   Fri, 28 Jan 2022 20:48:56 +0000
Message-Id: <20220128204856.494643-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Converts watchdog/faraday,ftwdt010.txt to yaml.
This permits to detect missing properties like clocks and resets or
compatible like moxa,moxart-watchdog.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../bindings/watchdog/faraday,ftwdt010.txt    | 22 -------
 .../bindings/watchdog/faraday,ftwdt010.yaml   | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
deleted file mode 100644
index 9ecdb502e605..000000000000
--- a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Faraday Technology FTWDT010 watchdog
-
-This is an IP part from Faraday Technology found in the Gemini
-SoCs and others.
-
-Required properties:
-- compatible : must be one of
-  "faraday,ftwdt010"
-  "cortina,gemini-watchdog", "faraday,ftwdt010"
-- reg : shall contain base register location and length
-- interrupts : shall contain the interrupt for the watchdog
-
-Optional properties:
-- timeout-sec : the default watchdog timeout in seconds.
-
-Example:
-
-watchdog@41000000 {
-	compatible = "faraday,ftwdt010";
-	reg = <0x41000000 0x1000>;
-	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
new file mode 100644
index 000000000000..377529b21267
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/faraday,ftwdt010.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday Technology FTWDT010 watchdog
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This is an IP part from Faraday Technology found in the Gemini
+  SoCs and others.
+
+properties:
+  compatible:
+    oneOf:
+      - const: "faraday,ftwdt010"
+      - items:
+          - const: "cortina,gemini-watchdog"
+          - const: "faraday,ftwdt010"
+      - items:
+          - const: "moxa,moxart-watchdog"
+          - const: "faraday,ftwdt010"
+  reg:
+    maxItems: 1
+  resets:
+    maxItems: 1
+  clocks:
+    maxItems: 1
+  clock-names:
+    const: PCLK
+  interrupts:
+    maxItems: 1
+  timeout-sec:
+    description: the default watchdog timeout in seconds.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    watchdog@41000000 {
+      compatible = "faraday,ftwdt010";
+      reg = <0x41000000 0x1000>;
+      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+    };
+  - |
+    watchdog: watchdog@98500000 {
+      compatible = "moxa,moxart-watchdog", "faraday,ftwdt010";
+      reg = <0x98500000 0x10>;
+      clocks = <&clk_apb>;
+      clock-names = "PCLK";
+    };
+...
-- 
2.34.1

