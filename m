Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6673E0D6C
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Aug 2021 06:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236699AbhHEE5f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Aug 2021 00:57:35 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:55131 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230337AbhHEE5f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Aug 2021 00:57:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id D1FDD2B005A5;
        Thu,  5 Aug 2021 00:57:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 05 Aug 2021 00:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=YV06iSB9nV2MJ
        JmuHJMkzbEQjGsfCqURqCAY4uhBcew=; b=UMjKEB1pa7aSJqyGIdMc/zChgKUqd
        rqA9XcJpgVaHoWmUw9s4btlX/btL7jRgHXTvgUGBVu1VMz87gJj3xA5Bs2Jm1SFe
        tvPU5bd2cI1ggxH3aa62HzP9vom2qbX5Ru4nA47ZnZv6BGBJA5pZTXPCBMoHqS8x
        L53D8na4d/Y/PMeG+owHoXO1XCJrIo1CZtPMma85YY3O3gWwtDf9g+Ffjbf47t/Z
        Cii1bQULqrjGbWlWNNLM0axurQmVndFrCfaZHhKG20kEPKfN6gfHM9SjcTL9FH7J
        5jWcMT32IxNECi3QNE0+AfwGc21yBEgRUOPWd2oEDMxQ7iL+qRSAH+12A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=YV06iSB9nV2MJJmuHJMkzbEQjGsfCqURqCAY4uhBcew=; b=Ttms4XVm
        B7WtMfAVfkd2/phkC+eP7bXWAit7FtemYlczu0tKHfONvFEmOjbs/vcYdVXdpMLJ
        C9Y6jtu9Nf+zPelxiRgHkM88PV335y62EhdsYKzIEE70rmLq8Vi7lf/oQsgrtbLf
        SoL2X+kgceUeV17zPRTlXTzgnJ5oY3baNkrExBIogyO2jlfns0oISoRElb+egr17
        LMB1Uzv9NGgwgERhEeYQIUWRcc5HbwrBrIt1TMvTw+MCCRk3Wfe/N2QhIzmo9ZV4
        E1tZ9ix0ZwV5nJFl4g9cBOCRstug/5E0cUMfctKKNc+1+Jl6SGCgkWMm4jRIaAxU
        jW73nNGSMc61Iw==
X-ME-Sender: <xms:sG8LYXC_97pLH1_V2veJoW5m06azQeNwrnYBd7n4E0iQdCP5C9rMmg>
    <xme:sG8LYdg-sRQ12yr6POb91BwLroOlvgLanadE7Yvc2tPgrzGYqLBZNitWKV9LxEqtr
    QVRp3y1hmQv70YVxA>
X-ME-Received: <xmr:sG8LYSkqbkTGjUX6hmB9oDoaGv8y8VT83_TPEvIGnmO1zdAmr_t4aL4kg3tPbIM0ndxw09O1hZzZCwO30qQ1rG5TAFCsXqD859lhORUUgz7jD5kmdG2meqEpIzypP4WFi4w-2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:sG8LYZw1eM0RtAYRbUIFH1uATHJgfG7NWYfTU0iekKkNgHc4IkO4mA>
    <xmx:sG8LYcS_bGxoZZsiLJI0HK6bKChYihZA_buIb1KIPaYrQa_h25C3Hw>
    <xmx:sG8LYcZaLiCetcWg_QTSKpphu3uRGxPB5tvyIuvhwzkSgha-WFkCiQ>
    <xmx:sG8LYQaryCgAJrd7zzPjwm-HJF8yV1n5xd7OFDrA_uMrSTQUn0U-f4toH9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 00:57:19 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Date:   Wed,  4 Aug 2021 23:57:15 -0500
Message-Id: <20210805045716.46141-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805045716.46141-1-samuel@sholland.org>
References: <20210805045716.46141-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 keeps the same register layout and clock sources as the R329, but it
adds a key field which must be set to update the watchdog's "CFG" and
"MODE" registers. Therefore it is not backward-compatible.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes v1 to v2:
 - None.

 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 8fa5b0d32381..6ef5e7caae80 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - const: allwinner,suniv-f1c100s-wdt
           - const: allwinner,sun4i-a10-wdt
+      - const: allwinner,sun20i-d1-wdt
 
   reg:
     maxItems: 1
@@ -61,6 +62,7 @@ if:
     compatible:
       contains:
         enum:
+          - allwinner,sun20i-d1-wdt
           - allwinner,sun50i-r329-wdt
 
 then:
-- 
2.31.1

