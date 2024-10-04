Return-Path: <linux-watchdog+bounces-2080-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954C991031
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022AC1F23DED
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7C41ADFFA;
	Fri,  4 Oct 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lQw4bbhc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF71DDA3F
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072227; cv=none; b=EGs+HgBrpa4SdJIkoDggOhsD9jpCGZ+8G3Tj1FvnJWPlS3LiOjKqHcqHYYL+nLwVTyDBO8/B4cwUiZNUGFqMlRUpdYATRsTAOucTLFNKlv+UhcH5XfSYmUbkU3ih+aWxuyBTiuLeeZrbP/SUttyZyg++Wq1N8kuSSc+/6+E9hSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072227; c=relaxed/simple;
	bh=pUWXX1eEh0bHkVgo5GPCA8FvemlxuFmoYSsmgQaoquk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tV6xhhtGIMfpCoyc3mKHOTV82iQQYGNI61xlnMRMIJeDSnssfDwUckjl7NWECu5TJGeiCggkzJiMp3aMtnPau3InXlQgyWblMiAjoViIp2kEg0xoKj2gUWHXv3RKTmfTOgq7kOiLYR8RFuWIImb5zt8KxmedCRjx4IvsdfMtPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lQw4bbhc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8Cg6dqgREWhM8nhZTwIK4zog/oTVaoavkF88FB1RjZw=; b=lQw4bb
	hcRLZWFApxlVL7SZMBQ9eeIPN2MjGNd+YwwU6oyket8szWDTHeWP27qfc1tcjjKc
	gTo+3mpb7bwdjqcS+F/rYJHhh94Ck7p9UEMmZI/lLGMKDOOREEn6bkMWrTRKBO1b
	OcIR6O90p8/C80dC8w9OHYOBz2PgZYz/YpDh7FPBRPC8aJ4LCzQ3QMgil5WApaeZ
	4COrNJWqO8vf0nOV0hk2qXAwvRDIeZa9McMJnRb2zt4YVX23KZ2dwPGRTt+RjOfb
	/TZrNHFGIzfas4+ma7GT/sBrlJgdj4w2hqzKye17gD+jYiQ/biraveMUnrzTTuSo
	4tHeLcHdnxi9WtHA==
Received: (qmail 3546673 invoked from network); 4 Oct 2024 22:03:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:43 +0200
X-UD-Smtp-Session: l3s3148p1@yS0FK6wjMupQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 4/9] watchdog: iTCO_wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:07 +0200
Message-ID: <20241004200314.5459-5-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/iTCO_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 35b358bcf94c..0d3c09a82f4f 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -592,10 +592,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(&p->wddev);
 	watchdog_stop_on_unregister(&p->wddev);
 	ret = devm_watchdog_register_device(dev, &p->wddev);
-	if (ret != 0) {
-		dev_err(dev, "cannot register watchdog device (err=%d)\n", ret);
+	if (ret != 0)
 		return ret;
-	}
 
 	dev_info(dev, "initialized. heartbeat=%d sec (nowayout=%d)\n",
 		heartbeat, nowayout);
-- 
2.45.2


