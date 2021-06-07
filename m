Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5626C39E7A3
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jun 2021 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFGTmd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Jun 2021 15:42:33 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38510 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhFGTmd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Jun 2021 15:42:33 -0400
Received: by mail-ot1-f47.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so4322576otk.5;
        Mon, 07 Jun 2021 12:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VaKySZ70jJSosJvHgjAP/lh8fDMXa9AHRHPivIYz6bo=;
        b=f6kWHrtUfifGW/Y07F+bJ2auaVn6N2Rz+mOuoLylLTRovfIdXMwjzztDatNUUbjqqJ
         4q8Yop1F0/T+VnF7wp86caf4/BAdAuuows5AVlFz6Wv7pEeZRdb5HELYOIzwnmEBp7MC
         KMc68jQS2KuXIED3VB4X9IsPY/Xb8dEL3KTC5mEH/80fdRi8mHLg0g9AVFErQo4QkB3z
         GKKV60vpwi16uuLszFwphrDGX28AX/Y3wEsLKCMZdK9YtLJjnDH91niiNbMQKC6JUaMc
         pUQcPdZ+SYhTndFdaHrow532EKSmx8VohIbLtZjDAJajtadsrUQeA4T93ar9XQ9RSboY
         wJcA==
X-Gm-Message-State: AOAM531qqFrY83sHPNllX4IaCzgwXg9TvpJoE+XPxBwCsV/y8HDLEZed
        lNs4+VrCOdlzFEw1VapG4g==
X-Google-Smtp-Source: ABdhPJx6W/m9cTOYX0LJh7RyB5Ur43rwvEjFPssjDCqG6ZwCliNJOMvlNL0EYOnYEUN6BAEztsaGGQ==
X-Received: by 2002:a9d:6d8c:: with SMTP id x12mr11893377otp.121.1623094825080;
        Mon, 07 Jun 2021 12:40:25 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id o8sm2192047oif.52.2021.06.07.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 12:40:23 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fu Wei <fu.wei@linaro.org>, linux-watchdog@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Convert arm,sbsa-gwdt to DT schema
Date:   Mon,  7 Jun 2021 14:40:22 -0500
Message-Id: <20210607194022.3095736-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the arm,sbsa-gwdt binding to DT schema format.

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Fu Wei <fu.wei@linaro.org>
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/watchdog/arm,sbsa-gwdt.yaml      | 51 +++++++++++++++++++
 .../bindings/watchdog/sbsa-gwdt.txt           | 31 -----------
 2 files changed, 51 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
new file mode 100644
index 000000000000..6bfa46353c4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/arm,sbsa-gwdt.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/arm,sbsa-gwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SBSA (Server Base System Architecture) Generic Watchdog
+
+maintainers:
+  - Fu Wei <fu.wei@linaro.org>
+
+description: |
+  The SBSA Generic Watchdog Timer is used to force a reset of the system after
+  two stages of timeout have elapsed. A detailed definition of the watchdog
+  timer can be found in the ARM document: ARM-DEN-0029 - Server Base System
+  Architecture (SBSA)
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: arm,sbsa-gwdt
+
+  reg:
+    items:
+      - description: Watchdog control frame
+      - description: Refresh frame
+
+  interrupts:
+    description: The Watchdog Signal 0 (WS0) SPI (Shared Peripheral Interrupt)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    watchdog@2a440000 {
+        compatible = "arm,sbsa-gwdt";
+        reg = <0x2a440000 0x1000>,
+              <0x2a450000 0x1000>;
+        interrupts = <0 27 4>;
+        timeout-sec = <30>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
deleted file mode 100644
index 6f2d5f91964d..000000000000
--- a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* SBSA (Server Base System Architecture) Generic Watchdog
-
-The SBSA Generic Watchdog Timer is used to force a reset of the system
-after two stages of timeout have elapsed.  A detailed definition of the
-watchdog timer can be found in the ARM document: ARM-DEN-0029 - Server
-Base System Architecture (SBSA)
-
-Required properties:
-- compatible: Should at least contain "arm,sbsa-gwdt".
-
-- reg: Each entry specifies the base physical address of a register frame
-  and the length of that frame; currently, two frames must be defined,
-  in this order:
-  1: Watchdog control frame;
-  2: Refresh frame.
-
-- interrupts: Should contain the Watchdog Signal 0 (WS0) SPI (Shared
-  Peripheral Interrupt) number of SBSA Generic Watchdog.
-
-Optional properties
-- timeout-sec: Watchdog timeout values (in seconds).
-
-Example for FVP Foundation Model v8:
-
-watchdog@2a440000 {
-	compatible = "arm,sbsa-gwdt";
-	reg = <0x0 0x2a440000 0 0x1000>,
-	      <0x0 0x2a450000 0 0x1000>;
-	interrupts = <0 27 4>;
-	timeout-sec = <30>;
-};
-- 
2.27.0

