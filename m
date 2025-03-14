Return-Path: <linux-watchdog+bounces-3105-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0BA615AB
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 17:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EB9D1B647DC
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 16:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BD6202963;
	Fri, 14 Mar 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwAIwXPA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1191FF7B8;
	Fri, 14 Mar 2025 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968175; cv=none; b=OjEQXp/vQNUXIgB31G0tiupGImcLIp8AclxU3Rdzj0w2xJqhW4/FvxlYjy0GuhN7OYBvDazeyn5B2OTGzg32mfB6pkHe7aXhOAOSrCEScnZpu7h+yKE7YhajmA+5a9pX01VV3GSyc9QrECEgAU6n4L+rHzXv0aQ7n/WnTwq1nEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968175; c=relaxed/simple;
	bh=2xfK40kbAsq1KvSui06/jpf2SUEyYwHkDTzV9ntlS0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WL5dM3U7EPMkep8v7s5rYvbjC1pvvThd+gcZvJNMLK+Uil8wu5xn2d5B1xOULiJS4z7EAJnlPWHzZiA3GUpzqamRop+DhuFHtS3bqu8OIjchhFswkYx8LmcNo6s8eSf2qL3WW85q9RmKSxlDUYc6rsn2cKqTpebNaI65jrSAQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwAIwXPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803CFC4CEE9;
	Fri, 14 Mar 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741968173;
	bh=2xfK40kbAsq1KvSui06/jpf2SUEyYwHkDTzV9ntlS0E=;
	h=From:To:Cc:Subject:Date:From;
	b=NwAIwXPA5LFcIGfs/bRsgeS29k96CBCEM5nbbzJuvRLWiyQYt3rykJ48fbgDzQ4h+
	 dK5u8r9V4Ee5/y1NQs8aHLSzT00O9fYt03Ryl/fN2Oj3OMa5XNtYYNt9JJ0muwTSdR
	 /MXZloiB9t3j0LdunViaOvQrids/JmMppD1Q9DdA+L7qM1Mr/lKS63K0FZ294Zgg+e
	 n5VWtTs9xkuvnxnxouvylTWiPpD++qr7929bLwS4kxC38MLOgLWTRQPorjIPZjTYY1
	 2dClBdjtIEOBybXRJhhp9zobqDT6wXGMklWdgHYkfaq8adhrbHNM+T+wwGfJIwgk5n
	 /feX1H8EpT2Mw==
From: Arnd Bergmann <arnd@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: aspeed: fix 64-bit division
Date: Fri, 14 Mar 2025 17:02:44 +0100
Message-Id: <20250314160248.502324-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit architectures, the new calculation causes a build failure:

ld.lld-21: error: undefined symbol: __aeabi_uldivmod

Since neither value is ever larger than a register, cast both
sides into a uintptr_t.

Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 369635b38ca0..837e15701c0e 100644
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


