Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAA9418DC4
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Sep 2021 04:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhI0CgS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 26 Sep 2021 22:36:18 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:33018 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229767AbhI0CgR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 26 Sep 2021 22:36:17 -0400
X-UUID: 87f3da82a1554e1880ad2c666154fc28-20210927
X-UUID: 87f3da82a1554e1880ad2c666154fc28-20210927
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1219206350; Mon, 27 Sep 2021 10:34:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 27 Sep 2021 10:34:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 10:34:32 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     <robh@kernel.org>
CC:     <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
        <hsinyi@chromium.org>, <john@phrozen.org>,
        <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <matthias.bgg@gmail.com>, <mpm@selenic.com>,
        <mturquette@baylibre.com>, <robh+dt@kernel.org>,
        <sam.shih@mediatek.com>, <sboyd@kernel.org>,
        <sean.wang@kernel.org>, <seiya.wang@mediatek.com>,
        <wim@linux-watchdog.org>
Subject: [v5,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date:   Mon, 27 Sep 2021 10:34:19 +0800
Message-ID: <20210927023419.17994-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org>
References: <1632491961.645727.1195978.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This updates bindings for MT7986 pinctrl driver. The
difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
do not exist on mt7986b

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v5 : fixed yamllint warnings/errors
v4 : used yaml format instead of txt format document
v3 : make mt7986 pinctrl bindings as a separate file
v2 : deleted the redundant description of mt7986a/mt7986b
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 353 ++++++++++++++++++
 1 file changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
new file mode 100644
index 000000000000..51a13129bcb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -0,0 +1,353 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT7986 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Sean Wang <sean.wang@kernel.org>
+
+description: |+
+  The MediaTek's MT7986 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7986a-pinctrl
+      - mediatek,mt7986b-pinctrl
+
+  reg:
+    minItems: 8
+    maxItems: 8
+
+  reg-names:
+    items:
+      - const: gpio_base
+      - const: iocfg_rt_base
+      - const: iocfg_rb_base
+      - const: iocfg_lt_base
+      - const: iocfg_lb_base
+      - const: iocfg_tr_base
+      - const: iocfg_tl_base
+      - const: eint
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      'mux':
+        type: object
+        additionalProperties: false
+        description: |
+          pinmux configuration nodes.
+
+          Valid value	      function    pins (in pin#)
+          ---------------------------------------------------------------------
+          "watchdog"        "watchdog"  0
+          "wifi_led"        "led"       1, 2
+          "i2c"             "i2c"       3, 4
+          "uart1_0"         "uart"      7, 8, 9, 10
+          "pcie_clk"        "pcie"      9
+          "pcie_wake"       "pcie"      10
+          "spi1_0"          "spi"       11, 12, 13, 14
+          "pwm1_1"          "pwm"       20,
+          "pwm0"            "pwm"       21,
+          "pwm1_0"          "pwm"       22,
+          "snfi"            "flash"     23, 24, 25, 26, 27, 28
+          "spi1_2"          "spi"       29, 30, 31, 32
+          "emmc_45"         "emmc"      22, 23, 24, 25, 26, 27, 28, 29, 30,
+                                        31, 32
+          "spi1_1"          "spi"       23, 24, 25, 26
+          "uart1_2"         "uart"      29, 30, 31, 32
+          "uart1_1"         "uart"      23, 24, 25, 26
+          "uart2_0"         "uart"      29, 30, 31, 32
+          "spi0"            "spi"       33, 34, 35, 36
+          "spi0_wp_hold"    "spi"       37, 38
+          "uart1_3_rx_tx"   "uart"      35, 36
+          "uart1_3_cts_rts" "uart"      37, 38
+          "uart2_1"         "uart"      33, 34, 35, 36
+          "spi1_3"          "spi"       33, 34, 35, 36
+          "uart0"           "uart"      39, 40
+          "pcie_pereset"    "pcie"      41
+          "uart1"           "uart"      42, 43, 44, 45
+          "uart2"           "uart"      46, 47, 48, 49
+          "emmc_51"         "emmc"      50, 51, 52, 53, 54, 55, 56, 57, 57,
+                                        59, 60, 61
+          "pcm"             "audio"     62, 63, 64, 65
+          "i2s"             "audio"     62, 63, 64, 65
+          "switch_int"      "eth"       66
+          "mdc_mdio"        "eth"       67
+
+        $ref: "/schemas/pinctrl/pinmux-node.yaml"
+        properties:
+          function:
+            description: |
+              A string containing the name of the function to mux to the group.
+              There is no "audio", "pcie" functions on mt7986b, you can only use
+              those functions on mt7986a.
+            enum: [audio, emmc, eth, i2c, led, flash, pcie, pwm, spi, uart,
+                   watchdog, wifi]
+          groups:
+            description: |
+              An array of strings. Each string contains the name of a group.
+              There is no "pcie_pereset", "uart1", "uart2" "emmc_51", "pcm",
+              and "i2s" groups on mt7986b, you can only use those groups on
+              mt7986a.
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: audio
+            then:
+              properties:
+                groups:
+                  enum: [pcm, i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc, emmc_rst]
+          - if:
+              properties:
+                function:
+                  const: eth
+            then:
+              properties:
+                groups:
+                  enum: [switch_int, mdc_mdio]
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c]
+          - if:
+              properties:
+                function:
+                  const: led
+            then:
+              properties:
+                groups:
+                  enum: [wifi_led]
+          - if:
+              properties:
+                function:
+                  const: flash
+            then:
+              properties:
+                groups:
+                  enum: [snfi]
+          - if:
+              properties:
+                function:
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  enum: [pcie_clk, pcie_wake, pcie_pereset]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [pwm0, pwm1_0, pwm1_1]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  enum: [spi0, spi0_wp_hold, spi1_0, spi1_1, spi1_2, spi1_3]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
+                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
+          - if:
+              properties:
+                function:
+                  const: watchdog
+            then:
+              properties:
+                groups:
+                  enum: [watchdog]
+          - if:
+              properties:
+                function:
+                  const: wifi
+            then:
+              properties:
+                groups:
+                  enum: [wf_2g, wf_5g, wf_dbdc]
+      'conf':
+        type: object
+        additionalProperties: false
+        description: |
+          pinconf configuration nodes.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pins:
+            description: |
+              An array of strings. Each string contains the name of a pin.
+              There is no PIN 41 to PIN 65 above on mt7686b, you can only use
+              those pins on mt7986a.
+            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
+                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
+                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
+                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
+                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
+                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
+                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
+                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
+                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
+                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
+                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
+                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
+                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
+                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
+                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
+                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
+                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
+                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
+                   WF1_HB8]
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          mediatek,pull-up-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull up setings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull down setings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      pio: pinctrl@1001f000 {
+        compatible = "mediatek,mt7986a-pinctrl";
+        reg = <0 0x1001f000 0 0x1000>,
+              <0 0x11c30000 0 0x1000>,
+              <0 0x11c40000 0 0x1000>,
+              <0 0x11e20000 0 0x1000>,
+              <0 0x11e30000 0 0x1000>,
+              <0 0x11f00000 0 0x1000>,
+              <0 0x11f10000 0 0x1000>,
+              <0 0x1000b000 0 0x1000>;
+        reg-names = "gpio_base", "iocfg_rt_base", "iocfg_rb_base",
+              "iocfg_lt_base", "iocfg_lb_base", "iocfg_tr_base",
+              "iocfg_tl_base", "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 100>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        #interrupt-cells = <2>;
+
+        uart1_pins: uart1-pins-42-to-45 {
+          mux {
+            function = "uart";
+            groups = "uart1";
+          };
+        };
+
+        uart2_pins: uart1-pins-46-to-49 {
+          mux {
+            function = "uart";
+            groups = "uart2";
+          };
+        };
+
+      };
+    };
-- 
2.29.2

