Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66657542D3B
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jun 2022 12:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbiFHKYE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jun 2022 06:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbiFHKXF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jun 2022 06:23:05 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 978601F6B46;
        Wed,  8 Jun 2022 03:12:31 -0700 (PDT)
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
        by maillog.nuvoton.com (Postfix) with ESMTP id 10AD21C811BF;
        Wed,  8 Jun 2022 17:56:36 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 8 Jun
 2022 17:56:36 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 8 Jun 2022
 17:56:35 +0800
Received: from taln60.nuvoton.com (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 8 Jun 2022 17:56:35 +0800
Received: by taln60.nuvoton.com (Postfix, from userid 10070)
        id B64BD63A50; Wed,  8 Jun 2022 12:56:33 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <jirislaby@kernel.org>,
        <shawnguo@kernel.org>, <bjorn.andersson@linaro.org>,
        <geert+renesas@glider.be>, <marcel.ziswiler@toradex.com>,
        <vkoul@kernel.org>, <biju.das.jz@bp.renesas.com>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <robert.hancock@calian.com>,
        <j.neuschaefer@gmx.net>, <lkundrak@v3.sk>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 17/20] arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
Date:   Wed, 8 Jun 2022 12:56:20 +0300
Message-ID: <20220608095623.22327-18-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220608095623.22327-1-tmaimon77@gmail.com>
References: <20220608095623.22327-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds support for the Nuvoton NPCM8XX Board Management
controller (BMC) SoC family.

The NPCM8XX based quad-core Cortex-A35 ARMv8 architecture.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 MAINTAINERS                  |  3 +++
 arch/arm64/Kconfig.platforms | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..6e90ce4b4023 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2448,9 +2448,12 @@ F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/arm/npcm/*
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
+F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+F:	include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
+F:	include/dt-bindings/clock/nuvoton,npcm8xx-reset.h
 
 ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 4e6d635a1731..c68d1b4f8975 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -202,6 +202,17 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_NPCM
+	bool "Nuvoton NPCM Architecture"
+	select PINCTRL
+	select GPIOLIB
+	select NPCM7XX_TIMER
+	select RESET_CONTROLLER
+	select MFD_SYSCON
+	help
+	  General support for NPCM8xx BMC (Arbel).
+	  Nuvoton NPCM8xx BMC based on the Cortex A35.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.33.0

