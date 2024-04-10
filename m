Return-Path: <linux-watchdog+bounces-907-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F689F8B1
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 15:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40E2E1C24A9A
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0828616F0C6;
	Wed, 10 Apr 2024 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="caoRt37Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1816E87B
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756472; cv=none; b=BMrh893dvBjBleJUAemg0zF5U1XYjIk4hZTkZkLbI7ntHfeN7fpTEwSVpDi2KV+g0DPb1g/qqPn1WWX2AiZbjXQh27OiEakP67JI/iMLjudIprEYJBp9M/O+w0Oo8KjVzaF6eszfF+PRh/CE3SpEP1KTd/1FLUIguXbCHywn7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756472; c=relaxed/simple;
	bh=2iaYjthGV+4YN90lhEWZi3Roao8D27ZIeW/fg1E7/vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PmunoyBOAr8Pri8mWj/jm+yzJcaByACHVjr6vvPgxIBFoLHZEV8dT21bAQ7/QaTEa+HTmB5DFczyvW5GQYR/d0E6MyGoytf0u2+va7KNy6wx3DAFyJ2+ErHpi2PElWudX+3O7TzSFQZlWh2xcMPky4THHL6wcjJBE8l5/00uqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=caoRt37Z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516dc51bb72so5277924e87.1
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756469; x=1713361269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=caoRt37Z0djF8KfUzlX902SDNH6iaLMT/OtD8W8Ux4RehUn1Rwuoc24qdWA02FCMQ9
         0M8sT+CVwuWpr2K/ka7GIY+pLaBdBo35zYFFNSlD0W38GUEtzkVrVB/SB8EyLVF4Gjsr
         YEw7b7SFlg8h1REdt0UGAPzDEABUMYW7qhv/riX+hotCwPYW3pNoNrfNuoOuNK/ZTirn
         2xnhB2F1zdoB6hPZ7PcMMF2Ql5ICtuJcHngmXBGw3ujhw2D02lVlCX1QsysnrYzRYv6H
         lbI70w4Soh9sOHBca8NCUICct5IwVC+MF09KZS2Y2IJzEEQ+L5D4/eIVBKaWALZEFcYP
         LBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756469; x=1713361269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=PuMFRnwACWVrfWIb7HGCCBo7L+AlwLqEPkopnyvGUDXEV/B7r8JFgEbIOIAcTPoQcy
         KP+iJmYZQ7hqbZNpnmosgfUU+Yro4ct4js4LZo0ZC6N8vLB1C1RDyJNGNRgt+jdqPQt1
         Dbo8XRHD6d2g66SOSJWrUHhWDJ6VSBFyZH4/1MGJ1XiQRGgHiF7kwaj9Ybp570Oftk+R
         s89ydZk32wUeB7M/0Oea2KkAXQwyTUhXkJts2HeaQOaHPweFpQ1+iVpXNrBAFEO8+F76
         DoW9V6owacJ6v3VuQ2gaM5h9H0AvaAZy1wMhcOMxXY87AxnR+p+EuCdN9eIpv3EVsDjo
         YTwQ==
X-Gm-Message-State: AOJu0Ywv1aSxvICB6aQcxCwYF9aK4hrPl6fzJwtLWfrzpqhvFn6OkJxt
	cT4wmpu4omc60+oWCp0yHFtZV9RzB4l/VihnFGCr1hK33QpacQUfdou7V8eUoCA=
X-Google-Smtp-Source: AGHT+IFw3OPj12yQhGQYtGjHjUJu+zlht0FnITQUI9YuzbYxpNGRAMoUxZ9v7Lyr4jpHJCf2By7hqw==
X-Received: by 2002:a19:3847:0:b0:513:23be:e924 with SMTP id d7-20020a193847000000b0051323bee924mr1631343lfj.59.1712756469308;
        Wed, 10 Apr 2024 06:41:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:08 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH RESEND v8 03/10] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Wed, 10 Apr 2024 16:40:37 +0300
Message-Id: <20240410134044.2138310-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
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


