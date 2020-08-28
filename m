Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E74255AC9
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgH1NHS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:07:18 -0400
Received: from foss.arm.com ([217.140.110.172]:48702 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729386AbgH1NGX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:06:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A02B7106F;
        Fri, 28 Aug 2020 06:06:15 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B17E3F66B;
        Fri, 28 Aug 2020 06:06:14 -0700 (PDT)
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
Subject: [PATCH 02/10] arm64: dts: arm: Fix SP805 clock-names
Date:   Fri, 28 Aug 2020 14:05:54 +0100
Message-Id: <20200828130602.42203-3-andre.przywara@arm.com>
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

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi    | 2 +-
 arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index eeee51f1251b..40d95c58b55e 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -251,7 +251,7 @@
 					reg = <0x0f0000 0x10000>;
 					interrupts = <7>;
 					clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
-					clock-names = "wdogclk", "apb_pclk";
+					clock-names = "wdog_clk", "apb_pclk";
 				};
 
 				v2m_timer01: timer@110000 {
diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index 001a0a3c7f66..4c4a381d2c75 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -195,7 +195,7 @@
 					reg = <0x0f0000 0x1000>;
 					interrupts = <0>;
 					clocks = <&v2m_refclk32khz>, <&v2m_clk24mhz>;
-					clock-names = "wdogclk", "apb_pclk";
+					clock-names = "wdog_clk", "apb_pclk";
 				};
 
 				v2m_timer01: timer@110000 {
-- 
2.17.1

