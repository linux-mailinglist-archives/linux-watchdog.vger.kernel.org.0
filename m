Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0541A3FF779
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 00:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347919AbhIBW7E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 18:59:04 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47113 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347912AbhIBW64 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 18:58:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 0692B2B0004F;
        Thu,  2 Sep 2021 18:57:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 02 Sep 2021 18:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=4O/6AKT6OT51h
        gMCAL5YGVG9wbdi8gB/Srj+y+pJsPM=; b=neLRzjc1NRd58tc8OKTKalQLEj6Jj
        i4js/08kAkQiIRwG/RbaKPA2IsIFNyPE/cNZk6atxGY5VJ3AFM3Uy2YmCdpDoQ8W
        BevacnhlkegPau6rUORu0CcFXgmhxh849g/xzieortOjsFQS2mrpgbTQ9xRH0+QN
        7GRSOsmHhA2ylO7kkOMmaaN6SYSQ1VimEbLALgZ0jux12r/KWJyEYRfyocPpmuld
        Cd/PGQba3ZZy04ZmecdJXCCe/r2tEvsv6AIZPM1QTs6nXuLKcAmkzoj4aKajC6VE
        w/A8hc2pNv15eCL/yZztLLvnmeWpBhcqi9HXBJ8iPpV43+ID+GfQylX3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=4O/6AKT6OT51hgMCAL5YGVG9wbdi8gB/Srj+y+pJsPM=; b=leNLtN1c
        tUsIdEh9+ms+KZT3+jnhyZ4AI/BOITVp/rVejbsHpwJuNwNJXQvT80TJHDwWdHvC
        /8eDRwK2qDbMHzSnU+jK4dQsZ+Mu1brSN9OxnVBduCPqwuL8xIgjxXrmI5e3eE0u
        ErL+pszmt12FHIuTl/yE/2Ahkxix3EWnG1Rxs6lSEpgbIOvZHs+sVvmM7U0cl96A
        RIjP53VEiSJ46HWyFUgiqLzT0h7cp3yan6FBcqjxeM5WCb+rXcxj/QdWa3qzjxTN
        OfeC7GYE7gpGnQbytMcrUyEzznnemruSxvub2EqexKzYs2sYlsb0FKmiAtLX/10p
        pGcvO4/5/ZO8FA==
X-ME-Sender: <xms:81YxYZ3BeAFbqES3XBdlZAZIOTJpchBhStcUO2tYV0PqmMiwyHWFFw>
    <xme:81YxYQGaDwk9nz36ycyvMtSifBmkWp5P7QezypQy0blu4KHdMJkEzFYbUXsIbhHtL
    rP5tltlnXXTSU1U1w>
X-ME-Received: <xmr:81YxYZ7QTa4x5viNKUw46i4UVuRjNQaHd_A9cdkNYTJa2k3KJ3k33_hlu80zy1ahFHB2YoAHZA7zbbZWpLhAaFjS1rckGivHLjLE2zzlElG3Qq_GhYDp24baQLFG417PGBF8JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:81YxYW0zG7sEjJkLRmrBd--8E5RtzE1oktj2crLe2SzY-jQ0QvUAFQ>
    <xmx:81YxYcGXiEUEZ2UTo1tucuaMgsoNACl1gfNjRSY-fU0E0CU0dHdVbg>
    <xmx:81YxYX-fUhjCLGWU4o27gjwvPM8M9zs4C_4KN1w-P1DEGnDsPMyHug>
    <xmx:9FYxYf-PW_bMeUGBXcMbQUXDYiRa1LwwB7CyAJlkrbFf5oTSXokpbLJEOQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 18:57:54 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 1/3] dt-bindings: watchdog: sunxi: Add compatibles for R329
Date:   Thu,  2 Sep 2021 17:57:48 -0500
Message-Id: <20210902225750.29313-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902225750.29313-1-samuel@sholland.org>
References: <20210902225750.29313-1-samuel@sholland.org>
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

Furthermore, the R329 has two watchdogs: one for use by the ARM CPUs
at 0x20000a0, and a second one for use by the DSPs at 0x7020400. The
first of these adds two more new registers, to allow software to
immediately assert the SoC reset signal. Add an additional "-reset"
suffix to signify the presence of this feature.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes v2 to v3:
 - Add else case
 - Add additional allwinner,sun50i-r329-wdt-reset compatible
Changes v1 to v2:
 - Switch clock-names from enum to const
 - Add descriptions to "clocks" items

 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 9aa3c313c49f..877f47759814 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -24,6 +24,8 @@ properties:
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
               - allwinner,sun50i-h616-wdt
+              - allwinner,sun50i-r329-wdt
+              - allwinner,sun50i-r329-wdt-reset
           - const: allwinner,sun6i-a31-wdt
       - items:
           - const: allwinner,suniv-f1c100s-wdt
@@ -33,7 +35,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: High-frequency oscillator input, divided internally
+      - description: Low-frequency oscillator input, only found on some variants
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: hosc
+      - const: losc
 
   interrupts:
     maxItems: 1
@@ -44,6 +57,33 @@ required:
   - clocks
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-r329-wdt
+          - allwinner,sun50i-r329-wdt-reset
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
+else:
+  properties:
+    clocks:
+      maxItems: 1
+
+    clock-names:
+      maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.31.1

