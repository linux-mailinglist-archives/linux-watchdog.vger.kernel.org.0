Return-Path: <linux-watchdog+bounces-3970-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42AB1B451
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 15:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41863AC975
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 13:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67100237173;
	Tue,  5 Aug 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQh8ayeM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3362737E7;
	Tue,  5 Aug 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399461; cv=none; b=J9sE6i1lrtkJwuI0ekt5tRWJAHIh8vzxY5uQSNiME3IySn/AQCRkVE3kFZ5Tt3Ga1F9yL0/JbZSzwni+QjFXQ/lET+JSp751OlgFeVPQtrm8klfUMCnSppETTrn2hXQ5PWZ2Pzs/m8Bc6ec1dFe8idNJfE4e+Rlbr3tKLI5UuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399461; c=relaxed/simple;
	bh=DdvEbqBqA1HOPxq3rnYuvqPczayzOQ3TI0Xd1OOEko8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bY6KbMoSQWu4/6u5EmnoyeemK8e0TKrJioHjr9Saw+WBIy4p84tgQhkaf5N5zF+KCOquZi4j8/AkBqqnoo+PRFq4nyd4gm6fED951IH3VzCi8qyWjSlsLdkDcMCHpNFFM+87vvgEFrP7uiKjR3DLHPvF3hXY3yPwdlXbMQXnkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQh8ayeM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA364C4CEF7;
	Tue,  5 Aug 2025 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399461;
	bh=DdvEbqBqA1HOPxq3rnYuvqPczayzOQ3TI0Xd1OOEko8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQh8ayeMN+8nuo/4pyF2hWCBDgIX6I8oMLsWAetuvgFCVW4AwxuXUpQ750mJv4tzW
	 2eZ2QdUK5/zlnZO1TwHllZoKPJum/XX65zMc9eVA5E6duE5kFTjs5VRnbPe+fZ0jxV
	 Moy9Jacc6AgTVf1i1FLz842AhPRSAxKPdNpwWeCFUqi6JOOJW58JSq3L08fwyw3LM0
	 Mmul17hMLFII2XuvCMDu/ZWEqggul5LZ2QahpiDmFteVkFuQQvXj698kYngVOYm6ig
	 kae9/hn/bbmgn94FsWlpu8k97P5iZ+imImSGPv0BYDgl5vuldzdL3NzNvxCW71OdXq
	 8ROieH0bxlniQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] watchdog: dw_wdt: Fix default timeout
Date: Tue,  5 Aug 2025 09:09:09 -0400
Message-Id: <20250805130945.471732-34-sashal@kernel.org>
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

[ Upstream commit ac3dbb91e0167d017f44701dd51c1efe30d0c256 ]

The Synopsys Watchdog driver sets the default timeout to 30 seconds,
but on some devices this is not a valid timeout. E.g. on RK3588 the
actual timeout being used is 44 seconds instead.

Once the watchdog is started the value is updated accordingly, but
it would be better to expose a sensible timeout to userspace without
the need to first start the watchdog.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250717-dw-wdt-fix-initial-timeout-v1-1-86dc864d48dd@kernel.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit, here's my assessment:

**Backport Status: YES**

## Extensive Explanation:

This commit is a clear bugfix that should be backported to stable kernel
trees for the following reasons:

### 1. **It fixes a real user-visible bug**
The commit addresses a problem where the watchdog driver exposes an
incorrect timeout value (30 seconds) to userspace when that value is not
actually valid for the hardware. On RK3588 specifically, the hardware
uses 44 seconds instead of the requested 30 seconds, creating a
discrepancy between what userspace sees and what the hardware actually
does.

### 2. **The fix is minimal and contained**
The change adds only two lines of code:
```c
+               /* Limit timeout value to hardware constraints. */
+               dw_wdt_set_timeout(wdd, wdd->timeout);
```
This simply calls the existing `dw_wdt_set_timeout()` function during
initialization to ensure the timeout value is properly validated and
adjusted to hardware constraints before the watchdog is registered with
the kernel.

### 3. **No architectural changes or new features**
The commit doesn't introduce any new functionality or change the
driver's architecture. It merely ensures that the existing timeout
validation logic (which was already being called when the watchdog
starts) is also applied during initialization.

### 4. **Low risk of regression**
The `dw_wdt_set_timeout()` function is already being called in other
code paths (when the watchdog is started, when timeout is changed). This
commit just ensures it's also called during probe to validate the
initial timeout. The function itself uses `dw_wdt_find_best_top()` to
find a valid hardware timeout value that's closest to the requested
value.

### 5. **Affects user-facing behavior**
Without this fix, userspace applications that query the watchdog timeout
before starting it will get an incorrect value (30 seconds) that doesn't
match what the hardware will actually use (e.g., 44 seconds on RK3588).
This could lead to incorrect assumptions about watchdog behavior in
monitoring and recovery systems.

### 6. **The fix follows established patterns**
The commit message notes "it would be better to expose a sensible
timeout to userspace without the need to first start the watchdog" -
this is a reasonable expectation that userspace should have accurate
information about hardware settings without needing to activate the
hardware first.

### 7. **Subsystem maintainer review**
The commit has been reviewed by Guenter Roeck (the watchdog subsystem
maintainer) and signed off by both subsystem maintainers, indicating
it's a proper fix that they consider important.

The fix ensures that the watchdog timeout value exposed to userspace
through sysfs and ioctl interfaces accurately reflects the hardware's
actual timeout capability from the moment the driver is loaded, rather
than showing an incorrect default value until the watchdog is started.
This is particularly important for systems that need to make decisions
based on watchdog capabilities before actually starting the watchdog
timer.

 drivers/watchdog/dw_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 26efca9ae0e7..c3fbb6068c52 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -644,6 +644,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	} else {
 		wdd->timeout = DW_WDT_DEFAULT_SECONDS;
 		watchdog_init_timeout(wdd, 0, dev);
+		/* Limit timeout value to hardware constraints. */
+		dw_wdt_set_timeout(wdd, wdd->timeout);
 	}
 
 	platform_set_drvdata(pdev, dw_wdt);
-- 
2.39.5


