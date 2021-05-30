Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1538339503B
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhE3J2Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:24 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41329 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3J2Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:24 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N33ZD-1lQ0mo1C7J-013L7p; Sun, 30 May 2021 11:26:23 +0200
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
Subject: [PATCH 1/6] ARM: dts: bcm283x: Fix up MMC node names
Date:   Sun, 30 May 2021 11:26:10 +0200
Message-Id: <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:zU43vaxG+aviVLNrCI/EJL4B8YCOUb5/nUyh6xHFOfoaHTiga8y
 mn2JIOjJXEYn0AOzLQCVNHBfyAdXgIBfc+Y0J+1FlTdSQC5PrRSBFyNBUZZ5RQTAV+TwY2U
 /Vzj0UGSnnRen0BSE7x9Yr5gXZZhuKPZ/WTXOphHSlql+AS1FLSouKmPXmzAic+dyNGxbdG
 sKHcib4DUxU62/AhxGirA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BXOAIRfrMrA=:OzaYHAs0xVvwgJGlfZz9fb
 COFvigPoPyhg/rx5AGNc8BDMlY/IzlbHspvjPOJA420EyPLoBacGcxcydhkGGkHiI+i78cja7
 sngly6uGu9q73jzZLGBUYAkIcFIURnAtA2EN3f+mSGIUI1+BVqGaLwtRGSd/i0BtUWeJa7JcA
 ehCaVvkHwrNBlenr7SeYe7IJ3OFM6f14LxHST4b/Lww9ccpD6ORVZ4U13GVm4k+RckTFP0nGq
 u7Jw8guiF+Rqvk1BA9MoEuDex/2CPRYY/JkuXe9U2lHqrQ2MT8naWv0RPUFstHb8TbYw2poCB
 fceb/jzRARunLREt+JSEWb1v+kbqcBacU1JZOppotTdrQXimED7LkDc4YWF3CZOWASSC+Bs/8
 hCJwt0MT7LcX8WqxjAdV6FLfPXt8WjsF+fKulKk0xwazhoRNJu6fmx5ectoaWMdttYocIQZJf
 +uFjagEknAOfdffOhAldjoKVsTGrUeY4zEUQPVb+S+eHLbEJyuTTjaQVggKKyR/i5YCYqOqy5
 DhTm/CkcF1wmrayKTzj+vs=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the node names for the MMC/SD card controller to conform
to the standard node name mmc@..

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 2 +-
 arch/arm/boot/dts/bcm283x.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 720beec..d872064 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -413,7 +413,7 @@
 		ranges = <0x0 0x7e000000  0x0 0xfe000000  0x01800000>;
 		dma-ranges = <0x0 0xc0000000  0x0 0x00000000  0x40000000>;
 
-		emmc2: emmc2@7e340000 {
+		emmc2: mmc@7e340000 {
 			compatible = "brcm,bcm2711-emmc2";
 			reg = <0x0 0x7e340000 0x100>;
 			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index b83a864..0f3be55 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -420,7 +420,7 @@
 			status = "disabled";
 		};
 
-		sdhci: sdhci@7e300000 {
+		sdhci: mmc@7e300000 {
 			compatible = "brcm,bcm2835-sdhci";
 			reg = <0x7e300000 0x100>;
 			interrupts = <2 30>;
-- 
2.7.4

