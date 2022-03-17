Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A074DCB2C
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Mar 2022 17:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbiCQQZY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Mar 2022 12:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236494AbiCQQZX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Mar 2022 12:25:23 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6B34BB90C;
        Thu, 17 Mar 2022 09:24:06 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C611515;
        Thu, 17 Mar 2022 09:24:06 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56FB03F7B4;
        Thu, 17 Mar 2022 09:24:04 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: watchdog: sunxi: fix F1C100s compatible
Date:   Thu, 17 Mar 2022 16:23:38 +0000
Message-Id: <20220317162349.739636-2-andre.przywara@arm.com>
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

The F1C100 series actually features a newer generation watchdog IP, so
the compatible string was wrong.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 43afa24513b9..7a26cde0afdd 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -26,10 +26,8 @@ properties:
               - allwinner,sun50i-h616-wdt
               - allwinner,sun50i-r329-wdt
               - allwinner,sun50i-r329-wdt-reset
+              - allwinner,suniv-f1c100s-wdt
           - const: allwinner,sun6i-a31-wdt
-      - items:
-          - const: allwinner,suniv-f1c100s-wdt
-          - const: allwinner,sun4i-a10-wdt
       - const: allwinner,sun20i-d1-wdt
       - items:
           - const: allwinner,sun20i-d1-wdt-reset
-- 
2.25.1

