Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C221E25AE
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 May 2020 17:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgEZPlj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 May 2020 11:41:39 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58594 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgEZPli (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 May 2020 11:41:38 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 73C28803086D;
        Tue, 26 May 2020 15:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id obwMDeLfvhXk; Tue, 26 May 2020 18:41:32 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/7] watchdog: dw_wdt: Support devices with asynch clocks
Date:   Tue, 26 May 2020 18:41:21 +0300
Message-ID: <20200526154123.24402-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

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
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v2:
- Rearrange SoBs.
---
 drivers/watchdog/dw_wdt.c | 48 +++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 693c0d1fd796..efbc36872670 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -68,6 +68,7 @@ struct dw_wdt_timeout {
 struct dw_wdt {
 	void __iomem		*regs;
 	struct clk		*clk;
+	struct clk		*pclk;
 	unsigned long		rate;
 	struct dw_wdt_timeout	timeouts[DW_WDT_NUM_TOPS];
 	struct watchdog_device	wdd;
@@ -274,6 +275,7 @@ static int dw_wdt_suspend(struct device *dev)
 	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
+	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
 	return 0;
@@ -287,6 +289,12 @@ static int dw_wdt_resume(struct device *dev)
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
 
@@ -393,9 +401,18 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(dw_wdt->regs))
 		return PTR_ERR(dw_wdt->regs);
 
-	dw_wdt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(dw_wdt->clk))
-		return PTR_ERR(dw_wdt->clk);
+	/*
+	 * Try to request the watchdog dedicated timer clock source. It must
+	 * be supplied if asynchronous mode is enabled. Otherwise fallback
+	 * to the common timer/bus clocks configuration, in which the very
+	 * first found clock supply both timer and APB signals.
+	 */
+	dw_wdt->clk = devm_clk_get(dev, "tclk");
+	if (IS_ERR(dw_wdt->clk)) {
+		dw_wdt->clk = devm_clk_get(dev, NULL);
+		if (IS_ERR(dw_wdt->clk))
+			return PTR_ERR(dw_wdt->clk);
+	}
 
 	ret = clk_prepare_enable(dw_wdt->clk);
 	if (ret)
@@ -407,10 +424,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		goto out_disable_clk;
 	}
 
+	/*
+	 * Request APB clock if device is configured with async clocks mode.
+	 * In this case both tclk and pclk clocks are supposed to be specified.
+	 * Alas we can't know for sure whether async mode was really activated,
+	 * so the pclk phandle reference is left optional. If it couldn't be
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
@@ -449,10 +483,13 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
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
@@ -464,6 +501,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 
 	watchdog_unregister_device(&dw_wdt->wdd);
 	reset_control_assert(dw_wdt->rst);
+	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
 	return 0;
-- 
2.26.2

