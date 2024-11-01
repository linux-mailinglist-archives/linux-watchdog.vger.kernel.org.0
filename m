Return-Path: <linux-watchdog+bounces-2403-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFECD9B9106
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 13:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0394283279
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Nov 2024 12:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A121819CC32;
	Fri,  1 Nov 2024 12:12:35 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27019D8B7;
	Fri,  1 Nov 2024 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463155; cv=none; b=kpKNCAiDzBz+Sx4Ts5gcFqedAg9Iep7mE/xAP2yb4DvmfxoAc0Y25MrP7YPfqJCbneXOQ5aU9+beoAWmwV+bGeVNt/8VPu0Cc7fc9QFLXkBfV4qyx8QQTKropKGr/p71FQqEv50gdL88SMr3tAm2yJ6WjGdncad1usDlvzx2IVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463155; c=relaxed/simple;
	bh=zi8NB7cF1zN02ZyOGMwY6cDJEjjoHK+KkCYbzXVAWeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIkJotgbw8tZnyeKsQM9RmNINHOqtGfD8IxVVdScteOyC6X5oWe4FVW+7Iyed6JnrX/u/f1RQD5BLIKin+VqLpQtaecO19zC/zMaIqErY6r1wTM8a1LNbxTDAmoi1/QuoQpIKjU47exqKxY/oRqrc5zUJKv20J5kmSYEAHbAjWI=
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
Subject: [PATCH v4 3/3] watchdog: aspeed: Update restart implementations
Date: Fri, 1 Nov 2024 20:12:01 +0800
Message-ID: <20241101121201.2464091-4-chin-ting_kuo@aspeedtech.com>
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

Restart callback function is created to distinguish the restart mechanisms
between AST2400/AST2500 and AST2600.

On AST2400 and AST2500 platforms, system can only be reset by enabling
WDT and waiting for WDT timeout. Since AST2600, SW can trigger the reset
event consciously and directly by just cinfiguring some HW registers
without waiting for WDT timeout. This mechanism is named "SW restart" and
is implemented by HW. The WDT counter is not enabled when SW restart
is adopted.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 59 +++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 63b5ff9e2751..28a16a0c442d 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -23,6 +23,14 @@ static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+struct aspeed_wdt {
+	struct watchdog_device	wdd;
+	void __iomem		*base;
+	u32			ctrl;
+	const struct aspeed_wdt_data *data;
+};
+
 struct aspeed_wdt_scu {
 	const char *compatible;
 	u32 reset_status_reg;
@@ -36,14 +44,11 @@ struct aspeed_wdt_data {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	int (*restart)(struct aspeed_wdt *wdt);
 };
 
-struct aspeed_wdt {
-	struct watchdog_device	wdd;
-	void __iomem		*base;
-	u32			ctrl;
-	const struct aspeed_wdt_data *data;
-};
+static int aspeed_ast2400_wdt_restart(struct aspeed_wdt *wdt);
+static int aspeed_ast2600_wdt_restart(struct aspeed_wdt *wdt);
 
 static const struct aspeed_wdt_data ast2400_data = {
 	.ext_pulse_width_mask = 0xff,
@@ -56,6 +61,7 @@ static const struct aspeed_wdt_data ast2400_data = {
 		.wdt_sw_reset_mask = 0,
 		.wdt_reset_mask_shift = 1,
 	},
+	.restart = aspeed_ast2400_wdt_restart,
 };
 
 static const struct aspeed_wdt_data ast2500_data = {
@@ -69,6 +75,7 @@ static const struct aspeed_wdt_data ast2500_data = {
 		.wdt_sw_reset_mask = 0,
 		.wdt_reset_mask_shift = 2,
 	},
+	.restart = aspeed_ast2400_wdt_restart,
 };
 
 static const struct aspeed_wdt_data ast2600_data = {
@@ -82,6 +89,7 @@ static const struct aspeed_wdt_data ast2600_data = {
 		.wdt_sw_reset_mask = 0x8,
 		.wdt_reset_mask_shift = 16,
 	},
+	.restart = aspeed_ast2600_wdt_restart,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -112,6 +120,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
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
@@ -231,11 +244,8 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	return 0;
 }
 
-static int aspeed_wdt_restart(struct watchdog_device *wdd,
-			      unsigned long action, void *data)
+static int aspeed_ast2400_wdt_restart(struct aspeed_wdt *wdt)
 {
-	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
-
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
@@ -244,6 +254,35 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int aspeed_ast2600_wdt_restart(struct aspeed_wdt *wdt)
+{
+	u32 reg;
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC |
+		   WDT_CTRL_RESET_SYSTEM;
+
+	reg = readl(wdt->base + WDT_RESET_MASK1);
+	writel(reg, wdt->base + WDT_SW_RESET_MASK1);
+	reg = readl(wdt->base + WDT_RESET_MASK2);
+	writel(reg, wdt->base + WDT_SW_RESET_MASK2);
+
+	writel(ctrl, wdt->base + WDT_CTRL);
+	writel(WDT_SW_RESET_COUNT_CLEAR, wdt->base + WDT_SW_RESET_CTRL);
+	writel(WDT_SW_RESET_ENABLE, wdt->base + WDT_SW_RESET_CTRL);
+
+	/* system must be reset immediately */
+	mdelay(1000);
+
+	return 0;
+}
+
+static int aspeed_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+
+	return wdt->data->restart(wdt);
+}
+
 static int aspeed_wdt_update_bootstatus(struct platform_device *pdev,
 					struct aspeed_wdt *wdt)
 {
-- 
2.34.1


