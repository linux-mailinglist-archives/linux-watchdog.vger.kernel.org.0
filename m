Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900383C87C9
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jul 2021 17:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239615AbhGNPie (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Jul 2021 11:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbhGNPid (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Jul 2021 11:38:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96DDC06175F
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Jul 2021 08:35:41 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y7so3624207ljm.1
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Jul 2021 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rh3lGfHwMJkZvu76gzDf+JL+UpvhGWVQ3c17N4FInmg=;
        b=PaaNEtURxRHgra3yOhwrjPi6zrrA2/7RkcZfuvN722AEsEjQGnyJu5tJK/b/sPl+0u
         7wI8SUSvB1CeTZJlo1UJoOVBpMKamqr4QVUmEaqjKglEcpZJYWa/AbAHZaJX2orgoVXN
         h9w+uL3b/NczNS9s0EZxuEq9HB9TQNPXGx8rmhhGLDHRyLGncG7ufZx9lzXaY5ZnuGWy
         lgPTfRSTNoCD0ypRMp5Y5NnXxLhBmqrCEP9QZBAQCYPrf28YbVfgJ5V++5W5MlAXjEVd
         vpVEJbDLZywUab9Zh0EvpweBCFafmBfmCl2npjjUvxREYd5jHrLT54aOPt7rK+j2JBHU
         2ZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rh3lGfHwMJkZvu76gzDf+JL+UpvhGWVQ3c17N4FInmg=;
        b=hMpJcmisyL8PWB88XAseA2KKBncdGpivcX1GuPFvR2hSpA4fIg+aicEqBmlJilpYsC
         C8ANupkp0yFe0rE0e4wx3Hsgk+KuhiwZNlFF1cp1UCZAJ3ZJ+ksyBAFV5HcPzk5s61ew
         M02vAZoKxl4IQwwau3T5cMurY4xyMUbx0Fr7d46UiCaQSFFeJOLiKy9zEPRlrfHZ8fmf
         44jP/cye+hFuofrWl8RetNUK5zE1nqPZrMqCRA/sZimdw+kHIBmNLjgh7HIOdjMCRFtb
         LCg+KVxctH1QEL3NzW/re24UTQVLr2KsiZPAHJcxBy5l3RJ2mpt8KNj76N9ynAYfJd/D
         tZNg==
X-Gm-Message-State: AOAM530RB2ePy68WJqx0KxGy+L1t2b/Ygk9eQYxFq6nHlpsORJw2Vn7M
        iyxyhajVVYY9Pjzm7NlN9E6GuXmZkVdt/A==
X-Google-Smtp-Source: ABdhPJzPHx3g79z7MbW7jvxcuo2z9KIozAk6uprFGNyZMFkf7J13YxDFZPCw40OTLUfC45w4/hx39A==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr9826030lji.201.1626276939499;
        Wed, 14 Jul 2021 08:35:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y3sm269984ljj.121.2021.07.14.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:35:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 2/2] watchdog: max63xx_wdt: Add device tree probing
Date:   Wed, 14 Jul 2021 17:33:14 +0200
Message-Id: <20210714153314.1004147-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714153314.1004147-1-linus.walleij@linaro.org>
References: <20210714153314.1004147-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds device tree probing to the MAX63xx driver so it can be
instantiated from the device tree. We use the generic fwnode-based
method to get to the match data and clean up by constifying the
functions as the match is indeed a const.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/watchdog/max63xx_wdt.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index 3a899628a834..9e1541cfae0d 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -26,6 +26,7 @@
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/property.h>
 
 #define DEFAULT_HEARTBEAT 60
 #define MAX_HEARTBEAT     60
@@ -99,8 +100,8 @@ static const struct max63xx_timeout max6373_table[] = {
 	{ },
 };
 
-static struct max63xx_timeout *
-max63xx_select_timeout(struct max63xx_timeout *table, int value)
+static const struct max63xx_timeout *
+max63xx_select_timeout(const struct max63xx_timeout *table, int value)
 {
 	while (table->twd) {
 		if (value <= table->twd) {
@@ -202,14 +203,17 @@ static int max63xx_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct max63xx_wdt *wdt;
-	struct max63xx_timeout *table;
+	const struct max63xx_timeout *table;
 	int err;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
-	table = (struct max63xx_timeout *)pdev->id_entry->driver_data;
+	/* Attempt to use fwnode first */
+	table = device_get_match_data(dev);
+	if (!table)
+		table = (struct max63xx_timeout *)pdev->id_entry->driver_data;
 
 	if (heartbeat < 1 || heartbeat > MAX_HEARTBEAT)
 		heartbeat = DEFAULT_HEARTBEAT;
@@ -255,11 +259,23 @@ static const struct platform_device_id max63xx_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, max63xx_id_table);
 
+static const struct of_device_id max63xx_dt_id_table[] = {
+	{ .compatible = "maxim,max6369", .data = max6369_table, },
+	{ .compatible = "maxim,max6370", .data = max6369_table, },
+	{ .compatible = "maxim,max6371", .data = max6371_table, },
+	{ .compatible = "maxim,max6372", .data = max6371_table, },
+	{ .compatible = "maxim,max6373", .data = max6373_table, },
+	{ .compatible = "maxim,max6374", .data = max6373_table, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max63xx_dt_id_table);
+
 static struct platform_driver max63xx_wdt_driver = {
 	.probe		= max63xx_wdt_probe,
 	.id_table	= max63xx_id_table,
 	.driver		= {
 		.name	= "max63xx_wdt",
+		.of_match_table = max63xx_dt_id_table,
 	},
 };
 
-- 
2.31.1

