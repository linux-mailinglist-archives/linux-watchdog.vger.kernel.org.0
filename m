Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE84561840
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jun 2022 12:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbiF3KgR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jun 2022 06:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiF3KgQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jun 2022 06:36:16 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 233BD4F1A6;
        Thu, 30 Jun 2022 03:36:14 -0700 (PDT)
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
        by maillog.nuvoton.com (Postfix) with ESMTP id 379D11C811E1;
        Thu, 30 Jun 2022 18:36:12 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 30
 Jun 2022 18:36:12 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 30 Jun
 2022 18:36:11 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 30 Jun 2022 18:36:11 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id C111363A23; Thu, 30 Jun 2022 13:36:10 +0300 (IDT)
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
Subject: [PATCH v6 03/17] dt-bindings: watchdog: npcm: Add npcm845 compatible string
Date:   Thu, 30 Jun 2022 13:35:52 +0300
Message-ID: <20220630103606.83261-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630103606.83261-1-tmaimon77@gmail.com>
References: <20220630103606.83261-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
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

Add a compatible string for Nuvoton BMC NPCM845 watchdog.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 9059f54dc023..866a958b8a2b 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -6,7 +6,8 @@ expiry.
 
 Required properties:
 - compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
-                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon).
+                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon), or
+                    "nuvoton,npcm845-wdt" for NPCM845 (Arbel).
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt with flags for
                     falling edge.
-- 
2.33.0

