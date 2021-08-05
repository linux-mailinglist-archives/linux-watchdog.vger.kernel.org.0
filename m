Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC7B3E0D6F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Aug 2021 06:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbhHEE5i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Aug 2021 00:57:38 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:43563 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236808AbhHEE5h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Aug 2021 00:57:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id E14702B005AE;
        Thu,  5 Aug 2021 00:57:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 05 Aug 2021 00:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ihmVq/5E6B8RM
        yKVyGoR6c5bmUO1IuRGAjBHKTOJfhw=; b=U2NV4aUQG9wR4z0XiwQi3HdYxn/+m
        05cgs80oX14V4BQ8UKQowZAA3BNqBfB5272W03NeFYnmyWe+4+B8WRdY1oDetfAd
        sSyC8Sdescx1nANWS9pcPKJjovX8fYsR06J1YYgQ0FMvaeS0uOHfxpC2N2e3xHP4
        jGmx2WWvHAfiQ/V0I8GhGbXF+L5UGWjdPhDnAVRC3fszaVKlnoSTqq+8LO0ythP1
        RP6qWbFwL6boOpYpMyZRhJLXy9OLKTDgBGUJxb0edqvpK0PJQCfW36ZdQCYBiogV
        rGt26zAC062KXuVXzd/njzVmNNG/fn/JbKb6A02QnRuvJ6I/tTA796dDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ihmVq/5E6B8RMyKVyGoR6c5bmUO1IuRGAjBHKTOJfhw=; b=NwiumweV
        sRelxj4vHvK3lYRvYcco9o5tF+vjGQHeBR1Fl23rP9obSJinM8lZjiQ9Ogwn1Stt
        AhbwIbjoO+cn43eIL/aR8UmFyEKVt4Fc+B4MD74rQqOA+8J+TKGi9s57IyKbLdQT
        P+W6BbAg32GiVglqyfG6sQ/R8jHztYj9p/0In2P2L8gv8AcPkvWITBO5swCPtRnd
        1pSz/6A3p/xRAFc3Er52bgnUxZsJ8MifP/hb6dsXGDCgzdzSn8qFixCWLN1wSox0
        Hi5sd9VOaXs3EJ3ObxVhFuFI+fXlccCbdhI8Xl9YCd8P1zbF/ZQ+ULXmbHJemsUU
        JrUAVo1etj6Fcg==
X-ME-Sender: <xms:sm8LYfmol11OBXOWalNw1CcNDQwa9JOVl2uUEHPqGtgfccV366UXbA>
    <xme:sm8LYS3E5BaJMlgkrvWDI1zWD_-XTIbjKPMlzeb9SAjcFjSCNUVSa8zJ9wLEq3RDF
    pdf4JJFFWu6-7kOEA>
X-ME-Received: <xmr:sm8LYVpNhB5z7K3PEmmcyrsjIj0q_Vxya3az7YwSI83qD1aJRD69oWJFkq2l0lZkJlUM8Bym6BeQ6xOi1s3osDr6x0n306ldYux5ICEWo7mNwjSJ2OReWxCuZXAd1X7GJCyesA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:sm8LYXk3r3sx7OXNj8i8uTZOzFnnqAoBnW4_GpzsnWIEm_0jZCRbiA>
    <xmx:sm8LYd0YQWOiUVxfliI8jxlYjtdzxmLpje4KOmgQZgc1F2_tCiuMFw>
    <xmx:sm8LYWvAsNFl7Cn9FNGrDca5drT4sxA3BQwgxBXBZYlE4cHRxcKmWQ>
    <xmx:sm8LYWucQ2r_683M7atFVlYPervBE4l3zsJY6MtxYQtSCEXRM5wNhfdWGFI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 00:57:21 -0400 (EDT)
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
Subject: [PATCH v2 3/3] watchdog: sunxi_wdt: Add support for D1
Date:   Wed,  4 Aug 2021 23:57:16 -0500
Message-Id: <20210805045716.46141-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805045716.46141-1-samuel@sholland.org>
References: <20210805045716.46141-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 adds a key field to the "CFG" and "MODE" registers, that must be set
to change the other bits. Add logic to set the key when updating those
registers.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes v1 to v2:
 - None.

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

