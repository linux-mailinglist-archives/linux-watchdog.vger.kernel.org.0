Return-Path: <linux-watchdog+bounces-4340-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD4BC0C3D
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 10:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07BE74F68D5
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 08:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90302D7DF5;
	Tue,  7 Oct 2025 08:42:06 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F022D7DC7;
	Tue,  7 Oct 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826526; cv=none; b=uW2Mog+TXUmyWttCj1aTKt+Yt4lDJrvFZCvSouHLe3VWXjML7hF3D/AmdpNB6VwmEACoKIhvS8LaCTBIb1KQcyrw2XaYGTNNQ9mpE6gYcI6Phol3qvljOt3xzDhW45y1UsQqTPDNWoniTfyzRcq1OPx8dqfwxzzDwM+GUkjCo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826526; c=relaxed/simple;
	bh=AlJN4vbetem3VevT5aGP7hBo/ET4GKo7WkMJPmKBBXA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbsrsMKLJVJJLTZjfG/GjUzzAr14lxzINXiFwP003lut6IBnSQy89kXprHc/OvwSvSxE6In8W1r3Lg/dNxYt+8A7j4TwIIrLPSrmf8ApqiNmg6IdqaBrHEjWkr8alqcn6fT88Au+44DvFFKYKMYKveqRU8V42vPK2y1FJI0pBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 7 Oct
 2025 16:36:50 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 7 Oct 2025 16:36:50 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH 2/3] watchdog: aspeed: Support variable number of reset mask registers
Date: Tue, 7 Oct 2025 16:36:49 +0800
Message-ID: <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Starting from the AST2600 platform, the SoC design has become more
complex, with an increased number of reset mask registers.
To support this, introduce a new field 'num_reset_masks' in the
'aspeed_wdt_config' structure to specify the number of reset mask
registers per platform. This change removes the need for hardcoded
platform-specific logic and improves scalability for future SoCs.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 837e15701c0e..e15f70c5e416 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -35,6 +35,7 @@ struct aspeed_wdt_config {
 	u32 irq_shift;
 	u32 irq_mask;
 	struct aspeed_wdt_scu scu;
+	u32 num_reset_masks;
 };
 
 struct aspeed_wdt {
@@ -54,6 +55,7 @@ static const struct aspeed_wdt_config ast2400_config = {
 		.wdt_reset_mask = 0x1,
 		.wdt_reset_mask_shift = 1,
 	},
+	.num_reset_masks = 1,
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
@@ -66,6 +68,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 		.wdt_reset_mask = 0x1,
 		.wdt_reset_mask_shift = 2,
 	},
+	.num_reset_masks = 1,
 };
 
 static const struct aspeed_wdt_config ast2600_config = {
@@ -78,6 +81,7 @@ static const struct aspeed_wdt_config ast2600_config = {
 		.wdt_reset_mask = 0xf,
 		.wdt_reset_mask_shift = 16,
 	},
+	.num_reset_masks = 2,
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
@@ -482,8 +486,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
 		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reset_mask[2];
-		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
+		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
+		int i;
 
 		reg &= wdt->cfg->ext_pulse_width_mask;
 		if (of_property_read_bool(np, "aspeed,ext-active-high"))
@@ -503,9 +508,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
 		if (!ret) {
-			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
-			if (nrstmask > 1)
-				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+			for (i = 0; i < nrstmask; i++)
+				writel(reset_mask[i], wdt->base + WDT_RESET_MASK1 + i * 4);
 		}
 	}
 
-- 
2.34.1


