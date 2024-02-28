Return-Path: <linux-watchdog+bounces-742-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A573D86AA1B
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C051C236A6
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932B5381CD;
	Wed, 28 Feb 2024 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Tc6OO+fU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBAC374FA
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109209; cv=none; b=s3LdANBSBkF5Xk4cGuppCPgppZRIWvorsgIFjiC0jXi6t5UGEo9zAKf7w6k470Xb/4jaz9BHRi7jnfwpFBFczrVrbZsv5JKFyDYI4B1Zu4QLBczTmw9uVpcvE4DeILzgzg60r7Fx/LxaWYv1fY1QcYnqn2yh6HFw/s065eYNd9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109209; c=relaxed/simple;
	bh=xpEy60wLCww6Rzj9qsFI342NwmQkdCt2ZTEg/Fiucao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZ2Zf6yn2JDKH7xDLSdeYdoYs9+dygQs44GejsCQ4EqsW+kO7/0ubbkyPzHJBO7K1Fx5jdl6XGtCnoMe3aPVvTKy+4d3XbKXVzo71YvD4KpHVT3iGXsOaH3D6xK6oehEjAr+hKWA0brMt0Aw5wuUxD6X2WxNEUL4HGXTqZlIAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Tc6OO+fU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so949056a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109206; x=1709714006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjCAC+2PerafieMHV8RN2guxKuMHo8tOwc6kR6Aqv5E=;
        b=Tc6OO+fUTOKmKwLJsUx13q2P9pAcQaEPdAnUsBsvfA6iC5HsVbxYFtIR3J9E4lgq7l
         yHGuSDXfqG8UiKZOVAKbErSDtjicSmbukP7g+iR5vOvHYSVr6B7UHZZvJ8lPfBnzY6L8
         o0tnPe/sCrvmAu/QpxZA1An3KX/Z+t6gPP87yDVnx+GYJyN3XIeSEzflXmr9hEl6jOU/
         rNz54GIniDUtKlaNzDuqXDMRAwyIZG6c0ItWa/DRFeGwmwnCKYhELwnjy9CPGTGt7bv7
         NgN7ygBjzS1ZXRWx09xssZ2X1n+SwArysj61yPO5k86dJ4nD13IVMW+Q/eL8cG2wgJKV
         a5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109206; x=1709714006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjCAC+2PerafieMHV8RN2guxKuMHo8tOwc6kR6Aqv5E=;
        b=g/j4AB+qKe3oLkCya8RqJH2xjHCedTE2BAQlch2Kgs+F4YGe4H5CTwpdopjnwAwggV
         SDxMaE3Tk4b+tlT6lY76SUB7ifiZATItwfaCeD31Sk1VhGzTd+2jyJFKl0ga/z1lWUnp
         GdRjnrIwZqYN3Hp0ZO/v1LzCc7cCnclKTxAIi1WNErS1UytNdaECPI+AjT7h/pVvTMyO
         Gdv3C86JNrfThJSZIbnG9dNIPbSyNSNBltCgmbKdoOxatlMIM/EFCamIZqWlQbgIdoxj
         Wjq3kKK+ydcoKAgM1DVBJVtD/H/sYi7fdR63fBOV4hcnDV9TWR7uK3akxXvtcNTbsY62
         XFgg==
X-Gm-Message-State: AOJu0YwV+UrdvsqUnCr0Vzdb0bqhBqsmOwjOtbQULm0npXiK+DopjTJZ
	RW3RdctPRS17H1kKlZaaQL/03zXkkRS0KwD2RyybaNySH2vNB2CLGI/dyLyAL1w=
X-Google-Smtp-Source: AGHT+IHvM27UyNUUHNyHnRcMcuAN9lM0k5m646RjUKSPsYCZAH4M+FrTQdBc1dhFZZVDQrbV+zdgxg==
X-Received: by 2002:a17:906:f357:b0:a44:591:a3d8 with SMTP id hg23-20020a170906f35700b00a440591a3d8mr669462ejb.31.1709109205764;
        Wed, 28 Feb 2024 00:33:25 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:25 -0800 (PST)
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
Subject: [PATCH v8 08/10] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Wed, 28 Feb 2024 10:32:51 +0200
Message-Id: <20240228083253.2640997-9-claudiu.beznea.uj@bp.renesas.com>
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

The RZ/G3S supports deep sleep states where power to most of the IP blocks
is cut off. To ensure proper working of the watchdog when resuming from
such states, the suspend function is stopping the watchdog and the resume
function is starting it. There is no need to configure the watchdog
in case the watchdog was stopped prior to starting suspend.

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
- remove the usage of pm_ptr()


 drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 42f1d5d6f07e..c8c20cfb97a3 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -284,6 +284,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
+	dev_set_drvdata(dev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret)
 		return ret;
@@ -305,10 +306,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rzg2l_wdt_ids);
 
+static int rzg2l_wdt_suspend_late(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_stop(&priv->wdev);
+}
+
+static int rzg2l_wdt_resume_early(struct device *dev)
+{
+	struct rzg2l_wdt_priv *priv = dev_get_drvdata(dev);
+
+	if (!watchdog_active(&priv->wdev))
+		return 0;
+
+	return rzg2l_wdt_start(&priv->wdev);
+}
+
+static const struct dev_pm_ops rzg2l_wdt_pm_ops = {
+	LATE_SYSTEM_SLEEP_PM_OPS(rzg2l_wdt_suspend_late, rzg2l_wdt_resume_early)
+};
+
 static struct platform_driver rzg2l_wdt_driver = {
 	.driver = {
 		.name = "rzg2l_wdt",
 		.of_match_table = rzg2l_wdt_ids,
+		.pm = &rzg2l_wdt_pm_ops,
 	},
 	.probe = rzg2l_wdt_probe,
 };
-- 
2.39.2


