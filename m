Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0493A7E4B
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jun 2021 14:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhFOMlV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Jun 2021 08:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhFOMlU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Jun 2021 08:41:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301F4C061574
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f30so26828863lfj.1
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyZKI2E4xTT0UFZR/tw10S5XdRfz+byZmgoSg9CzmTo=;
        b=rIYK1gIKo3lAxjw+6EGBH8HFSTz0+g9e1u0LDG0pFGprGw/dR5tKmTnXiZVF/mu0vd
         FaIvQbVu7aPUysVyTt/PDXrWBB5al/txEClciVkBCvn1wy5JzYeA2qvIIKRKZl5FMk++
         uwtt0d0sT3JKxIp63hf9AeAH5JhiXZUdB/UA3c3p1xlKKH4bW2e6BdPav0veoBYdrFUr
         rIzOqkvh8F1rYn6JB1DHFpZmoiHBOLPycUCqg6IM8leMWedzLCYb63Fz/ZxG97ged74T
         30AEpzHKU2nuZ2bcGGEJ5zK1yAY5EmVPZsA7Nj2cjQ0jPlBC/KPAx7/+XGIohZY+bzVt
         5NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyZKI2E4xTT0UFZR/tw10S5XdRfz+byZmgoSg9CzmTo=;
        b=aWVuyTBBQ6jQ4qMLSWacDB5YV4rDl/wwgv2CQXKS88ceoreXV8hAAGX7FujBLBpxFM
         GkLi4GPIIBTxD/1X5lt8smRBEF/bnNJOY22qoYlz3JZiup4nqcrpu0966495agPOnuVd
         /xfhk6Ux/4wzkT7NX1v68WPyxXqA0Ctn2Asm731MZD4f+f6+ihpdIBLoZoAzL7HTy3HY
         lhfQhwzRHa/nAjCb28Gx/h3tNHxqjnFS7p1X1IEO7KHsx59Ow88E5OjGQrU8hQxSk0nT
         OtxDWfVAHHeEIQjrcwbjmpBM9gB4mS0Cor+f4fXvicjl6FCy6Z8WCvUYdp9v8sCB7r0c
         bf8w==
X-Gm-Message-State: AOAM532WnHHBKUeJ4okfHNnJYWEvJCEj7CJRcjDQAIhEGKPhPWp+44N8
        74tdylpNKJR1zrlDd2tO/HX+yw==
X-Google-Smtp-Source: ABdhPJxD7qxtXON/8OSwQ7cI6lXNk91cBUpvej8MlVp9AQ7iz606MAkLBwiYkiiYtlGim4zS0KqTAA==
X-Received: by 2002:a19:6a0b:: with SMTP id u11mr5558470lfu.269.1623760753465;
        Tue, 15 Jun 2021 05:39:13 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id m12sm811418lfb.231.2021.06.15.05.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 05:39:13 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org,
        Michal Koziel <michal.koziel@emlogic.no>
Subject: [PATCH 2/2] watchdog: imx2_wdg: notify wdog subsystem about wdog suspend/resume
Date:   Tue, 15 Jun 2021 14:39:04 +0200
Message-Id: <20210615123904.2568052-3-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
References: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Suspend routine disables wdog clk. Nevertheless, the watchdog subsystem
is not aware of that and can still try to ping wdog through
watchdog_ping_work. In order to prevent such condition and therefore
prevent from system hang (caused by the wdog register access issued
while the wdog clock is disabled) take advantage of
watchdog_dev_suspend/resume routines which will take care of watchdog
ping worker cancel and restore.

Additionally remove hw ping from suspend/resume since it will be
issued by watchdog_dev_suspend/resume routines.

Signed-off-by: Michal Koziel <michal.koziel@emlogic.no>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/watchdog/imx2_wdt.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index b84f80f7d342..24e3a4d2b529 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -348,6 +348,17 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdog = dev_get_drvdata(dev);
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
+	int ret;
+
+	/*
+	 * Before disabling clk we need to notify wdog subsystem that HW wdog
+	 * is being suspended. This e.g. prevents watchdog_ping_work to fire
+	 * when the clk is disabled, which would result with system hang caused
+	 * by wdog register access while wdog clock is disabled.
+	 */
+	ret = watchdog_dev_suspend(wdog);
+	if (ret)
+		return ret;
 
 	/* The watchdog IP block is running */
 	if (imx2_wdt_is_running(wdev)) {
@@ -356,7 +367,6 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 		 * during resume.
 		 */
 		__imx2_wdt_set_timeout(wdog, IMX2_WDT_MAX_TIME);
-		imx2_wdt_ping(wdog);
 	}
 
 	clk_disable_unprepare(wdev->clk);
@@ -383,12 +393,12 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
 		 */
 		imx2_wdt_setup(wdog);
 	}
-	if (imx2_wdt_is_running(wdev)) {
+	if (imx2_wdt_is_running(wdev))
 		imx2_wdt_set_timeout(wdog, wdog->timeout);
-		imx2_wdt_ping(wdog);
-	}
 
-	return 0;
+	ret = watchdog_dev_resume(wdog);
+
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
-- 
2.29.0

