Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228073D51C3
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 05:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhGZDLT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 23:11:19 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56309 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231597AbhGZDLS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 23:11:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 662D9580459;
        Sun, 25 Jul 2021 23:51:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 25 Jul 2021 23:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=dL2RNdEFfB0CS
        xPuX7MdY2R8OOMX4hoFvSZkqBvBGH0=; b=oOtd0tfigbM00v0lFNv9Ni04KgC5H
        qMpvXFCm9AWFOWVv+WJUxZ8JVa7JBi5dRdPlH4OAsXPgOWP/uayt4v13h+XwPRSE
        oQG8q6rvZSXP4R8Oi4w6N7mwGJ2U144Be3UIubs6xQc9lsANgflOMQd1xfkNbLXi
        VFM/9itGDD9MoHnWUUafI4Tg5uNZ0RcM2DIskAkWkXGILHoiLw5oo5FKh2j+Fz46
        9H4jBmQLn5bQIxaDLPOo5WogMSvZsznMN3uUzCZbEfRpBNJVbp2c5vq55N/QozH7
        ctNwseBzR6kHtZQBB731IqTKZX20CNyAAokXxua5OJIYVz6/XQVBYXtkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dL2RNdEFfB0CSxPuX7MdY2R8OOMX4hoFvSZkqBvBGH0=; b=TSobTx6f
        IsRz3GnbZjS7lnSso4qnZpwq6ceixRzioqO8D8C4mrVVK5QdM7jjSDZw4yt3didM
        f7c8GKCsiV6noT7GeyOhzY+SsIDaPEEIgQevvA7Xi4wjvRNlVDkC5I7+kkRtXhad
        4LrXB0LVaYs7r3dswRepeY16avIrZ9fVlly06OLaCRVifk+RZLE//nwPlQGT+gXQ
        Pa/cOZBeNwF9V8Wb/qkNWVvof3jeIS6EeiDvjsf3E0YvK0FHihZ3Vse5irfdRdcT
        kz5d7nAn9MUJ+pdN6lraB41+d/8/rKJDbpD9epF9SLKt9eyChcxJVdikAfGdHDk4
        OBJJwEvbres9eA==
X-ME-Sender: <xms:UzH-YHSaAicnoowQBZRuCu1uMHsg1n5jnu7IaJ1qpdv_xOHq6zTH1A>
    <xme:UzH-YIwXxjWe4rNYB6N8awOoOB1mjgPwy99Yt24UdPgON0Xsdpy6kYWJsV_5By0ID
    7X9_zMMPCL4cGd8Kw>
X-ME-Received: <xmr:UzH-YM0m8PJSnHEyQ1Yu-KjeBl-N616WdQGuCWMd-fv05HnThZAORIpxOWN61yQF1wIcTBon02Vxwp-oL32ijPw2UaRBli5IsXvHP592jfX8gU22hHgAg2_3bLtuVdw5dtARfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UzH-YHAf_AI9vvjHJTgMvTrgYtbDeMJd_QJ2T8L5GarI8y-ajfmxZA>
    <xmx:UzH-YAjHGyED9O2516BB3T8VtwSDkr7dwkkBj-hBkNEbP11md6NDOg>
    <xmx:UzH-YLqK6_kv_LEJVj2S5fuAK8aGU6i790LaloDLSztDzkMD-80Lew>
    <xmx:UzH-YFYrol8m-E6ngxRvARC5ADmU_41LEyC2d3UcFQdHLKQMKWDmAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jul 2021 23:51:46 -0400 (EDT)
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
Subject: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Date:   Sun, 25 Jul 2021 22:51:42 -0500
Message-Id: <20210726035143.53132-2-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726035143.53132-1-samuel@sholland.org>
References: <20210726035143.53132-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 keeps the same register layout and clock sources as the R329, but it
adds a key field which must be set to update the watchdog's "CFG" and
"MODE" registers. Therefore it is not backward-compatible.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 853ceb1b7c0f..756e6ab99860 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - const: allwinner,suniv-f1c100s-wdt
           - const: allwinner,sun4i-a10-wdt
+      - const: allwinner,sun20i-d1-wdt
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ if:
     compatible:
       contains:
         enum:
+          - allwinner,sun20i-d1-wdt
           - allwinner,sun50i-r329-wdt
 
 then:
-- 
2.31.1

