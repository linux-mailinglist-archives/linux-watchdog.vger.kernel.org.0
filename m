Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93DB194F28
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfHSUhV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:21 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36962 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbfHSUhV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:21 -0400
Received: by mail-oi1-f193.google.com with SMTP id b25so2375806oib.4
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=+wMjhZQxGod5U8h3xZg+V7VhpwjwaWtAtb58s+oCQWM=;
        b=SkWQdZ0//JIARM5fIIav0FX8xGlyzfWoNoMm6SEEppBnTjSV4ivMZQSqRJZTsoozd3
         ZsEft5QPgXA5i2xopJR3pGVIBMd2AYz3k0sJQ1qlo0XITWoxYmr+F0JCuZf/4w3zhyjl
         Ruu4I7eazG2551RpPknFg/EYpUi91c1aS3HSFEl04mcp8FB2UlLQxFq7rhObdBgMueVl
         1WC6Z5zFgY826Q9DLxB8TkwoqVGnOOBk0b2fmBhuTMxHcq40qsoPkQmKAEq1GPdrHtEU
         wIRe4Csm0gQ5XDqAPbaY9WKE+w9CJ9tlrW0mmRpT+YoGsfMkOZ4v6rdLKhU/NjQWguxB
         qSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=+wMjhZQxGod5U8h3xZg+V7VhpwjwaWtAtb58s+oCQWM=;
        b=Fsw0g/oZQPRzc+QK+ZQo02LUIWzuEEiUuso1ixdSpE+bkVY0rKCt5c9awtLi6xHQ2O
         DujyewGsE3XpMhiKUNyfL+kX/T4de6Xtr08pM4fv3DYLqs4xpEeVVtb5TdOG0nICCZ9v
         oEERIUV+E3U9pSnfqabfxHBqQ/fiGfFluxKrED1aBRzfGfZbt0c0Qp9PfbNjyxDw9ZiX
         3OB+h2I0oRUwxDWRWmJSO0fjGfiwZaQvGrNdrf5YkAtvwZ8PgI53Jg4ukR7UPcbu14pz
         6tLfzIAgS/9OnSLEGMYs8/J+PlQr0ALvL0OIj0rlj3ArE/+TTrF06DRsEAYKKM2h+23h
         qK/Q==
X-Gm-Message-State: APjAAAUDJunqeiNaTxy09L1Zg1OEv5uOqYjE4B69rDOOKSZy27fg6ZAT
        CBcuVeWEXtdnylWlOgmPZw==
X-Google-Smtp-Source: APXvYqwUYsc+TER34DQtVVP41EANTcMfUCF5dGdIsabrU0TsvvyEyPdeTvySWTEDwm7ltkevTEsmKA==
X-Received: by 2002:aca:d08:: with SMTP id 8mr14084124oin.51.1566247039773;
        Mon, 19 Aug 2019 13:37:19 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id 11sm5978335otc.45.2019.08.19.13.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:19 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id B11281805B2;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id A0263302506; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 12/12] watchdog: Set the preaction fields for drivers supporting pretimeout
Date:   Mon, 19 Aug 2019 15:37:11 -0500
Message-Id: <20190819203711.32599-13-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819203711.32599-1-minyard@acm.org>
References: <20190819203711.32599-1-minyard@acm.org>
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

None can be changed, so no need for the set operation.  The only
one not done was kempld_wdt.c; I couldn't figure out how the
pretimeout worked in that one.

Cc: Jerry Hoemann <jerry.hoemann@hpe.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/hpwdt.c      | 3 +++
 drivers/watchdog/imx2_wdt.c   | 1 +
 drivers/watchdog/imx_sc_wdt.c | 1 +
 drivers/watchdog/pm8916_wdt.c | 1 +
 drivers/watchdog/softdog.c    | 1 +
 drivers/watchdog/sprd_wdt.c   | 1 +
 6 files changed, 8 insertions(+)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 7d34bcf1c45b..4c8875dac5fa 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -228,6 +228,9 @@ static struct watchdog_device hpwdt_dev = {
 	.timeout	= DEFAULT_MARGIN,
 	.pretimeout	= PRETIMEOUT_SEC,
 	.max_hw_heartbeat_ms	= HPWDT_MAX_TIMER * 1000,
+#ifdef CONFIG_HPWDT_NMI_DECODING
+	.preaction	= WDIOP_NMI,
+#endif
 };
 
 
diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 32af3974e6bb..14f64523f12b 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -280,6 +280,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdog->min_timeout	= 1;
 	wdog->timeout		= IMX2_WDT_DEFAULT_TIME;
 	wdog->max_hw_heartbeat_ms = IMX2_WDT_MAX_TIME * 1000;
+	wdog->preaction		= WDIOP_INTERRUPT;
 	wdog->parent		= &pdev->dev;
 
 	ret = platform_get_irq(pdev, 0);
diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 78eaaf75a263..164bde58036a 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -169,6 +169,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	wdog->max_timeout = MAX_TIMEOUT;
 	wdog->parent = dev;
 	wdog->timeout = DEFAULT_TIMEOUT;
+	wdog->preaction = WDIOP_INTERRUPT;
 
 	watchdog_init_timeout(wdog, 0, dev);
 	watchdog_stop_on_reboot(wdog);
diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 2d3652004e39..b70cd45067d6 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -184,6 +184,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	wdt->wdev.max_timeout = PM8916_WDT_MAX_TIMEOUT;
 	wdt->wdev.timeout = PM8916_WDT_DEFAULT_TIMEOUT;
 	wdt->wdev.pretimeout = 0;
+	wdt->wdev.preaction = WDIOP_INTERRUPT;
 	watchdog_set_drvdata(&wdt->wdev, wdt);
 
 	watchdog_init_timeout(&wdt->wdev, 0, dev);
diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 3e4885c1545e..cb3f829d8bcb 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -125,6 +125,7 @@ static struct watchdog_device softdog_dev = {
 	.min_timeout = 1,
 	.max_timeout = 65535,
 	.timeout = TIMER_MARGIN,
+	.preaction = WDIOP_INTERRUPT,
 };
 
 static int __init softdog_init(void)
diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index edba4e278685..d70c738c7356 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -302,6 +302,7 @@ static int sprd_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.min_timeout = SPRD_WDT_MIN_TIMEOUT;
 	wdt->wdd.max_timeout = SPRD_WDT_MAX_TIMEOUT;
 	wdt->wdd.timeout = SPRD_WDT_MAX_TIMEOUT;
+	wdt->wdd.preaction = WDIOP_INTERRUPT;
 
 	ret = sprd_wdt_enable(wdt);
 	if (ret) {
-- 
2.17.1

