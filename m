Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729653062B7
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Jan 2021 18:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344260AbhA0Rx0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Jan 2021 12:53:26 -0500
Received: from foss.arm.com ([217.140.110.172]:56910 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343710AbhA0R1g (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Jan 2021 12:27:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A295143B;
        Wed, 27 Jan 2021 09:26:09 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4244B3F66E;
        Wed, 27 Jan 2021 09:26:07 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v5 09/20] dt-bindings: watchdog: sun4i: Add H616 compatible string
Date:   Wed, 27 Jan 2021 17:24:49 +0000
Message-Id: <20210127172500.13356-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210127172500.13356-1-andre.przywara@arm.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use enums to group all compatible devices together on the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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

