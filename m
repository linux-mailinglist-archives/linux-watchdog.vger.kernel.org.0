Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222444153D1
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Sep 2021 01:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhIVXUI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 Sep 2021 19:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbhIVXUH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 Sep 2021 19:20:07 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88FBC061574
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:18:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p29so18231249lfa.11
        for <linux-watchdog@vger.kernel.org>; Wed, 22 Sep 2021 16:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8c9lieVpqkGq0z+P8vsTZtzmbllYE5v1S+LgyE8LNrw=;
        b=zh3XIZHo2w2ehA36vPOdCSaMSbb+oPTq0RLy73mETSRmAbhrwp+HrA88uzR2Xb7ZQF
         03SDVBJe9Hqe8m3NEWaqz7UJYcXOzRK0fJkTJLQSQiuzK43D8/8vDVF2yRZWURxg1IKr
         Hobsu9grYjTXtgFZkRAiM3cFzFEiH7MNAxr5nLDCrmKRd19YpUdecDP6pZQLNqIs3f7+
         z78czD5UCu96Hl3KRaZnvtvU5F98X2mQuOD7DcvH2hm1aDnGr+WVxLTcJBv0WvYEzDuB
         17tbTMligu1bKja2cmR/k1wlws8XdP4Zj02L3oqyM361oQGuOaGrRQLc7ffqgr4Q736m
         F35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8c9lieVpqkGq0z+P8vsTZtzmbllYE5v1S+LgyE8LNrw=;
        b=s95xLCA7oBHm7UtaPs21Hf5rd8v06gzmCFZdzpiKdObWIJaK7go0gWV2TTJugsNJQc
         ZI+gUB8mOxSjEFDtUNZ0/PuIE0kQ7jbH6zy08ZZ+lJTefe3QJsf50LKi92pQgBJmL2Iw
         pORfutw4OzpBHdOfP3SrHlwWrzGNWEGaPmLMMVIpLJ9993QN0N1IqKB2uvLm6xcUedRP
         lhuDoapwCAy+RNIU19JYeZKqjOR+aKWPxm+N+K3Epi1U6TPohneESYMg7PL0dQqMPI+0
         jHZRWuUUJZPwibpmExZgH4lGk4oJIPxrgCIdSZUvOPdyqvUggKYY0KitOqyaiDIw/12p
         eKxA==
X-Gm-Message-State: AOAM530x8z0CMpumHdBZyt8lkXCSDzFveBYwJAoxZqNStPTcsLMR9/Kf
        bYzs3YlRGiznut9ma8m+RA+bPQ==
X-Google-Smtp-Source: ABdhPJwm2ZKlQPyJFMLnleYfOEhjR2e4hhccJ2AEsfx3u7uYH+JtIGKljufhXBCKbYWGYI93lC37Gw==
X-Received: by 2002:a05:6512:3407:: with SMTP id i7mr1366457lfr.149.1632352715212;
        Wed, 22 Sep 2021 16:18:35 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u28sm288044lfo.47.2021.09.22.16.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 16:18:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 3/3] watchdog: db8500_wdt: Rename symbols
Date:   Thu, 23 Sep 2021 01:09:47 +0200
Message-Id: <20210922230947.1864357-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922230947.1864357-1-linus.walleij@linaro.org>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

For conistency and clarity, rename all symbols and strings from
ux500 to db8500 in the driver.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Lee it would be perfect if you could ACK the oneliner in
this patch along with the rest.
---
 drivers/mfd/db8500-prcmu.c    |  2 +-
 drivers/watchdog/db8500_wdt.c | 76 +++++++++++++++++------------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index ccf6be922b39..56c61c99eb23 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2939,7 +2939,7 @@ static struct regulator_init_data db8500_regulators[DB8500_NUM_REGULATORS] = {
 };
 
 static const struct mfd_cell common_prcmu_devs[] = {
-	MFD_CELL_NAME("ux500_wdt"),
+	MFD_CELL_NAME("db8500_wdt"),
 	MFD_CELL_NAME("db8500-cpuidle"),
 };
 
