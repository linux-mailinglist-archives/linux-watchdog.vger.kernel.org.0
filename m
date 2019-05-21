Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCBE2549A
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 17:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfEUPxn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 11:53:43 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42800 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUPxd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 11:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558454010; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=r1Dp4uuhmo7lgnj7+O9kBAJP9eIUmY611ADs6zhWI5w=;
        b=CKuOJ1qTrDaIipRX830HNqH96QeAJ6lzn9Gi88QEmd2JAG81quHT8tzSJL60hlEjR2T/vf
        Aob/tbuDy/Si5c7cWzZgxaIRd7e1u91BTaD0CJtcJvbbqm+iC5/SS5Sle85V/klWB9NEud
        mOy03C+fg2jgZgUEnOlYb2v4zWBHSWE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/4] watchdog: jz4740: Use register names from <linux/mfd/ingenic-tcu.h>
Date:   Tue, 21 May 2019 17:53:10 +0200
Message-Id: <20190521155313.19326-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the macros from <linux/mfd/ingenic-tcu.h> instead of declaring our
own.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/watchdog/jz4740_wdt.c | 39 ++++++++++++++---------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index d1bc7cbd4f2b..51be321c775a 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/mfd/ingenic-tcu.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -28,23 +29,16 @@
 
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
@@ -72,7 +66,7 @@ static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writew(0x0, drvdata->base + JZ_REG_WDT_TIMER_COUNTER);
+	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
 	return 0;
 }
 
@@ -95,18 +89,17 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
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
@@ -124,7 +117,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writeb(0x0, drvdata->base + JZ_REG_WDT_COUNTER_ENABLE);
+	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
 	jz4740_timer_disable_watchdog();
 
 	return 0;
-- 
2.21.0.593.g511ec345e18

