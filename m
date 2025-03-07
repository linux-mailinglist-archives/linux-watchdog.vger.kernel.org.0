Return-Path: <linux-watchdog+bounces-3071-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68CAA55C5F
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 01:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 161651725D3
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 00:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B017B425;
	Fri,  7 Mar 2025 00:57:32 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9016A395;
	Fri,  7 Mar 2025 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309052; cv=none; b=LFtIq5qlSggVK1umz2ZVTgxFfq98DtCNywL92bjDWEpfi/dEWWprVS8vQt/T6NLE24ZMAj8rRFpRmbt0ng6yaxpP3fhvF8tEAIJmztbxrBWJKlfbedqcSljxIRhUqKnSjDyVQR+S2grULuyACFMJrqkWU2vCpAfCw9nY30NQVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309052; c=relaxed/simple;
	bh=XXm9l3nOhtBu8Jy2QAjx5UHw2rmLJpcfj19w9vRNy64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evJDrom6bW8PKchxnxLEvaYsCEl1Q22ed2Ez8shKRX3wKvDmlFisjL2r5c0fg5VeYe8KbR3jD66pDuD3745IzQoAPBBSHRJjXAdphVxZhvKcFFAyVidDylgx0Un/aWrFojS0KZ9I9I+0+KJBARnhfCV/7690moOxrgMwjwom1Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667782103;
	Thu,  6 Mar 2025 16:57:43 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91003F5A1;
	Thu,  6 Mar 2025 16:57:28 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 04/15] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Fri,  7 Mar 2025 00:57:01 +0000
Message-ID: <20250307005712.16828-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC comes with a watchdog very similar to the ones in
the previous Allwinner SoCs, but oddly enough moves the first half of its
registers up by one word. Since we have different offsets for these
registers across the other SoCs as well, this can simply be modelled by
just stating the new offsets in our per-SoC struct.
The rest of the IP is the same as in the D1, although the A523 moves its
watchdog to a separate MMIO frame, so it's not embedded in the timer
anymore. The driver can be ignorant of this, because the DT will take
care of this.

Add a new struct for the A523, specifying the SoC-specific details, and
tie the new DT compatible string to it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a995826..b6c761acc3de6 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -236,10 +236,21 @@ static const struct sunxi_wdt_reg sun20i_wdt_reg = {
 	.wdt_key_val = 0x16aa0000,
 };
 
+static const struct sunxi_wdt_reg sun55i_wdt_reg = {
+	.wdt_ctrl = 0x0c,
+	.wdt_cfg = 0x10,
+	.wdt_mode = 0x14,
+	.wdt_timeout_shift = 4,
+	.wdt_reset_mask = 0x03,
+	.wdt_reset_val = 0x01,
+	.wdt_key_val = 0x16aa0000,
+};
+
 static const struct of_device_id sunxi_wdt_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-wdt", .data = &sun4i_wdt_reg },
 	{ .compatible = "allwinner,sun6i-a31-wdt", .data = &sun6i_wdt_reg },
 	{ .compatible = "allwinner,sun20i-d1-wdt", .data = &sun20i_wdt_reg },
+	{ .compatible = "allwinner,sun55i-a523-wdt", .data = &sun55i_wdt_reg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_wdt_dt_ids);
-- 
2.46.3


