Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A60570253
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Jul 2022 14:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiGKMfk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 Jul 2022 08:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiGKMfg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 Jul 2022 08:35:36 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EBD7545DB;
        Mon, 11 Jul 2022 05:35:33 -0700 (PDT)
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
        by maillog.nuvoton.com (Postfix) with ESMTP id E64E01C811B4;
        Mon, 11 Jul 2022 20:35:26 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 11
 Jul 2022 20:35:26 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 11 Jul
 2022 20:35:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 11 Jul 2022 20:35:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 5E0B263A5B; Mon, 11 Jul 2022 15:35:24 +0300 (IDT)
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
        Tomer Maimon <tmaimon77@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 16/16] arm64: defconfig: Add Nuvoton NPCM family support
Date:   Mon, 11 Jul 2022 15:35:19 +0300
Message-ID: <20220711123519.217219-17-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220711123519.217219-1-tmaimon77@gmail.com>
References: <20220711123519.217219-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Enable basic drivers for NPCM8XX booting up support: Architecture, Clock,
and WD.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d1105343bc2..c4a237a84efa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -49,6 +49,7 @@ CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_MXC=y
+CONFIG_ARCH_NPCM=y
 CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
@@ -627,6 +628,7 @@ CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
+CONFIG_NPCM7XX_WATCHDOG=y
 CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -1021,6 +1023,7 @@ CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_VC5=y
+CONFIG_COMMON_CLK_NPCM8XX=y
 CONFIG_COMMON_CLK_BD718XX=m
 CONFIG_CLK_RASPBERRYPI=m
 CONFIG_CLK_IMX8MM=y
-- 
2.33.0