diff --git a/drivers/watchdog/db8500_wdt.c b/drivers/watchdog/db8500_wdt.c
index 40f8cf1cb234..6ed8b63d310d 100644
--- a/drivers/watchdog/db8500_wdt.c
+++ b/drivers/watchdog/db8500_wdt.c
@@ -35,60 +35,60 @@ MODULE_PARM_DESC(nowayout,
 	"Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static int ux500_wdt_start(struct watchdog_device *wdd)
+static int db8500_wdt_start(struct watchdog_device *wdd)
 {
 	return prcmu_enable_a9wdog(PRCMU_WDOG_ALL);
 }
 
-static int ux500_wdt_stop(struct watchdog_device *wdd)
+static int db8500_wdt_stop(struct watchdog_device *wdd)
 {
 	return prcmu_disable_a9wdog(PRCMU_WDOG_ALL);
 }
 
-static int ux500_wdt_keepalive(struct watchdog_device *wdd)
+static int db8500_wdt_keepalive(struct watchdog_device *wdd)
 {
 	return prcmu_kick_a9wdog(PRCMU_WDOG_ALL);
 }
 
-static int ux500_wdt_set_timeout(struct watchdog_device *wdd,
+static int db8500_wdt_set_timeout(struct watchdog_device *wdd,
 				 unsigned int timeout)
 {
-	ux500_wdt_stop(wdd);
+	db8500_wdt_stop(wdd);
 	prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
-	ux500_wdt_start(wdd);
+	db8500_wdt_start(wdd);
 
 	return 0;
 }
 
-static const struct watchdog_info ux500_wdt_info = {
+static const struct watchdog_info db8500_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
-	.identity = "Ux500 WDT",
+	.identity = "DB8500 WDT",
 	.firmware_version = 1,
 };
 
-static const struct watchdog_ops ux500_wdt_ops = {
+static const struct watchdog_ops db8500_wdt_ops = {
 	.owner = THIS_MODULE,
-	.start = ux500_wdt_start,
-	.stop  = ux500_wdt_stop,
-	.ping  = ux500_wdt_keepalive,
-	.set_timeout = ux500_wdt_set_timeout,
+	.start = db8500_wdt_start,
+	.stop  = db8500_wdt_stop,
+	.ping  = db8500_wdt_keepalive,
+	.set_timeout = db8500_wdt_set_timeout,
 };
 
-static struct watchdog_device ux500_wdt = {
-	.info = &ux500_wdt_info,
-	.ops = &ux500_wdt_ops,
+static struct watchdog_device db8500_wdt = {
+	.info = &db8500_wdt_info,
+	.ops = &db8500_wdt_ops,
 	.min_timeout = WATCHDOG_MIN,
 	.max_timeout = WATCHDOG_MAX28,
 };
 
-static int ux500_wdt_probe(struct platform_device *pdev)
+static int db8500_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
 
 	timeout = 600; /* Default to 10 minutes */
-	ux500_wdt.parent = dev;
-	watchdog_set_nowayout(&ux500_wdt, nowayout);
+	db8500_wdt.parent = dev;
+	watchdog_set_nowayout(&db8500_wdt, nowayout);
 
 	/* disable auto off on sleep */
 	prcmu_config_a9wdog(PRCMU_WDOG_CPU1, false);
@@ -96,7 +96,7 @@ static int ux500_wdt_probe(struct platform_device *pdev)
 	/* set HW initial value */
 	prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
 
-	ret = devm_watchdog_register_device(dev, &ux500_wdt);
+	ret = devm_watchdog_register_device(dev, &db8500_wdt);
 	if (ret)
 		return ret;
 
@@ -106,47 +106,47 @@ static int ux500_wdt_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int ux500_wdt_suspend(struct platform_device *pdev,
+static int db8500_wdt_suspend(struct platform_device *pdev,
 			     pm_message_t state)
 {
-	if (watchdog_active(&ux500_wdt)) {
-		ux500_wdt_stop(&ux500_wdt);
+	if (watchdog_active(&db8500_wdt)) {
+		db8500_wdt_stop(&db8500_wdt);
 		prcmu_config_a9wdog(PRCMU_WDOG_CPU1, true);
 
 		prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
-		ux500_wdt_start(&ux500_wdt);
+		db8500_wdt_start(&db8500_wdt);
 	}
 	return 0;
 }
 
-static int ux500_wdt_resume(struct platform_device *pdev)
+static int db8500_wdt_resume(struct platform_device *pdev)
 {
-	if (watchdog_active(&ux500_wdt)) {
-		ux500_wdt_stop(&ux500_wdt);
+	if (watchdog_active(&db8500_wdt)) {
+		db8500_wdt_stop(&db8500_wdt);
 		prcmu_config_a9wdog(PRCMU_WDOG_CPU1, false);
 
 		prcmu_load_a9wdog(PRCMU_WDOG_ALL, timeout * 1000);
-		ux500_wdt_start(&ux500_wdt);
+		db8500_wdt_start(&db8500_wdt);
 	}
 	return 0;
 }
 #else
-#define ux500_wdt_suspend NULL
-#define ux500_wdt_resume NULL
+#define db8500_wdt_suspend NULL
+#define db8500_wdt_resume NULL
 #endif
 
-static struct platform_driver ux500_wdt_driver = {
-	.probe		= ux500_wdt_probe,
-	.suspend	= ux500_wdt_suspend,
-	.resume		= ux500_wdt_resume,
+static struct platform_driver db8500_wdt_driver = {
+	.probe		= db8500_wdt_probe,
+	.suspend	= db8500_wdt_suspend,
+	.resume		= db8500_wdt_resume,
 	.driver		= {
-		.name	= "ux500_wdt",
+		.name	= "db8500_wdt",
 	},
 };
 
-module_platform_driver(ux500_wdt_driver);
+module_platform_driver(db8500_wdt_driver);
 
 MODULE_AUTHOR("Jonas Aaberg <jonas.aberg@stericsson.com>");
-MODULE_DESCRIPTION("Ux500 Watchdog Driver");
+MODULE_DESCRIPTION("DB8500 Watchdog Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:ux500_wdt");
+MODULE_ALIAS("platform:db8500_wdt");
-- 
2.31.1

