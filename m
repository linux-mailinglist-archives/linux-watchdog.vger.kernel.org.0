Return-Path: <linux-watchdog+bounces-741-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1C86AA15
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485881F262DB
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94A8376E0;
	Wed, 28 Feb 2024 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="I1oWmTp+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36C2E642
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109207; cv=none; b=SlNpGBbzOOtmYc3hvZU26BSaLSez7g7f/SvEzfKzsK+3mHBYx0lKEysXwWMKujrrh3YMqiR2tf3wCOCUDhYpwWkqYJQHnEKxIyFwi0aBV6P954Houy2b+CdecjY6KS3n7tG/vvTN4QeHrSRTCEO+YPBnyDQG2bd1D54gxtRWlro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109207; c=relaxed/simple;
	bh=Rdlb2ia/Zc28BSEYVcVdZUAeB+95/SXqjOJ1NOQ27MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d80EPi8l7330U8DqNEJrBFAyKOev9rT5hN/NeQA09lCWA1C8XWHbKMye2DQy7DiuqJsiPm5ggauzth72RSsLlrCUDY9vlysAXJb8X/4piF+3o1pNK3jD/yocVP7dJ4RPI9GveygMVbNtLmU1alcXHxJPykyqcEgjlRJCOs9lCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=I1oWmTp+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a293f2280c7so789711166b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109204; x=1709714004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK+4L+T/fCIZeFhsmGZI2escuTtf5tzbbpdNzNvLL94=;
        b=I1oWmTp+aD0H2i8uoTd9oTKsnW4BYXvwX/ALMk0OFOsB4QBlO8Ot7ybR14BsHW3nC4
         qElOrDmrrlpaQpEhfpQIgmHMpO1I0BGqEPsbraOILsshM+YVWMBuFKw3SfUW5ulDQ5rf
         Pfg12vJ2rQc5e4O2lWiqdNRb8E7a4/uIjdfvfltzRLTX7Jotv2fFGiP2NPx2x+7BDgQe
         qEBZB/zl+SUx12KutfXU9NlPcz/9AaO1t6eYVze9EoSPGlK7tyi0tZQceQj5VnvXPL1f
         w69I/yX36S1nHieUS78MEcBxIPbQ0jVU+BO6LScGdBpmNMvr8NTbeNuAmLgU63YW9T+O
         gWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109204; x=1709714004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK+4L+T/fCIZeFhsmGZI2escuTtf5tzbbpdNzNvLL94=;
        b=J6PS7tNsyXDELkTSmbEpSjWf9SkrS2/vDU9kzGDyYOW7UfOz+sHgnM92uorBN5+Xf4
         zq+PI/VD9Kes3Jts78sGegvngGFemtlKu99iAU9NYxHR9rpNAC64UgmRzrLGFYHyR8s+
         oqUpwGe9dgFGgB9XLYoFpWNzy18Xa/saKWuqCogdAtiODvlfOukZQbYEA4S/J2ma+TRd
         lLaCBNZiuZ+YFGSrI/bUq2cQcKRqv3Po28oYcIEpxyimkjfzi6sC/W8R3KBF/Mqv0oBz
         BSGzZ9IpUR7ResBYoYvnUZhAEQ5ZdYU0OPvUSynORnKq+OrRmujwuITu9OCB+FSI0DpZ
         4MMg==
X-Gm-Message-State: AOJu0YyA7IUWd6BAT4Xp/yMfx2UBn3ocMfmFE5N/ezR/BxjD2/FoCvY/
	UQDYEc5D/9BO0l2SYv0ExpNRbiDbgMX/tQiU7QKRrcI7nRiTam6neyTx/pVwuAs=
X-Google-Smtp-Source: AGHT+IHOnh99w5B3MjETxIad2liWORA4THUzu01xV+igtnbNkwm5J5b3UrJDr8/nE5rBmqSUpnQODQ==
X-Received: by 2002:a17:906:254b:b0:a43:fd9e:2d44 with SMTP id j11-20020a170906254b00b00a43fd9e2d44mr610957ejb.42.1709109204365;
        Wed, 28 Feb 2024 00:33:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:24 -0800 (PST)
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
Subject: [PATCH v8 07/10] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Wed, 28 Feb 2024 10:32:50 +0200
Message-Id: <20240228083253.2640997-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

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


