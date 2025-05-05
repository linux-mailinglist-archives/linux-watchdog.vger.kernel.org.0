Return-Path: <linux-watchdog+bounces-3430-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA9AAA807
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 02:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4AA18990A7
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 00:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555FD345699;
	Mon,  5 May 2025 22:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHB2aBZP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D7345694;
	Mon,  5 May 2025 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484720; cv=none; b=t6oKFw0JfGbmzdt3ANLnHSL6HBafCMyzmaKUtMJvRoS4HMrWK8ua9DJlMwcakg5vgyWHw84KJvYM1gfY624LKvNfLYCu9k+sGygxW6Z5HK/TKHjPlGOlEo6KvvBwKLVWHu9o0CDu5Qq4RJ3R2jpyXx+5QM24TjLDQgkUemsOAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484720; c=relaxed/simple;
	bh=s61Je2PkceIhRzOL/l54+OairdWxRxRQmN5FWDJG8AY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xp42ORYHssK9A08VUBT9IrgxjuClnme+DDasb5wBbW509mwTSNk0+VKJFuFcvnwVAw7z0OsRyCKaATvqJPpKAnMKTedlbTeN6yji04w08v94LBYu0I3lDQjiOjUVV/YV0p/PTqFXFBFho+JNbjQZrrf1P3s9ncHU0T8NKrVwcMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHB2aBZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE4CC4CEE4;
	Mon,  5 May 2025 22:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484719;
	bh=s61Je2PkceIhRzOL/l54+OairdWxRxRQmN5FWDJG8AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHB2aBZPeYHN7WNgQXX/g0IOKS9l/2k4+aXwSWjvWjTxgVNsm2Q0OQYm7XLVHCAmL
	 tMB6T0ttVwH1ZB51vFb7Y5eqK5rPPCzJrszvn7J31QLMr6ZjQGC5NkZ+LvSX/mv9IR
	 tkNHIatjVns908YquXKvClXK53GXsItrQIqCXdUdb/EMkbkEFuNJ50pCKIoagChMHn
	 ckVzn7JKYX/PBx+MXQlbpUxWk85qHjzeKUxt6Anq63zNcuCVtT2cccjh0dv20rngub
	 2ZikM7xDAhWFMwCbc1Yvu0FTqdLWhla0MmQXpJuD7r1z7Fi0/hycsEfItna0yZenY/
	 S1qJot7r0lIKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	chin-ting_kuo@aspeedtech.com,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 626/642] watchdog: aspeed: fix 64-bit division
Date: Mon,  5 May 2025 18:14:02 -0400
Message-Id: <20250505221419.2672473-626-sashal@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 48a136639ec233614a61653e19f559977d5da2b5 ]

On 32-bit architectures, the new calculation causes a build failure:

ld.lld-21: error: undefined symbol: __aeabi_uldivmod

Since neither value is ever larger than a register, cast both
sides into a uintptr_t.

Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250314160248.502324-1-arnd@kernel.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 369635b38ca0e..837e15701c0e2 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -254,7 +254,7 @@ static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
 
 	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
+		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
 	}
 
 	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
-- 
2.39.5


