Return-Path: <linux-watchdog+bounces-1153-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314590A9EC
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 11:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16C8D1F2471D
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2024 09:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E959D194AFE;
	Mon, 17 Jun 2024 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HysT5erE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED72194AF2;
	Mon, 17 Jun 2024 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617105; cv=none; b=G7ngNXJPRhkn+KwfaM8GIa9LEf/l51wMbDAMO2F+Tf73JC6ZkJMTb6uXQnhBsxVOiIKfilzZ4VJGedGoZtQIvopZg7fYq0nbELyCR497vHVh6lSQtXA4eWLP8uIUev3vn+yTUq1mW79fQXkj0YJbRkwryaIXJGQCoUF+bS7nLoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617105; c=relaxed/simple;
	bh=yDo8y/bWB2Ix5i8ziLWZf8GkSgIQIq80Sv6eejpr5RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtjRTmG4y3V4d7vXXNfVEFzHrq7U3Mo5G5WGPoXrRe2C/u3gHfGJx76BaQYrt70SW3VX5laCiylk5tyIxntr9qCxR1w1RZonWMnozRsWPeTDR19nryI8v1DbF9jpAeGJBsjA4qrhbbsb03P9MNUl5/bG3vytbawxMOtzBdKSbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HysT5erE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F223EC4DE1D;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718617105;
	bh=yDo8y/bWB2Ix5i8ziLWZf8GkSgIQIq80Sv6eejpr5RA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HysT5erE864Oq+++t2Q5fvlWD4VfDgq0rhdYqIzLngal4GbfEeNPCryxh9bcXP9j7
	 VS5gcpKz0DOm/Qr8Gw020q9iIFr5S9n8Fpnriti7n1YLhmDWNnL3IjtImCTgbTq2Za
	 Q2VbwoG4TDGUUVSQB7p6mb0kkXJpzERLAE7z29Dxe+22Joem1+ceXeNN6VljPBTvR7
	 elidqu+x6dYP7LA9qa2ZOtd7XpkZYnydVcEv32ZGxx26R9A1IzLHI4XQgBqjx5K9wB
	 YOZNwEKHn1k813zkdAdpDOBMyq+9ITqimly+CsnqoUeH2I9sRt2FeaR1i0ZEC5WyQE
	 sefouQVw9mkOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79F8C27C7B;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 17 Jun 2024 12:36:58 +0300
Subject: [PATCH v10 24/38] wdt: ts72xx: add DT support for ts72xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-ep93xx-v10-24-662e640ed811@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
In-Reply-To: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718617100; l=1140;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=Ne4hKUjSrewY0X5/1itI3t80vycBGPqa1pd1cn0B3+Y=;
 b=B1l8LPZOYaZ9D1VqIftKHYDn4yLYTtUh/k3qIT4kBloB0pijUXdOck3V05+K9IvsTlyBol1rROpH
 oEadCJyTDuyyWqf1QNGdLeTr8IQi1c9D4XJwcwShqo1SD6NJfvCK
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



