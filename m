Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2554F4DCB36
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Mar 2022 17:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbiCQQZb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Mar 2022 12:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbiCQQZ1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Mar 2022 12:25:27 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4105EBD7E8;
        Thu, 17 Mar 2022 09:24:11 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07AA01576;
        Thu, 17 Mar 2022 09:24:11 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6063F7B4;
        Thu, 17 Mar 2022 09:24:08 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 03/12] ARM: dts: suniv: F1C100: fix watchdog compatible
Date:   Thu, 17 Mar 2022 16:23:40 +0000
Message-Id: <20220317162349.739636-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317162349.739636-1-andre.przywara@arm.com>
References: <20220317162349.739636-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The F1C100 series of SoCs actually have their watchdog IP being
compatible with the newer Allwinner generation, not the older one.

The currently described sun4i-a10-wdt actually does not work, neither
the watchdog functionality (just never fires), nor the reset part
(reboot hangs).

Replace the compatible string with the one used by the newer generation.
Verified to work with both the watchdog and reboot functionality on a
LicheePi Nano.

Also add the missing interrupt line and clock source, to make it binding
compliant.

Fixes: 4ba16d17efdd ("ARM: dts: suniv: add initial DTSI file for F1C100s")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 6100d3b75f61..def830101448 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -104,8 +104,10 @@ timer@1c20c00 {
 
 		wdt: watchdog@1c20ca0 {
 			compatible = "allwinner,suniv-f1c100s-wdt",
-				     "allwinner,sun4i-a10-wdt";
+				     "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
+			interrupts = <16>;
+			clocks = <&osc32k>;
 		};
 
 		uart0: serial@1c25000 {
-- 
2.25.1

