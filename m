Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C4A57757D
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Jul 2022 11:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbiGQJSJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Jul 2022 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbiGQJQd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Jul 2022 05:16:33 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 934D815FC6;
        Sun, 17 Jul 2022 02:16:31 -0700 (PDT)
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
        by maillog.nuvoton.com (Postfix) with ESMTP id 13BE21C81188;
        Sun, 17 Jul 2022 17:16:28 +0800 (CST)
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 17
 Jul 2022 17:16:27 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sun, 17 Jul
 2022 17:16:27 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Sun, 17 Jul 2022 17:16:27 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 8D1C663A4C; Sun, 17 Jul 2022 12:16:25 +0300 (IDT)
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
Subject: [PATCH v9 06/16] ARM: dts: nuvoton: add reset syscon property
Date:   Sun, 17 Jul 2022 12:15:59 +0300
Message-ID: <20220717091609.122968-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220717091609.122968-1-tmaimon77@gmail.com>
References: <20220717091609.122968-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add nuvoton,sysgcr syscon property to the reset node to handle the general
control registers.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..8a2f29016291 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -110,6 +110,7 @@ rstc: rstc@f0801000 {
 			compatible = "nuvoton,npcm750-reset";
 			reg = <0xf0801000 0x70>;
 			#reset-cells = <2>;
+			nuvoton,sysgcr = <&gcr>;
 		};
 
 		clk: clock-controller@f0801000 {
-- 
2.33.0

