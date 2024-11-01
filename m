Return-Path: <linux-watchdog+bounces-2402-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CE9B9103
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 13:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0C31F21B82
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 12:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8AE19D891;
	Fri,  1 Nov 2024 12:12:32 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D9319CC27;
	Fri,  1 Nov 2024 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463152; cv=none; b=q0K3fttd5YyXgwpC7o0taUXiM2jnSn1S0RMy5rErhXzt3PGdyrtZ8Za1nfRtZyk0BrLsuHzM7WwKF3rokYXLoJSfk9ZVyZr0eN8DhAKWd8ZomTFzG9hrk5K4GpainmKRfi1AWjzKstmi4vp7Nk2lkURDesvRMwH5i2wLERu06Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463152; c=relaxed/simple;
	bh=yHQyeN3lOKaQ+MpV6agfbg9M3ApVYZeNCKQ7cxllyj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vy+ULr8W/cORRlhg/vOn11YI7gmYkYg6hSUQaYaGJmvV0Qwdx7EW6AWroPq+i5E8R2cb5e9Sdmo8UmrX3T37uKpTf9bw7tdspCiZEfYTCKeWr7Pr8VbGIQ65RQXDyYNandDB767w+hBs9TeToF6qugStaB4EP9x/zLADhCY0KIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 1 Nov
 2024 20:12:02 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 1 Nov 2024 20:12:02 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <bmc-sw@aspeedtech.com>,
	<chnguyen@amperecomputing.com>
Subject: [PATCH v4 2/3] watchdog: aspeed: Change aspeed_wdt_config struct name to aspeed_wdt_data
Date: Fri, 1 Nov 2024 20:12:00 +0800
Message-ID: <20241101121201.2464091-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

aspeed_wdt_config struct is used to store some HW configuration
information. Changing its naming to a more generic one,
aspeed_wdt_data, in order to contain more platform specific
inforamtion or SW callback functions.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 4ad6335ff25b..63b5ff9e2751 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -31,7 +31,7 @@ struct aspeed_wdt_scu {
 	u32 wdt_reset_mask_shift;
 };
 
-struct aspeed_wdt_config {
+struct aspeed_wdt_data {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
@@ -42,10 +42,10 @@ struct aspeed_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*base;
 	u32			ctrl;
-	const struct aspeed_wdt_config *cfg;
+	const struct aspeed_wdt_data *data;
 };
 
-static const struct aspeed_wdt_config ast2400_config = {
+static const struct aspeed_wdt_data ast2400_data = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
@@ -58,7 +58,7 @@ static const struct aspeed_wdt_config ast2400_config = {
 	},
 };
 
-static const struct aspeed_wdt_config ast2500_config = {
+static const struct aspeed_wdt_data ast2500_data = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
@@ -71,7 +71,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 	},
 };
 
-static const struct aspeed_wdt_config ast2600_config = {
+static const struct aspeed_wdt_data ast2600_data = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
@@ -85,9 +85,9 @@ static const struct aspeed_wdt_config ast2600_config = {
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
-	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
-	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
-	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
+	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_data },
+	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_data },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -216,8 +216,8 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 {
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
 	u32 actual = pretimeout * WDT_RATE_1MHZ;
-	u32 s = wdt->cfg->irq_shift;
-	u32 m = wdt->cfg->irq_mask;
+	u32 s = wdt->data->irq_shift;
+	u32 m = wdt->data->irq_mask;
 
 	wdd->pretimeout = pretimeout;
 	wdt->ctrl &= ~m;
@@ -248,7 +248,7 @@ static int aspeed_wdt_update_bootstatus(struct platform_device *pdev,
 					struct aspeed_wdt *wdt)
 {
 	struct resource *res;
-	struct aspeed_wdt_scu scu = wdt->cfg->scu;
+	struct aspeed_wdt_scu scu = wdt->data->scu;
 	struct regmap *scu_base;
 	u32 reset_mask_width;
 	u32 reset_mask_shift;
@@ -401,7 +401,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	ofdid = of_match_node(aspeed_wdt_of_table, np);
 	if (!ofdid)
 		return -EINVAL;
-	wdt->cfg = ofdid->data;
+	wdt->data = ofdid->data;
 
 	wdt->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wdt->base))
@@ -409,7 +409,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.info = &aspeed_wdt_info;
 
-	if (wdt->cfg->irq_mask) {
+	if (wdt->data->irq_mask) {
 		int irq = platform_get_irq_optional(pdev, 0);
 
 		if (irq > 0) {
@@ -485,7 +485,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
-		reg &= wdt->cfg->ext_pulse_width_mask;
+		reg &= wdt->data->ext_pulse_width_mask;
 		if (of_property_read_bool(np, "aspeed,ext-active-high"))
 			reg |= WDT_ACTIVE_HIGH_MAGIC;
 		else
@@ -493,7 +493,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 		writel(reg, wdt->base + WDT_RESET_WIDTH);
 
-		reg &= wdt->cfg->ext_pulse_width_mask;
+		reg &= wdt->data->ext_pulse_width_mask;
 		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
 			reg |= WDT_PUSH_PULL_MAGIC;
 		else
@@ -510,7 +510,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
-		u32 max_duration = wdt->cfg->ext_pulse_width_mask + 1;
+		u32 max_duration = wdt->data->ext_pulse_width_mask + 1;
 
 		if (duration == 0 || duration > max_duration) {
 			dev_err(dev, "Invalid pulse duration: %uus\n",
-- 
2.34.1


