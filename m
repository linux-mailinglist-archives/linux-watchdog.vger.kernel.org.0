Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D133255AEE
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 15:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgH1NKM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 09:10:12 -0400
Received: from foss.arm.com ([217.140.110.172]:48828 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729461AbgH1NHh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 09:07:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B9D1509;
        Fri, 28 Aug 2020 06:06:28 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.195.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E2CD3F66B;
        Fri, 28 Aug 2020 06:06:27 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 10/10] ARM: dts: hisilicon: Fix SP805 clocks
Date:   Fri, 28 Aug 2020 14:06:02 +0100
Message-Id: <20200828130602.42203-11-andre.przywara@arm.com>
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
 arch/arm/boot/dts/hisi-x5hd2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 3ee7967c202d..e2dbf1d8a67b 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -370,8 +370,9 @@
 				arm,primecell-periphid = <0x00141805>;
 				reg = <0xa2c000 0x1000>;
 				interrupts = <0 29 4>;
-				clocks = <&clock HIX5HD2_WDG0_RST>;
-				clock-names = "apb_pclk";
+				clocks = <&clock HIX5HD2_WDG0_RST>,
+					 <&clock HIX5HD2_WDG0_RST>;
+				clock-names = "wdog_clk", "apb_pclk";
 			};
 		};
 
-- 
2.17.1

