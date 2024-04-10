Return-Path: <linux-watchdog+bounces-912-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB589F8C9
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 15:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 359E7285C21
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDE3180A78;
	Wed, 10 Apr 2024 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JIll+PFo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC10173327
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756483; cv=none; b=NIUrLP33Yx3eryQ4/Qw8SUJgSTgAJrevs32vPKOttwKHi5IqM3YbtWn+8WpHUuYuCgfWrp639L2BZkuLuIW4fjpWtL50Sb69kW6AtJXOBfJhmgw08gc5MLcQR2uqqcwGkpdpi+pNE8V8aXyz7M/WjqTUBFF49sae0jaelVxBcOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756483; c=relaxed/simple;
	bh=xpEy60wLCww6Rzj9qsFI342NwmQkdCt2ZTEg/Fiucao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXf/anz/LRdlJPl8E5nFBiIab1KY5Ts/NXpy4rW0fqzrW6xfG6oW/Rp8Cs/pOBcF6qiuOp0cFOKyi3tor2OXQBnYW2d86/Oy1crnDRMsl3GG4gCjFNobR2nlYIY3oV5Mazs1URSrQxFHKd1AAl0Ti3FF4Zw37U7yL7GLly4Toic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JIll+PFo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-417c5cc6be0so1173695e9.3
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756480; x=1713361280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjCAC+2PerafieMHV8RN2guxKuMHo8tOwc6kR6Aqv5E=;
        b=JIll+PFotOkQjwaGFtvMv6Czl14XjVA1lwLSlRnY8OhOBoso+cZoLut4N+d7Eep1my
         mlZu5aHg/2UGh2YdcRN+ST5S8e0L6CSu+mchtq4Vxzy3huraJX7/Vl3GUmLQKs5cMu18
         xPlmFNcQM1f7vfw5fEixArMySyLF1EUKz1Hu+mHzwH6ys2oYPcZa/yWgTKC8JMxglrdx
         iXoCzBAUACAtMCzlP1Y91fFRA1vOn157rqYfYGQCBeHab6PP8pT+eQq6lTvSKcI9XoJT
         6i7323tKi68kd6aV+Vv+TdaooSYZixRVieoHQvmNcAQU83O0ARr9VmrK11DZ8SCrFeay
         W+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756480; x=1713361280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjCAC+2PerafieMHV8RN2guxKuMHo8tOwc6kR6Aqv5E=;
        b=sACYWlyUF12e/oMGkj9EZQtqzYDeuQnXZQfKGTRYfos4Y91CYnoGxcgZOo4mS6e53l
         IKFYs6Axg5/kppyBOKrqFKOdSB6US+TB+X7XZEaioOrIcsRimEnj9KD0GT12iFQkT2eR
         pBvlbvJIf72iwzKUgClMouBCiCBgN/MFwaeM1nMTfne03HssHpkvioLaIpA7bQl3sW0S
         pUWdMwbFQGJ402cSphbDBjGzcH7ekgTi0LBIIBfThxM0rY1/tft6RhRClpKujROV+YHv
         445vJtT36wp/7ixxVHRI/kQNe76cKe8nmqFyX9aVzgay0ACXPLbElFPniN2RGQW3++jY
         rBhQ==
X-Gm-Message-State: AOJu0YxmyvD4yJ0eKjMeHJaV9dS/9+yM15lfrs9unEruhjH51Aaik/Ym
	KYhzrkDB2oDxnr9yo+l6VuLo1YMzK5l/mcIf43SGp+D3xrW0rP7yoQJ3jQLxspo=
X-Google-Smtp-Source: AGHT+IEFj8V+GjPPGimKfeXFxBrabqAeiLAm4xEJjfKHrlCzLWu0SvFIk2Dhlg1MICOPvwFyYzbskQ==
X-Received: by 2002:a05:600c:1c95:b0:416:9b8f:1e5d with SMTP id k21-20020a05600c1c9500b004169b8f1e5dmr2226160wms.35.1712756480162;
        Wed, 10 Apr 2024 06:41:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:19 -0700 (PDT)
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
Subject: [PATCH RESEND v8 08/10] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Wed, 10 Apr 2024 16:40:42 +0300
Message-Id: <20240410134044.2138310-9-claudiu.beznea.uj@bp.renesas.com>
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


