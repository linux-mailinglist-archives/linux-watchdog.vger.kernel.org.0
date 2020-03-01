Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87202174CB2
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Mar 2020 11:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgCAKIO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Mar 2020 05:08:14 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:38444 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725768AbgCAKIO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Mar 2020 05:08:14 -0500
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 0219ehkc028746;
        Sun, 1 Mar 2020 11:40:43 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 4E5926032F; Sun,  1 Mar 2020 11:40:43 +0200 (IST)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
        tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/4] dt-binding: watchdog: add restart priority documentation
Date:   Sun,  1 Mar 2020 11:40:37 +0200
Message-Id: <20200301094040.123189-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200301094040.123189-1-tmaimon77@gmail.com>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add device tree restart priority documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933..0a0f86a25eb0 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -17,6 +17,7 @@ Required clocking property, have to be one of:
 
 Optional properties:
 - timeout-sec : Contains the watchdog timeout in seconds
+- nuvoton,restart-priority : Contains the card restart priority.
 
 Example:
 
@@ -25,4 +26,5 @@ timer@f000801c {
     interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
     reg = <0xf000801c 0x4>;
     clocks = <&clk NPCM7XX_CLK_TIMER>;
+	nuvoton,restart-priority = <155>;
 };
-- 
2.22.0

