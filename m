Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CD657757C
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Jul 2022 11:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiGQJSI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 17 Jul 2022 05:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbiGQJQd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 17 Jul 2022 05:16:33 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9351B15FCD;
        Sun, 17 Jul 2022 02:16:31 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id 1ADCB1C8118E;
        Sun, 17 Jul 2022 17:16:28 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Sun, 17 Jul
 2022 17:16:27 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sun, 17 Jul
 2022 17:16:27 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Sun, 17 Jul 2022 17:16:27 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 8BAA463A4F; Sun, 17 Jul 2022 12:16:25 +0300 (IDT)
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
Subject: [PATCH v9 01/16] dt-bindings: timer: npcm: Add npcm845 compatible string
Date:   Sun, 17 Jul 2022 12:15:54 +0300
Message-ID: <20220717091609.122968-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220717091609.122968-1-tmaimon77@gmail.com>
References: <20220717091609.122968-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a compatible string for Nuvoton BMC NPCM845 timer.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
index 0cbc26a72151..737af78ad70c 100644
--- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
@@ -8,12 +8,14 @@ title: Nuvoton NPCM7xx timer
 
 maintainers:
   - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
+  - Tomer Maimon <tmaimon77@gmail.com>
 
 properties:
   compatible:
     enum:
       - nuvoton,wpcm450-timer  # for Hermon WPCM450
       - nuvoton,npcm750-timer  # for Poleg NPCM750
+      - nuvoton,npcm845-timer  # for Arbel NPCM845
 
   reg:
     maxItems: 1
-- 
2.33.0

