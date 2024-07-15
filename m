Return-Path: <linux-watchdog+bounces-1382-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F4931014
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 10:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E359C1C21960
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 08:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E448185E62;
	Mon, 15 Jul 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXDY8A4v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F32185E4D;
	Mon, 15 Jul 2024 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032803; cv=none; b=Uc7i81dzfExrTVRTgOJhxoTbnoRLSmFZi+LDIQuw439Fq3MN2w99mLmmf9Vhwk/SWb0ILxjpbPY3qblgTyPYZsjY+5VcGkHqGXw8E/vuCDTZQlL0ugJFU5bVjk7E3JwVurDLjDP3c5iXXTtgAgDyEyz/8kcHZyDGdO5Y+5halmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032803; c=relaxed/simple;
	bh=p7ruUPyc+63NALcCZNunH+Nk2cdQEW4DXh1uDsweETM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQs/dZ7AxemXVODwvdLzSaZxrNb5ecxW7NnerSWABvjxV5WX2oan26NAlblDKH76pq4WY9dIY8hzJwqd0Xf5EjV5AfJOmYU9ker3KB3DUMh2YExK9GhJ1ZxVYOq9wbfXW1e70RutBi+J6SzSIRcm+BdNkQgojT1Wzv0BzPt3+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXDY8A4v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A372C4AF5F;
	Mon, 15 Jul 2024 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721032803;
	bh=p7ruUPyc+63NALcCZNunH+Nk2cdQEW4DXh1uDsweETM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YXDY8A4v8CWrlM/wcJ6U4xqxigEHKwEVvYXDAnnVirJxOmyg5YBr4otbXM2QKT45K
	 8lB99ii9WpYNdMS0c+AMqY21dyrZSh02Z/WwC3l9VQpM+p00QDx4rtWVQrE6NRyhRq
	 hSewgejeHJJgbgkjAdOfKjVkw4sriWv3YRyFj2GBu5nNsKhBlVl8KI6hjEXwSnCXBk
	 JwwLs8gPGI2vYwaBIihy+7so3EHoddraGo2NGqtxE35EUVgJ6A5BsYQ8/qQrpLQaSu
	 qRhLWuAnTvhxqsmanGiwnYTHCq4U/jj4s+kW1rZJyN5UVt3xkA9afOFcXpwlbtUFzO
	 P9EFthGZ2eMVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E53CC2BD09;
	Mon, 15 Jul 2024 08:40:03 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 15 Jul 2024 11:38:15 +0300
Subject: [PATCH v11 11/38] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-ep93xx-v11-11-4e924efda795@maquefel.me>
References: <20240715-ep93xx-v11-0-4e924efda795@maquefel.me>
In-Reply-To: <20240715-ep93xx-v11-0-4e924efda795@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721032799; l=1193;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=JD3ei7UZOSn3iRCJWHAn8GIoBZ2EOdmGr+0MVn+KIfc=;
 b=D5JPJUXQh2OnL984T2HXAEWwZRYpQrJNWo7xm1De0vO5VIR/iBRhk2MVttfZCoyqbFteLyVjtSq8
 YVJ8dcXCBh/RNbSyg5i2rvNrDfzxKJq8Wz9dba8HT8Sh0mZSh0gd
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: nikita.shubin@maquefel.me

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add OF ID match table.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/watchdog/ep93xx_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wdt.c
index 59dfd7f6bf0b..af89b7bb8f66 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -19,6 +19,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/watchdog.h>
 #include <linux/io.h>
@@ -127,9 +128,16 @@ static int ep93xx_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_wdt_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-wdt" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_wdt_of_ids);
+
 static struct platform_driver ep93xx_wdt_driver = {
 	.driver		= {
 		.name	= "ep93xx-wdt",
+		.of_match_table = ep93xx_wdt_of_ids,
 	},
 	.probe		= ep93xx_wdt_probe,
 };

-- 
2.43.2



