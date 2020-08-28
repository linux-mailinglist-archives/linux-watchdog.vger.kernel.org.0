Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF8B255ADF
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgH1NJs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:09:48 -0400
Received: from foss.arm.com ([217.140.110.172]:48818 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729436AbgH1NHi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:07:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840D11476;
        Fri, 28 Aug 2020 06:06:23 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00C973F66B;
        Fri, 28 Aug 2020 06:06:21 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 07/10] ARM: dts: arm: Fix SP805 clocks
Date:   Fri, 28 Aug 2020 14:05:59 +0100
Message-Id: <20200828130602.42203-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The SP805 binding sets the name for the actual watchdog clock to
"wdog_clk" (with an underscore).

Change the name in the DTs for ARM Ltd. platforms to match that. The
Linux and U-Boot driver use the *first* clock for this purpose anyway,
so it does not break anything.

For MPS2 we only specify one clock so far, but the binding requires
two clocks to be named.

In practice, Linux would pick a clock named "apb_pclk" for the bus
clock, and the Linux and U-Boot SP805 driver would use the first clock
to derive the actual watchdog counter frequency. So since currently both
are the very same clock, we can just double the clock reference, and add
the correct clock-names, to match the binding.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/arm-realview-eb.dtsi      | 2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts   | 4 ++--
 arch/arm/boot/dts/arm-realview-pbx.dtsi     | 4 ++--
 arch/arm/boot/dts/mps2.dtsi                 | 4 ++--
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi     | 2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi         | 2 +-
 arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts | 4 ++--
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts  | 2 +-
 arch/arm/boot/dts/vexpress-v2p-ca9.dts      | 2 +-
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index fe0207b88053..a534a8e444d9 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -390,7 +390,7 @@
 			compatible = "arm,sp805", "arm,primecell";
 			reg = <0x10010000 0x1000>;
 			clocks = <&wdogclk>, <&pclk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 564e2eee2c24..0c7dabef4a5f 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -546,7 +546,7 @@
 			interrupt-parent = <&intc_pb11mp>;
 			interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&wdogclk>, <&pclk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -556,7 +556,7 @@
 			interrupt-parent = <&intc_pb11mp>;
 			interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&wdogclk>, <&pclk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		timer01: timer@10011000 {
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index f61bd59ae5ba..ac95667ed781 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -381,7 +381,7 @@
 			compatible = "arm,sp805", "arm,primecell";
 			reg = <0x1000f000 0x1000>;
 			clocks = <&wdogclk>, <&pclk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 			status = "disabled";
 		};
 
@@ -389,7 +389,7 @@
 			compatible = "arm,sp805", "arm,primecell";
 			reg = <0x10010000 0x1000>;
 			clocks = <&wdogclk>, <&pclk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/mps2.dtsi b/arch/arm/boot/dts/mps2.dtsi
index 48c34fa282af..37f5023f529c 100644
--- a/arch/arm/boot/dts/mps2.dtsi
+++ b/arch/arm/boot/dts/mps2.dtsi
@@ -199,8 +199,8 @@
 				arm,primecell-periphid = <0x00141805>;
 				reg = <0x8000 0x1000>;
 				interrupts = <0>;
-				clocks = <&sysclk>;
-				clock-names = "apb_pclk";
+				clocks = <&sysclk>, <&sysclk>;
+				clock-names = "wdog_clk", "apb_pclk";
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index a88ee5294d35..4f7220b11f2d 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -280,7 +280,7 @@
 					reg = <0x0f0000 0x1000>;
 					interrupts = <0>;
 					clocks = <&v2m_refclk32khz>, <&smbclk>;
-					clock-names = "wdogclk", "apb_pclk";
+					clock-names = "wdog_clk", "apb_pclk";
 				};
 
 				v2m_timer01: timer@110000 {
diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpress-v2m.dtsi
index 5e48b641068a..2ac41ed3a57c 100644
--- a/arch/arm/boot/dts/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
@@ -198,7 +198,7 @@
 					reg = <0x0f000 0x1000>;
 					interrupts = <0>;
 					clocks = <&v2m_refclk32khz>, <&smbclk>;
-					clock-names = "wdogclk", "apb_pclk";
+					clock-names = "wdog_clk", "apb_pclk";
 				};
 
 				v2m_timer01: timer@11000 {
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
index f82fa34c90be..e63c5c0bfb43 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dts
@@ -87,8 +87,8 @@
 		status = "disabled";
 		reg = <0 0x2b060000 0 0x1000>;
 		interrupts = <0 98 4>;
-		clocks = <&sys_pll>;
-		clock-names = "apb_pclk";
+		clocks = <&sys_pll>, <&sys_pll>;
+		clock-names = "wdog_clk", "apb_pclk";
 	};
 
 	gic: interrupt-controller@2c001000 {
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
index 3ac95a179452..012d40a7228c 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
@@ -128,7 +128,7 @@
 		reg = <0 0x2a490000 0 0x1000>;
 		interrupts = <0 98 4>;
 		clocks = <&oscclk6a>, <&oscclk6a>;
-		clock-names = "wdogclk", "apb_pclk";
+		clock-names = "wdog_clk", "apb_pclk";
 	};
 
 	hdlcd@2b000000 {
diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
index 6cddea25a292..4c5847955856 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
@@ -132,7 +132,7 @@
 		reg = <0x100e5000 0x1000>;
 		interrupts = <0 51 4>;
 		clocks = <&oscclk2>, <&oscclk2>;
-		clock-names = "wdogclk", "apb_pclk";
+		clock-names = "wdog_clk", "apb_pclk";
 	};
 
 	scu@1e000000 {
-- 
2.17.1

