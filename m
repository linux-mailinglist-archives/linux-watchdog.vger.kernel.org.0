Return-Path: <linux-watchdog+bounces-1815-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A92797117A
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 10:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96155B212B9
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 08:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074AF1B29BB;
	Mon,  9 Sep 2024 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOnyxAAR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF2B1B2533;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869536; cv=none; b=b5cYQmHlTrRZR5QC3KN1Zypj6QhbK190gu9aS8xTynrgHTJ+sTznUTkXqd7tb9GjX/BVOtWvF5jVozq9pZyAIaD6ND0S54YOl1wBo/HJ2IaFbMZ5xNHPDmO00gFDJIbaMerYL5ynHrRbRhQqIcSmWWWjqOvWKo0eQApmC94v4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869536; c=relaxed/simple;
	bh=yDo8y/bWB2Ix5i8ziLWZf8GkSgIQIq80Sv6eejpr5RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtVpybT0aJxlzODRHLmOCuJUOyXrFKx3tsDoUzwXDBvv59rXRILkXywk3Xg8OZhHHrWKMn19tVPwlq0ZDBdjkBTjmMCuwBs5RBvU8s+cp0lhbn3cyFXQRcOTclvIS2wzHV2GuvNKsvm+Y5g3wRwPb36dH/PgbrgjRSzj3jHJ1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOnyxAAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0026C4DDFD;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725869536;
	bh=yDo8y/bWB2Ix5i8ziLWZf8GkSgIQIq80Sv6eejpr5RA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UOnyxAARxcv4p9ZBTthPeKAbgQuLlRAGejhFuexSizN1toc+90yN1qNP54m1AwT6f
	 UCFh0I7x4blc1uwGafx7fudb77j1+jrw3kIkK3/cuVK3smRfTYC1w9crfGqJy0bJig
	 GR+2rTBKN9zgLyxr1FUsCgMBLZcodIL3IC79WThsRU9RIW6dpnaxY5vtkHbIhJ3Qy7
	 EiklAHJNlHeqiSi9ibTlO2yJXkXE+VXO+6P9zkgdb9Le/6Y18wdXH0vBUZzN++erOX
	 1nC1KMyXr1GAcTbxhyGaRH9j8Xqx5R7ossaUtaREwg8pQOR2he9Bl9a6S24v1imIc9
	 VGT6T1D94MZjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAED8ECE57B;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 09 Sep 2024 11:10:49 +0300
Subject: [PATCH v12 24/38] wdt: ts72xx: add DT support for ts72xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-ep93xx-v12-24-e86ab2423d4b@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
In-Reply-To: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725869532; l=1140;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=Ne4hKUjSrewY0X5/1itI3t80vycBGPqa1pd1cn0B3+Y=;
 b=7p2nC5LQXwqhp7SWBek+VwMIcOLOkHWgNVWmAoY+astAup7espZkFVombcjojcI2iFbB2255dbyu
 RL8lYBUaAn9H2aKiE8VrLudtf+7ZOZkaHMzGB8dmArBJS9fWCtLd
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: nikita.shubin@maquefel.me

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add OF ID match table.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/watchdog/ts72xx_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/ts72xx_wdt.c b/drivers/watchdog/ts72xx_wdt.c
index 3d57670befe1..ac709dc31a65 100644
--- a/drivers/watchdog/ts72xx_wdt.c
+++ b/drivers/watchdog/ts72xx_wdt.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/watchdog.h>
 #include <linux/io.h>
@@ -160,10 +161,17 @@ static int ts72xx_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ts72xx_wdt_of_ids[] = {
+	{ .compatible = "technologic,ts7200-wdt" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ts72xx_wdt_of_ids);
+
 static struct platform_driver ts72xx_wdt_driver = {
 	.probe		= ts72xx_wdt_probe,
 	.driver		= {
 		.name	= "ts72xx-wdt",
+		.of_match_table = ts72xx_wdt_of_ids,
 	},
 };
 

-- 
2.43.2



