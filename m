Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A725E85D58
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Aug 2019 10:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731364AbfHHIvv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Aug 2019 04:51:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35232 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731550AbfHHIvv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Aug 2019 04:51:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so1588595wmg.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Aug 2019 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x4bXtEWTaRCFx8YfX85ELnedQT6Jwcsnd8GE4lw4kXo=;
        b=085HPgPDQ0N5PTt53cQWFodc9dxIUFjGs+st4Q2qtb+nGm/5Af05U4Yx9B9cewCCud
         JKPEk0gvFur0u7DpSraYsjcBaq3SbePLfLgomfjRuLEm0pias7afDstgDZGmcCaMljEP
         yGhtdOBwlRAS6ll8OWzoWqBT1gq9DPC2f2uwtfzpJKehETZqBbtQwKdt2r8Rp8R3keCy
         Am4fvyistL5qnOv8I6NlrMUq8i67kX74Dn2PhxXrmsEvDjO8i9IA9yI804ojl77jrkMp
         QxZMQGJfcK0WMQYoZ3OgS1k45KWtMiFbnkWdJINPnhkSqFpw4nUTZNpUD6hluhZUEMCg
         uLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x4bXtEWTaRCFx8YfX85ELnedQT6Jwcsnd8GE4lw4kXo=;
        b=d/dfA3JrIbwuPKCzIn8FafnIyfIoHHfNsclqpWStsoVVSYP9f9z8GFBWrxm1z2G8dF
         Q+G/3ob2X1UkI7jqvIGhDKceQI48B8/2X+JkMDhH6sfhtVvEjCZkp+tDIMdzfShsaztO
         0ySqTwgbsmqIZXrT27INQUox1ZXpBU9EpFJ8e+wtnZvGkq+Eo283kfnizd0d5KECBKhA
         7cJmUu31fC0uS4RAo+TO200/yyZI3aY6bjyW1KVXbJQVYEgyhhOQo59MXlbQsEx0UE3V
         mgncTbIpfy31hYhyFK3ToJCoFMS00OG+KE/aMlfOWPEUQkEOMe84jKZ/lYVIy+ASemH/
         bvBg==
X-Gm-Message-State: APjAAAX4RfKnhlvkvrMHU0Uq1QpMVnGxJNTezeNGRKA3MoXv5UxqDApT
        nMghd0lY+mkN+g02MKud5nyHEg==
X-Google-Smtp-Source: APXvYqzAOom3OF14Yxh8TWXbG4DY8j5GejfsQ9NTKdZAyaXdE18kUaBOcC7YBG8YJKoUPv99y3WXfQ==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr3125738wmc.95.1565254308991;
        Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 01:51:48 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Date:   Thu,  8 Aug 2019 10:51:39 +0200
Message-Id: <20190808085139.21438-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
References: <20190808085139.21438-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
new file mode 100644
index 000000000000..d7352f709b37
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Meson GXBB SoCs Watchdog timer
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      A phandle to the clock of this PHY
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    watchdog@98d0 {
+          compatible = "amlogic,meson-gxbb-wdt";
+          reg = <0x98d0 0x10>;
+          clocks = <&xtal>;
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
deleted file mode 100644
index c7fe36fa739c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Meson GXBB SoCs Watchdog timer
-
-Required properties:
-
-- compatible : should be "amlogic,meson-gxbb-wdt"
-- reg : Specifies base physical address and size of the registers.
-- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
-	   is the default clock source.
-
-Example:
-
-wdt: watchdog@98d0 {
-	compatible = "amlogic,meson-gxbb-wdt";
-	reg = <0 0x98d0 0x0 0x10>;
-	clocks = <&xtal>;
-};
-- 
2.22.0

