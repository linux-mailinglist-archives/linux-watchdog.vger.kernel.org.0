Return-Path: <linux-watchdog+bounces-1533-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E7095F4F5
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 17:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97661F22349
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649B1193087;
	Mon, 26 Aug 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PlFzkV35"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BD194098
	for <linux-watchdog@vger.kernel.org>; Mon, 26 Aug 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685946; cv=none; b=LQpoKsXqxHyFgE2ewk6HmdstgbxmR4nWNhXSF6KEBIgSIqW1+ZjPjdd/m+dTb+aiJ6B+P98xUiiirIokCPssGUAulu7RQ500i9ortou7QNX5Ek1L+6rQgySNkkZajKXJAWRQlK8vL/KMTxFZPTH4tXX+6M8miPKklFubTyxTp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685946; c=relaxed/simple;
	bh=rsZuUfNZcs9lg0rPx9CSZBgjL9st+fLll+W4cyWgdkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ORLGJI7LNGCoDB4GEGQElG3hSmKGmhR/uibbt87hhrsi4oZRfNTIS9dcHGT8gxOevrDLBV7mqUEyVvdfb4LgvPnh6dNuOv8WrIdqez/jM8VFxJO6cvPwj0Ny9Yflq8lpkUgKC1KiqKyF1y3NtFry6tBW2vtHHiYObFjM4YONw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PlFzkV35; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bf0261f162so5296432a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Aug 2024 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724685943; x=1725290743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKZW1L3bK8VtJFD4UHbqlhoKQbHeYiPWb3w9DhKsGU8=;
        b=PlFzkV35kguZ4oZgO4JXg7bbAGyYF94UoEdRWOILc0frP96aSzjnuER6cIljU9JzZH
         JCFn5wMJps3c4Rnkho6R7goLyC6ozBKHPvEghuXR0rd3X1SO8XKBYl78aQWCzIkY+l1+
         eqd5B1bkwS8GCyg5X8MwXYp+MZzPd7wFC4UbIBYrGheIkdN9Ig9/JECYsS3LtAXAUmF8
         bxGUt61r/2nRTzRTpjAzXaRlu2Fwzyo59IKXByOfVeLINe5TaUSLNCbTYeNn0UyGSS/8
         Wjzv62muWDCI7NHApqCtOs2RqGxteT1K/bXHrtfa/uvrpCL0DrlevcwZhjZI4jOcdxC5
         /vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685943; x=1725290743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKZW1L3bK8VtJFD4UHbqlhoKQbHeYiPWb3w9DhKsGU8=;
        b=gyhli/lPg+fhMdBYeqPu6u2bwRQT76yFFLBomEbhLyVFedxoYxtRqptvTx2UitCK/s
         hWzSkAvRs5y5pvFmVg+tK3t7so5pLAI3vqa2xBQ9EgfRxe0AmGoDBEAPG5cSuJbIYAMf
         0FtHeV4YSlms6dio1rZGIV2N3YyIRm6hiWiLdo+E5A9fTeSzdxU3dv+0bdmpIqDWAxsu
         7bC2bZIECtWP1dKVkOaP67zDF9J5gidLCZ8xNggOIpz9GVyL8/z3gHHywciammg5eE0k
         cH4cRclQwAX0VWGIjhfI/2TdIE9FMs4HaArs0MkVlpxIn67vjCMDDzrq91959L421KI3
         8dOg==
X-Forwarded-Encrypted: i=1; AJvYcCWRVxbfoDXlg93OyKRqWznucFP9+/zMParNTmjXkII3Ho8uxwNjkxfFUppfFvoFHxADc5QmAMjOCaMyr6Wesw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Sy2YEXLVtQx9CAhXO5NIgK2E9lskvZxRnlARJIThHcj11VZO
	oyAqFTqPwfD143ONo4At7wkxh6uV/45UZsyb8fOSrYjVbu7pXSvVDYQOzEnlwpLbS+Js1IRKbX2
	i
X-Google-Smtp-Source: AGHT+IHwcvV+iRgWb/1qPSucDkWuaWbymy91bdnFpsjuT+IA2I+XKOr0Sq6pyEAf+2DomRgdSdho8Q==
X-Received: by 2002:a17:907:c27:b0:a86:8166:1b0a with SMTP id a640c23a62f3a-a86a54efbeamr802439266b.56.1724685942736;
        Mon, 26 Aug 2024 08:25:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f437d5fsm683005866b.99.2024.08.26.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:25:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/3] clk: renesas: rzg2l-cpg: Mark watchdog and always-on PM domains as IRQ safe
Date: Mon, 26 Aug 2024 18:25:28 +0300
Message-Id: <20240826152529.2080248-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240826152529.2080248-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the watchdog is part of a dedicated power domain (as it may be on
RZ/G3S) the watchdog PM domain need to be powered on in the watchdog
restart handler. Currently, only the clocks are enabled in the watchdog
restart handler. To be able to also power on the PM domain we need to
call pm_runtime_resume_and_get() on the watchdog restart handler, mark
the watchdog device as IRQ safe and register the watchdog PM domain
with GENPD_FLAG_IRQ_SAFE.

Register watchdog PM domain as IRQ safe. Along with it the always-on
PM domain (parent of the watchdog domain) was marked as IRQ safe.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index ec0672651fe0..8e4f17c21dd7 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -259,7 +259,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	/* Keep always-on domain on the first position for proper domains registration. */
 	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON,
 				DEF_REG_CONF(0, 0),
-				GENPD_FLAG_ALWAYS_ON),
+				GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("gic",		R9A08G045_PD_GIC,
 				DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
 				GENPD_FLAG_ALWAYS_ON),
@@ -270,7 +270,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 				DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
 				GENPD_FLAG_ALWAYS_ON),
 	DEF_PD("wdt0",		R9A08G045_PD_WDT0,
-				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
+				DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
+				GENPD_FLAG_IRQ_SAFE),
 	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0,
 				DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
 	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1,
-- 
2.39.2


