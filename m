Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D44255AD4
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgH1NHj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:07:39 -0400
Received: from foss.arm.com ([217.140.110.172]:48734 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729416AbgH1NGX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:06:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E53E211D4;
        Fri, 28 Aug 2020 06:06:18 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9702A3F66B;
        Fri, 28 Aug 2020 06:06:17 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 04/10] arm64: dts: freescale: Fix SP805 clock-names
Date:   Fri, 28 Aug 2020 14:05:56 +0100
Message-Id: <20200828130602.42203-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The SP805 binding sets the order of the clock-names to be: "wdog_clk",
"apb_pclk" (in exactly that order).

Change the order in the DTs for Freescale platforms to match that. The
two clocks given in all nodes are actually the same, so that does not
change any behaviour.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 16 ++++++++--------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 0efeb8fa773e..13c0163939ad 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -722,14 +722,14 @@
 			compatible = "arm,sp805", "arm,primecell";
 			reg = <0x0 0xc000000 0x0 0x1000>;
 			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster1_core1_watchdog: watchdog@c010000 {
 			compatible = "arm,sp805", "arm,primecell";
 			reg = <0x0 0xc010000 0x0 0x1000>;
 			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		sai1: audio-controller@f100000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 169f4742ae3b..762d571e929c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -658,56 +658,56 @@
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc000000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster1_core1_watchdog: wdt@c010000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc010000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster1_core2_watchdog: wdt@c020000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc020000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster1_core3_watchdog: wdt@c030000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc030000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core0_watchdog: wdt@c100000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc100000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core1_watchdog: wdt@c110000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc110000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core2_watchdog: wdt@c120000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc120000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core3_watchdog: wdt@c130000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc130000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		fsl_mc: fsl-mc@80c000000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 41102dacc2e1..d3d87c56616c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -231,56 +231,56 @@
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc000000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster1_core1_watchdog: wdt@c010000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc010000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core0_watchdog: wdt@c100000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc100000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster2_core1_watchdog: wdt@c110000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc110000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster3_core0_watchdog: wdt@c200000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc200000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster3_core1_watchdog: wdt@c210000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc210000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster4_core0_watchdog: wdt@c300000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc300000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		cluster4_core1_watchdog: wdt@c310000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xc310000 0x0 0x1000>;
 			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
-			clock-names = "apb_pclk", "wdog_clk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		crypto: crypto@8000000 {
-- 
2.17.1

