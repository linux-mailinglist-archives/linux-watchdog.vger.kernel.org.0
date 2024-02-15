Return-Path: <linux-watchdog+bounces-659-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774385655D
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 15:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1B6F1F26140
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Feb 2024 14:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE557132465;
	Thu, 15 Feb 2024 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NeAhvv37"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC58131E3F
	for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708006136; cv=none; b=Z5UeLa2q+j+sFtXfK5WhxdsegaEZ5x1s/6B1/nODrmiFGwcKESuX5TYGtcoc9zqsk1E81f84ULRzevZcU/njOJiIawMFkjucJJPXkukRJiERDzZIxAvGV+ZMOQPFqoQeWtcQM7KiHFZWF9BkmtqQlcH0aXWBni4NrgO8a7qKzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708006136; c=relaxed/simple;
	bh=PiBNBbw25q+v4bUnUd4r2iTh5pT2QFis1M2ZPr8jCPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9Plwyi+a2h47LY7B6829EDZw+YvVgL6iU7brf4gO1ewQ58mlciB6kX/G/0Br2oqQL7BeKoS788TL7WryCBQ08JX5mLRyjhinJU1SLtICcqu43dQKMq+/qvqcdts3ICAmt8RFSmX3AK3dY4z81t+IFqyCiJ7tLn2bxzHysXG63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NeAhvv37; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-411d76c9ce3so7609895e9.3
        for <linux-watchdog@vger.kernel.org>; Thu, 15 Feb 2024 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708006133; x=1708610933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdEY1bJU0PCtz4SwLFjp8WXUERePjgyQ1aqI/SAhvgU=;
        b=NeAhvv37VL+vkvn/JD+XqXXDTviR71ZQYllvY3uCAZphd/vn9zK4+R9IO4QbZxkWQ/
         k6EKXzeGTRAarL+LISLSr8EmEgBFj9vtGQFvP03Z/0NpJ9usU+SsaeggqyzA9ql/OCci
         DKkixL5GxMaGRPBM+HK5onrBDFxaNnDSHCYaublH3LS8dq+DntnJI14MgIC3NKnqHO1a
         q8vFji0S9Dai4Ln6s6XXCFelJnRUs330tbOQPeybV/KFLNZLaa+Hi9/8ckRidN18WLTh
         D1m9fUPE19cfX1q7kYvED0kTu66HVwoXsUf6DjJz22gZe7ukb/fA6JyJTW45TZ97s52X
         sh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006133; x=1708610933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdEY1bJU0PCtz4SwLFjp8WXUERePjgyQ1aqI/SAhvgU=;
        b=hnzb9irxtUkUAYOkxBVwL75OXOrE1S6tAyI9a9CQjrXeT3nrzH3mpeBPGmqnhmFrp6
         XOtYEPKGfwZi2n+UO4LS8E7Htdcz+EFEowWZ+8/0bsXV3OBpOnbfCvI6lT7XYDrsHd9p
         geKlo2ibXw72Ou9aof9bEdjq13ZqV0JaBCnE5dmZWWj+TfJo2L9KJQEUsns9tYQbl0v4
         0o76aao4XWCn0V4CWFffPErWCbJfZCuUyQxtJFZcyx16iMARV/TIR4EtSo1RV66AkgyD
         wijqPb+nNl9guUM02E7Okn6GQJfZvVrS00ixe562mNMLvmlLrV38gt22D/54FM6wOo5L
         qn/A==
X-Gm-Message-State: AOJu0YwA4iOPaavAUOD4VghYkqt0FLKddeTgVamICETa8lpD46Tf87kG
	cKsDZAkbULEd4ywXZExCwHqX627SeJAzZ+FDY3HYoi0prQe8rHp7nUHWVmyef+I=
X-Google-Smtp-Source: AGHT+IF3AOeMhenbF5cV+9smoAlk3/5t8os0VHvo/WOcaUzNhe50dXel72ETmgnCHRS43Th3tLqYyw==
X-Received: by 2002:a05:600c:4f42:b0:412:6b9:2763 with SMTP id m2-20020a05600c4f4200b0041206b92763mr1459721wmq.21.1708006133489;
        Thu, 15 Feb 2024 06:08:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c261100b0040fe4b733f4sm5120950wma.26.2024.02.15.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:08:52 -0800 (PST)
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
Subject: [PATCH v7 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Thu, 15 Feb 2024 16:08:34 +0200
Message-Id: <20240215140841.2278657-3-claudiu.beznea.uj@bp.renesas.com>
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

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that doesn't work make explicit the dependency on CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- updated the dependency to PM || COMPILE_TEST to be able to
  compile-test the driver when compiling for a
  !(ARCH_RZG2L || ARCH_R9A09G011) platform and CONFIG_PM is disabled

Changes in v6:
- update patch description
- fixed the dependency on COMPILE_TEST previously introduced

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

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bdd1527bb916..cd2e29da7a54 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -922,6 +922,7 @@ config RENESAS_RZN1WDT
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


