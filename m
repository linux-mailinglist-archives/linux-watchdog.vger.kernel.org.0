Return-Path: <linux-watchdog+bounces-3968-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C25B1B42C
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 15:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711E1182A91
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA97274B4B;
	Tue,  5 Aug 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efIMo+c9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C5274670;
	Tue,  5 Aug 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399413; cv=none; b=jsBLc/D0Ad9PkxsogN84eyFBRKa6T9p0QKAxB69A0nOAJ/ytmRRpyWQ8fHB/42f9C/HgQXFUl/SGPrH0BCukZuqnxjuUr8K+kAE4Pmhf2lJm65QfnOja1hPyr0EuN+KbucM8LC7/an3PSY2+KBjzjvWfLNGJrENiFM8wMDgouqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399413; c=relaxed/simple;
	bh=aQXMZfH1wHhsd/+r/zee2+k5gSW1co6Nvqj5usvcqHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZzmDC0d7thJNo1tnTEGBqQ9E8RzrJ2WGcsCkvClFoEkIHJnOB3d+28EdX/YdJyHs/Cg4pyTwDYONOgMkIEziS+w2fn4HUen8mK9F0No7vHg5+xtXjFEDhUTGLRxnNtFnHoI0ndCxPecH0C440ktPthlAT1qYRXo5OBS37muzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efIMo+c9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FB6C4CEF0;
	Tue,  5 Aug 2025 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399413;
	bh=aQXMZfH1wHhsd/+r/zee2+k5gSW1co6Nvqj5usvcqHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efIMo+c9uLUkiCmltyMl4M4bWY6qPrjjNM89Lux4HqzJEAlgQ+zn90po1SDlp+ULB
	 vNURRLS/nFD4Aih/0G+5e+Gu5znOznlmR7xJnFKRqFxXOOjV1w8muY4c5pEHiJ1/v/
	 oZZiEw8FkfwrygAElQ9zej/KL647GCUNe/CjQUK3t4FSSrsLCbc2ppadyQScA5o6CW
	 wngA/JEMRYQo7zpEkmomOjoIhbX2OWZbaZLsEJbpgZuxS5L3WVGLFEx5TbpqCPioas
	 c5YDIuQQvUB9V/qdY5b0NOVcBrJSa7SihZ2Yepc/x/ahVlajI+ErBQnKNwYjMnj8SF
	 GIaBZyXr8deBg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Aaron Plattner <aplattner@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.15] watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
Date: Tue,  5 Aug 2025 09:08:47 -0400
Message-Id: <20250805130945.471732-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Aaron Plattner <aplattner@nvidia.com>

[ Upstream commit 48defdf6b083f74a44e1f742db284960d3444aec ]

The MediaTek implementation of the sbsa_gwdt watchdog has a race
condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
the hardware is processing a timeout refresh that asserts WS0.

Detect this based on the hardware implementer and adjust
wdd->min_hw_heartbeat_ms to avoid the race by forcing the keepalive ping
to be one second later.

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
Acked-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250721230640.2244915-1-aplattner@nvidia.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Nature of the Fix

This is a **hardware-specific bug fix** that addresses a race condition
in MediaTek's implementation of the SBSA generic watchdog. The race
occurs when a watchdog keepalive ping (`writel(0, gwdt->refresh_base +
SBSA_GWDT_WRR)`) happens simultaneously with the hardware asserting the
WS0 timeout signal. In affected hardware, this write is silently
ignored, potentially leading to unexpected system resets.

## Key Code Changes Analysis

1. **Hardware Detection** (lines 78-79, 217-219):
   - Adds `SBSA_GWDT_IMPL_MEDIATEK` constant (0x426) to identify
     MediaTek hardware
   - Reads hardware implementer ID from `SBSA_GWDT_W_IIDR` register
   - Sets `need_ws0_race_workaround` flag only for MediaTek
     implementations when `action=0`

2. **Workaround Implementation** (lines 171-191):
   - Adjusts `wdd->min_hw_heartbeat_ms` to `timeout * 500 + 1000`
   - This forces keepalive pings to occur 1 second after the WOR timeout
   - Avoids the exact moment when WS0 is being asserted

3. **Minimum Timeout Adjustment** (lines 337-343):
   - Sets minimum timeout to 3 seconds for affected hardware
   - Ensures WOR is set to 1.5 seconds with heartbeats every 2.5 seconds

## Why This Qualifies for Stable Backport

1. **Fixes a Real Bug**: Addresses a hardware race condition that can
   cause **unexpected system resets** - a critical reliability issue in
   production systems.

2. **Limited Scope**:
   - Only affects MediaTek SBSA watchdog implementations
   - Workaround is conditionally applied based on hardware detection
   - No impact on other implementations

3. **Minimal Risk**:
   - Changes are confined to timing adjustments
   - No architectural changes or new features
   - Preserves existing behavior for all non-MediaTek hardware

