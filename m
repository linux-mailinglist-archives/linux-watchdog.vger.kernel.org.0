Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26804395048
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhE3J2a (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:30 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36415 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhE3J2Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:25 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJW18-1m70QK1a7E-00JrUK; Sun, 30 May 2021 11:26:24 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 3/6] ARM: dts: Move BCM2711 RPi specific into separate dtsi
Date:   Sun, 30 May 2021 11:26:12 +0200
Message-Id: <1622366775-5309-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:M8P44XuD5Ei2tpIgR2aUmBNMRJXf3EtIhzOfSqlO1+r54TVGlJv
 uMtmJe2KUsQ+TXJhrR/6/uvGgPsJ5O7W1K7QC8Hu+WFFOTqcSCNqINi8CwHkTuazSShm+ob
 1Xhba/kbK5nGBMLvkhI4vDhlQkigi9vnQgLe5JhENEHZRWEWLW5N7p7+m7FJUSSgxnKQyRL
 5BbmelIYYV8UHW/brQjjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UQGBprPtfMA=:7/EZxsNghN2DwbripBocLG
 QQlqrpQYui+S0FsZnmexJ8AN3ITvvVOcegFRb3WNSpBV7mDoUzSknXthPUY/aXjR5yj1Ye4fN
 KppoGoth9GQWfFVUY+P7vPuCg7lEW+gvf2aaj2zf7ajy2uXPnbQB8b7jMijhlOT7IzMBUhrCM
 XkTo2MlTle0dLcUsBK1swUea4kmJ0wa2RkzN4EpnIrfAICWerTFRYIGAt9j+tBkUhh1gjrBu2
 4sjvmoZAvXwFOHog1fW7fAmXU1hJ91ZKFrAul1d4sFFy4+KOu0rPGviAonz5wEQQLgQ6iK/sJ
 VZs8a9k2jk1vHKlj9VI/8LmRDkru3zqihBUAaEey6k03JjiSz2SUt4wYp0HVCXklOcOJ7l+FH
 +5RmJ542u5yM3bEMaHWAko1C7qpnP9o6RYe0YvNDEpchUAXIUMpcMDnhCXWxrcbMlpuEVobPe
 sxzMYANfArGtuyEguCgS1LfiC1zw8xrKzzbEaFMNDnlV6v+0MkHoxi1egZi+eqy8GOtra6bTL
 8vYTuUA2sJj7CiK8ZSUQ9Q=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There is a lot of Raspberry Pi specific stuff (neither SoC or board
specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
into a separate dtsi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 62 +----------------------------
 arch/arm/boot/dts/bcm2711-rpi.dtsi    | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi.dtsi

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 3b4ab94..78142a0 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -1,11 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2711.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2711-rpi.dtsi"
 #include "bcm283x-rpi-usb-peripheral.dtsi"
 
-#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
-
 / {
 	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
 	model = "Raspberry Pi 4 Model B";
@@ -22,10 +20,7 @@
 	};
 
 	aliases {
-		emmc2bus = &emmc2bus;
 		ethernet0 = &genet;
-		pcie0 = &pcie0;
-		blconfig = &blconfig;
 	};
 
 	leds {
@@ -80,11 +75,6 @@
 };
 
 &firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
 		gpio-controller;
@@ -99,11 +89,6 @@
 				  "";
 		status = "okay";
 	};
-
-	reset: reset {
-		compatible = "raspberrypi,firmware-reset";
-		#reset-cells = <1>;
-	};
 };
 
 &gpio {
@@ -180,23 +165,13 @@
 };
 
 &hdmi0 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
 &hdmi1 {
-	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
-	clock-names = "hdmi", "bvb", "audio", "cec";
-	wifi-2.4ghz-coexistence;
 	status = "okay";
 };
 
-&hvs {
-	clocks = <&firmware_clocks 4>;
-};
-
 &pixelvalve0 {
 	status = "okay";
 };
@@ -219,22 +194,6 @@
 	status = "okay";
 };
 
-&rmem {
-	/*
-	 * RPi4's co-processor will copy the board's bootloader configuration
-	 * into memory for the OS to consume. It'll also update this node with
-	 * its placement information.
-	 */
-	blconfig: nvram@0 {
-		compatible = "raspberrypi,bootloader-config", "nvmem-rmem";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0x0 0x0 0x0>;
-		no-map;
-		status = "disabled";
-	};
-};
-
 /* SDHCI is used to control the SDIO for wireless */
 &sdhci {
 	#address-cells = <1>;
@@ -273,21 +232,6 @@
 	};
 };
 
-&pcie0 {
-	pci@1,0 {
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges;
-
-		reg = <0 0 0 0 0>;
-
-		usb@1,0 {
-			reg = <0x10000 0 0 0 0>;
-			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
-		};
-	};
-};
-
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
@@ -309,10 +253,6 @@
 	status = "okay";
 };
 
-&vchiq {
-	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-};
-
 &vc4 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
new file mode 100644
index 0000000..b4bc7f6
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "bcm2835-rpi.dtsi"
+
+#include <dt-bindings/reset/raspberrypi,firmware-reset.h>
+
+/ {
+	aliases {
+		emmc2bus = &emmc2bus;
+		pcie0 = &pcie0;
+		blconfig = &blconfig;
+	};
+};
+
+&firmware {
+	firmware_clocks: clocks {
+		compatible = "raspberrypi,firmware-clocks";
+		#clock-cells = <1>;
+	};
+
+	reset: reset {
+		compatible = "raspberrypi,firmware-reset";
+		#reset-cells = <1>;
+	};
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
+	clock-names = "hdmi", "bvb", "audio", "cec";
+	wifi-2.4ghz-coexistence;
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>;
+};
+
+&pcie0 {
+	pci@1,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		reg = <0 0 0 0 0>;
+
+		usb@1,0 {
+			reg = <0x10000 0 0 0 0>;
+			resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
+		};
+	};
+};
+
+&rmem {
+	/*
+	 * RPi4's co-processor will copy the board's bootloader configuration
+	 * into memory for the OS to consume. It'll also update this node with
+	 * its placement information.
+	 */
+	blconfig: nvram@0 {
+		compatible = "raspberrypi,bootloader-config", "nvmem-rmem";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x0 0x0 0x0>;
+		no-map;
+		status = "disabled";
+	};
+};
+
+&vchiq {
+	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4

