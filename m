Return-Path: <linux-watchdog+bounces-2079-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1D99102E
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46491C2393B
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A961ADFE9;
	Fri,  4 Oct 2024 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YGjug7l9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933231ADFED
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Oct 2024 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072221; cv=none; b=TEPG6Sq5kBe5fHubVv2HJk2+5c4faVldZSiGe1Hc0DTiBNsJPLuhAZ2DUUOSrHPmkSPdqXPKyPSe9b4OYc3uY4AYexRN+yy7DXH4vL5UWaRyIxo+6KxXs2zb69gGgEBJ5xq+P5rW2jTeAI6G01bYvLt542Y6iZKsb1bsRQwYCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072221; c=relaxed/simple;
	bh=1VbOuVrBLoDitWvbPcMb+uJr0WI3nfXPQ8KbpuuU8GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvY/yQ3pms1OBWXR9LjbWLHWmx1/cVqsG8rsiok+ldr9ozKr/anA4dn4LSStEweMHIuo2hKtiRiLRqZ7NY5MjzJw/5ck/EaP2GWHv8gvD6yVhCw5Okx2OaYVMJA4wct5UFEM/z0y59BfwgrCZXqB6qWcUi618y39Oxw9qVlJqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YGjug7l9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=DSs5rskZIk4QJWwLq5RQTfcN84JZcFb1gGId9SdmcMg=; b=YGjug7
	l9Mss9duq+4o6Z6bbPletEFvt0VtXqpssggQ8/82wTEFCHSyVmvVU4wTrMJCaEE8
	du/MwAcsz3x2EpA8GasGqUW3x4Hn2AsFLp90HtZcJJOFg40/0XpFxO7g06Cc5NfE
	n2BWwyGUEiLoGZxBo/JY5wumz9A+K6FhX3/ifX54s9noiy//Lrza9qA1MhG+yVdN
	sPQJxbp2RkCzFSFhm/KuUdZK9MBu3dAMFoI2Hl7alPiBeqQGOfHjei9YYulMR+gx
	tooRJZgmrt0WG4hCrKFWm5JGfPuFHi4ITBn+56ULkWF66upt8Xgwp6yu6K4Di85V
	0Bd+Pf2JvKnXHGzg==
Received: (qmail 3546629 invoked from network); 4 Oct 2024 22:03:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2024 22:03:37 +0200
X-UD-Smtp-Session: l3s3148p1@uT6gKqwjRpdQvCeD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 3/9] watchdog: hpe-wdt: don't print out if registering watchdog fails
Date: Fri,  4 Oct 2024 22:03:06 +0200
Message-ID: <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
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
 drivers/watchdog/gxp-wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/gxp-wdt.c b/drivers/watchdog/gxp-wdt.c
index 2fd85be88278..f2c236160266 100644
--- a/drivers/watchdog/gxp-wdt.c
+++ b/drivers/watchdog/gxp-wdt.c
@@ -151,10 +151,8 @@ static int gxp_wdt_probe(struct platform_device *pdev)
 
 	watchdog_stop_on_reboot(&drvdata->wdd);
 	err = devm_watchdog_register_device(dev, &drvdata->wdd);
-	if (err) {
-		dev_err(dev, "Failed to register watchdog device");
+	if (err)
 		return err;
-	}
 
 	dev_info(dev, "HPE GXP watchdog timer");
 
-- 
2.45.2


