Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96757391E6
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 18:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbfFGQYo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 12:24:44 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59108 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730446AbfFGQYo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 12:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559924682; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AAiMcTfjYU9Aj6OGBlnTdWcEvcPAc2gHKP4pvPxDK+s=;
        b=ob3K9OQYk+Zt4HXnG/8XYGq/oYtrR7Axha5e7nIwUBUwkc2xE2OvrlOJprTmBfLW1KlS5R
        nGn+SXnEnSamx8qyKI8jCETto+mQEWWRs8VV5FPbzdnT6LSEcN4KeNjrNFgOhRBkke5bXV
        hjZlq6zBKmj1mUkJvFVKxgPHxDEV/Nc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/4] watchdog: jz4740: Use register names from <linux/mfd/ingenic-tcu.h>
Date:   Fri,  7 Jun 2019 18:24:26 +0200
Message-Id: <20190607162429.17915-2-paul@crapouillou.net>
In-Reply-To: <20190607162429.17915-1-paul@crapouillou.net>
References: <20190607162429.17915-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the macros from <linux/mfd/ingenic-tcu.h> instead of declaring our
own.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Notes:
    v2: Rebased on v5.2-rc3

 drivers/watchdog/jz4740_wdt.c | 39 ++++++++++++++---------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 313358b2e0b1..a2592c4fff02 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -4,6 +4,7 @@
  *  JZ4740 Watchdog driver
  */
 
+#include <linux/mfd/ingenic-tcu.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -19,23 +20,16 @@
 
 #include <asm/mach-jz4740/timer.h>
 
-#define JZ_REG_WDT_TIMER_DATA     0x0
-#define JZ_REG_WDT_COUNTER_ENABLE 0x4
-#define JZ_REG_WDT_TIMER_COUNTER  0x8
-#define JZ_REG_WDT_TIMER_CONTROL  0xC
-
 #define JZ_WDT_CLOCK_PCLK 0x1
 #define JZ_WDT_CLOCK_RTC  0x2
 #define JZ_WDT_CLOCK_EXT  0x4
 
-#define JZ_WDT_CLOCK_DIV_SHIFT   3
-
-#define JZ_WDT_CLOCK_DIV_1    (0 << JZ_WDT_CLOCK_DIV_SHIFT)
-#define JZ_WDT_CLOCK_DIV_4    (1 << JZ_WDT_CLOCK_DIV_SHIFT)
-#define JZ_WDT_CLOCK_DIV_16   (2 << JZ_WDT_CLOCK_DIV_SHIFT)
-#define JZ_WDT_CLOCK_DIV_64   (3 << JZ_WDT_CLOCK_DIV_SHIFT)
-#define JZ_WDT_CLOCK_DIV_256  (4 << JZ_WDT_CLOCK_DIV_SHIFT)
-#define JZ_WDT_CLOCK_DIV_1024 (5 << JZ_WDT_CLOCK_DIV_SHIFT)
+#define JZ_WDT_CLOCK_DIV_1    (0 << TCU_TCSR_PRESCALE_LSB)
+#define JZ_WDT_CLOCK_DIV_4    (1 << TCU_TCSR_PRESCALE_LSB)
+#define JZ_WDT_CLOCK_DIV_16   (2 << TCU_TCSR_PRESCALE_LSB)
+#define JZ_WDT_CLOCK_DIV_64   (3 << TCU_TCSR_PRESCALE_LSB)
+#define JZ_WDT_CLOCK_DIV_256  (4 << TCU_TCSR_PRESCALE_LSB)
+#define JZ_WDT_CLOCK_DIV_1024 (5 << TCU_TCSR_PRESCALE_LSB)
 
 #define DEFAULT_HEARTBEAT 5
 #define MAX_HEARTBEAT     2048
@@ -63,7 +57,7 @@ static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writew(0x0, drvdata->base + JZ_REG_WDT_TIMER_COUNTER);
+	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
 	return 0;
 }
 
@@ -86,18 +80,17 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 			break;
 		}
 		timeout_value >>= 2;
-		clock_div += (1 << JZ_WDT_CLOCK_DIV_SHIFT);
+		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
 	}
 
-	writeb(0x0, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
-	writew(clock_div, drvdata->base + JZ_REG_WDT_TIMER_CONTROL);
+	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
+	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
 
-	writew((u16)timeout_value, drvdata->base + JZ_REG_WDT_TIMER_DATA);
-	writew(0x0, drvdata->base + JZ_REG_WDT_TIMER_COUNTER);
-	writew(clock_div | JZ_WDT_CLOCK_RTC,
-		drvdata->base + JZ_REG_WDT_TIMER_CONTROL);
+	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
+	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
+	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
 
-	writeb(0x1, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
+	writeb(0x1, drvdata->base + TCU_REG_WDT_TCER);
 
 	wdt_dev->timeout = new_timeout;
 	return 0;
@@ -115,7 +108,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writeb(0x0, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
+	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
 	jz4740_timer_disable_watchdog();
 
 	return 0;
-- 
2.21.0.593.g511ec345e18

