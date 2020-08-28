Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45942255AEC
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgH1NKL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:10:11 -0400
Received: from foss.arm.com ([217.140.110.172]:48822 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729438AbgH1NHh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:07:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476E81477;
        Fri, 28 Aug 2020 06:06:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B84143F66B;
        Fri, 28 Aug 2020 06:06:23 -0700 (PDT)
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
Subject: [PATCH 08/10] ARM: dts: Cygnus: Fix SP805 clocks
Date:   Fri, 28 Aug 2020 14:06:00 +0100
Message-Id: <20200828130602.42203-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828130602.42203-1-andre.przywara@arm.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The SP805 DT binding requires two clocks to be specified, but the
Broadcom Cygnus DT currently only specifies one clock.

In practice, Linux would pick a clock named "apb_pclk" for the bus
clock, and the Linux and U-Boot SP805 driver would use the first clock
to derive the actual watchdog counter frequency.

Since currently both are the very same clock, we can just double the
clock reference, and add the correct clock-names, to match the binding.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 35bdd0969f0a..dacaef2c14ca 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -234,8 +234,8 @@
 			compatible = "arm,sp805" , "arm,primecell";
 			reg = <0x18009000 0x1000>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&axi81_clk>;
-			clock-names = "apb_pclk";
+			clocks = <&axi81_clk>, <&axi81_clk>;
+			clock-names = "wdog_clk", "apb_pclk";
 		};
 
 		gpio_ccm: gpio@1800a000 {
-- 
2.17.1

