Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE8C2A7D55
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 12:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbgKELkI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 06:40:08 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46045 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730266AbgKELhx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 06:37:53 -0500
Received: by mail-lj1-f196.google.com with SMTP id t13so1199883ljk.12;
        Thu, 05 Nov 2020 03:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l6GNHxWenXClMpzDH8vAZfwF26Q3bXxn5PspaMcty4Y=;
        b=Kntr2hRb/Q37alBSYES+3BiQ2Q30Ux8kiGM1UEa33L4YDu4UFPsvpkqaeV1l2AupPW
         TGjzgDIyWTjAfAkBkcJH5+qw6QgnTDPSw9FVUhBTtkrfR0W1eq+6g7glkORgBQ8pSV23
         guiox8TVnqt6V0wHX+dt5ZcAz5OQ33q6Uhw/rYAdSKb27lJjgUADCj/GD+HoELGhr13w
         TlqzZOXJDgUQopHQ3QHWZK2P91/iZX+vvYIVjU/DQ3vcrkuzrgrUYppafhSoSckms8Qq
         zA4aIcBH8jwn1idS59glIan6Oo00Wq/FVUbVozNXwAPyNZD9F+3cYLzGDfA5z3Pa7Z9z
         oxVA==
X-Gm-Message-State: AOAM53130rMP91WiDkwUYxGDB49wiGeZmg55Sy4ZUIl/DmtkzE7Mu9h7
        OIPyP476G7r2kYfV1DuhAYs=
X-Google-Smtp-Source: ABdhPJx4kEGRJ3yy4aBPZCqAS4ORuF7w47nAJV1xwDvOv4Fl1RFNR9ZpKoMWKtHR+3nACK67ZaL2pQ==
X-Received: by 2002:a2e:81d4:: with SMTP id s20mr692925ljg.396.1604576270595;
        Thu, 05 Nov 2020 03:37:50 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u25sm154756lfo.198.2020.11.05.03.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 03:37:49 -0800 (PST)
Date:   Thu, 5 Nov 2020 13:37:43 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v5 1/4] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Message-ID: <36f11c031ff2988015ba73808cabe7279c1a2f49.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add bindings for ROHM BD9576MUF and BD9573MUF PMICs. These
PMICs are primarily intended to be used to power the R-Car series
processors. They provide 6 power outputs, safety features and a
watchdog with two functional modes.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
new file mode 100644
index 000000000000..6483860da955
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
@@ -0,0 +1,123 @@
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
+  rohm,hw-timeout-ms:
+    maxItems: 2
+    description:
+      Watchog timeout in milliseconds. If single value is given it is
+      the maximum timeout. Eg. if pinging watchdog is not done within this time
+      limit the watchdog will be triggered. If two values are given watchdog
+      is configured in "window mode". Then first value is limit for short-ping
+      Eg. if watchdog is pinged sooner than that the watchdog will trigger.
+      When two values is given the second value is the maximum timeout.
+      # (HW) minimum for short timeout is 2ms, maximum 220 ms.
+      # (HW) minimum for max timeout is 4ms, maximum 4416 ms.
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
+            rohm,hw-timeout-ms = <150>, <2300>;
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
2.21.3


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
