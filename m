Return-Path: <linux-watchdog+bounces-1081-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8A8D5AF7
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7467228713A
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 06:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1420881AC1;
	Fri, 31 May 2024 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ilqyjpTI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB08172D
	for <linux-watchdog@vger.kernel.org>; Fri, 31 May 2024 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138676; cv=none; b=TRH3T/giVjdyP84gbQ6fIqLMPs8vyWsqzelB3hXtQzmLSspuopPet/4PFSlr25filXvW07k6Q3srcTpAD5sXtVgfN1avMcaC1Y8VzB2vUQWUrz1mW0ia/ft092ObDNJapdvcxuBxD5iohv2uvCZH/inurODr0ne9zehqIUQw+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138676; c=relaxed/simple;
	bh=QNI4I8AW10XPJRqf4xYm+3JD2Bn1LzmR2dsZ8CEcNFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sLnAxAY9gjc7t5HIAaakkF/P9m4flMUPKozmankirCzyyNpcr7HDaIQfpkqWMVWq2FDLkL5s98T/7Cg10NW2ktTMbwRAeZgoXNAiOq0A6HMcUEwjKLP7YLS2IJ7F5PC5Xme9JbZ1b9nNp9vyIQkx8p/G+6dHt4J2MZ04DsAXrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ilqyjpTI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a352bbd9so266993666b.1
        for <linux-watchdog@vger.kernel.org>; Thu, 30 May 2024 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138673; x=1717743473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTnNIdPVJtOcfxHWJQRC3fErEAL3V9W1LcejJc1adKQ=;
        b=ilqyjpTIiEwwwjH36Kay2OzT4TWKMFLZdx34JSntXuNgmms9ErsilfLs8htLHgkL2J
         95s9dHwa+Vc9Dpi5NL1FKzta5aDGc52KBVMIajXPlzu+NznWXZ2OQzVhS6CJ283CkWqh
         LhNLpCvaFSegCALiAiKvF31F41BHucp5D0j2ownVk7fD7B9XJt3GD1or8bgh+G2IAu3c
         qUx5XL4M018hiMfkq2n6muilX79o4x0FcuH3rgnUlfCg4O1icXgQ4gdZU5KLmqwj8Y+f
         bSrMq/8MIzuuROJQa4UCR4oVc2vGeQQ1DMBtYnW1+PoNGcWS51EaPNT+z7WZYvUm+GOV
         RFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138673; x=1717743473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTnNIdPVJtOcfxHWJQRC3fErEAL3V9W1LcejJc1adKQ=;
        b=LJXtNh6U6t97jasSNEtcfK/qPLhh3jQVymuwdHh4PMUIzB/WmUc4yS8zSMXhPQtHjH
         WzXpl+4oMvp0eCUqYu7RPLUT4wK4GkfpuSQH2I5md4LxFo+PQhYcpfIiC6NnbIzM6JVv
         cY97Z6zqBfynScFLHJMpyGFxSy739ynEg4muMSYeRMTjo3+NIat/XSWLsm/3QXVRE5g3
         V+dyCKqV5hE6TJRw9A8soDG6ZJA1PcfYWoC8UVjSAhBbFamUTnudzKqHpQFQpWr06HYy
         UHt4FuWothLBN5H2TzEH+EBKLiHB+0CW9RwsG8b+T2eiWB1T3kmEwt+KRyfY9t5LlC67
         d01w==
X-Forwarded-Encrypted: i=1; AJvYcCUrG0fsB68JUSngKuHVvJfuEYIRkA0tMGX95D7m6XSdSOzqpOczWQIqX730Npirj1acsAQua04NJMKYysN2xCXRfjy0Ieo9iUdBrUDU/TY=
X-Gm-Message-State: AOJu0YzoHLb/lX7cmwvMNrXy3ZLvdJ2lOHLN3rE8OxM9oC3PcL4TH9I/
	3qijJTbYBwPGBdenRwLi+/e7rVKMuES7UqAICkDrgomzy84sYTOlLoB5rD2ahI4=
X-Google-Smtp-Source: AGHT+IGXqRiZB43214AO4T3c5TzVEbgzTdXXyD3rzilxh2DoJekYOKbhfKEhsusntBESUZqDGdRF1g==
X-Received: by 2002:a17:906:4313:b0:a61:7f85:e31c with SMTP id a640c23a62f3a-a6818c46ef7mr85032166b.12.1717138672817;
        Thu, 30 May 2024 23:57:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com
Subject: [PATCH v9 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Fri, 31 May 2024 09:57:17 +0300
Message-Id: <20240531065723.1085423-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tag

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- propagate the return code of rzg2l_wdt_start() to it's callers


 drivers/watchdog/rzg2l_wdt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 1741f98ca67c..d87d4f50180c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -123,8 +123,11 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
 static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
-	pm_runtime_get_sync(wdev->parent);
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
@@ -150,6 +153,8 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 
 static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
 {
+	int ret = 0;
+
 	wdev->timeout = timeout;
 
 	/*
@@ -159,10 +164,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int time
 	 */
 	if (watchdog_active(wdev)) {
 		rzg2l_wdt_stop(wdev);
-		rzg2l_wdt_start(wdev);
+		ret = rzg2l_wdt_start(wdev);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
-- 
2.39.2


