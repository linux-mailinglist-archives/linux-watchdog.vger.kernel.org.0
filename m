Return-Path: <linux-watchdog+bounces-569-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E928F8469F7
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 08:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A193428E428
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 07:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC1817C60;
	Fri,  2 Feb 2024 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hh6r6P84"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F91862F
	for <linux-watchdog@vger.kernel.org>; Fri,  2 Feb 2024 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860749; cv=none; b=osy4FBgCPXlvpyA+3j5PumpNS1+5comklPWUMqiScLOTCvtBiD5XScawbE+38qUlNf5ndby/zN6oyOGxPK6glql8QoRoiKBI51Ljk+6m/V+M1wq4SdXm7RQBa48GhuAdIyyY91JjPZmeZjdEAzLoWk3nus5BLtVrH1iZ1lGOUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860749; c=relaxed/simple;
	bh=OsoaWHXehq/cxZQ9C2k2zkgfmpXq7DmB/mm/lhXbTgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGyqc20wdcXVBmBTL9FlEA0RSM4b85RLISTmMXPfuAK6pYYKTFmb6iJNJEuO55nqqk/iBwnqeLDf2VgY2QKHv+zrXle+itFDLJfjrObVppuHG29Eb164vbAG7b9fFjsTW5DaMnjVCcxECWwk/s3dC3Wj5sKIkuAQy+W2PdpP1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hh6r6P84; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d081a0e5feso7957771fa.0
        for <linux-watchdog@vger.kernel.org>; Thu, 01 Feb 2024 23:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706860745; x=1707465545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1Oj/CgrtGpKMdvRbhpf/2sTO6agf/TWbytJOpr/Vm4=;
        b=Hh6r6P84qGWDTFEidxdBoMDTZcw+mvqTSY+bxXg2lTqsPQU0SK4/bmTsaaPCaNJr3n
         i+8geiT7U7B7K4jovAWGXskquEacGTL+/b+ya+PupuMWXOePUjeh2erS70HF1M25FN4w
         d2fiEQapp5XAOmYTYA3kKjWGjVM7WYZeV1KzjoIoFlq9DCgz4cp8SyRqZ8PqiR2dFNjE
         jDYrQwnrJSOR41yezoC9xqXAWySCQ6HVyI7XeIQjdZCnyhFCKvEpxwIhZRVeYlEgsKd9
         aIHTmu7+4PflZ+OliQUlXmakD7esObFvNKSAqmJ9rPFr6WZ6vm28avemRztxwlTT9z7i
         jNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860745; x=1707465545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1Oj/CgrtGpKMdvRbhpf/2sTO6agf/TWbytJOpr/Vm4=;
        b=RgFKWQjzwaFhJMzke46GMjOEqSDILp5O+V/PwdUv5xBNsjChMHLq4efGoo9AdXPI4q
         ElPTYJ/Aqfe3izhFgnaWSuk3WAW2oycKswEo0qLQyEjlID2brt3fyHum3JmGqP4DvVf8
         198E4JiIuOZ3sYKeb9KumVf1J7l/1KwOTL/usk0tOfrBZlWLrz96rZm/ziYOVHwB987+
         JXpk5T2c06+zWcq94kCCjBEEvSa7hbwtgGhUYM0YlykkHvugqkBCWVZ7kxLGzGTz7Cvk
         kWCV6pACKradBvg4N990pGaECS3pX52ZWwwRtAssDYILOdNAqo3Ql7qB4avWuEC3Amkx
         t8Uw==
X-Gm-Message-State: AOJu0YzvIMVbhr07lcr3nKaJg/p5H0ZWbirqrQ3Im/eCUwtsqpKp5nLW
	JvH2Hh7NU1aLQBE5gw49+gbrNMhpVvDyeU83oscEN/NeSdXYc6ZwVBrz1iw8Di11lQ0sxUkBygc
	3
X-Google-Smtp-Source: AGHT+IHKy+M2fUp6KjhdawAlkutMspF9pOs0ID0gr9jv+pvb4pY7MYBYDmX28ilxd+HRnLz+8kN0Dw==
X-Received: by 2002:a2e:a703:0:b0:2d0:69cb:99b5 with SMTP id s3-20020a2ea703000000b002d069cb99b5mr4235887lje.44.1706860745468;
        Thu, 01 Feb 2024 23:59:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVHP6Odj9Gu/VNQoi57BATgZ+f74cL/tDP1MFGqrTBEloZ/YIVr8mCJSsQWD+CQSP0slDuyyDFSyQgIsX27tNaa/AQxible/1xlk/6mkTuyyYuG8tIL6AIOjkW/Wq41NgKqAPIXrKyHxNgDJp4Cdb5FMjfCr18fooiM1QgFaPyEyoVKutKkrtY/PGj4u+32epS7X0BTDiwz84+qsVvn+CsIRrNGBCsuAjBbgsJ9eh5Oku2FrL5pR6OOLfe4f4RxuclulWntjmnS7u/Q/VOYw7KMgraTT4jCC8okNDyULD4iMBX/Hgo55JjWP53qPSx9KhJhACjj1XxtAfAlnc0iIbPa7VoBbgIQPROAyACAL1JKEwySGtxsigX9XqRiYi/z9AwYNDQbWXU3/wJ+NIYmTZs4SyEAQwk5n869A7RxMgvwKaeD52w9bylw4Z+/l2wrhzLFdnuXetK9pcwDYdZOGljtdNEQGBHXEdL/3nALOzT4d6I3QUGCcXzDWkNXIji2JYkRq1bDIPmBjg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3715be38c4sm185544ejc.210.2024.02.01.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:59:05 -0800 (PST)
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
Subject: [PATCH v3 4/8] watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
Date: Fri,  2 Feb 2024 09:58:45 +0200
Message-Id: <20240202075849.3422380-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to de-assert the reset signal on probe as the watchdog
is not used prior executing start. Also, the clocks are not enabled in
probe (pm_runtime_enable() doesn't do that), thus this is another indicator
that the watchdog wasn't used previously like this. Instead, keep the
watchdog hardware in its previous state at probe (by default it is in
reset state), enable it when it is started and move it to reset state
when it is stopped. This saves some extra power when the watchdog is
unused.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 7bce093316c4..93a49fd0c7aa 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -129,6 +129,10 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
 
@@ -146,7 +150,9 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	rzg2l_wdt_reset(priv);
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
@@ -186,6 +192,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	clk_prepare_enable(priv->osc_clk);
 
 	if (priv->devtype == WDT_RZG2L) {
+		int ret;
+
+		ret = reset_control_deassert(priv->rstc);
+		if (ret)
+			return ret;
+
 		/* Generate Reset (WDTRSTB) Signal on parity error */
 		rzg2l_wdt_write(priv, 0, PECR);
 
@@ -236,13 +248,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.restart = rzg2l_wdt_restart,
 };
 
-static void rzg2l_wdt_reset_assert_pm_disable(void *data)
+static void rzg2l_wdt_pm_disable(void *data)
 {
 	struct watchdog_device *wdev = data;
-	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
 	pm_runtime_disable(wdev->parent);
-	reset_control_assert(priv->rstc);
 }
 
 static int rzg2l_wdt_probe(struct platform_device *pdev)
@@ -285,10 +295,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	ret = reset_control_deassert(priv->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to deassert");
-
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
 	if (priv->devtype == WDT_RZV2M) {
@@ -309,9 +315,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rzg2l_wdt_reset_assert_pm_disable,
-				       &priv->wdev);
+	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2


