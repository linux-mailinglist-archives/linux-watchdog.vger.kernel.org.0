Return-Path: <linux-watchdog+bounces-437-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1A836151
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 12:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB2E1F2271A
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 11:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCE33F8EE;
	Mon, 22 Jan 2024 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UdjYkt5M"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417E3F8FD
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921912; cv=none; b=cP5qwdCTAlxl418Kt4ehYxefoRpPTuhwri+3iT0RofBeCGG+nPP5z5MBLmoSlxtOgQB9obcct+/ZQJoAZVN/q188pgmb2+yawPNMXlYoY8csL598NdNRujvzhT/f+BhpSVIKFrqdvP6gDt3nBmVJQHEcDsbTQtTSdbegr0cqefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921912; c=relaxed/simple;
	bh=xaqBRK9EGIdJH9HHkMygHgD7aoVyRCxVtV2V46YhORc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tV7oB7EmGP/VK3t5MfZhgszvIR+hUhEzMFxkqxByhaFsqG923AZHudpxgABlMSu+jKo1bxoa7lx2MwElbeARi5xYzd+aOkL+IAxtjwyHKpL/IusuyN10IoisajoFqnPwXciLw8rrpxsBjIMM9+T9ojuhJaAtcYUEOkLyzXXOAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UdjYkt5M; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55c1ac8d2f2so1288365a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921908; x=1706526708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwcmiOqVIksAk67lqc9iZZkd3iM6L9ti8qSBC2scoWY=;
        b=UdjYkt5M5lRogzDrBHM88nRIj1jtzb+6EuRlt09+nklvcvhUDwqTObm71o5Qj1yGmI
         g9WszGakcpYoHgDZ7CoYKfkk+W3AmlzAiNTLVXNhS2fuLM5Cd/l5xUJIDAgWeQRVXvNE
         d77XXPftKJhh+olvjz95dk8Fw1OnyZVQXcernXS47wTDNwTcvG1BHoPNaBlABAkWYuhO
         tX7hRT4bxFvCQnnd+uGTT9cxGSceEIjr1ZJpwtLzZe+knSHM/5WIr//MvQ/ozVAlBmw7
         2T2OmrRa5NueYZG+yl5xvL/S8kq6zMd1dTsTyN5DbRg0Yh7KFXTgbkAK0TIxV+ae1p04
         2YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921908; x=1706526708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwcmiOqVIksAk67lqc9iZZkd3iM6L9ti8qSBC2scoWY=;
        b=atSXieBke2SXqg0/O1FpHqTvzcDiFAfdlwjacp2LWJKrEe+MrIPw0mfTToWZ82Mb9U
         /wh9y+jQo3/xKP3k8tuJ3hf0x5zxs2rqgK6wCDaE9CLcC9kyAuf02xLc2pF54Q9MfyW8
         HMtUQ+8OP1TgRYRB97PO1/59rT4nwWJNjDwX/iqkCs8Prr625+u46DZaSFhbOTDVz49r
         oISn4A3Fljd84z6yKDqWXTjdiSxeKkbbZAECzvNuAtkGWgHTsZ3/QsKrKbp432tAoOuf
         NAithhezNKuMuvLt4RfEqSa4d0hjQrVsK+hHyUDk8gvnpHD7RfQBzm4SQTWPMNLGHatA
         +ggA==
X-Gm-Message-State: AOJu0Yy7s7cxPgWqYodgDuXuW2JqCEx2tN6gHvSuJ7vWmABtGxe9vBad
	pCVrOf5OMd+uokjL8RTEQEYMBfDN5hRxy8YyOF/YTiEFfda4s25Agn+uaBpZHjE=
X-Google-Smtp-Source: AGHT+IGIabCWO88Pu8kLqsy9OECGdMHiSHXOfkdsobiN5qTeWf5eV/ONXAgZO6Grfcpvrb83g6mNKA==
X-Received: by 2002:a05:6402:12d6:b0:55a:2e1f:17e8 with SMTP id k22-20020a05640212d600b0055a2e1f17e8mr2064367edx.49.1705921908663;
        Mon, 22 Jan 2024 03:11:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 06/10] watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
Date: Mon, 22 Jan 2024 13:11:11 +0200
Message-Id: <20240122111115.2861835-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
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
---
 drivers/watchdog/rzg2l_wdt.c | 39 ++++--------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 38607673e1a5..9333dc1a75ab 100644
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
@@ -182,13 +157,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
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
@@ -200,7 +174,9 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 		rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
 	} else {
 		/* RZ/V2M doesn't have parity error registers */
-		rzg2l_wdt_reset(priv);
+		ret = reset_control_reset(priv->rstc);
+		if (ret)
+			return ret;
 
 		wdev->timeout = 0;
 
@@ -292,13 +268,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
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


