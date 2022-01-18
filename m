Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AC1492BE8
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jan 2022 18:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbiARRJR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346258AbiARRJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6070EC061746
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jan 2022 09:09:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by laurent.telenet-ops.be with bizsmtp
        id kH992600K0kcUhD01H99pM; Tue, 18 Jan 2022 18:09:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-00AH39-SU; Tue, 18 Jan 2022 18:09:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-001BlH-B8; Tue, 18 Jan 2022 18:09:08 +0100
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
Subject: [PATCH 0/5] arm64: renesas: Add R-Car S4-8 watchdog support on Spider
Date:   Tue, 18 Jan 2022 18:09:00 +0100
Message-Id: <cover.1642525158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

	Hi all,

This patch series adds support for the RCLK Watchdog Timer (RWDT) in the
R-Car S4-8 SoC, and enables it on the Renesas Spider development board.

Patch 1 is to be queued in renesas-clk for v5.18.
Patches 2 and 3 are intended for the watchdog tree.
Patches 4 and 5 are to be queued in renesas-devel for v5.18.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a779f0: Add WDT clock
  arm64: dts: renesas: r8a779f0: Add RWDT node
  arm64: dts: renesas: spider-cpu: Enable watchdog timer

Thanh Quan (2):
  dt-bindings: watchdog: renesas-wdt: Document r8a779f0 support
  watchdog: renesas_wdt: Add R-Car Gen4 support

 .../devicetree/bindings/watchdog/renesas,wdt.yaml      |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi   |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi              | 10 ++++++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c                |  9 +++++++++
 drivers/watchdog/renesas_wdt.c                         |  1 +
 5 files changed, 30 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
