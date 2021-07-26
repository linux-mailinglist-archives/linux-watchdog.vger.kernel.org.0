Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EEE3D51BC
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 05:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhGZDLS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 23:11:18 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:39343 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231530AbhGZDLS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 23:11:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id B6720580457;
        Sun, 25 Jul 2021 23:51:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 25 Jul 2021 23:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=H3jwiRFGXqJPvuv7Y4q/rPalVp
        61u1Fw/7F6aOr79LI=; b=DEnQEUhxbmdScDeubloC1ND86h8tYv8bVxrPn1LwGc
        9ZQxGFMjHYpjLl8dO31XXc6CzHhsAqYXz4gJcuC+67Q+7n0qXurdxsvl1O57/7Dn
        hNXNrLkjW3YUPrgnqnDzWVt2GIchjvIUSKpIIvHCUyJjtJ3yMUx5cSsEngjDO6pw
        xG0D3hxOkuJHqqzPUvfl+vCr2PfZMB108kbZbScILPv3LBb6nZk9RHk3lbbIfTSB
        6P/Urs9UztRG7UWbDtY3fhdMOJpGCVzMFFgYH3GH0zBm5yZIh/QaRzDB6uuYkOAI
        7QF5Q62Qijsp25LPD6j4awKBNTHJVBsiKHcHRRf0u7DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=H3jwiRFGXqJPvuv7Y
        4q/rPalVp61u1Fw/7F6aOr79LI=; b=jAiPfcuGN3j+8SGBwkGLvBedOFfeEpr3Y
        2HvcuQkNm7rrwj8T+yBEb3SL5Mvez1y++G/grk+yCaqIagvoO7xZlZKtFQ3kAzIr
        KK//onyqKn4k4/iVVLtqpTDJ7pfWgSZBT2ie32E86aCv2WfzzU8loOcoKFkdYiWP
        5do7oqIPZ8EKpfjOKB9T6Pp8H+IL+UYxTQlzyy9XQbjuczBNkkQWSkDPXqloCOAI
        zM2KAu++JL5rHn5RUsVILlLkO0Ak8nlKxM5wajuBXlZMPJrloA6qXoYVY7f+RbSM
        Y5bPQFR1BrcwG2m8nqLVUr5sn7Vfrr1a7EEMcYo9ZWZ0gj6KUnjKg==
X-ME-Sender: <xms:UDH-YFiqFn0FADDZTYj9HyovQR4n1Go_RCUT5L3Bbghu8hSuOX5zRQ>
    <xme:UDH-YKCzx0CxXZK8tkSDiB4P1fFIIXY1TNJ8ahOKzuX6Su9UhSUaxYgK3_UxQm6s-
    7CYDhxi9WRerqEj9w>
X-ME-Received: <xmr:UDH-YFGTSU-9qaaUPO7HPTdcMf4bq2zlfYFeIHMFTHdBpWUtCEYodJ_V9Or8UVDj1o6Igqxrw9mNUsuNdF90pplrM6mjefFIWk_wCRrIE9DkSzqnhut8KD_D0oxIq3-6wquTDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UDH-YKTrPS4_z-OoFFDKWH_EmjeJdpl4piO3rU11wMPnHUvo_3VmyQ>
    <xmx:UDH-YCxxhgHOGSBqAf4Hri13lzfLSD5_vG0eYdPeeMcQB9TY2Z1pSQ>
    <xmx:UDH-YA5UYm2jrIUs7rCOhSs027j20-K7COUdjh_n8rWZDvZVpQbF7g>
    <xmx:UjH-YHqmW8jzILQqmjzoB5_lavdFjuZX-dCXtPqSqCs3hit_4H06UQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jul 2021 23:51:43 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/3] dt-bindings: watchdog: sunxi: Add compatible for R329
Date:   Sun, 25 Jul 2021 22:51:41 -0500
Message-Id: <20210726035143.53132-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
an alternative clock source, with a bit to switch between them.

Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
cycle counts to keep the timeouts independent of the clock source. This
keeps the programming interface backward-compatible.

R329 also adds two new registers, to allow software to immediately drive
the SoC reset signal.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 9aa3c313c49f..853ceb1b7c0f 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -24,6 +24,7 @@ properties:
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
               - allwinner,sun50i-h616-wdt
+              - allwinner,sun50i-r329-wdt
           - const: allwinner,sun6i-a31-wdt
       - items:
           - const: allwinner,suniv-f1c100s-wdt
@@ -33,7 +34,16 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - hosc
+        - losc
 
   interrupts:
     maxItems: 1
@@ -44,6 +54,24 @@ required:
   - clocks
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-r329-wdt
+
+then:
+  properties:
+    clocks:
+      minItems: 2
+
+    clock-names:
+      minItems: 2
+
+  required:
+    - clock-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.31.1

