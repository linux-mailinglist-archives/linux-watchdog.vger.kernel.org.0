Return-Path: <linux-watchdog+bounces-3994-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF52B25397
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 21:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8F05A20E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Aug 2025 19:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9159C2BD5BC;
	Wed, 13 Aug 2025 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Se1X87sH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7592BE63A
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Aug 2025 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755111946; cv=none; b=OdtRAjuPcVmg6gALfHolLoeLk/nwCYJL3IyNUX3C7yVfX4s/r6NzE6Ks99ru/OoIxT3D2Cxhf+4JTHZQ6PA3jXT4iKvj/H87xhkwK/wkkopdu0SSJ0DuN/2SbAuSPTlxQI+ALOTdp4edVuXu/fCsN4GFOqyWQF9sYdL1tOhAcfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755111946; c=relaxed/simple;
	bh=dIe4wwUoQkeoJW8Xlvum3bTxKw2QSOPV6VrT1ovFg/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAErXuDowjgaiXz5VrfX9yFqBL7Mr5ErLklUnWbvQcXkTna+udLqpFqnqqHQXHecHZgjlnyw+nwpWm6zTPsbZW1xa5+ChPcf2E7oKc/ixVrrqnJmMN0qHZtUzV1JdL8BdVUw9KewNAYcEDp1vnffflsMgQnSRnB6uBchtvuFf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Se1X87sH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Xr4jZtKnFjMUAbBvc0J6ZMyid73qplLjBCG/b5WSXgU=; b=Se1X87
	sHe29QiTNvYwgUwjAVAibtOVgyl3GqExM51y+kl/rkCFYOGM8aSqCPwnx3hYJP8s
	Loggd890CuqMl5i+9vKJZLM36eTPhUaG+V1NgUrE8sN4t0hUEswfk99ZeTWO4Smz
	7eZLWLBXn5RuW9P/NFaGin35DXicV8kK89xSyo/a8PxYJ07944mqzbSnxTLWUE4s
	S2HD17fNQj90rgQHJMGDLBcWm2C5scwkW10wCgIyGdKbezEfRYXRhCN9OnZtO/aO
	IYNhAX8ZC50xJkcWLAj2V24D5tQg7+kpn517wAqEq8+x+dLo2PZcOksozSBFTkRr
	vxCEJ51fS36HPifQ==
Received: (qmail 732707 invoked from network); 13 Aug 2025 21:05:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:42 +0200
X-UD-Smtp-Session: l3s3148p1@g37O10M8lNltKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/3] watchdog: rzg2l_wdt: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:09 +0200
Message-ID: <20250813190507.3408-6-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/rzg2l_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 11bbe48160ec..1c9aa366d0a0 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -310,9 +310,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(&priv->wdev, nowayout);
 	watchdog_stop_on_unregister(&priv->wdev);
 
-	ret = watchdog_init_timeout(&priv->wdev, 0, dev);
-	if (ret)
-		dev_warn(dev, "Specified timeout invalid, using default");
+	watchdog_init_timeout(&priv->wdev, 0, dev);
 
 	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
 }
-- 
2.47.2


