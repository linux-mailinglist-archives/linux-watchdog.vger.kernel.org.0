Return-Path: <linux-watchdog+bounces-3428-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F3AAA2ED
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 01:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8ED217ABDC
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 May 2025 23:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49745288C38;
	Mon,  5 May 2025 22:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOCe2L3u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D04A288C00;
	Mon,  5 May 2025 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483773; cv=none; b=WQdVYJzsuwGpXUeBvi6jb11GXAbNsWU3g5tVtbZ166lbcsDSdE+oTP21rLf6nGH8kNcWt7Bsm7Jh6XYZpXdHMyYJrqenxBiuMyT7LttyfvA5OL1EpohEuvRZLPpiaY6aWZ7S7Armr/jVI8wee1X4a0nx28fec+ma48lFfoKlcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483773; c=relaxed/simple;
	bh=HKCS9/n2oZ0o3HcAQg9M4XIEx6PW+6r9txE6aEEV5Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j2aamvf6bW6iE3zHe0XuNApJ2MMdJECcXfStkHeEJ5mHy1A6gfwHA/QNJMy30eaTtqDip5h2cM69x3jiVDQKnoMFSBzEYqyQFZBgIQ4GSn7me9ClveLk5cYbiMN8wA/WcMY0okyTdSqJKbywV/FK5sbkLRaAz0SBY841VCc5kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOCe2L3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB9C4CEEE;
	Mon,  5 May 2025 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483772;
	bh=HKCS9/n2oZ0o3HcAQg9M4XIEx6PW+6r9txE6aEEV5Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOCe2L3uLr/WWdKSIaMnxeye5XNDyUj2nyLCJpxCQO+x8LMu78SnVnoRFm+8bMXpE
	 Tcy4TznzdMWb7qbIqNIVkFPniiMOyK12Gj8E0FLyoxHbhQrgcdgrz2qtZhHiX4L3BT
	 +jIuWQYgGDQDOHe2sYn4ojD3vmvZIldA8KyUf5OYII+mDqCIeZMaLzaeA9YMK1ap/L
	 4HesI+CfQcFBv8YLoOUZiLIJ8lnpXU6rO3eiiJxHPTeBo1BaqXZRMK/PyiDtJ4IllV
	 eN9uxjhd9XP/wrLfETjMLqIPs9XPWEN4w0iE16nTjB5rPvCxqvDEVwkTkENtPrtdIJ
	 +h/ll52C6VWLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kyunghwan Seo <khwan.seo@samsung.com>,
	Sangwook Shin <sw617.shin@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 211/642] watchdog: s3c2410_wdt: Fix PMU register bits for ExynosAutoV920 SoC
Date: Mon,  5 May 2025 18:07:07 -0400
Message-Id: <20250505221419.2672473-211-sashal@kernel.org>
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

From: Kyunghwan Seo <khwan.seo@samsung.com>

[ Upstream commit 480ee8a260e6f87cbcdaff77ac2cbf6dc03f0f4f ]

Fix the PMU register bits for the ExynosAutoV920 SoC.
This SoC has different bit information compared to its previous
version, ExynosAutoV9, and we have made the necessary adjustments.

rst_stat_bit:
    - ExynosAutoV920 cl0 : 0
    - ExynosAutoV920 cl1 : 1

cnt_en_bit:
    - ExynosAutoV920 cl0 : 8
    - ExynosAutoV920 cl1 : 8

Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250213004104.3881711-1-sw617.shin@samsung.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 30450e99e5e9d..bdd81d8074b24 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -72,6 +72,8 @@
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
+#define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT	0
+#define EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT	1
 
 #define GS_CLUSTER0_NONCPU_OUT			0x1220
 #define GS_CLUSTER1_NONCPU_OUT			0x1420
@@ -312,9 +314,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
@@ -325,9 +327,9 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.mask_bit = 2,
 	.mask_reset_inv = true,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
-	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.rst_stat_bit = EXYNOSAUTOV920_CLUSTER1_WDTRESET_BIT,
 	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
-	.cnt_en_bit = 7,
+	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
 		  QUIRK_HAS_DBGACK_BIT,
-- 
2.39.5


