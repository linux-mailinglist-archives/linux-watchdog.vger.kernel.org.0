Return-Path: <linux-watchdog+bounces-3996-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CBB25398
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 21:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6BE5A24C7
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 19:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C7E2BE63A;
	Wed, 13 Aug 2025 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BEJ/kbU3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194472BF016
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Aug 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755111950; cv=none; b=a52GLsKYmEmzK2NPd68JRJ5eZh5M0mwMmR+PuWQWdEkNK/F266vS1Hbr20Aj3dbQfYRQBaSli6XFk4B2fuFQ9evatvLr+jzE1WhyWaQjYrEbVxI2nMx6D6/zNB842pU2u2u6ibiV/a1KfopeFoZvqv56h6wDqYNxRFj6fyz4CTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755111950; c=relaxed/simple;
	bh=XHKlaM/JOc8UJjANnxQ0zIDCY7y2d+22cR959I+l0Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdxBxKTKJ0Ke4B3QWebHNs6/cpJM21y1HOi6hdBK6EW/lx52eCixHA+Yk0Bt/zUNcqNVLBw2wFzk3NKVhSIBhEpDpkE1YHmXcWMerWCwTXT2q1n/pYFUpFHVUW2djfIuCeNhUfLNMeVmmDeKr87EUlvCilXfT3CrwARDCwN2F2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BEJ/kbU3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1oIO6DXz+fTrVcY/k0heIpTBXqUv5vw8f/KeSfHLKLQ=; b=BEJ/kb
	U3eUsMf3CEx0T2tm2blwGgW2LxqEG5Z6+p0r/awH7eGYy/m1IP7VLQMycFBBeaZf
	i+IBrg5XTyjr6cj5h3TTCi7VyoVIdujTOLyWYkzNuT0Oiy/2nnGxhkXkn3ez8ce3
	Ty/7c4+1LzvwxTcFh/RVmqycbP/Cilvx3uRHz3SkL+hhKhtA36og+gqC9AT1KBxa
	3elMd9+qZQuTaBad4nHvxximRnMyxS906XN+7jYbRsj5R6SJGEoAN7GLISuvy4Xq
	pc8vOeuEArXIzORhspb9j91sRJ/oWotARq2U6wL4fqt0I5xmQCXUyJMceMY7yl+a
	kDk9AEROdohpYcEg==
Received: (qmail 732770 invoked from network); 13 Aug 2025 21:05:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:45 +0200
X-UD-Smtp-Session: l3s3148p1@DA4G2EM8tqJtKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:11 +0200
Message-ID: <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog core will handle error messages already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/visconti_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
index cef0794708e7..7795e7fbf67e 100644
--- a/drivers/watchdog/visconti_wdt.c
+++ b/drivers/watchdog/visconti_wdt.c
@@ -118,7 +118,6 @@ static int visconti_wdt_probe(struct platform_device *pdev)
 	struct visconti_wdt_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct clk *clk;
-	int ret;
 	unsigned long clk_freq;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -153,9 +152,7 @@ static int visconti_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_unregister(wdev);
 
 	/* This overrides the default timeout only if DT configuration was found */
-	ret = watchdog_init_timeout(wdev, 0, dev);
-	if (ret)
-		dev_warn(dev, "Specified timeout value invalid, using default\n");
+	watchdog_init_timeout(wdev, 0, dev);
 
 	return devm_watchdog_register_device(dev, wdev);
 }
-- 
2.47.2


