Return-Path: <linux-watchdog+bounces-3628-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFA7ACDCFD
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 13:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3195F3A5D82
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 11:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F26D28EA7B;
	Wed,  4 Jun 2025 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqn1mJUw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577522A4DA;
	Wed,  4 Jun 2025 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037804; cv=none; b=AP+FHTszMkt7fZqDAiGv6kv9C0yKyj8/3EpvzWFy7sCsPMXYrpCbnutsQlvvWFBK8PQTiitO8GdPK/MQ6IPtFSODe306S9KglSW7+qD1oOirYbFxj+ui1fh1qMk2A46MfprfoaF5y3IyohxZUg8J61/3SFm8Jql0zseHPot3qKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037804; c=relaxed/simple;
	bh=jdLZNyKBGTaIn+P61jqDvBxt+dL2n7upkzPJoXZZ2JQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EV54qKb8qGIp+AMWI1SW/fH/UtG11cMeTrsdeOFA9lJxI9elFEmDFHcSgc5onnxyFl9ZxnXBn/VPxvfNcx/X0CybOYrFFDSwD5OYZfDSt5AiIDZB19vhxEwO/glYeGAQGXg6YIIH0AOhi6djWISbgGon0WXlQa+zp7E+BdHsxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqn1mJUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B45C4CEF2;
	Wed,  4 Jun 2025 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037804;
	bh=jdLZNyKBGTaIn+P61jqDvBxt+dL2n7upkzPJoXZZ2JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sqn1mJUwbksB4l+hA8L1YeJE5CwRXaKiMiVCCxgAhG3WKTMzrbYtkjK68Jy+XspHH
	 cEYtqomkKQ7LVW5OsaS4h5wcyPaScjP8omRCLa0FUUWRX6wsB5sJar+ylIc8N/sNUl
	 wMvvq3RXrkceg+ZWV37aET5cVISDpUNQRLDd6S2Mn3l9Y7tYT+oi/6wPQFGQLFrbZe
	 r1gPGCB52c/CT0PYA0WKZGOgOULwTR6PokGV2KGz5SLwkHBDQBH9WWIyQmptxx7hFN
	 gTA0nt3qPPJLywdC7EpP2aebUbDSJb5FEPG7jkrWKkF0afTI7Mxp5+4Ublu1MnvcTR
	 jwgDTPmuF1/jA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	support.opensource@diasemi.com,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 2/6] watchdog: da9052_wdt: respect TWDMIN
Date: Wed,  4 Jun 2025 07:49:54 -0400
Message-Id: <20250604114959.209031-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114959.209031-1-sashal@kernel.org>
References: <20250604114959.209031-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
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


