Return-Path: <linux-watchdog+bounces-438-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A12836152
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 12:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C830E1C223F1
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918094B5A5;
	Mon, 22 Jan 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HFjfxles"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FBE4A9A4
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921913; cv=none; b=pI3X6dYRbJHOGEkLAbqYkvbJ3ZfFfQ3FGwCgcFP7EuPGG7DLdCucDN7YcEkJki4ZrX7Br+EiET0AGMzebJN1T+46dCW3g0hZe4fnbLkMSsISTiZiThLyVMapUNiMbCdlG5MNOkk7QmAj45YIgLqMEr2on2NC3AikjzSlKSXFL0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921913; c=relaxed/simple;
	bh=QSHrqKvBFITUcBnX8YOoV4xwGvo/LUKyPfUJqWIie9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DFd6fF2mLvQ+befZdJt894RUHHyzN5JGuE2uz47NzSNl9zgll/jgKY7cBJ3VkHVf8a1iNsDb13+6gNp9f7ThqjCbkkmveCIltZ3t3WF4nj3oC6ZQh7/VUPPAeTGg3Z2srIVhpflUDx1eC8NgbyFjqrph0b9mXiSNX8CxaqKuP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HFjfxles; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a356f8440so3422660a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921910; x=1706526710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEA5wOjREvccnNUzxu9B12Stn4mw/QPURiJXd8LQ/aM=;
        b=HFjfxlesQLWw2eazjzzCx0ZUeYlZkaX9e6bPqKbFPVp09D8LiB6fiInRs94zGNY4gN
         265+waRwh8HjkazjHLBGdhrcLWu18bk3oVdf+mgov4heHbFbvsTYhUfRfeghGLkkn9Ia
         r2iFcILXmuZ0QD9odPGBsXFdH3tRIp+9tNikCI6QH1Ascm+DvgfmJhZ3gpVnMwhrK7FV
         iHlOdftnB+UWuaED82lAco3jnqujLk09a5Xgh2CC8GcmBeEnClEzk9ehSqVtSZaLL7/U
         VrPMHSib/NbLA6q73tbghDAhk8XAej8GwA47/ab4/vTUnKgtFtjODKu0FTkxAaizMHnU
         WriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921910; x=1706526710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEA5wOjREvccnNUzxu9B12Stn4mw/QPURiJXd8LQ/aM=;
        b=Z1tbmAJa0VBLmHB5OjqoxNPVWlhC2GzgdmRQu+UyUi5PapzOaHt9WLAHgv05XYkJ1n
         4tZPTCkBCjh+ClyK1Lok0CzmcyMNBvdhgkC9W8nlhwnwgmCe3cpQs45qFjg+6thQcbxw
         MxojBjIadjVkkW0BP155/eYb9/8MzB514qCTqXnVX9A11XVw0A5iIr3n/Dy9WwnnHbFY
         yeQ8cOFUjEWvpQdQowOR0IjJd9x2QP3N0ExeDmGIaiRFG2N8I9lpgU1LPOQFFQKQC5EI
         XbV6KuWgkQAg6tG5ljz6CcmmhRapIKdNXnU0/LtAnLLhCUmeuS5d9yQcZ7rhPFdBfezL
         HvKA==
X-Gm-Message-State: AOJu0Yw78OHpTR0PEcFWbin9iIzbIz9EiVYTPrM6/qEf+aMyFNjj7uuL
	0bl2wyskwgGRI8CgdVE6OmzLvBR9ugxT0VwSfdwRIzweKzSl76Gg9ccZnX+dg2U=
X-Google-Smtp-Source: AGHT+IGw7I6s3NPiyW22Qvw7VVWkxhXCAzTHINh94nQfxWrT31yIhB4pL/X+FC/j64bGD1gBP9c7LA==
X-Received: by 2002:a50:d5c9:0:b0:55a:5fad:6c7c with SMTP id g9-20020a50d5c9000000b0055a5fad6c7cmr2300051edj.50.1705921910408;
        Mon, 22 Jan 2024 03:11:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:49 -0800 (PST)
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
Subject: [PATCH 07/10] watchdog: rzg2l_wdt: Add suspend/resume support
Date: Mon, 22 Jan 2024 13:11:12 +0200
Message-Id: <20240122111115.2861835-8-claudiu.beznea.uj@bp.renesas.com>
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

The RZ/G3S supports deep sleep states where power to most of the IP blocks
is cut off. To ensure proper working of the watchdog when resuming from
such states, the suspend function is stopping the watchdog and the resume
function is starting it. There is no need to configure the watchdog
in case the watchdog was stopped prior to starting suspend.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 9333dc1a75ab..186796b739f7 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -279,6 +279,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 
 	watchdog_set_drvdata(&priv->wdev, priv);
+	dev_set_drvdata(dev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
 	if (ret)
 		return ret;
@@ -300,10 +301,35 @@ static const struct of_device_id rzg2l_wdt_ids[] = {
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
+		.pm = pm_ptr(&rzg2l_wdt_pm_ops),
 	},
 	.probe = rzg2l_wdt_probe,
 };
-- 
2.39.2


