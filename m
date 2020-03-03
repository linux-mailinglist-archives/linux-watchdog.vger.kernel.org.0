Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04B4A17736B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2020 11:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgCCKCj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Mar 2020 05:02:39 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:38681 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726694AbgCCKCi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Mar 2020 05:02:38 -0500
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 023A1H7U019841;
        Tue, 3 Mar 2020 12:01:17 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 166016032F; Tue,  3 Mar 2020 12:01:17 +0200 (IST)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
        tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 1/3] dt-binding: watchdog: add bootstatus reset type documentation
Date:   Tue,  3 Mar 2020 12:01:12 +0200
Message-Id: <20200303100114.87786-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303100114.87786-1-tmaimon77@gmail.com>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add device tree three bootstatus reset types documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933..65e24a80ee70 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -17,6 +17,33 @@ Required clocking property, have to be one of:
 
 Optional properties:
 - timeout-sec : Contains the watchdog timeout in seconds
+- nuvoton,card-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the card reset type for checking and indicating
+  the last card reset status (WDIOF_CARDRESET)
+
+  If 'nuvoton,card-reset-type' is not specified the default is porst
+
+  Reset types:
+       - porst: Power reset
+       - corst: Core reset
+	   - wdX : Watchdog reset X (X represante 0-2)
+	   - swX : Software reset X (X represante 1-4)
+
+- nuvoton,ext1-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN1)
+
+  If 'nuvoton,card-reset-type' is not specified the default is wd0.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
+
+- nuvoton,ext2-reset-type : "porst|corst|wd0|wd1|wd2|sw1|sw2|sw3|sw4"
+  Contains the external 2 reset type for checking and indicating
+  the last external 2 reset status (WDIOF_EXTERN2)
+
+  If 'nuvoton,card-reset-type' is not specified the default is sw1.
+
+  Reset types are the same as in nuvoton,card-reset-type property.
 
 Example:
 
@@ -25,4 +52,7 @@ timer@f000801c {
     interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
     reg = <0xf000801c 0x4>;
     clocks = <&clk NPCM7XX_CLK_TIMER>;
+	nuvoton,card-reset-type = "porst";
+	nuvoton,ext1-reset-type = "wd1";
+	nuvoton,ext2-reset-type = "sw2";
 };
-- 
2.22.0

