Return-Path: <linux-watchdog+bounces-913-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF789F8CE
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790031C273DC
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EE218133C;
	Wed, 10 Apr 2024 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lf0sUxq4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B60172BB8
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756486; cv=none; b=lLe/EmbSN8FY96gW/kJjpVL4Dm+xVbvkHve2oBAxyXIqGA/XmreGE/mCGuWfJo8sA87/WtBuTc1ObOYxMNK/NJqc77KcZXIP9x7Zuc5A3+aEOJV3Vs+OfSQiaB6IvrrWN/DBuSFoAxZh6wfr5slbr4Z5ImGeHIFP9NRRZKLkL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756486; c=relaxed/simple;
	bh=CJ5Yg4Su25upi9PiRBilKHZBgxfV1yi9eo8lCkVdx7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWMSXmgTtbehDpyHVrRFdq/rPHJtl3T5L9UvUl3bOF0EcYYwWMmYaOVUqrg2G41pn2MGfiT3dT4KWmFAxE8KqsM/pMQs9+LXJj3tM29WamDsF3Nhy9ON2rUekHWf1YlBPRZ92lBhBeCt3Uj8qDikkuF2ID1WEdf+CMQTgKFPQZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lf0sUxq4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-416c3aca500so7352895e9.3
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756482; x=1713361282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfpDELhZMXS3a+UUIPdr1Q+y0EuPmA52WesKgXwm+Ms=;
        b=Lf0sUxq4UOs3C7KQX9/jUbg4WWL0HxKQYtHJ0eVFePeuWxpcTGK3pjOSU9ihvt0xds
         IDvkGrSrzp4kcU0hbrEOlf2b3FkX+F4MBaEFz/Jo1EQU5pxHJpoA5TKi54fq79ooxF5t
         F6EUNFUCUZY5V0j+Q6546Fv9smaI9MAbA8tMFNZUsHUrvq2Y4dmdOH1P8nRiHDXBtzXp
         iEOb6a4+Vz3kZ3mzEYge9GcWqJljpC1ZJBZnzWXvnYnlAKcDDHUs38vrx+39zcSPRbaF
         mPg2p3RfZm9XtIxYT4lbx2XOiohQ8ViDok2YHvedZWWo6M7aC25cTz3AjGKQoiTfZegC
         a1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756482; x=1713361282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfpDELhZMXS3a+UUIPdr1Q+y0EuPmA52WesKgXwm+Ms=;
        b=uheZVLKg64wdKcahTIN/IU71CvLIMSL7EyYY6AKEw7u3AGvJhVNULsxoeT3lQDavkE
         8jCN10vtpUUUgQkSnJrwkA718TlxvfzYCpieMGyP/viquJdrn5uZvqBehnhkjApay0WH
         y8kJKHk+S0q3vHuE8iahDy4U04224SnAiYZPMeB6T3VzbpkUmywq0jkWTPrGFNlwABPW
         M8yT03tnnEKVoV9rzRqluJmFLkpSv41TMlimFL9L4RPnP3QsF2yJv5G77ep6YiBL9CIa
         Gt9Vx/cnToacv5ueiuWpWB0D+VVBJc/hpAb1AeB4459BfdlyAWFEagrCCWXjFm3E6UJ7
         hMRg==
X-Gm-Message-State: AOJu0YzgkuzjK2hZlZIbbY89Qmyiigj9TWu5CtaZaL71Wy/NhwCr6snT
	UbPrZT8JJOqG9lSiobtHUjzKsuaWQSOS01wjgY2wqkkJQ5aUAr4pv82BiQZLQjo=
X-Google-Smtp-Source: AGHT+IE/n16DpYEO2qqbI73ni/tWCneu2SaQzav7O3neyS/HYU4MN+sPx87irigmMT5RkxaFWg9p4Q==
X-Received: by 2002:a05:600c:1914:b0:415:6d51:8e2d with SMTP id j20-20020a05600c191400b004156d518e2dmr2247721wmq.13.1712756482533;
        Wed, 10 Apr 2024 06:41:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:22 -0700 (PDT)
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
Subject: [PATCH RESEND v8 09/10] watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
Date: Wed, 10 Apr 2024 16:40:43 +0300
Message-Id: <20240410134044.2138310-10-claudiu.beznea.uj@bp.renesas.com>
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

The rzg2l_wdt_restart() is called from atomic context. Calling
pm_runtime_{get_sync, resume_and_get}() or any other runtime PM resume
APIs is not an option as it may lead to issues as described in commit
e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'")
that removed the pm_runtime_get_sync() and used directly the
clk_prepare_enable() APIs.

Starting with RZ/G3S the watchdog could be part of its own software
controlled power domain (see the initial implementation in Link section).
In case the watchdog is not used the power domain is off and accessing
watchdog registers leads to aborts.

To solve this the patch powers on the power domain using
dev_pm_genpd_resume() API before enabling its clock. This is not
sleeping or taking any other locks as the power domain will not be
registered with GENPD_FLAG_IRQ_SAFE flags.

Link: https://lore.kernel.org/all/20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- none, this patch is new

 drivers/watchdog/rzg2l_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index c8c20cfb97a3..98e5e9914a5d 100644
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
@@ -164,6 +165,17 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
+	/*
+	 * The device may be part of a power domain that is currently
+	 * powered off. We need to power it up before accessing registers.
+	 * We don't undo the dev_pm_genpd_resume() as the device need to
+	 * be up for the reboot to happen. Also, as we are in atomic context
+	 * here there is no need to increment PM runtime usage counter
+	 * (to make sure pm_runtime_active() doesn't return wrong code).
+	 */
+	if (!pm_runtime_active(wdev->parent))
+		dev_pm_genpd_resume(wdev->parent);
+
 	clk_prepare_enable(priv->pclk);
 	clk_prepare_enable(priv->osc_clk);
 
-- 
2.39.2


