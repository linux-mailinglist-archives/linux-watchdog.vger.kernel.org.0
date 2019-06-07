Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB2E3391E7
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 18:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730598AbfFGQY6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 12:24:58 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59166 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730634AbfFGQYp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 12:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559924683; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=reftoaIV6JypAZSty0APUo6zLR/HlKCFOvQxUsfhCCA=;
        b=GY+aUKOD3ICy/vKpZNT3vm41AnEZt9N3yoxJ5DEqH8yLDOFHqfpUktjP0fRRlhIluDxSGg
        dlOcMgYR0T6Cz2U0enfvnfrFmdkIDp9KdaOpXLCoCi1GK2Q2UTZSqF4dnjF4ohGZaPR8Lo
        mWipA/FChZ7o98kwlR6WGfjqu/+mbao=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/4] watchdog: jz4740: Avoid starting watchdog in set_timeout
Date:   Fri,  7 Jun 2019 18:24:27 +0200
Message-Id: <20190607162429.17915-3-paul@crapouillou.net>
In-Reply-To: <20190607162429.17915-1-paul@crapouillou.net>
References: <20190607162429.17915-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Previously the jz4740_wdt_set_timeout() function was starting the timer
unconditionally, even if it was stopped when that function was entered.

Now, the timer will be restarted only if it was already running before
this function is called.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Notes:
    v2: - Don't disable TCU timer if it was already disabled
    	- Don't enable TCU timer if it was already enabled

 drivers/watchdog/jz4740_wdt.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index a2592c4fff02..7519d80c5d05 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -68,6 +68,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	unsigned int rtc_clk_rate;
 	unsigned int timeout_value;
 	unsigned short clock_div = JZ_WDT_CLOCK_DIV_1;
+	u8 tcer;
 
 	rtc_clk_rate = clk_get_rate(drvdata->rtc_clk);
 
@@ -83,6 +84,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
 	}
 
+	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
 	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
 	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
 
@@ -90,7 +92,8 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
 	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
 
-	writeb(0x1, drvdata->base + TCU_REG_WDT_TCER);
+	if (tcer & TCU_WDT_TCER_TCEN)
+		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
 
 	wdt_dev->timeout = new_timeout;
 	return 0;
@@ -98,9 +101,18 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 
 static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
 {
+	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	u8 tcer;
+
+	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
+
 	jz4740_timer_enable_watchdog();
 	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
 
+	/* Start watchdog if it wasn't started already */
+	if (!(tcer & TCU_WDT_TCER_TCEN))
+		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
+
 	return 0;
 }
 
-- 
2.21.0.593.g511ec345e18

