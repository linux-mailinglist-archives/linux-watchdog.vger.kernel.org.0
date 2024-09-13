Return-Path: <linux-watchdog+bounces-1891-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E39978715
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 19:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E93284BFE
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 17:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A215811A;
	Fri, 13 Sep 2024 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt0t1q4G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622179B8E;
	Fri, 13 Sep 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249565; cv=none; b=rPe6dJBF9FzqFno0gadDGhHj79+4M7EWsF2aO9cReLO6r59TYUswvbdmILquIXKRBEIdl1mxJG42gcT9h0TRzuJSm3qL6WrCkp6a2LpwYGPtz3mHV0OZhnJn0OmG+r7SSaYKiVMNOf0yMnwwUy7nD3+aZA1CD7HHOzVzl/jS+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249565; c=relaxed/simple;
	bh=k2Sg5pN7dYYgJRnp2XsRdLyqdDWdF3HWxsDL5TVPvEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgTDKFiKtjhcYz83ovOVUdB9+FBQoKMZnGpAMEtAJk9uz5iHb2J+kbSK0IjXzL9mAniB0bVi81RNC6zDrcE31g9jU0Kfb/oiMNKBNs3C8mGsK0ovH/uYBSjKK1v5tByVsMNCkj9CaJ8R42e83hWmUHGS4t19BZktNML63SLGwr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt0t1q4G; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-206f9b872b2so24851655ad.3;
        Fri, 13 Sep 2024 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726249562; x=1726854362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMmVvlnDTI/iTSI2Zh5vhwF1oFsJYU1HFV/JLiFZUNw=;
        b=Jt0t1q4GodL6Q6KuESR48GYYQ1NlvLG77Z3XIBMPnxxCilYIbUY6cZ/6Aed+TtLDmO
         eeQw2VfPZq3Jvtkcu6iAXIIDk4RyMUkfVmaz3ldbcxpz/vPL6QUc9m0YUyI5WXDzBmnq
         vuPyXmSDq3555HMTZK0b2TJzFQTDQCN36mUDf5i8TGqmOG5ZNS3HE79hOyvMZL4hgP8C
         g4Q61Xa/CTtJOxF7orZEEDS4Sk5SwyIVr97EEYhEp8Vg5L0BJvQcMuRL4o/DeqPALICp
         pTJP8FPjkxAqbOuiyJwgezY1+SFspPlF3UwbPlEb+qPJgDpKU+QiGWaeD2hkS3AaLHgs
         TvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249562; x=1726854362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMmVvlnDTI/iTSI2Zh5vhwF1oFsJYU1HFV/JLiFZUNw=;
        b=Bi95w8XCtyFYEqhoxL5UVQINIpqAsmOgq3+msrK49sppI9tpCqM2Snk1JhDjH6xJm5
         0mOlOc7CaorEv4NY1jKiZRp5ukBFXwUBD35gioratjNKv7cB8vYnkIUWnzqEARRirf+4
         MAnd9EuRQ4mBFv0A8Vkhh4a3/wWnFJBnZGqNI4AupxXorPOVj23rCPRueyM/ssfMnPfz
         xGIhr4KSsfGGeLr+UR1UzrIKzDVomccp1XAPGanmLkJtq3ISMpyDQU+oQuM+UQm9qhO2
         J8EG5bMdD2EIXDK43bbVl91RcR729XIm8nasgGH2KMJ78GBzlNWkaS39ieQIjGdP8n/0
         wY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEKhllPbP9+/ANWAEgPDbjp7eqMspZ1nlwHthkmi1Px8nUe+l5mDnxKpkwGmjE50FpeN8JCGad7kqkgTQ=@vger.kernel.org, AJvYcCXgZLHF3MtJ/oj0alZFyC7go3iJzJN7co6ps0rmYwMoLsQL9iO5G/+QusiNGHdIhH9lhxJQco43PTL8z38nFlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGoW3AeRH2U3TI0LI3D9zbaeQDE3FJCSMvFFXV2N4sJBMBsA4Z
	EW/dAeztdPP80GXaEWPcfKEiLSSIQ3uTsd11hA95lmTG7W5r/AlS
X-Google-Smtp-Source: AGHT+IGQ8EysGx88b1xm+qR1UoKo/PQr2FXhFG58fEJbseDMvs0OFF/hkxWoZMnNYF7N3WdCAQ4J9g==
X-Received: by 2002:a17:902:b48f:b0:1fc:57b7:995c with SMTP id d9443c01a7336-2076e36cc53mr87095525ad.7.1726249561902;
        Fri, 13 Sep 2024 10:46:01 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2076afdd667sm30300465ad.140.2024.09.13.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:46:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH] watchdog: apple: Increase reset delay to 150ms
Date: Sat, 14 Sep 2024 01:45:05 +0800
Message-ID: <20240913174540.45551-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Apple A8X SoC seems to be slowest at resetting, taking up to around
125ms to reset. Wait 150ms to be safe here.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index d4f739932f0b..353ecf0b04dc 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	/*
 	 * Flush writes and then wait for the SoC to reset. Even though the
 	 * reset is queued almost immediately experiments have shown that it
-	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
-	 * 50ms here to be safe.
+	 * can take up to ~120-125ms until the SoC is actually reset. Just
+	 * wait 150ms here to be safe.
 	 */
 	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }

base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.46.0


