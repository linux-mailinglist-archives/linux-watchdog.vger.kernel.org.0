Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42E6255AE6
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbgH1NJs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:09:48 -0400
Received: from foss.arm.com ([217.140.110.172]:48816 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729431AbgH1NHh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:07:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 599A51396;
        Fri, 28 Aug 2020 06:06:20 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 254E43F66B;
        Fri, 28 Aug 2020 06:06:19 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 05/10] arm64: dts: hisilicon: Fix SP805 clocks
Date:   Fri, 28 Aug 2020 14:05:57 +0100
Message-Id: <20200828130602.42203-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The SP805 DT binding requires two clocks to be specified, but
Hisilicon platform DTs currently only specify one clock.

In practice, Linux would pick a clock named "apb_pclk" for the bus
clock, and the Linux and U-Boot SP805 driver would use the first clock
to derive the actual watchdog counter frequency.

Since currently both are the very same clock, we can just double the
clock reference, and add the correct clock-names, to match the binding.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 10 ++++++----
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi |  5 +++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index d25aac5e0bf8..994140fbc916 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1089,16 +1089,18 @@
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xe8a06000 0x0 0x1000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&crg_ctrl HI3660_OSC32K>;
-			clock-names = "apb_pclk";
+			clocks = <&crg_ctrl HI3660_OSC32K>,
+				 <&crg_ctrl HI3660_OSC32K>;
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		watchdog1: watchdog@e8a07000 {
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xe8a07000 0x0 0x1000>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&crg_ctrl HI3660_OSC32K>;
-			clock-names = "apb_pclk";
+			clocks = <&crg_ctrl HI3660_OSC32K>,
+				 <&crg_ctrl HI3660_OSC32K>;
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		tsensor: tsensor@fff30000 {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3d189d9f0d24..6578f8191d71 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -843,8 +843,9 @@
 			compatible = "arm,sp805-wdt", "arm,primecell";
 			reg = <0x0 0xf8005000 0x0 0x1000>;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ao_ctrl HI6220_WDT0_PCLK>;
-			clock-names = "apb_pclk";
+			clocks = <&ao_ctrl HI6220_WDT0_PCLK>,
+				 <&ao_ctrl HI6220_WDT0_PCLK>;
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		tsensor: tsensor@0,f7030700 {
-- 
2.17.1

