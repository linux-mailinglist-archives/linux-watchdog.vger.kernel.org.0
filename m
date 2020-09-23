Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81875275463
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Sep 2020 11:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIWJXG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Sep 2020 05:23:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36319 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgIWJXA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Sep 2020 05:23:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so16622379ljm.3;
        Wed, 23 Sep 2020 02:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wAiiRdUD5PoxRNEJ68GQ4WItPJQxb6/445NDc6SLCCw=;
        b=eY4AJrylhQBbSpK/KMfIVsTlx8xir4FPKyATo8OcsA/+k1JcO3ZiAI9L9zNc8p67ft
         PBIsYv7o/wc0kZF+XDUBaKyZCQCgA7jZcHSxActOjtM85I3+lxfhEgEdGbVTOvNb0w5S
         zBewORsW76wgEJnO/IWqoovtHbIfzXpLwjNGJoWW15Rr5k+OBUazFFZ+cSuxRDVZTlrz
         UB1neoytH6mt+E9iaCAJ/FeROCupeVnKpMEIqb924zVW/eUGowD8GeF2EydXQo4KUYEJ
         kaE+lwQV9fel+x5E+CtuizItWYT2xUZ85eONYYezQyKQXgeWSBUqNdcBwu0Bmqd2hGoA
         VIjw==
X-Gm-Message-State: AOAM532mN5Wt7mY5xfHiLMzzhiK0zGxfMcS+p6L9TIylGR9Dbfmjou2a
        TTjBG4t7XwNXnWTx1DvvrEw=
X-Google-Smtp-Source: ABdhPJxB3Qzq3vj3rVF+lItDkQbHv0sfLO8Qo2D42dPY1HYtQiXLa5LsHX0OCmVG4IuFocwPEOkYvQ==
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr3119798ljp.284.1600852976011;
        Wed, 23 Sep 2020 02:22:56 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n204sm4511674lfa.207.2020.09.23.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 02:22:55 -0700 (PDT)
Date:   Wed, 23 Sep 2020 12:22:43 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/4] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Message-ID: <7308c9d047d8533650cdbd17e328958da28182bf.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add bindings for ROHM BD9576MUF and BD9573MUF PMICs. These
PMICs are primarily intended to be used to power the R-Car series
processors. They provide 6 power outputs, safety features and a
watchdog with two functional modes.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changes since v1:
  - Fixed case for few regulator-names in the example

 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
new file mode 100644
index 000000000000..99d11ae76b1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd9576-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD9576MUF and BD9573MUF Power Management Integrated Circuit bindings
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  BD9576MUF and BD9573MUF are power management ICs primarily intended for
+  powering the R-Car series processors.
+  The IC provides 6 power outputs with configurable sequencing and safety
+  monitoring. A watchdog logic with slow ping/windowed modes is also included.
+
+properties:
+  compatible:
+    enum:
+      - rohm,bd9576
+      - rohm,bd9573
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  rohm,vout1-en-low:
+    description:
+      BD9576 and BD9573 VOUT1 regulator enable state can be individually
+      controlled by a GPIO. This is dictated by state of vout1-en pin during
+      the PMIC startup. If vout1-en is LOW during PMIC startup then the VOUT1
+      enable sate is controlled via this pin. Set this property if vout1-en
+      is wired to be down at PMIC start-up.
+    type: boolean
+
+  rohm,vout1-en-gpios:
+    description:
+      GPIO specifier to specify the GPIO connected to vout1-en for vout1 ON/OFF
+      state control.
+    maxItems: 1
+
+  rohm,ddr-sel-low:
+    description:
+      The BD9576 and BD9573 output voltage for DDR can be selected by setting
+      the ddr-sel pin low or high. Set this property if ddr-sel is grounded.
+    type: boolean
+
+  rohm,watchdog-enable-gpios:
+    description: The GPIO line used to enable the watchdog.
+    maxItems: 1
+
+  rohm,watchdog-ping-gpios:
+    description: The GPIO line used to ping the watchdog.
+    maxItems: 1
+
+  hw_margin_ms:
+    minimum: 4
+    maximum: 4416
+    description: Watchog timeout in milliseconds
+
+  rohm,hw-margin-min-ms:
+    minimum: 2
+    maximum: 220
+    description:
+      Watchdog on these ICs can be configured in a window mode where the ping
+      must come within certain time-window. Eg. too quick pinging will also
+      trigger timeout. Specify the minimum delay between pings if you wish to
+      use the window mode. Note, the maximum delay is internally configured as
+      a certain multiple of this value so maximum delay can be only up to 15
+      times this value. For example for 73 ms short ping value the maximum
+      timeout will be close to 1 sec.
+
+  regulators:
+    $ref: ../regulator/rohm,bd9576-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pmic: pmic@30 {
+            compatible = "rohm,bd9576";
+            reg = <0x30>;
+            rohm,vout1-en-low;
+            rohm,vout1-en-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+            rohm,ddr-sel-low;
+            rohm,watchdog-enable-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+            rohm,watchdog-ping-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+            hw_margin_ms = <30>;
+            rohm,hw-margin-min-ms = <4>;
+
+            regulators {
+                boost1: regulator-vd50 {
+                    regulator-name = "VD50";
+                };
+                buck1: regulator-vd18 {
+                    regulator-name = "VD18";
+                };
+                buck2: regulator-vdddr {
+                    regulator-name = "VDDDR";
+                };
+                buck3: regulator-vd10 {
+                    regulator-name = "VD10";
+                };
+                ldo: regulator-voutl1 {
+                    regulator-name = "VOUTL1";
+                };
+                sw: regulator-vouts1 {
+                    regulator-name = "VOUTS1";
+                };
+            };
+        };
+    };
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
