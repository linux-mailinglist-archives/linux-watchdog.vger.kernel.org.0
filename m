Return-Path: <linux-watchdog+bounces-4374-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3ABCC0DD
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 319BA4E6F53
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Oct 2025 08:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA05527EFEE;
	Fri, 10 Oct 2025 08:03:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08E827AC31;
	Fri, 10 Oct 2025 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083406; cv=none; b=thYMi3Gv3sA06fpoWM8UBBqNOhqeJLn804lBw3Az3gq2CxCe5B1UthzJ5V5roz7bpy3t7hg1zEpDGyg7vH8FsD/a+b0tCZ7Dw1TSRIaXgVKkKYfEe4lNaS4XT01udFmFcjpzp0pGtCeN13CYJNADILPnNdzz3MU4szfzcZ3UOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083406; c=relaxed/simple;
	bh=3uQ+hglIqHXJTJg+gQ6Yg+4ETaiQ+eeaaAdy0Jp4ITM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6Ns3o2fXSGHFlhqki4tK9cWfdL5jHnUua0fFkLv9Qgy7If1JBc26QQEGqJABxjZBWTvlwn97RcA6JUyzqwDUJJd6JpsuCc3G7DAq1RSqFJcLoq6kyno0lIs2hG2HrQ65WhLCf3PJKuF142ryjtOwjB857W/y6i7SsLGDkngir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 16:03:16 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 16:03:16 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 3/3] watchdog: aspeed: Add support for AST2700 platform
Date: Fri, 10 Oct 2025 16:03:15 +0800
Message-ID: <20251010080315.816628-4-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add AST2700 platform support to the ASPEED watchdog driver. This includes
a new per-platform configuration with SCU reset status register at
SCU1_070 and support for 5 reset mask registers.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d23e565f30a8..c9e79851504c 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -83,10 +83,24 @@ static const struct aspeed_wdt_config ast2600_config = {
 	.num_reset_masks = 2,
 };
 
+static const struct aspeed_wdt_config ast2700_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 0,
+	.irq_mask = GENMASK(31, 10),
+	.scu = {
+		.compatible = "aspeed,ast2700-scu0",
+		.reset_status_reg = 0x70,
+		.wdt_reset_mask = 0xf,
+		.wdt_reset_mask_shift = 0,
+	},
+	.num_reset_masks = 5,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
 	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
+	{ .compatible = "aspeed,ast2700-wdt", .data = &ast2700_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -483,7 +497,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	}
 
 	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt")) {
-		u32 reset_mask[2];
+		u32 reset_mask[5];
 		size_t nrstmask = wdt->cfg->num_reset_masks;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 		int i;
-- 
2.34.1


