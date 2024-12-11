Return-Path: <linux-watchdog+bounces-2542-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191789ED4E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 19:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FCA161622
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 18:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1A2210E7;
	Wed, 11 Dec 2024 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbCKWhti"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3A211A14;
	Wed, 11 Dec 2024 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943034; cv=none; b=mh+xQr6OzwmI4vVgo2zD8ZtQPB8wcmcO48H1GjZaLFNW71lkUqL2Xx3zTxjthl0g5uQA3TD/XG82Mw0dwrAXC6FVb5V2zXsjOFf+wUd5dclrDSUt7gXA8m53SBC+7kArJ60GndxB/41m1qYBfIlX7Ojg7UhFNmrl+WfT8vvBbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943034; c=relaxed/simple;
	bh=/K8s7WPnDdLXol43yVCLueKsxhjOHLuHy+1sFvA+UZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDsc3gAdf1fp/9w3EssJJl2KaqT6NNyoNlOxGL63XaAs48wSBGor0T3mGng2Y1InvvbxQ2v+y0dxYW1Hu7A0gBwudfqASEJYSPJDUe3QYJTGbBmtXmT/1muwtIujx3V2FoaAcjS6jndTcky3ab4y84YM4AYTkrw7NRQZw4UgTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbCKWhti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CBAC4CEDD;
	Wed, 11 Dec 2024 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943034;
	bh=/K8s7WPnDdLXol43yVCLueKsxhjOHLuHy+1sFvA+UZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JbCKWhtirvP8DGR8P15BCR0MIGUqFkPz1LA1gOTD8T5Adg18gzHxmELsFneG98O4r
	 NgWL/crv+Gdygqpr0RRxRVabZ6qfuLtw23cY8GFJaNQKPpXEleEHfnsH0Mfpsu/knr
	 8A/j+koTakXqnyrBF5jNTrrMoCF5Oik1rYIVl7N/egLLo464RNlzp0+9CFRqw0Z6wD
	 DWbYn0Yyi3oO8vYKh79RGR6YJlQgZsqnulwin7JI4tYAg8Yjvn52rjcgZk+XTE0Cc9
	 1a7Nbt12z1Qe5QDJ+dQYCGeG59g9BsIHP0tcJerNuH5QWpN1flkqxulGy6z+x2Of9L
	 Nw0i+bH7lSUjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	krzk@kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 03/36] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
Date: Wed, 11 Dec 2024 13:49:19 -0500
Message-ID: <20241211185028.3841047-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit

From: Peter Griffin <peter.griffin@linaro.org>

[ Upstream commit ccfb765944bb66813398958983cb8141e2624a6b ]

This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.

Now that we can register a SoC specific regmap with syscon using
of_syscon_register_regmap() api we can switch back to using
syscon_regmap_lookup_by_phandle() in the client drivers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241029191131.2329414-1-peter.griffin@linaro.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/Kconfig       | 1 +
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 94c96bcfefe34..0b59c669c26d3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae7..349d30462c8c0 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
-#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
-						 "samsung,syscon-phandle");
+		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "PMU regmap lookup failed.\n");
+					     "syscon regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.43.0


