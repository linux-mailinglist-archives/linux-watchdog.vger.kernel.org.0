Return-Path: <linux-watchdog+bounces-3429-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBAAAA2FA
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 01:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DA963A8F29
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 May 2025 23:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E4F2EC008;
	Mon,  5 May 2025 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8C+bxxD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5672EC002;
	Mon,  5 May 2025 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483774; cv=none; b=j8Uq7suAmkGanfHKOrU7UBtCqp2gxHNwxGmyGRO3QOZgHm/EKa/n+2Ou3Cjf4wfJQp5atutZbi1BqSTKGm1OU1TRY23zmzoYu94nkQc7wzEDYuHTNpRywuSsy8Yq2UtMuUyZYq5ucv6t1dktt9UCf0GPOi5w3qVssOhNVVRpRdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483774; c=relaxed/simple;
	bh=Y8gOUr/d7B6ukn7cFkOC8T9Tsre9FJWWrtBN+lk4QgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSjinkCbqWbN/FmJ+oyx/xsMnR4dFr0oaolbQl4iiyOOaBe69Xqgr6cTmUNWiYyjBR2zkU5RCRmvwwJ6EPf3sO/tyvI5VIHQtXYrwlGtpUWwKI4bvxjhOjkBeO7AJx/2kkdaaqHqzkwfW2RQJiIvfYx8qsI5AWuQ/AzvNofeEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8C+bxxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B10C4CEE4;
	Mon,  5 May 2025 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483774;
	bh=Y8gOUr/d7B6ukn7cFkOC8T9Tsre9FJWWrtBN+lk4QgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8C+bxxD8va+Agkzxm32fnhGljfLPD5ducAKMQQ6QUzvdr6TOldtxDqoinGb/eKgg
	 OwrKFJCmMJCWBC/HLbZbee9eOlhLrqqtTZtyikZ5JyUw2PbPA08QBPlJGow7Pu24yW
	 UFCStqNVU9B1Aa7QphLrqpqWchJEPRaAIbrCdq2ZIko6EIDX3zInVgWkSFsWk76PEL
	 gCAXHGAe7QgKKDsmGBnssoZ9W7TMUOmxayXqBz6fpCRy9r5TBqtUKR8iytJzyKTjvW
	 TjyAfN8lmdfbt18tQhsujJ8nc5HWqvz900kRKkem536Q1c+07HBt6L8aQ6OhXmcEAD
	 Pvlbz0g/0jOVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 212/642] watchdog: aspeed: Update bootstatus handling
Date: Mon,  5 May 2025 18:07:08 -0400
Message-Id: <20250505221419.2672473-212-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

[ Upstream commit 5c03f9f4d36292150c14ebd90788c4d3273ed9dc ]

The boot status in the watchdog device struct is updated during
controller probe stage. Application layer can get the boot status
through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
The bootstatus can be,
WDIOF_CARDRESET => System is reset due to WDT timeout occurs.
Others          => Other reset events, e.g., power on reset.

On ASPEED platforms, boot status is recorded in the SCU registers.
- AST2400: Only a bit is used to represent system reset triggered by
           any WDT controller.
- AST2500/AST2600: System reset triggered by different WDT controllers
                   can be distinguished by different SCU bits.

Besides, on AST2400 and AST2500, since alternating boot event is
also triggered by using WDT timeout mechanism, it is classified
as WDIOF_CARDRESET.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250113093737.845097-2-chin-ting_kuo@aspeedtech.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/aspeed_wdt.c | 81 ++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8cc..369635b38ca0e 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -11,21 +11,30 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/kstrtox.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+struct aspeed_wdt_scu {
+	const char *compatible;
+	u32 reset_status_reg;
+	u32 wdt_reset_mask;
+	u32 wdt_reset_mask_shift;
+};
 
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	struct aspeed_wdt_scu scu;
 };
 
 struct aspeed_wdt {
@@ -39,18 +48,36 @@ static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
 	.irq_shift = 0,
 	.irq_mask = 0,
+	.scu = {
+		.compatible = "aspeed,ast2400-scu",
+		.reset_status_reg = 0x3c,
+		.wdt_reset_mask = 0x1,
+		.wdt_reset_mask_shift = 1,
+	},
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 12,
 	.irq_mask = GENMASK(31, 12),
+	.scu = {
+		.compatible = "aspeed,ast2500-scu",
+		.reset_status_reg = 0x3c,
+		.wdt_reset_mask = 0x1,
+		.wdt_reset_mask_shift = 2,
+	},
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
 	.ext_pulse_width_mask = 0xfffff,
 	.irq_shift = 0,
 	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2600-scu",
+		.reset_status_reg = 0x74,
+		.wdt_reset_mask = 0xf,
+		.wdt_reset_mask_shift = 16,
+	},
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -213,6 +240,56 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
+					 struct aspeed_wdt *wdt)
+{
+	const struct resource *res;
+	struct aspeed_wdt_scu scu = wdt->cfg->scu;
+	struct regmap *scu_base;
+	u32 reset_mask_width;
+	u32 reset_mask_shift;
+	u32 idx = 0;
+	u32 status;
+	int ret;
+
+	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
+	}
+
+	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
+	if (IS_ERR(scu_base)) {
+		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
+		return;
+	}
+
+	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
+	if (ret) {
+		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
+		return;
+	}
+
+	reset_mask_width = hweight32(scu.wdt_reset_mask);
+	reset_mask_shift = scu.wdt_reset_mask_shift +
+			   reset_mask_width * idx;
+
+	if (status & (scu.wdt_reset_mask << reset_mask_shift))
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	/* clear wdt reset event flag */
+	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
+	    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
+		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
+		if (!ret) {
+			status &= ~(scu.wdt_reset_mask << reset_mask_shift);
+			regmap_write(scu_base, scu.reset_status_reg, status);
+		}
+	} else {
+		regmap_write(scu_base, scu.reset_status_reg,
+			     scu.wdt_reset_mask << reset_mask_shift);
+	}
+}
+
 /* access_cs0 shows if cs0 is accessible, hence the reverted bit */
 static ssize_t access_cs0_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
@@ -458,10 +535,10 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
+	aspeed_wdt_update_bootstatus(pdev, wdt);
+
 	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
 	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
-
 		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
 		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
 			wdt->wdd.groups = bswitch_groups;
-- 
2.39.5


