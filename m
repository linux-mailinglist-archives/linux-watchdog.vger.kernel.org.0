Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A373E0D69
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Aug 2021 06:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhHEE5e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Aug 2021 00:57:34 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:48745 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230337AbhHEE5d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Aug 2021 00:57:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id DE3A12B004AB;
        Thu,  5 Aug 2021 00:57:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 05 Aug 2021 00:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=E52/j2R5l9gMw0d5KOs9lNmLDB
        fBSjHZQgpnRrtTk1s=; b=NHPC6tkxnh87VKuo8T9vd7Jc/E/Mx3cEBA3pb+fX4l
        Qz6wed6s8n1j2Hnx1m+CGxA8gZP2N/FfmLWFkp0epKc0WgwTjEu8/vZD7a7I1X5h
        zvNynYOQMnxV3+5OHvr4s3t3RSyDIoSkZ++JK47KlQdgP4nnKiRXSuc2N/zmCPTR
        kZMR+39VC9/ohiFe1sPWBLJQcErk3ADWWP2bwiql3hFzGlYor36aAcuuqJDbtQ0X
        6VojGZiYRrc25WA5jqg4LtDxTsVyLGhlTHxdi64O1YWtDnG7vXl5uLFxLN/WGIiJ
        RwZ89lYYkUqOugF/0uaODSDPmNAwHcempcM3+VphQH4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E52/j2R5l9gMw0d5K
        Os9lNmLDBfBSjHZQgpnRrtTk1s=; b=FBhWOgyQ2Ayc62M4Y+Qt85IMXeckICQVy
        iqmGSPj3hWrL6kvQbige2UKmDTIHwAGV/Tdzvn+XoO3LNqHONb1ynIsnCKE/afyS
        wBaL7dWs6LmHNgDOyn6hucnmTDkSMToltQecY2anP+fNYbitPyc3PqUfgXT1XgTn
        llwKoOZwNTf3x5VLSUth7IXrnkk+YxWvvktZSBHjWU6AmeiU6IfsZpf2qOd3V+U1
        0TZivQebv6174GCb3o2X+rh76fwfcX5MmZb32b6+sL/lvX5NO9XPg4LxW6cf2b+B
        G4AUuyEAyK3zLTsNKvjWGW6VflZfN+Wy/H2d3ikDVVLEo4vRen4Mg==
X-ME-Sender: <xms:rW8LYRy7oPwvjhsPaNLPuRPcZZL7DKZX6OzzQ4pLln8_rU3wRLEuIQ>
    <xme:rW8LYRTvUAY9Q419MzIQQ_trLHNT01PA5CMbP8hX90SevE9mQpf-Iyhk9PPgtTJPS
    Wz4OgFjHIgwaKDlaQ>
X-ME-Received: <xmr:rW8LYbUbEh2-3okRdaZ0wswCn7uk1eWp-0RP0GPOmGN_hEo02UMMbewLCi_Nk1-JZr2n7iE2T6NLsqszWH7ve8OEaDyDJlciLIGGCj3l1RmJCCi-rm_uHE3rbC217LSd4699cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:rW8LYTjWWWujfkaoVyLsK4W0AKJMEVS2g3xmT0HdHGqNZIV9bB_G2w>
    <xmx:rW8LYTBKmrOK7fC3s_xM_r7iMrXjTKQcLp-KUOb966MaT2gkUQLYtA>
    <xmx:rW8LYcJSf5wID8HepurG2sRnyyWfvkk8whqsE_vb-eIGukgLOu4Jag>
    <xmx:rm8LYX7I5_zX1DqK7PCNqvbfMp_TURXs8FArdfIgIZsvtL1xlMWzxFlrgbc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 00:57:16 -0400 (EDT)
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
Subject: [PATCH v2 1/3] dt-bindings: watchdog: sunxi: Add compatible for R329
Date:   Wed,  4 Aug 2021 23:57:14 -0500
Message-Id: <20210805045716.46141-1-samuel@sholland.org>
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
Changes v1 to v2:
 - Switch from enum to const
 - Add descriptions to "clocks" items

 .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 9aa3c313c49f..8fa5b0d32381 100644
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
@@ -33,7 +34,18 @@ properties:
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
@@ -44,6 +56,24 @@ required:
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

