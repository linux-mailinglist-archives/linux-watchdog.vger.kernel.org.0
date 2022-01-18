Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E664492BF6
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jan 2022 18:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243375AbiARRJS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jan 2022 12:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347017AbiARRJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805B7C061751
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jan 2022 09:09:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by michel.telenet-ops.be with bizsmtp
        id kH992600E0kcUhD06H99lJ; Tue, 18 Jan 2022 18:09:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-00AH3A-Tf; Tue, 18 Jan 2022 18:09:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-001BlM-CO; Tue, 18 Jan 2022 18:09:08 +0100
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
Subject: [PATCH 1/5] clk: renesas: r8a779f0: Add WDT clock
Date:   Tue, 18 Jan 2022 18:09:01 +0100
Message-Id: <8d9b280065a663f2cf31db7b21a010aa781a0af1.1642525158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642525158.git.geert+renesas@glider.be>
References: <cover.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the module clock used by the RCLK Watchdog Timer (RWDT) on the
Renesas R-Car S4-8 (r8a779f0) SoC.  Mark it as a critical clock, to
ensure uninterrupted watchdog operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 4100078406d67073..e48c5af7341454a7 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -121,6 +121,11 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
+	DEF_MOD("wdt",		907,	R8A779F0_CLK_R),
+};
+
+static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(907),	/* WDT */
 };
 
 /*
@@ -177,6 +182,10 @@ const struct cpg_mssr_info r8a779f0_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r8a779f0_mod_clks),
 	.num_hw_mod_clks = 28 * 32,
 
+	/* Critical Module Clocks */
+	.crit_mod_clks = r8a779f0_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r8a779f0_crit_mod_clks),
+
 	/* Callbacks */
 	.init = r8a779f0_cpg_mssr_init,
 	.cpg_clk_register = rcar_gen4_cpg_clk_register,
-- 
2.25.1

