Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10FA492BF0
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jan 2022 18:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347026AbiARRJS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jan 2022 12:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347030AbiARRJR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jan 2022 12:09:17 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6774C06175A
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Jan 2022 09:09:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by michel.telenet-ops.be with bizsmtp
        id kH992600B0kcUhD06H99lH; Tue, 18 Jan 2022 18:09:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-00AH3B-Qu; Tue, 18 Jan 2022 18:09:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rym-001BlT-D6; Tue, 18 Jan 2022 18:09:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] dt-bindings: watchdog: renesas-wdt: Document r8a779f0 support
Date:   Tue, 18 Jan 2022 18:09:02 +0100
Message-Id: <cca61a83ae82ecf5c23eb28e30c39f2f661f0e02.1642525158.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642525158.git.geert+renesas@glider.be>
References: <cover.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Thanh Quan <thanh.quan.xn@renesas.com>

Document support for the Watchdog Timer (WDT) Controller in the Renesas
R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 91a98ccd4226f505..d060438e1402d502 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -55,6 +55,11 @@ properties:
               - renesas,r8a779a0-wdt     # R-Car V3U
           - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
 
+      - items:
+          - enum:
+              - renesas,r8a779f0-wdt     # R-Car S4-8
+          - const: renesas,rcar-gen4-wdt # R-Car Gen4
+
   reg:
     maxItems: 1
 
-- 
2.25.1

