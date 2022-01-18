Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057E1492BE7
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jan 2022 18:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347028AbiARRJR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiARRJQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jan 2022 12:09:16 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A200C061401
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jan 2022 09:09:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by albert.telenet-ops.be with bizsmtp
        id kH992600H0kcUhD06H99m4; Tue, 18 Jan 2022 18:09:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9ryn-00AH3D-4M; Tue, 18 Jan 2022 18:09:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-001Bli-Er; Tue, 18 Jan 2022 18:09:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a779f0: Add RWDT node
Date:   Tue, 18 Jan 2022 18:09:04 +0100
Message-Id: <556a7f41bdadceecbe8b59b79ac7e9f592ca17a2.1642525158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642525158.git.geert+renesas@glider.be>
References: <cover.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 5426532d10e2a472..0ac8c345558efc17 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -59,6 +59,16 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a779f0-wdt",
+				     "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 907>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

