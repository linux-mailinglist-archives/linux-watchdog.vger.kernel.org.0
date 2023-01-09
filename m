Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D0966263E
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Jan 2023 13:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbjAIMye (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 Jan 2023 07:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236733AbjAIMxz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 Jan 2023 07:53:55 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE9D15FF6
        for <linux-watchdog@vger.kernel.org>; Mon,  9 Jan 2023 04:53:48 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so6618621wms.4
        for <linux-watchdog@vger.kernel.org>; Mon, 09 Jan 2023 04:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apTdb92AzNQ96d3ETxccHyv95HLA5cv6Przk0hO/8h8=;
        b=EsPXoXoYQiEGXrVW2y08Jw63MOaSE7K82Wa7hO1KkMnIEV1GsOeInOf2/7FEhX/x7g
         HfnceNCBdr4d2qFy48gJokuywZ0DFfHh0/lc/FmPU0BXvkVj9BFzr1QCZvHVnekASNRd
         aPw+24RSxuSQfYvMPvyZSrIfntYA8LQV2+LMWjudIVGoj4nSTJSzSCjcsOWb0FLx8nFN
         xbVGV/sNMT1pUIX7L/fyYV/wbCR02VLtIk0oHdwVzjN3iPjNggr+OOwIH2odCBxfsO1u
         docmtVsMF/TOvbNWwV0XUaNuyxB4deNMoTK7R1YJc93cZ59tTYI9Mmn1E7mEnyNg6eIC
         kKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apTdb92AzNQ96d3ETxccHyv95HLA5cv6Przk0hO/8h8=;
        b=aYs0+Of79g7JpY12lgeRWsLuCvoGWx65jHjCqFVODw958QKltUEL/gWM7eze84IxX6
         G3TTE9nLKQ+nL5vpl+XP3Dhh37zjnS20MMioLpb5M96XpGsf+MceRTVnxokAx0/IG2KD
         etuJbKr8zkSyuHfpeLDJm1SZDzyZ4306gk2e9I9dfSNORl2HcI8AG7bpd4Wf1dHJaOYR
         bDm7/xbxsTrMOjnWpmwGvuzGHUR9jQxUqdqBLwhFgWDVjcOAm4Hs4h3DTJjpU3hgNX+0
         rRqVNrtHZWVEKRM7UefprJkQkZIsR5EP7hvpaKcPTk8lgcyJQHeQRsm0CXJMdHn9IUte
         XHyQ==
X-Gm-Message-State: AFqh2kpxHc1qkxdAf0Bj/xrOvKIu169pUEuL5ePcJ4ceo6Idl0596cQP
        WAav2yJLpdPTRLyT3DOXlq5lcw==
X-Google-Smtp-Source: AMrXdXtAapEnKxQpOhIkltcToEX8T5OnPnIqchFzqGnfuLYUoCHcU94+sp3J+/xrNs805/CeyL0VSw==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id ay29-20020a05600c1e1d00b003cfb07acd2fmr45391761wmb.37.1673268828090;
        Mon, 09 Jan 2023 04:53:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:47 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 13:53:35 +0100
Subject: [PATCH v2 11/11] dt-bindings: net: convert mdio-mux-meson-g12a.txt to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v2-11-36ad050bb625@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
        netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert MDIO bus multiplexer/glue of Amlogic G12a SoC family bindings
to dt-schema.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/net/amlogic,g12a-mdio-mux.yaml        | 80 ++++++++++++++++++++++
 .../bindings/net/mdio-mux-meson-g12a.txt           | 48 -------------
 2 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
new file mode 100644
index 000000000000..ec5c038ce6a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,g12a-mdio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MDIO bus multiplexer/glue of Amlogic G12a SoC family
+
+description:
+  This is a special case of a MDIO bus multiplexer. It allows to choose between
+  the internal mdio bus leading to the embedded 10/100 PHY or the external
+  MDIO bus.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: mdio-mux.yaml#
+
+properties:
+  compatible:
+    const: amlogic,g12a-mdio-mux
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: peripheral clock
+      - description: platform crytal
+      - description: SoC 50MHz MPLL
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: clkin0
+      - const: clkin1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mdio-multiplexer@4c000 {
+        compatible = "amlogic,g12a-mdio-mux";
+        reg = <0x4c000 0xa4>;
+        clocks = <&clkc_eth_phy>, <&xtal>, <&clkc_mpll>;
+        clock-names = "pclk", "clkin0", "clkin1";
+        mdio-parent-bus = <&mdio0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mdio@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        mdio@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@8 {
+                compatible = "ethernet-phy-id0180.3301",
+                             "ethernet-phy-ieee802.3-c22";
+                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+                reg = <8>;
+                max-speed = <100>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
deleted file mode 100644
index 3a96cbed9294..000000000000
--- a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Properties for the MDIO bus multiplexer/glue of Amlogic G12a SoC family.
-
-This is a special case of a MDIO bus multiplexer. It allows to choose between
-the internal mdio bus leading to the embedded 10/100 PHY or the external
-MDIO bus.
-
-Required properties in addition to the generic multiplexer properties:
-- compatible : amlogic,g12a-mdio-mux
-- reg: physical address and length of the multiplexer/glue registers
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "pclk"   : peripheral clock.
-  * "clkin0" : platform crytal
-  * "clkin1" : SoC 50MHz MPLL
-
-Example :
-
-mdio_mux: mdio-multiplexer@4c000 {
-	compatible = "amlogic,g12a-mdio-mux";
-	reg = <0x0 0x4c000 0x0 0xa4>;
-	clocks = <&clkc CLKID_ETH_PHY>,
-		 <&xtal>,
-		 <&clkc CLKID_MPLL_5OM>;
-	clock-names = "pclk", "clkin0", "clkin1";
-	mdio-parent-bus = <&mdio0>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	ext_mdio: mdio@0 {
-		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	int_mdio: mdio@1 {
-		reg = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		internal_ephy: ethernet-phy@8 {
-			compatible = "ethernet-phy-id0180.3301",
-				     "ethernet-phy-ieee802.3-c22";
-			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-			reg = <8>;
-			max-speed = <100>;
-		};
-	};
-};

-- 
2.34.1
