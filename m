Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAA326D607
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Sep 2020 10:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgIQILy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Sep 2020 04:11:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35536 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgIQICQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Sep 2020 04:02:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id w11so1182152lfn.2;
        Thu, 17 Sep 2020 01:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JAt3F8rO7bPlu/N0/OiPIkzVsrBR74bnD5eB09L30U0=;
        b=RgUP4AOHiWI788g9TVrleZBbi1wxqrzZgAHF0O9gb7UTV23gbTBBED23wFxGNZtcVs
         9M05vgGfBBtLXzcO3PIagfvHXqVgMe5LaGK3Ehbr+f+27XTXfbz4kGYi1UIgDRGlSwX4
         F+p7W0hZxYPvAPbtYJcc7XTswrff86NpyQbpxYUHgWhCYAL6V40qqil80sawkmw0YTpB
         I/PujLO9uxkPDwPU6n9BjRWrUtUcX8YQXtcLgVUWfJ0mRb7Kcimk3O1Cm8eJ4tlzWrdF
         5YV/bI3a4lZMqn7jMYfUKCgJI+2wFjLSc9e3fNBjahoz0q7Xfdw2jwxfJmRhgm/jiL7c
         Ofdg==
X-Gm-Message-State: AOAM532A3dSGJM1MtEe4aHHdben/6AQfLHQnH9ZbcC++I+gLrSZxexSi
        gk+/qIDz5HyyEjbTEPnsceU=
X-Google-Smtp-Source: ABdhPJzi/yc5w/U0u9qUe+TsMtB4ElRFYRJ2kqynvvc6AQNxmOz/sgcce/C0mDl8OM2pMA/zM4qrOQ==
X-Received: by 2002:a19:c7d3:: with SMTP id x202mr10309943lff.66.1600329721259;
        Thu, 17 Sep 2020 01:02:01 -0700 (PDT)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id q13sm5054836lfa.286.2020.09.17.01.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:01:59 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:01:52 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Message-ID: <434579d4cddf891f8fa0f50a152c098b113fa2fb.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
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
 .../bindings/mfd/rohm,bd9576-pmic.yaml        | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
new file mode 100644
index 000000000000..f17d4d621585
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
+                    regulator-name = "vdddr";
+                };
+                buck3: regulator-vd10 {
+                    regulator-name = "vd10";
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
