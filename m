Return-Path: <linux-watchdog+bounces-1961-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFEA97C167
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2024 23:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E981F22118
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2024 21:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C3419DF51;
	Wed, 18 Sep 2024 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="2RTVmVRr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CC18A95C;
	Wed, 18 Sep 2024 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694977; cv=none; b=jRWXrGH8Z+MiG2gQUq2mfJNc1epHPoTNZl+1ylCMvIeiGtFwK1Ve7ec3n46p4fcgX4q/1e786tB3n+P514rxFivvFF15OEfpqUAxMuiEDJ/1RcUSW7z9Wpl0wdPH3b9nrEHPs6kft7lYlQJhM0N7FUMiqUeexdIRdVUIJ8Xt8iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694977; c=relaxed/simple;
	bh=djuj7d+S75J6vb/tqwefg5muiJ+vFt4qii9br5bwWFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DrVN3nj1uh5f/sS4T9rATbpmrjOAcNHxSLbpSYmAxU8SxvqRW8vL0RLzPuSbewmasBZOTEc6LSQytMAaPYlJDn9tfYtlJQsBHfp65GU/KgerKI4M+bPKcQkSRHXAEStZZiareH43aHZj3DZm2Zf1ZfVr6hs2uk2CQ1CIkSxG+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=2RTVmVRr; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=m0zb4s0l/KDjx7wazc9LAz7ShpBy107GIK0Y3rKSEfs=; b=2RTVmVRrWdA9NqvZc/uOTpuj7i
	JtFY38SdbUpGSX4v2NxTEvRBIj8HNCvYM7o0rOcUehlUiDvL81FE3t1odbfTN9qP9p4kQxy9v15Fd
	g4JuEgH1Tx52f3ACee9SDFlAqOESM6ZwyRWs9c+UTaLyu7Rzp/GQl6H+PEwLtGITmWZAlKgDH0rVj
	0nAVIwGxVmPcYwmqsBNeV2Nu01qxf312K0KsDV1yFlTGfAXAUPaJPMG1QWkx/V7snqhUjcreleebt
	sKHnpvkgDhOdeC5QUxluq/Ny4OUSR7Hxu7AYpVZJI6jD5zhWkTvFH6rf3NtZsq8+aQ3ihqytVgl3H
	hD1HD/SA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] watchdog: rn5t618: use proper module tables
Date: Wed, 18 Sep 2024 23:29:25 +0200
Message-Id: <20240918212925.1191953-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid requiring MODULE_ALIASES by declaring proper device id tables.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/watchdog/rn5t618_wdt.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rn5t618_wdt.c b/drivers/watchdog/rn5t618_wdt.c
index 87d06d210ac9..97ef54f01ed9 100644
--- a/drivers/watchdog/rn5t618_wdt.c
+++ b/drivers/watchdog/rn5t618_wdt.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/mfd/rn5t618.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -181,16 +182,25 @@ static int rn5t618_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &wdt->wdt_dev);
 }
 
+static const struct platform_device_id rn5t618_wdt_id[] = {
+	{
+		.name = "rn5t618-wdt",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(platform, rn5t618_wdt_id);
+
 static struct platform_driver rn5t618_wdt_driver = {
 	.probe = rn5t618_wdt_probe,
 	.driver = {
 		.name	= DRIVER_NAME,
 	},
+	.id_table = rn5t618_wdt_id,
 };
 
 module_platform_driver(rn5t618_wdt_driver);
 
-MODULE_ALIAS("platform:rn5t618-wdt");
 MODULE_AUTHOR("Beniamino Galvani <b.galvani@gmail.com>");
 MODULE_DESCRIPTION("RN5T618 watchdog driver");
 MODULE_LICENSE("GPL v2");
-- 
2.39.2


