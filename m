Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F2D25492
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 17:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfEUPxd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 11:53:33 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42816 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfEUPxd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 11:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558454011; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nEz/jx6tk/NW0NouC1NN13IDxP7BkPHZBE4FY1Wn2h4=;
        b=ou58S9meD58qIv1AaH2y73i38ZbwX3yCPPDx3EDX3eR+JiDRI7eCzaShe2y0FiO8nvGL6n
        0TxYErlheKs14x9AXNQ6fyDV2BcmtWMLsQze4P+Fr5w9BOfG5BHq1O6jpXssVjemvG10FI
        RIjRXH1uPAfYgbKtz49ATIK2VrFWP/k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/4] watchdog: jz4740: Avoid starting watchdog in set_timeout
Date:   Tue, 21 May 2019 17:53:11 +0200
Message-Id: <20190521155313.19326-2-paul@crapouillou.net>
In-Reply-To: <20190521155313.19326-1-paul@crapouillou.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
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
---
 drivers/watchdog/jz4740_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 51be321c775a..f970a7a53084 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -77,6 +77,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	unsigned int rtc_clk_rate;
 	unsigned int timeout_value;
 	unsigned short clock_div = JZ_WDT_CLOCK_DIV_1;
+	u8 tcer;
 
 	rtc_clk_rate = clk_get_rate(drvdata->rtc_clk);
 
@@ -92,6 +93,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 		clock_div += (1 << TCU_TCSR_PRESCALE_LSB);
 	}
 
+	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
 	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
 	writew(clock_div, drvdata->base + TCU_REG_WDT_TCSR);
 
@@ -99,7 +101,7 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
 	writew(clock_div | JZ_WDT_CLOCK_RTC, drvdata->base + TCU_REG_WDT_TCSR);
 
-	writeb(0x1, drvdata->base + TCU_REG_WDT_TCER);
+	writeb(tcer & TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
 
 	wdt_dev->timeout = new_timeout;
 	return 0;
@@ -107,8 +109,11 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 
 static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
 {
+	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+
 	jz4740_timer_enable_watchdog();
 	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
+	writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
 
 	return 0;
 }
-- 
2.21.0.593.g511ec345e18

