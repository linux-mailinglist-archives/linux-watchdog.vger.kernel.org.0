Return-Path: <linux-watchdog+bounces-1662-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3F9688C2
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 15:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFDAD1C22705
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEF5205E16;
	Mon,  2 Sep 2024 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XrS6UD7c"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0705210191
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Sep 2024 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283464; cv=none; b=ZDIAosJ/XqQ9WzgQgPPjfKb0NAmZWtJk/AQKLhKGVpYhtjKh0TF3vLpPYw12Oo5xygdx1kD85SPQSNAmf6arZm2mMvWR9FhwdPeN1Usu4ezLXeHcl4Z6Ulig2o2Ro5gO78GLxZb6JvWVPJF9juNkkx4kNGf81/0VYWSfov7qmUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283464; c=relaxed/simple;
	bh=gdX4LY/4yU+mlWy8gCvvEjSlGF+vBwCodsPP82Gby4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMh82Fnv2aqOJNIxl9WkCxsijgYYNFXe4+moBEV+4fWd+yT5m2B9Y1kIwnMTUFyKoJcNrhksQ+jqTx7SY4ciaoZiZmJF85GcORXY/9hXGSwo/7LAD5vwJtHzLZRmGr3tLUH9Qd2rYcyz0Ep4M78owvjax8Rx1MpVpP+Vez+hO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XrS6UD7c; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a869332c2c2so833342766b.0
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Sep 2024 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725283461; x=1725888261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im5aw856OWg4/fogGw4xCv7sKGPQlBRJhw+64YokHEM=;
        b=XrS6UD7cTGntujm37rG/rpAio1+nqOmhyPRnEJvndjOg07ItKP7qPzuBNB7G1KSIXH
         tCHPydILi5NfB4AiAe4ma0OYO4o8CrRUW9875h74aDk41Vlo+h8G6sZBPijIGr7a9hjl
         cno3JHLXagxg7cSZQmj1Mi2UtUNqObSq5FKB6HX+nsATrzZ9B+j4fs9nlud52reQTu/n
         1CUztKQ7S7E1ISuEXdk3m1L7gFmcvkgH+haEQwaZspchBdq4qwRsysgmBtdpaawoIHl5
         x0SgT7hANpmrYZgB50cqWkapGj4vRpQZdOcpmNieA0+3C+13z2KW5a/XyJC66gGoTAx2
         xXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283461; x=1725888261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=im5aw856OWg4/fogGw4xCv7sKGPQlBRJhw+64YokHEM=;
        b=vS8hIlFxakrNBdXAhcDbLnsKG4kceOoT2FU4e+d0eIraIZVJJMUxBZePt0NX1gTOqk
         8WDylvI7ZpFgVAMa46OpPvs6zrZh+h6o8OxubuLoXdlFyMfhibaib7B+x1M+iGK3GNxx
         y5Cla8qXOAYrmIu7QupR6xSiKzFDGTGCFsHYU9Ct7D4DwEcec9rq6KqStmKcDhO2GVZ/
         FwPx+OLwbCxJBKJDiCGLMB+ONbGCWkzOy5Mo2Z/YdiRkIc7X5oFGkpuf5xXRQeqIgjwC
         sWo+B5gZr3KD5xIWOW5gh5i3HRkJjg9pZQr7FNYKZ+Fkzw7SQwYt1YoXuQf9V1rHrQ0o
         OqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJaUX3f4uMI8DLzQPg4OeoJzoAixIyg9MksEgmzXCAvSUo2tfQ68k3OPhQ+W8Vb0kjuHW/fhYhFiQ88Rhe/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqUzIhyzxpeyR12cWspjh0rByXZ/kBTaULKUEz1W+8wfo12TM
	ECQs7EgWEBFVNsMAfdv12MDeaE94PF1sUKJmeGTajpWHhwKT8JkkU3MoTkdS/C0=
X-Google-Smtp-Source: AGHT+IHWgodDTCMpY6sAaF4OeL9wHVBwlEZaCHhwCHZIzlirti4fLX+yVhPcOLQSsTLCiVff+6iwfw==
X-Received: by 2002:a17:907:6d25:b0:a86:94cd:97f0 with SMTP id a640c23a62f3a-a89a26bfcb7mr1167450566b.19.1725283460815;
        Mon, 02 Sep 2024 06:24:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6e0sm556060266b.77.2024.09.02.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:24:20 -0700 (PDT)
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
Subject: [PATCH v3 4/4] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Mon,  2 Sep 2024 16:24:02 +0300
Message-Id: <20240902132402.2628900-5-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected Ulf's tag

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


