Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8247471BB0
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 18:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhLLRCw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 12:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbhLLRCv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 12:02:51 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34106C061751
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Dec 2021 09:02:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id t26so26861953lfk.9
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Dec 2021 09:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MRYMWvMSgbm1DPE7qOWCYzLcqFX1M9vNFJzIygrqKQ=;
        b=UM4KlJhEv1naXg/Htys6VhQs5DoBOnIdlUA/fbR2i3Buc7Tn/Dvyvd3vB4hTraBVyS
         A3H3bsjHz0rAq1hn10yvDtc2m0NhHgTE9pIWb+tbLWNKrUz6m0K6oPKKESu8GJrMIYgt
         2goi69Pg0ogctx3SMbJCgsn4Z/W5Pv3mf/ZJliLzhzCLWWILXqryTinZOBhZKGJiB3/H
         gxg0Bye/nDtnutXWs6DYTkLsEtRRysv4l2+f2zyZtbEgKnjxC1FHde4FMW4IWp78FoDi
         XPUVDq5LTUNj12ykjUKbe8ZOqvE1ZMmh/TnXPDv2veBc84mn4HCcx6h7GSxhfkNQfpLq
         R17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9MRYMWvMSgbm1DPE7qOWCYzLcqFX1M9vNFJzIygrqKQ=;
        b=MWwmNZN00+1l/vKc2DyOuu+dd1u3W+P/4OoevWnVyq9kNGqlF3mplrT/7nyekGTS4V
         ZWmTOdgp4yK8rncgtjsoUrBlXg7fK0Lh/XWvfu3meH1YWDt5lqB8oD1KXrk3ikPVKc/5
         YNTJSRfV0aV7/OpqwMYXtJ5Tsdf7HKmiPobU3IsAP4YgxcgPdzbn35lLFXYQjHSgBBTB
         e+3y8CssnwtG6WduvZ06fTraKw6+hpN9jsYxOgQk70th5TokEdAi8wnKN3SLhW9qogDv
         QMe7OS3JAmpRzqbiDOamnJZdt5wLhcRLHXqbY1becasdesI4WetS4sq7XBJ0SbMRJnt9
         lxdw==
X-Gm-Message-State: AOAM532wgs65QPJtKpgwJW/U31OXKOivfljzLcSOfpZgmyr1NckZ4a9U
        caJhCQDiqictHK8J7EDYVW6egw==
X-Google-Smtp-Source: ABdhPJzI5Xq6c3ReocWmOPqywfJDbZjbxuvLrqWWrm6AGizsUFfbV2wQSl4KrMzaLyJmcS3tKG3lYw==
X-Received: by 2002:a05:6512:34cc:: with SMTP id w12mr24434030lfr.134.1639328569325;
        Sun, 12 Dec 2021 09:02:49 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id v14sm1098763lfe.59.2021.12.12.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 09:02:48 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: s3c2410: Fix getting the optional clock
Date:   Sun, 12 Dec 2021 19:02:47 +0200
Message-Id: <20211212170247.30646-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"watchdog_src" clock is optional and may not be present for some SoCs
supported by this driver. Nevertheless, in case the clock is provided
but some error happens during its getting, that error should be handled
properly. Use devm_clk_get_optional() API for that. Also report possible
errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
clock provider is not ready by the time WDT probe function is executed).

Fixes: a4f3dc8d5fbc ("watchdog: s3c2410: Support separate source clock")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bb374b9fc163..71c280d3e1a2 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -713,16 +713,18 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	 * "watchdog_src" clock is optional; if it's not present -- just skip it
 	 * and use "watchdog" clock as both bus and source clock.
 	 */
-	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
-	if (!IS_ERR(wdt->src_clk)) {
-		ret = clk_prepare_enable(wdt->src_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable source clock\n");
-			ret = PTR_ERR(wdt->src_clk);
-			goto err_bus_clk;
-		}
-	} else {
-		wdt->src_clk = NULL;
+	wdt->src_clk = devm_clk_get_optional(dev, "watchdog_src");
+	if (IS_ERR(wdt->src_clk)) {
+		dev_err_probe(dev, PTR_ERR(wdt->src_clk),
+			      "failed to get source clock\n");
+		ret = PTR_ERR(wdt->src_clk);
+		goto err_bus_clk;
+	}
+
+	ret = clk_prepare_enable(wdt->src_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable source clock\n");
+		goto err_bus_clk;
 	}
 
 	wdt->wdt_device.min_timeout = 1;
-- 
2.30.2

