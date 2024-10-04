Return-Path: <linux-watchdog+bounces-2085-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E313991038
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227FC1F23CE3
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9800985628;
	Fri,  4 Oct 2024 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mRuBhjsk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62521ADFEA
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072232; cv=none; b=sef5mAyAt/w1aafMYpSF+VjKAMZN2qx+GA+AUkIyhqO21mZyLXcK6dKNqeFnXf+w0YE4inQKEGYP/Q1HOu4ykw2N2yLrRko+ACs6z53Y24gZLZmsxD2svhEwHtFInIkM37Zc6sXu2fL/YqT2Swr0r9Q9NrabvWV3btaVdkKN8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072232; c=relaxed/simple;
	bh=rBInPXtWuBQ4AHJslC/F5W48iy0TYapD5Aj5IwigVo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJlnO4Ra+Bwx46BxT5dM06F6ogWFIE67VQg/uT2zyjs+/IaBpMOb5ipY6NnTwnTPynYEf/PC3sN8YwGgJ9SAVV6V6Xlum1xsAVw9yUN/U3PWBK+npzJISNLGVGKms8hAXtRlyGCJmz5XUz0mtS2AkwELb39QunoMlcI7OwDaA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mRuBhjsk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gTxP5fWPGq6PqfmNQsPw7YozPJO1aVYpT4zwqO+84K4=; b=mRuBhj
	sk4CTLHe+qUJq457SXyBHND68GHvwwb0UfH7tEH9Masekr4ldx5MC0+dQGMevPJu
	2bR3w/DCfvnx50EU14iOd13jAOYHsHEMOAkxYzdxNyJDhlBnpfbfanVdjjJCGBU3
	srQNsBFH4ielPaiehHBWdJxI3XV5CqASNLYtvtLbHf2wvNS616/5BZdRu/zvzTi8
	RTqP1Am6CqBCjqUxcHjoxvAbCmV1shs2QzfmPvtYlXBC2MTeY3bBtihQ0wlqhIQS
	oXUQbbQpCrJKEsgAwgDaxqH5+AaHJub/ajKVH6pDq0FuL3WSfQWm48N9LI1E1lSL
	ZFzigz7HZeBO2ppQ==
Received: (qmail 3546819 invoked from network); 4 Oct 2024 22:03:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:49 +0200
X-UD-Smtp-Session: l3s3148p1@TkpYK6wjWOpQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Walle <mwalle@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 9/9] watchdog: sl28cpld_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:12 +0200
Message-ID: <20241004200314.5459-10-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/sl28cpld_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
index 9ce456f09f73..8630c29818f2 100644
--- a/drivers/watchdog/sl28cpld_wdt.c
+++ b/drivers/watchdog/sl28cpld_wdt.c
@@ -198,10 +198,8 @@ static int sl28cpld_wdt_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_watchdog_register_device(&pdev->dev, wdd);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register watchdog device\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	dev_info(&pdev->dev, "initial timeout %d sec%s\n",
 		 wdd->timeout, nowayout ? ", nowayout" : "");
-- 
2.45.2


