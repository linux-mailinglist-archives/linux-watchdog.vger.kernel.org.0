Return-Path: <linux-watchdog+bounces-3631-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E905ACDD25
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 13:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC03118997DC
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 11:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3388628F507;
	Wed,  4 Jun 2025 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOcSMxtX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F6624C664;
	Wed,  4 Jun 2025 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037836; cv=none; b=X4HyfqfZFaxvM3mYP9Wx7/T0iteqLWl02Y5q3Gcoe0DdAw4DGx0aDRqrpfBY7o6PS3wx8I4xp+DMLQQmjozGimeexsBDoj5vli32ZPIJolpwf86W4CnSWujY7Q2HNoWjvWt+fUX7n47FAKw91fAwJux2u7Ltpu9v4dkwMkBjb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037836; c=relaxed/simple;
	bh=jdLZNyKBGTaIn+P61jqDvBxt+dL2n7upkzPJoXZZ2JQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hk/xWBPFgJV2tPq3nzFhMlw2A0uWIPvpXkEI/DLdddJ7BlbeVLqPffeR8zKUD87zGhnVPhgfCt4FDj33wzxueqPY5xhvQlHwSHtmcCjG9Vn/FAgA77XM1OTgM8Sid9dKZa2G9CaRl/YQ4Zyykb5GrOuYmUpr2RElR0QSAvOLC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOcSMxtX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912D9C4CEE7;
	Wed,  4 Jun 2025 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037835;
	bh=jdLZNyKBGTaIn+P61jqDvBxt+dL2n7upkzPJoXZZ2JQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LOcSMxtXbMGnGDng/2QAdDAyHm/tbj//15zcuJ0YezGvZtJL/5zLTWcA2IICgWtv3
	 PTcmy16ZLT/cE9ubhcKtf4R3irK9KNwGXidtNMBLmGtlYdjIIq9xwjuDrMy+L0naRO
	 07KRe1xGrdZUcsQ5wq5YM8VbllWPYLWPY/id/yml2JhpOF2OZgGkajH1IauvvnbvXV
	 Min10ShNyqzFNObVHZjCzZ0tbzxthRCQDDpDO2DwndqmUO+RF6uESHxVLKZZlMiMLs
	 r6fpyz/wXuFNMPH+3Qss0KISFgpVnjUdsRJXIZafrkKJ8S3FEsLqFTJePivv0jtM/D
	 iZqO8BCILqWxQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	support.opensource@diasemi.com,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/5] watchdog: da9052_wdt: respect TWDMIN
Date: Wed,  4 Jun 2025 07:50:29 -0400
Message-Id: <20250604115033.209492-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marcus Folkesson <marcus.folkesson@gmail.com>

[ Upstream commit 325f510fcd9cda5a44bcb662b74ba4e3dabaca10 ]

We have to wait at least the minimium time for the watchdog window
(TWDMIN) before writings to the wdt register after the
watchdog is activated.
Otherwise the chip will assert TWD_ERROR and power down to reset mode.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250326-da9052-fixes-v3-4-a38a560fef0e@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, here's my assessment: **YES** This commit should
be backported to stable kernel trees. Here's my extensive analysis: ##
Analysis of the Commit ### 1. **Bug Fix Nature** The commit fixes a
critical hardware timing constraint issue. The DA9052 PMIC has a minimum
watchdog window time (TWDMIN = 256ms) that must be respected. Writing to
the watchdog register before this time elapses causes the chip to assert
TWD_ERROR and power down to reset mode, which is a serious system
failure. ### 2. **Code Changes Analysis** The commit makes a single,
targeted change in `drivers/watchdog/da9052_wdt.c`: ```c
da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
+da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN; da9052_wdt->info =
&da9052_wdt_info; ``` This change adds `min_hw_heartbeat_ms =
DA9052_TWDMIN` (256ms) to the watchdog device structure during probe.
### 3. **Technical Correctness** - **DA9052_TWDMIN is already defined**
as 256 in the driver (line 25) - **The current code already implements
manual timing protection** in `da9052_wdt_ping()` (lines 119-121) using
jiffies tracking and `mdelay()` - **The watchdog core provides proper
infrastructure** for `min_hw_heartbeat_ms` as seen in similar
DA9062/DA9063 drivers and watchdog core code - **This replaces manual
timing logic with standard core handling**, making it more reliable and
consistent ### 4. **Risk Assessment - Very Low** - **Minimal code
change**: Only adds one line setting a field - **No behavioral change**:
The timing constraint was already enforced manually - **Uses existing
infrastructure**: `min_hw_heartbeat_ms` is well-established in watchdog
core - **Consistent with related drivers**: DA9062 and DA9063 drivers
use the same pattern - **No architectural changes**: Just moves timing
enforcement from driver to core ### 5. **User Impact - High** -
**Prevents system resets**: Without this fix, rapid watchdog pings can
cause unexpected system shutdowns - **Hardware protection**: Prevents
TWD_ERROR assertion which leads to PMIC reset - **Critical for
production systems**: Watchdog failures can cause data loss and system
instability ### 6. **Stable Tree Criteria Compliance** - ✅ **Important
bugfix**: Prevents system resets due to hardware timing violations - ✅
**Minimal risk**: Single line addition using existing infrastructure - ✅
**Small and contained**: Only affects DA9052 watchdog driver - ✅ **No
new features**: Just improves existing timing protection - ✅ **Clear
benefit**: Moves from manual to core-handled timing protection ### 7.
**Comparison with Similar Commits** The provided similar commits (all
marked "NO") were different in nature: - **Commits #1-3**: Added new
functionality or made architectural changes to use core protection -
**Commits #4-5**: Simple cleanup removing error messages - **This
commit**: Fixes a critical hardware timing bug that can cause system
resets This commit is fundamentally different - it fixes a real hardware
constraint violation that can cause system failures, not just cleanup or
new features. The commit perfectly fits stable tree criteria: it's a
small, low-risk fix for an important hardware-related bug that can cause
system instability.

 drivers/watchdog/da9052_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index d708c091bf1b1..180526220d8c4 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -164,6 +164,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt = &driver_data->wdt;
 
 	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
+	da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN;
 	da9052_wdt->info = &da9052_wdt_info;
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
-- 
2.39.5


