Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D3B39CEFF
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Jun 2021 14:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFFMSx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Jun 2021 08:18:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50627 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhFFMSv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Jun 2021 08:18:51 -0400
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrhHm-1l2AsK2p88-00ngV6; Sun, 06 Jun 2021 14:16:36 +0200
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
Subject: [PATCH V2 6/7] ARM: dts: Add Raspberry Pi 400 support
Date:   Sun,  6 Jun 2021 14:16:16 +0200
Message-Id: <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:qDXNiQNnXszhu7ZZn9qpiJjEOk/8SKuGCRk5P1O58HSgHSRlMLV
 0xTH6Q+aPq28bWe7QSGDeV5lSsliVSiBA3k6TJs3CJKeIAEw7NFeK3ulpqriEj9rG7Kv09V
 f5yU99ZAK5+2om8JacoafiHBpbVGX9mLuw67b41uH2+buQZXHhd/vEsMYJuZdrkoAqxavb0
 XZzPZDPPXY9LZ3wix21Rw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TznBIvEQkDg=:GcLEDfRD80lGvCBDkMB65D
 n2NlGC6mkIjaUFrd5E9zZjH4kw+x9NA0hx9T0NWVp1ziEK3LHEL0hbgRb1eGvl867sbWe8Q/e
 F+/chJU1Mx0LnCpYtoSWFgn78hnQZJhGVxXq5//4mI3VEtfF9AR8GB+3HGCKfwrJIMGBo5Z5C
 Kbv39tIHz3XTISYrHVYqeoxMUNOZQ33vvSjziiWgEbr8MNV4my2sannMZeUBZQ1rfAUiOwJdE
 SafIVH+YbqGPYzy6kL1rz9v/wvq8qLcckHQlUI7bRNlhEUMt+smWFRhRRCDF6cnMKFbpNxf8N
 cBTBrYFLng5QRI23HFhu4XUe22u54bxcSeBToKQ7m/X1ARrVXdad++bxXayrAO+wwp6+KjdsO
 UGB4w5h4r4fw8SOAfV/4qpN4GcpWhnUdDQGkcIQFY4lXIGnOubFKi8EQK9Nu9O9Ky4v15aqXU
 wlW2w05R7Nw3UkdBbPiUzlEKUKxOxWAdrONwwMZxYNrKR2vf/cjHXKSLx2b3F9MzPOiS/NmA1
 J486J/wnFJuU58pVA9Dftc=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Raspberry Pi 400 is like a Pi 4 B designed into a keyboard. But there
are some minor differences:

- higher CPU clock rate (1.8 GHz)
- different Wifi chip (BCM43456)
- power off is now handled via GPIO
- no ACT LED

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/Makefile            |  1 +
 arch/arm/boot/dts/bcm2711-rpi-400.dts | 45 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5..ec00dba 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
+	bcm2711-rpi-400.dtb \
 	bcm2711-rpi-4-b.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
diff --git a/arch/arm/boot/dts/bcm2711-rpi-400.dts b/arch/arm/boot/dts/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..f4d2fc2
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-400.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711-rpi-4-b.dts"
+
+/ {
+	compatible = "raspberrypi,400", "brcm,bcm2711";
+	model = "Raspberry Pi 400";
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
+	leds {
+		/delete-node/ led-act;
+
+		led-pwr {
+			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&expgpio {
+	gpio-line-names = "BT_ON",
+			  "WL_ON",
+			  "",
+			  "GLOBAL_RESET",
+			  "VDD_SD_IO_SEL",
+			  "CAM_GPIO",
+			  "SD_PWR_ON",
+			  "SD_OC_N";
+};
+
+&genet_mdio {
+	clock-frequency = <1950000>;
+};
+
+&pm {
+	/delete-property/ system-power-controller;
+};
-- 
2.7.4

