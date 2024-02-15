Return-Path: <linux-watchdog+bounces-660-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B721F856576
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 15:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 919BFB24EB9
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 14:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA87A132499;
	Thu, 15 Feb 2024 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QTx1k99F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F2132485
	for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006139; cv=none; b=RWeiB64KGMAunhMxL6uCQhb3plVZwmbH9i+yAA8SRVL6L7r7jkyLA/s6ezwuslgMddqYnPn2Nlbw6a9bP9SsNVFW4hwHwJKTx1JuE8pONI/8x6s2PJeshYR38+QhA90YtGNBhoAdolj7pKDbNYmhK1zOBsp8k2mYFZDLmjI2dEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006139; c=relaxed/simple;
	bh=9Jwy7vJI5ODOPksp05cnDniLiewbXp5lAtvWL9ntsAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H7GZ2pEgWsbpV0mPYs/1TBSL5wvNKvEEthfGaDHtb+8u13LYGefjTy78fAm/naaD6fF8NzRl66QJ+APNG+kiC8d4YRr2K5UFhCaU0tY45se9HsAeQBJL+dqcxGb6fX3I/k/L9hcNykN+l/JP1eZn3tQN9eyAt7n6FGhPn5q+i84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QTx1k99F; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412078e983aso7175715e9.1
        for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 06:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006136; x=1708610936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0o0NMGUN/UniJ6MuCNhr85tN7d6iE/+DXKd4kchRTE=;
        b=QTx1k99FmbEXpqnR/CeCy8I8WaOr/MYbrTHfPSV8i6PX6eI083IleARiyPVOVqSDsZ
         2keUACrwvRzAE71arv5idak5aLVWhAdACQd+a1vWNB7sfO1W1oy5XVgYQplQ/ZcgVM0R
         XjgKTmPZibPNV8Ua9VFIlMAuvsX/B39ZZtWsl7G8u6b4cDWUYZ/taRrwH1sk9GuENF2O
         R9s9PETYcW5AP8yDlj++79/6m/WqGdXwcxb6tDxaNqLoKYvbHE0Rw1Rw54AM/84t0wlO
         bQzQFFT/wJxZRdcqR7KYPKQF0Ns4uOJDV7RPC7dag+a17tBS6vNb9WxjZWfat8Fx6kkd
         t18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006136; x=1708610936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0o0NMGUN/UniJ6MuCNhr85tN7d6iE/+DXKd4kchRTE=;
        b=YdOz8ZYlfZq7DK/DVp9ZyNjAUhCTx1nF89brELS0kPMp0UbYvdIZkwC6gXYw9ugywp
         skNmjzT/PUVAVkERLqeG5m1Ho7BKs55/dtEvfrAqjUDq/0rziY4G6DixzweJKfnOFsxk
         Wq9hWRyvrYPwfMdEodb9M+ucGW5CYByPx2/cUxRdL5W6YO3l7TVUASOuu+bHwfH2HO0y
         3R/MzHwiD+Y/CsvDuZRY3tTT2RvGCZWYvBmb+oxM1pd5E3jT/csnZFZdMSJ/1BpmwTqR
         HTZL1z9Kdb8mIPczXOsN7BnStg2b++VZSIb5zY+wSYp3fQJiZVTlXkvxmmBhrmxVhT9F
         PGuw==
X-Gm-Message-State: AOJu0YyAKTeRYLxfkkZDBaPAcb+V9z9vg/r+a/kmm5zrbRERYbSOAnIG
	ZxUPEe9fJNJmDpfZMQxMCPI+Hg7QDihZETBhG8HLElyxVM7ElYiiaAvbcIqeBfM=
X-Google-Smtp-Source: AGHT+IHfMDu+MrnnznD5BocXY19Ywcb+sbh9aqv7QAh5kf9/cSqVt1i1l0cDZ3QL5PmIQKJzOwj+/A==
X-Received: by 2002:a05:600c:310f:b0:412:bf0:b1bb with SMTP id g15-20020a05600c310f00b004120bf0b1bbmr1541822wmo.18.1708006136563;
        Thu, 15 Feb 2024 06:08:56 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:55 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Thu, 15 Feb 2024 16:08:35 +0200
Message-Id: <20240215140841.2278657-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215140841.2278657-1-claudiu.beznea.uj@bp.renesas.com>
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
---

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


