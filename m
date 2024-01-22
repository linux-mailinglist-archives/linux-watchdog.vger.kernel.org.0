Return-Path: <linux-watchdog+bounces-433-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ACC83613E
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 12:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2612E1C21B13
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 11:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C400A3EA6A;
	Mon, 22 Jan 2024 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qxd6Cd3s"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C03DBBA
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921906; cv=none; b=fra9wnUDmfx0eiT1FyuVAj+TKQ8+ik/43k6MUy4zNhZhnsHYjrSY6ZP8nYQ139mdyCUyR7p0ruD5SKWnSaWFcFp8LoQWuCHe3Ft6vB0eOA+m8KZgyiNlA2a4BJdschzyjZQPtgves1rig0A1D+9M6t7N0lgbwWgtZfsWIZz7AnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921906; c=relaxed/simple;
	bh=Blr+iANQYlS7It5oI58BNf7pT6QkerQt00/CZ4Ek2d4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Thl6by/8jhzsQjFzeLGqOWXGjB9KSaymc/MkeHm/Ku0xbFBtIgRR65bRwuq83eeXR+31najYSRhnS6JyKljZfgyc5Fve//VLAmaLEUouoIQA8nmKdtNJ5KS3Dh7sxKi8a/KAm7swQISra4/SHBjezfe15hVhn2HKsRi2dQnXf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qxd6Cd3s; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e67e37661so4076382e87.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 03:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921902; x=1706526702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuEnT7skmJ0Rq7U8AM2RjJmX/XsmwEYq7SaFr86Y7LY=;
        b=Qxd6Cd3sGe8YRJKdmNGuWtPIkhifAQvYFg3hf9lRPZeZB0U4oixFDQMaQ0AfAlpHDs
         8uIWzW/1C69vH0i6nNB2XMvRDccPbiouhNlJHVUeq9TKaABX18IfxYvJCdJUx7TAcs82
         49Z4R9kxauScUb9XsrzBgHt4qiZ7n5Owgahxu+cHHo/WJCMAwkrYhEVo8mAbAmKNSVjv
         /bUDaE8HehOZMzfWp/hvi96lHlWQnmEyNu3JGA/F4FyIPsz4SHuQpa2XfFjjKy680iYj
         3SwqfaLQ7ixxgTXr+H/rQLH6kaA4QT8TJyWNPB0mj9GbJRA8HrhBiQv7FHR4TJQce1gJ
         KqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921902; x=1706526702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuEnT7skmJ0Rq7U8AM2RjJmX/XsmwEYq7SaFr86Y7LY=;
        b=hRyQ9fHIdIBBcQNcBCeRx44hslHx4FenICkPzQI574+Qh71HFC5AVQbCI3xl/at9ww
         N4WNt8cZhdw40STrm7k2w1gljBD+AYamsc3GpUPKsUwhDHc9meqQRUnyenek1T+W6spl
         jNbt4hxjIa1iDkJDDlVrS8pHClI9XmHiptkbsH+sDHV+kFfD1/JPxyQ1N5DlRHys7o+N
         08egG4zCSVImFdVGfZj+szATPCt+bxi6enlHzcGnWwf68jPLc/FpL1YuyeXwwK1X3kyu
         hqgy0fWgImkeqn+b5oH4BU0vTaaWrhmd55vancQB6ZcvO8G639oeBcNeZcimJVQaobED
         vJyw==
X-Gm-Message-State: AOJu0YxomjmIDrKHpp6SUFja2kQNzRiIPMnaz/dDLMpr9DKaDap24bp1
	TXkXb2VqJdbTmQYas/EorVPPpnozBJutd5i6O3zckFxA+VLPWAf1hLU93ZstkMA=
X-Google-Smtp-Source: AGHT+IFGx8qM/sIwft6QxAAk+o+s4hXoIybkkN1BZsWq/pkA81TUIcm1pFGR7F1nivTcJJ8NUyaC8Q==
X-Received: by 2002:ac2:4a8b:0:b0:50e:7be1:f0e3 with SMTP id l11-20020ac24a8b000000b0050e7be1f0e3mr1601979lfp.83.1705921901881;
        Mon, 22 Jan 2024 03:11:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:41 -0800 (PST)
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
Subject: [PATCH 02/10] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Mon, 22 Jan 2024 13:11:07 +0200
Message-Id: <20240122111115.2861835-3-claudiu.beznea.uj@bp.renesas.com>
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

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/watchdog/rzg2l_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 1741f98ca67c..4ab9e7c5e771 100644
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
-- 
2.39.2


