Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14575279AB5
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Sep 2020 18:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgIZQXV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Sep 2020 12:23:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZQXV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Sep 2020 12:23:21 -0400
Received: from localhost.localdomain (unknown [194.230.155.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07C542177B;
        Sat, 26 Sep 2020 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601137400;
        bh=+9yfl2jckejDp+YvTFaezUtdMxSTh2bScLudFAAcmdA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iXTsRNdyvg5jHN8SNyICrLo0CRar97Wd5BlQ9dV+LrhxJ5HxoRlVvUhsa9o7W4qBX
         v6yflhRDUS9sPO0Z8VszVVHtFk3rRBbW7pl0QZNfsC5715vwPbv4NQwXR/0jx1yvdi
         AJnFBWMrTDPk5wOhLmffWCzu/5lTukrlwCWUE4vA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/3] ARM: dts: imx: align watchdog node name with dtschema
Date:   Sat, 26 Sep 2020 18:23:01 +0200
Message-Id: <20200926162302.32525-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926162302.32525-1-krzk@kernel.org>
References: <20200926162302.32525-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The dtschema expects watchdog device node name to be "watchdog":

  arch/arm/boot/dts/imx31-bug.dt.yaml: wdog@53fdc000:
    $nodename:0: 'wdog@53fdc000' does not match '^watchdog(@.*|-[0-9a-f])?$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx25.dtsi | 2 +-
 arch/arm/boot/dts/imx27.dtsi | 2 +-
 arch/arm/boot/dts/imx31.dtsi | 3 ++-
 arch/arm/boot/dts/imx35.dtsi | 2 +-
 arch/arm/boot/dts/imx50.dtsi | 2 +-
 arch/arm/boot/dts/imx51.dtsi | 4 ++--
 arch/arm/boot/dts/imx53.dtsi | 4 ++--
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index 1ab19f1268f8..fdcca82c9986 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -525,7 +525,7 @@
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx25.bin";
 			};
 
-			wdog@53fdc000 {
+			watchdog@53fdc000 {
 				compatible = "fsl,imx25-wdt", "fsl,imx21-wdt";
 				reg = <0x53fdc000 0x4000>;
 				clocks = <&clks 126>;
diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index 7bc132737a37..fd525c3b16fa 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -99,7 +99,7 @@
 				#dma-channels = <16>;
 			};
 
-			wdog: wdog@10002000 {
+			wdog: watchdog@10002000 {
 				compatible = "fsl,imx27-wdt", "fsl,imx21-wdt";
 				reg = <0x10002000 0x1000>;
 				interrupts = <27>;
diff --git a/arch/arm/boot/dts/imx31.dtsi b/arch/arm/boot/dts/imx31.dtsi
index 45333f7e10ea..948d2a543f8d 100644
--- a/arch/arm/boot/dts/imx31.dtsi
+++ b/arch/arm/boot/dts/imx31.dtsi
@@ -315,10 +315,11 @@
 				clock-names = "ref", "ipg";
 			};
 
-			wdog: wdog@53fdc000 {
+			wdog: watchdog@53fdc000 {
 				compatible = "fsl,imx31-wdt", "fsl,imx21-wdt";
 				reg = <0x53fdc000 0x4000>;
 				clocks = <&clks 41>;
+				interrupts = <55>;
 			};
 
 			pwm: pwm@53fe0000 {
diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dtsi
index aba16252faab..98ccc81ca6d9 100644
--- a/arch/arm/boot/dts/imx35.dtsi
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -294,7 +294,7 @@
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx35.bin";
 			};
 
-			wdog: wdog@53fdc000 {
+			wdog: watchdog@53fdc000 {
 				compatible = "fsl,imx35-wdt", "fsl,imx21-wdt";
 				reg = <0x53fdc000 0x4000>;
 				clocks = <&clks 74>;
diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index b6b2e6af9b96..a969f335b240 100644
--- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -267,7 +267,7 @@
 					      <&iomuxc 20 140 11>;
 			};
 
-			wdog1: wdog@53f98000 {
+			wdog1: watchdog@53f98000 {
 				compatible = "fsl,imx50-wdt", "fsl,imx21-wdt";
 				reg = <0x53f98000 0x4000>;
 				interrupts = <58>;
diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 985e1be03ad6..7ebb46ce9e36 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -370,14 +370,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@73f98000 {
+			wdog1: watchdog@73f98000 {
 				compatible = "fsl,imx51-wdt", "fsl,imx21-wdt";
 				reg = <0x73f98000 0x4000>;
 				interrupts = <58>;
 				clocks = <&clks IMX5_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@73f9c000 {
+			wdog2: watchdog@73f9c000 {
 				compatible = "fsl,imx51-wdt", "fsl,imx21-wdt";
 				reg = <0x73f9c000 0x4000>;
 				interrupts = <59>;
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 500eeaa3a27c..000050aeeabe 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -427,14 +427,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@53f98000 {
+			wdog1: watchdog@53f98000 {
 				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
 				reg = <0x53f98000 0x4000>;
 				interrupts = <58>;
 				clocks = <&clks IMX5_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@53f9c000 {
+			wdog2: watchdog@53f9c000 {
 				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
 				reg = <0x53f9c000 0x4000>;
 				interrupts = <59>;
-- 
2.17.1

