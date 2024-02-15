Return-Path: <linux-watchdog+bounces-664-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10258856578
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 15:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5311F263B8
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 14:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5098F1332B7;
	Thu, 15 Feb 2024 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a/a/Aimq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C21332A0
	for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006151; cv=none; b=bchB6sUG4puxBPU+YJIfHN56gwyyPE3EOEYnzqH+B/Nyl3kno3zr9toFcqTZNtgwIDHujKeQoTiIlqG4PmmCCy4jcvEtn4XbxJXZPwoBFEfQkl3AaUodxhPHYteqMMjTz9gp0ETKVf++Y/yNAWjMegEpti1KWLUWQ4ERfZWTGyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006151; c=relaxed/simple;
	bh=CtaxfqFvOxEXaO7d0s21hxfy20LkQ7KUXiXAGRzmMlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IjHQ1RKy20lSTa9RTLB4+c1j96Fne6k7FgLyuw/E6aPdO1h5XHWzMvyUAfe192M9L0aiQuLVn2tw72q5/z5HO637LtkGWQxoIZWOmdwyu/T/xT0wMb1GxaN6lYMXaF+PG9Pue2nzCKHCCVNy8K+cl9Fyu7vEm2Veff4VFJYMQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a/a/Aimq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41222a56492so3155805e9.1
        for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006148; x=1708610948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQB0tXSAMq9qhOZv6U9//5OYMEGwVG4X8UpJn23TuJw=;
        b=a/a/AimqQQNl4mXu2OSqqEzWKjIp7NScqQk2VJ1DLGj4msBKLfw+OV1bjvceSfNWhg
         y4Hr1kKpeHoKUFxiCsdE42/uUipSSsFa6Kc6Q0Z+F0affDNIBswqGawc6jqCigpwOhYE
         bgr79RfxWJUqTwnB+/9MoL5Qp64lMXmBzdPDJ0JWbULqqZtoWvuF+GxwH5Yhce0a9wQ+
         OI7U0sC/74eaPbSNEdJUQIEVQham1yUjqsLe8aEWN8NWRRgiS3tHNXlGHDSu0ENNZBU4
         VbuFNSFPlmfQZjHosqXLvTE4RM03W3DlCPOqKC55Mj/NQvsGADupMPZZqFgY98DxKCWQ
         7IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006148; x=1708610948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQB0tXSAMq9qhOZv6U9//5OYMEGwVG4X8UpJn23TuJw=;
        b=OQ4jiNEWFsgvr7A4j39p3amaBz07UrbjrEWff+B/4aoNlV8bayRnjd7ssRBZ+Z9OE6
         QzoYU1GFSJeM5WfCDb9AkH9V0zzsqtioXHz9/o5DpVVXXz3vWuVNbLYpROo0h5kRvtxq
         7C8/7BdzSks8MtQN9Qq/ffnD3sZx/V1TVBbqfIWYrQEaEv2l9JH0YSGzCfXNHjb3aF0p
         12PcPCKWHF1NTtgVqN0DRHCNZBYuh7SnepjWZdvWCQM/53tGRvYQ3zCdau3T06X478zn
         4AUpwfWNrIe6nkX60ymTPWq6tu7KC67x7k57Yt7FMkVnhbNhiemB9wbg6rl65xtzolnt
         gofA==
X-Gm-Message-State: AOJu0YzMkw+LL6olaGSzeka9/N+ONk7VPQhfLOHihte5ozLPgzs3XCeB
	ywjzo+bh4jVPhQ4NRmMVMOd7Ey++ydfgJywsmEakCCEpFyJIptB5VLtqW/NtB6E=
X-Google-Smtp-Source: AGHT+IH3hO7v43Mth4zsiFxwawqd1IixO8F9H573SmAOgreIUNJhNBmn8EI3K4bHNFGQ/GYSLLaNdA==
X-Received: by 2002:a05:600c:4448:b0:411:fceb:f61 with SMTP id v8-20020a05600c444800b00411fceb0f61mr1551163wmn.24.1708006147836;
        Thu, 15 Feb 2024 06:09:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:09:06 -0800 (PST)
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
Subject: [PATCH v7 7/9] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Thu, 15 Feb 2024 16:08:39 +0200
Message-Id: <20240215140841.2278657-8-claudiu.beznea.uj@bp.renesas.com>
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

The reset driver has been adapted in commit da235d2fac21
("clk: renesas: rzg2l: Check reset monitor registers") to check the reset
monitor bits before declaring reset asserts/de-asserts as
successful/failure operations. With that, there is no need to keep the
reset workaround for RZ/V2M in place in the watchdog driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- collected tag

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 39 ++++--------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 29eb47bcf984..42f1d5d6f07e 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -8,7 +8,6 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -54,35 +53,11 @@ struct rzg2l_wdt_priv {
 	struct reset_control *rstc;
 	unsigned long osc_clk_rate;
 	unsigned long delay;
-	unsigned long minimum_assertion_period;
 	struct clk *pclk;
 	struct clk *osc_clk;
 	enum rz_wdt_type devtype;
 };
 
-static int rzg2l_wdt_reset(struct rzg2l_wdt_priv *priv)
-{
-	int err, status;
-
-	if (priv->devtype == WDT_RZV2M) {
-		/* WDT needs TYPE-B reset control */
-		err = reset_control_assert(priv->rstc);
-		if (err)
-			return err;
-		ndelay(priv->minimum_assertion_period);
-		err = reset_control_deassert(priv->rstc);
-		if (err)
-			return err;
-		err = read_poll_timeout(reset_control_status, status,
-					status != 1, 0, 1000, false,
-					priv->rstc);
-	} else {
-		err = reset_control_reset(priv->rstc);
-	}
-
-	return err;
-}
-
 static void rzg2l_wdt_wait_delay(struct rzg2l_wdt_priv *priv)
 {
 	/* delay timer when change the setting register */
@@ -187,13 +162,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
-		int ret;
-
 		ret = reset_control_deassert(priv->rstc);
 		if (ret)
 			return ret;
@@ -205,7 +179,9 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 	} else {
 		/* RZ/V2M doesn't have parity error registers */
-		rzg2l_wdt_reset(priv);
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
 
 		wdev->timeout = 0;
 
@@ -297,13 +273,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
-	if (priv->devtype == WDT_RZV2M) {
-		priv->minimum_assertion_period = RZV2M_A_NSEC +
-			3 * F2CYCLE_NSEC(pclk_rate) + 5 *
-			max(F2CYCLE_NSEC(priv->osc_clk_rate),
-			    F2CYCLE_NSEC(pclk_rate));
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2


