Return-Path: <linux-watchdog+bounces-2084-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0359910D7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3A10B31B1E
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174721AE002;
	Fri,  4 Oct 2024 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YOLn79vd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03C1ADFFC
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072232; cv=none; b=o0xI2K28XTG5E4HBsGm/9MFM4ve8ev0GHYFzDdTvJ5qhDp1k9JyXsOc1aswalc8GN5LDm4nGu2IlnkvgwiH7GhysRmuRKDquRr7E9bUevfTGKBhxQu3kolOlGjILJmxHYpzufdp380MEgoR4GfGdn3vowzwv619+fYH562khQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072232; c=relaxed/simple;
	bh=EFA5+oAfC+tqWx38wFdpazJlQnk6Rv76vo7d5ybV6uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXmUg+E28RHZUuELvvc0Pv1zcknuGuWJFCS9PMK/NjaM+maiO+DbDT7CVEsII7AJUFFsY8a/hkHDflA00/YKBHCBh2HXxRJkgjUJi4R8Ruy3ZxR0tXYMufKsgkHL+MvlkAvl2frfAtHv0C+Fv8+AB1c5XSx7UUdz8LFOROPCnUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YOLn79vd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VxebXy5udt+8omjEbWXj5+9gbyAVtVMHmk7sk/VpKcA=; b=YOLn79
	vdVAbzd1wWOHeESU2jJB44uz7RmBpW+5UExvyfQ6pKhqJMo4f3VvjKMazKuPGy64
	Lj4EQnTKQVpyb+BYYAD7C9k4u27icnBSrt8jOeKX875uLuVkolgI0c7CvdmYA9xH
	mrY99dF0RURyLk8i94EbEWa9PGCqnNd2H1o6DHbrEz42QiF5YWtSZxwhNUYbT2U7
	J7nKvssLjHiasqO82TvMGXfD9SDoDIGSi0PmfDuaOM6VxL7bK9PBApa5eVbqk1py
	oiHEml83ONZfhMEA8PdBQKmSyxgTGof5Q/+CIexXFBLQ/kbn8ivVDHvf9VJ92wfK
	W9AxpJV7AT+ig+iA==
Received: (qmail 3546790 invoked from network); 4 Oct 2024 22:03:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:48 +0200
X-UD-Smtp-Session: l3s3148p1@JqI4K6wjTupQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 8/9] watchdog: rza_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:11 +0200
Message-ID: <20241004200314.5459-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core will do this already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/rza_wdt.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
index cb4901b3f777..9334255a37e9 100644
--- a/drivers/watchdog/rza_wdt.c
+++ b/drivers/watchdog/rza_wdt.c
@@ -169,7 +169,6 @@ static int rza_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rza_wdt *priv;
 	unsigned long rate;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -218,11 +217,7 @@ static int rza_wdt_probe(struct platform_device *pdev)
 	watchdog_init_timeout(&priv->wdev, 0, dev);
 	watchdog_set_drvdata(&priv->wdev, priv);
 
-	ret = devm_watchdog_register_device(dev, &priv->wdev);
-	if (ret)
-		dev_err(dev, "Cannot register watchdog device\n");
-
-	return ret;
+	return devm_watchdog_register_device(dev, &priv->wdev);
 }
 
 static const struct of_device_id rza_wdt_of_match[] = {
-- 
2.45.2