4. **Clear Hardware Issue**: The commit message explicitly describes the
   race condition where "a write to SBSA_GWDT_WRR is ignored if it
   occurs while the hardware is processing a timeout refresh that
   asserts WS0."

5. **Production Impact**: Without this fix, systems with MediaTek SBSA
   watchdog can experience spurious reboots when the race condition is
   triggered, affecting system availability.

6. **Follows Stable Rules**:
   - Fixes an actual bug (not adding features)
   - Small, contained change (~50 lines)
   - Already reviewed by subsystem maintainers
   - Hardware-specific fix with clear problem/solution

## Comparison with Similar Commits

Looking at recent watchdog commits that were backported:
- `c6e89348fd58`: Fixed incorrect timeout calculations - backported with
  Cc: stable
- `041fdbe73de9`: Fixed timeout programming limits - backported to
  stable

This commit follows the same pattern of fixing hardware-specific bugs
that affect system reliability.

The fix is essential for MediaTek-based systems using SBSA watchdog to
prevent unexpected reboots caused by the hardware race condition.

 drivers/watchdog/sbsa_gwdt.c | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 5f23913ce3b4..6ce1bfb39064 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -75,11 +75,17 @@
 #define SBSA_GWDT_VERSION_MASK  0xF
 #define SBSA_GWDT_VERSION_SHIFT 16
 
+#define SBSA_GWDT_IMPL_MASK	0x7FF
+#define SBSA_GWDT_IMPL_SHIFT	0
+#define SBSA_GWDT_IMPL_MEDIATEK	0x426
+
 /**
  * struct sbsa_gwdt - Internal representation of the SBSA GWDT
  * @wdd:		kernel watchdog_device structure
  * @clk:		store the System Counter clock frequency, in Hz.
  * @version:            store the architecture version
+ * @need_ws0_race_workaround:
+ *			indicate whether to adjust wdd->timeout to avoid a race with WS0
  * @refresh_base:	Virtual address of the watchdog refresh frame
  * @control_base:	Virtual address of the watchdog control frame
  */
@@ -87,6 +93,7 @@ struct sbsa_gwdt {
 	struct watchdog_device	wdd;
 	u32			clk;
 	int			version;
+	bool			need_ws0_race_workaround;
 	void __iomem		*refresh_base;
 	void __iomem		*control_base;
 };
@@ -161,6 +168,31 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
 		 */
 		sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
 
+	/*
+	 * Some watchdog hardware has a race condition where it will ignore
+	 * sbsa_gwdt_keepalive() if it is called at the exact moment that a
+	 * timeout occurs and WS0 is being asserted. Unfortunately, the default
+	 * behavior of the watchdog core is very likely to trigger this race
+	 * when action=0 because it programs WOR to be half of the desired
+	 * timeout, and watchdog_next_keepalive() chooses the exact same time to
+	 * send keepalive pings.
+	 *
+	 * This triggers a race where sbsa_gwdt_keepalive() can be called right
+	 * as WS0 is being asserted, and affected hardware will ignore that
+	 * write and continue to assert WS0. After another (timeout / 2)
+	 * seconds, the same race happens again. If the driver wins then the
+	 * explicit refresh will reset WS0 to false but if the hardware wins,
+	 * then WS1 is asserted and the system resets.
+	 *
+	 * Avoid the problem by scheduling keepalive heartbeats one second later
+	 * than the WOR timeout.
+	 *
+	 * This workaround might not be needed in a future revision of the
+	 * hardware.
+	 */
+	if (gwdt->need_ws0_race_workaround)
+		wdd->min_hw_heartbeat_ms = timeout * 500 + 1000;
+
 	return 0;
 }
 
@@ -202,12 +234,15 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
 static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
 {
 	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
-	int ver;
+	int iidr, ver, impl;
 
-	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
-	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+	iidr = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
+	ver = (iidr >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+	impl = (iidr >> SBSA_GWDT_IMPL_SHIFT) & SBSA_GWDT_IMPL_MASK;
 
 	gwdt->version = ver;
+	gwdt->need_ws0_race_workaround =
+		!action && (impl == SBSA_GWDT_IMPL_MEDIATEK);
 }
 
 static int sbsa_gwdt_start(struct watchdog_device *wdd)
@@ -299,6 +334,15 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	else
 		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
 
+	if (gwdt->need_ws0_race_workaround) {
+		/*
+		 * A timeout of 3 seconds means that WOR will be set to 1.5
+		 * seconds and the heartbeat will be scheduled every 2.5
+		 * seconds.
+		 */
+		wdd->min_timeout = 3;
+	}
+
 	status = readl(cf_base + SBSA_GWDT_WCS);
 	if (status & SBSA_GWDT_WCS_WS1) {
 		dev_warn(dev, "System reset by WDT.\n");
-- 
2.39.5


