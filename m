Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020E0276F0F
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Sep 2020 12:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIXKxF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Sep 2020 06:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgIXKxF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Sep 2020 06:53:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16622C0613D4
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Sep 2020 03:53:05 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOs0-00062R-SC; Thu, 24 Sep 2020 12:53:00 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOrz-0005Ce-07; Thu, 24 Sep 2020 12:52:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] rtc: pcf2127: move watchdog initialisation to a separate function
Date:   Thu, 24 Sep 2020 12:52:55 +0200
Message-Id: <20200924105256.18162-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The obvious advantages are:

 - The linker can drop the watchdog functions if CONFIG_WATCHDOG is off.
 - All watchdog stuff grouped together with only a single function call
   left in generic code.
 - Watchdog register is only read when it is actually used.
 - Less #ifdefery

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-pcf2127.c | 56 ++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ed6316992cbb..5b1f1949b5e5 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -335,6 +335,36 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
 	.set_timeout = pcf2127_wdt_set_timeout,
 };
 
+static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
+{
+	u32 wdd_timeout;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_WATCHDOG))
+		return 0;
+
+	pcf2127->wdd.parent = dev;
+	pcf2127->wdd.info = &pcf2127_wdt_info;
+	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
+	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
+	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
+	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
+	pcf2127->wdd.min_hw_heartbeat_ms = 500;
+	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
+
+	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
+
+	/* Test if watchdog timer is started by bootloader */
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
+	if (ret)
+		return ret;
+
+	if (wdd_timeout)
+		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
+
+	return devm_watchdog_register_device(dev, &pcf2127->wdd);
+}
+
 /* Alarm */
 static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
@@ -536,7 +566,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			 int alarm_irq, const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
-	u32 wdd_timeout;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -575,17 +604,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
 	}
 
-	pcf2127->wdd.parent = dev;
-	pcf2127->wdd.info = &pcf2127_wdt_info;
-	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
-	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
-	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
-	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
-	pcf2127->wdd.min_hw_heartbeat_ms = 500;
-	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
-
-	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
-
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -615,19 +633,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
-	/* Test if watchdog timer is started by bootloader */
-	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
-	if (ret)
-		return ret;
-
-	if (wdd_timeout)
-		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
-
-#ifdef CONFIG_WATCHDOG
-	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
-	if (ret)
-		return ret;
-#endif /* CONFIG_WATCHDOG */
+	pcf2127_watchdog_init(dev, pcf2127);
 
 	/*
 	 * Disable battery low/switch-over timestamp and interrupts.
-- 
2.28.0

