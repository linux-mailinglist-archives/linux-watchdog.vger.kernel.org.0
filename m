Return-Path: <linux-watchdog+bounces-1659-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D03AB9688B1
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 15:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85138283A31
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 13:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B578B20FA9A;
	Mon,  2 Sep 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hf7ltMRz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E2205E06
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Sep 2024 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283460; cv=none; b=QeFV1aBbSGhGFAKmVUHj055a+tMTekWjnqwoJ11DUG89885JkqUaUFvv65ok0uWSbSm/NyzUWdOCW2RtkYDErg2l+JdncCbbU7bsbowHcF4NXEZdihhFq2FsAxt8iheY2H7EgCFSAHNuBXbpoGPP5s9YoT1LS7m9YEdlSsGRE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283460; c=relaxed/simple;
	bh=hSKgjt3EBWjP45FbU4C2sCk9ILvRF/ojwSa99/tgsqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AfsmpOzVSlVOkN3S1itaooKsZ58CRtHNY3cqEPbapvqQkN+RqcJQq69nWE2RAGvgTxUJxNCUxcL4knnjKd+/rncF2XuIU/2tmW9fUTwqrtgSyrRnbB7GIOAXxNTxoqsl97PuONmnQvzDuty9J2ivYzfuA1UkeXg1g6bYVYRHePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hf7ltMRz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so1888037a12.2
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Sep 2024 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725283457; x=1725888257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6azxJCjDWX/W/JD/7WWC1DKIy2YY4VelIOhDD2eaK5w=;
        b=Hf7ltMRz8G9TEaDo7sjP7B/KyqqXNMfbj2lBMXniaLaFRZu2ZGMG53kcfVbtto/vyt
         lhYBEcYy5wqv8RR86YG5VekGkSz+ek5PgiEbB84nittaJO+H4h7H+tLenmyrPQ/vnD29
         USUCQpuAJAnqJvB9HugaSv3MhwN90g/gMWiAgsJSVsW9maj3JlvNEEqK+Z/7cg9dLT0R
         HI7vBKuPkIcKFC7tOIta/dU27FwugEcgUYjnXXxp4MIQLiMazZasoYbyTgG18/mooBn1
         p+wYkDClMDIpGbaCOQtnE3LJdHu/OmZ4YhlafE/9xx8seLrxZAS9rCp3apxlzIBc97sP
         P/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283457; x=1725888257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6azxJCjDWX/W/JD/7WWC1DKIy2YY4VelIOhDD2eaK5w=;
        b=XHRaaiLr4g3JCrTBCGivO4aRR7PVq3DEeGuHpTKq+bSMiRKTkR79RAD+ha+C5chdle
         mA8ObUjSf9dNaDjFG/ToUkRgETx1sOhiXMt3eoojcWTZj63qB0Yu96jYX8Vud6WljqwM
         YNXRmctaB6w5HYDGExa8ZRDX32GoA0i/KAwMS5suUeofFK9v9hYmodInprxmvXmPIdHq
         fiMr2ulkFofmLzXveYZff1pyxdZrNj/FQ36XRQVP7oqFok4zVl09GkknejgAY9Mh0kU6
         q1Cq3Qt9QcXQoS466NdXRjt5dNw2Ig9LuZvgH/0x7PQBFvW1myq0BMA80E7jGXnsrbVL
         y0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJg6QK+FF8yIot7qMGEB2bRfJ38U45S1cwMj4iVTvw/GroUfYK3eEceYee5SYslxNuYs1O0OnQLYWbzDel0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cl0eXI4WPAxXpU0UARwkkNWh4b77Dax2RIcD6r4L3cFrP8Nd
	7wOMAjvwr2akxk2aRLElHMijsYaiD4XHDGfrkIorfcIDzUkJza7+zuAnVXKazNA=
