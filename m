Return-Path: <linux-watchdog+bounces-2386-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7759B6077
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2024 11:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA2F28407C
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2024 10:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944761E4908;
	Wed, 30 Oct 2024 10:47:36 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84A1E765C;
	Wed, 30 Oct 2024 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285256; cv=none; b=f6x2WAb2ugEbKCaFOfqmMjh81YtQvWo/KVfv1YyS7Rp4kp1HcSjkUfDvNmkmI8EcEeAK5Y2HOWPDCdLm9uyAR9d2DNz5M0sVqjcLJaO06dluGDEFuN2mJgiwZEfz5HpFV9iSALAVXBJ9c60GDnD2vlNYlloGkqRjiqiXkq+59Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285256; c=relaxed/simple;
	bh=NfdECQjhLdCrDtfug5grGVQRxCB3pq6AgqaEH3NDC6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gh0GXwHeXX0E9t48Qq+FT0F+QJlYkLj6Z+4zIVoC98Al+fm1YtlF+mTlchKmOHjfirdNi2pw4JWrFP9wtHiRcAIcHOPthyAtm4X2IOagz4+APTgR/FnPi7N8p0ieF4KDyfkh1N1uaF6PmEQ2OZRVcG4PAOaKb1j2R6MT7wMIMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 30 Oct
 2024 18:47:18 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 30 Oct 2024 18:47:18 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <bmc-sw@aspeedtech.com>,
	<chnguyen@amperecomputing.com>
Subject: [PATCH v3 2/2] watchdog: aspeed: Add support for SW restart
Date: Wed, 30 Oct 2024 18:47:17 +0800
Message-ID: <20241030104717.168324-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030104717.168324-1-chin-ting_kuo@aspeedtech.com>
References: <20241030104717.168324-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since AST2600, except for HW WDT counter timeout, HW WDT
reset can also be triggered by just cinfiguring some
HW registers by SW directly. We named it "SW restart".
Although it is "SW" restart, its mechanism is implemented
by HW.

Originally, system can only know it is reset by WDT
through a reset flag. However, since AST2600, SW can
trigger the reset event consciously and directly without
wait for WDT timeout. WDT counter is not enabled when
SW restart is adopted. After that, an independent reset
event flag will be set after systemis reset by SW.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index add76be3ee42..1e9808d42023 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -42,6 +42,9 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 
 #define WDT_REG_OFFSET_MASK		0x00000fff
 
+/* WDT behavior control flag */
+#define WDT_RESTART_SYSTEM_SW_SUPPORT	0x00000001
+
 struct aspeed_wdt_scu {
 	const char *compatible;
 	u32 reset_status_reg;
@@ -55,6 +58,7 @@ struct aspeed_wdt_config {
 	u32 irq_shift;
 	u32 irq_mask;
 	u32 reg_size;
+	u32 flags;
 	struct aspeed_wdt_scu scu;
 };
 
@@ -71,6 +75,7 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.irq_shift = 0,
 	.irq_mask = 0,
 	.reg_size = 0x20,
+	.flags = 0,
 	.scu = {
 		.compatible = "aspeed,ast2400-scu",
 		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
@@ -85,6 +90,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
 	.reg_size = 0x20,
+	.flags = 0,
 	.scu = {
 		.compatible = "aspeed,ast2500-scu",
 		.reset_status_reg = AST2400_SCU_SYS_RESET_STATUS,
@@ -99,6 +105,7 @@ static const struct aspeed_wdt_config ast2600_config = {
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
 	.reg_size = 0x40,
+	.flags = WDT_RESTART_SYSTEM_SW_SUPPORT,
 	.scu = {
 		.compatible = "aspeed,ast2600-scu",
 		.reset_status_reg = AST2600_SCU_SYS_RESET_STATUS,
@@ -136,6 +143,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 #define WDT_RESET_MASK1		0x1c
 #define WDT_RESET_MASK2		0x20
+#define WDT_SW_RESET_CTRL	0x24
+#define   WDT_SW_RESET_COUNT_CLEAR	0xDEADDEAD
+#define   WDT_SW_RESET_ENABLE	0xAEEDF123
+#define WDT_SW_RESET_MASK1	0x28
+#define WDT_SW_RESET_MASK2	0x2c
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -255,10 +267,31 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static void aspeed_wdt_sw_reset(struct watchdog_device *wdd)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC |
+		   WDT_CTRL_RESET_SYSTEM;
+
+	writel(ctrl, wdt->base + WDT_CTRL);
+	writel(WDT_SW_RESET_COUNT_CLEAR,
+	       wdt->base + WDT_SW_RESET_CTRL);
+	writel(WDT_SW_RESET_ENABLE, wdt->base + WDT_SW_RESET_CTRL);
+
+	/* system must be reset immediately */
+	mdelay(1000);
+}
+
 static int aspeed_wdt_restart(struct watchdog_device *wdd,
 			      unsigned long action, void *data)
 {
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+	const struct aspeed_wdt_config *cfg = wdt->cfg;
+
+	if (cfg->flags & WDT_RESTART_SYSTEM_SW_SUPPORT) {
+		aspeed_wdt_sw_reset(wdd);
+		return 0;
+	}
 
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
@@ -529,6 +562,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 			if (nrstmask > 1)
 				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
 		}
+
+		if (wdt->cfg->flags & WDT_RESTART_SYSTEM_SW_SUPPORT) {
+			reg = readl(wdt->base + WDT_RESET_MASK1);
+			writel(reg, wdt->base + WDT_SW_RESET_MASK1);
+			reg = readl(wdt->base + WDT_RESET_MASK2);
+			writel(reg, wdt->base + WDT_SW_RESET_MASK2);
+		}
 	}
 
 	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
-- 
2.34.1


