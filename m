Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 782344DCB2E
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Mar 2022 17:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiCQQZZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Mar 2022 12:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbiCQQZZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Mar 2022 12:25:25 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F211EBB90C;
        Thu, 17 Mar 2022 09:24:08 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B26B31570;
        Thu, 17 Mar 2022 09:24:08 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0E333F7B4;
        Thu, 17 Mar 2022 09:24:06 -0700 (PDT)
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
Subject: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock support
Date:   Thu, 17 Mar 2022 16:23:39 +0000
Message-Id: <20220317162349.739636-3-andre.przywara@arm.com>
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

Most Allwinner SoCs have just one input clock to drive the watchdog
peripheral. So far this is the 24 MHz "HOSC" oscillator, divided down
internally to 32 KHz.
The F1C100 series watchdog however uses the unchanged 32 KHz "LOSC" as
its only clock input, which has the same effect, but let's the binding
description mismatch.

Change the binding description to name the clocks more loosely, so both
the LOSC and divided HOSC match the description. As the fixed clock names
now make less sense, drop them from SoCs supporting just one clock
input, they were not used by any DT anyway.

For the newer SoCs, supporting a choice of two input clocks, we keep
both the description and clock-names requirement.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 7a26cde0afdd..cbcf19f51411 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -39,14 +39,8 @@ properties:
   clocks:
     minItems: 1
     items:
-      - description: High-frequency oscillator input, divided internally
-      - description: Low-frequency oscillator input, only found on some variants
-
-  clock-names:
-    minItems: 1
-    items:
-      - const: hosc
-      - const: losc
+      - description: 32 KHz input clock
+      - description: secondary clock source
 
   interrupts:
     maxItems: 1
@@ -71,9 +65,14 @@ then:
   properties:
     clocks:
       minItems: 2
+      items:
+        - description: High-frequency oscillator input, divided internally
+        - description: Low-frequency oscillator input
 
     clock-names:
-      minItems: 2
+      items:
+        - const: hosc
+        - const: losc
 
   required:
     - clock-names
@@ -83,9 +82,6 @@ else:
     clocks:
       maxItems: 1
 
-    clock-names:
-      maxItems: 1
-
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

