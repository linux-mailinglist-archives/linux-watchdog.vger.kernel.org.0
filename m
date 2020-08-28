Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2DA255ACB
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbgH1NHb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:07:31 -0400
Received: from foss.arm.com ([217.140.110.172]:48718 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729414AbgH1NGX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:06:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6342111B3;
        Fri, 28 Aug 2020 06:06:17 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2DEF3F66B;
        Fri, 28 Aug 2020 06:06:15 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 03/10] arm64: dts: broadcom: Fix SP805 clock-names
Date:   Fri, 28 Aug 2020 14:05:55 +0100
Message-Id: <20200828130602.42203-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The SP805 binding sets the name for the actual watchdog clock to
"wdog_clk" (with an underscore).

Change the name in the DTs for Broadcom platforms to match that. The
Linux and U-Boot driver use the *first* clock for this purpose anyway,
so it does not break anything.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 15f7b0ed3836..6a5fc55f0a4e 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -576,7 +576,7 @@
 			reg = <0x66090000 0x1000>;
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&iprocslow>, <&iprocslow>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		gpio_g: gpio@660a0000 {
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 0098dfdef96c..b425b12c3ed2 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -438,7 +438,7 @@
 			reg = <0x000c0000 0x1000>;
 			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&hsls_25m_div2_clk>, <&hsls_div4_clk>;
-			clock-names = "wdogclk", "apb_pclk";
+			clock-names = "wdog_clk", "apb_pclk";
 			timeout-sec = <60>;
 		};
 
-- 
2.17.1

