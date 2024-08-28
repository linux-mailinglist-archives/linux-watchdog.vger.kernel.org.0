Return-Path: <linux-watchdog+bounces-1553-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530539629C6
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 16:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFF91F25010
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 14:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05DF1891AA;
	Wed, 28 Aug 2024 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kSnq8xHZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CD91898F1
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Aug 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853982; cv=none; b=RSQzSjLBgYkFM1OxJAWCw6EwZW1oQfaA3W9J8y8/zCEo5NM1lac8yyvpk0jE4eu8FTHrp6HK4DZojaQbYt1vvy6fwI68S4NFEiFtPuW0d6RpIxYAddCt1nvR2GdqkJzIwtvhP6aXUFLtokDUzGk/eTkkmqdqwhICHqUTnOoa8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853982; c=relaxed/simple;
	bh=RZ7f8KSDfavIg2LMNLDwKSDIUWMWuB94Qd8u4dHZeAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cy6lRP4JgFNNVljK6hdnrzE1nnQMYIR0KccJdUD1/rSNsrOPACylbHIb/fDUlc94FmkEodk1cly7eyixDy6DcBx92XCnj8FNqY54PllJtSgBpfDU1E87aYuFOiVEfg+FpZk06rtXzC9vij0nnjWW+TLenEs7045Yz21mIog+k1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kSnq8xHZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a81bd549eso539845566b.3
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Aug 2024 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724853978; x=1725458778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9iF1jJIvtOjyxkFa1dGcE5P1zK7/0vC9veIHL8v450=;
        b=kSnq8xHZmThYKL9vBgbC2urulWGAc5YWtqbKicaWc9kVI0opDrqxru4IsLhWzZiRW9
         KTpfS/A0KoIa2tR+QG2uJxLyR4PCjK+H7zQvyukTmv7XsaPNqzKj85yYByapooyCXpGd
         O8dUJJtEpig4t+qZF+pK4GqaCJXezTSw1so2r9MnItWKTuYJ8gvDPnNOypNKs69my8Zg
         VXsPGIwpk3gNNsw1F2poKM5GLK2kyLU2om44Io95/olJdvmKr7iBAYtmPIrdU19YlAn9
         TyWPzQGAKsT/yR5Tvgo51M91dzLw6KU8iLtUI7DsLvPXBTCjTbip6e20Lu2ys8cpc+X8
         f9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853978; x=1725458778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9iF1jJIvtOjyxkFa1dGcE5P1zK7/0vC9veIHL8v450=;
        b=IiltUis522+vyHUfGiYgy2McCgE3jBvq4cdRXbTdWShOnGI7eYo6rE/5Hsy6SvGifD
         aGSIfPUVWNgkDKjgWGyErISP/K82T4q3xw6HArftJHzdCjjenHmBdF479ceJawzDSZ/l
         oGPqN8aQoqs+KVSx5pB6OkDvl8nSWUwpgxHhxfIQO+bdIQZ8OBzt7RUSskD7KJKO3NJC
         DncPcZzkYDiwMUfUhhnO60ilTvo5ORRM7nJPn25UgIMCsR10/lc2KiIDKwLrkdPbMd2m
         RIC1gSwPXCqrX+wQu1Bg4MfWOrfrLHI3gdnITLd5MHjIfxBYdlHecvEsNXgUiztJHXXg
         a0wA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/cnOjVscd2st2AVNZoZs55qmNUAKgvps/oHmTJtHuPQnCwD95syFxoHC/N2hhU0QsCFMavvWeXY18Pp9jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxksiFS98ErScIVELP55hj+XBrnMkCsWdd0s6i2Ns0C5n/Wc0wV
	jZm2pqpAbzyMj++puLfv5DYGsXP088jSwEwVVDx1UWTxJbpO3190QtUA/U1lL+M=
X-Google-Smtp-Source: AGHT+IEsHCbcGPRfjvRa3ReFX+yeEg97TxBu8qrzEnpYz3gK7FeIv1FbQkePSMHvE/KzGYp7D32IZw==
X-Received: by 2002:a17:907:ea1:b0:a86:789c:2d07 with SMTP id a640c23a62f3a-a86a516305emr1476874566b.4.1724853977604;
        Wed, 28 Aug 2024 07:06:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54b50dbsm251875666b.93.2024.08.28.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:06:17 -0700 (PDT)
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
Subject: [PATCH v2 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Wed, 28 Aug 2024 17:06:02 +0300
Message-Id: <20240828140602.1006438-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
this case, the watchdog device need to be powered on in
struct watchdog_ops::restart API. This can be done though
pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
watchdog device though pm_runtime_irq_safe().

Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") pm_runtime_get_sync() was used in watchdog restart handler
(which is similar to pm_runtime_resume_and_get() except the later one
handles the runtime resume errors).

Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") dropped the pm_runtime_get_sync() and replaced it with
clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
in genpd_runtime_resume() being called from atomic context. But
clk_prepare_enable() doesn't fit for this either (as reported by
Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
wait context warning as it is not written for this).

Because the watchdog device is marked now as IRQ safe (though this patch)
the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
1 for devices not registering an IRQ safe PM domain for watchdog (as the
watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
always-on), this being the case for RZ/G3S with old device trees and
the rest of the SoCs that use this driver, we can now drop also the
clk_prepare_enable() calls in restart handler and rely on
pm_runtime_resume_and_get().

Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
watchdog restart handler.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- adjusted patch description and comment from code
- collected tags

Changes since RFC:
- use pm_runtime_resume_and_get() and pm_runtime_irq_safe()
- drop clock prepare in probe

 drivers/watchdog/rzg2l_wdt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 2a35f890a288..11bbe48160ec 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/units.h>
@@ -166,8 +167,22 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	clk_prepare_enable(priv->pclk);
-	clk_prepare_enable(priv->osc_clk);
+	/*
+	 * In case of RZ/G3S the watchdog device may be part of an IRQ safe power
+	 * domain that is currently powered off. In this case we need to power
+	 * it on before accessing registers. Along with this the clocks will be
+	 * enabled. We don't undo the pm_runtime_resume_and_get() as the device
+	 * need to be on for the reboot to happen.
+	 *
+	 * For the rest of SoCs not registering a watchdog IRQ safe power
+	 * domain it is safe to call pm_runtime_resume_and_get() as the
+	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
+	 * returns non zero value and the genpd_lock() is avoided, thus, there
+	 * will be no invalid wait context reported by lockdep.
+	 */
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	if (priv->devtype == WDT_RZG2L) {
 		ret = reset_control_deassert(priv->rstc);
@@ -275,6 +290,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2


