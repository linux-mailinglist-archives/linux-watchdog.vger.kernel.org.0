Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F823D51C4
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 05:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhGZDLf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 23:11:35 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41971 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhGZDLT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 23:11:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 096CE58045A;
        Sun, 25 Jul 2021 23:51:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 25 Jul 2021 23:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=k3FFcPhqCAND3
        XKLb3s8dDhV8GC8RamGsODpXFVE8Dw=; b=pTX19j08oUdGotxPXYgxd6Cs+HKU8
        QZYwEWdvHt8umRXgHCc+6sptWlNbjwsSMSN1qhnsFCumHFt6HYPptJOAtoL4dm85
        TPqb5X0tH1Kca4Gb542/caL79Q8AJ1xkQSe6SghSCQOyE5t1QhaWiO0Ay9ZMxonp
        BIi/Cx1gdfCPBQs21VBA9NCYNgpjt/5m1aSpF4E0dTgfX9M/+hI5CC9Zp92Ugncx
        9407m74pCd1Wiu+WoXm1wkCcRbxiiMbyRJKicAXwenff/N/JTQAwKCE3KB+PxUwE
        jTvH8OMGn0lylqEDYJFOmSxneBD3/XONXeKkYZo5/RqkE5ToYT6JfltjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=k3FFcPhqCAND3XKLb3s8dDhV8GC8RamGsODpXFVE8Dw=; b=GPFr+3QV
        lSoyrNsxZx4LUJaVv3rW76DWfSJZ4NB/JdQgaQAHIJUXnEiKIR9nlD8aBlQfZYSH
        3eKNCeCOycsxHISOyd4WdjLwOOCiR6FOejfdgxlXtcOUMW93G1K+KN5PHM2JlFJJ
        iHDSyNsy+T/XXePGO54B01f2zVzGC0P2iLWOVqhCcNIqX8cczfgVUOAdh3PdEtwA
        zzzFCvYYoBNPq63Sq9AC6X9pPQp+nXJnXQN6xNdDl6OuLJqeQy0bZF6gqXkHuy/v
        AJIRQBokF4S4WrUfHGnWtamuhHZ0++oq6ja/JrSJbeid9Av7PK4GFdT99ffnxfNo
        QfTi8ddunBQnug==
X-ME-Sender: <xms:UzH-YNAjxr-U7A4aTWIH6NMpfea2p70FDq9G6S_64ImiZMjVBMYPRw>
    <xme:UzH-YLg7QFcuRhQvfdDuDSW9bZAgVYre3cf2Drn8J_P6FQYjPLiha9znLMaioCt81
    Fheaj3LUFaoexs6wA>
X-ME-Received: <xmr:UzH-YIkVAXHYZwgw5Dm65n3iDLIW7R0fhWFIm-Rc7wsfiSrTVZ5eEFXRO5JhCfTlUHZDVtnTLU19Y7dI7QxPTCKZXJmOFwod-dF3T1oy-zMJLgcj4EcC9C22HInxQfRkpU8p2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UzH-YHyt_gOq8FOaxLpXkphqF6hiaUM80VhtdC5ZOtO2GWRiffEv-A>
    <xmx:UzH-YCQK4TXlrFoZqJg9v-w1fQNcVJl55Z4vn7kbisAOPZUjAa-vYg>
    <xmx:UzH-YKZFBDIIOyh14nhnPTowsUW4QHAwlZNP67aU97UPD73W8l2_DA>
    <xmx:VDH-YHJt7hgUdqKH8iLZS3e-vsgqzV5rMSIjIPo6OFWRiq1wj3w5Rg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jul 2021 23:51:47 -0400 (EDT)
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
Subject: [PATCH 3/3] watchdog: sunxi_wdt: Add support for D1
Date:   Sun, 25 Jul 2021 22:51:43 -0500
Message-Id: <20210726035143.53132-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726035143.53132-1-samuel@sholland.org>
References: <20210726035143.53132-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 adds a key field to the "CFG" and "MODE" registers, that must be set
to change the other bits. Add logic to set the key when updating those
registers.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b50757882a98..6cf82922d3fb 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -48,6 +48,7 @@ struct sunxi_wdt_reg {
 	u8 wdt_timeout_shift;
 	u8 wdt_reset_mask;
 	u8 wdt_reset_val;
+	u32 wdt_key_val;
 };
 
 struct sunxi_wdt_dev {
@@ -91,12 +92,14 @@ static int sunxi_wdt_restart(struct watchdog_device *wdt_dev,
 	val = readl(wdt_base + regs->wdt_cfg);
 	val &= ~(regs->wdt_reset_mask);
 	val |= regs->wdt_reset_val;
+	val |= regs->wdt_key_val;
 	writel(val, wdt_base + regs->wdt_cfg);
 
 	/* Set lowest timeout and enable watchdog */
 	val = readl(wdt_base + regs->wdt_mode);
 	val &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
 	val |= WDT_MODE_EN;
+	val |= regs->wdt_key_val;
 	writel(val, wdt_base + regs->wdt_mode);
 
 	/*
@@ -109,6 +112,7 @@ static int sunxi_wdt_restart(struct watchdog_device *wdt_dev,
 		mdelay(5);
 		val = readl(wdt_base + regs->wdt_mode);
 		val |= WDT_MODE_EN;
+		val |= regs->wdt_key_val;
 		writel(val, wdt_base + regs->wdt_mode);
 	}
 	return 0;
@@ -141,6 +145,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	reg = readl(wdt_base + regs->wdt_mode);
 	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
 	reg |= wdt_timeout_map[timeout] << regs->wdt_timeout_shift;
+	reg |= regs->wdt_key_val;
 	writel(reg, wdt_base + regs->wdt_mode);
 
 	sunxi_wdt_ping(wdt_dev);
@@ -154,7 +159,7 @@ static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
 	void __iomem *wdt_base = sunxi_wdt->wdt_base;
 	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
 
-	writel(0, wdt_base + regs->wdt_mode);
+	writel(regs->wdt_key_val, wdt_base + regs->wdt_mode);
 
 	return 0;
 }
@@ -176,11 +181,13 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	reg = readl(wdt_base + regs->wdt_cfg);
 	reg &= ~(regs->wdt_reset_mask);
 	reg |= regs->wdt_reset_val;
+	reg |= regs->wdt_key_val;
 	writel(reg, wdt_base + regs->wdt_cfg);
 
 	/* Enable watchdog */
 	reg = readl(wdt_base + regs->wdt_mode);
 	reg |= WDT_MODE_EN;
+	reg |= regs->wdt_key_val;
 	writel(reg, wdt_base + regs->wdt_mode);
 
 	return 0;
@@ -220,9 +227,20 @@ static const struct sunxi_wdt_reg sun6i_wdt_reg = {
 	.wdt_reset_val = 0x01,
 };
 
+static const struct sunxi_wdt_reg sun20i_wdt_reg = {
+	.wdt_ctrl = 0x10,
+	.wdt_cfg = 0x14,
+	.wdt_mode = 0x18,
+	.wdt_timeout_shift = 4,
+	.wdt_reset_mask = 0x03,
+	.wdt_reset_val = 0x01,
+	.wdt_key_val = 0x16aa0000,
+};
+
 static const struct of_device_id sunxi_wdt_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-wdt", .data = &sun4i_wdt_reg },
 	{ .compatible = "allwinner,sun6i-a31-wdt", .data = &sun6i_wdt_reg },
+	{ .compatible = "allwinner,sun20i-d1-wdt", .data = &sun20i_wdt_reg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_wdt_dt_ids);
-- 
2.31.1

