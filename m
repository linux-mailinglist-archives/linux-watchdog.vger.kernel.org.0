Return-Path: <linux-watchdog+bounces-3995-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4772B2539E
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 21:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1357B1BC44EC
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 19:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E8C2BD5BC;
	Wed, 13 Aug 2025 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jue1R153"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10682BE63A
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Aug 2025 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755111948; cv=none; b=p6+YPGDja9H6Q9IquN4R/sIPSmFr7126Uyn/t4Wnz4EqSF5bOrc8AhCMDYHa0tSYiv41FtR96lHE9BawqUyFu9gkNzKNFt8oUYFAFKy5+AiRK3CrQGRT/RSuZkteNCZ8FQRceZ76sZFdrAg7CCMW6U9W2Y+pNy+MvmNFQIR1zOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755111948; c=relaxed/simple;
	bh=KIBX6bmgjQaVQF7nCYXt7G3hbRX8MN++nS1k0J9Gb3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fd3N6XGXnEx0EkCLpJWjdlq26FAqQHr5FKPrhcHxJ+YrGtVOW3zgDan2q3u65JzK8MbvNBtBFfaBs6DSqZHnAnF4JQxm9aWlp25YLrpCSI8VQK/pBnf6IOzvLA3zuCNvSi0yysoVwJTXXlBLB0H90SqcQA6GnaxSqwGBrBbZNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jue1R153; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+vA5rIQnZIxlxwpWCxqSrrJ+PdPl9998rF4Sf6W+R4M=; b=Jue1R1
	53tqTF3QFEooBi79pjzZxmboaeEXDChsI1WvwHzpqJAGl3RG3OZRAzvR/dV8B/N0
	fdSzLQ7YtUnH6eY11MFUKsxJw4K8i4VA2ELk0Jq5DCKdAM/oUB0VXJJG4Kz5iCe8
	LL+vnbGupp955246W8+brcnC1+D+4qw0td5/Cy1wcyh2ELN0mOx5kDSomp25wbOi
	f1qhJUKrFM5zqT9+KDUINpSidXpXsojpVbq2B6RXnTfKhqRqncgOXrN1DJElkx49
	jBF5ClgwG67DhcD4siq5uz3pyA2+Pis3PDk7pVeMMMfSOdmYBfOoyWt3ZKVRJaDn
	IMGS0GXCxfWOdI9A==
Received: (qmail 732744 invoked from network); 13 Aug 2025 21:05:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:44 +0200
X-UD-Smtp-Session: l3s3148p1@IQPq10M8mNltKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3] watchdog: rzv2h_wdt: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:10 +0200
Message-ID: <20250813190507.3408-7-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/rzv2h_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8defd0241213..3035b49f012b 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -247,9 +247,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
 
-	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
-	if (ret)
-		dev_warn(dev, "Specified timeout invalid, using default");
+	watchdog_init_timeout(&priv->wdev, 0, dev);
 
 	return devm_watchdog_register_device(dev, &priv->wdev);
 }
-- 
2.47.2


