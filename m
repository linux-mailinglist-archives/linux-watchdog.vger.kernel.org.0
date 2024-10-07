Return-Path: <linux-watchdog+bounces-2102-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5B9924EA
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 08:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894D51F229B5
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 06:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D939917ADF0;
	Mon,  7 Oct 2024 06:34:21 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E381171E43;
	Mon,  7 Oct 2024 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282861; cv=none; b=odq5I6XZxj1t3odh2tvfHqTL9pK/oLYdZsCpto8ZIuV9rvfIlPv6ZUWRdZMBjBWdtlT8pYZQi/epLhVSLvJSI1+jGhJO6ycGZ3AtyteoLWe5dkAqmFZ9AKZZdW97DsaYMw1MhFzdknUldwPMN2dp2UGuk6NQl40PhFy6CWTCQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282861; c=relaxed/simple;
	bh=TAxKm5thu41mN/stAMI28VoEhiFwJfi7JPldqM7J3Ek=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSuXeCnH48yMOUrVG01SkYgRg+ipqCcQ/Y5Zu8PHChcTnC7zWRz8tluZ5C0kZbNrMyNapg5KIduEvOIJqJ3lM2n+bLPPXrPJwcCt5nhbAbiXx97BCyjItOEvUfzGiZgnO4vc/83Riso0tUFra8fMzLRuo3pjtULF0iEDmbYyMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:09 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:09 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 4/4] watchdog: aspeed: Add support for SW restart
Date: Mon, 7 Oct 2024 14:34:08 +0800
Message-ID: <20241007063408.2360874-5-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

WDT reset can be triggered when system hangs or a deliberate
SW restart scenario. Originally, system can only know it is
reset by WDT through a reset flag. However, since AST2600,
a SW reset mechanism is created, SW can trigger the reset
event consciously and directly without wait for WDT timeout.
This function can be achieved by adding "aspeed,restart-sw"
property in dts. After that, an independent reset event flag
will be set after system reset by SW.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 40 ++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 68eaada8a564..eefca972dfa4 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -61,6 +61,7 @@ struct aspeed_wdt {
 	int			idx;
 	u32			ctrl;
 	const struct aspeed_wdt_config *cfg;
+	u32			flags;
 };
 
 static const struct aspeed_wdt_config ast2400_config = {
@@ -130,6 +131,11 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
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
@@ -170,6 +176,9 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_DEFAULT_TIMEOUT	30
 #define WDT_RATE_1MHZ		1000000
 
+/* WDT behavior control flag */
+#define WDT_RESTART_SYSTEM_SW	0x00000001
+
 static struct aspeed_wdt *to_aspeed_wdt(struct watchdog_device *wdd)
 {
 	return container_of(wdd, struct aspeed_wdt, wdd);
@@ -249,11 +258,31 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
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
 
+	if (wdt->flags & WDT_RESTART_SYSTEM_SW) {
+		aspeed_wdt_sw_reset(wdd);
+		return 0;
+	}
+
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
@@ -521,8 +550,11 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
 		if (!ret) {
 			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
-			if (nrstmask > 1)
+			writel(reset_mask[0], wdt->base + WDT_SW_RESET_MASK1);
+			if (nrstmask > 1) {
 				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+				writel(reset_mask[1], wdt->base + WDT_SW_RESET_MASK2);
+			}
 		}
 	}
 
@@ -552,6 +584,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
 	}
 
+	wdt->flags = 0;
+	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt") &&
+	    !of_device_is_compatible(np, "aspeed,ast2500-wdt") &&
+	    of_property_read_bool(np, "aspeed,restart-sw"))
+		wdt->flags |= WDT_RESTART_SYSTEM_SW;
+
 	ret = aspeed_wdt_get_bootstatus(dev, wdt);
 	if (ret)
 		return ret;
-- 
2.34.1


