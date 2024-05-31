Return-Path: <linux-watchdog+bounces-1083-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B78D5AFF
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 08:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045D92855BF
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 May 2024 06:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23C81729;
	Fri, 31 May 2024 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P2EE+tHP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1F82483
	for <linux-watchdog@vger.kernel.org>; Fri, 31 May 2024 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138679; cv=none; b=bytcAQQ865hJHu6GrJRIhbwshf7US6zM+SHZlWeWPMjgFyDO4e4pyHtCCe/k4hcNADDLlerfrhv5vzPpBsLpc2p3UOD75vAfpPMpJtxkf7LdZymTTDRxSqEbCsZYTpN5qg85vGsM4uCuZ9jtVHm3juvEXwu49fVwG2LR2okE1Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138679; c=relaxed/simple;
	bh=8fURJAgiFprMwv01jDQF5npiroOs/JA4SgWkAF14e64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XeDuNK58x01JHuph0a31E1SosB1QRZN8K7uayhSiCLPFn8HExP8liIBFenM3vbjGmQZtyeeRR33PJp6A7hAO0OKsW6Rs0Mf4cIlAAqKa1bbVFgqxj10aqdIccEV6Z3JNR8r2mBjwgM2L45t71j3XRQcmuFES6wImmQKVH3gHnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P2EE+tHP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so1736452a12.3
        for <linux-watchdog@vger.kernel.org>; Thu, 30 May 2024 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138676; x=1717743476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeDSR8o5sHBiMB9w8iDNT/c+BZ6oRS2bNAHx1/Apsa4=;
        b=P2EE+tHPCCByi5ve9s8GN9Fo2UCIALvvM9p0W4HJAvIoY0z/f0MdfnoujMG6cF2arF
         pUXhxQGjmjCAzYJ0C7m52us5CbyP2X6K8HfATuGxlIZJ9pkKVbEk5nwB7FBYUguONCTn
         u5AeZEjfG+593Qt0wUHyY3b3FnQrpwL2AaUXlyZvtzq7kLWAXx7J7RFEzGLBRCHGiq2i
         zvOdoj8HPganNfkRs+TMxHvzsLWr9VRMgFizefWZKZ+NQBqrBsjJBh0Cy2tQIemhadUj
         gmdoM3P/kG6bo7m+Ar2wOkeDv7gotCtNd0bpgODvaU2hjendVLs+yvxaXC1L5/h7ApCe
         RZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138676; x=1717743476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeDSR8o5sHBiMB9w8iDNT/c+BZ6oRS2bNAHx1/Apsa4=;
        b=ou1ZKH9fxu2uylye3WmpYucuUV4qOio+bvTu4wWG1chdfWE5zI4a/Rk0JmkGjRO7Fj
         1Zc8tfUKnX8H6Tj50qvMyPwI/c7XYeAW2lq/vSUlRcnJ1JPPrJmh46IoiMonRsaaJhrr
         gM2oxt8/TVyHH4AmqfarWUamrhi+msLlhrCVtKw0eGkeGw3rgywGEt+aADR/webWwbGa
         OQHAuR0Fw48LD3QItGfi7ZblwDjg8SPfIn9Xdqk59DbuDLtb4uEx6LaNw45VLhmSGz63
         HOZfQjbbmbWvsYB4Bbr/liXW7c8OsE3cCH/xN731c5PYn1keSWDXU6AWimWi0/+ZUXW4
         eLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmCu0Aimpctu+TJPWkMar88MT/UkD4iKAFofxnKP7dumWXx1sKLSmZjB4CKZ0KEGFInPHthtD/hOtdNH4qnSBW+hmSlhuvNqDOgKDodSA=
X-Gm-Message-State: AOJu0YwXsNc9h1ZgsmBeVbp+uAe4CSaOexaJiLwKQeE/iy1QfujYl3NN
	0wa1q4ykMbQhbuO8o9xMoVkD7ll/SeOmWiihteDamcuC4pduchQwyQG8DTlvRIw=
X-Google-Smtp-Source: AGHT+IEpvelFNcpLhdN/GNMdGlhBEKvU/gq218tz913pFdtPjNc9x+YA8wu51wxYrvvr9qkW8UCXqw==
X-Received: by 2002:a17:906:fd55:b0:a68:5f08:2e2a with SMTP id a640c23a62f3a-a685f082eefmr31291766b.28.1717138676159;
        Thu, 30 May 2024 23:57:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:57:55 -0700 (PDT)
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
Subject: [PATCH v9 5/9] watchdog: rzg2l_wdt: Remove reset de-assert from probe
Date: Fri, 31 May 2024 09:57:19 +0300
Message-Id: <20240531065723.1085423-6-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v9:
- call pm_runtime_put() in rzg2l_wdt_start() in case
  reset_control_deassert() fails; due to this didn't collect
  the Guenter's Rb tag

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- update patch title

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 drivers/watchdog/rzg2l_wdt.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 7bce093316c4..7aad66da138a 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -129,6 +129,12 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(priv->rstc);
+	if (ret) {
+		pm_runtime_put(wdev->parent);
+		return ret;
+	}
+
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
 
@@ -146,7 +152,9 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	rzg2l_wdt_reset(priv);
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_put(wdev->parent);
 	if (ret < 0)
@@ -186,6 +194,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
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
 
@@ -236,13 +250,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
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
@@ -285,10 +297,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
 
-	ret = reset_control_deassert(priv->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to deassert");
-
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
 	if (priv->devtype == WDT_RZV2M) {
@@ -309,9 +317,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
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


