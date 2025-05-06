Return-Path: <linux-watchdog+bounces-3437-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63075AAC37D
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 14:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84CE1465AD5
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 12:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7824A27FB09;
	Tue,  6 May 2025 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flokli.de header.i=@flokli.de header.b="EzH712X9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.flokli.de (mail.flokli.de [116.203.226.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C927F4C7;
	Tue,  6 May 2025 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.226.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533423; cv=none; b=S5mHXouIF3ibVi8ojvk2mCw6YC0rjkr9e8DvhQcLeR4DzYQvCqg9lMfAveiXduTWIfWcINPS2no3rxLMqPg/mdUVJjMwjbdqBtLfrtREnzEH/QE8KPnL+cEMiYTmQXb2UmZiY90J5keo6H8VX5tjq5snTWINjbXE7BtpGXF8urE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533423; c=relaxed/simple;
	bh=Tclhj7K2o0qscg5Xlp0QaoSdW3G2rXoO87FsXVbbCMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzI+ha+PSNMgQoPD85cFYeh8HQGalMP1YUW3DdbSAZ5zzWyBdudyQN4HjS47vPPg6pZw58DJYAiiRKVkc/fY5KYlDr9gA209L7KmrOFBprlczrVf6U6IktmbTHc7mx5fhzXoF2O8LD4Z5KZc0R45eB/FBGE1oJaLk9ELQqN2GS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flokli.de; spf=pass smtp.mailfrom=flokli.de; dkim=pass (1024-bit key) header.d=flokli.de header.i=@flokli.de header.b=EzH712X9; arc=none smtp.client-ip=116.203.226.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flokli.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flokli.de
From: Florian Klink <flokli@flokli.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flokli.de; s=mail;
	t=1746532878; bh=7vx3gTnF+9ahlm0p7+sai6tkLNM+xCZ1j9YbAf2oUVc=;
	h=From:To:Cc:Subject:Date;
	b=EzH712X94uyLi8KHDF4HR75ZtlptuAaX+mEtBNxAHklGWYZ0wL6/rBtFARGqD+4sQ
	 oLbFeAYhfhKmcbjFZlvkHlhGiDtyM5LiZ++TQ+R/bN0pg58TByCwo+2uWzY0w+pVED
	 ph3JdA0vt+7ZiirIxIQ2W50CybkxknmpV5qcnF44=
To: Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Klink <flokli@flokli.de>
Subject: [PATCH] watchdog: apple: set max_hw_heartbeat_ms instead of max_timeout
Date: Tue,  6 May 2025 15:01:11 +0300
Message-ID: <20250506120111.5041-1-flokli@flokli.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware only supports timeouts slightly below 3mins, but by using
max_hw_heartbeat_ms we can let the kernel take care of supporting larger
timeouts than that requested from userspace.

Signed-off-by: Florian Klink <flokli@flokli.de>
---
 drivers/watchdog/apple_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 95d9e37df41c..6088a7554312 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -177,7 +177,7 @@ static int apple_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.ops = &apple_wdt_ops;
 	wdt->wdd.info = &apple_wdt_info;
-	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.max_hw_heartbeat_ms = U32_MAX / wdt->clk_rate * 1000;
 	wdt->wdd.timeout = APPLE_WDT_TIMEOUT_DEFAULT;
 
 	wdt_ctrl = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CTRL);
-- 
2.49.0


