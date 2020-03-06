Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6454717BF1C
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 14:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCFNiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 08:38:05 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37310 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgCFNiF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 08:38:05 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 89B658030706;
        Fri,  6 Mar 2020 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jje8UqOvDMf3; Fri,  6 Mar 2020 16:28:30 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
Date:   Fri, 6 Mar 2020 16:27:45 +0300
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132831.89B658030706@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

DW Watchdog IP core can be synthesised with asynchronous timer/APB
clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
separate clock signals are supposed to be used to feed watchdog timer
and APB interface of the device. Currently the driver supports
the synchronous mode only. Since there is no way to determine which
mode was actually activated for device from its registers, we have to
rely on the platform device configuration data. If optional "pclk"
clock source is supplied, we consider the device working in asynchronous
mode, otherwise the driver falls back to the synchronous configuration.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/watchdog/dw_wdt.c | 48 +++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 4a57b7d777dc..eb909c63a1b5 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -61,6 +61,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 struct dw_wdt {
 	void __iomem		*regs;
 	struct clk		*clk;
+	struct clk		*pclk;
 	unsigned long		rate;
 	unsigned int		max_top;
 	unsigned int		timeouts[DW_WDT_NUM_TOPS];
@@ -270,6 +271,7 @@ static int dw_wdt_suspend(struct device *dev)
 	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
+	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
 	return 0;
@@ -283,6 +285,12 @@ static int dw_wdt_resume(struct device *dev)
 	if (err)
 		return err;
 
+	err = clk_prepare_enable(dw_wdt->pclk);
+	if (err) {
+		clk_disable_unprepare(dw_wdt->clk);
+		return err;
+	}
+
 	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 
@@ -344,9 +352,18 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(dw_wdt->regs))
 		return PTR_ERR(dw_wdt->regs);
 
-	dw_wdt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(dw_wdt->clk))
-		return PTR_ERR(dw_wdt->clk);
+	/*
+	 * Try to request the watchdog dedicated timer clock source. It must
+	 * be supplied if asynchronous mode is enabled. Otherwise fallback
+	 * to the common timer/bus clocks configuration, in which the very first
+	 * found clocks supply both timer and APB signals.
+	 */
+	dw_wdt->clk = devm_clk_get(dev, "tclk");
+	if (IS_ERR(dw_wdt->clk)) {
+		dw_wdt->clk = devm_clk_get(dev, NULL);
+		if (IS_ERR(dw_wdt->clk))
+			return PTR_ERR(dw_wdt->clk);
+	}
 
 	ret = clk_prepare_enable(dw_wdt->clk);
 	if (ret)
@@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		goto out_disable_clk;
 	}
 
+	/*
+	 * Request APB clocks if device is configured with async clocks mode.
+	 * In this case both tclk and pclk clocks are supposed to be specified.
+	 * Alas we can't know for sure whether async mode was really activated,
+	 * so the pclk reference is left optional. If it it's failed to be
+	 * found we consider the device configured in synchronous clocks mode.
+	 */
+	dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
+	if (IS_ERR(dw_wdt->pclk)) {
+		ret = PTR_ERR(dw_wdt->pclk);
+		goto out_disable_clk;
+	}
+
+	ret = clk_prepare_enable(dw_wdt->pclk);
+	if (ret)
+		goto out_disable_clk;
+
 	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (IS_ERR(dw_wdt->rst)) {
 		ret = PTR_ERR(dw_wdt->rst);
-		goto out_disable_clk;
+		goto out_disable_pclk;
 	}
 
 	reset_control_deassert(dw_wdt->rst);
@@ -399,10 +433,13 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 	ret = watchdog_register_device(wdd);
 	if (ret)
-		goto out_disable_clk;
+		goto out_disable_pclk;
 
 	return 0;
 
+out_disable_pclk:
+	clk_disable_unprepare(dw_wdt->pclk);
+
 out_disable_clk:
 	clk_disable_unprepare(dw_wdt->clk);
 	return ret;
@@ -414,6 +451,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 
 	watchdog_unregister_device(&dw_wdt->wdd);
 	reset_control_assert(dw_wdt->rst);
+	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
 	return 0;
-- 
2.25.1

