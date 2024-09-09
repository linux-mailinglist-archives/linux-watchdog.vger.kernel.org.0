Return-Path: <linux-watchdog+bounces-1813-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B010D971161
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 10:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83C01C20159
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2024 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB641B150E;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I89bNYGM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4881B14E1;
	Mon,  9 Sep 2024 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869536; cv=none; b=IgCJj6mTAftE6H5G9b7J4ckkllV6U1KW+fvycrZ+Vo+kzd/w91pMJowr/jFgJ8JureN0wWnyu+kk5IGqxAplhDu2mrbJOKFiDX6pqeGAOtnZU8eAQm92XwuZt/jFraFavKd75FCPfwCQvH5zv6wGxqYxpYsaxTKt71c2+3GWpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869536; c=relaxed/simple;
	bh=p7ruUPyc+63NALcCZNunH+Nk2cdQEW4DXh1uDsweETM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kbjkdjh5hlFtJfN7TOWta7n2iXshoQEYHLGtfgmXc8S6/dhAjbacUeElSQAwwZYWiXUD/r2rkf5t2ua+9GgJGKViCC24TN8zg/VvuF2ZaPdf2BCpLXpnPccW4v/a6h9ol22yQNHRYnhYkKqGzudAiqTrhktqKSQbRUUbHOibvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I89bNYGM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0755C4CEC8;
	Mon,  9 Sep 2024 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725869535;
	bh=p7ruUPyc+63NALcCZNunH+Nk2cdQEW4DXh1uDsweETM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I89bNYGM8bVezteOeUadW2xIs91Aoy8aTtSJBhZh653I2wYd/WlJ+Ew2txVW09n8h
	 fZpinR9bDM4HVzX9iwsnU44/9MJZbFaLK2ED9zxeib+ZfVaQPil6elDKktz8yiJWg/
	 K9R7U+nAS1JaiCNrtOPuYKeeOJpsZvFpBH1rNpJojWIZoLs62o2uDMbF/5K0MljK+D
	 9UcDxiBMCnYagiGezatO419kA9dnhcSkNL2qHKIR10ly3V9xxvGMloe+pq8p4LKKTy
	 RxqbsrfanIG8CiybZ0p4ysc0hMhiveDpMiWq9ghuGHB5B6ifJ2U94P9Z9qX3c0MIQQ
	 UVeMIs7lFgZAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA43ACE7AB0;
	Mon,  9 Sep 2024 08:12:15 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 09 Sep 2024 11:10:36 +0300
Subject: [PATCH v12 11/38] watchdog: ep93xx: add DT support for Cirrus
 EP93xx
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-ep93xx-v12-11-e86ab2423d4b@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
In-Reply-To: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725869532; l=1193;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=JD3ei7UZOSn3iRCJWHAn8GIoBZ2EOdmGr+0MVn+KIfc=;
 b=VdHyekpSAgOidVHG/NnB6pcqR075E8KrwtpU358dFsITTIaDDUVLKjCTvMM6HrJwB/an34f/68mP
 VgsL4qRbA5bzAwup8erxLFRTUTaKZGrq0IuZ0K5Q5KyHhdgdkGtb
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



