Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9193FF77F
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 00:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347928AbhIBW7G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 18:59:06 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59783 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347910AbhIBW7B (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 18:59:01 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id E588E2B00064;
        Thu,  2 Sep 2021 18:58:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 02 Sep 2021 18:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Oocke8CZ0kvLT
        FsB0Q85KKDDx8217sCb9d51vFR2vkY=; b=I5acwfx1l+32q3vy3WK3tx5UQK1pn
        x2x0f0Eki0OxqKskyOO8OiI+2wxcfS0xNQQ49MfOL7sCFEuBZ0BT+URKSZIlrbwQ
        1lyT9G9DNrdLI8tzgc3AXI+IVeB71VZtTsYxuYlkgfKIZWI0hXGqS44RfS6PGpD5
        /oHBkiXCMT4WmEuBauQADYgQVKMSJ2bi/acGWPhbuoy3/vMXM0X/UVopr0dxiReM
        macGsnfv+G45wm8q6LYpv0mv4eT9+NeZQQJLI8sRUSoQZvV0RPOk5mSlbxzUu9yC
        T6k7bEMk+CEE3DKLDUcvaHdFYe+6q2C2Nq+0YoNbJc9ccmiaHac9Bn4eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Oocke8CZ0kvLTFsB0Q85KKDDx8217sCb9d51vFR2vkY=; b=odXaqz64
        Mtt8Gx1AaJ7ZY2erKOlbJdmYozgxR2Ia3z3oN5pyx/cPXIvIy3wSE2zItfkdB+y6
        zSY/sf5B0ADNh0DVh9M6/enH4ALtHeX0Lwypoo8MOB64RLDvflwe0iF6f8fs5YfD
        HFPUKJ0n0gg2cGSOfCoJGhGaQXrI2zIlIiAX8X/7vNeM7nfnZkcnAEzJ9OuFwLea
        xMcWF/VdDk6IL8wQvYvuYorh1yYVXTmSVr9pIYqLSwxRzuF1aWbYaK/p4w7vUnQW
        iGyrof/0qN4O9d0CVGb/+9xKKlhZw9q2nIouX1Kw/EpiJ4ksYEW47hF3TOFpWKoh
        +PGy0tjrz0oRiw==
X-ME-Sender: <xms:-FYxYRzTDHQJYI8AU7MsIv3jna8fvPbkMjhXnA-RxDORzRxfAgJcqA>
    <xme:-FYxYRQn5xwOUnkh4_aPm6q-WZBJkTIxeC4RHmEj8KS81LC3Y7PSqGRCj3h8LRBll
    V-LUxIF3DTtmkQIJg>
X-ME-Received: <xmr:-FYxYbXzV1GRKDMGuSMPQLxKH3D8OtP3I9Y-k_curIn55GJ3llMimY13w--i9G6h7bgAUj45mo5rQg4Y98N9uMQ-X89rjwv63HD1wecYNrCOETx-WJygN1721WBFCqc9290YVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
    gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:-FYxYTjOJo3u0cXky6b3yuQSJAEF43842TWCp_fdvW4qNbPRYmMboA>
    <xmx:-FYxYTDir94VJXQTUoRDLDOup8PFA5xZW8XW06RALFdzyqdAyjPfpA>
    <xmx:-FYxYcIKQXsXgfyK2cxV7NzD1ODWl-xAh5ZQU08uhVu0L7sfvkiJ7Q>
    <xmx:-VYxYX46PngWTbwTzZUo__lKV7HQyRqsAzWTY3SZk1lJL_lQ8izL7G-CI0c>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 18:58:00 -0400 (EDT)
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
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 3/3] watchdog: sunxi_wdt: Add support for D1
Date:   Thu,  2 Sep 2021 17:57:50 -0500
Message-Id: <20210902225750.29313-4-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902225750.29313-1-samuel@sholland.org>
References: <20210902225750.29313-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

D1 adds a key field to the "CFG" and "MODE" registers, that must be set
to change the other bits. Add logic to set the key when updating those
registers.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
Changes v2 to v3:
 - None
Changes v1 to v2:
 - None

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

