Return-Path: <linux-watchdog+bounces-610-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D976484CB0E
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 14:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 683A0B240B1
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 13:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B0678695;
	Wed,  7 Feb 2024 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lLIikA5M"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847F7764D
	for <linux-watchdog@vger.kernel.org>; Wed,  7 Feb 2024 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311289; cv=none; b=QKBqK2fXO0DmpgpDlTwwPpuHm98eyVjzQ3NiMPOW4LCIIkBRPncRLiZSPVc3s385tsw+A8NiBprx7jjZmh1J0v1yr8zjJ873rl7XvLHAY5ns3OEMuTB20XATaTwTOd7GMYzxECVX33DSJk84XdLssCSVEERfNGEUgDjrBOV5M1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311289; c=relaxed/simple;
	bh=lCkPIhg4eqOebZq2DSdEYJNxd7Hk5Ji+XPkonxMZ21o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ODlivmYmJuSa1LXA1Bu5dpN6oDkemdMWMNXC6UvzEh+nkEZeF3xg+edQWFdYN7yX5PCk1j9Y6/DqdM/6mZI/seI6OhlkZXRBnaMnuvJjONOQ91G426n80hHCtA4daBA6puLh/6uD7dAIwOoXhG9moQmySyOJ5n5PEqf6OH377Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lLIikA5M; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-68c4300518bso2900696d6.3
        for <linux-watchdog@vger.kernel.org>; Wed, 07 Feb 2024 05:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311283; x=1707916083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob7yffFeJDPnH/PhT3IJv3UmWDx8a+BmeFJCAJI0aa0=;
        b=lLIikA5MRP2evwQoJ3ZFQQ6OkK8AbZfVxIj8E+cRkyIKjXO3QQZ/JOpWUrWcquXiRZ
         U5nfJcQdSiOjpjzHizMh64y6vAG1H1q3kcaWf0O5Rrs/IHfgjr/ksB/qB50Ws8PXJWT2
         jDF9rMpQvM5DBWkP7svIw/N6LuEdwKrC6OEkCRf0He1etmVM2c8PF1NitlN/PrsZIwiF
         Jsbdr5yJjrf82vzg49Y7ap4m4OUfq6i551Ev2zErlHXokbaxRNcF64R9CGYsGh5b7HZ5
         x4eA7/yiKsf486syDORLMevPwEGD1FFyoGGdT7/RMDH+S4o08m52o2j13kWaDF7YpBrb
         +q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311283; x=1707916083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob7yffFeJDPnH/PhT3IJv3UmWDx8a+BmeFJCAJI0aa0=;
        b=X5bncKZYepfVFz4m6fwUG9y606WhZnf4YmW9bJbAKiD997rZe/xXA9CRv5xmsvJNx3
         mHOMPl13Q7ZFcoF595FdrnZLYkzA8ub2xzC/XEFjH9gmPn72uoUlld/t3U429KDduydg
         13mhv7pMomOdgvPkkfkrRHqGNzDDMCHUMwr7L4UXx52bNtrfqLQkiCDytHlLRouSuuCt
         m2Hfdrj5zDDx4UpW+0DUiomovcF/WGOfRA/rUtDxUwVvP1/u022sCu/YtiiOdrNCRhPK
         BkODNv8xQGKbAEqY/9zx0Smfkj/KNA7+Kw0mt9c7sE67xa28YyDqFODfrjRcRv3ZlQhb
         0mug==
X-Gm-Message-State: AOJu0Yw4UWocjoCbVdDXxwXWE1crlv2NG4Jsbyupv1a54cmP6EjRSfPK
	cuIa1emVWs8NqG2/EkEUJ34qEtFPPJQIDjyUoJNaMpYqCog/uLgsAJ5VAUbYZAU=
X-Google-Smtp-Source: AGHT+IFuUlB7Wqq7bvvtNFOw7fO8vxf3B40HYSZqb+VEzaYo3nbeE6QnPU1SwkcErUi44sPCbzxbLw==
X-Received: by 2002:a05:6214:b61:b0:68c:8193:61d0 with SMTP id ey1-20020a0562140b6100b0068c819361d0mr6939090qvb.64.1707311283227;
        Wed, 07 Feb 2024 05:08:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqdtEAhXFAGWbz8AYWQn8DAL3dyGGxVaveN45RfKe62dJzuG7lJ1xInYHLamsMR+tviWJFzWlXozBjJmVEtWntPM9BbNZwU2XxNKaXCLBJU6qoM5NGTHK1wCYXZbY2CLdlVEmhdq4eZu56mAOGqhJBU/SbiFOscJYbR5pVTJAH3plExMJ0vr7WXYfJ57ZVWZVQys+Q5UKVZkFPvg5AQkKjP/MPGC29tDieSh4VTXhHfHc2f07PPFX7pAfspn5Lt4XBi4KhhlUYowoBXMveSckEd4pgWVwZL+m5csMegRUH98K/4DcIJnM+Pu16xhmX7JbovHRPxGq2SB+XpEtQh/nZWoQiJ4g2/hVPkKZdEShtDW5DLSGKIE1boG76wWPaVbxi7PTRNyqgmkPRdxx+rTGQv7pMN1dVKTQDG3tmzC3phT+yTUuAo209GxYMohWcPgU+qFGD9dqRah44ljkdCEZKfeZBW1CCNi5vx8s9oVM0Syy+Js2FvBy5L//1qH48KssvbN3y+SM5UA==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:08:03 -0800 (PST)
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
Subject: [PATCH v5 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Wed,  7 Feb 2024 15:07:38 +0200
Message-Id: <20240207130745.1783198-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that doesn't work make explicit the dependency on CONFIG_PM. Along
with it the dependency on CONFIG_PM and CONFIG_COMPILE_TEST was moved to a
new line to have the code simpler.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- updated patch description
- added on a new line the dependency on PM and COMPILE_TEST

Changes in v4:
- s/ARCH_RENESAS/ARCH_RZG2L || ARCH_R9A09G011 due to patch 1/9

Changes in v3:
- make driver depend on PM; with that the "unmet direct dependency"
  Reported-by: kernel test robot <lkp@intel.com>
  was also fixed
- adapt commit message

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f6cb63a0d889..dd0fc44b1ab3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -910,7 +910,8 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on ARCH_RZG2L || ARCH_R9A09G011
+	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


