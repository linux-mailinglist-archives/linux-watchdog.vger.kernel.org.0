Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C440C818BF
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2019 14:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbfHEMDe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Aug 2019 08:03:34 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:39156 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfHEMDd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Aug 2019 08:03:33 -0400
Received: by mail-wr1-f47.google.com with SMTP id x4so30975579wrt.6
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Aug 2019 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=It0S2pqtroKRwqpCJzVHjSEtdzt+mhpXXxLdI5TJ2aI=;
        b=XcS/BR3jo8xM1NaMWdsnUB4S6gVD0pY/78we1meVjquEdBMWTcHxGseyDIptk1owW4
         sAch2yfbaGyV3k2zzpH9b3hN3WBcHMWkA+9chY46jAJx6YqIqZicqWrrd83D6NHliOzh
         3/siYxppNrcV+/XAQ5C3kvBHalzZud7vkYgz1YUywWv1NVjKP4XQFnaCApw0xU7D8RQr
         GyOn68CKDRiFUtKeXDw33SbxSH7yTUr9lBD8Bpkm16lWH4wskVZIiaOhDTaFUkmOrgzx
         X7Kv0hps1OtDlAsW3G1h1Ob/hvy6L9BzYOo5S1uitLU99O+q4mAfyyVAeD8xEFZS6V1+
         IuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=It0S2pqtroKRwqpCJzVHjSEtdzt+mhpXXxLdI5TJ2aI=;
        b=XYZgP1EceAJYcD+kaoUru/JcNQBlgGgd0o/zMaSnuFlKlayx6BG5jAD3Aa+C3piHDE
         kExVwjn8DQVVpRXcT8KMDJSYZUqe/33sWxBJDFqOArousoqHy3PfdBUW0WqM8Wc/b/AO
         b+B7FBW/pl8F9pben25e/4QHqNqwYONZVhaJM/B+4vIzy7AF6K+RCchcNCNipMDiGXcj
         VjJKvqLsZ1fAXqncePmlG4Y4ixexQ/aUt27YemnWtjCaF0FhYhhTLLH9KZySi9piaRH1
         4c0UDiLtjWee/TiWsSmRqaxwkQW0YO1dAJTsy41U3sjF4bHRZcAHEo8TqeqYFMEC5y0G
         PPGg==
X-Gm-Message-State: APjAAAV79Nxy11c0f5Csxv477NvL7AdX7zj0pvEBCVvO70QkuQHnr3FC
        9JngirKARVjRsMAeEzoL5OpbYA==
X-Google-Smtp-Source: APXvYqydGaCtbOymxM94Qk7KUysBb9OK1H/sS9OgWK1Hm6mbeH5Ar1ePJu8NBJIxGYsKGqLDdvCMig==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr153995452wrq.319.1565006611988;
        Mon, 05 Aug 2019 05:03:31 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 05:03:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [RFCv2 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Date:   Mon,  5 Aug 2019 14:03:20 +0200
Message-Id: <20190805120320.32282-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805120320.32282-1-narmstrong@baylibre.com>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.

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

