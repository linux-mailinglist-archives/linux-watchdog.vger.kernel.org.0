Return-Path: <linux-watchdog+bounces-3627-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA98ACDCEF
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 13:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D303A5CA2
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 11:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A5324C664;
	Wed,  4 Jun 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKmA8j3a"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007322A4DA;
	Wed,  4 Jun 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037790; cv=none; b=j53bqFV/J66fkpKxUMhH843HF2QoWkJ2ABOPUpG9RrTsAJNwm06nfKBQjzR0IqG4sn4sbWAbV9Nwh+FMb+2FzpDe6vhYcXaPmx8Cy2CHSYUmIFtk2O4bPr2HrWZXocIqF+bxxGU/Yl6qTLEvFg5Mqkc2pueIryC8kJmLtBrX3ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037790; c=relaxed/simple;
	bh=4YpqR/oThvhMVs76qJVATQq41r8mEVz6PYiOWFGh/YM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pq3Yt5Y6rrVl7ez0d9zyvw98HsL3SyT0AAVmx9iitfQoyVefvCuKhiroKjFYPgqPO+KXA6CW4v3MdIhdb+anmtz6ZYDUdoNl/viEXbJ2qf/7hH3F73bhsD4p1RFuXofxjaTtgapQdIAJV9uMAjhpDqgyKEX9rlI0adZTgaVzXbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKmA8j3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF65C4CEE7;
	Wed,  4 Jun 2025 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037790;
	bh=4YpqR/oThvhMVs76qJVATQq41r8mEVz6PYiOWFGh/YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OKmA8j3aqZqMYW/5etm/6Hiz6awLlctbEnfKCJCTDzZeqyZPzXLSy2T4SQDxa9tPE
	 iLmNZdWyH6x8TMX8uy4SNSuS6yzo88UX14S/Jb3NBnzVDN+ELVxmlAF2M6K3pfKdmc
	 NtgdF0vCrmPJEpIgHxk/OGvcVplASDKXXt0Hk5PQ4XgQmH+IsZCvAtEdi7beoVrHoW
	 kXNfUOsUHqQNvZ5Ypv3sPs0M5TRhGnqc9kYV0/d1LKLxREoMuJSCaNXQcLL1jyUUNC
	 xhiLytOqFE5rKQdkjTbqnP9ZuCXELq7nHVCJCS+pFQAsbeM7e0aK+DbwDEVr7P50WI
	 MagB1am6SDJ4Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 3/8] watchdog: stm32: Fix wakeup source leaks on device unbind
Date: Wed,  4 Jun 2025 07:49:38 -0400
Message-Id: <20250604114944.208828-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114944.208828-1-sashal@kernel.org>
References: <20250604114944.208828-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit b6f8a417e17f1929bb8e7e6ba9f4677f1f3ce364 ]

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250406203531.61322-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** Based on my comprehensive analysis of the commit and examination
of the Linux kernel repository, this commit should be backported to
stable kernel trees. ## Analysis of the Commit ### Nature of the Bug Fix
This commit addresses a **memory leak** in the STM32 watchdog driver's
wakeup source handling. The change is minimal but important: ```c //
Before: ret = device_init_wakeup(dev, true); // After: ret =
devm_device_init_wakeup(dev); ``` The original code creates a wakeup
source using `device_init_wakeup()` but never properly releases it when
the device is unbound or the driver is removed. The fix uses
`devm_device_init_wakeup()`, which automatically handles cleanup through
the device-managed resource framework. ### Strong Alignment with Similar
Backported Commits This commit follows **exactly the same pattern** as
the similar commits #1 and #2 that were marked as **"Backport Status:
YES"**: - **GPIO mpc8xxx commit**: Also changed `device_init_wakeup(dev,
true)` to `devm_device_init_wakeup(dev)` and was explicitly marked for
stable with `Cc: stable@vger.kernel.org` - **GPIO zynq commit**: Added
proper cleanup with `device_init_wakeup(&pdev->dev, 0)` in the remove
function, also marked for stable ### Key Factors Supporting Backporting
1. **Clear Bug Fix**: Fixes a definitive memory leak - each time the
device is unbound, wakeup source memory (struct wakeup_source, device
name strings, sysfs entries) is not freed 2. **Minimal Risk**: The
change is extremely low-risk: - `devm_device_init_wakeup()` is just a
wrapper that provides automatic cleanup - No functional behavior changes
during normal operation - Only adds proper resource management on device
removal 3. **Small and Contained**: Single line change with no
architectural implications 4. **Part of Systematic Cleanup**: My
analysis of the kernel repository revealed this is part of a larger
cleanup effort with 10+ similar fixes across different subsystems in
2024-2025 5. **Real Impact**: While not critical, the leak affects: -
Embedded systems with limited memory - Development environments with
frequent driver loading/unloading - Systems that dynamically bind/unbind
devices 6. **Stable Tree Criteria Compliance**: - Fixes an actual bug
affecting users - Extremely minimal regression risk - Confined to a
single driver - No new features or architectural changes ### Risk
Assessment The technical risk is **extremely low**. The
`devm_device_init_wakeup()` function is a simple wrapper around
`device_init_wakeup(dev, true)` that adds automatic cleanup via
`devm_add_action_or_reset()`. There are no functional changes to the
watchdog or power management behavior - only proper resource cleanup is
added. This commit exemplifies an ideal stable backport candidate: it
fixes a real bug with minimal code change and virtually no risk of
introducing regressions.

 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5adc..b356a272ff9a0 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.39.5


