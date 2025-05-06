Return-Path: <linux-watchdog+bounces-3439-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A62AAC7EA
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 16:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834911BC848E
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 May 2025 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6B2281500;
	Tue,  6 May 2025 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flokli.de header.i=@flokli.de header.b="SgZW+Bsa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.flokli.de (mail.flokli.de [116.203.226.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE3280319;
	Tue,  6 May 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.226.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541613; cv=none; b=HaHtNzycRqw2/6s8Ne33HDZOLWeIyyLql5vzepxzVvxQAw5mXlrRqBzdW8kgsq2+Mw+YZmBzhV7hg5sIFZRsDrvAGdBOh5eAkU3pt19Uqeo+PFd02Qvvx1TvNCBaXGOZliROaFWQFbxE9hIVHghTBeDy4t00ZdlrRAk71JW85W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541613; c=relaxed/simple;
	bh=mgwZZqqwoDQXrMbsv3xygPwhLjoMgLr4h2T1coCg16M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+ArShCGShrABJS19rfDa6reQWvVg3akoRX5tU35swQSzF44giXFkNjl27TIDaWGj4C+5mu6izHHxxNoptUVONRLA0oHxSEeA7jkhJk/cVXU+8WpAhJqNgaKRlmL+nWSIbxdv/9uj2zp8VLE9/TRLZ8BQr39XVGdFI8sBCAXcS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flokli.de; spf=pass smtp.mailfrom=flokli.de; dkim=pass (1024-bit key) header.d=flokli.de header.i=@flokli.de header.b=SgZW+Bsa; arc=none smtp.client-ip=116.203.226.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flokli.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flokli.de
From: Florian Klink <flokli@flokli.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flokli.de; s=mail;
	t=1746541606; bh=ktlsXiTJhVtBSggz7bxl/DGCv7GATcsYZYs5ILJUTc0=;
	h=From:To:Cc:Subject:Date;
	b=SgZW+BsaRRR0lW9vW0eib8Qfo1CzRTqEMsXkb9hIHYZpIiRzwVA9A31lN7Cp7/XYX
	 iTrKt92aryMr/R7bfUQsHx085T3mIddCpXOKnkwRs76fWwBfhgibFdM7mcvGFS+TeH
	 8x7vLV6JGywUhUYvako7kddNhikY2WkAZTZ63clM=
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
Subject: [PATCH v2] watchdog: apple: set max_hw_heartbeat_ms instead of max_timeout
Date: Tue,  6 May 2025 17:26:22 +0300
Message-ID: <20250506142621.11428-2-flokli@flokli.de>
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

Switching to max_hw_heartbeat_ms also means our set_timeout function now
needs to configure the hardware to the minimum of either the requested
timeout (in seconds) or the maximum supported by the user (in seconds).

Signed-off-by: Florian Klink <flokli@flokli.de>
---
Changes in v2:
- Use the minimum of wdd->max_hw_heartbeat_ms / 1000 and
  userspace-requested timeout as documented in watchdog-kernel-api.rst
- Link to v1: https://lore.kernel.org/asahi/20250506120111.5041-1-flokli@flokli.de/
---
 drivers/watchdog/apple_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 95d9e37df41c..66a158f67a71 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -95,9 +95,12 @@ static int apple_wdt_ping(struct watchdog_device *wdd)
 static int apple_wdt_set_timeout(struct watchdog_device *wdd, unsigned int s)
 {
 	struct apple_wdt *wdt = to_apple_wdt(wdd);
+	u32 actual;
 
 	writel_relaxed(0, wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	writel_relaxed(wdt->clk_rate * s, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
+
+	actual = min(s, wdd->max_hw_heartbeat_ms / 1000);
+	writel_relaxed(wdt->clk_rate * actual, wdt->regs + APPLE_WDT_WD1_BITE_TIME);
 
 	wdd->timeout = s;
 
@@ -177,7 +180,7 @@ static int apple_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.ops = &apple_wdt_ops;
 	wdt->wdd.info = &apple_wdt_info;
-	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
+	wdt->wdd.max_hw_heartbeat_ms = U32_MAX / wdt->clk_rate * 1000;
 	wdt->wdd.timeout = APPLE_WDT_TIMEOUT_DEFAULT;
 
 	wdt_ctrl = readl_relaxed(wdt->regs + APPLE_WDT_WD1_CTRL);
-- 
2.49.0


