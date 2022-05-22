Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A69F5303FD
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 May 2022 17:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349038AbiEVP5m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 May 2022 11:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348426AbiEVP5W (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 May 2022 11:57:22 -0400
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47EC3B295;
        Sun, 22 May 2022 08:57:17 -0700 (PDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 24MFp9e2031647;
        Sun, 22 May 2022 18:51:09 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 78CD763A4C; Sun, 22 May 2022 18:51:09 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 14/19] dt-bindings: arm: npcm: Add nuvoton,npcm845 compatible string
Date:   Sun, 22 May 2022 18:50:41 +0300
Message-Id: <20220522155046.260146-15-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220522155046.260146-1-tmaimon77@gmail.com>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,NML_ADSP_CUSTOM_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a compatible string for Nuvoton BMC NPCM845 SoC and a board
specific device tree for the NPCM845 (Arbel) evaluation board.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/arm/npcm/npcm.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
index ea9c3103761d..43409e5721d5 100644
--- a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
+++ b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
@@ -27,4 +27,10 @@ properties:
               - nuvoton,npcm750-evb         # NPCM750 evaluation board
           - const: nuvoton,npcm750
 
+      - description: NPCM845 based boards
+        items:
+          - enum:
+              - nuvoton,npcm845-evb         # NPCM845 evaluation board
+          - const: nuvoton,npcm845
+
 additionalProperties: true
-- 
2.33.0

