Return-Path: <linux-watchdog+bounces-3044-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038CA4F05B
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 23:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BB21171DDA
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Mar 2025 22:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2B427C868;
	Tue,  4 Mar 2025 22:25:48 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4507627BF99;
	Tue,  4 Mar 2025 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127148; cv=none; b=YIKD1zxLh17RDi8VrHX/lPhNMSdZQlvrQNLLP39hAPYyCZBhQI1T/0ioP+M2BAYb0Y3/HFvGRwoZNA8Mhv9aQgYJp+JzwEh79iwvO4lSZMLcaZmIgpcN2+LQQ8qBGAPSgE9BR3fC/NSQkrgzQpJR1YgE93Z6RHjT2njQgoHWNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127148; c=relaxed/simple;
	bh=XXm9l3nOhtBu8Jy2QAjx5UHw2rmLJpcfj19w9vRNy64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X214GU7lqd1vuL82qO74dC6BFpemzSJoO+B+Cq6P4NSki0zrU82AVxmza0HUAZLnFAMTkX6iiDbe/a5H50U7mT7ZFkf16FW/Te+2WOFSUyMRtklLdIwJaCDPe5IdofxF34Msq2X0cH+O9GQ8vh9Re3yKaeiQFNyu4ZqbKHNGcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC9E1DB5;
	Tue,  4 Mar 2025 14:26:00 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 311973F5A1;
	Tue,  4 Mar 2025 14:25:45 -0800 (PST)
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
Subject: [PATCH v2 04/15] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Tue,  4 Mar 2025 22:22:58 +0000
Message-ID: <20250304222309.29385-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
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


