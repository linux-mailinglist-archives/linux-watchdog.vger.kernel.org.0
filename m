Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7B787923
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 14:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406435AbfHIMAF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 08:00:05 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57394 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406432AbfHIMAF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 08:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1565351989; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wEcsXxIxKdtIjdOHhlUW/A55s+quGeusvmW24oJinIc=;
        b=ZqqSxrQ6gBGU0tQoWHZWFDz+VLLpnwd3AvCY8xFqukk7lfd/yMEMFH9ZYbV0Gc4hq8L0fK
        tQTN2PGp73+WnSqkI9a2UnZ5ye2+u37twZviN/J2zDhGNHrzMe9FPR3+0OEEsF4xovca/N
        ul0I+sXPY0XSbhfdArZxFrL6MN23U/0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH 2/3] watchdog: jz4740: Use regmap provided by TCU driver
Date:   Fri,  9 Aug 2019 13:59:29 +0200
Message-Id: <20190809115930.6050-3-paul@crapouillou.net>
In-Reply-To: <20190809115930.6050-1-paul@crapouillou.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since we broke the ABI by changing the clock, the driver was also
updated to use the regmap provided by the TCU driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 drivers/watchdog/Kconfig      |  1 +
 drivers/watchdog/jz4740_wdt.c | 36 +++++++++++++++++++----------------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 820d8a472310..78411609048b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1647,6 +1647,7 @@ config JZ4740_WDT
 	depends on MACH_JZ4740 || MACH_JZ4780
 	depends on COMMON_CLK
 	select WATCHDOG_CORE
+	select MFD_SYSCON
 	help
 	  Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
 
diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 07fbd9d96e84..bdf9564efa29 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/mfd/ingenic-tcu.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -17,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 
 #define DEFAULT_HEARTBEAT 5
 #define MAX_HEARTBEAT     2048
@@ -36,7 +38,7 @@ MODULE_PARM_DESC(heartbeat,
 
 struct jz4740_wdt_drvdata {
 	struct watchdog_device wdt;
-	void __iomem *base;
+	struct regmap *map;
 	struct clk *clk;
 	unsigned long clk_rate;
 };
@@ -45,7 +47,8 @@ static int jz4740_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
+	regmap_write(drvdata->map, TCU_REG_WDT_TCNT, 0);
+
 	return 0;
 }
 
@@ -54,16 +57,16 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 	u16 timeout_value = (u16)(drvdata->clk_rate * new_timeout);
-	u8 tcer;
+	unsigned int tcer;
 
-	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
-	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
+	regmap_read(drvdata->map, TCU_REG_WDT_TCER, &tcer);
+	regmap_write(drvdata->map, TCU_REG_WDT_TCER, 0);
 
-	writew((u16)timeout_value, drvdata->base + TCU_REG_WDT_TDR);
-	writew(0x0, drvdata->base + TCU_REG_WDT_TCNT);
+	regmap_write(drvdata->map, TCU_REG_WDT_TDR, timeout_value);
+	regmap_write(drvdata->map, TCU_REG_WDT_TCNT, 0);
 
 	if (tcer & TCU_WDT_TCER_TCEN)
-		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
+		regmap_write(drvdata->map, TCU_REG_WDT_TCER, TCU_WDT_TCER_TCEN);
 
 	wdt_dev->timeout = new_timeout;
 	return 0;
@@ -72,20 +75,20 @@ static int jz4740_wdt_set_timeout(struct watchdog_device *wdt_dev,
 static int jz4740_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	unsigned int tcer;
 	int ret;
-	u8 tcer;
 
 	ret = clk_prepare_enable(drvdata->clk);
 	if (ret)
 		return ret;
 
-	tcer = readb(drvdata->base + TCU_REG_WDT_TCER);
+	regmap_read(drvdata->map, TCU_REG_WDT_TCER, &tcer);
 
 	jz4740_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
 
 	/* Start watchdog if it wasn't started already */
 	if (!(tcer & TCU_WDT_TCER_TCEN))
-		writeb(TCU_WDT_TCER_TCEN, drvdata->base + TCU_REG_WDT_TCER);
+		regmap_write(drvdata->map, TCU_REG_WDT_TCER, TCU_WDT_TCER_TCEN);
 
 	return 0;
 }
@@ -94,7 +97,7 @@ static int jz4740_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct jz4740_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writeb(0x0, drvdata->base + TCU_REG_WDT_TCER);
+	regmap_write(drvdata->map, TCU_REG_WDT_TCER, 0);
 	clk_disable_unprepare(drvdata->clk);
 
 	return 0;
@@ -136,7 +139,6 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct jz4740_wdt_drvdata *drvdata;
 	struct watchdog_device *jz4740_wdt;
-	struct resource	*res;
 	long rate;
 	int ret;
 
@@ -173,9 +175,11 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(jz4740_wdt, nowayout);
 	watchdog_set_drvdata(jz4740_wdt, drvdata);
 
-	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(drvdata->base))
-		return PTR_ERR(drvdata->base);
+	drvdata->map = device_node_to_regmap(dev->parent->of_node);
+	if (!drvdata->map) {
+		dev_err(dev, "regmap not found\n");
+		return -EINVAL;
+	}
 
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
-- 
2.21.0.593.g511ec345e18