X-Google-Smtp-Source: AGHT+IGCVB4BVkV5YpqoydeVP7BcnAjpWVuJ1Yby+IiLAWIsgokgFRAedap2Bs2NfpNdpuevDQI4jA==
X-Received: by 2002:a17:907:6094:b0:a7a:adac:57d5 with SMTP id a640c23a62f3a-a897f84d7efmr981426266b.18.1725283456611;
        Mon, 02 Sep 2024 06:24:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6e0sm556060266b.77.2024.09.02.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:24:16 -0700 (PDT)
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
	claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: rzg2l-cpg: Move PM domain power on in rzg2l_cpg_pd_setup()
Date: Mon,  2 Sep 2024 16:23:59 +0300
Message-Id: <20240902132402.2628900-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move the PM domain power on in rzg2l_cpg_pd_setup(). With this the
previously always-on power domains got
struct generic_pm_domain::{power_on, power_off} populated (and
registered with simple_qos_governor if #power-domain-cells = <1> and
with pm_domain_always_on_gov if #power-domain-cells = <0>). The values for
struct generic_pm_domain::{power_on, power_off} are now populated for
all registered domains but used by core only for the domains that can
use them (the PM domain should be non always-on and registered with
simple_qos_governor). Moreover, the power on/off functions check if the
mstop support is valid. The mstop is populated only by the RZ/G3S
initialization code at the moment.

This approach was chosen to keep the code simple and use the same code
across different implementations. There should be no issues with this
approach as the always on domains are registered with GENPD_FLAG_ALWAYS_ON
and the PM domain core takes care of it.

This approach allows doing further cleanups on the rzg2l_cpg power domain
registering code that will be handled by the next commit.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88bf39e8c79c..51ee1b063d9f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1680,23 +1680,26 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
+static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd,
+				     struct dev_power_governor *governor)
 {
-	struct dev_power_governor *governor;
+	bool always_on = !!(pd->genpd.flags & GENPD_FLAG_ALWAYS_ON);
+	int ret;
 
 	pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
 	pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
-	if (always_on) {
-		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
-		governor = &pm_domain_always_on_gov;
-	} else {
-		pd->genpd.power_on = rzg2l_cpg_power_on;
-		pd->genpd.power_off = rzg2l_cpg_power_off;
-		governor = &simple_qos_governor;
-	}
+	pd->genpd.power_on = rzg2l_cpg_power_on;
+	pd->genpd.power_off = rzg2l_cpg_power_off;
+
+	ret = pm_genpd_init(&pd->genpd, governor, !always_on);
+	if (ret)
+		return ret;
+
+	if (governor == &simple_qos_governor && always_on)
+		ret = rzg2l_cpg_power_on(&pd->genpd);
 
-	return pm_genpd_init(&pd->genpd, governor, !always_on);
+	return ret;
 }
 
 static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
@@ -1711,8 +1714,9 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 		return -ENOMEM;
 
 	pd->genpd.name = np->name;
+	pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 	pd->priv = priv;
-	ret = rzg2l_cpg_pd_setup(pd, true);
+	ret = rzg2l_cpg_pd_setup(pd, &pm_domain_always_on_gov);
 	if (ret)
 		return ret;
 
@@ -1785,20 +1789,16 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 			return -ENOMEM;
 
 		pd->genpd.name = info->pm_domains[i].name;
+		if (always_on)
+			pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 		pd->conf = info->pm_domains[i].conf;
 		pd->id = info->pm_domains[i].id;
 		pd->priv = priv;
 
-		ret = rzg2l_cpg_pd_setup(pd, always_on);
+		ret = rzg2l_cpg_pd_setup(pd, &simple_qos_governor);
 		if (ret)
 			return ret;
 
-		if (always_on) {
-			ret = rzg2l_cpg_power_on(&pd->genpd);
-			if (ret)
-				return ret;
-		}
-
 		domains->domains[i] = &pd->genpd;
 		/* Parent should be on the very first entry of info->pm_domains[]. */
 		if (!i) {
-- 
2.39.2


