Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340B32D6D7A
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Dec 2020 02:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394894AbgLKBXG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Dec 2020 20:23:06 -0500
Received: from foss.arm.com ([217.140.110.172]:49796 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394778AbgLKBV6 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Dec 2020 20:21:58 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7DAE152F;
        Thu, 10 Dec 2020 17:20:35 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41E6B3F66B;
        Thu, 10 Dec 2020 17:20:33 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 17/21] dt-bindings: watchdog: sun4i: Add H616 compatible string
Date:   Fri, 11 Dec 2020 01:19:30 +0000
Message-Id: <20201211011934.6171-18-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20201211011934.6171-1-andre.przywara@arm.com>
References: <20201211011934.6171-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use enums to group all compatible devices together on the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 5ac607de8be4..9aa3c313c49f 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -19,13 +19,11 @@ properties:
       - const: allwinner,sun4i-a10-wdt
       - const: allwinner,sun6i-a31-wdt
       - items:
-          - const: allwinner,sun50i-a64-wdt
-          - const: allwinner,sun6i-a31-wdt
-      - items:
-          - const: allwinner,sun50i-a100-wdt
-          - const: allwinner,sun6i-a31-wdt
-      - items:
-          - const: allwinner,sun50i-h6-wdt
+          - enum:
+              - allwinner,sun50i-a64-wdt
+              - allwinner,sun50i-a100-wdt
+              - allwinner,sun50i-h6-wdt
+              - allwinner,sun50i-h616-wdt
           - const: allwinner,sun6i-a31-wdt
       - items:
           - const: allwinner,suniv-f1c100s-wdt
-- 
2.17.5

